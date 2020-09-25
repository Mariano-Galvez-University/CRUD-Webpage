using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class EntidadClientes
    {
        public int IdCliente { get; set; }
        public string TxtNit { get; set; }
        public string TxtNombres { get; set; }
        public string TxtApellidos { get; set; }
        public string TxtDireccion { get; set; }
        public string TxtTelefono { get; set; }
        public string TxtEmail { get; set; }
        public char TxtSexo { get; set; }
        public int EsClienteFrecuente { get; set; }
        public string FechaIngreso { get; set; }
        public int IntEstado { get; set; }
    }
}
