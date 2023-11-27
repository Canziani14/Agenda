using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BE
{
    public class Telefono
    {
        public int ID { get; set; }
        public string Numero { get; set; }

        private Contacto Contacto { get; set; }
        public int ContactoID
        {
            get { return Contacto != null ? Contacto.ID : 0; }
            set
            {
                if (Contacto == null)
                {
                    Contacto = new Contacto();
                }
                Contacto.ID = value;
            }
        }

        private TipoDeTelefono Tipo { get; set; }
        public int TipoDeTelefonoID
        {
            get { return Tipo != null ? Tipo.ID : 0; }
            set
            {
                if (Tipo == null)
                {
                    Tipo = new TipoDeTelefono();
                }
                Tipo.ID = value;
            }
        }
    }
}
