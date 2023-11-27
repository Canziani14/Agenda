using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class Contacto : BE.ICRUD<BE.Contacto>
    {
        public bool Actualizar(BE.Contacto objActualizar)
        {
            return DAOs.Contacto.GetInstance().Actualizar(objActualizar.ID, objActualizar.Nombre, objActualizar.SegungdoNombre, objActualizar.Apellido);
        }

        public bool Agregar(BE.Contacto objAgregar)
        {
            return DAOs.Contacto.GetInstance().Agregar(objAgregar.Nombre, objAgregar.SegungdoNombre, objAgregar.Apellido, objAgregar.Agenda);
        }

        public bool Eliminar(BE.Contacto objEliminar)
        {
            return DAOs.Contacto.GetInstance().Eliminar(objEliminar.ID);
        }

        public List<BE.Contacto> Listar(int id)
        {
            return DAOs.Contacto.GetInstance().listarContactos(id);
        }

        public List<BE.Contacto> Listar()
        {
            throw new NotImplementedException();
        }

      
    }
}
