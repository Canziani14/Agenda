using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.MAPPERS
{
    internal class TipoTelefono
    {
        private TipoTelefono() { }
        private static TipoTelefono instance;

        public static TipoTelefono GetInstance()
        {
            if (instance == null)
            {
                instance = new TipoTelefono();
            }
            return instance;
        }

        public List<BE.TipoDeTelefono> Map(DataTable table)
        {
            List<BE.TipoDeTelefono> tipoTelefono = new List<BE.TipoDeTelefono>();

            foreach (DataRow item in table.Rows)
            {
                tipoTelefono.Add(new BE.TipoDeTelefono()
                {
                    ID = item.Field<int>("intId"),
                    Tipo = item.Field<string>("varDescripcion"),
                    
                    
                });

            }

            return tipoTelefono;
        }
    }

}
