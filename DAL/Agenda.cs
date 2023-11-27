using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    
    public class Agenda : BE.ICRUD<BE.Agenda>
    {
        public bool Actualizar(BE.Agenda objActualizar)
        {
            return DAOs.Agenda.GetInstance().Actualizar(objActualizar.Descripcion,objActualizar.ID, objActualizar.CantidadDeContactos); 
        }

        public bool Agregar(BE.Agenda objAgregar)
        {
            return DAOs.Agenda.GetInstance().Agregar(objAgregar.Descripcion, objAgregar.CantidadDeContactos);
        }

        public bool Eliminar(BE.Agenda objEliminar)
        {
            return DAOs.Agenda.GetInstance().Eliminar(objEliminar.ID); 
        }

        public List<BE.Agenda> Listar()
        {
            return DAOs.Agenda.GetInstance().listarAgendas();
        }

        public List<BE.Agenda> Listar(int id)
        {
            throw new NotImplementedException();
        }

        public List<BE.Agenda> listarxContacto(string descAgenda)
        {
            return DAOs.Agenda.GetInstance().listarxContacto(descAgenda);
        }

        public int ObtenerCantidadConctosPorAgenda(int idAgenda)
        {
            return DAOs.Agenda.GetInstance().ObtenerCantidadContactosPorAgenda(idAgenda);
        }

        public int ActualizarEnTabla()
        {
            return DAOs.Agenda.GetInstance().ActualizarEnTabla();
        }


    }
    
}
