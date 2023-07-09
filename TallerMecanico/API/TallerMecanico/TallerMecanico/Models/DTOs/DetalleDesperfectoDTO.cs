namespace TallerMecanico.Models.DTOs
{
    public class DetalleDesperfectoDTO
    {
        public string? Nombre { get; set; }
        public double? Precio { get; set; }
        public int? Cantidad { get; set; }
        public double? Subtotal { get; set; }
        public int? IdPresupuesto{ get; set; }
        public DetalleDesperfectoDTO(int idPresupuesto, string? nombre, double? precio, int? cantidad, double? subtotal)
        {
            IdPresupuesto = idPresupuesto;
            Nombre = nombre;
            Precio = precio;
            Cantidad = cantidad;
            Subtotal = subtotal;     
        }

    }
}
