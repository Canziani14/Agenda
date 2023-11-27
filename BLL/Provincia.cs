using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class Provincia
    {
        DAL.Provincia DALProvincia = new DAL.Provincia();
        public List<BE.Provincia> Listar()
        {
            return DALProvincia.Listar();
        }
    }
    
}
