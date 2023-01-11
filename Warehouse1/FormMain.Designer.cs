
namespace Warehouse1
{
    partial class FormMain
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
            this.components = new System.ComponentModel.Container();
            System.Windows.Forms.Timer timer1;
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(FormMain));
            this.panelTop = new System.Windows.Forms.Panel();
            this.labelControl1 = new DevExpress.XtraEditors.LabelControl();
            this.pictureBox1 = new System.Windows.Forms.PictureBox();
            this.panelClose = new System.Windows.Forms.Panel();
            this.panelMinimsize = new System.Windows.Forms.Panel();
            this.guna2DragControl1 = new Guna.UI2.WinForms.Guna2DragControl(this.components);
            this.panelControl1 = new DevExpress.XtraEditors.PanelControl();
            this.lb_date = new System.Windows.Forms.Label();
            this.lb_time = new System.Windows.Forms.Label();
            this.labelControl2 = new DevExpress.XtraEditors.LabelControl();
            this.pictureBox2 = new System.Windows.Forms.PictureBox();
            this.panel1 = new System.Windows.Forms.Panel();
            this.labelControlUsernameLogin = new DevExpress.XtraEditors.LabelControl();
            this.guna2CircleButtonLogOut = new Guna.UI2.WinForms.Guna2CircleButton();
            this.labelControlPLC = new DevExpress.XtraEditors.LabelControl();
            this.panelConnectPLC = new System.Windows.Forms.Panel();
            this.hyperlinkLabelControl1 = new DevExpress.XtraEditors.HyperlinkLabelControl();
            this.tabControlMain = new System.Windows.Forms.TabControl();
            this.tabPageHome = new System.Windows.Forms.TabPage();
            this.tabPageData = new System.Windows.Forms.TabPage();
            this.panelControl2 = new DevExpress.XtraEditors.PanelControl();
            timer1 = new System.Windows.Forms.Timer(this.components);
            this.panelTop.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.panelControl1)).BeginInit();
            this.panelControl1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox2)).BeginInit();
            this.panel1.SuspendLayout();
            this.tabControlMain.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.panelControl2)).BeginInit();
            this.panelControl2.SuspendLayout();
            this.SuspendLayout();
            // 
            // timer1
            // 
            timer1.Enabled = true;
            timer1.Interval = 300;
            timer1.Tick += new System.EventHandler(this.timer1_Tick);
            // 
            // panelTop
            // 
            this.panelTop.BackColor = System.Drawing.SystemColors.ActiveBorder;
            this.panelTop.Controls.Add(this.labelControl1);
            this.panelTop.Controls.Add(this.pictureBox1);
            this.panelTop.Controls.Add(this.panelClose);
            this.panelTop.Controls.Add(this.panelMinimsize);
            this.panelTop.Dock = System.Windows.Forms.DockStyle.Top;
            this.panelTop.Location = new System.Drawing.Point(0, 0);
            this.panelTop.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.panelTop.Name = "panelTop";
            this.panelTop.Size = new System.Drawing.Size(1942, 30);
            this.panelTop.TabIndex = 0;
            // 
            // labelControl1
            // 
            this.labelControl1.Appearance.Font = new System.Drawing.Font("Segoe UI", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.labelControl1.Appearance.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(34)))), ((int)(((byte)(64)))), ((int)(((byte)(89)))));
            this.labelControl1.Appearance.Options.UseFont = true;
            this.labelControl1.Appearance.Options.UseForeColor = true;
            this.labelControl1.Location = new System.Drawing.Point(41, 6);
            this.labelControl1.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.labelControl1.Name = "labelControl1";
            this.labelControl1.Size = new System.Drawing.Size(160, 20);
            this.labelControl1.TabIndex = 13;
            this.labelControl1.Text = "Phần mềm quản lý kho";
            // 
            // pictureBox1
            // 
            this.pictureBox1.Image = global::Warehouse1.Properties.Resources.icon_intech_group_chuan;
            this.pictureBox1.Location = new System.Drawing.Point(9, 4);
            this.pictureBox1.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.pictureBox1.Name = "pictureBox1";
            this.pictureBox1.Size = new System.Drawing.Size(27, 25);
            this.pictureBox1.SizeMode = System.Windows.Forms.PictureBoxSizeMode.Zoom;
            this.pictureBox1.TabIndex = 12;
            this.pictureBox1.TabStop = false;
            // 
            // panelClose
            // 
            this.panelClose.BackColor = System.Drawing.Color.Transparent;
            this.panelClose.BackgroundImage = global::Warehouse1.Properties.Resources.delete_30px;
            this.panelClose.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Zoom;
            this.panelClose.Location = new System.Drawing.Point(1961, 4);
            this.panelClose.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.panelClose.Name = "panelClose";
            this.panelClose.Size = new System.Drawing.Size(27, 25);
            this.panelClose.TabIndex = 11;
            this.panelClose.Click += new System.EventHandler(this.panelClose_Click);
            this.panelClose.MouseLeave += new System.EventHandler(this.panelClose_MouseLeave);
            this.panelClose.MouseHover += new System.EventHandler(this.panelClose_MouseHover);
            // 
            // panelMinimsize
            // 
            this.panelMinimsize.BackColor = System.Drawing.Color.Transparent;
            this.panelMinimsize.BackgroundImage = global::Warehouse1.Properties.Resources.minus_30px;
            this.panelMinimsize.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Zoom;
            this.panelMinimsize.Location = new System.Drawing.Point(1927, 4);
            this.panelMinimsize.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.panelMinimsize.Name = "panelMinimsize";
            this.panelMinimsize.Size = new System.Drawing.Size(27, 25);
            this.panelMinimsize.TabIndex = 10;
            this.panelMinimsize.Click += new System.EventHandler(this.panelMinimsize_Click);
            this.panelMinimsize.MouseLeave += new System.EventHandler(this.panelMinimsize_MouseLeave);
            this.panelMinimsize.MouseHover += new System.EventHandler(this.panelMinimsize_MouseHover);
            // 
            // guna2DragControl1
            // 
            this.guna2DragControl1.TargetControl = this.panelTop;
            this.guna2DragControl1.UseTransparentDrag = true;
            // 
            // panelControl1
            // 
            this.panelControl1.Appearance.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(234)))), ((int)(((byte)(237)))), ((int)(((byte)(241)))));
            this.panelControl1.Appearance.BackColor2 = System.Drawing.Color.LightGray;
            this.panelControl1.Appearance.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical;
            this.panelControl1.Appearance.Options.UseBackColor = true;
            this.panelControl1.Controls.Add(this.lb_date);
            this.panelControl1.Controls.Add(this.lb_time);
            this.panelControl1.Controls.Add(this.labelControl2);
            this.panelControl1.Controls.Add(this.pictureBox2);
            this.panelControl1.Dock = System.Windows.Forms.DockStyle.Top;
            this.panelControl1.Location = new System.Drawing.Point(0, 30);
            this.panelControl1.LookAndFeel.Style = DevExpress.LookAndFeel.LookAndFeelStyle.Style3D;
            this.panelControl1.LookAndFeel.UseDefaultLookAndFeel = false;
            this.panelControl1.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.panelControl1.Name = "panelControl1";
            this.panelControl1.Size = new System.Drawing.Size(1942, 74);
            this.panelControl1.TabIndex = 1;
            // 
            // lb_date
            // 
            this.lb_date.AutoSize = true;
            this.lb_date.BackColor = System.Drawing.Color.Transparent;
            this.lb_date.Font = new System.Drawing.Font("Segoe UI", 11.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lb_date.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(34)))), ((int)(((byte)(64)))), ((int)(((byte)(89)))));
            this.lb_date.Location = new System.Drawing.Point(1847, 36);
            this.lb_date.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.lb_date.Name = "lb_date";
            this.lb_date.Size = new System.Drawing.Size(116, 25);
            this.lb_date.TabIndex = 6;
            this.lb_date.Text = "00/00/0000";
            // 
            // lb_time
            // 
            this.lb_time.AutoSize = true;
            this.lb_time.BackColor = System.Drawing.Color.Transparent;
            this.lb_time.Font = new System.Drawing.Font("Segoe UI", 11.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lb_time.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(34)))), ((int)(((byte)(64)))), ((int)(((byte)(89)))));
            this.lb_time.Location = new System.Drawing.Point(1863, 12);
            this.lb_time.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.lb_time.Name = "lb_time";
            this.lb_time.Size = new System.Drawing.Size(88, 25);
            this.lb_time.TabIndex = 5;
            this.lb_time.Text = "00:00:00";
            // 
            // labelControl2
            // 
            this.labelControl2.Appearance.Font = new System.Drawing.Font("Segoe UI", 21.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.labelControl2.Appearance.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(34)))), ((int)(((byte)(64)))), ((int)(((byte)(89)))));
            this.labelControl2.Appearance.Options.UseFont = true;
            this.labelControl2.Appearance.Options.UseForeColor = true;
            this.labelControl2.Location = new System.Drawing.Point(753, 11);
            this.labelControl2.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.labelControl2.Name = "labelControl2";
            this.labelControl2.Size = new System.Drawing.Size(471, 50);
            this.labelControl2.TabIndex = 1;
            this.labelControl2.Text = "Hệ Thống Kho Thông Minh";
            // 
            // pictureBox2
            // 
            this.pictureBox2.BackColor = System.Drawing.Color.Transparent;
            this.pictureBox2.Image = global::Warehouse1.Properties.Resources._00_intech_group_chuan_k_nen;
            this.pictureBox2.Location = new System.Drawing.Point(16, 4);
            this.pictureBox2.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.pictureBox2.Name = "pictureBox2";
            this.pictureBox2.Size = new System.Drawing.Size(213, 65);
            this.pictureBox2.SizeMode = System.Windows.Forms.PictureBoxSizeMode.Zoom;
            this.pictureBox2.TabIndex = 0;
            this.pictureBox2.TabStop = false;
            // 
            // panel1
            // 
            this.panel1.Controls.Add(this.labelControlUsernameLogin);
            this.panel1.Controls.Add(this.guna2CircleButtonLogOut);
            this.panel1.Controls.Add(this.labelControlPLC);
            this.panel1.Controls.Add(this.panelConnectPLC);
            this.panel1.Controls.Add(this.hyperlinkLabelControl1);
            this.panel1.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.panel1.Location = new System.Drawing.Point(0, 955);
            this.panel1.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(1942, 30);
            this.panel1.TabIndex = 3;
            // 
            // labelControlUsernameLogin
            // 
            this.labelControlUsernameLogin.Appearance.Font = new System.Drawing.Font("Segoe UI Semibold", 9.75F, ((System.Drawing.FontStyle)((System.Drawing.FontStyle.Bold | System.Drawing.FontStyle.Italic))), System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.labelControlUsernameLogin.Appearance.ForeColor = System.Drawing.SystemColors.ControlDarkDark;
            this.labelControlUsernameLogin.Appearance.Options.UseFont = true;
            this.labelControlUsernameLogin.Appearance.Options.UseForeColor = true;
            this.labelControlUsernameLogin.Location = new System.Drawing.Point(1880, 4);
            this.labelControlUsernameLogin.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.labelControlUsernameLogin.Name = "labelControlUsernameLogin";
            this.labelControlUsernameLogin.Size = new System.Drawing.Size(70, 21);
            this.labelControlUsernameLogin.TabIndex = 18;
            this.labelControlUsernameLogin.Text = "username";
            // 
            // guna2CircleButtonLogOut
            // 
            this.guna2CircleButtonLogOut.Animated = true;
            this.guna2CircleButtonLogOut.BackColor = System.Drawing.Color.Transparent;
            this.guna2CircleButtonLogOut.CheckedState.Parent = this.guna2CircleButtonLogOut;
            this.guna2CircleButtonLogOut.CustomImages.Parent = this.guna2CircleButtonLogOut;
            this.guna2CircleButtonLogOut.FillColor = System.Drawing.Color.Transparent;
            this.guna2CircleButtonLogOut.Font = new System.Drawing.Font("Segoe UI", 9F);
            this.guna2CircleButtonLogOut.ForeColor = System.Drawing.Color.Transparent;
            this.guna2CircleButtonLogOut.HoverState.Parent = this.guna2CircleButtonLogOut;
            this.guna2CircleButtonLogOut.Image = global::Warehouse1.Properties.Resources.icons8_logout_rounded_left_20px;
            this.guna2CircleButtonLogOut.Location = new System.Drawing.Point(1837, 1);
            this.guna2CircleButtonLogOut.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.guna2CircleButtonLogOut.Name = "guna2CircleButtonLogOut";
            this.guna2CircleButtonLogOut.ShadowDecoration.Mode = Guna.UI2.WinForms.Enums.ShadowMode.Circle;
            this.guna2CircleButtonLogOut.ShadowDecoration.Parent = this.guna2CircleButtonLogOut;
            this.guna2CircleButtonLogOut.Size = new System.Drawing.Size(29, 27);
            this.guna2CircleButtonLogOut.TabIndex = 17;
            this.guna2CircleButtonLogOut.UseTransparentBackground = true;
            this.guna2CircleButtonLogOut.Click += new System.EventHandler(this.guna2CircleButton1_Click);
            // 
            // labelControlPLC
            // 
            this.labelControlPLC.Appearance.Font = new System.Drawing.Font("Segoe UI", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.labelControlPLC.Appearance.ForeColor = System.Drawing.SystemColors.ControlDarkDark;
            this.labelControlPLC.Appearance.Options.UseFont = true;
            this.labelControlPLC.Appearance.Options.UseForeColor = true;
            this.labelControlPLC.Location = new System.Drawing.Point(47, 5);
            this.labelControlPLC.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.labelControlPLC.Name = "labelControlPLC";
            this.labelControlPLC.Size = new System.Drawing.Size(28, 21);
            this.labelControlPLC.TabIndex = 16;
            this.labelControlPLC.Text = "PLC";
            this.labelControlPLC.Click += new System.EventHandler(this.labelControlPLC_Click);
            // 
            // panelConnectPLC
            // 
            this.panelConnectPLC.BackColor = System.Drawing.Color.Transparent;
            this.panelConnectPLC.BackgroundImage = global::Warehouse1.Properties.Resources.filled_circle_Red1_20px;
            this.panelConnectPLC.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Zoom;
            this.panelConnectPLC.Location = new System.Drawing.Point(12, 2);
            this.panelConnectPLC.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.panelConnectPLC.Name = "panelConnectPLC";
            this.panelConnectPLC.Size = new System.Drawing.Size(27, 25);
            this.panelConnectPLC.TabIndex = 15;
            // 
            // hyperlinkLabelControl1
            // 
            this.hyperlinkLabelControl1.Appearance.Font = new System.Drawing.Font("Segoe UI", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.hyperlinkLabelControl1.Appearance.Options.UseFont = true;
            this.hyperlinkLabelControl1.Location = new System.Drawing.Point(928, 4);
            this.hyperlinkLabelControl1.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.hyperlinkLabelControl1.Name = "hyperlinkLabelControl1";
            this.hyperlinkLabelControl1.Size = new System.Drawing.Size(152, 20);
            this.hyperlinkLabelControl1.TabIndex = 0;
            this.hyperlinkLabelControl1.Text = "https://Intech-group.vn";
            this.hyperlinkLabelControl1.Click += new System.EventHandler(this.hyperlinkLabelControl1_Click);
            // 
            // tabControlMain
            // 
            this.tabControlMain.Controls.Add(this.tabPageHome);
            this.tabControlMain.Controls.Add(this.tabPageData);
            this.tabControlMain.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tabControlMain.Font = new System.Drawing.Font("Segoe UI Semibold", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.tabControlMain.Location = new System.Drawing.Point(3, 3);
            this.tabControlMain.Margin = new System.Windows.Forms.Padding(1);
            this.tabControlMain.Name = "tabControlMain";
            this.tabControlMain.SelectedIndex = 0;
            this.tabControlMain.Size = new System.Drawing.Size(1936, 845);
            this.tabControlMain.TabIndex = 4;
            // 
            // tabPageHome
            // 
            this.tabPageHome.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(234)))), ((int)(((byte)(237)))), ((int)(((byte)(241)))));
            this.tabPageHome.ForeColor = System.Drawing.Color.Transparent;
            this.tabPageHome.Location = new System.Drawing.Point(4, 30);
            this.tabPageHome.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.tabPageHome.Name = "tabPageHome";
            this.tabPageHome.Padding = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.tabPageHome.Size = new System.Drawing.Size(1928, 811);
            this.tabPageHome.TabIndex = 0;
            this.tabPageHome.Text = "Home";
            this.tabPageHome.Click += new System.EventHandler(this.tabPageHome_Click);
            // 
            // tabPageData
            // 
            this.tabPageData.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(234)))), ((int)(((byte)(237)))), ((int)(((byte)(241)))));
            this.tabPageData.ForeColor = System.Drawing.Color.Black;
            this.tabPageData.Location = new System.Drawing.Point(4, 30);
            this.tabPageData.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.tabPageData.Name = "tabPageData";
            this.tabPageData.Padding = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.tabPageData.Size = new System.Drawing.Size(1928, 811);
            this.tabPageData.TabIndex = 1;
            this.tabPageData.Text = "Data";
            // 
            // panelControl2
            // 
            this.panelControl2.Appearance.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(236)))), ((int)(((byte)(232)))), ((int)(((byte)(237)))));
            this.panelControl2.Appearance.BackColor2 = System.Drawing.Color.DarkGray;
            this.panelControl2.Appearance.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical;
            this.panelControl2.Appearance.Options.UseBackColor = true;
            this.panelControl2.Controls.Add(this.tabControlMain);
            this.panelControl2.Dock = System.Windows.Forms.DockStyle.Fill;
            this.panelControl2.Location = new System.Drawing.Point(0, 104);
            this.panelControl2.LookAndFeel.Style = DevExpress.LookAndFeel.LookAndFeelStyle.Style3D;
            this.panelControl2.LookAndFeel.UseDefaultLookAndFeel = false;
            this.panelControl2.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.panelControl2.Name = "panelControl2";
            this.panelControl2.Size = new System.Drawing.Size(1942, 851);
            this.panelControl2.TabIndex = 5;
            // 
            // FormMain
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(234)))), ((int)(((byte)(237)))), ((int)(((byte)(241)))));
            this.ClientSize = new System.Drawing.Size(1942, 985);
            this.Controls.Add(this.panelControl2);
            this.Controls.Add(this.panel1);
            this.Controls.Add(this.panelControl1);
            this.Controls.Add(this.panelTop);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.None;
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.MaximumSize = new System.Drawing.Size(2000, 985);
            this.MinimumSize = new System.Drawing.Size(1918, 985);
            this.Name = "FormMain";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Phần mềm quản lý kho";
            this.Load += new System.EventHandler(this.FormMain_Load);
            this.panelTop.ResumeLayout(false);
            this.panelTop.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.panelControl1)).EndInit();
            this.panelControl1.ResumeLayout(false);
            this.panelControl1.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox2)).EndInit();
            this.panel1.ResumeLayout(false);
            this.panel1.PerformLayout();
            this.tabControlMain.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.panelControl2)).EndInit();
            this.panelControl2.ResumeLayout(false);
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Panel panelTop;
        private Guna.UI2.WinForms.Guna2DragControl guna2DragControl1;
        private System.Windows.Forms.Panel panelClose;
        private System.Windows.Forms.Panel panelMinimsize;
        private System.Windows.Forms.PictureBox pictureBox1;
        private DevExpress.XtraEditors.PanelControl panelControl1;
        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.TabControl tabControlMain;
        private System.Windows.Forms.TabPage tabPageHome;
        private System.Windows.Forms.TabPage tabPageData;
        private DevExpress.XtraEditors.LabelControl labelControl1;
        private DevExpress.XtraEditors.LabelControl labelControl2;
        private System.Windows.Forms.PictureBox pictureBox2;
        private System.Windows.Forms.Label lb_date;
        private System.Windows.Forms.Label lb_time;
        private DevExpress.XtraEditors.PanelControl panelControl2;
        private DevExpress.XtraEditors.HyperlinkLabelControl hyperlinkLabelControl1;
        private System.Windows.Forms.Panel panelConnectPLC;
        private DevExpress.XtraEditors.LabelControl labelControlPLC;
        private Guna.UI2.WinForms.Guna2CircleButton guna2CircleButtonLogOut;
        private DevExpress.XtraEditors.LabelControl labelControlUsernameLogin;
        private ucHome ucHome1;
        private ucData ucData1;
    }
}