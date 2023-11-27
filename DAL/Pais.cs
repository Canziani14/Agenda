using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class Pais
    {
        public List<BE.Pais> Listar()
        {
            return DAOs.Pais.GetInstance().Listar();
        }
    }
}
