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
    public partial class ucNxDieuChinh : UserControl
    {
        DataTable dataTable = new DataTable();
        public ucNxDieuChinh()
        {
            InitializeComponent();
            
            dataTable.Columns.Add("MaSp", typeof(string));
            dataTable.Columns.Add("TenSp", typeof(string));
            dataTable.Columns.Add("Maker", typeof(string));
            dataTable.Columns.Add("DVT", typeof(string));
            dataTable.Columns.Add("TonKho", typeof(Int32));
            dataTable.Columns.Add("QuyDoi", typeof(string));
            dataTable.Columns.Add("lgd", typeof(string));
            dataTable.Columns.Add("slMax", typeof(Int32));
            dataTable.Columns.Add("SoLuong", typeof(Int32));
            dataTable.Columns.Add("ViTriO", typeof(string));
            dataTable.Columns.Add("DienGiai", typeof(string));

            searchLookUpEdit1.Properties.DataSource = NhapHangDAO.Instance.LoadThongTinSanPham();
            searchLookUpEdit1.Properties.DisplayMember = "TenSp";

            repositoryItemSearchLookUpEditViTri2.DisplayMember = "ViTriO";
            //int check = XuatHangDAO.Instance.deletelistXuat();
            //XuatHangDAO.Instance.deleteDsXuatHang();
           
        }

        private void button1_Click(object sender, EventArgs e)
        {
            searchLookUpEdit1.Properties.DataSource = NhapHangDAO.Instance.LoadThongTinSanPham();
        }

        private void searchLookUpEdit1View_RowCellClick(object sender, DevExpress.XtraGrid.Views.Grid.RowCellClickEventArgs e)
        {
            try
            {


                object[] parameter = new object[11];
                parameter[0] = searchLookUpEdit1View.GetRowCellValue(e.RowHandle, "MaSp").ToString().Trim(); //MaSp
                parameter[1] = searchLookUpEdit1View.GetRowCellValue(e.RowHandle, "TenSp").ToString().Trim(); //TenSp

                object[] ttSanPham = NhapHangDAO.Instance.prTtSanPham(parameter[0].ToString());

                parameter[2] = ttSanPham[1]; //Maker
                parameter[3] = ttSanPham[2]; //DVT
                parameter[4] = ttSanPham[5];  //TonKho
                parameter[5] = ttSanPham[4]; //QuyDoi
                parameter[6] =""; //lgd
                parameter[7] = 0; // số lượng
                parameter[8] = 0; // số lượng
                parameter[9] = ""; // Vị trí
                parameter[10] = ""; // diễn giải


                dataTable.Rows.Add(parameter);
                gridControl1.DataSource = null;
                gridControl1.DataSource = dataTable;

            }
            catch (Exception line)
            {

                string er = line.StackTrace.ToString();
                string[] b = er.Split(' ');
                string mess = "Err:" + b[b.Length - 1] + " " + line.Message + "";
                MessageBox.Show(mess, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void repositoryItemComboBox1_KeyDown(object sender, KeyEventArgs e)
        {
            repositoryItemComboBoxLGD.ReadOnly = true;
        }

        private void repositoryItemComboBox1_KeyUp(object sender, KeyEventArgs e)
        {
            repositoryItemComboBoxLGD.ReadOnly = false;
        }

        private void advBandedGridView1_CellValueChanged(object sender, DevExpress.XtraGrid.Views.Base.CellValueChangedEventArgs e)
        {
            if (e.Column.FieldName == "lgd")
            {
                string lgdx = advBandedGridView1.GetRowCellValue(e.RowHandle, "lgd").ToString();
                string MaSp = advBandedGridView1.GetRowCellValue(e.RowHandle, "MaSp").ToString();
                if (string.IsNullOrEmpty(lgdx))
                {
                    repositoryItemComboBoxViTri.ReadOnly = true;
                    //repositoryItemSearchLookUpEditViTri.ReadOnly = true;
                }
                else
                {
                    repositoryItemComboBoxViTri.ReadOnly = false;
                    //repositoryItemSearchLookUpEditViTri.ReadOnly = false;
                    if (lgdx == "Nhập Hàng")
                    {
                        dataTableViTriNhap.Clear();
                        dataTableViTriNhap = VitriNhap(MaSp);
                        
                        gridColumnSL.Caption = "Số Lượng Có Thể Nhập";
                    }
                    else if (lgdx == "Xuất Hàng")
                    {
                        dataTableViTriXuat.Clear();
                        dataTableViTriXuat = ViTriXuat(MaSp);

                        gridColumnSL.Caption = "Số Lượng Tồn Kho";
                    }
                }
            }
            else if (e.Column.FieldName == "ViTriO")
            {
                string vitri = advBandedGridView1.GetRowCellValue(e.RowHandle, "ViTriO").ToString();
                if (string.IsNullOrEmpty(vitri))
                {
                    repositoryItemTextEditSoLuong.ReadOnly = true;
                }
                else
                {
                    repositoryItemTextEditSoLuong.ReadOnly = false;
                    try
                    {

                        string lgdx = advBandedGridView1.GetRowCellValue(e.RowHandle, "lgd").ToString();
                        double sl = 0;
                       
                            if (lgdx == "Nhập Hàng")
                            {
                                for (int i = 0; i < dataTableViTriNhap.Rows.Count; i++)
                                {
                                    string vt = dataTableViTriNhap.Rows[i][0].ToString();
                                    if (vitri == vt)
                                    {
                                        sl = Convert.ToDouble(dataTableViTriNhap.Rows[i][1]);
                                        advBandedGridView1.SetRowCellValue(e.RowHandle, "slMax", sl);
                                        break;
                                    }
                                }

                                
                            }
                            else
                            {
                                for (int i = 0; i < dataTableViTriXuat.Rows.Count; i++)
                                {
                                    string vt = dataTableViTriXuat.Rows[i][6].ToString();
                                    if (vitri == vt)
                                    {
                                        sl = Convert.ToDouble(dataTableViTriXuat.Rows[i][5]);
                                    advBandedGridView1.SetRowCellValue(e.RowHandle, "slMax", sl);
                                    break;
                                    }
                                }

                              
                            } 
                    }
                    catch (Exception)
                    {

                        throw;
                    }

                }
            }
            else if (e.Column.FieldName == "SoLuong")
            {
                try
                {
                    double soluong = Convert.ToDouble(advBandedGridView1.GetRowCellValue(e.RowHandle, "SoLuong"));
                    string vitri = advBandedGridView1.GetRowCellValue(e.RowHandle, "ViTriO").ToString();
                    string lgdx = advBandedGridView1.GetRowCellValue(e.RowHandle, "lgd").ToString();
                    double sl = 0;
                    if (soluong > 0)
                    {
                        if (lgdx == "Nhập Hàng")
                        {
                            for (int i = 0; i < dataTableViTriNhap.Rows.Count; i++)
                            {
                                string vt = dataTableViTriNhap.Rows[i][0].ToString();
                                if (vitri == vt)
                                {
                                    sl = Convert.ToDouble(dataTableViTriNhap.Rows[i][1]);
                                    break;
                                }
                            }

                            if (soluong > sl)
                            {
                                MessageBox.Show("Vị trí: " + vitri.Trim() + " có thể nhập tối đa là: " + sl.ToString()+" sản phẩm.");
                                advBandedGridView1.SetRowCellValue(e.RowHandle, "SoLuong", 0);
                            }
                        }
                        else
                        {
                            for (int i = 0; i < dataTableViTriXuat.Rows.Count; i++)
                            {
                                string vt = dataTableViTriXuat.Rows[i][6].ToString();
                                if (vitri == vt)
                                {
                                    sl = Convert.ToDouble(dataTableViTriXuat.Rows[i][5]);
                                    break;
                                }
                            }

                            if (soluong > sl)
                            {
                                MessageBox.Show("Vị trí: " + vitri.Trim() + " có thể xuất tối đa là: " + sl.ToString() + " sản phẩm.");
                                advBandedGridView1.SetRowCellValue(e.RowHandle, "SoLuong", 0);
                            }
                        }
                    }
                }
                catch (Exception)
                {

                    throw;
                }

            }
        }
        int index = -1;
        private void advBandedGridView1_RowCellClick(object sender, DevExpress.XtraGrid.Views.Grid.RowCellClickEventArgs e)
        {
            index = e.RowHandle;
            //string x = advBandedGridView1.GetRowCellValue(e.RowHandle, "lgd").ToString().Trim();
        }
        private void advBandedGridView1_FocusedRowChanged(object sender, DevExpress.XtraGrid.Views.Base.FocusedRowChangedEventArgs e)
        {
            if (e.FocusedRowHandle > -1)
            {
                string lgdx = advBandedGridView1.GetRowCellValue(e.FocusedRowHandle, "lgd").ToString();
                string MaSp = advBandedGridView1.GetRowCellValue(e.FocusedRowHandle, "MaSp").ToString();
                if (string.IsNullOrEmpty(lgdx))
                {
                    
                    repositoryItemSearchLookUpEditViTri.ReadOnly = true;
                }
                else
                {
                    
                    repositoryItemSearchLookUpEditViTri.ReadOnly = false;
                    if (lgdx == "Nhập Hàng")
                    {
                        //dataTableViTriNhap.Clear();
                        dataTableViTriNhap = VitriNhap(MaSp);
                        //repositoryItemSearchLookUpEditViTri2.DataSource = dataTableViTriNhap;
                        //gridColumnSL.Caption = "Số Lượng Có Thể Nhập";
                    }
                    else if (lgdx == "Xuất Hàng")
                    {
                        //dataTableViTriXuat.Clear();
                        dataTableViTriXuat = ViTriXuat(MaSp);
                        //repositoryItemSearchLookUpEditViTri2.DataSource = dataTableViTriXuat;
                        //gridColumnSL.Caption = "Số Lượng Tồn Kho";
                    }
                }


                string vitri = advBandedGridView1.GetRowCellValue(e.FocusedRowHandle, "ViTriO").ToString(); ;
                if (string.IsNullOrEmpty(lgdx))
                {
                    repositoryItemTextEditSoLuong.ReadOnly = true;
                }
                else
                {
                    repositoryItemTextEditSoLuong.ReadOnly = false;
                }
            
            }
        }


        DataTable dataTableViTriNhap = new DataTable();
        DataTable dataTableViTriXuat = new DataTable();
        DataTable VitriNhap(string maSp)
        {
            DataTable dataTable = new DataTable();

            dataTable.Columns.Add("ViTriO", typeof(string));
            dataTable.Columns.Add("SoLuong", typeof(double));
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
            if (dataTableDsOtrong.Rows.Count > 0)
            {
                repositoryItemComboBoxViTri.Items.Clear();
                for (int i = 0; i < dataTableDsOtrong.Rows.Count; i++)
                {
                    repositoryItemComboBoxViTri.Items.Add(dataTableDsOtrong.Rows[i][0].ToString());
                    dataTable.Rows.Add(dataTableDsOtrong.Rows[i][0].ToString(),
                                        Convert.ToDouble(dataTableDsOtrong.Rows[i][2])
                                        ); ;                                   
                }
            }
            else
            {
                MessageBox.Show("Không còn vị trí chứa sản phẩm!", "Thông Báo!", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }

            return dataTable;

        }

        DataTable ViTriXuat(string maSp)
        {

            DataTable dataTableDsO = XuatHangDAO.Instance.prVitriHangTon(maSp);
            if (dataTableDsO.Rows.Count>0)
            {
                repositoryItemComboBoxViTri.Items.Clear();
                for (int i = 0; i < dataTableDsO.Rows.Count; i++)
                {
                    repositoryItemComboBoxViTri.Items.Add(dataTableDsO.Rows[i][6].ToString());
                }
            }
            
            return dataTableDsO;
        }

        private void gridControl1_Click(object sender, EventArgs e)
        {

        }

        private void guna2GradientButtonHuy_Click(object sender, EventArgs e)
        {
            dataTable.Rows.Clear();
            //gridControl1.DataSource = null;
        }

        private void guna2GradientButtonDongY_Click(object sender, EventArgs e)
        {
            try
            {
                for (int i = 0; i < advBandedGridView1.RowCount; i++)
                {
                    string lgd = advBandedGridView1.GetRowCellValue(i, "lgd").ToString().Trim();
                    if (lgd == "Nhập Hàng")
                    {
                        updateSQLNhapHang(i);
                    }
                    else if (lgd == "Xuất Hàng")
                    {
                        updateSQLXuatHang(i);
                    }
                }
                MessageBox.Show("Hoàn thành!");
                dataTable.Rows.Clear();
            }
            catch (Exception line)
            {
                string er = line.StackTrace.ToString();
                string[] b = er.Split(' ');
                string mess = "Err:" + b[b.Length - 1] + " " + line.Message + "";
                MessageBox.Show(mess, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            searchLookUpEdit1.Properties.DataSource = NhapHangDAO.Instance.LoadThongTinSanPham();
        }

        void updateSQLNhapHang(int i)
        {
            Int32 soLuong = Convert.ToInt32(advBandedGridView1.GetRowCellValue(i, "SoLuong").ToString().Trim());
            if (soLuong>0)
            {
                string Msp = advBandedGridView1.GetRowCellValue(i, "MaSp").ToString().Trim();
                string Tensp = advBandedGridView1.GetRowCellValue(i, "TenSp").ToString().Trim();
                object[] TtSanPham = NhapHangDAO.Instance.prTtSanPham(Msp);
                string NhomSp = TtSanPham[3].ToString();
                string Maker = advBandedGridView1.GetRowCellValue(i, "Maker").ToString().Trim();
                string DonViTinh = advBandedGridView1.GetRowCellValue(i, "DVT").ToString().Trim();
                string ViTri = advBandedGridView1.GetRowCellValue(i, "ViTriO").ToString().Trim();
                Int32 soLuongMax = Convert.ToInt32(advBandedGridView1.GetRowCellValue(i, "slMax").ToString().Trim());
                string DienGiai = "[Nhập xuất điều chỉnh]: " + advBandedGridView1.GetRowCellValue(i, "DienGiai").ToString().Trim(); ;

                if (soLuong < soLuongMax && soLuong > 0) // update trạng thái ô ( 1 = có hàng , 2 = đầy)
                {
                    DataDAO.Instance.prUpdateTtViTriChk(ViTri, 1);
                }
                else if (soLuong >= soLuongMax)
                {
                    DataDAO.Instance.prUpdateTtViTriChk(ViTri, 2);

                }
                DataDAO.Instance.prUpdateSlTonDsSanPham(Msp, soLuong); // cập nhật Sl sản phẩm dssp

                if (DataDAO.Instance.prCheckTonKho(Msp, ViTri))  // tônf kho
                {
                    DataDAO.Instance.prUpdateSlTonKhoNhap(Msp, ViTri, soLuong);
                }
                else
                {
                    object[] parameter = new object[8];
                    parameter[0] = Msp;
                    parameter[1] = Tensp;
                    parameter[2] = NhomSp;
                    parameter[3] = Maker;
                    parameter[4] = DonViTinh;
                    parameter[5] = soLuong;
                    parameter[6] = ViTri;
                    parameter[7] = soLuongMax;
                    DataDAO.Instance.prINSERTTonKho(parameter);

                }

                // lịch sử nhập xuất
                object[] parameter2 = new object[8];
                parameter2[0] = Msp;
                parameter2[1] = Tensp;
                parameter2[2] = Maker;
                parameter2[3] = "Nhập Hàng";
                parameter2[4] = DonViTinh;
                parameter2[5] = soLuong;
                parameter2[6] = ViTri;
                parameter2[7] = DienGiai;
                DataDAO.Instance.prINSERTLichSu(parameter2);
            }
            
   
        }

        void updateSQLXuatHang(int i)
        {

            Int32 soLuongXuat = Convert.ToInt32(advBandedGridView1.GetRowCellValue(i, "SoLuong").ToString().Trim());
            if (soLuongXuat>0)
            {
                string Msp = advBandedGridView1.GetRowCellValue(i, "MaSp").ToString().Trim();
                string Tensp = advBandedGridView1.GetRowCellValue(i, "TenSp").ToString().Trim();
                object[] TtSanPham = NhapHangDAO.Instance.prTtSanPham(Msp);
                string NhomSp = TtSanPham[3].ToString();
                string Maker = advBandedGridView1.GetRowCellValue(i, "Maker").ToString().Trim();
                string DonViTinh = advBandedGridView1.GetRowCellValue(i, "DVT").ToString().Trim();

                string ViTri = advBandedGridView1.GetRowCellValue(i, "ViTriO").ToString().Trim();
                Int32 soLuongTon = Convert.ToInt32(advBandedGridView1.GetRowCellValue(i, "slMax").ToString().Trim());
                string DienGiai = "[Nhập xuất điều chỉnh]: " + advBandedGridView1.GetRowCellValue(i, "DienGiai").ToString().Trim();

                if (soLuongXuat < soLuongTon && soLuongXuat > 0) // update trạng thái ô ( 1 = có hàng , 2 = đầy , 0 = trống)
                {
                    DataDAO.Instance.prUpdateTtViTriChk(ViTri, 1);
                    int sl = soLuongTon - soLuongXuat;
                    DataDAO.Instance.prUpdateSlTonKhoXuat(Msp, ViTri, sl);
                }
                else if (soLuongXuat == soLuongTon)
                {
                    DataDAO.Instance.prUpdateTtViTriChk(ViTri, 0);
                    DataDAO.Instance.prDeleteSlTonKho(Msp, ViTri);

                }
                int soluongx = 0 - soLuongXuat;
                DataDAO.Instance.prUpdateSlTonDsSanPham(Msp, soluongx); // cập nhật Sl sản phẩm dssp


                // lịch sử nhập xuất
                object[] parameter2 = new object[8];
                parameter2[0] = Msp;
                parameter2[1] = Tensp;
                parameter2[2] = Maker;
                parameter2[3] = "Xuất Hàng";
                parameter2[4] = DonViTinh;
                parameter2[5] = soLuongXuat;
                parameter2[6] = ViTri;
                parameter2[7] = DienGiai;
                DataDAO.Instance.prINSERTLichSu(parameter2);
            }
   
        }

        private void advBandedGridView1_KeyPress(object sender, KeyPressEventArgs e)
        {
            
        }

        private void advBandedGridView1_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.Delete)
            {
                if (index>=0)
                {
                    gridView1.DeleteRow(index);
                    dataTable.Rows.RemoveAt(index);
                    index = -1;
                }
                // DialogResult lkResult = MessageBox.Show("", "", MessageBoxButtons.YesNo);
              
                
            }
        }
    }
}
