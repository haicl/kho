using DevExpress.XtraEditors;
using System;
using System.Windows.Forms;
using Warehouse1.DAO;

namespace Warehouse1
{
    public partial class ucThongTinsp : UserControl
    {
        public ucThongTinsp()
        {
            InitializeComponent();
        }

        private void ucThongTinsp_Load(object sender, EventArgs e)
        {
            gridControl1.DataSource = NhapHangDAO.Instance.LoadThongTinSanPham();
        }

        #region thêm

        private void guna2GradientButtonThem_Click(object sender, EventArgs e)
        {
            FormThemSanPham formThemSanPham = new FormThemSanPham();
            formThemSanPham.StartPosition = FormStartPosition.CenterScreen;
            formThemSanPham.Show();
            gridControl1.DataSource = null;
            gridControl1.DataSource = NhapHangDAO.Instance.LoadThongTinSanPham();

        }

        #endregion thêm



        private void guna2GradientButtonTaiLai_Click(object sender, EventArgs e)
        {
            gridControl1.DataSource = null;
            gridControl1.DataSource = NhapHangDAO.Instance.LoadThongTinSanPham();
        }
           /////////////////////////////////////////////////////////////////////////
        //
        // sửa
        private void guna2GradientButtonSua_Click(object sender, EventArgs e)
        {
            MessageBox.Show("Click vào dòng bạn muốn thay đổi thông tin");
        }

        string _MaSanPham = "";

        private void gridView1_ShowingPopupEditForm(object sender, DevExpress.XtraGrid.Views.Grid.ShowingPopupEditFormEventArgs e)
        {
            int rowHandle = e.RowHandle;
            _MaSanPham = advBandedGridView1.GetRowCellValue(rowHandle, "MaSp").ToString().Trim() ;

        }


        // so sánh thay đổi dữ liệu hay không  
        private void repositoryItemComboBoxDonVitinh_Leave(object sender, EventArgs e)
        {
            ComboBoxEdit comboBoxEdit = (ComboBoxEdit)sender;

            // MessageBox.Show(comboBoxEdit.);
        }

        private void gridView1_ValidateRow(object sender, DevExpress.XtraGrid.Views.Base.ValidateRowEventArgs e)
        {
            System.Data.DataRowView GridViewRow = (System.Data.DataRowView)e.Row;
            object[] parameter = new object[12];
            /// 0 --@key  CHAR(25), 
            /// 1 --@MaSp char (25),
            /// 2 --@TenSp nvarchar(100),
            /// 3 --@Maker nvarchar(50),
            /// 4 --@DonViTinh nvarchar(10),
            /// 5 --@KhoiLuong FLOAT,
            /// 6 --@Cdai FLOAT,
            /// 7 --@cRong FLOAT,
            /// 8 --@cCao FLOAT,
            /// 9 --@DonGia FLOAT,
            /// 10--@SoLuongTon INT,
            /// 11--@QuyDoi NTEXT
            try
            {
                parameter[0] = _MaSanPham;
                parameter[1] = GridViewRow.Row.ItemArray[0];
                parameter[2] = GridViewRow.Row.ItemArray[1];
                parameter[3] = GridViewRow.Row.ItemArray[3];
                parameter[4] = GridViewRow.Row.ItemArray[4];
                parameter[5] = GridViewRow.Row.ItemArray[5];
                parameter[6] = GridViewRow.Row.ItemArray[6];
                parameter[7] = GridViewRow.Row.ItemArray[7];
                parameter[8] = GridViewRow.Row.ItemArray[8];
                parameter[9] = GridViewRow.Row.ItemArray[9];
                parameter[10] = GridViewRow.Row.ItemArray[10];
                parameter[11] = GridViewRow.Row.ItemArray[11];
                int check = DataDAO.Instance.prUpdateDsSanPham(parameter);
                MessageBox.Show(check.ToString());
            }
            catch (Exception line)
            {

                string er = line.StackTrace.ToString();
                string[] b = er.Split(' ');
                string mess = "Err:" + b[b.Length - 1] + " " + line.Message + "";
                MessageBox.Show(mess, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                gridControl1.DataSource = null;
                gridControl1.DataSource = NhapHangDAO.Instance.LoadThongTinSanPham();
            }

        }
        /////////////////////////////////////////////////////////////////////////
        //
        // xóa
        int index=-1;

        private void gridView1_RowCellClick(object sender, DevExpress.XtraGrid.Views.Grid.RowCellClickEventArgs e)
        {
            index = e.RowHandle;
        }

        private void guna2GradientButtonXoa_Click(object sender, EventArgs e)
        {
            if (index>=0)
            {
                string msp = advBandedGridView1.GetRowCellValue(index, "MaSp").ToString().Trim();
                int sl = Convert.ToInt32( advBandedGridView1.GetRowCellValue(index, "SoLuongTon"));
                if (sl==0)
                {
                    DialogResult dr = MessageBox.Show("Bạn muốn xóa: " + msp + " ?", "Thông Báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                    if (dr == DialogResult.Yes)
                    {
                        int check = DataDAO.Instance.prDeletetDsSanPham(msp);
                        if (check>0)
                        {
                            MessageBox.Show("Thành công", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                            gridControl1.DataSource = null;
                            gridControl1.DataSource = NhapHangDAO.Instance.LoadThongTinSanPham();
                        }
                        else
                        {
                            MessageBox.Show("Lỗi", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                        }
                    }
                }
                else if (sl>0)
                {
                     MessageBox.Show("Không thể xóa: " + msp + ".", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                }
                
            }
            else
            {
                MessageBox.Show("Click vào mã vật tư bạn muốn xóa.", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Information);

            }
            index = -1;
        }

        private void gridControl1_Click(object sender, EventArgs e)
        {

        }

        private void gridControl1_Click_1(object sender, EventArgs e)
        {

        }

        /////////////////////////////////////////////////////////////////////////

    }
}