using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    
    public class Telefono : BE.ICRUD<BE.Telefono>
    {
        DAL.Telefono DALTelefono = new DAL.Telefono();
        public bool Actualizar(BE.Telefono objActualizar)
        {
            return DALTelefono.Actualizar(objActualizar);
        }

        public bool Agregar(BE.Telefono objAgregar)
        {
            return DALTelefono.Agregar(objAgregar);
        }

        public bool Eliminar(BE.Telefono objEliminar)
        {
            return DALTelefono.Eliminar(objEliminar);
        }

        public List<BE.Telefono> Listar()
        {
            return DALTelefono.Listar();
        }

        public List<BE.Telefono> Listar(int id)
        {
            return DALTelefono.Listar(id);
        }

        
    }
    
}
