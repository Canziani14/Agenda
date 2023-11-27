using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class Provincia 
    {
        public List<BE.Provincia> Listar()
        {
            return DAOs.Provincia.GetInstance().Listar();
        }

    }
}
