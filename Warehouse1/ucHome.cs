using DevExpress.XtraEditors;
using F_Khay;
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
    public partial class ucHome : UserControl
    {
        private List<string> vsListTangNhapHang = new List<string>();

        public ucHome()
        {
            InitializeComponent();
            loadTTK();
            //chartControl1.Series[0].Points[0].Values[0] = 9;
        }

        private void ucHome_Load(object sender, EventArgs e)
        {
            loadTrays();

        }


        void loadTTK()
        {
            int soluongMatHang = DAO_Khay.Instance.soLuongMatHang();
            double giaTriKho = DAO_Khay.Instance.giaTriKho();
            int soluongKhay = DAO_Khay.Instance.soLuongKhay().Rows.Count;
            progressBarControlTtk.Position = soluongKhay;


            labelControlSlMatHang.Text = soluongMatHang.ToString("N0");
            labelControlGiaTriKho.Text = giaTriKho.ToString("N0");
            labelControlslKhay.Text = soluongKhay.ToString("N0")+"/19";

            double slOdaDung = DAO_Khay.Instance.slOdaDung();
            double sloTrong = DAO_Khay.Instance.slOtrong();
            double slOday = DAO_Khay.Instance.slOday();

            chartControl1.Series[0].Points[0].Values[0] = slOdaDung;
            chartControl1.Series[0].Points[1].Values[0] = slOday;
            chartControl1.Series[0].Points[2].Values[0] = sloTrong;

        }

        private void ButtonChay_Click(object sender, EventArgs e)
        {

        }

        public void ButtonChay_MouseUp(object sender, MouseEventArgs e)
        {
            ClassPlc startplc = new ClassPlc();
            startplc.chayplc_uchome();
        }

        private void ButtonChay_MouseDown(object sender, MouseEventArgs e)
        {
            ClassPlc check_conn_plc = new ClassPlc();
            if (check_conn_plc.check_connect_plc() == false)
            {
                XtraMessageBox.Show("Chưa kết nối PLC! ");
            }
            else
            {
                check_conn_plc.chayplc_uchome();
            }

        }

        private void buttonDung_MouseUp(object sender, MouseEventArgs e)
        {
            ClassPlc stopplc = new ClassPlc();
            stopplc.dungplc_uchome();
        }

        private void buttonDung_MouseDown(object sender, MouseEventArgs e)
        {
            ClassPlc check_conn_plc = new ClassPlc();
            if (check_conn_plc.check_connect_plc() == false)
            {
                XtraMessageBox.Show("Chưa kết nối PLC! ");
            }
            else
            {
                check_conn_plc.dungplc_uchome();
            }
        }

        private void buttonXoaLoi_MouseUp(object sender, MouseEventArgs e)
        {
            //ClassPlc.Plc.SetDevice("M203", 0);
        }

        private void buttonXoaLoi_Click(object sender, EventArgs e)
        {
            FBaoLoi fBaoLoi = new FBaoLoi();
            fBaoLoi.StartPosition = FormStartPosition.CenterScreen;
            fBaoLoi.ShowDialog();
        }

        private void buttonXoaLoi_MouseDown(object sender, MouseEventArgs e)
        {
            //ClassPlc.Plc.GetDevice("M8000", out int M8);
            //if (M8 == 0)
            //{
            //    XtraMessageBox.Show("Chưa kết nối PLC! ");

            //}
            //else
            //{
            //    ClassPlc.Plc.SetDevice("M203", 1);
            //}
        }

        private void buttonXetGoc_Click(object sender, EventArgs e)
        {
            ClassPlc check_conn_plc = new ClassPlc();
            if (check_conn_plc.check_connect_plc() == false)
            {
                XtraMessageBox.Show("Chưa kết nối PLC! ");
            }
            else
            {
                check_conn_plc.plc_vegoc_uchome();
                timerXetGoc.Start();
            }
            //Application.Restart();
            //Environment.Exit(0);

            //this.Controls.Clear();
            //this.InitializeComponent();
            //this.loadTrays();
            //this.loadTTK();
        }


        #region Nhập Hàng

        private void buttonNhapHang_Click(object sender, EventArgs e)
        {
            ClassPlc checkdk_admin = new ClassPlc();
            if (checkdk_admin.check_dk_admin() == true && radioAdmin.Checked==false)
            {
                DataTable dtdsNhapHang = NhapHangDAO.Instance.dboDsNhapHang();
                DataTable dsXuatHang = XuatHangDAO.Instance.DsXuatHang();
                if (dtdsNhapHang.Rows.Count > 0)
                {
                    DialogResult dr = MessageBox.Show("Quá trình nhập hàng đang diễn ra, không thể thực hiện thao tác!", "Thông Báo!", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                }
                else if (dsXuatHang.Rows.Count > 0)
                {
                    DialogResult dr = MessageBox.Show("Quá trình xuất hàng đang diễn ra, không thể thực hiện thao tác!", "Thông Báo!", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                }
                else
                {
                    checkdk_admin.hoanthanh_transfer();
                    FormNhapHang formNhapHang = new FormNhapHang();
                    formNhapHang.ShowDialog();
                    DataTable tableDsNhapHang = NhapHangDAO.Instance.dboDsNhapHang();
                    if (tableDsNhapHang.Rows.Count > 0)
                    {
                        nhapHang();
                    }
                }

            }
            else
            {
                MessageBox.Show("Vui lòng cất khay tại vị trí cửa trước khi thực hiện giao dịch!","Err",MessageBoxButtons.OK,MessageBoxIcon.Warning);
            }
        }

        private void nhapHang()
        {
            List<string> vsTangNhap = NhapXuatDAO.Instance.listDSTangNhapHang();
            if (vsTangNhap.Count > 0)
            {
                string TangDi = vsTangNhap[0];
                string TangDen = "F27";
                if (radioAuto.Checked)
                {
                    NhapXuatDAO.Instance.prInsertTbBackup(TangDi, TangDen);
                }
                
                layKhay(TangDi, TangDen);
                timerCua.Start();
            }
            else
            {
                loadTTK();
                MessageBox.Show("Đã Thực Hiện Xong Quá Trình Nhập Hàng!", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                int sttBackup = NhapXuatDAO.Instance.prMAXtbBackup();
                if (sttBackup > 0)
                {
                    if (radioAuto.Checked)
                    {
                        NhapXuatDAO.Instance.prUpdateBackUp(sttBackup);
                    }
                }
                NhapXuatDAO.Instance.prUPDATETASK("Trống");
            }
        }

        private void layKhay(string TangDi, string TangDen)
        {
            ClassPlc check_loaitang = new ClassPlc();
            // tầng đi
            string loai = TangDi.Remove(1);                  // loại tầng trước hoặc sau
            int num = Convert.ToInt32(TangDi.Substring(1));  // số tầng

            check_loaitang.check_loaitangdi_uchome(loai,num);

            if (TangDi != "F27")
            {
                int ccKhay = NhapXuatDAO.Instance.prChieuCaoKhay(TangDi);
                ClassPlc.Plc.SetDevice("D1850", ccKhay); // chiều cao không gian tầng lấy
            }

            // tầng  đến
            string loaiT = TangDen.Remove(1);                  // loại tầng trước hoặc sau
            int numT = Convert.ToInt32(TangDen.Substring(1)); // số tầng

            check_loaitang.check_loaitangden_uchome(loaiT,numT);
            timerDoChieuCao.Start();

            if (check_loaitang.check_conn_loaitang() == false && TangDi != "F27" )
            {
                MessageBox.Show("Máy tính không truyền được dữ liệu cho hệ thống kho, yêu cầu kiểm tra lại đường truyền", "Cảnh báo: ", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
            else if (radioAdmin.Checked)
            {
                MessageBox.Show("Boss...", "Cảnh báo: ", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
            else
            {
                check_loaitang.exchange();
            }
            //NhapXuatDAO.Instance.prInsertTbBackup(TangDi, TangDen);
            ClassPlc.Plc.SetDevice("M2390", 0);
        }

        private void TraKhay()
        {
            string tangTraKhay = NhapXuatDAO.Instance.tangTraKhay();
            int sttBackup = NhapXuatDAO.Instance.prMAXtbBackup();
            if (sttBackup > 0)
            {
                if (radioAuto.Checked)
                {
                    NhapXuatDAO.Instance.prUpdateBackUp(sttBackup);
                }
            }

            layKhay("F27", tangTraKhay);
            timerDoChieuCao.Start();
            //ClassPlc.Plc.SetDevice("D1310", 0);
        }

        #endregion Nhập Hàng

        #region Xuất Hàng

        private void buttonXuatHang_Click(object sender, EventArgs e)
        {
            ClassPlc check_dk = new ClassPlc();
            if (check_dk.check_dk_admin() == false && radioAdmin.Checked == false)
            {

                DataTable dtdsNhapHang = NhapHangDAO.Instance.dboDsNhapHang();
                DataTable dsXuatHang = XuatHangDAO.Instance.DsXuatHang();
                if (dtdsNhapHang.Rows.Count > 0)
                {
                    DialogResult dr = MessageBox.Show("Quá trình nhập hàng đang diễn ra, không thể thực hiện thao tác!", "Thông Báo!", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                }
                else if (dsXuatHang.Rows.Count > 0)
                {
                    DialogResult dr = MessageBox.Show("Quá trình xuất hàng đang diễn ra, không thể thực hiện thao tác!", "Thông Báo!", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                }
                else
                {
                    check_dk.hoanthanh_transfer();
                    FormXuatHang formXuatHang = new FormXuatHang();
                    formXuatHang.ShowDialog();
                    DataTable tableDsXuatHang = XuatHangDAO.Instance.DsXuatHang();
                    if (tableDsXuatHang.Rows.Count > 0)
                    {
                        XuatHang();
                    }
                }
            }
            else
            {
                MessageBox.Show("Vui lòng cất khay tại vị trí cửa trước khi thực hiện giao dịch!", "Err", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
            
            
        }

        private void XuatHang()
        {
            ClassPlc check_khay = new ClassPlc();
            check_khay.hoanthanh_transfer();

            List<string> vsTangXuat = NhapXuatDAO.Instance.listDSTangXuatHang();
            if (vsTangXuat.Count > 0)
            {
                string TangDi = vsTangXuat[0];
                string TangDen = "F27";
                if (radioAuto.Checked)
                {
                    NhapXuatDAO.Instance.prInsertTbBackup(TangDi, TangDen);
                }
                //NhapXuatDAO.Instance.prInsertTbBackup(TangDi, TangDen);
                layKhay(TangDi, TangDen);
                timerCua.Start();
            }
            else
            {
                loadTTK();
                MessageBox.Show("Đã Thực Hiện Xong Quá Trình Xuất Hàng!", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                int sttBackup = NhapXuatDAO.Instance.prMAXtbBackup();
                if (sttBackup > 0)
                {
                    if (radioAuto.Checked)
                    {
                        NhapXuatDAO.Instance.prUpdateBackUp(sttBackup);
                    }
                }
                NhapXuatDAO.Instance.prUPDATETASK("Trống");
            }
        }

        #endregion Xuất Hàng

        #region timer nhập xuất hàng

        private void timerCua_Tick(object sender, EventArgs e)
        {
            ClassPlc check_khay = new ClassPlc();
            int M2024 = 1;
            if (radioAuto.Checked)
            {
                ClassPlc.Plc.GetDevice("M2024", out M2024); // báo khay ra cửa
            }
            
            if (M2024 == 1)
            {
                timerCua.Stop();
                check_khay.hoanthanh_transfer();

                FKhay fkhay = new FKhay();
                string task = DAO_Khay.Instance.selectTASK();
                List<string> vsTangNhap = new List<string>();
                if (task == "Nhập Hàng")
                {
                    vsTangNhap = NhapXuatDAO.Instance.listDSTangNhapHang();
                }
                else if (task == "Xuất Hàng")
                {
                    vsTangNhap = NhapXuatDAO.Instance.listDSTangXuatHang();
                }
                if (vsTangNhap.Count > 0)
                {
                    string khay = vsTangNhap[0];
                    fkhay.Text = khay;
                }
                fkhay.ShowDialog();
                int sttBackup = NhapXuatDAO.Instance.prMAXtbBackup();
                if (sttBackup > 0)
                {
                    if (radioAuto.Checked)
                    {
                        NhapXuatDAO.Instance.prUpdateBackUp(sttBackup);
                    }
                }
                TraKhay();
                timerHoanThanh.Start();
            }
        }

        private void timerHoanThanh_Tick(object sender, EventArgs e)
        {
            ClassPlc check_khay_ra_cua = new ClassPlc();
            int M2025 =1; //  bít báo thực hiện xong quá trình F_T
            if (radioAuto.Checked)
            {
                ClassPlc.Plc.GetDevice("M2025", out M2025);
                //ClassPlc.Plc.GetDevice("M2024", out int M2024);
            }
            
            //labelControl12025.Text = M2025.ToString();
            //labelControl2024.Text = M2024.ToString();
            if (M2025 == 1)
            {
                timerHoanThanh.Stop();
                int sttBackup = NhapXuatDAO.Instance.prMAXtbBackup(); // cấp nhật
                if (sttBackup > 0)
                {
                    if (radioAuto.Checked)
                    {
                        NhapXuatDAO.Instance.prUpdateBackUp(sttBackup);
                    }        
                }
                string task = DAO_Khay.Instance.selectTASK();
                if (task == "Nhập Hàng")
                {
                    nhapHang();
                }
                else if (task == "Xuất Hàng")
                {
                    XuatHang();
                }
                check_khay_ra_cua.hoanthanh_transfer();
            }
        }

        private void timerXetGoc_Tick(object sender, EventArgs e)
        {
            ClassPlc.Plc.GetDevice("M2740", out int M2740); // Bit Về gốc khi có khay trên xe
            if (M2740 == 1)
            {
                ClassPlc.Plc.GetDevice("D296", out int DF27);
                if (DF27 == 2)
                {
                    ClassPlc.Plc.SetDevice("M2740", 0);
                    //check_mp(); // check các tầng trong hệ thống
                    MessageBox.Show("Hệ thống đang có khay tại cửa. Hệ thống sẽ cất khay, yêu cầu không nhập hoặc xuất hàng!", "Cảnh báo", MessageBoxButtons.OK);
                    layKhay("F27", "F27"); // trả khay lên hệ thống, không để ở cửa

                    ClassPlc.Plc.SetDevice("D1850", 1); // chiều cao không gian
                    ClassPlc.Plc.SetDevice("D1310", 0);
                }
            }

            ClassPlc.Plc.GetDevice("M2480", out int M2480); // Bit Push tray (Đẩy), M2481 kéo ra
            ClassPlc.Plc.GetDevice("M2481", out int M2481);
            if (M2481 == 1)
            {
                ClassPlc.Plc.SetDevice("M2481", 0); //M2481 kéo ra
                ClassPlc.Plc.SetDevice("D1310", 0);
            }
            if (M2480 == 1) // Hoàn thành đẩy khay
            {
                timerXetGoc.Stop();
                ClassPlc.Plc.SetDevice("M2480", 0); //Hoàn thành đẩy khay

                int sttBackup = NhapXuatDAO.Instance.prMAXtbBackup(); // cấp nhật
                if (sttBackup > 0)
                {
                    NhapXuatDAO.Instance.prUpdateBackUp(sttBackup);
                }
            }
        }

        private void timerDoChieuCao_Tick(object sender, EventArgs e)
        {
            ClassPlc check_loaitang = new ClassPlc();
            if (check_loaitang.check_chieucao_uchome() == false)
            {
                timerDoChieuCao.Stop();
                string tangTraKhay = NhapXuatDAO.Instance.tangTraKhay();

                string loai = tangTraKhay.Remove(1);                  // loại tầng trước hoặc sau
                int num = Convert.ToInt32(tangTraKhay.Substring(1));  // số tầng

                //
                check_loaitang.check_loaitangden_uchome(loai,num);
                ClassPlc.Plc.SetDevice("D1850", 1); // chiều cao không gian
                ClassPlc.Plc.SetDevice("D1310", 0);
                // ClassPlc.Plc.SetDevice("M2022", 1);  // bit báo để bắt đầu exchage
                if (radioAuto.Checked)
                {
                    NhapXuatDAO.Instance.prInsertTbBackup("F27", tangTraKhay);
                }
                
                if (_flagTray ==1)
                {
                    _flagTray = 0;
                    timerHoanThanh.Start();
                }
            }
        }

        #endregion timer nhập xuất hàng

        /// <summary>
        /// /////////////////////////////////////////////////// di chuyển khay //////////////////////////////////////////////////////////////////////////
        /// </summary>
        ///
        int _flagTray = 0;
        private void guna2GradientButton7_Click(object sender, EventArgs e)
        {
            try
            {
                DataTable dtdsNhapHang = NhapHangDAO.Instance.dboDsNhapHang();
                DataTable dsXuatHang = XuatHangDAO.Instance.DsXuatHang();
                if (dtdsNhapHang.Rows.Count > 0 || dsXuatHang.Rows.Count > 0)
                {
                    MessageBox.Show("Không thể thực hiện thao tác!", "Err", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                }
                else
                {
                    DialogResult dr = MessageBox.Show("Chức năng rày rất nguy hiểm, cần kiểm tra kỹ trước khi tiếp tục.", "Cảnh Báo", MessageBoxButtons.YesNo, MessageBoxIcon.Warning);
                    if (dr == DialogResult.Yes)
                    {
                        ClassPlc check_conn = new ClassPlc();
                        if (check_conn.check_connect_plc() == false)
                        {
                            XtraMessageBox.Show("Chưa kết nối PLC! ");
                        }
                        else
                        {
                            string tangDI = "";
                            string tangDen = "";

                            if (guna2ComboBoxTangdi.Text.Trim() != null && guna2ComboBoxTangDen.Text.Trim() != null)
                            {
                                _flagTray = 1;
                                tangDI = guna2ComboBoxTangdi.Text.Trim();
                                tangDen = guna2ComboBoxTangDen.Text.Trim();
                                if (tangDI != "F27")
                                {
                                    NhapXuatDAO.Instance.prInsertTbBackup(tangDI, tangDen);
                                }
                                layKhay(tangDI, tangDen);
                                //timerDoChieuCao.Start();
                                guna2ComboBoxTangdi.Items.Clear();
                                guna2ComboBoxTangDen.Items.Clear();
                            }
                        }
                    }
                }
                
                
            }
            catch
            {
            }
        }

        private void guna2ComboBoxTangdi_DropDown(object sender, EventArgs e)
        {
            guna2ComboBoxTangdi.Items.Clear();
            for (int i = 14; i < 28; i++)      // tầng F có khay
            {
                string D2xx = "D" + (283 + i - 14).ToString();
                ClassPlc.Plc.GetDevice(D2xx, out int value);
                if (value == 2)
                {
                    string TangDi = "F" + i.ToString();
                    if (TangDi!= "F26")
                    {
                        guna2ComboBoxTangdi.Items.Add(TangDi);
                    }
                    
                }
            }
            for (int i = 1; i < 27; i++)      // tầng r có khay
            {
                string D2xx = "D" + (300 + i - 1).ToString();
                ClassPlc.Plc.GetDevice(D2xx, out int value);
                if (value == 2)
                {
                    string TangDi = "R" + i.ToString();
                    if (TangDi!="R26")
                    {
                        guna2ComboBoxTangdi.Items.Add(TangDi);
                    }
                    
                }
            }
        }

        private void guna2ComboBoxTangDen_DropDown(object sender, EventArgs e)
        {
            guna2ComboBoxTangDen.Items.Clear();
            for (int i = 14; i < 28; i++) // tầng F có thể đưa khay vào
            {
                string D2xx = "D" + (283 + i - 14).ToString();
                ClassPlc.Plc.GetDevice(D2xx, out int value);
                if (value == 0)
                {
                    string D2xx2 = "D" + (283 + i - 13).ToString();
                    ClassPlc.Plc.GetDevice(D2xx2, out int value2);
                    if (value2 == 0)
                    {
                        string TangDi = "F" + i.ToString();
                        if (D2xx2!="F26")
                        {
                            guna2ComboBoxTangDen.Items.Add(TangDi);
                        }
                       // guna2ComboBoxTangDen.Items.Add(TangDi);
                    }
                    
                }
            }
            for (int i = 1; i < 27; i++)      // tầng R có thể đưa khay vào
            {
                string D2xx = "D" + (300 + i - 1).ToString();
                ClassPlc.Plc.GetDevice(D2xx, out int value);
                if (value == 0)
                {
                    string D2xx2 = "D" + (300 + i).ToString();
                    ClassPlc.Plc.GetDevice(D2xx2, out int value2);
                    if (value2 == 0)
                    {
                        string TangDi = "R" + i.ToString();
                        if (TangDi != "R26")
                        {
                            guna2ComboBoxTangDen.Items.Add(TangDi);
                        }
                        
                    }
                }
            }
        }

        #region MÔ PHỎNG

        /// <summary>
        /// /////////////////////////////////////////////////// MÔ PHỎNG //////////////////////////////////////////////////////////////////////////
        /// </summary>
        ///
        private List<Button> listTrays = new List<Button>();

        private List<Point> listPointTrays = new List<Point>();

        private Point locationOrigin = new Point(345, 560);         //Tọa độ khi về gốc

        private Point openDoorPoint = new Point(541, 315);  // Tọa độ khi mở cửa
        private Point closeDoorPoint = new Point(541, 370); // Tọa độ khi đóng cửa

        private int locationX_TraysMiddle = 373;    // Tọa độ X khi khay ở giữa xe
        private int limitR = 199;           // Giới hạn bên R
        private int limitF = 548;           // Giới hạn bên F
        private int locationDoor = 492;     // Tọa độ Y của mặt phẳng cửa
        private int locationY_R1 = 479;     // Tọa độ Y của mặt phẳng tầng 1
        private int distanceFloor = 17;     // Khoảng cách giữa 2 tầng liên tiếp
        private int traysHeight = 12;       // Chiều cao của 1 khay

        private Color usedTrays = Color.RoyalBlue;

        private void loadTrays()
        {
            radioAuto.Checked = true;
            XuatHangDAO.Instance.deletelistXuat();
            XuatHangDAO.Instance.deleteDsXuatHang();

            NhapHangDAO.Instance.deleteDsNhapHang();
            NhapHangDAO.Instance.deletelistNhap();

            DataTable tableTrays = new DataTable();
            tableTrays = DAO_MoPhong.Instance.selectionKhay();

            Button trays0 = new Button();
            trays0.Name = "Trays0";
            listTrays.Add(trays0);
            listPointTrays.Add(trays0.Location);
            for (int i = 0; i < tableTrays.Rows.Count; i++)
            {
                // Khay đã được sử dụng
                if (Convert.ToInt32(tableTrays.Rows[i][1]) == 2)
                {
                    Button traysUse = new Button();
                    traysUse.Name = tableTrays.Rows[i][0].ToString().Trim();
                    traysUse.Size = new Size(135, 12);
                    traysUse.BackColor = Color.SandyBrown;
                    traysUse.FlatStyle = FlatStyle.Flat;
                    traysUse.FlatAppearance.BorderSize = 0;
                    traysUse.BackColor = usedTrays;

                    // Vị trí
                    if (traysUse.Name.Substring(0, 1) == "R")
                        traysUse.Location = new Point(limitR, (locationY_R1 - traysHeight) - (Convert.ToInt32(traysUse.Name.Substring(1, traysUse.Name.Length - 1)) - 1) * distanceFloor);
                    else
                        traysUse.Location = new Point(limitF, (locationY_R1 - traysHeight) - (Convert.ToInt32(traysUse.Name.Substring(1, traysUse.Name.Length - 1)) - 1) * distanceFloor);

                    traysUse.Click += new System.EventHandler(this.trays_Click);

                    listTrays.Add(traysUse);
                    listPointTrays.Add(traysUse.Location);
                    pnlMoPhomg.Controls.Add(traysUse);
                }
                else
                {
                    Button traysNoUse = new Button();
                    traysNoUse.Name = tableTrays.Rows[i][0].ToString().Trim();
                    listTrays.Add(traysNoUse);
                    listPointTrays.Add(traysNoUse.Location);
                }
            }

            ClassPlc.Plc.ActLogicalStationNumber = 2;
            ClassPlc.Plc.Open();
            ClassPlc.Plc.GetDevice("D1803", out int floorStart);        // Vị trí hiện tại của xe
            if (floorStart != 27 && floorStart > 0)
            {
                int pointStart = locationY_R1 - (distanceFloor * (floorStart - 1));
                pnlMid.Location = new Point(pnlMid.Location.X, pointStart);
                pnlTrays.Location = new Point(pnlTrays.Location.X, pointStart - traysHeight);
            }
            else if (floorStart == 27)
            {
                pnlMid.Location = new Point(pnlMid.Location.X, locationDoor);
                pnlTrays.Location = new Point(pnlTrays.Location.X, locationDoor - traysHeight);
            }
            else
            {
                //pnlMid.Location = new Point(pnlMid.Location.X, locationDoor);
                //pnlTrays.Location = new Point(pnlTrays.Location.X, locationDoor - traysHeight);
            }
            timerMaster.Start();
        }

        private void backOrigin()
        {
            if (pnlMid.Location.Y < locationOrigin.Y)
            {
                pnlMid.Location = new Point(pnlMid.Location.X, pnlMid.Location.Y + 1);
                pnlTrays.Location = new Point(pnlTrays.Location.X, pnlTrays.Location.Y + 1);
            }
            else if (pnlMid.Location.Y > locationOrigin.Y)
            {
                pnlMid.Location = new Point(345, 560);
                // pnlTrays.Location = locationTrays;
            }
            else
            {
                panel1.Controls.Clear();
                //loadTrays();
            }
        }

        private void trays_Click(object sender, EventArgs e)
        {
           string _task = DAO_Khay.Instance.selectTASK();
            if (_task == "Trống")
            {
                //NhapXuatDAO.Instance.prUPDATETASK("Trống");
                FKhay fKhay = new FKhay();
                fKhay.StartPosition = FormStartPosition.CenterParent;
                Button button = (Button)sender;
                fKhay.Text = button.Name;
                fKhay.ShowDialog();
                // MessageBox.Show("ok");
            }

        }

        /*------------------------------------------------------------------------------------------------------*-
         *          TIMER QUẢN LÝ TẤT CẢ TRẠNG THÁI HOẠT ĐỘNG CỦA 3 ĐỘNG CƠ. MỤC ĐÍCH: PHỤC VỤ MÔ PHỎNG         *
         *  EX:                                                                                                 *
         *      - Khi liftting đi lên -> bit M1460 = 1 => bật timer liffting để chạy mô phỏng.                  *
         *      - Khi cửa đang mở -> bit M2370 = 1 => bật timer Door để chạy mô phỏng cửa.                      *
        -*------------------------------------------------------------------------------------------------------*/

        // Tầng mà xe đang hướng đến
        private int numberTrays = 0;

        // Bit thể hiện trang thái hoạt động của Liftting
        private int liftingUp = 0;

        private int liftingDown = 0;

        // Bit thể hiện trang thái hoạt động của Trays
        private int RIn, ROut, FIn, FOut = 0;

        // Bit thể hiện trang thái hoạt động của Cửa
        private int openDoor = 0;

        private int closeDoor = 0;

        private void timerMaster_Tick(object sender, EventArgs e)
        {
            ClassPlc.Plc.GetDevice("D1802", out numberTrays);           // Lấy vị trí tầng mục tiêu mà xe đang hướng đến (EX: 1,3,5....)

            ClassPlc.Plc.GetDevice("M1460", out liftingUp);             // Trạng thái xe đang đi lên
            ClassPlc.Plc.GetDevice("M1461", out liftingDown);           // Trạng thái xe đang đi xuống

            ClassPlc.Plc.GetDevice("M2340", out FIn);                   // Trang thái đang lấy khay phía F
            ClassPlc.Plc.GetDevice("M2342", out FOut);                  // Trang thái đang trả khay phía F
            ClassPlc.Plc.GetDevice("M2345", out RIn);                   // Trang thái đang lấy khay phía R
            ClassPlc.Plc.GetDevice("M2347", out ROut);                  // Trang thái đang trả khay phía R

            ClassPlc.Plc.GetDevice("M2370", out openDoor);              // Trạng thái đang mở cửa
            ClassPlc.Plc.GetDevice("M2372", out closeDoor);             // Trạng thái đang đóng cửa

            if (liftingUp != 0 || liftingDown != 0)
                timerLifting.Start();
            else if (FOut != 0 || FIn != 0 || ROut != 0 || RIn != 0)
                timerTrays.Start();
            else if (openDoor != 0 || closeDoor != 0)
                timerDoor.Start();

            ClassPlc.Plc.GetDevice("M2025", out int M2025);
            ClassPlc.Plc.GetDevice("M2024", out int M2024);
            ClassPlc.Plc.GetDevice("M2480", out int M2480);
            ClassPlc.Plc.GetDevice("M2481", out int M2481);
            labelControl12025.Text = M2025.ToString();
            labelControl2024.Text = M2024.ToString();
            labelControl80.Text = M2480.ToString();
            labelControl81.Text = M2481.ToString();

            ClassPlc.Plc.GetDevice("D1310", out int D1310);

            ClassPlc.Plc.GetDevice("M1460", out int M2390);         //leftting
            ClassPlc.Plc.GetDevice("M1461", out int M4001);

            ClassPlc.Plc.GetDevice("M10", out int M10); // bit bao mat goc = 0 , =1 da xet goc
            if (M10 == 0&& radioAuto.Checked)
            {
                buttonXetGoc.Enabled = true;
                buttonNhapHang.Enabled = false;
                buttonXuatHang.Enabled = false;
                guna2GradientButton7.Enabled = false;
            }
            else
            {
                buttonXetGoc.Enabled = false;
                buttonNhapHang.Enabled = true;
                buttonXuatHang.Enabled = true;
                guna2GradientButton7.Enabled = true;
            }

            ClassPlc.Plc.GetDevice("M15", out int M15); // bit bao mat goc = 0 , =1 da xet goc
            if (M15 == 0)
            {
                buttonXoaLoi.Enabled = false;
                panelAlarm.Visible = false;
            }
            else
            {
                buttonXoaLoi.Enabled = true;

                ClassPlc.Plc.GetDevice("Y21", out int Y21);
                if (Y21 == 0)
                {
                    panelAlarm.Visible = true;
                }
                else
                {
                    panelAlarm.Visible = false;
                }
            }
        }

        private int endPointY = 0;


        private void panelControl2_Click(object sender, EventArgs e)
        {
            if (textBoxPassw.Visible == true)
            {
                radioAuto.Checked = true;
                textBoxPassw.Text = "";
                textBoxPassw.Visible = false;
                radioAuto.Visible = false;
                radioAdmin.Visible = false;
                buttonXoaKhay.Visible = false;
                buttonThemKhay.Visible = false;
            }
            else
            {
                
                textBoxPassw.Visible = true;
                radioAuto.Visible = true;
                radioAdmin.Visible = true;
                buttonXoaKhay.Visible = true;
                buttonThemKhay.Visible = true;
            }
        }

        private void textBoxPassw_TextChanged(object sender, EventArgs e)
        {
            if (textBoxPassw.Text == "111111")
            {
                radioAuto.Enabled = true;
                radioAdmin.Enabled = true;
               
            }
            else
            {
                radioAuto.Enabled = false;
                radioAdmin.Enabled = false;

            }
        }
        
        private void radioAdmin_CheckedChanged(object sender, EventArgs e)
        {
            //ClassPlc.Plc.Close();
            //ClassPlc.Plc.Open();
        }

        private void radioAuto_CheckedChanged(object sender, EventArgs e)
        {
            //ClassPlc.Plc.Close();
            //ClassPlc.Plc.Open();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            NhapXuatDAO.Instance.prUPDATETASK("Thêm Khay");
            FKhay fKhay = new FKhay();
            fKhay.StartPosition = FormStartPosition.CenterScreen;
            fKhay.ShowDialog();
            NhapXuatDAO.Instance.prUPDATETASK("Trống");
        }

        private void button1_Click(object sender, EventArgs e)
        {
            NhapXuatDAO.Instance.prUPDATETASK("Xóa Khay");
            FKhay fKhay = new FKhay();
            fKhay.StartPosition = FormStartPosition.CenterScreen;
            fKhay.ShowDialog();
            NhapXuatDAO.Instance.prUPDATETASK("Trống");
        }

        private void labelControlGiaTriKho_Click(object sender, EventArgs e)
        {

        }

        private void labelControlSlMatHang_Click(object sender, EventArgs e)
        {

        }

        private void lbSoluongmathang_Click(object sender, EventArgs e)
        {

        }

        private void labelControl7_Click(object sender, EventArgs e)
        {

        }

        private void guna2Panel3_Click(object sender, EventArgs e)
        {
            loadTTK();
        }

        private void pnlMoPhomg_Paint(object sender, PaintEventArgs e)
        {

        }

        private void timerLifting_Tick(object sender, EventArgs e)
        {
            // Xe về vị trí các tầng. Không phải về vị trí cửa
            if (numberTrays != 27)
            {
                endPointY = locationY_R1 - (distanceFloor * (numberTrays - 1));
                if (liftingUp == 1)
                {
                    if (pnlMid.Location.Y > endPointY)
                    {
                        pnlMid.Location = new Point(pnlMid.Location.X, pnlMid.Location.Y - 10);
                        pnlTrays.Location = new Point(pnlTrays.Location.X, pnlTrays.Location.Y - 10);
                    }
                    else
                    {
                        pnlMid.Location = new Point(pnlMid.Location.X, endPointY);
                        pnlTrays.Location = new Point(pnlTrays.Location.X, endPointY - traysHeight);
                        timerLifting.Stop();
                    }
                }
                else if (liftingDown == 1)
                {
                    if (pnlMid.Location.Y < endPointY)
                    {
                        pnlMid.Location = new Point(pnlMid.Location.X, pnlMid.Location.Y + 10);
                        pnlTrays.Location = new Point(pnlTrays.Location.X, pnlTrays.Location.Y + 10);
                    }
                    else
                    {
                        pnlMid.Location = new Point(pnlMid.Location.X, endPointY);
                        pnlTrays.Location = new Point(pnlTrays.Location.X, endPointY - traysHeight);
                        timerLifting.Stop();
                    }
                }
            }
            // Xe về vị trí cửa
            else
            {
                if (liftingUp == 1)
                {
                    if (pnlMid.Location.Y > locationDoor)
                    {
                        pnlMid.Location = new Point(pnlMid.Location.X, pnlMid.Location.Y - 8);
                        pnlTrays.Location = new Point(pnlTrays.Location.X, pnlTrays.Location.Y - 8);
                    }
                    else
                    {
                        pnlMid.Location = new Point(pnlMid.Location.X, locationDoor);
                        pnlTrays.Location = new Point(pnlTrays.Location.X, locationDoor - traysHeight);
                        timerLifting.Stop();
                    }
                }
                else if (liftingDown == 1)
                {
                    if (pnlMid.Location.Y < locationDoor)
                    {
                        pnlMid.Location = new Point(pnlMid.Location.X, pnlMid.Location.Y + 8);
                        pnlTrays.Location = new Point(pnlTrays.Location.X, pnlTrays.Location.Y + 8);
                    }
                    else
                    {
                        pnlMid.Location = new Point(pnlMid.Location.X, locationDoor);
                        pnlTrays.Location = new Point(pnlTrays.Location.X, locationDoor - traysHeight);
                        timerLifting.Stop();
                    }
                }
            }
        }

        private void timerTrays_Tick(object sender, EventArgs e)
        {
            if (numberTrays != 27)
            {
                // RIn (Nhập khay Rx vào)
                if (RIn == 1)
                {
                    if (pnlTrays.Location.X > limitR)
                        pnlTrays.Location = new Point(pnlTrays.Location.X - 5, pnlTrays.Location.Y);
                    else
                    {
                        pnlTrays.Visible = false;
                        pnlTrays.Location = new Point(limitR, pnlTrays.Location.Y);

                        listTrays[numberTrays].Visible = true;
                        listTrays[numberTrays].Location = listPointTrays[numberTrays];
                        timerTrays.Stop();
                    }
                }
                // ROut (Lấy khay Rx ra)
                else if (ROut == 1)
                {
                    if (listTrays[numberTrays].Location.X < locationX_TraysMiddle)
                        listTrays[numberTrays].Location = new Point(listTrays[numberTrays].Location.X + 5, listTrays[numberTrays].Location.Y);
                    else
                    {
                        listTrays[numberTrays].Visible = false;
                        listTrays[numberTrays].Location = new Point(locationX_TraysMiddle, listTrays[numberTrays].Location.Y);

                        pnlTrays.Visible = true;
                        pnlTrays.Location = new Point(locationX_TraysMiddle, pnlTrays.Location.Y);
                        timerTrays.Stop();
                    }
                }
                // FIn (Nhập khay Fx vào)
                else if (FIn == 1)
                {
                    if (pnlTrays.Location.X < limitF)
                        pnlTrays.Location = new Point(pnlTrays.Location.X + 5, pnlTrays.Location.Y);
                    else
                    {
                        pnlTrays.Visible = false;
                        pnlTrays.Location = new Point(limitF, pnlTrays.Location.Y);

                        listTrays[numberTrays + 13].Visible = true;
                        listTrays[numberTrays + 13].Location = listPointTrays[numberTrays + 13];
                        timerTrays.Stop();
                    }
                }
                // FOut (Lấy khay Fx ra)
                else if (FOut == 1)
                {
                    if (listTrays[numberTrays + 13].Location.X > locationX_TraysMiddle)
                        listTrays[numberTrays + 13].Location = new Point(listTrays[numberTrays + 13].Location.X - 5, listTrays[numberTrays + 13].Location.Y);
                    else
                    {
                        listTrays[numberTrays + 13].Visible = false;
                        listTrays[numberTrays + 13].Location = new Point(locationX_TraysMiddle, listTrays[numberTrays + 13].Location.Y);

                        pnlTrays.Visible = true;
                        pnlTrays.Location = new Point(locationX_TraysMiddle, pnlTrays.Location.Y);
                        timerTrays.Stop();
                    }
                }
            }
            // Đẩy khay hoặc kéo khay từ cửa
            else
            {
                if (FIn == 1)
                {
                    if (pnlTrays.Location.X < limitF)
                        pnlTrays.Location = new Point(pnlTrays.Location.X + 5, pnlTrays.Location.Y);
                    else
                    {
                        pnlTrays.Location = new Point(limitF, pnlTrays.Location.Y);
                        timerTrays.Stop();
                    }
                }
                else if (FOut == 1)
                {
                    if (pnlTrays.Location.X > locationX_TraysMiddle)
                        pnlTrays.Location = new Point(pnlTrays.Location.X - 5, pnlTrays.Location.Y);
                    else
                    {
                        pnlTrays.Location = new Point(locationX_TraysMiddle, pnlTrays.Location.Y);
                        timerTrays.Stop();
                    }
                }
                else
                    timerTrays.Stop();
            }
        }

        private void timerDoor_Tick(object sender, EventArgs e)     // Đóng hoặc mở cửa
        {
            // Mở cửa
            if (openDoor == 1)
            {
                if (pnlDoor.Location.Y > openDoorPoint.Y)
                    pnlDoor.Location = new Point(pnlDoor.Location.X, pnlDoor.Location.Y - 4);
                else
                {
                    pnlDoor.Location = openDoorPoint;
                    timerDoor.Stop();
                }
            }
            // Đóng cửa
            else if (closeDoor == 1)
            {
                if (pnlDoor.Location.Y < closeDoorPoint.Y)
                    pnlDoor.Location = new Point(pnlDoor.Location.X, pnlDoor.Location.Y + 4);
                else
                {
                    pnlDoor.Location = closeDoorPoint;
                    timerDoor.Stop();
                }
            }
        }

        #endregion MÔ PHỎNG
    }
}