using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Mangas.Core
{
    public class Calificacion
    {
        public int IdCalificacion { get; set; }
        public int IdUsuario { get; set; }
        public int IdManga { get; set; }
        public byte Puntaje { get; set; }
        public string Comentarios { get; set; }
        public DateTime FechaHora { get; set; }
    }
}