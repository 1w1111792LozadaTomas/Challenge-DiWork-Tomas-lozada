namespace TallerMecanico.Models.DTOs
{
    public class Reporte3DTO
    {
        public string? Tipo { get; set; }
        public double? SumatoriaPresupuesto { get; set; }

        public Reporte3DTO(string? tipo, double? sumatoriaPresupuesto)
        {
            Tipo = tipo;
            SumatoriaPresupuesto = sumatoriaPresupuesto;
        }

    }
}
