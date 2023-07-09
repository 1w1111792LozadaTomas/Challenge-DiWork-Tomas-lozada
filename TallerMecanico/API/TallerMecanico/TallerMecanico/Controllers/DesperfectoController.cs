using Microsoft.AspNetCore.Mvc;
using TallerMecanico.Datos;
using TallerMecanico.Models;
using TallerMecanico.Models.DTOs;

namespace TallerMecanico.Controllers
{
    public class DesperfectoController : Controller
    {
        DesperfectoDatos _DesperfectoDatos = new DesperfectoDatos();
        public IActionResult Listar(int IdPresupuesto)
        {
            //La vista muestra una lista de desperfectos
            var oLista = _DesperfectoDatos.Listar(IdPresupuesto);

            return View(oLista);
        }
        public List<RepuestoModel> LlenaComboRepuestos()
        {
            var oLista = _DesperfectoDatos.LlenaComboRepuestos();

            return oLista;
        }

        public IActionResult ListarDetalle(int idDesperfecto)
        {
            //La vista muestra una lista de repuestos
            var oLista = _DesperfectoDatos.ObtenerDetalle(idDesperfecto);

            return View(oLista);
        }

        public IActionResult Agregar(int IdPresupuesto)
        {
            //Devuelve la vista
            DesperfectoModel desperfecto = new DesperfectoModel();
            desperfecto.IdPresupuesto = IdPresupuesto;
            return View(desperfecto);
        }

        [HttpPost]
        public string Agregar(DesperfectoModel oDesperfecto)
        {
            //Recibe un desperfecto para guardarlo en la base
            var respuesta = _DesperfectoDatos.Agregar(oDesperfecto);
            return respuesta;
        }

        public IActionResult Eliminar(int IdDesperfecto)
        {
            var oAutomovil = _DesperfectoDatos.Obtener(IdDesperfecto);
            if (oAutomovil == null)
            {
                return NotFound();
            }
            return View(oAutomovil);
        }

        [HttpPost]
        public string Eliminar(DesperfectoModel oDesperfecto)
        {
            //Recibe un desperfecto para settearle la fecha de baja en la base
            var respuesta = _DesperfectoDatos.Eliminar(oDesperfecto.IdDesperfecto); //Este método puede devolver un error o ""(Correcto)
            return respuesta;
        }
    }
}
