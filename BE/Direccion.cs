using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BE
{
    public class Direccion
    {
        public int ID { get; set; }
               
        public string Calle { get; set; }
        public int Altura { get; set; }
        public string Piso { get; set; }
        public string Departamento { get; set; }
     
        private Localidad Localidad { get; set; }
        public int LocalidadID
        {
            get { return Localidad != null ? Localidad.ID : 0; }
            set
            {
                if (Localidad == null)
                {
                    Localidad = new Localidad();
                }
                Localidad.ID = value;
            }
        }

      



        private Pais Pais { get; set; }
        public int PaisID
        {
            get { return Pais != null ? Pais.ID :0; }
            set
            {
                if (Pais == null)
                {
                    Pais = new Pais();
                }
                Pais.ID = value;
            }
        }

     

        private Provincia Provincia { get; set; }
        public int ProvinciaID
        {
            get { return Provincia != null ? Provincia.ID : 0; }
            set
            {
                if (Provincia == null)
                {
                    Provincia = new Provincia();
                }
                Provincia.ID = value;
            }
        }

       


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

    }
}
