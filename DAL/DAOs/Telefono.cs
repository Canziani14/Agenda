using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SQLHelper;
using static BE.Agenda;
using System.Configuration;
using BE;
using System.Security.Cryptography;
using DAL.MAPPERS;

namespace DAL.DAOs
{
    internal class Telefono
    {

        #region SingletonTelefono
        private Telefono() { }
            private static DAOs.Telefono instance;
            public static DAOs.Telefono GetInstance()
            {
                if (instance == null)
                {
                    instance = new DAOs.Telefono();
                }
                return instance;
            }
        #endregion

        #region ConnectionStringYSP
        
        string connectionString = ConfigurationManager.ConnectionStrings["Produccion"].ConnectionString;

            string SPAdd = "TelefonoInsert";
            string SPDelete = "TelefonoDelete";
            string SPSelecteAll = "TelefonoSelectAll";
            string SPUpdate = "TelefonoUpdate";
            string SPSelectByIDContacto = "TelefonoSelectAllByIntIdContacto";

        #endregion


        #region AgregarTelefonoDAOs
        public bool Agregar(int tipo, string numero, int contacto)
            {
                bool returnValue = false;


            List<SqlParameter> parameters = new List<SqlParameter>()
            {
                new SqlParameter("@intIdTipo", tipo),
                new SqlParameter("@varNumero", numero),
                new SqlParameter("@intIdContacto", contacto)

            };

            SqlHelper.GetInstance(connectionString).ExecuteNonQuery(SPAdd, parameters);

            returnValue = true;

            return returnValue;
        }
        #endregion

        #region ActualizarTelefonoDAOs
        public bool Actualizar(int id, int tipo, string numero, int contacto)
            {
                bool returnValue = false;

            List<SqlParameter> parameters = new List<SqlParameter>()
            {
            new SqlParameter("@intID", id),
            new SqlParameter("@intIdTipo", tipo),
            new SqlParameter("@varNumero", numero),
            new SqlParameter("@intIdContacto", contacto),
            };

            SqlHelper.GetInstance(connectionString).ExecuteNonQuery(SPUpdate, parameters);

            returnValue = true;

            return returnValue;
            }

        #endregion

        #region EliminarTelefonoDAOs
        public bool Eliminar(int id)
            {
            bool returnValue = false;

            List<SqlParameter> parameters = new List<SqlParameter>()
            {
            new SqlParameter("@intId", id),
            };

            SqlHelper.GetInstance(connectionString).ExecuteNonQuery(SPDelete, parameters);
            returnValue = true;
            return returnValue;
        }

        #endregion

        #region ListarTelefonosDAOs
        public List<BE.Telefono> ListarTelefonos(int id)
        {
            List<SqlParameter> parameters = new List<SqlParameter>()
            {
            new SqlParameter("@intIDContacto", id),
           
            };
            DataTable table = SqlHelper.GetInstance(connectionString).ExecuteDataTable(SPSelectByIDContacto, parameters);

            return MAPPERS.Telefono.GetInstance().Map(table);
        }

        public List<BE.Telefono> ListarTelefonos()
        {
            
            DataTable table = SqlHelper.GetInstance(connectionString).ExecuteDataTable(SPSelecteAll);

            return MAPPERS.Telefono.GetInstance().Map(table);
        }
        #endregion
    }
}
