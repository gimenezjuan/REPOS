using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Linq;
using System.Threading.Tasks;
using FoamBlackSmithTienda.Models;
using Microsoft.AspNetCore.Http;
using System;

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
            var categorias = await _context.Categorias.OrderBy(c => c.Nombre).ToListAsync();
            ViewData["Categorias"] = categorias;

            IQueryable<Producto> productosQuery = _context.Productos
                .Where(p => id == null ? p.Escaparte : p.CategoriaId == id);

            var productos = await productosQuery.Include(p => p.Categoria).ToListAsync();
            return View(productos);
        }

        // Acción GET: Muestra los detalles del producto antes de añadirlo al carrito
        public async Task<IActionResult> DetalleDelProducto(int id)
        {
            var producto = await _context.Productos.FindAsync(id);
            if (producto == null)
            {
                return NotFound();
            }
            return View(producto);
        }

        // Acción POST: Agregar producto al carrito y crear pedido si es necesario
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> AgregarCarritoConfirmado(int id)
        {
            var producto = await _context.Productos.FindAsync(id);
            if (producto == null)
            {
                return NotFound();
            }

            // Obtener o crear el pedido actual
            int? numPedido = HttpContext.Session.GetInt32("NumPedido");
            Pedido pedido;

            if (numPedido == null)
            {
                pedido = new Pedido
                {
                    Fecha = DateTime.Now,
                    ClienteId = GetClienteActual(),
                    EstadoId = 1 // Estado "Pendiente"
                };

                _context.Pedidos.Add(pedido);
                await _context.SaveChangesAsync();

                HttpContext.Session.SetInt32("NumPedido", pedido.Id);
            }
            else
            {
                pedido = await _context.Pedidos.FindAsync(numPedido);
            }

            // Agregar producto al pedido
            var detalle = new Detalle
            {
                PedidoId = pedido.Id,
                ProductoId = producto.Id,
                Cantidad = 1,
                Precio = producto.Precio
            };

            _context.Detalles.Add(detalle);
            await _context.SaveChangesAsync();

            return RedirectToAction("Index", "Carrito");
        }

        private int GetClienteActual()
        {
            // Implementar lógica para obtener el cliente actual desde el usuario autenticado
            return 1; // Reemplazar con lógica real
        }
    }
}
