﻿using System.ComponentModel.DataAnnotations;

namespace FoamBlackSmithTienda.Models
{
    public class Pedido
    {
        [Display(Name = "Num. Pedido")]
        public int Id { get; set; }
        [Required(ErrorMessage = "La fecha del pedido es obligatorio")]
        [DataType(DataType.Date)]
        public DateTime? Fecha { get; set; }
        [DataType(DataType.Date)]
        public DateTime? Confirmado { get; set; }
        [DataType(DataType.Date)]
        public DateTime? Preperado { get; set; }
        [DataType(DataType.Date)]
        public DateTime? Enviado { get; set; }
        [DataType(DataType.Date)]
        public DateTime? Cobrado { get; set; }
        [DataType(DataType.Date)]
        public DateTime? Devuelto { get; set; }
        [DataType(DataType.Date)]
        public DateTime? Anulado { get; set; }
        public int ClienteId { get; set; }
        public int EstadoId { get; set; }

        public Cliente? Cliente { get; set; }
        public Estado? Estado { get; set; }
        public ICollection<Detalle>? Detalles { get; set; }
    }
}
