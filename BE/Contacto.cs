using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BE
{
    public class Contacto
    {
        
        public int ID { get; set; }
        public string Nombre { get; set; }
        public string SegungdoNombre { get; set; }
        public string Apellido { get; set; }

        public int Agenda { get; set; }

        public List<Direccion> Direcciones { get; set; } = new List<Direccion>();
                
        public List<Telefono> Telefonos { get; set; } = new List<Telefono>();
    }
}
