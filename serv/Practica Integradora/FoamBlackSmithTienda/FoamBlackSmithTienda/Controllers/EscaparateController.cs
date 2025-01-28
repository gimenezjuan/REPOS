using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Linq;
using System.Threading.Tasks;
using FoamBlackSmithTienda.Models;

namespace FoamBlackSmithTienda.Controllers
{
    public class EscaparateController : Controller
    {
        private readonly MvcBlackFoamContexto _context;

        public EscaparateController(MvcBlackFoamContexto context)
        {
            _context = context;
        }

        public async Task<IActionResult> Index(int? id)
        {
            // Obtener categorías ordenadas
            var categorias = await _context.Categorias.OrderBy(c => c.Nombre).ToListAsync();
            ViewData["Categorias"] = categorias;

            // Obtener productos
            IQueryable<Producto> productosQuery = _context.Productos
                .Where(p => id == null ? p.Escaparte : p.CategoriaId == id);

            var productos = await productosQuery.Include(p => p.Categoria).ToListAsync();

            return View(productos);
        }

        // Acción GET: Ver detalles del producto a añadir al carrito
        [HttpGet]
        public async Task<IActionResult> AgregarCarrito(int id)
        {
            var producto = await _context.Productos.FindAsync(id);

            if (producto == null)
            {
                return NotFound();
            }

            return View(producto); // Mostrar datos del producto y pedir confirmación
        }

        // Acción POST: Confirmar añadir producto al carrito
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> AgregarCarritoConfirmado(int id)
        {
            // Obtener el producto
            var producto = await _context.Productos.FindAsync(id);
            if (producto == null)
            {
                return NotFound();
            }

            // Obtener o crear el pedido (NumPedido desde la sesión)
            int? numPedido = HttpContext.Session.GetInt32("NumPedido");
            Pedido pedido;

            if (numPedido == null)
            {
                // Crear nuevo pedido
                pedido = new Pedido
                {
                    Fecha = DateTime.Now,
                    ClienteId = GetClienteActual(), // Implementar un método para obtener el cliente
                    EstadoId = 1 // "Pendiente"
                };

                _context.Pedidos.Add(pedido);
                await _context.SaveChangesAsync();

                // Guardar el ID del nuevo pedido en la sesión
                HttpContext.Session.SetInt32("NumPedido", pedido.Id);
            }
            else
            {
                // Recuperar el pedido existente
                pedido = await _context.Pedidos
                    .Include(p => p.Detalles)
                    .FirstOrDefaultAsync(p => p.Id == numPedido);

                if (pedido == null)
                {
                    return NotFound();
                }
            }

            // Añadir producto al detalle del pedido
            var detalle = pedido.Detalles?.FirstOrDefault(d => d.ProductoId == producto.Id);
            if (detalle != null)
            {
                detalle.Cantidad++;
            }
            else
            {
                detalle = new Detalle
                {
                    PedidoId = pedido.Id,
                    ProductoId = producto.Id,
                    Cantidad = 1,
                    Precio = producto.Precio
                };

                _context.Detalles.Add(detalle);
            }

            await _context.SaveChangesAsync();

            // Redirigir al escaparate o al carrito
            return RedirectToAction("Index", "Carrito");
        }

        private int GetClienteActual()
        {
            // Implementar lógica para recuperar el cliente actual desde el usuario logueado
            // Por ahora, devolver un valor fijo
            return 1; // Reemplazar con lógica real
        }
    }
}
