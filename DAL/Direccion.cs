using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class Direccion : BE.ICRUD<BE.Direccion>
    {
        public bool Actualizar(BE.Direccion objActualizar)
        {
            /*  return DAOs.Direccion.GetInstance().Actualizar(objActualizar.ID, objActualizar.Pais, objActualizar.Provincia,
                  objActualizar.Calle, objActualizar.Altura, int.Parse(objActualizar.Piso), objActualizar.Departamento,
                  objActualizar.Localidad, objActualizar.Contacto);*/
            return true;
        }

        public bool Agregar(BE.Direccion objAgregar)
        {
            return DAOs.Direccion.GetInstance().Agregar(objAgregar.PaisID, objAgregar.ProvinciaID,
                objAgregar.Calle, objAgregar.Altura, objAgregar.Piso, objAgregar.Departamento,
                objAgregar.LocalidadID, objAgregar.ContactoID);
        }

        public bool Eliminar(BE.Direccion objEliminar)
        {
            return DAOs.Direccion.GetInstance().Eliminar(objEliminar.ID);
        }

        public List<BE.Direccion> Listar()
        {
            return DAOs.Direccion.GetInstance().listarDireccion();
        }

        public List<BE.Direccion> Listar(int id)
        {
            return DAOs.Direccion.GetInstance().listarDireccion(id);
        }
    }
}
