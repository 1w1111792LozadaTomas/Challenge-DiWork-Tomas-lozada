using Microsoft.AspNetCore.Mvc;
using TallerMecanico.Datos;
using TallerMecanico.Models;
using TallerMecanico.Models.DTOs;

namespace TallerMecanico.Controllers
{
    public class ReporteController : Controller
    {
        private readonly ReporteDatos _ReporteDatos = new ReporteDatos();

        public IActionResult Listar()
        {
            //Devuelve la vista
            return View();
        }

        public List<Reporte1DTO> Reporte1()
        {
            var oLista = _ReporteDatos.Reporte1();

            return oLista;
        }

        public List<Reporte2DTO> Reporte2()
        {
            var oLista = _ReporteDatos.Reporte2();

            return oLista;
        }

        public List<Reporte3DTO> Reporte3()
        {
            var oLista = _ReporteDatos.Reporte3();

            return oLista;
        }
    }
}