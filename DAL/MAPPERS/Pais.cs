using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.MAPPERS
{
    internal class Pais
    {
        private Pais() { }
        private static Pais instance;

        public static Pais GetInstance()
        {
            if (instance == null)
            {
                instance = new Pais();
            }
            return instance;
        }

        public List<BE.Pais> Map(DataTable table)
        {
            List<BE.Pais> paises = new List<BE.Pais>();

            foreach (DataRow item in table.Rows)
            {
                paises.Add(new BE.Pais()
                {
                    ID = item.Field<int>("intId"),
                    Nombre = item.Field<string>("varDescripcion")
                });

            }

            return paises;
        }
    }
}

