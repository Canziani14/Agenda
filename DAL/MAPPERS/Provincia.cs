using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.MAPPERS
{
    internal class Provincia
    {
        private Provincia() { }
        private static Provincia instance;

        public static Provincia GetInstance()
        {
            if (instance == null)
            {
                instance = new Provincia();
            }
            return instance;
        }

        public List<BE.Provincia> Map(DataTable table)
        {
            List<BE.Provincia> provincias = new List<BE.Provincia>();

            foreach (DataRow item in table.Rows)
            {
                provincias.Add(new BE.Provincia()
                {                    
                    ID= item.Field<int>("intId"),
                    Nombre =item.Field<string>("varDescripcion")
                });
                
            }

            return provincias;
        }
    }
}

