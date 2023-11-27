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
    public partial class UIProvincia : Form
    {
        BLL.Provincia BLLProvincia = new BLL.Provincia();
        public UIProvincia()
        {
            InitializeComponent();
            dtgProvincia.DataSource = BLLProvincia.Listar();
        }
    }
}
