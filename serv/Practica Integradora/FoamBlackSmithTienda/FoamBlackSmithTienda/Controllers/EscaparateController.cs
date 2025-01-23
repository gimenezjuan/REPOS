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
    }
}
