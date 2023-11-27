using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.MAPPERS
{
    internal class Telefono
    {
        #region SingletonTelefonoMappers
        private Telefono() { }
        private static Telefono instance;

        public static Telefono GetInstance()
        {
            if (instance == null)
            {
                instance = new Telefono();
            }
            return instance;
        }
        #endregion

        public List<BE.Telefono> Map(DataTable table)
        {
            List<BE.Telefono> telefonos = new List<BE.Telefono>();
            
            foreach (DataRow item in table.Rows)
            {
                telefonos.Add(new BE.Telefono()
                {
                    ID = item.Field<int>("intid"),
                    Numero = item.Field<string>("varNumero"),                    
                    TipoDeTelefonoID = item.Field<int>("intIdTipo"),
                    ContactoID= item.Field<int>("intIdContacto")
                    
                });
            }
            return telefonos;
        }


        
    }
}
