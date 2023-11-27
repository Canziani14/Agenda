namespace UI
{
    partial class UILocalidad
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.dtgLocalidad = new System.Windows.Forms.DataGridView();
            ((System.ComponentModel.ISupportInitialize)(this.dtgLocalidad)).BeginInit();
            this.SuspendLayout();
            // 
            // dtgLocalidad
            // 
            this.dtgLocalidad.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dtgLocalidad.Location = new System.Drawing.Point(3, 2);
            this.dtgLocalidad.Name = "dtgLocalidad";
            this.dtgLocalidad.Size = new System.Drawing.Size(415, 205);
            this.dtgLocalidad.TabIndex = 0;
            // 
            // UILocalidad
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(418, 209);
            this.Controls.Add(this.dtgLocalidad);
            this.Name = "UILocalidad";
            this.Text = "Localidad";
            ((System.ComponentModel.ISupportInitialize)(this.dtgLocalidad)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.DataGridView dtgLocalidad;
    }
}