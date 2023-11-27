using BE;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class tipoTelefono 
    {
        
        public List<BE.TipoDeTelefono> Listar()
        {
            return DAOs.TipoTelefono.GetInstance().Listar();
        }
    }
}
