using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Mangas.Core
{
    public class Empleado
    {
        public long Cuil { get; set; }
        public string Nombre { get; set; }
        public string Apellido { get; set; }
        public int? Dni { get; set; }
        public ushort? SueldoUSD { get; set; }
    }
}