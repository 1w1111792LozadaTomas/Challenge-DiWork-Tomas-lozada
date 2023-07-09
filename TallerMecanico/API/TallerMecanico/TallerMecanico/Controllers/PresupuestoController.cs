using Microsoft.AspNetCore.Mvc;
using TallerMecanico.Datos;
using TallerMecanico.Models;
using TallerMecanico.Models.DTOs;

namespace TallerMecanico.Controllers
{
    public class PresupuestoController : Controller
    {
        private readonly PresupuestoDatos _presupuestoDatos;

        public PresupuestoController()
        {
            _presupuestoDatos = new PresupuestoDatos();
        }

        public IActionResult Listar()
        {
            var presupuestos = _presupuestoDatos.Listar();
            return View(presupuestos);
        }

        public List<VehiculoDto> LlenaComboVehiculos()
        {
            var respuesta = _presupuestoDatos.LlenaComboVehiculos();
            return respuesta;
        }
        public List<VehiculoDto> LlenaComboVehiculosEditar()
        {
            var respuesta = _presupuestoDatos.LlenaComboVehiculosEditar();
            return respuesta;
        }

        public IActionResult Obtener(int id)
        {
            var presupuesto = _presupuestoDatos.Obtener(id);
            if (presupuesto == null)
            {
                return NotFound();
            }
            return View(presupuesto);
        }

        public IActionResult Agregar()
        {
            //Devuelve la vista
            return View();
        }

        [HttpPost]
        public string Agregar(PresupuestoModel presupuesto)
        {
            //Recibe un presupuesto para guardarlo en la base
            var respuesta = _presupuestoDatos.Agregar(presupuesto);
            return respuesta;
        }

        public IActionResult Editar(int IdPresupuesto)
        {
            var oPresupuesto = _presupuestoDatos.Obtener(IdPresupuesto);

            return View(oPresupuesto);
        }

        [HttpPost]
        public string Editar(PresupuestoModel oPresupuesto)
        {
            //Recibe un presupuesto para editarlo en la base
            string respuesta = "datos";  //Si el formulario no es válido se informa al usuario
            if (ModelState.IsValid)
                respuesta = _presupuestoDatos.Editar(oPresupuesto); //Este método puede devolver un error o ""(Correcto)
            return respuesta;
        }

        public IActionResult Eliminar(int IdPresupuesto)
        {
            var oPresupuesto = _presupuestoDatos.Obtener(IdPresupuesto);
            if (oPresupuesto == null)
            {
                return NotFound();
            }
            return View(oPresupuesto);
        }

        [HttpPost]
        public string Eliminar(PresupuestoModel oPresupuesto)
        {
            //Recibe un presupuesto para settearle la fecha de baja en la base
            var respuesta = _presupuestoDatos.Eliminar(oPresupuesto.IdPresupuesto); //Este método puede devolver un error o ""(Correcto)
            return respuesta;
        }
    }
}