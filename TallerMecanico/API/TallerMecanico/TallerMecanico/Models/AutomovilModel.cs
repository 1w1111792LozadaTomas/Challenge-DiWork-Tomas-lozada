using System.ComponentModel.DataAnnotations;

namespace TallerMecanico.Models
{
    public class AutomovilModel : VehiculoModel
    {
        public int IdAutomovil { get; set; }

        [Required(ErrorMessage = "El número de puertas es obligatorio")]
        public int Puertas { get; set; }
        public enum Tipo
        {
            Compacto,
            Sedan,
            Monovolumen,
            Utilitario,
            Lujo
        }
        public Tipo SelectedTipo { get; set; }

        public AutomovilModel(int idAutomovil, string? marca, string? modelo, int anio, string patente, Tipo tipo, int puertas, DateTime? fechaBaja)
            : base(marca, modelo, anio, patente)
        {
            IdAutomovil = idAutomovil;
            Puertas = puertas;
            FechaBaja = fechaBaja;
            Patente = patente;
            SelectedTipo = tipo;
        }

        public AutomovilModel()
        {
        }
    }
}