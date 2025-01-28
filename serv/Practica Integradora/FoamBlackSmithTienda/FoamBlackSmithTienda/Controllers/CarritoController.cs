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

        public async Task<IActionResult> Index(int? id)
        {
            if (id.HasValue)
            {
                // Si se proporciona un ID de producto, agregarlo al carrito
                var producto = await _context.Productos
                    .FirstOrDefaultAsync(p => p.Id == id);

                if (producto == null)
                {
                    return NotFound();
                }

                int? numPedido = HttpContext.Session.GetInt32("NumPedido");
                Pedido pedido;

                if (numPedido == null)
                {
                    // Crear un nuevo pedido
                    pedido = new Pedido
                    {
                        ClienteId = ObtenerClienteId(), // Método para obtener el ID del cliente actual
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
                }

                // Agregar el producto al pedido
                var detalle = pedido.Detalles.FirstOrDefault(d => d.ProductoId == id);
                if (detalle == null)
                {
                    detalle = new Detalle
                    {
                        ProductoId = id.Value,
                        Cantidad = 1,
                        Precio = producto.Precio
                    };
                    pedido.Detalles.Add(detalle);
                }
                else
                {
                    detalle.Cantidad++;
                }

                await _context.SaveChangesAsync();
            }

            // Mostrar el carrito actual
            int? numPedidoActual = HttpContext.Session.GetInt32("NumPedido");

            if (numPedidoActual == null)
            {
                return RedirectToAction("CarritoVacio");
            }

            var carrito = await _context.Pedidos
                .Include(p => p.Detalles)
                .ThenInclude(d => d.Producto)
                .FirstOrDefaultAsync(p => p.Id == numPedidoActual);

            if (carrito == null)
            {
                return RedirectToAction("CarritoVacio");
            }

            return View(carrito);
        }

        private int ObtenerClienteId()
        {
            // Lógica para obtener el ID del cliente actual (puede ser desde la sesión o la base de datos)
            return 1; // Cambia esto según tu implementación
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