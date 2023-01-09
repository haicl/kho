
namespace Warehouse1
{
    partial class FormLogin
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
            DevExpress.XtraSplashScreen.SplashScreenManager splashScreenManager1 = new DevExpress.XtraSplashScreen.SplashScreenManager(this, typeof(global::Warehouse1.SplashScreen1), true, true);
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(FormLogin));
            this.guna2Elipse1 = new Guna.UI2.WinForms.Guna2Elipse(this.components);
            this.guna2DragControl1 = new Guna.UI2.WinForms.Guna2DragControl(this.components);
            this.guna2Elipse2 = new Guna.UI2.WinForms.Guna2Elipse(this.components);
            this.guna2ButtonLogin = new Guna.UI2.WinForms.Guna2Button();
            this.panelControlLogin = new DevExpress.XtraEditors.PanelControl();
            this.panelConnectDatabase = new System.Windows.Forms.Panel();
            this.labelControlLoiDangNhap = new DevExpress.XtraEditors.LabelControl();
            this.hyperlinkLabelControl1 = new DevExpress.XtraEditors.HyperlinkLabelControl();
            this.panelSetting = new System.Windows.Forms.Panel();
            this.panelClose = new System.Windows.Forms.Panel();
            this.panelMinimsize = new System.Windows.Forms.Panel();
            this.checkBoxRemember = new System.Windows.Forms.CheckBox();
            this.panel1 = new System.Windows.Forms.Panel();
            this.guna2TextBoxPass = new Guna.UI2.WinForms.Guna2TextBox();
            this.guna2TextBoxUserName = new Guna.UI2.WinForms.Guna2TextBox();
            this.pictureBox1 = new System.Windows.Forms.PictureBox();
            this.guna2DragControl2 = new Guna.UI2.WinForms.Guna2DragControl(this.components);
            this.timer1 = new System.Windows.Forms.Timer(this.components);
            this.label1 = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.panelControlLogin)).BeginInit();
            this.panelControlLogin.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).BeginInit();
            this.SuspendLayout();
            // 
            // splashScreenManager1
            // 
            splashScreenManager1.ClosingDelay = 5;
            // 
            // guna2Elipse1
            // 
            this.guna2Elipse1.BorderRadius = 16;
            this.guna2Elipse1.TargetControl = this;
            // 
            // guna2DragControl1
            // 
            this.guna2DragControl1.TargetControl = this;
            this.guna2DragControl1.UseTransparentDrag = true;
            // 
            // guna2Elipse2
            // 
            this.guna2Elipse2.BorderRadius = 66;
            // 
            // guna2ButtonLogin
            // 
            this.guna2ButtonLogin.BackColor = System.Drawing.Color.Transparent;
            this.guna2ButtonLogin.BorderRadius = 27;
            this.guna2ButtonLogin.BorderStyle = System.Drawing.Drawing2D.DashStyle.Dash;
            this.guna2ButtonLogin.CheckedState.Parent = this.guna2ButtonLogin;
            this.guna2ButtonLogin.CustomBorderColor = System.Drawing.Color.Transparent;
            this.guna2ButtonLogin.CustomImages.Parent = this.guna2ButtonLogin;
            this.guna2ButtonLogin.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(34)))), ((int)(((byte)(64)))), ((int)(((byte)(89)))));
            this.guna2ButtonLogin.Font = new System.Drawing.Font("Segoe UI", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.guna2ButtonLogin.ForeColor = System.Drawing.SystemColors.ControlLight;
            this.guna2ButtonLogin.HoverState.Parent = this.guna2ButtonLogin;
            this.guna2ButtonLogin.Location = new System.Drawing.Point(194, 319);
            this.guna2ButtonLogin.Name = "guna2ButtonLogin";
            this.guna2ButtonLogin.ShadowDecoration.Parent = this.guna2ButtonLogin;
            this.guna2ButtonLogin.Size = new System.Drawing.Size(190, 54);
            this.guna2ButtonLogin.TabIndex = 4;
            this.guna2ButtonLogin.Text = "Đăng nhập";
            this.guna2ButtonLogin.Click += new System.EventHandler(this.guna2ButtonLogin_Click);
            // 
            // panelControlLogin
            // 
            this.panelControlLogin.Appearance.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(236)))), ((int)(((byte)(232)))), ((int)(((byte)(237)))));
            this.panelControlLogin.Appearance.BackColor2 = System.Drawing.Color.Gray;
            this.panelControlLogin.Appearance.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Vertical;
            this.panelControlLogin.Appearance.Options.UseBackColor = true;
            this.panelControlLogin.BorderStyle = DevExpress.XtraEditors.Controls.BorderStyles.Simple;
            this.panelControlLogin.Controls.Add(this.label1);
            this.panelControlLogin.Controls.Add(this.panelConnectDatabase);
            this.panelControlLogin.Controls.Add(this.labelControlLoiDangNhap);
            this.panelControlLogin.Controls.Add(this.hyperlinkLabelControl1);
            this.panelControlLogin.Controls.Add(this.panelSetting);
            this.panelControlLogin.Controls.Add(this.panelClose);
            this.panelControlLogin.Controls.Add(this.panelMinimsize);
            this.panelControlLogin.Controls.Add(this.checkBoxRemember);
            this.panelControlLogin.Controls.Add(this.guna2ButtonLogin);
            this.panelControlLogin.Controls.Add(this.panel1);
            this.panelControlLogin.Controls.Add(this.guna2TextBoxPass);
            this.panelControlLogin.Controls.Add(this.guna2TextBoxUserName);
            this.panelControlLogin.Controls.Add(this.pictureBox1);
            this.panelControlLogin.Dock = System.Windows.Forms.DockStyle.Fill;
            this.panelControlLogin.Location = new System.Drawing.Point(0, 0);
            this.panelControlLogin.LookAndFeel.SkinMaskColor = System.Drawing.Color.Red;
            this.panelControlLogin.LookAndFeel.SkinName = "Office 2019 Black";
            this.panelControlLogin.LookAndFeel.Style = DevExpress.LookAndFeel.LookAndFeelStyle.Style3D;
            this.panelControlLogin.LookAndFeel.UseDefaultLookAndFeel = false;
            this.panelControlLogin.Name = "panelControlLogin";
            this.panelControlLogin.Size = new System.Drawing.Size(587, 415);
            this.panelControlLogin.TabIndex = 0;
            // 
            // panelConnectDatabase
            // 
            this.panelConnectDatabase.BackColor = System.Drawing.Color.Transparent;
            this.panelConnectDatabase.BackgroundImage = global::Warehouse1.Properties.Resources.filled_circle_Red1_20px;
            this.panelConnectDatabase.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Zoom;
            this.panelConnectDatabase.Location = new System.Drawing.Point(8, 383);
            this.panelConnectDatabase.Name = "panelConnectDatabase";
            this.panelConnectDatabase.Size = new System.Drawing.Size(24, 24);
            this.panelConnectDatabase.TabIndex = 14;
            // 
            // labelControlLoiDangNhap
            // 
            this.labelControlLoiDangNhap.Appearance.Font = new System.Drawing.Font("Segoe UI", 9.75F, System.Drawing.FontStyle.Italic, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.labelControlLoiDangNhap.Appearance.ForeColor = System.Drawing.Color.DarkRed;
            this.labelControlLoiDangNhap.Appearance.Options.UseFont = true;
            this.labelControlLoiDangNhap.Appearance.Options.UseForeColor = true;
            this.labelControlLoiDangNhap.Location = new System.Drawing.Point(99, 386);
            this.labelControlLoiDangNhap.Name = "labelControlLoiDangNhap";
            this.labelControlLoiDangNhap.Size = new System.Drawing.Size(185, 17);
            this.labelControlLoiDangNhap.TabIndex = 13;
            this.labelControlLoiDangNhap.Text = "Sai tên tài khoản hoặc mật khẩu!";
            this.labelControlLoiDangNhap.Visible = false;
            // 
            // hyperlinkLabelControl1
            // 
            this.hyperlinkLabelControl1.Location = new System.Drawing.Point(457, 390);
            this.hyperlinkLabelControl1.Name = "hyperlinkLabelControl1";
            this.hyperlinkLabelControl1.Size = new System.Drawing.Size(114, 13);
            this.hyperlinkLabelControl1.TabIndex = 12;
            this.hyperlinkLabelControl1.Text = "https://intech-group.vn";
            this.hyperlinkLabelControl1.Click += new System.EventHandler(this.hyperlinkLabelControl1_Click);
            // 
            // panelSetting
            // 
            this.panelSetting.BackColor = System.Drawing.Color.Transparent;
            this.panelSetting.BackgroundImage = global::Warehouse1.Properties.Resources.icon_intech_group_chuan1;
            this.panelSetting.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Zoom;
            this.panelSetting.Location = new System.Drawing.Point(7, 5);
            this.panelSetting.Name = "panelSetting";
            this.panelSetting.Size = new System.Drawing.Size(20, 20);
            this.panelSetting.TabIndex = 5;
            // 
            // panelClose
            // 
            this.panelClose.BackColor = System.Drawing.Color.Transparent;
            this.panelClose.BackgroundImage = global::Warehouse1.Properties.Resources.delete_30px;
            this.panelClose.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Zoom;
            this.panelClose.Location = new System.Drawing.Point(554, 5);
            this.panelClose.Name = "panelClose";
            this.panelClose.Size = new System.Drawing.Size(28, 23);
            this.panelClose.TabIndex = 7;
            this.panelClose.Click += new System.EventHandler(this.panelClose_Click);
            this.panelClose.MouseLeave += new System.EventHandler(this.panelClose_MouseLeave);
            this.panelClose.MouseHover += new System.EventHandler(this.panelClose_MouseHover);
            // 
            // panelMinimsize
            // 
            this.panelMinimsize.BackColor = System.Drawing.Color.Transparent;
            this.panelMinimsize.BackgroundImage = global::Warehouse1.Properties.Resources.minus_30px;
            this.panelMinimsize.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Zoom;
            this.panelMinimsize.Location = new System.Drawing.Point(522, 5);
            this.panelMinimsize.Name = "panelMinimsize";
            this.panelMinimsize.Size = new System.Drawing.Size(28, 23);
            this.panelMinimsize.TabIndex = 6;
            this.panelMinimsize.Click += new System.EventHandler(this.panelMinimsize_Click);
            this.panelMinimsize.MouseLeave += new System.EventHandler(this.panelMinimsize_MouseLeave);
            this.panelMinimsize.MouseHover += new System.EventHandler(this.panelMinimsize_MouseHover);
            // 
            // checkBoxRemember
            // 
            this.checkBoxRemember.AutoSize = true;
            this.checkBoxRemember.BackColor = System.Drawing.Color.Transparent;
            this.checkBoxRemember.Font = new System.Drawing.Font("Segoe UI", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.checkBoxRemember.Location = new System.Drawing.Point(99, 287);
            this.checkBoxRemember.Name = "checkBoxRemember";
            this.checkBoxRemember.Size = new System.Drawing.Size(140, 21);
            this.checkBoxRemember.TabIndex = 3;
            this.checkBoxRemember.Text = "Duy trì đăng nhập";
            this.checkBoxRemember.UseVisualStyleBackColor = false;
            // 
            // panel1
            // 
            this.panel1.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(34)))), ((int)(((byte)(64)))), ((int)(((byte)(89)))));
            this.panel1.Location = new System.Drawing.Point(186, 170);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(215, 1);
            this.panel1.TabIndex = 4;
            // 
            // guna2TextBoxPass
            // 
            this.guna2TextBoxPass.BackColor = System.Drawing.Color.Transparent;
            this.guna2TextBoxPass.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(91)))), ((int)(((byte)(91)))), ((int)(((byte)(91)))));
            this.guna2TextBoxPass.BorderRadius = 2;
            this.guna2TextBoxPass.BorderStyle = System.Drawing.Drawing2D.DashStyle.Dash;
            this.guna2TextBoxPass.Cursor = System.Windows.Forms.Cursors.IBeam;
            this.guna2TextBoxPass.DefaultText = "";
            this.guna2TextBoxPass.DisabledState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(208)))), ((int)(((byte)(208)))), ((int)(((byte)(208)))));
            this.guna2TextBoxPass.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(226)))), ((int)(((byte)(226)))), ((int)(((byte)(226)))));
            this.guna2TextBoxPass.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(138)))), ((int)(((byte)(138)))), ((int)(((byte)(138)))));
            this.guna2TextBoxPass.DisabledState.Parent = this.guna2TextBoxPass;
            this.guna2TextBoxPass.DisabledState.PlaceholderForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(138)))), ((int)(((byte)(138)))), ((int)(((byte)(138)))));
            this.guna2TextBoxPass.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(192)))), ((int)(((byte)(190)))), ((int)(((byte)(192)))));
            this.guna2TextBoxPass.FocusedState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.guna2TextBoxPass.FocusedState.Parent = this.guna2TextBoxPass;
            this.guna2TextBoxPass.Font = new System.Drawing.Font("Segoe UI", 15.75F);
            this.guna2TextBoxPass.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(38)))), ((int)(((byte)(46)))), ((int)(((byte)(53)))));
            this.guna2TextBoxPass.HoverState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.guna2TextBoxPass.HoverState.Parent = this.guna2TextBoxPass;
            this.guna2TextBoxPass.IconLeft = global::Warehouse1.Properties.Resources.icons8_lock_20px;
            this.guna2TextBoxPass.IconLeftSize = new System.Drawing.Size(30, 30);
            this.guna2TextBoxPass.IconRight = global::Warehouse1.Properties.Resources.icons8_eye_15px;
            this.guna2TextBoxPass.Location = new System.Drawing.Point(99, 239);
            this.guna2TextBoxPass.Margin = new System.Windows.Forms.Padding(6, 7, 6, 7);
            this.guna2TextBoxPass.Name = "guna2TextBoxPass";
            this.guna2TextBoxPass.PasswordChar = '\0';
            this.guna2TextBoxPass.PlaceholderForeColor = System.Drawing.SystemColors.ControlDarkDark;
            this.guna2TextBoxPass.PlaceholderText = "password";
            this.guna2TextBoxPass.SelectedText = "";
            this.guna2TextBoxPass.ShadowDecoration.Parent = this.guna2TextBoxPass;
            this.guna2TextBoxPass.Size = new System.Drawing.Size(388, 40);
            this.guna2TextBoxPass.Style = Guna.UI2.WinForms.Enums.TextBoxStyle.Material;
            this.guna2TextBoxPass.TabIndex = 2;
            this.guna2TextBoxPass.UseSystemPasswordChar = true;
            this.guna2TextBoxPass.TextChanged += new System.EventHandler(this.guna2TextBoxUserName_TextChanged);
            this.guna2TextBoxPass.IconRightClick += new System.EventHandler(this.guna2TextBoxPass_IconRightClick);
            // 
            // guna2TextBoxUserName
            // 
            this.guna2TextBoxUserName.BackColor = System.Drawing.Color.Transparent;
            this.guna2TextBoxUserName.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(91)))), ((int)(((byte)(91)))), ((int)(((byte)(91)))));
            this.guna2TextBoxUserName.BorderStyle = System.Drawing.Drawing2D.DashStyle.Dash;
            this.guna2TextBoxUserName.Cursor = System.Windows.Forms.Cursors.IBeam;
            this.guna2TextBoxUserName.DefaultText = "";
            this.guna2TextBoxUserName.DisabledState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(208)))), ((int)(((byte)(208)))), ((int)(((byte)(208)))));
            this.guna2TextBoxUserName.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(226)))), ((int)(((byte)(226)))), ((int)(((byte)(226)))));
            this.guna2TextBoxUserName.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(138)))), ((int)(((byte)(138)))), ((int)(((byte)(138)))));
            this.guna2TextBoxUserName.DisabledState.Parent = this.guna2TextBoxUserName;
            this.guna2TextBoxUserName.DisabledState.PlaceholderForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(138)))), ((int)(((byte)(138)))), ((int)(((byte)(138)))));
            this.guna2TextBoxUserName.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(192)))), ((int)(((byte)(190)))), ((int)(((byte)(192)))));
            this.guna2TextBoxUserName.FocusedState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.guna2TextBoxUserName.FocusedState.Parent = this.guna2TextBoxUserName;
            this.guna2TextBoxUserName.Font = new System.Drawing.Font("Segoe UI", 15.75F);
            this.guna2TextBoxUserName.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(38)))), ((int)(((byte)(46)))), ((int)(((byte)(53)))));
            this.guna2TextBoxUserName.HoverState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.guna2TextBoxUserName.HoverState.Parent = this.guna2TextBoxUserName;
            this.guna2TextBoxUserName.IconLeft = global::Warehouse1.Properties.Resources.icons8_user_male_20px_1;
            this.guna2TextBoxUserName.IconLeftSize = new System.Drawing.Size(30, 30);
            this.guna2TextBoxUserName.Location = new System.Drawing.Point(99, 187);
            this.guna2TextBoxUserName.Margin = new System.Windows.Forms.Padding(6, 7, 6, 7);
            this.guna2TextBoxUserName.Name = "guna2TextBoxUserName";
            this.guna2TextBoxUserName.PasswordChar = '\0';
            this.guna2TextBoxUserName.PlaceholderForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(125)))), ((int)(((byte)(137)))), ((int)(((byte)(149)))));
            this.guna2TextBoxUserName.PlaceholderText = "username";
            this.guna2TextBoxUserName.SelectedText = "";
            this.guna2TextBoxUserName.ShadowDecoration.Parent = this.guna2TextBoxUserName;
            this.guna2TextBoxUserName.Size = new System.Drawing.Size(388, 40);
            this.guna2TextBoxUserName.Style = Guna.UI2.WinForms.Enums.TextBoxStyle.Material;
            this.guna2TextBoxUserName.TabIndex = 1;
            this.guna2TextBoxUserName.TextChanged += new System.EventHandler(this.guna2TextBoxUserName_TextChanged);
            // 
            // pictureBox1
            // 
            this.pictureBox1.BackColor = System.Drawing.Color.Transparent;
            this.pictureBox1.Image = global::Warehouse1.Properties.Resources._00_intech_group_chuan_k_nen;
            this.pictureBox1.Location = new System.Drawing.Point(167, 27);
            this.pictureBox1.Name = "pictureBox1";
            this.pictureBox1.Size = new System.Drawing.Size(253, 88);
            this.pictureBox1.SizeMode = System.Windows.Forms.PictureBoxSizeMode.Zoom;
            this.pictureBox1.TabIndex = 0;
            this.pictureBox1.TabStop = false;
            // 
            // guna2DragControl2
            // 
            this.guna2DragControl2.TargetControl = this.panelControlLogin;
            this.guna2DragControl2.UseTransparentDrag = true;
            // 
            // timer1
            // 
            this.timer1.Enabled = true;
            this.timer1.Interval = 1500;
            this.timer1.Tick += new System.EventHandler(this.timer1_Tick);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.BackColor = System.Drawing.Color.Transparent;
            this.label1.Font = new System.Drawing.Font("Segoe UI", 27.75F, System.Drawing.FontStyle.Bold);
            this.label1.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(34)))), ((int)(((byte)(64)))), ((int)(((byte)(89)))));
            this.label1.Location = new System.Drawing.Point(180, 117);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(218, 50);
            this.label1.TabIndex = 15;
            this.label1.Text = "Đăng Nhập";
            // 
            // FormLogin
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.SystemColors.ActiveBorder;
            this.ClientSize = new System.Drawing.Size(587, 415);
            this.Controls.Add(this.panelControlLogin);
            this.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(38)))), ((int)(((byte)(46)))), ((int)(((byte)(53)))));
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.None;
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Name = "FormLogin";
            this.SizeGripStyle = System.Windows.Forms.SizeGripStyle.Hide;
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Login";
            this.Load += new System.EventHandler(this.FormLogin_Load);
            ((System.ComponentModel.ISupportInitialize)(this.panelControlLogin)).EndInit();
            this.panelControlLogin.ResumeLayout(false);
            this.panelControlLogin.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private Guna.UI2.WinForms.Guna2Elipse guna2Elipse1;
        private Guna.UI2.WinForms.Guna2DragControl guna2DragControl1;
        private Guna.UI2.WinForms.Guna2Elipse guna2Elipse2;
        private DevExpress.XtraEditors.PanelControl panelControlLogin;
        private System.Windows.Forms.PictureBox pictureBox1;
        private Guna.UI2.WinForms.Guna2DragControl guna2DragControl2;
        private System.Windows.Forms.Panel panel1;
        private Guna.UI2.WinForms.Guna2TextBox guna2TextBoxPass;
        private Guna.UI2.WinForms.Guna2TextBox guna2TextBoxUserName;
        private Guna.UI2.WinForms.Guna2Button guna2ButtonLogin;
        private System.Windows.Forms.CheckBox checkBoxRemember;
        private System.Windows.Forms.Panel panelClose;
        private System.Windows.Forms.Panel panelMinimsize;
        private System.Windows.Forms.Panel panelSetting;
        private DevExpress.XtraEditors.HyperlinkLabelControl hyperlinkLabelControl1;
        private System.Windows.Forms.Panel panelConnectDatabase;
        private DevExpress.XtraEditors.LabelControl labelControlLoiDangNhap;
        private System.Windows.Forms.Timer timer1;
        private System.Windows.Forms.Label label1;
    }
}

