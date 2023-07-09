namespace TallerMecanico.Models
{
    public abstract class VehiculoModel
    {
        public string? Marca { get; set; }
        public string? Modelo { get; set; }
        public int? Anio { get; set; }
        public string? Patente { get; set; }
        public DateTime? FechaBaja { get; set; }

        public VehiculoModel(string? marca, string? modelo, int? anio,string? patente)
        {
            Marca = marca;
            Modelo = modelo;
            Anio = anio;
            Patente = patente;
        }

        public VehiculoModel()
        {
        }
    }
}



