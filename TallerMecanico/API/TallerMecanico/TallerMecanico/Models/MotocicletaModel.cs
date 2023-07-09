using System.Reflection;
using static TallerMecanico.Models.AutomovilModel;

namespace TallerMecanico.Models
{
    public class MotocicletaModel : VehiculoModel
    {
        private int idMotocicleta;
        public int IdMotocicleta
        {
            get => idMotocicleta;
            set => idMotocicleta = value;
        }
        private string? cilindrada;
        public string? Cilindrada
        {
            get => cilindrada;
            set => cilindrada = value;
        }

        public MotocicletaModel(int idMotocicleta, string? marca, string? modelo, int anio, string patente, string? cilindrada, DateTime? fechaBaja)
            : base(marca, modelo, anio, patente)
        {
            IdMotocicleta = idMotocicleta;
            Cilindrada = cilindrada;
            FechaBaja = fechaBaja;  
        }

        public MotocicletaModel()
        {
        }
    }
}