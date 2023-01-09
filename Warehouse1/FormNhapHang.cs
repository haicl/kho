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
    public partial class FormNhapHang : Form
    {
        public FormNhapHang()
        {
            InitializeComponent();
        }
        DataTable dtdsNhapHang = new DataTable();
        private void FormNhapHang_Load(object sender, EventArgs e)
        {
            // TODO: This line of code loads data into the 'khoIntech22DataSet.DSSANPHAM' table. You can move, or remove it, as needed.
            NhapHangDAO.Instance.deleteDsNhapHang();
            int check = NhapHangDAO.Instance.deletelistNhap();
            searchLookUpEdit1.Properties.DataSource = NhapHangDAO.Instance.LoadThongTinSanPham();
            searchLookUpEdit1.Properties.DisplayMember = "TenSp";

            searchLookUpEdit2.Properties.DisplayMember = "viTriO";
            dtdsNhapHang = NhapHangDAO.Instance.dboDsNhapHang();
        }

        private void FormNhapHang_FormClosed(object sender, FormClosedEventArgs e)
        {
            int check = NhapHangDAO.Instance.deletelistNhap();
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

        private void searchLookUpEdit1View_RowCellClick(object sender, DevExpress.XtraGrid.Views.Grid.RowCellClickEventArgs e)
        {
            try
            {
                

                object[] parameter = new object[11];
                parameter[0] = dtdsNhapHang.Rows.Count + 1; //stt
                parameter[1] = searchLookUpEdit1View.GetRowCellValue(e.RowHandle, "MaSp").ToString().Trim(); //MaSp
                parameter[2] = searchLookUpEdit1View.GetRowCellValue(e.RowHandle, "TenSp").ToString().Trim(); //TenSp
                string[] makerDVT = NhapHangDAO.Instance.prMaker(parameter[1].ToString(), parameter[2].ToString());
                parameter[3] = makerDVT[0]; //Maker
                parameter[4] = makerDVT[1]; //DVT
                parameter[5] = 0; //sl
                parameter[6] = ""; //Vị trí
                parameter[7] = 0; //dung lượng ô
                parameter[8] = ""; // diễn giải
                parameter[9] = 0; // check đầy
                parameter[10] = makerDVT[7]; // Quy đổi
                bool checkspNhap = NhapHangDAO.Instance.CheckSpNhap(parameter[1].ToString().Trim());
                if (checkspNhap)
                {
                    NhapHangDAO.Instance.prInsertlistNhap(parameter[1].ToString().Trim());
                    dtdsNhapHang.Rows.Add(parameter);

                    guna2TextBoxMaSp.Text = parameter[1].ToString();
                    guna2TextBoxTenSp.Text = parameter[2].ToString();
                    guna2TextBoxMaker.Text = parameter[3].ToString();
                    comboBoxEditDonVi.Text = parameter[4].ToString();
                    numericUpDownSoLuong.Value = Convert.ToInt32(makerDVT[2]);

                    numericUpDownChieuDai.Value = Convert.ToInt32(makerDVT[3]);//String.Format("{0:#,###;}", makerDVT[3]);
                    numericUpDownChieuDai.Value = Convert.ToDecimal(makerDVT[4]);
                    numericUpDownChieuRong.Value = Convert.ToDecimal(makerDVT[5]);
                    numericUpDownKhoiLuong.Value = Convert.ToDecimal(makerDVT[6]);
                    guna2TextBoxQuyDoi.Text = makerDVT[7].ToString().Trim();

                    gridControlNhapHang.DataSource = null;
                    gridControlNhapHang.DataSource = dtdsNhapHang;
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

        int index = -1;
        private void gridViewNhapHang_RowClick(object sender, DevExpress.XtraGrid.Views.Grid.RowClickEventArgs e)
        {
            index = e.RowHandle;
            string msp = gridViewNhapHang.GetRowCellValue(index, "MaSp").ToString() ;
            DataTable dataTable = new DataTable();
            dataTable = VitriNhap(msp);
            searchLookUpEdit2.Properties.DataSource = dataTable;
        }

        private void gridControlNhapHang_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.Delete)
            {
                // DialogResult lkResult = MessageBox.Show("", "", MessageBoxButtons.YesNo);
                gridViewNhapHang.DeleteRow(index);
                index = -1;
                tongSoLuongsanPham();
                nhapHangMoi();
            }
        }

        #region tìm vị trí
        private void gridViewNhapHang_CellValueChanged(object sender, DevExpress.XtraGrid.Views.Base.CellValueChangedEventArgs e)
        {
            try
            {

                if (e.Column.Caption == "Số Lượng" )
                {
                    int soLuongNhap = 0;
                    int intRows = e.RowHandle;
                    try
                    {
                        soLuongNhap = Convert.ToInt32(e.Value);
                    }
                    catch
                    {

                        gridViewNhapHang.SetRowCellValue(e.RowHandle, "SoLuong", 0);
                    }
                    if (soLuongNhap >0)
                    {
                        string maSp = gridViewNhapHang.GetRowCellValue(e.RowHandle, "MaSp").ToString().Trim();
                        tongSoLuongsanPham();
                        nhapHangMoi();
                        gridColumn5.OptionsColumn.AllowFocus = true;
                    }

                    
                }
                else if (e.Column.FieldName == "ViTriO")
                {
                    string maSp = gridViewNhapHang.GetRowCellValue(e.RowHandle, "MaSp").ToString().Trim();
                    string vitri = e.Value.ToString().Trim();
                    int checkVitri = NhapHangDAO.Instance.CheckViTriNhap(maSp, vitri);
                    if (checkVitri == 0)
                    {
                        //gridColumn5.OptionsColumn.AllowFocus = false;
                        MessageBox.Show("Vị trí bạn vừa nhập không hợp lệ!");
                        //gridViewNhapHang.SetRowCellValue(e.RowHandle, "ViTriO", viTri1);
                        //gridColumn5.OptionsColumn.AllowFocus = true;
                    }
                    else if (checkVitri ==1)
                    {
                        //double m3Sp = NhapHangDAO.Instance.ktSanPham(maSp);
                        //DataTable dataTableDsOtrong = NhapHangDAO.Instance.dsOtrong(m3Sp);
                        //for (int i = 0; i < dataTableDsOtrong.Rows.Count; i++)
                        //{
                        //    string vitritrong = dataTableDsOtrong.Rows[i][0].ToString().Trim();
                        //    if (vitri== vitritrong)
                        //    {
                        //        int soluong = Convert.ToInt32(dataTableDsOtrong.Rows[i][2].ToString());
                        //        gridViewNhapHang.SetRowCellValue(e.RowHandle, "SoLuongMaxO", soluong);
                        //    }
                        //}
                    }
                    else if (checkVitri ==2)
                    {
                        MessageBox.Show("Không thể nhập hàng vào vị trí bạn vừa nhập!");
                        //gridViewNhapHang.SetRowCellValue(e.RowHandle, "ViTriO", viTri1);
                    }
                    else if (checkVitri == 3)
                    {
                        // kiểm tra sl có thể thêm 
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


        void updateListNhap()
        {
            int check = NhapHangDAO.Instance.deletelistNhap();
            if (gridViewNhapHang.RowCount > 0)
            {
                List<string> vsLoc = new List<string>();
                for (int j = 0; j < gridViewNhapHang.RowCount; j++)
                {
                    string msp = gridViewNhapHang.GetRowCellValue(j, "MaSp").ToString().Trim();
                    vsLoc.Add(msp);
                }
                List<string> vs1 = vsLoc.Distinct().ToList();
                if (vs1.Count>0)
                {
                    foreach (string item in vs1)
                    {
                        int checkspNhap = NhapHangDAO.Instance.prInsertlistNhap(item);
                    }
                }
            }
        }
        // update lại listNhap > tong so sp > nhạp hàng
        void tongSoLuongsanPham()
        {
            updateListNhap();
            DataTable dboListNhap = NhapHangDAO.Instance.dbolistNhap();
            for (int i = 0; i < dboListNhap.Rows.Count; i++)
            {
                if (dboListNhap.Rows.Count >0)
                {
                    string msp = dboListNhap.Rows[i][0].ToString().Trim();
                    Int32 soluongsp = 0;
                    for (int j = 0; j < gridViewNhapHang.RowCount; j++)
                    {
                        if (gridViewNhapHang.RowCount > 0)
                        {
                            if (gridViewNhapHang.GetRowCellValue(j, "MaSp").ToString().Trim() == msp)
                            {
                                int sl = Convert.ToInt32(gridViewNhapHang.GetRowCellValue(j, "SoLuong"));
                                soluongsp = soluongsp + sl;
                            }
                        }
                    }
                    int cc = NhapHangDAO.Instance.updateSoLuonglistNhap(msp, soluongsp);
                }
            }
            
        }

        void nhapHangMoi() 
        { 
            dtdsNhapHang.Rows.Clear();
            DataTable dboListNhap = NhapHangDAO.Instance.dbolistNhap();
            for (int i = 0; i < dboListNhap.Rows.Count; i++)
            {
                if (dboListNhap.Rows.Count>0)
                {
                    string maSp = dboListNhap.Rows[i][0].ToString().Trim();
                    int slNhap =Convert.ToInt32( dboListNhap.Rows[i][1].ToString());
                    double m3Sp = NhapHangDAO.Instance.ktSanPham(maSp);
                    DataTable dataTableDsOtrong = new DataTable();
                    //int slMaxO = Convert.ToInt32(dataTableDsOtrong.Rows[0][2].ToString());
                    int slMaxNhap = 2000;
                    int slMaxO = 2000;
                    if (NhapHangDAO.Instance.CheckSpTonKho(maSp))//tìm vị trí sản phẩm đã nhập sp đã nhập
                    {
                        dataTableDsOtrong = NhapHangDAO.Instance.dsOspDaNhap(maSp,m3Sp);
                    }
                    else
                    {
                        dataTableDsOtrong = NhapHangDAO.Instance.dsOtrong(m3Sp);
                    }

                    if (dtdsNhapHang.Rows.Count > 0)
                    {
                        for (int j = 0; j < dtdsNhapHang.Rows.Count; j++)
                        {
                            string viTri0 = dtdsNhapHang.Rows[j][6].ToString().Trim();
                            for (int k = dataTableDsOtrong.Rows.Count - 1; k >= 0; k--)
                            {
                                string otrongTrung = dataTableDsOtrong.Rows[k][0].ToString().Trim();
                                if (viTri0 == otrongTrung)
                                {
                                    dataTableDsOtrong.Rows.RemoveAt(k);
                                }
                            }
                        }
                    }

                    if (dataTableDsOtrong.Rows.Count > 0)
                    {
                        object[] TtSanPham = NhapHangDAO.Instance.prTtSanPham(maSp);

                        object[] parameter = new object[11];
                        parameter[0] = dtdsNhapHang.Rows.Count + 1; //stt
                        parameter[1] = maSp; //MaSp
                        parameter[2] = TtSanPham[0]; //TenSp
                        parameter[3] = TtSanPham[1]; //Maker
                        parameter[4] = TtSanPham[2]; //DVT
                        slMaxNhap = Convert.ToInt32(dataTableDsOtrong.Rows[0][2].ToString());
                        slMaxO = Convert.ToInt32(dataTableDsOtrong.Rows[0][3].ToString());
                        if (slNhap <= slMaxNhap)
                        {
                            parameter[5] = slNhap;
                            slNhap = 0;
                        }
                        else
                        {
                            parameter[5] = slMaxNhap;
                            slNhap = slNhap - slMaxNhap;
                        }

                        parameter[6] = dataTableDsOtrong.Rows[0][0].ToString().Trim(); //Vị trí
                        parameter[7] = slMaxO; //dung lượng ô   s
                        parameter[8] = ""; // diễn giải
                        parameter[9] = 0; // check đầy
                        parameter[10] = TtSanPham[4].ToString().Trim() ; // Quy Đổi
                        dtdsNhapHang.Rows.Add(parameter);
                        dataTableDsOtrong.Rows.RemoveAt(0);

                        while (slNhap > 0)
                        {
                            slMaxNhap = Convert.ToInt32(dataTableDsOtrong.Rows[0][2].ToString());
                            slMaxO = Convert.ToInt32(dataTableDsOtrong.Rows[0][3].ToString());
                            parameter[0] = dtdsNhapHang.Rows.Count + 1;
                            if (slNhap <= slMaxNhap)
                            {
                                parameter[5] = slNhap;
                                slNhap = 0;
                            }
                            else
                            {
                                parameter[5] = slMaxNhap;
                                slNhap = slNhap - slMaxNhap;
                            }

                            parameter[6] = dataTableDsOtrong.Rows[0][0].ToString().Trim(); //Vị trí
                            parameter[7] = slMaxO; //dung lượng ô   s
                            dtdsNhapHang.Rows.Add(parameter);
                            dataTableDsOtrong.Rows.RemoveAt(0);
                        }
                    }
                    else
                    {
                        MessageBox.Show("Không còn vị trí chứa sản phẩm!", "Thông Báo!", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    }
                }
            }
            gridControlNhapHang.DataSource = null;
            gridControlNhapHang.DataSource = dtdsNhapHang;

        }

        DataTable VitriNhap(string maSp)
        {
            DataTable dataTable = new DataTable();

            //dataTable.Columns.Add("ViTriO", typeof(string));
            //dataTable.Columns.Add("SoLuong", typeof(double));
            //string maSp = dboListNhap.Rows[i][0].ToString().Trim();
            //int slNhap = Convert.ToInt32(dboListNhap.Rows[i][1].ToString());
            double m3Sp = NhapHangDAO.Instance.ktSanPham(maSp);
            DataTable dataTableDsOtrong = new DataTable();
            //int slMaxO = Convert.ToInt32(dataTableDsOtrong.Rows[0][2].ToString());

            if (NhapHangDAO.Instance.CheckSpTonKho(maSp))//tìm vị trí sản phẩm đã nhập sp đã nhập
            {
                dataTableDsOtrong = NhapHangDAO.Instance.dsOspDaNhap(maSp, m3Sp);
            }
            else
            {
                dataTableDsOtrong = NhapHangDAO.Instance.dsOtrong(m3Sp);
            }

            return dataTableDsOtrong;

        }
        #endregion

        private void guna2GradientButtonHuy_Click(object sender, EventArgs e)
        {
            if (dtdsNhapHang.Rows.Count>0)
            {
                DialogResult dr = MessageBox.Show("Bạn muốn xóa dữ liệu đã nhập?", "Thông Báo!", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                if (dr == DialogResult.Yes)
                {
                    int check = NhapHangDAO.Instance.deletelistNhap();
                    dtdsNhapHang.Rows.Clear();
                    //gridControlNhapHang.DataSource = null;
                    gridControlNhapHang.DataSource = dtdsNhapHang;
                }
            }
           
        }


        private void gridViewNhapHang_FocusedColumnChanged(object sender, DevExpress.XtraGrid.Views.Base.FocusedColumnChangedEventArgs e)
        {
            DevExpress.XtraGrid.Views.Grid.GridView gridView = (DevExpress.XtraGrid.Views.Grid.GridView)sender;
            if (gridView.FocusedColumn.FieldName == "ViTriO")
            {
               // MessageBox.Show(gridView.FocusedValue.ToString());
            }
            
        }

        //string viTri1 = null;
   
        private void gridViewNhapHang_RowCellClick(object sender, DevExpress.XtraGrid.Views.Grid.RowCellClickEventArgs e)
        {
            if (e.Column.FieldName == "ViTriO")
            {
                //string maSp = gridViewNhapHang.GetRowCellValue(e.RowHandle, "MaSp").ToString().Trim();
                //double m3Sp = NhapHangDAO.Instance.ktSanPham(maSp);
                //DataTable dataTableDsOtrong = NhapHangDAO.Instance.dsOtrong(m3Sp);
                //if (dtdsNhapHang.Rows.Count > 0)
                //{
                //    for (int j = 0; j < dtdsNhapHang.Rows.Count; j++)
                //    {
                //        string viTri0 = dtdsNhapHang.Rows[j][6].ToString().Trim();
                //        for (int k = dataTableDsOtrong.Rows.Count - 1; k >= 0; k--)
                //        {
                //            string otrongTrung = dataTableDsOtrong.Rows[k][0].ToString().Trim();
                //            if (viTri0 == otrongTrung)
                //            {
                //                dataTableDsOtrong.Rows.RemoveAt(k);
                //            }
                //        }
                //    }
                //}
                //viTri1 = e.CellValue.ToString();
                //int check = NhapHangDAO.Instance.CheckViTriNhap(maSp, viTri1);
                //if (check==0)
                //{
                //    viTri1 = dataTableDsOtrong.Rows[0][0].ToString().Trim();
                //}
            }
        }
        bool checkNhap()
        {
            bool check = true;
            for (int i = 0; i < gridViewNhapHang.RowCount; i++)
            {
                int Stt = Convert.ToInt32(gridViewNhapHang.GetRowCellValue(i, "STT").ToString().Trim());
                int SoLuong = Convert.ToInt32(gridViewNhapHang.GetRowCellValue(i, "SoLuong").ToString().Trim());
                int soLuongMax = Convert.ToInt32(gridViewNhapHang.GetRowCellValue(i, "SoLuongMaxO").ToString().Trim());
                string TenSp = gridViewNhapHang.GetRowCellValue(i, "TenSp").ToString().Trim();
                string msp = gridViewNhapHang.GetRowCellValue(i, "MaSp").ToString().Trim();
                string ViTri = gridViewNhapHang.GetRowCellValue(i, "ViTriO").ToString().Trim();
                if (SoLuong == 0)
                {
                    check = false;
                    MessageBox.Show("Bạn chưa nhập số lượng sản phẩm: "+ TenSp +" "+Stt.ToString(), "Thông Báo!", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    break;
                }
                else if (SoLuong < 0 && SoLuong > soLuongMax )
                {
                    check = false;
                    MessageBox.Show("Số lượng nhập không phù hợp!" , "Thông Báo!", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    break;
                }
                int checkVitri = NhapHangDAO.Instance.CheckViTriNhap(msp, ViTri);
                if (checkVitri == 0)
                {
                    check = false;
                    //gridColumn5.OptionsColumn.AllowFocus = false;
                    MessageBox.Show("Vị trí bạn vừa nhập không hợp lệ!");
                    //gridViewNhapHang.SetRowCellValue(e.RowHandle, "ViTriO", viTri1);
                    //gridColumn5.OptionsColumn.AllowFocus = true;
                    break;
                }
                else if (checkVitri == 1)
                {
                    //double m3Sp = NhapHangDAO.Instance.ktSanPham(maSp);
                    //DataTable dataTableDsOtrong = NhapHangDAO.Instance.dsOtrong(m3Sp);
                    //for (int i = 0; i < dataTableDsOtrong.Rows.Count; i++)
                    //{
                    //    string vitritrong = dataTableDsOtrong.Rows[i][0].ToString().Trim();
                    //    if (vitri== vitritrong)
                    //    {
                    //        int soluong = Convert.ToInt32(dataTableDsOtrong.Rows[i][2].ToString());
                    //        gridViewNhapHang.SetRowCellValue(e.RowHandle, "SoLuongMaxO", soluong);
                    //    }
                    //}
                }
                else if (checkVitri == 2)
                {
                    check = false; 
                    MessageBox.Show("Không thể nhập hàng vào vị trí bạn vừa nhập!");
                    //gridViewNhapHang.SetRowCellValue(e.RowHandle, "ViTriO", viTri1);
                    break;
                }
                else if (checkVitri == 3)
                {
                    // kiểm tra sl có thể thêm 
                }

            }
            return check;
        }
        private void guna2GradientButtonDongY_Click(object sender, EventArgs e)
        {
            try
            {
                // kiem tra cột số lượng, vị trí 
                DialogResult dr = MessageBox.Show("Bạn đã kiểm tra danh sách nhập hàng?", "Thông Báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                if (dr == DialogResult.Yes)
                {
                    if (checkNhap())
                    {
                        for (int i = 0; i < gridViewNhapHang.RowCount; i++)
                        {
                            object[] parameter = new object[10];
                            parameter[0] = Convert.ToInt32(gridViewNhapHang.GetRowCellValue(i, "STT").ToString().Trim());
                            parameter[1] = gridViewNhapHang.GetRowCellValue(i, "MaSp").ToString().Trim();
                            parameter[2] = gridViewNhapHang.GetRowCellValue(i, "TenSp").ToString().Trim();
                            parameter[3] = gridViewNhapHang.GetRowCellValue(i, "Maker").ToString().Trim();
                            parameter[4] = gridViewNhapHang.GetRowCellValue(i, "DonViTinh").ToString().Trim();
                            parameter[5] = Convert.ToInt32(gridViewNhapHang.GetRowCellValue(i, "SoLuong").ToString().Trim());
                            parameter[6] = gridViewNhapHang.GetRowCellValue(i, "ViTriO").ToString().Trim();
                            parameter[7] = Convert.ToInt32(gridViewNhapHang.GetRowCellValue(i, "SoLuongMaxO").ToString().Trim());
                            parameter[8] = gridViewNhapHang.GetRowCellValue(i, "DienGiai").ToString().Trim();
                            parameter[9] = 0;
                            NhapHangDAO.Instance.prInserDsNhapHang(parameter);
                        }

                        NhapXuatDAO.Instance.prUPDATETASK("Nhập Hàng");
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

        #region thêm sửa xóa

        #endregion

        bool checkThem()
        {
            bool check = true;
            string Msp = guna2TextBoxMaSp.Text.Trim();
            string DonViTinh = comboBoxEditDonVi.Text;
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

        private void guna2GradientButtonThem_Click(object sender, EventArgs e)
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
                string DonViTinh = comboBoxEditDonVi.Text;
                float KhoiLuong = (float)(numericUpDownKhoiLuong.Value);
                float cDai = (float)(numericUpDownKhoiLuong.Value);
                float cRong = (float)(numericUpDownChieuRong.Value);
                float cCao = (float)(numericUpDownCCao.Value);
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
                if (cDai == 0)
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
                if (cCao == 0)
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
                if (check > 0)
                {
                    searchLookUpEdit1.Properties.DataSource = NhapHangDAO.Instance.LoadThongTinSanPham();
                    MessageBox.Show("Thành Công");
                    
                }
                else
                {
                    MessageBox.Show("Lỗi");
                }
            }
        }

        private void guna2GradientButtonSua_Click(object sender, EventArgs e)
        {

        }

        private void guna2GradientButtonXoa_Click(object sender, EventArgs e)
        {

        }

        private void searchLookUpEdit1_Click(object sender, EventArgs e)
        {
            //searchLookUpEdit1.Properties.DataSource = NhapHangDAO.Instance.LoadThongTinSanPham();
        }

        private void searchLookUpEdit1View_ShowingPopupEditForm(object sender, DevExpress.XtraGrid.Views.Grid.ShowingPopupEditFormEventArgs e)
        {
            //MessageBox.Show("Lỗi!");
        }

        private void gridControlNhapHang_Click(object sender, EventArgs e)
        {

        }
    }
}
