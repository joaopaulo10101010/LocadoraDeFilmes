using Locadora.Repositorios;
using Microsoft.AspNetCore.Mvc;
using Locadora.Models;

namespace Locadora.Controllers
{
    public class ClienteController : Controller
    {


        private readonly ClienteRepositorio _clienteRepositorio;

        public ClienteController(ClienteRepositorio clienteRepositorio)
        {
            _clienteRepositorio = clienteRepositorio;
        }

        public IActionResult Index()
        {
            return View();
        }

        public IActionResult BancoCliente()
        {
            return View();
        }
        [HttpPost]
        public IActionResult BancoCliente(Clientes clientes)
        {
            if (ModelState.IsValid)
            {
                // Se os dados forem válidos, ele usa _usuarioRepositorio.
                // AdicionarUsuario(usuario) para adicionar o novo usuário ao banco de dados e redireciona para a página de login.
                _clienteRepositorio.AdicionarCliente(clientes);

                // visualização de cadastro, exibindo os erros de validação

                return RedirectToAction("Privacy");
            }
            return View(clientes);
        }
    }
}
