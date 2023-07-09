using Microsoft.AspNetCore.Mvc;
using TallerMecanico.Datos;
using TallerMecanico.Models;

namespace TallerMecanico.Controllers
{
    public class AutomovilController : Controller
    {
        AutomovilDatos _AutomovilDatos = new AutomovilDatos();

        public IActionResult Listar()
        {
            //La vista muestra una lista de automóviles
            var oLista = _AutomovilDatos.Listar();
            return View(oLista);
        }

        public IActionResult Agregar()
        {
            //Devuelve la vista
            return View();
        }

        [HttpPost]
        public string Agregar(AutomovilModel Automovil)
        {
            //Recibe un automotor para guardarlo en la base
            var respuesta = _AutomovilDatos.Agregar(Automovil);
            return respuesta;
        }

        public IActionResult Editar(int IdAutomovil)
        {
            var oAutomovil = _AutomovilDatos.Obtener(IdAutomovil);

            return View(oAutomovil);
        }

        [HttpPost]
        public string Editar(AutomovilModel Automovil)
        {
            //Recibe un automovil para editarlo en la base
            string respuesta = "datos";  //Si el formulario no es válido se informa al usuario
            if (ModelState.IsValid)
                respuesta = _AutomovilDatos.Editar(Automovil); //Este método puede devolver un error o ""(Correcto)
            return respuesta;
        }

        public IActionResult Eliminar(int IdAutomovil)
        {
            var oAutomovil = _AutomovilDatos.Obtener(IdAutomovil);
            if (oAutomovil == null)
            {
                return NotFound();
            }
            return View(oAutomovil);
        }

        [HttpPost]
        public string Eliminar(AutomovilModel oAutomovil)
        {
            //Recibe un automovil para settearle la fecha de baja en la base
            var respuesta = _AutomovilDatos.Eliminar(oAutomovil.IdAutomovil); //Este método puede devolver un error o ""(Correcto)
            return respuesta;
        }
    }
}
