using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Linq;
using System.Threading.Tasks;
using FoamBlackSmithTienda.Models;

namespace FoamBlackSmithTienda.Controllers
{
    // Controlador Carrito actualizado
    public class CarritoController : Controller
    {
        private readonly MvcBlackFoamContexto _context;

        public CarritoController(MvcBlackFoamContexto context)
        {
            _context = context;
        }

        // Acción para listar productos en el carrito
        public async Task<IActionResult> Index()
        {
            var carrito = await ObtenerCarritoAsync();

            if (carrito == null || !carrito.Detalles.Any())
            {
                return RedirectToAction("CarritoVacio");
            }

            return View(carrito);
        }

        // Acción para agregar productos al carrito
        public async Task<IActionResult> Agregar(int id, int cantidad = 1)
        {
            var producto = await _context.Productos.FindAsync(id);
            if (producto == null || cantidad < 1)
            {
                return NotFound();
            }

            var carrito = await ObtenerCarritoAsync() ?? await CrearCarritoAsync();

            // Verificar si el producto ya está en el carrito
            var detalle = carrito.Detalles.FirstOrDefault(d => d.ProductoId == id);
            if (detalle == null)
            {
                carrito.Detalles.Add(new Detalle
                {
                    ProductoId = id,
                    Cantidad = cantidad,
                    Precio = producto.Precio
                });
            }
            else
            {
                detalle.Cantidad += cantidad;
            }

            await _context.SaveChangesAsync();
            return RedirectToAction("Index");
        }

        // Acción para confirmar el pedido
        public async Task<IActionResult> ConfirmarPedido()
        {
            var carrito = await ObtenerCarritoAsync();

            if (carrito == null || !carrito.Detalles.Any())
            {
                return RedirectToAction("CarritoVacio");
            }

            carrito.Confirmado = DateTime.Now;
            await _context.SaveChangesAsync();

            return View("PedidoConfirmado", carrito);
        }

        // Acción para mostrar vista de carrito vacío
        public IActionResult CarritoVacio()
        {
            return View();
        }

        // Métodos auxiliares
        private async Task<Pedido> ObtenerCarritoAsync()
        {
            var clienteId = ObtenerClienteId(); // Método para identificar al cliente actual
            return await _context.Pedidos
                .Include(p => p.Detalles)
                .ThenInclude(d => d.Producto)
                .FirstOrDefaultAsync(p => p.ClienteId == clienteId && p.Confirmado == null);
        }

        private async Task<Pedido> CrearCarritoAsync()
        {
            var clienteId = ObtenerClienteId();
            var carrito = new Pedido
            {
                ClienteId = clienteId,
                Fecha = DateTime.Now,
                Detalles = new List<Detalle>()
            };
            _context.Pedidos.Add(carrito);
            await _context.SaveChangesAsync();
            return carrito;
        }

        private int ObtenerClienteId()
        {
            // Simular cliente en sesión; cambiar por lógica real
            return 1;
        }
    }

}
