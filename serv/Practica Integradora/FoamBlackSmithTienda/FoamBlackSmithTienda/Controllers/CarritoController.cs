using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Linq;
using System.Threading.Tasks;
using FoamBlackSmithTienda.Models;
using Microsoft.AspNetCore.Http;
using System;

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
            // Obtener el cliente actual según el usuario autenticado
            string? emailUsuario = User.Identity.Name;

            var cliente = await _context.Clientes.Where(e => e.Email == emailUsuario)
                    .FirstOrDefaultAsync();

            if (cliente == null)
            {
                return RedirectToAction("Index", "Home");
            }

            // Obtener el pedido actual en estado "Pendiente"
            var pedido = await _context.Pedidos
                .Include(p => p.Detalles)
                .ThenInclude(d => d.Producto)
                .FirstOrDefaultAsync(p => p.ClienteId == cliente.Id && p.EstadoId == 1); // Estado "Pendiente"

            if (pedido == null)
            {
                return RedirectToAction("CarritoVacio");
            }

            ViewData["Cliente"] = cliente;
            return View(pedido);
        }

        public async Task<IActionResult> AgregarCarrito(int id)
        {
            var producto = await _context.Productos.FindAsync(id);
            if (producto == null) return NotFound();

            int? numPedido = HttpContext.Session.GetInt32("NumPedido");
            Pedido pedido;

            if (numPedido == null)
            {
                pedido = new Pedido
                {
                    ClienteId = ObtenerClienteId(),
                    EstadoId = 1, // Estado "Pendiente"
                    Fecha = DateTime.Now
                };

                _context.Pedidos.Add(pedido);
                await _context.SaveChangesAsync();

                HttpContext.Session.SetInt32("NumPedido", pedido.Id);
            }
            else
            {
                pedido = await _context.Pedidos
                    .Include(p => p.Detalles)
                    .FirstOrDefaultAsync(p => p.Id == numPedido);

                if (pedido == null) // Evita referencias nulas
                {
                    HttpContext.Session.Remove("NumPedido");
                    return RedirectToAction("CarritoVacio");
                }
            }

            var detalle = pedido.Detalles.FirstOrDefault(d => d.ProductoId == id);
            if (detalle == null)
            {
                detalle = new Detalle
                {
                    PedidoId = pedido.Id,
                    ProductoId = id,
                    Cantidad = 1,
                    Precio = producto.Precio
                };
                _context.Detalles.Add(detalle);
            }
            else
            {
                detalle.Cantidad++;
            }

            await _context.SaveChangesAsync();
            return RedirectToAction("Index");
        }
        private int ObtenerClienteId()
        {
            return 1; // Ajustar esta lógica para recuperar el cliente real
        }

        public async Task<IActionResult> ConfirmarPedido()
        {
            int? numPedido = HttpContext.Session.GetInt32("NumPedido");
            if (numPedido == null)
            {
                return RedirectToAction("CarritoVacio");
            }

            var carrito = await _context.Pedidos
                .Include(p => p.Detalles)
                    .ThenInclude(d => d.Producto)
                .FirstOrDefaultAsync(p => p.Id == numPedido);

            if (carrito == null)
            {
                return RedirectToAction("CarritoVacio");
            }

            carrito.EstadoId = 2; // Estado "Confirmado"
            carrito.Confirmado = DateTime.Now;
            await _context.SaveChangesAsync();

            HttpContext.Session.Remove("NumPedido");

            return View("PedidoConfirmado", carrito);
        }

        public async Task<IActionResult> EliminarLinea(int id)
        {
            var detalle = await _context.Detalles.FindAsync(id);
            if (detalle != null)
            {
                _context.Detalles.Remove(detalle);
                await _context.SaveChangesAsync();
            }
            return RedirectToAction("Index");
        }

        public async Task<IActionResult> MasCantidad(int id)
        {
            var detalle = await _context.Detalles.FindAsync(id);
            if (detalle != null)
            {
                detalle.Cantidad++;
                await _context.SaveChangesAsync();
            }
            return RedirectToAction("Index");
        }

        public async Task<IActionResult> MenosCantidad(int id)
        {
            var detalle = await _context.Detalles.FindAsync(id);
            if (detalle != null && detalle.Cantidad > 1)
            {
                detalle.Cantidad--;
                await _context.SaveChangesAsync();
            }
            return RedirectToAction("Index");
        }

        public IActionResult CarritoVacio()
        {
            return View();
        }
    }
}
