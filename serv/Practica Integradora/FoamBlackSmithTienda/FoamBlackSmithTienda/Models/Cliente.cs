using System.ComponentModel.DataAnnotations;

namespace FoamBlackSmithTienda.Models
{
    public class Cliente
    {
        public int Id { get; set; }
        [Required(ErrorMessage = "El nombre del cliente es obligatorio.")]
        public string? Nombre { get; set; }
        public string? Email { get; set; }
        public string? Telefono { get; set; }
        public string? Direccion { get; set; }
        public string? Poblacion { get; set; }
        public string? CodigoPostal { get; set; }
        public string? Nif { get; set; }

        public ICollection<Pedido>? Pedidos { get; set; }
    }
}
