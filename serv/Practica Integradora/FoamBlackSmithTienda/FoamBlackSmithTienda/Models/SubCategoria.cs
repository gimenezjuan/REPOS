using System.ComponentModel.DataAnnotations;

namespace FoamBlackSmithTienda.Models
{
    public class SubCategoria
    {
        public int Id { get; set; } 

        [Display(Name = "Nombre de la subcategoría")]
        [Required(ErrorMessage = "El nombre de la subcategoría es obligatorio")]
        public string Nombre { get; set; }
        public ICollection<Producto>? Productos { get; set; }

    }
}
