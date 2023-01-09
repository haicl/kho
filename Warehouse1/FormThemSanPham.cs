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
    public partial class FormThemSanPham : Form
    {
        public FormThemSanPham()
        {
            InitializeComponent();
        }

        private void FormThemSanPham_Load(object sender, EventArgs e)
        {

        }


        bool checkThem()
        {
            bool check = true;
            string Msp = guna2TextBoxMaSp.Text.Trim();
            string DonViTinh = comboBoxDonViTinh.Text;
            string Tensp = guna2TextBoxTenSp.Text.Trim();
            if (Msp != "" && Msp != null)
            {
                if (DataDAO.Instance.prCheckInsertDsSanPham(Msp))
                {
                    check = false;
                    MessageBox.Show("Mã Sản Phẩm Đã Tồn Tại!", "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                }

                 if (Tensp == "" || Tensp == null)
                {
                    check = false;
                    MessageBox.Show("Bạn Chưa Nhập Tên Sản Phẩm!", "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                }
                else
                {
                    if (DataDAO.Instance.prCheckInsertDonViTinh(DonViTinh))
                    {
                        check = false;
                        MessageBox.Show("Đơn Vị Tính Không Hợp lệ!", "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    }
                }
                
            }
            else if (Msp == "" || Msp == null)
            {
                check = false;
                MessageBox.Show("Bạn Chưa Nhập Mã Sản Phẩm!", "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
           
            
           


            return check;
        }
        
        private void guna2GradientButtonDongY_Click(object sender, EventArgs e)
        {
            if (checkThem())
            {
                string Msp = guna2TextBoxMaSp.Text.Trim();
                string Tensp = guna2TextBoxTenSp.Text.Trim();
                string NhomSp = "Bulong";
                string Maker = guna2TextBoxMaker.Text;
                if (Maker == "" || Maker == null) 
                {
                    Maker = "Trống";
                }
                string DonViTinh = comboBoxDonViTinh.Text;
                float KhoiLuong = (float)(numericUpDownKhoiLuong.Value);
                float cDai = (float)(numericUpDownKhoiLuong.Value);
                float cRong = (float)(numericUpDownChieuRong.Value);
                float cCao = (float)(numericUpDowncCao.Value);
                float DonGia = (float)(numericUpDownDonGia.Value);
                int soLuongTon = 0;
                string quydoi = guna2TextBoxQuyDoi.Text.Trim();
                if (quydoi == "" || quydoi == null)
                {
                    quydoi = "Chưa cập nhật";
                }

                object[] parameter = new object[12];
                parameter[0] = Msp;
                parameter[1] = Tensp;
                parameter[2] = NhomSp;
                parameter[3] = Maker;
                parameter[4] = DonViTinh;
                parameter[5] = KhoiLuong;
                if (cDai ==0)
                {
                    parameter[6] = 1;
                }
                else
                {
                    parameter[6] = cDai;
                }
                if (cRong == 0)
                {
                    parameter[7] = 1;
                }
                else
                {
                    parameter[7] = cRong;
                }
                if (cCao ==0)
                {
                    parameter[8] = 1;
                }
                else
                {
                    parameter[8] = cCao;
                }
                parameter[9] = DonGia;
                parameter[10] = soLuongTon;
                parameter[11] = quydoi;
                int check = DataDAO.Instance.prInsertDsSanPham(parameter);
                if (check >0 )
                {
                    MessageBox.Show("Thành Công!");
                }
                else
                {

                }
                this.Close();
            }
        }
    }
}
