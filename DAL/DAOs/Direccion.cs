using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SQLHelper;
using System.Configuration;
using BE;
using DAL.MAPPERS;

namespace DAL.DAOs
{
    internal class Direccion
    {
        #region SingletonDireccion
        private Direccion() { }
        private static DAOs.Direccion instance;
        public static DAOs.Direccion GetInstance()
        {
            if (instance == null)
            {
                instance = new DAOs.Direccion();
            }
            return instance;
        }
        #endregion

        #region ConnectionStringYSP

        string connectionString = ConfigurationManager.ConnectionStrings["Produccion"].ConnectionString;

        string SPAdd = "DireccionInsert";
        string SPDelete = "DireccionDelete";
        //string SPSelecteAll = "DireccionSelectAll";
        string SPUpdate = "DireccionUpdate";
        string SPSelecteAll = "DireccionSelectAllByIntIdContacto";

        #endregion

        SqlConnection connection;

        #region AgregarDireccionDAOs
        public bool Agregar(int pais, int provincia, string calle, int altura, string piso, string departamento,
            int localidad, int contacto)
        {
            bool returnValue = false;

            List<SqlParameter> parameters = new List<SqlParameter>()
            {
                new SqlParameter("@intIdPais", pais),
                new SqlParameter("@intIdProvincia", provincia),
                new SqlParameter("@varCalle", calle),
                new SqlParameter("@varAltura", altura),
                new SqlParameter("@varPiso", piso),
                new SqlParameter("@varDepartmento", departamento),
                new SqlParameter("@intIdLocalidad", localidad),
                new SqlParameter("@intIdContacto", contacto)
            };
            if (SqlHelper.GetInstance(connectionString).ExecuteNonQuery(SPAdd, parameters)>0)
            {
                returnValue = true;
            }
            else
            {
                
            }
            

            

            return returnValue;   
        }
        #endregion

        #region ActualizarDireccionDAOs
        public bool Actualizar(int id, int pais, int provincia, string calle, int altura, int piso, string departamento,
            int localidad, Contacto contacto)
        {
            bool returnValue = false;

          
            List<SqlParameter> parameters = new List<SqlParameter>()
            {

                new SqlParameter("@intID", id),
                new SqlParameter("@intIdPais", pais),
                new SqlParameter("@intIdProvincia", provincia),
                new SqlParameter("@varCalle", calle),
                new SqlParameter("@varAltura", altura),
                new SqlParameter("@varPiso", piso),
                new SqlParameter("@varDepartmento", departamento),
                new SqlParameter("@intIdLocalidad", localidad),
                new SqlParameter("@intIdContacto", contacto)
                };
            SqlHelper.GetInstance(connectionString).ExecuteNonQuery(SPUpdate, parameters);

            returnValue = true;

            return returnValue;

        }
        #endregion

        #region EliminarDireccionDAOs
        public bool Eliminar(int id)
        {
            bool returnValue = false;

            connection = new SqlConnection(connectionString);
            SqlCommand command = new SqlCommand();

            command.Connection = connection;
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = SPDelete;

            command.Parameters.AddWithValue("@intId", id);

            connection.Open();
            if (command.ExecuteNonQuery() > 0)
            {
                returnValue = true;
            }

            connection.Close();

            return returnValue;
        }
        #endregion

        #region ListarDireccionesDAOs
        public List<BE.Direccion> listarDireccion()
        {
            {
                
                DataTable table = SqlHelper.GetInstance(connectionString).ExecuteDataTable(SPSelecteAll);

                return MAPPERS.Direccion.GetInstance().Map(table);
            }

        }

        public List<BE.Direccion> listarDireccion(int id)
        {
            {
                List<SqlParameter> parameters = new List<SqlParameter>()
            {
                new SqlParameter("@intIdContacto", id)
            };

                DataTable table = SqlHelper.GetInstance(connectionString).ExecuteDataTable(SPSelecteAll, parameters);

                return MAPPERS.Direccion.GetInstance().Map(table);
            }

        }


        #endregion

    }
}
