using System.ComponentModel.DataAnnotations;

namespace FoamBlackSmithTienda.Models
{
    public class Categoria
    {
        public int Id { get; set; }

        [Display(Name = "Nombre de la categoria")]
        [Required(ErrorMessage = "El nombre de la categoría es obligatorio")]
        public string Nombre { get; set; }

        public ICollection<Producto>? Productos { get; set; }


    }
}
