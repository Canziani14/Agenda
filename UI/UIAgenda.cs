using BE;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Drawing.Text;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace UI
{
    public partial class UIAgenda : Form
    {

        
        #region InstanciasAgendas
        BE.Agenda BEAgenda= new BE.Agenda();
        BE.Agenda AgendaSeleccionada = new BE.Agenda();
        BLL.Agenda BLLAgenda = new BLL.Agenda();
        BE.Contacto BEContacto = new BE.Contacto();

        
        #endregion

        #region Constructor
        public UIAgenda()
        {
            

            InitializeComponent();
            BLLAgenda.CantidadContactosEnTabla();
            dtgAgendas.DataSource = BLLAgenda.Listar();  
            txtID.Enabled = false;
            txtCantContactos.Enabled = false;
            

        }

       

       


        #endregion

        #region CrearAgendaUI
        private void btnAgregar_Click(object sender, EventArgs e)
        {
            if (txtDescripcion.Text == "" )
            {
                MessageBox.Show("Por favor, complete todos los campos");
                return;
            }
                  
            try
            {
               
                BEAgenda.Descripcion = txtDescripcion.Text;
                BEAgenda.CantidadDeContactos = 0;

           
            

            if (BLLAgenda.Agregar(BEAgenda))
                {
               
                    MessageBox.Show("Agenda creada con éxito");
                }
                else
                {
                    MessageBox.Show("No se pudo crear la agenda");
                }
            limpiarGrilla();
            limpiartxt();
            }
             catch (Exception ex)
            {
                MessageBox.Show("Error: " + ex.Message);
                return;
            }

        }
        #endregion

        #region Evento10Contactos
        private void BEAgenda_cantidadContactosEvent(int CantidadDeContactos)
        {
            MessageBox.Show("Llegaste a los 10 contactos");
        }
        #endregion

        #region ActualizarAgendaUI


        private void btnModificar_Click(object sender, EventArgs e)
        {
            if (AgendaSeleccionada != null)
            {
                try
                {
                    if (BLLAgenda.Actualizar(new BE.Agenda()
                    {
                        ID = int.Parse(txtID.Text),
                        Descripcion = txtDescripcion.Text,
                        //CantidadDeContactos = int.Parse(txtCantContactos.Text)                      
                    }
            ))
                    {
                        MessageBox.Show("Agenda Actualizada correctamente");
                        limpiarGrilla();
                        limpiartxt();
                    }
                    else
                    {
                        MessageBox.Show("No se pudo modificar la agenda");
                    }
                
                }
                catch (FormatException ex)
                {

                   MessageBox.Show(ex.Message);
                }
            }
        }
        #endregion

        #region EliminarAgendaUI
        private void btnEliminar_Click(object sender, EventArgs e)
        {
        if (MessageBox.Show("¿Seguro desea eliminar esta agenda?", "Eliminar agenda", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == System.Windows.Forms.DialogResult.Yes)
            {
                if (AgendaSeleccionada != null)
                {
                    bool eliminada = BLLAgenda.Eliminar(AgendaSeleccionada);
                    MessageBox.Show(AgendaSeleccionada.Descripcion);
                    try
                    {
                        if (eliminada)
                        {                       
                            limpiarGrilla();
                            limpiartxt();
                        }
                        else
                        {
                            MessageBox.Show("no se puede borrar la agenda");
                        }
                    }
                    catch (Exception ex)
                    {
                        MessageBox.Show("Ha ocurrido un error al borrar la agenda: " + ex.Message);
                    }
                }
                else
                {
                    MessageBox.Show("Seleccione una agenda para borrar");
                }
            }            
        }
        #endregion


        
        
        #region funcionesVarias
 
        private void dtgAgendas_CellDoubleClick(object sender, DataGridViewCellEventArgs e)
        {
            ObtenerAgendaSeleccionada();
            
        }
     

        public BE.Agenda ObtenerAgendaSeleccionada()
        {           
            if (dtgAgendas.SelectedRows.Count > 0)
            {
                AgendaSeleccionada = ((BE.Agenda)dtgAgendas.SelectedRows[0].DataBoundItem);                
                this.CompletarAgenda(AgendaSeleccionada);
            }
            
                return AgendaSeleccionada;
        }
    



        public void CompletarAgenda(BE.Agenda agenda)
        {
            txtID.Text = agenda.ID.ToString();
            txtDescripcion.Text = agenda.Descripcion;
            int cantContactos = obtenerCantidadContactosXAgenda(agenda);
            txtCantContactos.Text = cantContactos.ToString();
            string cantContactosStr = (obtenerCantidadContactosXAgenda(agenda)).ToString();
            txtCantContactos.Text = cantContactosStr;
        }



        private void limpiarGrilla()
        {
            dtgAgendas.DataSource = null;
            dtgAgendas.DataSource = BLLAgenda.Listar();//AgendaSeleccionada.ID);
        }

        private void limpiartxt()
        {
            txtDescripcion.Clear();
            txtID.Clear();
            txtCantContactos.Clear();
        }


        #endregion

 
        
        
        private void btnAgregarContactos_Click(object sender, EventArgs e)
        {
            BE.Agenda agendaSelect = ObtenerAgendaSeleccionada();
            if (agendaSelect != null)
            {
                UIContacto contactoUI = new UIContacto(agendaSelect);

                contactoUI.Show();
            }
            else
            {
                MessageBox.Show("Por favor Seleccione una agenda");
            }           
        }



        private void btnListarContactos_Click(object sender, EventArgs e)
        {

            BLLAgenda.CantidadContactosEnTabla();
            dtgAgendas.DataSource = null;
            dtgAgendas.DataSource = BLLAgenda.Listar();
        }

        
          private int obtenerCantidadContactosXAgenda(BE.Agenda agendaSelect)
          {

              int cantContactosDeAgenda = BLLAgenda.CantidadDeContactos(agendaSelect.ID);
             // txtCantContactos.Text = (BLLAgenda.CantidadDeContactos(AgendaSeleccionada.ID)).ToString();
              return cantContactosDeAgenda;
          }

        private void btnActualizar_Click(object sender, EventArgs e)
        {
            BLLAgenda.CantidadContactosEnTabla();
            dtgAgendas.DataSource = null;
            dtgAgendas.DataSource = BLLAgenda.Listar();
        }
    }
}
