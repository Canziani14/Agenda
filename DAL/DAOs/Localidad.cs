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
    internal class Localidad
    {
        private Localidad() { }
        private static DAOs.Localidad instance;
        public static DAOs.Localidad GetInstance()
        {
            if (instance == null)
            {
                instance = new DAOs.Localidad();
            }
            return instance;
        }

        
        string connectionString = ConfigurationManager.ConnectionStrings["Produccion"].ConnectionString;


        string SPSelecteAll = "LocalidadSelectAll";

        SqlConnection connection;
        public List<BE.Localidad> Listar()
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

            return MAPPERS.Localidad.GetInstance().Map(table);

        }
    }
}
