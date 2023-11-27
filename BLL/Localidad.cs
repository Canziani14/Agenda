using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class Localidad
    {
        DAL.Localidad DALLocalidad = new DAL.Localidad();
        public List<BE.Localidad> Listar()
        {
            return DALLocalidad.Listar();
        }
    }


}
