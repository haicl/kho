using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Warehouse1
{
    public partial class FormMain : Form
    {
        public static int flagLogout = 0;
        public FormMain()
        {
            InitializeComponent();
        }

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

        private void timer1_Tick(object sender, EventArgs e)
        {
            lb_date.Text = DateTime.Now.Date.ToString("dd/MM/yyyy");
            lb_time.Text = DateTime.Now.ToString("HH:mm:ss");
            ClassPlc checkconnect = new ClassPlc();
            if (checkconnect.check_connect_plc() == false)
            {
                panelConnectPLC.BackgroundImage = Properties.Resources.filled_circle_Red1_20px;
            }
            else
            {
                panelConnectPLC.BackgroundImage = Properties.Resources.filled_circle_Green4_20px;
            }
        }

        private void hyperlinkLabelControl1_Click(object sender, EventArgs e)
        {
            System.Diagnostics.Process.Start("https://intech-group.vn/thong-tin-tap-doan.htm");
        }

        private void FormMain_Load(object sender, EventArgs e)
        {
            ClassPlc.Plc.ActLogicalStationNumber = 2;
            ClassPlc.Plc.Open();

            flagLogout = 0;
            labelControlUsernameLogin.Text = FormLogin.userLogin;
            int lxText = 1500 - 32 - labelControlUsernameLogin.Size.Width;
            labelControlUsernameLogin.Location = new Point(lxText ,3);
            int lxbutton = labelControlUsernameLogin.Location.X - 32;
            guna2CircleButtonLogOut.Location = new Point(lxbutton, 1);
            //ucHome ucHome = new ucHome();
            //tabPageHome.Controls.Add(ucHome);
            //ucData ucData = new ucData();
            //tabPageData.Controls.Add(ucData);
        }
        
        private void guna2CircleButton1_Click(object sender, EventArgs e)
        {
            flagLogout = 1;
            this.Close();
        }

        private void labelControlPLC_Click(object sender, EventArgs e)
        {
            ClassPlc.Plc.Close();
            ClassPlc.Plc.Open();
        }

        private void ucHome1_Load(object sender, EventArgs e)
        {

        }

        private void ucData1_Load(object sender, EventArgs e)
        {

        }

        private void tabPageHome_Click(object sender, EventArgs e)
        {

        }
    }
}
