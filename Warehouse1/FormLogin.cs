using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Warehouse1.DAO;
using DevExpress.XtraSplashScreen;
using System.Threading;

namespace Warehouse1
{
    public partial class FormLogin : Form
    {
        public static string userLogin = "";
        public FormLogin()
        {
            InitializeComponent();
            
        }
        private void FormLogin_Load(object sender, EventArgs e)
        {
            Thread.Sleep(500);
            ShowOverlayF.handle = SplashScreenManager.ShowOverlayForm(this);
        }
        private void timer1_Tick(object sender, EventArgs e)
        {
            timer1.Stop();
            try
            {
                //DataProvider.Instance.checkConnectSql();
                List<string> listInfor = new List<string>();
                listInfor = AccountDAO.Instance.selectRemember();
                if (listInfor.Count>0)
                {
                    guna2TextBoxUserName.Text = listInfor[0];
                    guna2TextBoxPass.Text = listInfor[1];
                    checkBoxRemember.Checked = true;
                }
                SplashScreenManager.CloseOverlayForm(ShowOverlayF.handle);
                panelConnectDatabase.BackgroundImage = Properties.Resources.filled_circle_Green3_20px;
            }
            catch 
            {
                SplashScreenManager.CloseOverlayForm(ShowOverlayF.handle);
                MessageBox.Show("Kết nối cơ sở dữu liệu thất bại!", "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
                panelConnectDatabase.BackgroundImage = Properties.Resources.filled_circle_Red1_20px;
            }
            

            
        }

        #region close Form
        private void panelMinimsize_MouseHover(object sender, EventArgs e)
        {
            panelMinimsize.BackColor = System.Drawing.Color.Silver;
        }

        private void panelMinimsize_MouseLeave(object sender, EventArgs e)
        {
            panelMinimsize.BackColor = System.Drawing.Color.Transparent;
        }

        private void panelClose_MouseLeave(object sender, EventArgs e)
        {
            panelClose.BackColor = System.Drawing.Color.Transparent;
        }

        private void panelClose_MouseHover(object sender, EventArgs e)
        {
            panelClose.BackColor = System.Drawing.Color.Crimson;
        }

        private void panelMinimsize_Click(object sender, EventArgs e)
        {
            WindowState = FormWindowState.Minimized;
        }

        private void panelClose_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }
        private void hyperlinkLabelControl1_Click(object sender, EventArgs e)
        {
            System.Diagnostics.Process.Start("https://intech-group.vn/thong-tin-tap-doan.htm");
        }

        #endregion


        private void guna2ButtonLogin_Click(object sender, EventArgs e)
        {
            try
            {
                if ( Checklogin() )
                {

                    string usernaem = guna2TextBoxUserName.Text;
                    string pass = guna2TextBoxPass.Text;
                    if (AccountDAO.Instance.Login(usernaem, pass))
                    {
                        if (checkBoxRemember.Checked)
                        {
                            AccountDAO.Instance.updateRemember(usernaem , pass);
                        }
                        FormMain f = new FormMain();
                        userLogin = AccountDAO.Instance.userLogin(usernaem, pass);
                        this.Hide();
                        f.ShowDialog();
                        if (FormMain.flagLogout ==1)
                        {
                            userLogin = "";
                            this.Show();
                        }
                        else
                        {
                            FormMain.flagLogout = 0;
                            this.Close();
                        }
                        
                    }
                    else
                    {
                        labelControlLoiDangNhap.Visible = true;
                    }

                }
            }
            catch (Exception line)
            {
                string er = line.StackTrace.ToString();
                string[] b = er.Split(' ');
                string mess = "Err:" + b[b.Length - 1] + " " + line.Message + "";
                MessageBox.Show(mess, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }


        }

        private bool Checklogin()
        {
            bool check = true;
            string usernaem = guna2TextBoxUserName.Text;
            string pass = guna2TextBoxPass.Text;
            if (usernaem.Trim() == ""|| usernaem.Trim() == null)
            {
                check = false;
                MessageBox.Show("Chưa nhập tên tài khoản!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                guna2TextBoxUserName.Focus();
            }

            return check;
        }

        private void guna2TextBoxUserName_TextChanged(object sender, EventArgs e)
        {
            labelControlLoiDangNhap.Visible = false;
        }

        private void guna2TextBoxPass_IconRightClick(object sender, EventArgs e)
        {
           
            if (guna2TextBoxPass.UseSystemPasswordChar == false)
            {
                guna2TextBoxPass.UseSystemPasswordChar = true;
            }
            else if (guna2TextBoxPass.UseSystemPasswordChar == true)
            {
                guna2TextBoxPass.UseSystemPasswordChar = false;
            }
            
            
        }

        private void panelControlLogin_Paint(object sender, PaintEventArgs e)
        {

        }
    }
}
