using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class Localidad 
    {
        public List<BE.Localidad> Listar()
        {
            return DAOs.Localidad.GetInstance().Listar();
        }
    }
}
