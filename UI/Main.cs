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
    public partial class Main : Form
    {
        public Main()
        {
            InitializeComponent();
            this.IsMdiContainer = true;
        }

        private void crearAgendaToolStripMenuItem_Click(object sender, EventArgs e)
        {
            UIAgenda agenda = new UIAgenda();
            agenda.MdiParent = this;
            agenda.Show();
        }

 
        private void localidadToolStripMenuItem_Click(object sender, EventArgs e)
        {
            UILocalidad localidad = new UILocalidad();
            localidad.MdiParent = this;
            localidad.Show();
        }

        private void provinciaToolStripMenuItem_Click(object sender, EventArgs e)
        {
            UIProvincia provincia = new UIProvincia();
            provincia.MdiParent = this;
            provincia.Show();
        }

        private void paisToolStripMenuItem_Click(object sender, EventArgs e)
        {
            UIPais direccion = new UIPais();
            direccion.MdiParent = this;
            direccion.Show();
        }

        private void tipoDeTelefonosToolStripMenuItem_Click(object sender, EventArgs e)
        {
            UITipoDeTelefonos tipoTelefono = new UITipoDeTelefonos();
            tipoTelefono.MdiParent = this;
            tipoTelefono.Show();
        }

        private void contactosPorAgendaToolStripMenuItem_Click(object sender, EventArgs e)
        {
            
            UIListarContactosDeAgenda ListarContactosXAgenda = new UIListarContactosDeAgenda();
            ListarContactosXAgenda.MdiParent = this;
            ListarContactosXAgenda.Show();
        }  
    }
}
