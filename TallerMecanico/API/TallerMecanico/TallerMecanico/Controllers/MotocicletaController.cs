using Microsoft.AspNetCore.Mvc;
using TallerMecanico.Datos;
using TallerMecanico.Models;

namespace TallerMecanico.Controllers
{
    public class MotocicletaController : Controller
    {
        MotocicletaDatos _MotocicletaDatos = new MotocicletaDatos();

        public IActionResult Listar()
        {
            // La vista muestra una lista de motocicletas
            var oLista = _MotocicletaDatos.Listar();
            return View(oLista);
        }

        public IActionResult Agregar()
        {
            // Devuelve la vista
            return View();
        }

        [HttpPost]
        public string Agregar(MotocicletaModel oMotocicleta)
        {
            // Recibe una motocicleta para guardarla en la base
            var respuesta = _MotocicletaDatos.Agregar(oMotocicleta);
            return respuesta;
        }

        public IActionResult Editar(int IdMotocicleta)
        {
            var oMotocicleta = _MotocicletaDatos.Obtener(IdMotocicleta);
            return View(oMotocicleta);
        }

        [HttpPost]
        public string Editar(MotocicletaModel oMotocicleta)
        {
            // Recibe una motocicleta para editarla en la base
            string respuesta = "datos";  // Si el formulario no es válido se informa al usuario
            if (ModelState.IsValid)
                respuesta = _MotocicletaDatos.Editar(oMotocicleta); // Este método puede devolver un error o ""(Correcto)
            return respuesta;
        }

        public IActionResult Eliminar(int IdMotocicleta)
        {
            var oMotocicleta = _MotocicletaDatos.Obtener(IdMotocicleta);
            if (oMotocicleta == null)
            {
                return NotFound();
            }
            return View(oMotocicleta);
        }

        [HttpPost]
        public string Eliminar(MotocicletaModel oMotocicleta)
        {
            // Recibe una motocicleta para settearle la fecha de baja en la base
            var respuesta = _MotocicletaDatos.Eliminar(oMotocicleta.IdMotocicleta); // Este método puede devolver un error o ""(Correcto)
            return respuesta;
        }
    }
}