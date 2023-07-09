using System;

namespace TallerMecanico.Models
{
    public class PresupuestoModel
    {
        public int IdPresupuesto { get; set; }
        public string Nombre { get; set; }
        public string Apellido { get; set; }
        public string Email { get; set; }
        public decimal? Total { get; set; }
        public int IdVehiculo { get; set; }
        public DateTime? FechaBaja { get; set; }

        public PresupuestoModel(int idPresupuesto, string nombre, string apellido, string email, decimal total, int idVehiculo, DateTime? fechaBaja)
        {
            IdPresupuesto = idPresupuesto;
            Nombre = nombre;
            Apellido = apellido;
            Email = email;
            Total = total;
            IdVehiculo = idVehiculo;
            FechaBaja = fechaBaja;
        }

        public PresupuestoModel()
        {
        }
    }
}