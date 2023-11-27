using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.MAPPERS
{
    internal class Localidad
    {
        private Localidad() { }
        private static Localidad instance;

        public static Localidad GetInstance()
        {
            if (instance == null)
            {
                instance = new Localidad();
            }
            return instance;
        }

        public List<BE.Localidad> Map(DataTable table)
        {
            List<BE.Localidad> localidades = new List<BE.Localidad>();

            foreach (DataRow item in table.Rows)
            {
                localidades.Add(new BE.Localidad()
                {
                    ID = item.Field<int>("intId"),
                    Nombre = item.Field<string>("varDescripcion"),
                    
                });

            }

            return localidades;
        }
    }
}

