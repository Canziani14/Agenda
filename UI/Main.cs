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

    }
}
