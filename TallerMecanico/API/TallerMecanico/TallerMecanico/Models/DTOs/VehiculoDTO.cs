namespace TallerMecanico.Models.DTOs
{
    public class VehiculoDto
    {
        public int? IdVehiculo { get; set; }
        public string? Marca { get; set; }
        public string? Modelo { get; set; }
        public int? Anio { get; set; }
        public string? Patente { get; set; }

        public VehiculoDto()
        {
        }
    }
}



