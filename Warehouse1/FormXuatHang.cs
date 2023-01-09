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
    public partial class FormXuatHang : Form
    {
        public FormXuatHang()
        {
            InitializeComponent();
        }
        #region event
        private void panelMinimsize_MouseHover(object sender, EventArgs e)
        {
            panel2Minimsize.BackColor = System.Drawing.Color.Silver;
        }

        private void panelMinimsize_MouseLeave(object sender, EventArgs e)
        {
            panel2Minimsize.BackColor = System.Drawing.Color.Transparent;
        }

        private void panelClose_MouseLeave(object sender, EventArgs e)
        {
            panel1Close.BackColor = System.Drawing.Color.Transparent;
        }

        private void panelClose_MouseHover(object sender, EventArgs e)
        {
            panel1Close.BackColor = System.Drawing.Color.Crimson;
            //MessageBox.Show("1");
        }

        private void panelMinimsize_Click(object sender, EventArgs e)
        {
            WindowState = FormWindowState.Minimized;
        }

        private void panelClose_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        #endregion
        DataTable dsXuatHang = new DataTable();
        private void FormXuatHang_Load(object sender, EventArgs e)
        {
            int check = XuatHangDAO.Instance.deletelistXuat();
            XuatHangDAO.Instance.deleteDsXuatHang();
            searchLookUpEdit1.Properties.DataSource = XuatHangDAO.Instance.dboDsSanPhamXuat();
            searchLookUpEdit1.Properties.DisplayMember = "TenSp";
            searchLookUpEditVitrixuat.Properties.DisplayMember = "ViTriO";

            dsXuatHang = XuatHangDAO.Instance.DsXuatHang();
        }

        private void searchLookUpEdit1View_RowCellClick(object sender, DevExpress.XtraGrid.Views.Grid.RowCellClickEventArgs e)
        {
            try
            {

                object[] parameter = new object[9];
                parameter[0] = dsXuatHang.Rows.Count + 1; //stt
                parameter[1] = searchLookUpEdit1View.GetRowCellValue(e.RowHandle, "MaSp").ToString().Trim(); //MaSp
                parameter[2] = searchLookUpEdit1View.GetRowCellValue(e.RowHandle, "TenSp").ToString().Trim(); //TenSp
                string[] makerDVT = NhapHangDAO.Instance.prMaker(parameter[1].ToString(), parameter[2].ToString());
                parameter[3] = makerDVT[0]; //Maker
                parameter[4] = makerDVT[1]; //DVT
                parameter[5] = 0; //sl
                parameter[6] = ""; //Vị trí
                parameter[7] = 0; // sl tônn
                parameter[8] = ""; //diên giải
                bool checkspNhap = XuatHangDAO.Instance.CheckSpXuat(parameter[1].ToString().Trim());
                if (checkspNhap)
                {
                    XuatHangDAO.Instance.prInsertlistXuat(parameter[1].ToString().Trim());
                    dsXuatHang.Rows.Add(parameter);

                    guna2TextBoxMaSp.Text = parameter[1].ToString();
                    guna2TextBoxTenSp.Text = parameter[2].ToString();
                    guna2TextBoxMaker.Text = parameter[3].ToString();
                    comboBoxEditDonVi.Text = parameter[4].ToString();
                    numericUpDownSoLuong.Value = Convert.ToInt32(makerDVT[2]);

                    guna2TextBoxDonGia.Text = String.Format("{0:#,###;}", makerDVT[3]);
                    numericUpDownChieuDai.Value = Convert.ToDecimal(makerDVT[4]);
                    numericUpDownChieuRong.Value = Convert.ToDecimal(makerDVT[5]);
                    numericUpDownKhoiLuong.Value = Convert.ToDecimal(makerDVT[6]);

                    gridControlXuatHang.DataSource = null;
                    gridControlXuatHang.DataSource = dsXuatHang;
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

        private void guna2GradientButtonHuy_Click(object sender, EventArgs e)
        {
            
      
                DialogResult dr = MessageBox.Show("Bạn muốn xóa dữ liệu đã nhập?", "Thông Báo!", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                if (dr == DialogResult.Yes)
                {
                    int check = XuatHangDAO.Instance.deletelistXuat();
                    dsXuatHang.Rows.Clear();
                    //gridControlNhapHang.DataSource = null;
                    gridControlXuatHang.DataSource = dsXuatHang;
                }
            
        }

        private void gridViewNhapHang_CellValueChanged(object sender, DevExpress.XtraGrid.Views.Base.CellValueChangedEventArgs e)
        {
            try
            {


                if (e.Column.Caption == "Số Lượng Xuất")
                {
                    int soLuongNhap = 0;
                    int intRows = e.RowHandle;
                    try
                    {
                        soLuongNhap = Convert.ToInt32(e.Value);
                    }
                    catch
                    {

                        gridViewNhapHang.SetRowCellValue(e.RowHandle, "SoLuongXuat", 0);
                    }
                    if (soLuongNhap > 0)
                    {
                        string maSp = gridViewNhapHang.GetRowCellValue(e.RowHandle, "MaSp").ToString().Trim();
                        tongSoLuongsanPham();
                        ViTriXuat();
                        
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

        void updateListxUAT()
        {
            int check = XuatHangDAO.Instance.deletelistXuat();
            if (gridViewNhapHang.RowCount > 0)
            {
                List<string> vsLoc = new List<string>();
                for (int j = 0; j < gridViewNhapHang.RowCount; j++)
                {
                    string msp = gridViewNhapHang.GetRowCellValue(j, "MaSp").ToString().Trim();
                    vsLoc.Add(msp);
                }
                List<string> vs1 = vsLoc.Distinct().ToList();
                if (vs1.Count > 0)
                {
                    foreach (string item in vs1)
                    {
                        int checkspNhap = XuatHangDAO.Instance.prInsertlistXuat(item);
                    }
                }
            }
        }
        // update lại listNhap > tong so sp > nhạp hàng
        void tongSoLuongsanPham()
        {
            updateListxUAT();
            DataTable dboListXuat = XuatHangDAO.Instance.dbolistXuat();
            for (int i = 0; i < dboListXuat.Rows.Count; i++)
            {
                if (dboListXuat.Rows.Count > 0)
                {
                    string msp = dboListXuat.Rows[i][0].ToString().Trim();
                    Int32 soluongsp = 0;
                    for (int j = 0; j < gridViewNhapHang.RowCount; j++)
                    {
                        if (gridViewNhapHang.RowCount > 0)
                        {
                            if (gridViewNhapHang.GetRowCellValue(j, "MaSp").ToString().Trim() == msp)
                            {
                                int sl = Convert.ToInt32(gridViewNhapHang.GetRowCellValue(j, "SoLuongXuat"));
                                soluongsp = soluongsp + sl;
                            }
                        }
                    }
                    int SlTonKho = XuatHangDAO.Instance.prSoLuongTonKho(msp);
                    if (soluongsp<= SlTonKho)
                    {
                        int cc = XuatHangDAO.Instance.updateSoLuonglistXuat(msp, soluongsp);
                    }
                    else
                    {
                        MessageBox.Show("Sản phẩm: "+msp+" có thể xuất tối đa là: "+SlTonKho.ToString(), "THÔNG BÁO!", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                        int cc = XuatHangDAO.Instance.updateSoLuonglistXuat(msp, SlTonKho);
                    }
                        
                }
                    
            }

        }


        void ViTriXuat()
        {
            dsXuatHang.Rows.Clear();
            DataTable dbolistXuat = XuatHangDAO.Instance.dbolistXuat();
            for (int i = 0; i < dbolistXuat.Rows.Count; i++)
            {
                if (dbolistXuat.Rows.Count >0)
                {
                    string maSp = dbolistXuat.Rows[i][0].ToString().Trim();
                    int slXuat = Convert.ToInt32(dbolistXuat.Rows[i][1].ToString());
                    DataTable dataTableDsO = XuatHangDAO.Instance.prVitriHangTon(maSp);
                    if (dataTableDsO.Rows.Count>0)
                    {
                        object[] TtSanPham = NhapHangDAO.Instance.prTtSanPham(maSp);
                        int slTon = Convert.ToInt32(dataTableDsO.Rows[0][5].ToString().Trim()); //sl tồn

                        object[] parameter = new object[10];
                        parameter[0] = dsXuatHang.Rows.Count + 1; //stt
                        parameter[1] = maSp; //msp
                        parameter[2] = TtSanPham[0]; //tên sp
                        parameter[3] = TtSanPham[1]; //maker
                        parameter[4] = TtSanPham[2]; //  đơn vị
                        if (slXuat > slTon)
                        {
                            parameter[5] = slTon; //sl xuất
                            slXuat = slXuat - slTon;
                        }
                        else if (slXuat <= slTon)
                        {
                            parameter[5] = slXuat;
                            slXuat = 0; 
                        }
                        parameter[6] = dataTableDsO.Rows[0][6].ToString().Trim() ; //vị trí
                        parameter[7] = slTon;
                        parameter[8] = ""; //diễn giải
                        parameter[9] = TtSanPham[4]; //diễn giải
                        dsXuatHang.Rows.Add(parameter);
                        dataTableDsO.Rows.RemoveAt(0);

                        while (slXuat>0)
                        {
                            parameter[0] = dsXuatHang.Rows.Count + 1;
                            int slTon2 = Convert.ToInt32(dataTableDsO.Rows[0][5].ToString().Trim()); //sl tồn
                            if (slXuat > slTon2)
                            {
                                parameter[5] = slTon2; //sl xuất
                                slXuat = slXuat - slTon2;
                            }
                            else if (slXuat <= slTon2)
                            {
                                parameter[5] = slXuat;
                                slXuat = 0;
                            }
                            parameter[6] = dataTableDsO.Rows[0][6].ToString().Trim(); //vị trí
                            dsXuatHang.Rows.Add(parameter);
                            dataTableDsO.Rows.RemoveAt(0);
                        }
                    }
                }
            }
            gridControlXuatHang.DataSource = null;
            gridControlXuatHang.DataSource = dsXuatHang;
        }

        private void guna2GradientButtonDongY_Click(object sender, EventArgs e)
        {
            try
            {
                // kiem tra cột số lượng, vị trí 
                DialogResult dr = MessageBox.Show("Bạn đã kiểm tra kỹ danh sách nhập hàng?", "Thông Báo!", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                if (dr == DialogResult.Yes)
                {
                    if (checkXuat())
                    {
                        for (int i = 0; i < gridViewNhapHang.RowCount; i++)
                        {
                            object[] parameter = new object[9];
                            parameter[0] = Convert.ToInt32(gridViewNhapHang.GetRowCellValue(i, "STT").ToString().Trim()); //stt
                            parameter[1] = gridViewNhapHang.GetRowCellValue(i, "MaSp").ToString().Trim(); // masp

                            object[] TtSanPham = NhapHangDAO.Instance.prTtSanPham(parameter[1].ToString().Trim()); 

                            parameter[2] = gridViewNhapHang.GetRowCellValue(i, "TenSp").ToString().Trim(); // tensp
                            parameter[3] = TtSanPham[1]; // maker
                            parameter[4] = TtSanPham[2]; // dvt
                            parameter[5] = Convert.ToInt32(gridViewNhapHang.GetRowCellValue(i, "SoLuongXuat").ToString().Trim()); // sl xuất
                            parameter[6] = gridViewNhapHang.GetRowCellValue(i, "ViTriO").ToString().Trim(); // vi tri 
                            parameter[7] = Convert.ToInt32(gridViewNhapHang.GetRowCellValue(i, "SoLuongTon").ToString().Trim()); // sl ton
                            parameter[8] = gridViewNhapHang.GetRowCellValue(i, "DienGiai").ToString().Trim(); // dien giai
   
                            XuatHangDAO.Instance.prInsertDsXuatHang(parameter);
                        }
                        NhapXuatDAO.Instance.prUPDATETASK("Xuất Hàng");
                        int check = XuatHangDAO.Instance.deletelistXuat();
                        this.Close();
                    }

                }

            }
            catch (Exception line)
            {

                string er = line.StackTrace.ToString();
                string[] b = er.Split(' ');
                string mess = "Err:" + b[b.Length - 1] + " " + line.Message + "";
                MessageBox.Show(mess, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                NhapHangDAO.Instance.deleteDsNhapHang();

            }
        }

        bool checkXuat()
        {
            bool check = true;
            for (int i = 0; i < gridViewNhapHang.RowCount; i++)
            {
                int Stt = Convert.ToInt32(gridViewNhapHang.GetRowCellValue(i, "STT").ToString().Trim());
                int SoLuong = Convert.ToInt32(gridViewNhapHang.GetRowCellValue(i, "SoLuongXuat").ToString().Trim());
                int soLuongMax = Convert.ToInt32(gridViewNhapHang.GetRowCellValue(i, "SoLuongTon").ToString().Trim());
                string TenSp = gridViewNhapHang.GetRowCellValue(i, "TenSp").ToString().Trim();
                string msp = gridViewNhapHang.GetRowCellValue(i, "MaSp").ToString().Trim();
                string ViTri = gridViewNhapHang.GetRowCellValue(i, "ViTriO").ToString().Trim();
                if (SoLuong == 0)
                {
                    check = false;
                    MessageBox.Show("Bạn chưa nhập số lượng sản phẩm: STT-" + Stt.ToString() +" " + TenSp , "Thông Báo!", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    break;
                }
                else if (SoLuong < 0 && SoLuong > soLuongMax)
                {
                    check = false;
                    MessageBox.Show("Số lượng nhập không phù hợp!", "Thông Báo!", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    break;
                }
               

            }
            return check;
        }

        private void gridViewNhapHang_RowClick(object sender, DevExpress.XtraGrid.Views.Grid.RowClickEventArgs e)
        {
            index = e.RowHandle;
            string msp = gridViewNhapHang.GetRowCellValue(index, "MaSp").ToString();
            DataTable dataTable = new DataTable();
            dataTable = ViTriXuat(msp);
            searchLookUpEditVitrixuat.Properties.DataSource = dataTable;
        }
        int index = -1;
        private void gridControlXuatHang_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.Delete)
            {
                // DialogResult lkResult = MessageBox.Show("", "", MessageBoxButtons.YesNo);
                gridViewNhapHang.DeleteRow(index);
                index = -1;
                tongSoLuongsanPham();
                ViTriXuat();
            }
        }
        DataTable ViTriXuat(string maSp)
        {

            DataTable dataTableDsO = XuatHangDAO.Instance.prVitriHangTon(maSp);
            //if (dataTableDsO.Rows.Count > 0)
            //{
            //    repositoryItemComboBoxViTri.Items.Clear();
            //    for (int i = 0; i < dataTableDsO.Rows.Count; i++)
            //    {
            //        repositoryItemComboBoxViTri.Items.Add(dataTableDsO.Rows[i][6].ToString());
            //    }
            //}

            return dataTableDsO;
        }
    }
}
