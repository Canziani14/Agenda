using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.MAPPERS
{
        internal class Direccion
        {
        #region SingletonDireccionMappers
        private Direccion() { }
            private static Direccion instance;

            public static Direccion GetInstance()
            {
                if (instance == null)
                {
                    instance = new Direccion();
                }
                return instance;
            }
        #endregion

        public List<BE.Direccion> Map(DataTable table)
        {
            List<BE.Direccion> direcciones = new List<BE.Direccion>();

            foreach (DataRow item in table.Rows)
            {
                BE.Direccion direccion = new BE.Direccion()
                {
                    ID = item.Field<int>("intid"),
                    PaisID = item.Field<int>("intIdPais"),
                    ProvinciaID = item.Field<int>("intIdProvincia"),
                    Calle = item.Field<string>("varCalle"),
                    Altura = item.Field<int>("varAltura"),
                    Piso = item.Field<string>("varPiso"),
                    Departamento = item.Field<string>("varDepartmento"),
                    LocalidadID = item.Field<int>("intIdLocalidad"),
                    ContactoID = item.Field<int>("intIdContacto")
                };
                direcciones.Add(direccion);
            }
            return direcciones;
        }
    }
}


