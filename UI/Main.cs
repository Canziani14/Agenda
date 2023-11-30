using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using MetroFramework.Components;
using MetroFramework.Controls;
using MetroFramework.Forms;


namespace UI
{
    public partial class Main : MetroForm
    {
      

        public Main()
        {
            InitializeComponent();
            MetroFramework.MetroThemeStyle theme = MetroFramework.MetroThemeStyle.Dark;
            MetroFramework.MetroColorStyle style = MetroFramework.MetroColorStyle.Green;

            MetroFramework.Components.MetroStyleManager manager = new MetroFramework.Components.MetroStyleManager();
            manager.Theme = theme;
            manager.Style = style;
            

        }

        private void crearAgendaToolStripMenuItem_Click(object sender, EventArgs e)
        {
            UIAgenda agenda = new UIAgenda();
            agenda.MdiParent = this;
            agenda.Show();
        }

        
    }
    
}
