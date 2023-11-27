namespace UI
{
    partial class UIPais
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
            this.dtgPais = new System.Windows.Forms.DataGridView();
            ((System.ComponentModel.ISupportInitialize)(this.dtgPais)).BeginInit();
            this.SuspendLayout();
            // 
            // dtgPais
            // 
            this.dtgPais.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dtgPais.Location = new System.Drawing.Point(-2, -1);
            this.dtgPais.Name = "dtgPais";
            this.dtgPais.Size = new System.Drawing.Size(246, 191);
            this.dtgPais.TabIndex = 1;
            // 
            // UIPais
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(246, 190);
            this.Controls.Add(this.dtgPais);
            this.Name = "UIPais";
            this.Text = "Pais";
            ((System.ComponentModel.ISupportInitialize)(this.dtgPais)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.DataGridView dtgPais;
    }
}