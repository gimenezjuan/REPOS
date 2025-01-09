using System.ComponentModel.DataAnnotations;

namespace FoamBlackSmithTienda.Models
{
    public class Categoria
    {
        public int? Id { get; set; }
        [Display(Name = "Descripción")]
        [Required(ErrorMessage = "Descripción es obligatorio")]
        public string? Descripcion { get; set; }
        public int CategoriaId { get; set; }

        public Categoria? SubcategoriaId { get; set; }
        public ICollection<Categoria>? SubCategoria { get; set; }
    }
}
