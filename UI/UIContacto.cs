using BE;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;


namespace UI
{
    public partial class UIContacto : Form
    {
        

        

        #region Constructor
        public UIContacto(BE.Agenda agendaSelect)
        {
            
            InitializeComponent();
            dtgContactos.DataSource = BLLContacto.Listar(agendaSelect.ID);
            txtID.Enabled = false;
            txtAgenda.Enabled = false;  
            txtAgenda.Text=agendaSelect.Descripcion;
            txtIDAgenda.Text = (agendaSelect.ID).ToString();
            txtIDAgenda.Enabled=false;
            
        }
        #endregion



        #region Instancia
        BE.Contacto BEContacto = new BE.Contacto();
        BE.Contacto ContactoSeleccionado = new BE.Contacto();
        BLL.Contacto BLLContacto = new BLL.Contacto();
        BLL.Agenda BLLAgenda = new BLL.Agenda();
        BE.Agenda BEAgenda = new BE.Agenda();

        UIAgenda agendaSelecc = new UIAgenda();
        #endregion




        #region CrearContactoUI
        private void btnAgregar_Click(object sender, EventArgs e)
        {


            if (txtNombre.Text == "" || txtSegundoNombre.Text == "" || txtApellido.Text == "")
            {
                MessageBox.Show("Por favor, complete todos los campos");
                return;
            }
            try
            {
                BEContacto.Nombre = txtNombre.Text;
                BEContacto.SegungdoNombre = txtSegundoNombre.Text;
                BEContacto.Apellido = txtApellido.Text;
                BEContacto.Agenda = int.Parse(txtIDAgenda.Text);
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error: " + ex.Message);
                return;
            }

            if (BLLContacto.Agregar(BEContacto))
            {
                MessageBox.Show("Contacto creado con exito");
            }
            else
            {
                MessageBox.Show("No se pudo crear la agenda");
            }
            limpiarGrilla(int.Parse(txtIDAgenda.Text));
            limpiartxt();
            BLLAgenda.CantidadContactosEnTabla();
            BLLAgenda.Listar();
            BEAgenda.CantidadContactosEvent += BEAgenda_CantidadContactosEvent;
            
        }

        private void BEAgenda_CantidadContactosEvent(int cantidad)
        {
            MessageBox.Show("¡Se alcanzaron 10 contactos en la agenda!");
        }
        #endregion

        #region ModificarContactoUI
        private void btnModificar_Click(object sender, EventArgs e)
        {
            if (ContactoSeleccionado != null)
            {
                try
                {
                    if (BLLContacto.Actualizar(new BE.Contacto()
                {
                    ID = int.Parse(txtID.Text),
                    Nombre = txtNombre.Text,
                    SegungdoNombre = txtSegundoNombre.Text,
                    Apellido = txtApellido.Text,
                    

                }
            ))
                {
                    MessageBox.Show("Contacto Actualizado correctamente");
                    limpiarGrilla(int.Parse(txtIDAgenda.Text));
                    limpiartxt();
                }
                else
                {
                    MessageBox.Show("No se pudo modificar el Contacto");
                }
                }
                catch (FormatException ex)
                {

                    MessageBox.Show(ex.Message);
                }
            }
        }
        #endregion

        #region EliminarContactoUI
        private void btnEliminar_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("¿Seguro desea eliminar esta contacto?", "Eliminar contacto", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == System.Windows.Forms.DialogResult.Yes)
            {

            
                if (ContactoSeleccionado != null)
                {
                    try
                    {
                        if (BLLContacto.Eliminar(ContactoSeleccionado))
                {
                    MessageBox.Show("Contacto borrado");
                    limpiarGrilla(int.Parse(txtIDAgenda.Text));
                    limpiartxt();
                }
                else
                {
                    MessageBox.Show("no se puede borrar el contacto");
                }
                    }
                    catch (Exception ex)
                    {
                        MessageBox.Show("Ha ocurrido un error al borrar la agenda: " + ex.Message);
                    }
                }
            else
            {
                MessageBox.Show("Seleccione un contacto para borrar");
            }
        }
    }
        #endregion

        

        #region funciones

        private void dtgContactos_CellDoubleClick(object sender, DataGridViewCellEventArgs e)
        {
            if (dtgContactos.SelectedRows.Count > 0)
            {
                ContactoSeleccionado = ((BE.Contacto)dtgContactos.SelectedRows[0].DataBoundItem);
                CompletarContacto(ContactoSeleccionado);
            }
        }


        public void CompletarContacto(BE.Contacto contacto)
        {
            txtID.Text = contacto.ID.ToString();
            txtNombre.Text = contacto.Nombre;
            txtSegundoNombre.Text = contacto.SegungdoNombre;
            txtApellido.Text = contacto.Apellido;
        }



        private void limpiarGrilla(int id)
        {
            dtgContactos.DataSource = null;
            dtgContactos.DataSource = BLLContacto.Listar(id);
                
        }

        private void limpiartxt()
        {
            txtID.Clear();
            txtNombre.Clear();
            txtSegundoNombre.Clear();
            txtApellido.Clear();           
        }


        #endregion

        private void btnAgregarTelefono_Click(object sender, EventArgs e)
        {
            UITelefono telefono = new UITelefono(ContactoSeleccionado.ID);

            telefono.Show();        
        }

        private void btnAgregarDireccion_Click(object sender, EventArgs e)
        {
            UIDireccion direccion = new UIDireccion(ContactoSeleccionado.ID);

            direccion.Show();
        }
    }
}
