using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;

namespace BE
{
    public class Agenda
    {

         //public delegate void cantidadContactos();
        //public event cantidadContactos cantidadContactosEvent;
        public delegate void CantidadContactosEventHandler(int cantidad);
        public event CantidadContactosEventHandler CantidadContactosEvent;

        public int ID { get; set; }
        public string Descripcion { get; set; }

        public List<Contacto> Contactos { get; set; } = new List<Contacto>();



        private int _cantidadDeContactos;

        public int CantidadDeContactos
        {
            get { return _cantidadDeContactos; }
            set
            {
                _cantidadDeContactos = value;

                // Disparar el evento si la cantidad alcanza 10
                if (_cantidadDeContactos == 10 && CantidadContactosEvent != null)
                {
                    CantidadContactosEvent(_cantidadDeContactos);
                }
            }
        }

        
    





    /*
    private int _CantidadDeContactos;

    public int CantidadDeContactos
    {
        get { return _CantidadDeContactos; }
        set
        {
            if (value > 10)
            {

                if (cantidadContactosEvent != null)
                {

                    cantidadContactosEvent();
                }
            }
            else
            {
                _CantidadDeContactos = value;
            }
        }

    }
    */

}

}
