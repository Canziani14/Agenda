using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;
using SQLHelper;
using static BE.Agenda;
using System.Configuration;

namespace DAL.DAOs
{
    internal class Contacto
    {
        #region SingletonContacto
        private Contacto() { }
        private static DAOs.Contacto instance;
        public static DAOs.Contacto GetInstance()
        {
            if (instance == null)
            {
                instance = new DAOs.Contacto();
            }
            return instance;
        }
        #endregion

        #region ConnectionStringYSP
        
        string connectionString = ConfigurationManager.ConnectionStrings["Produccion"].ConnectionString;

        string SPAdd = "ContactoInsert";
        string SPDelete = "ContactoDelete";
        string SPSelect = "ContactoSelectAllByIntIdAgenda";
        string SPUpdate = "ContactoUpdate";
        #endregion


        #region AgregarContactoDAOs
        public bool Agregar(string nombre, string segundoNombre, string apellido, int idAgenda)
        {
            bool returnValue = false;

            List<SqlParameter> parameters = new List<SqlParameter>()
            {
                new SqlParameter("@varNombre", nombre),
                new SqlParameter("@varSegundoNombre", segundoNombre),
                new SqlParameter("@varApellido", apellido),
                new SqlParameter("@intIdAgenda", idAgenda)
            };

            SqlHelper.GetInstance(connectionString).ExecuteNonQuery(SPAdd, parameters);

            returnValue = true;

            return returnValue;
        }
        #endregion

        #region ActualizarContactoDAOs
        public bool Actualizar(int id, string nombre, string segundoNombre, string apellido)
        {
            bool returnValue = false;

            List<SqlParameter> parameters = new List<SqlParameter>()
            {
                new SqlParameter("@intID", id),
                new SqlParameter("@varNombre", nombre),
                new SqlParameter("@varSegundoNombre", segundoNombre),
                new SqlParameter("@varApellido", apellido)
            };

            SqlHelper.GetInstance(connectionString).ExecuteNonQuery(SPUpdate, parameters);

            returnValue = true;
            return returnValue;
        }
        #endregion

        #region EliminarContactoDAOs
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

        #region ListarContactosDAOs
        public List<BE.Contacto> listarContactos(int id)
        {
            List<SqlParameter> parameters = new List<SqlParameter>()
            {
                new SqlParameter("@intIdAgenda", id),
                
            };
            DataTable table = SqlHelper.GetInstance(connectionString).ExecuteDataTable(SPSelect, parameters);
               

                return MAPPERS.Contacto.GetInstance().Map(table);
            

        }
        #endregion
        
        

    }
}
