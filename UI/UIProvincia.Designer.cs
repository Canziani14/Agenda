namespace UI
{
    partial class UIProvincia
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
            this.dtgProvincia = new System.Windows.Forms.DataGridView();
            ((System.ComponentModel.ISupportInitialize)(this.dtgProvincia)).BeginInit();
            this.SuspendLayout();
            // 
            // dtgProvincia
            // 
            this.dtgProvincia.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dtgProvincia.Location = new System.Drawing.Point(1, -1);
            this.dtgProvincia.Name = "dtgProvincia";
            this.dtgProvincia.Size = new System.Drawing.Size(329, 205);
            this.dtgProvincia.TabIndex = 1;
            // 
            // UIProvincia
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(333, 205);
            this.Controls.Add(this.dtgProvincia);
            this.Name = "UIProvincia";
            this.Text = "Provincia";
            ((System.ComponentModel.ISupportInitialize)(this.dtgProvincia)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.DataGridView dtgProvincia;
    }
}