using System.Diagnostics;
using FoamBlackSmithTienda.Models;
using Microsoft.AspNetCore.Mvc;

namespace FoamBlackSmithTienda.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;
        private readonly MvcBlackFoamContexto _context;

        public HomeController(ILogger<HomeController> logger, MvcBlackFoamContexto context)
        {
            _logger = logger;
            _context = context;
        }

        public IActionResult Index()
        {  
            // Busca el empleado correspondiente al usuario actual. Si existe, activa la 
            // vista (View) y en caso contrario, se redirige para crear el empleado. 
            string? emailUsuario = User.Identity.Name;
            Cliente? cliente = _context.Clientes.Where(e => e.Email == emailUsuario)
                                  .FirstOrDefault();

            if (User.Identity.IsAuthenticated &&
                User.IsInRole("Usuario") &&
                cliente == null)
            {
                return RedirectToAction("Create", "MisDatos");
            }

            return View();
        }

        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
