using BE;
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
    public partial class UITelefono : Form
    {

        #region InstanciasTelefonos
        BE.TipoDeTelefono tipo;
        BE.Telefono BETelefono = new BE.Telefono();
        BE.Telefono TelefonoSeleccionado = new BE.Telefono();
        BLL.Telefono BLLTelefono = new BLL.Telefono();
        BLL.TipoTelefono BLLTipoDeTelefono = new BLL.TipoTelefono();
        #endregion

        #region Constructor
        public UITelefono(int id)
        {            
            InitializeComponent();
            dtgTelefonos.DataSource = BLLTelefono.Listar(id);

            txtID.Enabled = false;
            cmboxTiposTelefonos.DataSource = BLLTipoDeTelefono.Listar();
            cmboxTiposTelefonos.DisplayMember = "Tipo";
            BETelefono.ContactoID = id;
        }
        #endregion





        #region AgregarTelefonoUI
        private void btnAgregar_Click(object sender, EventArgs e)
        {
            if (txtNumero.Text == "" || cmboxTiposTelefonos == null )
            {
                MessageBox.Show("Por favor, complete todos los campos");
                return;
            }
            try
            {            
                BETelefono.Numero = txtNumero.Text;
                BETelefono.TipoDeTelefonoID = tipo.ID;
                 
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error: " + ex.Message);
                return;
            }
            if (BLLTelefono.Agregar(BETelefono))
            {
                MessageBox.Show("Telefono creado con exito");
            }
            else
            {
                MessageBox.Show("No se pudo crear el Telefono");
            }
            limpiarGrilla();
            limpiartxt();
        }
        #endregion

        #region ModificarTelefonoUI
        private void btnModificar_Click(object sender, EventArgs e)
        {
            if (TelefonoSeleccionado != null)
            {
                try
                {
                    if (BLLTelefono.Actualizar(new BE.Telefono()
                {
                    ID = int.Parse(txtID.Text),
                    //tipo = int.Parse(txtTipoTelefono.Text),
                    Numero=txtNumero.Text,
                   // idContacto=int.Parse(txtContacto.Text)

                }
            ))
                {
                    MessageBox.Show("Telefono Actualizado correctamente");
                    limpiarGrilla();
                    limpiartxt();
                }
                else
                {
                    MessageBox.Show("No se pudo modificar el Telefono");
                }
                }
                catch (FormatException ex)
                {

                    MessageBox.Show(ex.Message);
                }
            }
        }
        #endregion

        #region EliminarTelefonoUI
        private void btnEliminar_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("¿Seguro desea eliminar este telefono?", "Eliminar telefono", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == System.Windows.Forms.DialogResult.Yes)
            {

                if (TelefonoSeleccionado != null)
                {
                    try
                    {
                        if (BLLTelefono.Eliminar(TelefonoSeleccionado))
                {
                    MessageBox.Show("Telefono borrado");
                    limpiarGrilla();
                    limpiartxt();
                }
                else
                {
                    MessageBox.Show("no se puede borrar el Telefono");
                }
                    }
                    catch (Exception ex)
                    {
                        MessageBox.Show("Ha ocurrido un error al borrar la agenda: " + ex.Message);
                    }
                }
            else
            {
                MessageBox.Show("Seleccione un telefono para borrar");
            }
        }
    }
        #endregion

        #region funciones
        private void dtgTelefonos_CellDoubleClick(object sender, DataGridViewCellEventArgs e)
        {
            if (dtgTelefonos.SelectedRows.Count > 0)
            {
                TelefonoSeleccionado = ((BE.Telefono)dtgTelefonos.SelectedRows[0].DataBoundItem);
                CompletarTelefono(TelefonoSeleccionado);
            }
        }

        public void CompletarTelefono(BE.Telefono telefono)
        {
            txtID.Text = telefono.ID.ToString();
           // txtContacto.Text = telefono.idContacto.ToString();
            txtNumero.Text = telefono.Numero.ToString();
           // txtTipoTelefono.Text = telefono.tipo.ToString();
        }



        private void limpiarGrilla()
        {
            dtgTelefonos.DataSource = null;
            dtgTelefonos.DataSource = BLLTelefono.Listar(BETelefono.ContactoID);
            cmboxTiposTelefonos.DataSource = null;
            cmboxTiposTelefonos.DataSource = BLLTipoDeTelefono.Listar();
            cmboxTiposTelefonos.DisplayMember = "Tipo";
        }

        private void limpiartxt()
        {
            txtID.Clear();         
            txtNumero.Clear();
            cmboxTiposTelefonos = null;
        }


        #endregion

        private void cmboxTiposTelefonos_SelectedIndexChanged(object sender, EventArgs e)
        {
            tipo =  (BE.TipoDeTelefono)((ComboBox)sender).SelectedItem;
        }
    }
}
