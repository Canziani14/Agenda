using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class Pais
    {
        DAL.Pais DALPais = new DAL.Pais();
        public List<BE.Pais> Listar()
        {
            return DALPais.Listar();
        }
    }
}
