using BE;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    
    public class Direccion : BE.ICRUD<BE.Direccion>
    {
        DAL.Direccion DALDireccion = new DAL.Direccion();
        public bool Actualizar(BE.Direccion objActualizar)
        {
            return DALDireccion.Actualizar(objActualizar);
        }

        public bool Agregar(BE.Direccion objAgregar)
        {
            return DALDireccion.Agregar(objAgregar);
        }

        public bool Eliminar(BE.Direccion objEliminar)
        {
            return DALDireccion.Eliminar(objEliminar);
        }

        public List<BE.Direccion> Listar()
        {
            return DALDireccion.Listar();
        }

        public List<BE.Direccion> Listar(int id)
        {
            return DALDireccion.Listar(id);
        }
    }
    
}
