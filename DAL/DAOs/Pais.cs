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
    internal class Pais
    {
        private Pais() { }
        private static DAOs.Pais instance;
        public static DAOs.Pais GetInstance()
        {
            if (instance == null)
            {
                instance = new DAOs.Pais();
            }
            return instance;
        }

       
        string connectionString = ConfigurationManager.ConnectionStrings["Produccion"].ConnectionString;

        string SPSelecteAll = "PaisSelectAll";

        SqlConnection connection;

        public List<BE.Pais> Listar()
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

            return MAPPERS.Pais.GetInstance().Map(table);

        }
    }
}
