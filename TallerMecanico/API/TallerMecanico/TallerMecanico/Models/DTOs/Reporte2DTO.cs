namespace TallerMecanico.Models.DTOs
{
    public class Reporte2DTO
    {
        public string? Marca { get; set; }
        public double? Promedio { get; set; }

        public Reporte2DTO(string? marca, double? promedio)
        {
            Marca = marca;
            Promedio = promedio;
        }

    }
}
