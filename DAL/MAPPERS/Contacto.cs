using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.MAPPERS
{
    internal class Contacto
    {
        #region SingletoContactoMappers
        private Contacto() { }
        private static Contacto instance;

        public static Contacto GetInstance()
        {
            if (instance == null)
            {
                instance = new Contacto();
            }
            return instance;
        }
        #endregion
        public List<BE.Contacto> Map(DataTable table)
        {
            List<BE.Contacto> contactos = new List<BE.Contacto>();

            foreach (DataRow item in table.Rows)
            {
                

                contactos.Add(new BE.Contacto()
                {                                      
                    ID = item.Field<int>("intId"),
                    Nombre = item.Field<string>("varNombre"),
                    SegungdoNombre = item.Field<string> ("varSegundoNombre"),
                    Apellido = item.Field<string> ("varApellido"),
                    Agenda = item.Field<int>("intIdAgenda")
            });
            }
            return contactos;
        }
    }
}
