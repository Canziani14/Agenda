using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class Telefono : BE.ICRUD<BE.Telefono>
    {
        public bool Actualizar(BE.Telefono objActualizar)
        {
            return DAOs.Telefono.GetInstance().Actualizar(objActualizar.ID, objActualizar.TipoDeTelefonoID, objActualizar.Numero, objActualizar.ContactoID);
        }

        public bool Agregar(BE.Telefono objAgregar)
        {
            return DAOs.Telefono.GetInstance().Agregar(objAgregar.TipoDeTelefonoID, objAgregar.Numero, objAgregar.ContactoID);
        }

        public bool Eliminar(BE.Telefono objEliminar)
        {
            return DAOs.Telefono.GetInstance().Eliminar(objEliminar.ID);
        }

        public List<BE.Telefono> Listar()
        {
            return DAOs.Telefono.GetInstance().ListarTelefonos();
        }

        public List<BE.Telefono> Listar(int id)
        {
            return DAOs.Telefono.GetInstance().ListarTelefonos(id);
        }
    }
}
