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
    public partial class UIDireccion : Form
    {
        #region InstanciasDirecciones
        BE.Direccion BEDireccion = new BE.Direccion();
        BE.Direccion DireccionSeleccionada = new BE.Direccion();
        BLL.Direccion BLLDireccion = new BLL.Direccion();

        BLL.Localidad BLLLocalidad = new BLL.Localidad();
        BLL.Provincia BLLProvincia = new BLL.Provincia();
        BLL.Pais BLLPais = new BLL.Pais();

        BE.Pais pais;
        BE.Provincia provincia;
        BE.Localidad localidad;

        
        #endregion

        #region Consructor
        public UIDireccion(int id)
        {
            InitializeComponent();
            txtID.Enabled = false;
            dtgDirecciones.DataSource = BLLDireccion.Listar(id);


            var provincias = BLLProvincia.Listar();
            var nombreProvincia = provincias.Where(provincia => provincia.Nombre != null).Select(provincia => provincia.Nombre).ToList();
            cmbProvincia.DataSource = nombreProvincia;
            

            var paises = BLLPais.Listar();
            var nombresPaises = paises.Where(pais => pais.Nombre != null).Select(pais => pais.Nombre).ToList();
            cmbPais.DataSource = nombresPaises;

            var localidades = BLLLocalidad.Listar();
            var nombreLocalidades = localidades.Where(localidade => localidade.Nombre != null).Select(localidade => localidade.Nombre).ToList();
            cmbLocalidad.DataSource = nombreLocalidades;





        }
        #endregion

        #region AgregarDireccionUI
        private void btnAgregar_Click(object sender, EventArgs e)
        {
            if (String.IsNullOrEmpty(txtCalle.Text) || String.IsNullOrEmpty(txtAltura.Text) || String.IsNullOrEmpty(txtPiso.Text) || String.IsNullOrEmpty(txtDepartamento.Text))
            {
                MessageBox.Show("Por favor, complete todos los campos");
                return;
            }
            try
            {
                BEDireccion.Calle = txtCalle.Text;
                BEDireccion.Altura = int.Parse(txtAltura.Text);
                BEDireccion.Piso = txtPiso.Text;
                BEDireccion.Departamento = txtDepartamento.Text;


                BEDireccion.LocalidadID = localidad.ID;
                BEDireccion.ProvinciaID = provincia.ID;
                BEDireccion.PaisID = pais.ID;
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error: " + ex.Message);
                return;
            }
            if (BLLDireccion.Agregar(BEDireccion))
            {
                MessageBox.Show("Direccion creada con exito");
            }
            else
            {
                MessageBox.Show("No se pudo crear la direccion");
            }
            limpiarGrilla();
            limpiartxt();
        }
        #endregion

        #region ModificarDireccionUI
        private void btnModificar_Click(object sender, EventArgs e)
        {
            
            if (DireccionSeleccionada != null)
            {
                try
                {
                    if (BLLDireccion.Actualizar(new BE.Direccion()
                    {
                        ID = int.Parse(txtID.Text),
                        Calle = txtCalle.Text,
                        Altura = int.Parse(txtAltura.Text),
                        Piso = txtPiso.Text,
                        Departamento = txtDepartamento.Text,
                        //Localidad = int.Parse(txtLocalidad.Text),
                        //Provincia = int.Parse(txtProvincia.Text),
                       // Pais = int.Parse(txtPais.Text),
                       // Contacto = int.Parse(txtContacto.Text)
                    }
            ))
                    {
                        MessageBox.Show("Direccion Actualizada correctamente");
                        limpiarGrilla();
                        limpiartxt();
                    }
                    else
                    {
                        MessageBox.Show("No se pudo modificar la direccion");
                    }
                
                }
                catch (FormatException ex)
                {

                    MessageBox.Show(ex.Message);
                }
            }
        }
        #endregion

        #region EliminarDireccionUI
        private void btnEliminar_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("¿Seguro desea eliminar esta direccion?", "Eliminar direccion", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == System.Windows.Forms.DialogResult.Yes)
            {

           
                if (DireccionSeleccionada != null)
                {
                    try
                    {
                        if (BLLDireccion.Eliminar(DireccionSeleccionada))
                {
                    MessageBox.Show("Direccion borrada");
                    limpiarGrilla();
                    limpiartxt();
                }
                else
                {
                    MessageBox.Show("no se puede borrar la direccion");
                }
                    }
                    catch (Exception ex)
                    {
                        MessageBox.Show("Ha ocurrido un error al borrar la agenda: " + ex.Message);
                    }
                }
            else
            {
                MessageBox.Show("Seleccione una direccion para borrar");
            }
            }            
        }
        #endregion

        #region funciones

        private void dtgDireccion_CellDoubleClick(object sender, DataGridViewCellEventArgs e)
        {
            if (dtgDirecciones.SelectedRows.Count > 0)
            {
                DireccionSeleccionada = ((BE.Direccion)dtgDirecciones.SelectedRows[0].DataBoundItem);
                CompletarDireccion(DireccionSeleccionada);
            }
        }

        public void CompletarDireccion(BE.Direccion direccion)
        {
            txtID.Text = (direccion.ID).ToString();             
            txtCalle.Text = direccion.Calle;
            txtAltura.Text = direccion.Altura.ToString();

            if (direccion.Piso != null )
            {
                txtPiso.Text = direccion.Piso.ToString();
            }
            else
            {
                txtPiso.Text = string.Empty; // O puedes asignar null si realmente deseas que sea null
            }

            txtDepartamento.Text = direccion.Departamento;


            cmbPais.Text = direccion.PaisID.ToString();
            cmbProvincia.Text = direccion.ProvinciaID.ToString();
            cmbLocalidad.Text = direccion.LocalidadID.ToString();
        }

        private void limpiarGrilla()
        {
        dtgDirecciones.DataSource = null;
        dtgDirecciones.DataSource = BLLDireccion.Listar();
        }

        private void limpiartxt()
        {
            txtID.Clear();
            txtCalle.Clear();
            txtAltura.Clear();
            txtPiso.Clear();
            txtDepartamento.Clear();
           
        }



        #endregion

/*
        private void cmbPais_SelectedIndexChanged(object sender, EventArgs e)
        {
            pais = (BE.Pais)((ComboBox)sender).SelectedItem;
        }

        private void cmbProvincia_SelectedIndexChanged(object sender, EventArgs e)
        {
            provincia = (BE.Provincia)((ComboBox)sender).SelectedItem;
        }
      
        private void cmbLocalidad_SelectedIndexChanged(object sender, EventArgs e)
        {
            localidad = (BE.Localidad)((ComboBox)sender).SelectedItem;
        }*/
    }
}
