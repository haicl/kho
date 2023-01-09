
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
            this.ucHome1 = new Warehouse1.ucHome();
            this.tabPageData = new System.Windows.Forms.TabPage();
            this.ucData1 = new Warehouse1.ucData();
            this.panelControl2 = new DevExpress.XtraEditors.PanelControl();
            timer1 = new System.Windows.Forms.Timer(this.components);
            this.panelTop.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.panelControl1)).BeginInit();
            this.panelControl1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox2)).BeginInit();
            this.panel1.SuspendLayout();
            this.tabControlMain.SuspendLayout();
            this.tabPageHome.SuspendLayout();
            this.tabPageData.SuspendLayout();
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
            this.panelTop.Name = "panelTop";
            this.panelTop.Size = new System.Drawing.Size(1500, 24);
            this.panelTop.TabIndex = 0;
            // 
            // labelControl1
            // 
            this.labelControl1.Appearance.Font = new System.Drawing.Font("Segoe UI", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.labelControl1.Appearance.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(34)))), ((int)(((byte)(64)))), ((int)(((byte)(89)))));
            this.labelControl1.Appearance.Options.UseFont = true;
            this.labelControl1.Appearance.Options.UseForeColor = true;
            this.labelControl1.Location = new System.Drawing.Point(31, 5);
            this.labelControl1.Name = "labelControl1";
            this.labelControl1.Size = new System.Drawing.Size(125, 15);
            this.labelControl1.TabIndex = 13;
            this.labelControl1.Text = "Phần mềm quản lý kho";
            // 
            // pictureBox1
            // 
            this.pictureBox1.Image = global::Warehouse1.Properties.Resources.icon_intech_group_chuan;
            this.pictureBox1.Location = new System.Drawing.Point(7, 3);
            this.pictureBox1.Name = "pictureBox1";
            this.pictureBox1.Size = new System.Drawing.Size(20, 20);
            this.pictureBox1.SizeMode = System.Windows.Forms.PictureBoxSizeMode.Zoom;
            this.pictureBox1.TabIndex = 12;
            this.pictureBox1.TabStop = false;
            // 
            // panelClose
            // 
            this.panelClose.BackColor = System.Drawing.Color.Transparent;
            this.panelClose.BackgroundImage = global::Warehouse1.Properties.Resources.delete_30px;
            this.panelClose.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Zoom;
            this.panelClose.Location = new System.Drawing.Point(1471, 3);
            this.panelClose.Name = "panelClose";
            this.panelClose.Size = new System.Drawing.Size(20, 20);
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
            this.panelMinimsize.Location = new System.Drawing.Point(1445, 3);
            this.panelMinimsize.Name = "panelMinimsize";
            this.panelMinimsize.Size = new System.Drawing.Size(20, 20);
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
            this.panelControl1.Location = new System.Drawing.Point(0, 24);
            this.panelControl1.LookAndFeel.Style = DevExpress.LookAndFeel.LookAndFeelStyle.Style3D;
            this.panelControl1.LookAndFeel.UseDefaultLookAndFeel = false;
            this.panelControl1.Name = "panelControl1";
            this.panelControl1.Size = new System.Drawing.Size(1500, 60);
            this.panelControl1.TabIndex = 1;
            // 
            // lb_date
            // 
            this.lb_date.AutoSize = true;
            this.lb_date.BackColor = System.Drawing.Color.Transparent;
            this.lb_date.Font = new System.Drawing.Font("Segoe UI", 11.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lb_date.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(34)))), ((int)(((byte)(64)))), ((int)(((byte)(89)))));
            this.lb_date.Location = new System.Drawing.Point(1385, 29);
            this.lb_date.Name = "lb_date";
            this.lb_date.Size = new System.Drawing.Size(95, 20);
            this.lb_date.TabIndex = 6;
            this.lb_date.Text = "00/00/0000";
            // 
            // lb_time
            // 
            this.lb_time.AutoSize = true;
            this.lb_time.BackColor = System.Drawing.Color.Transparent;
            this.lb_time.Font = new System.Drawing.Font("Segoe UI", 11.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lb_time.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(34)))), ((int)(((byte)(64)))), ((int)(((byte)(89)))));
            this.lb_time.Location = new System.Drawing.Point(1397, 10);
            this.lb_time.Name = "lb_time";
            this.lb_time.Size = new System.Drawing.Size(71, 20);
            this.lb_time.TabIndex = 5;
            this.lb_time.Text = "00:00:00";
            // 
            // labelControl2
            // 
            this.labelControl2.Appearance.Font = new System.Drawing.Font("Segoe UI", 21.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.labelControl2.Appearance.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(34)))), ((int)(((byte)(64)))), ((int)(((byte)(89)))));
            this.labelControl2.Appearance.Options.UseFont = true;
            this.labelControl2.Appearance.Options.UseForeColor = true;
            this.labelControl2.Location = new System.Drawing.Point(565, 9);
            this.labelControl2.Name = "labelControl2";
            this.labelControl2.Size = new System.Drawing.Size(371, 40);
            this.labelControl2.TabIndex = 1;
            this.labelControl2.Text = "Hệ Thống Kho Thông Minh";
            // 
            // pictureBox2
            // 
            this.pictureBox2.BackColor = System.Drawing.Color.Transparent;
            this.pictureBox2.Image = global::Warehouse1.Properties.Resources._00_intech_group_chuan_k_nen;
            this.pictureBox2.Location = new System.Drawing.Point(12, 3);
            this.pictureBox2.Name = "pictureBox2";
            this.pictureBox2.Size = new System.Drawing.Size(160, 53);
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
            this.panel1.Location = new System.Drawing.Point(0, 776);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(1500, 24);
            this.panel1.TabIndex = 3;
            // 
            // labelControlUsernameLogin
            // 
            this.labelControlUsernameLogin.Appearance.Font = new System.Drawing.Font("Segoe UI Semibold", 9.75F, ((System.Drawing.FontStyle)((System.Drawing.FontStyle.Bold | System.Drawing.FontStyle.Italic))), System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.labelControlUsernameLogin.Appearance.ForeColor = System.Drawing.SystemColors.ControlDarkDark;
            this.labelControlUsernameLogin.Appearance.Options.UseFont = true;
            this.labelControlUsernameLogin.Appearance.Options.UseForeColor = true;
            this.labelControlUsernameLogin.Location = new System.Drawing.Point(1410, 3);
            this.labelControlUsernameLogin.Name = "labelControlUsernameLogin";
            this.labelControlUsernameLogin.Size = new System.Drawing.Size(58, 17);
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
            this.guna2CircleButtonLogOut.Location = new System.Drawing.Point(1378, 1);
            this.guna2CircleButtonLogOut.Name = "guna2CircleButtonLogOut";
            this.guna2CircleButtonLogOut.ShadowDecoration.Mode = Guna.UI2.WinForms.Enums.ShadowMode.Circle;
            this.guna2CircleButtonLogOut.ShadowDecoration.Parent = this.guna2CircleButtonLogOut;
            this.guna2CircleButtonLogOut.Size = new System.Drawing.Size(22, 22);
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
            this.labelControlPLC.Location = new System.Drawing.Point(35, 4);
            this.labelControlPLC.Name = "labelControlPLC";
            this.labelControlPLC.Size = new System.Drawing.Size(23, 17);
            this.labelControlPLC.TabIndex = 16;
            this.labelControlPLC.Text = "PLC";
            this.labelControlPLC.Click += new System.EventHandler(this.labelControlPLC_Click);
            // 
            // panelConnectPLC
            // 
            this.panelConnectPLC.BackColor = System.Drawing.Color.Transparent;
            this.panelConnectPLC.BackgroundImage = global::Warehouse1.Properties.Resources.filled_circle_Red1_20px;
            this.panelConnectPLC.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Zoom;
            this.panelConnectPLC.Location = new System.Drawing.Point(9, 2);
            this.panelConnectPLC.Name = "panelConnectPLC";
            this.panelConnectPLC.Size = new System.Drawing.Size(20, 20);
            this.panelConnectPLC.TabIndex = 15;
            // 
            // hyperlinkLabelControl1
            // 
            this.hyperlinkLabelControl1.Appearance.Font = new System.Drawing.Font("Segoe UI", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.hyperlinkLabelControl1.Appearance.Options.UseFont = true;
            this.hyperlinkLabelControl1.Location = new System.Drawing.Point(696, 3);
            this.hyperlinkLabelControl1.Name = "hyperlinkLabelControl1";
            this.hyperlinkLabelControl1.Size = new System.Drawing.Size(126, 15);
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
            this.tabControlMain.Size = new System.Drawing.Size(1494, 686);
            this.tabControlMain.TabIndex = 4;
            // 
            // tabPageHome
            // 
            this.tabPageHome.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(234)))), ((int)(((byte)(237)))), ((int)(((byte)(241)))));
            this.tabPageHome.Controls.Add(this.ucHome1);
            this.tabPageHome.ForeColor = System.Drawing.Color.Transparent;
            this.tabPageHome.Location = new System.Drawing.Point(4, 26);
            this.tabPageHome.Name = "tabPageHome";
            this.tabPageHome.Padding = new System.Windows.Forms.Padding(3);
            this.tabPageHome.Size = new System.Drawing.Size(1486, 656);
            this.tabPageHome.TabIndex = 0;
            this.tabPageHome.Text = "Home";
            // 
            // ucHome1
            // 
            this.ucHome1.Font = new System.Drawing.Font("Segoe UI Semibold", 9.75F, System.Drawing.FontStyle.Bold);
            this.ucHome1.Location = new System.Drawing.Point(1, 3);
            this.ucHome1.Margin = new System.Windows.Forms.Padding(4);
            this.ucHome1.MaximumSize = new System.Drawing.Size(1486, 656);
            this.ucHome1.MinimumSize = new System.Drawing.Size(1486, 656);
            this.ucHome1.Name = "ucHome1";
            this.ucHome1.Size = new System.Drawing.Size(1486, 656);
            this.ucHome1.TabIndex = 0;
            this.ucHome1.Load += new System.EventHandler(this.ucHome1_Load);
            // 
            // tabPageData
            // 
            this.tabPageData.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(234)))), ((int)(((byte)(237)))), ((int)(((byte)(241)))));
            this.tabPageData.Controls.Add(this.ucData1);
            this.tabPageData.ForeColor = System.Drawing.Color.Black;
            this.tabPageData.Location = new System.Drawing.Point(4, 26);
            this.tabPageData.Name = "tabPageData";
            this.tabPageData.Padding = new System.Windows.Forms.Padding(3);
            this.tabPageData.Size = new System.Drawing.Size(1486, 656);
            this.tabPageData.TabIndex = 1;
            this.tabPageData.Text = "Data";
            // 
            // ucData1
            // 
            this.ucData1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.ucData1.Font = new System.Drawing.Font("Segoe UI Semibold", 9.75F, System.Drawing.FontStyle.Bold);
            this.ucData1.Location = new System.Drawing.Point(3, 3);
            this.ucData1.Margin = new System.Windows.Forms.Padding(1);
            this.ucData1.MaximumSize = new System.Drawing.Size(1486, 656);
            this.ucData1.MinimumSize = new System.Drawing.Size(1486, 656);
            this.ucData1.Name = "ucData1";
            this.ucData1.Size = new System.Drawing.Size(1486, 656);
            this.ucData1.TabIndex = 0;
            this.ucData1.Load += new System.EventHandler(this.ucData1_Load);
            // 
            // panelControl2
            // 
            this.panelControl2.Appearance.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(236)))), ((int)(((byte)(232)))), ((int)(((byte)(237)))));
            this.panelControl2.Appearance.BackColor2 = System.Drawing.Color.DarkGray;
            this.panelControl2.Appearance.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical;
            this.panelControl2.Appearance.Options.UseBackColor = true;
            this.panelControl2.Controls.Add(this.tabControlMain);
            this.panelControl2.Dock = System.Windows.Forms.DockStyle.Fill;
            this.panelControl2.Location = new System.Drawing.Point(0, 84);
            this.panelControl2.LookAndFeel.Style = DevExpress.LookAndFeel.LookAndFeelStyle.Style3D;
            this.panelControl2.LookAndFeel.UseDefaultLookAndFeel = false;
            this.panelControl2.Name = "panelControl2";
            this.panelControl2.Size = new System.Drawing.Size(1500, 692);
            this.panelControl2.TabIndex = 5;
            // 
            // FormMain
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(234)))), ((int)(((byte)(237)))), ((int)(((byte)(241)))));
            this.ClientSize = new System.Drawing.Size(1500, 800);
            this.Controls.Add(this.panelControl2);
            this.Controls.Add(this.panel1);
            this.Controls.Add(this.panelControl1);
            this.Controls.Add(this.panelTop);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.None;
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.MaximumSize = new System.Drawing.Size(1500, 800);
            this.MinimumSize = new System.Drawing.Size(1500, 800);
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
            this.tabPageHome.ResumeLayout(false);
            this.tabPageData.ResumeLayout(false);
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