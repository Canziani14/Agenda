using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    
    public class Agenda : BE.ICRUD<BE.Agenda>
    {
        DAL.Agenda DALAgenda = new DAL.Agenda();
        public bool Actualizar(BE.Agenda objActualizar)
        {
            return DALAgenda.Actualizar(objActualizar);
        }

        public bool Agregar(BE.Agenda objAgregar)
        {
            return DALAgenda.Agregar(objAgregar);
        }

        public bool Eliminar(BE.Agenda objEliminar)
        {
            
            return DALAgenda.Eliminar(objEliminar);
        }

        public List<BE.Agenda> Listar()
        {
            return DALAgenda.Listar();
        }

        public List<BE.Agenda> Listar(int id)
        {
            throw new NotImplementedException();
        }

        public List<BE.Agenda> ListarPorContactos(string descAgenda)
        {
            return DALAgenda.listarxContacto(descAgenda);
        }


        public int CantidadDeContactos(int id)
        {
            return DALAgenda.ObtenerCantidadConctosPorAgenda(id);
        }

        public int CantidadContactosEnTabla()
        {
            return DALAgenda.ActualizarEnTabla();
        }

    }

}
