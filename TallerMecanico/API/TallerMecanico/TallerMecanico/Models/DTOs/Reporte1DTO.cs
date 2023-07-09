namespace TallerMecanico.Models.DTOs
{
    public class Reporte1DTO
    {
        public string? Marca { get; set; }
        public string? Nombre { get; set; }
        public double? Precio { get; set; }
        public int? Cantidad { get; set; }

        public Reporte1DTO(string? marca, string? nombre, double? precio, int? cantidad)
        {
            Marca = marca;
            Nombre = nombre;
            Precio = precio;
            Cantidad = cantidad;
        }
    }
}
