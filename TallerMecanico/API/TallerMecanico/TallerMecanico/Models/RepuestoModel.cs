using System.ComponentModel.DataAnnotations;

namespace TallerMecanico.Models
{
    public class RepuestoModel
    {
        public int? IdRepuesto { get; set; }
        public string? Nombre { get; set; }
        public double? Precio { get; set; }

        public RepuestoModel()
        {
        }

        public RepuestoModel(int? idRepuesto, string? nombre, double? precio)
        {
            IdRepuesto = idRepuesto;
            Nombre = nombre;
            Precio = precio;
        }
    }
}