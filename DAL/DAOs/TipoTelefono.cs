using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;

namespace DAL.DAOs
{
    internal class TipoTelefono
    {
        private TipoTelefono() { }
        private static DAOs.TipoTelefono instance;
        public static DAOs.TipoTelefono GetInstance()
        {
            if (instance == null)
            {
                instance = new DAOs.TipoTelefono();
            }
            return instance;
        }

        
        string connectionString = ConfigurationManager.ConnectionStrings["Produccion"].ConnectionString;

        string SPSelecteAll = "TelefonoTipoSelectAll";


        SqlConnection connection;

        public List<BE.TipoDeTelefono> Listar()
        {
            DataTable table = new DataTable();
            SqlDataReader reader;
            connection = new SqlConnection(connectionString);
            SqlCommand command = new SqlCommand();
            command.Connection = connection;
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = SPSelecteAll;

            connection.Open();

            reader = command.ExecuteReader();
            table.Load(reader);
            connection.Close();

            return MAPPERS.TipoTelefono.GetInstance().Map(table);

        }
    }
}
