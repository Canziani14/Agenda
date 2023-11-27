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
    public partial class UIListarContactosDeAgenda : Form
    {
        
        public UIListarContactosDeAgenda()
        {
            InitializeComponent();           
        }
        BE.Agenda agenda = new BE.Agenda();
        BLL.Agenda agendaxContacto = new BLL.Agenda();
        private void btnBuscar_Click(object sender, EventArgs e)
        {

            
             try
             {

                 dtgListarContactosDeAgenda.DataSource = agendaxContacto.ListarPorContactos(agenda.Descripcion = agenda.Descripcion = txtID.Text);
             }
             catch (Exception ex)
             {

                 MessageBox.Show(ex.Message);
             }

        }
    }
}
