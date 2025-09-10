using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Mangas.Core
{
    public class Compra
    {
        public uint NroCompra { get; set; }
        public int IdUsuario { get; set; }
        public int IdManga { get; set; }
        public decimal? PrecioTotal { get; set; }
        public DateTime? FechaCompra { get; set; }
    }
}