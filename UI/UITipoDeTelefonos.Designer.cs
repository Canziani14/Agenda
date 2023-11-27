namespace UI
{
    partial class UITipoDeTelefonos
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
            this.dtgTipoDeTelefonos = new System.Windows.Forms.DataGridView();
            ((System.ComponentModel.ISupportInitialize)(this.dtgTipoDeTelefonos)).BeginInit();
            this.SuspendLayout();
            // 
            // dtgTipoDeTelefonos
            // 
            this.dtgTipoDeTelefonos.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dtgTipoDeTelefonos.Location = new System.Drawing.Point(-3, -2);
            this.dtgTipoDeTelefonos.Name = "dtgTipoDeTelefonos";
            this.dtgTipoDeTelefonos.Size = new System.Drawing.Size(230, 213);
            this.dtgTipoDeTelefonos.TabIndex = 0;
            // 
            // UITipoDeTelefonos
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(230, 213);
            this.Controls.Add(this.dtgTipoDeTelefonos);
            this.Name = "UITipoDeTelefonos";
            this.Text = "TipoDeTelefonos";
            ((System.ComponentModel.ISupportInitialize)(this.dtgTipoDeTelefonos)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.DataGridView dtgTipoDeTelefonos;
    }
}