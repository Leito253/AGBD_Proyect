using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Mangas.Core
{

    public class Envio
    {
        public uint NroCompra { get; set; }
        public string Ciudad { get; set; }
        public string Calle { get; set; }
        public int Direccion { get; set; }
        public int CodigoPostal { get; set; }
        public string Referencia { get; set; }
    }
}