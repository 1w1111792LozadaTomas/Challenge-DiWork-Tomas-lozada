using System;

namespace TallerMecanico.Models
{
    public class DesperfectoModel
    {
        public int? IdDesperfecto { get; set; }
        public int? IdPresupuesto { get; set; }
        public string? Descripcion { get; set; }
        public decimal? ManoDeObra { get; set; }
        public double? Tiempo { get; set; }
        public string Repuestos  {get; set; }

        public DesperfectoModel(int? idDesperfecto, int? idPresupuesto, string? descripcion, decimal? manoDeObra, double? tiempo, string? repuestos)
        {
            IdDesperfecto = idDesperfecto;
            IdPresupuesto = idPresupuesto;
            Descripcion = descripcion;
            ManoDeObra = manoDeObra;
            Tiempo = tiempo;
            Repuestos = repuestos;
        }
        public DesperfectoModel()
        {
        }
    }
}