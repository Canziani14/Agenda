using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    
    public class Contacto : BE.ICRUD<BE.Contacto>
    {
        DAL.Contacto DALContacto = new DAL.Contacto();
        public bool Actualizar(BE.Contacto objActualizar)
        {
            return DALContacto.Actualizar(objActualizar);
        }

        public bool Agregar(BE.Contacto objAgregar)
        {
            return DALContacto.Agregar(objAgregar);
        }

        public bool Eliminar(BE.Contacto objEliminar)
        {
            return DALContacto.Eliminar(objEliminar);
        }

        public List<BE.Contacto> Listar(int id)
        {
            return DALContacto.Listar(id);
        }

        public List<BE.Contacto> Listar()
        {
            throw new NotImplementedException();
        }
    }
    
}
