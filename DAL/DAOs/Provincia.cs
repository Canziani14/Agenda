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
    internal class Provincia
    {
        private Provincia() { }
        private static DAOs.Provincia instance;
        public static DAOs.Provincia GetInstance()
        {
            if (instance == null)
            {
                instance = new DAOs.Provincia();
            }
            return instance;
        }

       
        string connectionString = ConfigurationManager.ConnectionStrings["Produccion"].ConnectionString;

        string SPSelecteAll = "ProvinciaSelectAll";
        

        SqlConnection connection;

        public List<BE.Provincia> Listar()
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

            return MAPPERS.Provincia.GetInstance().Map(table);

        }
    }
}
