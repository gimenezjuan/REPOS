using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Linq;
using System.Threading.Tasks;
using FoamBlackSmithTienda.Models;

namespace FoamBlackSmithTienda.Controllers
{
    public class CarritoController : Controller
    {
        private readonly MvcBlackFoamContexto _context;

        public CarritoController(MvcBlackFoamContexto context)
        {
            _context = context;
        }

        public async Task<IActionResult> Index()
        {
            var clienteId = ObtenerClienteId();
            var carrito = await _context.Pedidos
                .Include(p => p.Detalles)
                .ThenInclude(d => d.Producto)
                .FirstOrDefaultAsync(p => p.ClienteId == clienteId && p.Confirmado == null);
            
            if (carrito == null)
            {
                return RedirectToAction("CarritoVacio");
            }

            return View(carrito);
        }

        // Acción POST: Agregar producto al carrito y crear pedido si es necesario
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> AgregarCarrito(int id)
        {
            // Obtener el producto
            var producto = await _context.Productos.FindAsync(id);

            if (producto == null)
            {
                return NotFound();
            }

            // Crear nuevo pedido (siempre se crea uno nuevo para cada adición)
            var pedido = new Pedido
            {
                Fecha = DateTime.Now,
                ClienteId = GetClienteActual(), // Implementar un método para obtener el cliente actual
                EstadoId = 1 // Estado "Pendiente"
            };

            _context.Pedidos.Add(pedido);
            await _context.SaveChangesAsync();

            // Añadir producto al detalle del pedido
            var detalle = new Detalle
            {
                PedidoId = pedido.Id,
                ProductoId = producto.Id,
                Cantidad = 1,
                Precio = producto.Precio
            };

            _context.Detalles.Add(detalle);
            await _context.SaveChangesAsync();

            // Redirigir al carrito
            return RedirectToAction("Index", "Carrito");
        }
        private int GetClienteActual()
        {
            // Implementar lógica para recuperar el cliente actual desde el usuario logueado
            // Por ahora, devolver un valor fijo
            return 1; // Reemplazar con lógica real
        }

        public async Task<IActionResult> ConfirmarPedido()
        {
            var clienteId = ObtenerClienteId();
            var carrito = await _context.Pedidos
                .Include(p => p.Detalles)
                .ThenInclude(d => d.Producto)
                .FirstOrDefaultAsync(p => p.ClienteId == clienteId && p.Confirmado == null);
            
            if (carrito == null)
            {
                return RedirectToAction("CarritoVacio");
            }

            carrito.Confirmado = DateTime.Now;
            await _context.SaveChangesAsync();

            return View("PedidoConfirmado", carrito);
        }

        public IActionResult CarritoVacio()
        {
            return View();
        }

        private int ObtenerClienteId()
        {
            return 1;
        }
    }
}
