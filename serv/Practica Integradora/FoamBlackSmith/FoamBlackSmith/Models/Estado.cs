using System.ComponentModel.DataAnnotations;

namespace FoamBlackSmith.Models
{
    public class Estado
    {
        public int Id { get; set; }
        [Display(Name = "Descripción")]
        [Required(ErrorMessage = "La descripción del estado es obligatoria")]
        public string? Descripcion { get; set; }
        public ICollection<Pedido>? Pedidos { get; set; }
    }
}
