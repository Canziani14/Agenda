using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BE
{
    public class Localidad
    {
        public int ID { get; set; }
        public Pais IDPais { get; set; }
        public Provincia IDProvincia { get; set; }
        public string Nombre { get; set; }
    }
}
