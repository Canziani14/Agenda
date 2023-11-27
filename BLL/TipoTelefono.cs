using BE;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    
    public class TipoTelefono 
    {
        DAL.tipoTelefono DALTipoTelefono = new DAL.tipoTelefono();

        public List<BE.TipoDeTelefono> Listar()
        {
            return DALTipoTelefono.Listar();
        }
    }
    
}
