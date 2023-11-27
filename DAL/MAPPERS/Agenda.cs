using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.MAPPERS
{
    internal class Agenda
    {
        #region SingletonAgendaMappers
        private Agenda() { }
        private static Agenda instance;

        public static Agenda GetInstance()
        {
            if (instance == null)
            {
                instance = new Agenda();
            }
            return instance;
        }
        #endregion
        public List<BE.Agenda> Map(DataTable table)
        {
            List<BE.Agenda> agendas = new List<BE.Agenda>();

            foreach (DataRow item in table.Rows)
            {
                agendas.Add(new BE.Agenda()
                {                    
                    ID = item.Field<int>("intId"),
                    Descripcion=item.Field<string>("varDescripcion"),          
                    CantidadDeContactos=item.Field<int>("intCantidadContactos")
                });
            }            
            return agendas;
        }

    

    }
}
