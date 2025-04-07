using Microsoft.AspNetCore.Mvc;

namespace Locadora.Controllers
{
    public class LoginController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
