using SQLHelper;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Reflection;
using System.Runtime.InteropServices.WindowsRuntime;
using System.Text;
using System.Threading.Tasks;
using static BE.Agenda;

namespace DAL.DAOs
{
    internal class Agenda
    {

        #region SingletonAgenda
        private Agenda() { }
        private static DAOs.Agenda instance;

        public static DAOs.Agenda GetInstance()
        {
            if (instance == null)
            {
               instance = new DAOs.Agenda();
            }
            return instance;
        }
        #endregion

        #region ConnectionStringYSP
       
        string connectionString = ConfigurationManager.ConnectionStrings["Produccion"].ConnectionString;

        string SPAdd = "AgendaInsert";
        string SPDelete = "AgendaDelete";
        string SPSelecteAll = "AgendaSelectAll";
        string SPUpdate = "AgendaUpdate";
        #endregion


        #region AgregarAgendaDAOs

        public bool Agregar(string descripcion, int cantidadContactos)
        {
            bool returnValue = false;

            List<SqlParameter> parameters = new List<SqlParameter>()
            {
                new SqlParameter("@varDescripcion", descripcion),
                new SqlParameter("@intCantidadContactos", cantidadContactos),


            };

            SqlHelper.GetInstance(connectionString).ExecuteNonQuery(SPAdd, parameters);

            returnValue = true; 

            return returnValue; 
        }
        #endregion

        #region ActualizarAgendaDAOs

       
        public bool Actualizar(string descripcion, int id, int cantidadDeContactos)
            {           

                bool returnValue = false;

            List<SqlParameter> parameters = new List<SqlParameter>()
            {
                new SqlParameter("@varDescripcion", descripcion),
                new SqlParameter("@intId", id),
                new SqlParameter("@intCantidadContactos", cantidadDeContactos)

            };

            int value=SqlHelper.GetInstance(connectionString).ExecuteNonQuery(SPUpdate, parameters);

                if (value > 0)
                {
                    returnValue = true;
                }

                return returnValue;
            }
        #endregion

        #region EliminarAgendaDAOs
        public bool Eliminar(int id)
        {
            bool returnValue = false;

            List<SqlParameter> parameters = new List<SqlParameter>()
            {
            new SqlParameter("@intId", id),
            };

            SqlHelper.GetInstance(connectionString).ExecuteNonQuery(SPDelete, parameters);
            returnValue=true;
            return returnValue;
        }
        #endregion

        #region ListarAgendasDAOs
        public List<BE.Agenda> listarAgendas()
        {
            DataTable table = SqlHelper.GetInstance(connectionString).ExecuteDataTable(SPSelecteAll);

            return MAPPERS.Agenda.GetInstance().Map(table);
        }
        #endregion

        public List<BE.Agenda> listarxContacto(string descAgenda)
        {
            string queryListarXAgenda =
                "SELECT A.intId, A.varDescripcion, A.intIdContacto " +
                "FROM Agenda A " +
                "INNER JOIN Contacto C ON A.intIdContacto = C.intId " +
                $"WHERE A.varDescripcion = '{descAgenda}'";
                        
            SqlConnection connection;
            DataTable table = new DataTable();
            SqlDataReader reader;
            connection = new SqlConnection(connectionString);
            SqlCommand command = new SqlCommand();
            command.Connection = connection;
            command.CommandType = CommandType.Text;
            command.CommandText = queryListarXAgenda;
            
            connection.Open();
            reader = command.ExecuteReader();
            table.Load(reader);
            connection.Close();

            return MAPPERS.Agenda.GetInstance().Map(table);
        }

        public int ObtenerCantidadContactosPorAgenda(int intIdAgenda)
        {
            string queryObtenerContactosPorAgenda = $"SELECT COUNT(intIdAgenda) as Cantidad FROM contacto WHERE intIdAgenda = {intIdAgenda}";

            SqlConnection connection;
            DataTable table = new DataTable();
            SqlDataReader reader;

            connection = new SqlConnection(connectionString);
            SqlCommand command = new SqlCommand();
            command.Connection = connection;
            command.CommandType = CommandType.Text;
            command.CommandText = queryObtenerContactosPorAgenda;

            connection.Open();
            reader = command.ExecuteReader();
            table.Load(reader);
            connection.Close();


            if (table.Rows.Count > 0)
            {
                string cantidadStr = table.Rows[0]["Cantidad"].ToString();

                // Intenta convertir la cadena a un entero
                if (int.TryParse(cantidadStr, out int cantidadContactos))
                {
                    return cantidadContactos;
                }
            }


            return 0;

        }
        public int ActualizarEnTabla()
        {

            string queryObtenerContactosPorAgenda = "UPDATE Agenda " +
                                                    "SET intCantidadContactos = (" +
                                                    "SELECT COUNT(intId) " +
                                                    "FROM Contacto " +
                                                    "WHERE contacto.intIdAgenda = Agenda.intId)";

            SqlConnection connection;
            DataTable table = new DataTable();
            SqlDataReader reader;

            connection = new SqlConnection(connectionString);
            SqlCommand command = new SqlCommand();
            command.Connection = connection;
            command.CommandType = CommandType.Text;
            command.CommandText = queryObtenerContactosPorAgenda;

            connection.Open();
            reader = command.ExecuteReader();
            table.Load(reader);
            connection.Close();

            // Obtén el valor de la columna "Cantidad" de la primera fila (asumiendo que la consulta siempre devolverá una fila)
           /* if (table.Rows.Count > 0)
            {
                string cantidadStr = table.Rows[0]["Cantidad"].ToString();

                // Intenta convertir la cadena a un entero
                if (int.TryParse(cantidadStr, out int cantidadContactos))
                {
                    return cantidadContactos;
                }
            }*/

            // Manejo de error: Devuelve un valor predeterminado o lanza una excepción según tus necesidades
            return 0; 
        }

    }
}
