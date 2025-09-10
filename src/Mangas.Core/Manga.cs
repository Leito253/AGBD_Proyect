using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Mangas.Core
{
    public class Manga
    {
        public int IdManga { get; set; }
        public string Nombre { get; set; }
        public DateTime? Lanzamiento { get; set; }
        public string Genero { get; set; }
        public decimal? Precio { get; set; }
        public string Autor { get; set; }
        public string Editorial { get; set; }
    }
}