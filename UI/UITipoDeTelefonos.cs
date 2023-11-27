using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace UI
{
    public partial class UITipoDeTelefonos : Form
    {
        BLL.TipoTelefono BLLTipoTelefono = new BLL.TipoTelefono();
        public UITipoDeTelefonos()
        {
            InitializeComponent();
            dtgTipoDeTelefonos.DataSource = BLLTipoTelefono.Listar();
        }
    }
}
