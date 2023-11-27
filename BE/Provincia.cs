using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BE
{
    public class Provincia
    {
        public int ID { get; set; }
 
        public Pais Pais { get; set; }
        public string Nombre { get; set; }
    }
}
