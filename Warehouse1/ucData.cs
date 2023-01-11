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
    public partial class ucData : UserControl
    {
        public ucData()
        {
            InitializeComponent();
        }

        private void guna2GradientButton1_Click(object sender, EventArgs e)
        {
            tabControlData.SelectedTab = tabPageTTSP;
            //MessageBox.Show("1");
        }

        private void guna2GradientButton2_Click(object sender, EventArgs e)
        {
            //tabPageTonKho.Controls.Clear();
            //ucTonKho ucTonKho = new ucTonKho();
            //ucTonKho.Dock = DockStyle.Fill;
            //tabPageTonKho.Controls.Add(ucTonKho);
            tabControlData.SelectedTab = tabPageTonKho;
            //MessageBox.Show("2");
        }

        private void guna2GradientButton3_Click(object sender, EventArgs e)
        {

            //tabPageLichSu.Controls.Clear();
            //ucLichSu ucLichSu = new ucLichSu();
            //ucLichSu.Dock = DockStyle.Fill;
            //tabPageLichSu.Controls.Add(ucLichSu);
            tabControlData.SelectedTab = tabPageLichSu;
            //MessageBox.Show("3");
        }

        private void guna2GradientButton4_Click(object sender, EventArgs e)
        {
            tabControlData.SelectedTab = tabPageKiemKe;
           // MessageBox.Show("4");
        }

        private void guna2GradientButton5_Click(object sender, EventArgs e)
        {
            tabControlData.SelectedTab = tabPageNXDC;
        }

        private void tabPageTTSP_Click(object sender, EventArgs e)
        {

        }
    }
}
