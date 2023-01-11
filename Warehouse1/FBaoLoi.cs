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
namespace Warehouse1
{
    public partial class FBaoLoi : Form
    {
        public FBaoLoi()
        {
            InitializeComponent();
        }

        private void simpleButton1_MouseDown(object sender, MouseEventArgs e)
        {
            ClassPlc reset_plc = new ClassPlc();

            if (reset_plc.check_connect_plc() == false)
            {
                MessageBox.Show("Chưa kết nối! ");
            }
            else
            {
                reset_plc.resetplc_uchome();
            }
        }

        private void FBaoLoi_Load(object sender, EventArgs e)
        {
            ClassPlc checkt_plc = new ClassPlc();
            if (checkt_plc.check_connect_plc() == false)
            {
                MessageBox.Show("Chưa kết nối! ");
            }
            else
            {
                Canh_bao();
                //ur_mophong.plc.SetDevice("M203", 1);
                gridControl1.DataSource = tbloihiemthai(); 
            }
        }

        private void simpleButton1_MouseUp(object sender, MouseEventArgs e)
        {
            ClassPlc.Plc.SetDevice("M203", 0);
            ClassPlc.Plc.GetDevice("M15", out int M15);
            if (M15 == 0)
            {
                this.Close();
            }

        }
        // 
        public  DataTable tbloihiemthai()
        {
            DataTable tb = new DataTable();
            tb.Columns.Add("STT");
            tb.Columns.Add("Bit Lỗi PLC");
            tb.Columns.Add("Tên lỗi");
            tb.Columns.Add("Thời gian");
            for (int i = 0; i < lit_canhbao.Count; i++)
            {
                string[] a = lit_canhbao[i].Split(',');
                tb.Rows.Add(i + 1,
                            a[0].Trim(),
                            a[1].Trim(),
                            DateTime.Now);
            }

            return tb; 
        }

        DataTable tb_loi = new DataTable();
        List<string> lit_canhbao = new List<string>();
        public void Canh_bao()
        {
            lit_canhbao.Clear();
            tb_loi.Rows.Clear();
            tb_loi.Columns.Clear();

            tb_loi.Columns.Add("Bit lỗi");
            tb_loi.Columns.Add("Tên lỗi");
            tb_loi.Columns.Add("Giá trị");
            // 
            tb_loi.Rows.Add("M1500", "Dừng Khẩn Cấp     ", 0);
            tb_loi.Rows.Add("M1511", "Lỗi biến tần Lifting      ", 0);
            tb_loi.Rows.Add("M1512", "Lỗi biến tần Transfer			", 0);
            tb_loi.Rows.Add("M1513", "Lỗi chạm giới hạn trên Lifting	", 0);
            tb_loi.Rows.Add("M1514", "Lỗi chạm giới hạn dưới Lifting	", 0);
            tb_loi.Rows.Add("M1515", "Lỗi vượt quá thời gian đẩy khay	", 0);
            tb_loi.Rows.Add("M1516", "Lỗi vượt quá thời gian kéo khay	", 0);
            tb_loi.Rows.Add("M1517", "Lỗi không được phép Jog			", 0);
            tb_loi.Rows.Add("M1518", "Tầng lấy khay trống				", 0);
            tb_loi.Rows.Add("M1519", "Cửa vẫn còn khay				", 0);
            tb_loi.Rows.Add("M1520", "Tầng cất vẫn có khay			", 0);
            tb_loi.Rows.Add("M1521", "Cửa không có khay				", 0);
            tb_loi.Rows.Add("M1522", "Lỗi kéo khay cột trước			", 0);
            tb_loi.Rows.Add("M1523", "Lỗi kéo khay cột sau			", 0);
            tb_loi.Rows.Add("M1524", "Lỗi an toàn Lifting				", 0);
            tb_loi.Rows.Add("M1525", "Lỗi nhập sai cột				", 0);
            tb_loi.Rows.Add("M1526", "Lỗi cửa				            ", 0);
            tb_loi.Rows.Add("M1527", "Lỗi cảm biến phát hiện khay      ", 0);
            //
            int gt = 0;
            for (int i = 0; i < tb_loi.Rows.Count; i++)
            {
                string bit = tb_loi.Rows[i][0].ToString().Trim();
                ClassPlc.Plc.GetDevice(bit, out gt);
                tb_loi.Rows[i][2] = gt;
                if (gt != 0)
                {
                    lit_canhbao.Add(tb_loi.Rows[i][0].ToString() + ", " + tb_loi.Rows[i][1].ToString());

                }
            }

        }

        private void simpleButton1_Click(object sender, EventArgs e)
        {

        }

        private void gridControl1_Click(object sender, EventArgs e)
        {

        }
    }
}
