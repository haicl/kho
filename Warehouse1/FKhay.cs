using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Windows.Forms;
using Warehouse1.DAO;

namespace F_Khay
{
    public partial class FKhay : Form
    {
        Color colorDefault = Color.FromName("Gainsboro");               // Xam
        Color colorSelectionCell = Color.FromName("DeepSkyBlue");       // Xanh la

        Color colorCoHang = Color.FromName("DarkSeaGreen");             // Xanh
        Color colorFull = Color.FromName("OrangeRed");                  // Do cam

        List<Panel> listCellLoad = new List<Panel>();       // List chứa cấu hình khay lúc bắt đầu load khay lên (list này không thay đổi)
        List<Panel> listCell = new List<Panel>();           // List chứa cấu hình khay hiện tại (sau khi gộp hoặc tách ô phải cập nhật list này )
        List<Panel> listSelection = new List<Panel>();      // List chứa các ô (panel) được chọn để gộp hoặc tách
        List<string> nameTransfer = new List<string>();     // List chứa tên các ô cần chuyển đổi. EX: R1-4 -> R1-5

        // Chiều rộng và chiều cao mặc định của 1 ô trong khay
        int widthDefault = 0; 
        int heightDefault = 0;

        string task = "";

        string tenKhay = "";

        public FKhay()
        {
            InitializeComponent();
        }
        DataTable tableDsNhapHang = new DataTable();
        private void FKhay_Load(object sender, EventArgs e)
        {
            //if (this.Text.ToString() == "Thêm Khay")
            //    task = "Thêm Khay";
            //else if (this.Text.ToString() == "Xóa Khay")
            //    task = "Xóa Khay";
            //else if(this.Text.Count() < 4)
            //    task = "Cấu hình khay";
            //else
            //{
            //    task = "Xuất Nhập";
            //    this.Text = this.Text.ToString().Substring(9);
            //}

            ////////////////////////////////////////////    
            task = DAO_Khay.Instance.selectTASK();
            if (task == "Cấu hình khay")
            {
                loadKhay(this.Text.ToString());

                this.Text = "Cấu hình Khay " + this.Text.ToString();

                loadFormCauHinh();
            }
            else if (task == "Nhập Hàng" || task == "Xuất Hàng")
            {
                loadKhay(this.Text.ToString());
                blink(this.Text.ToString());
                if (task == "Xuất Hàng")
                {
                    gridColumn7.Caption = "Số Lượng Xuất";
                    gridColumn7.FieldName = "SoLuongXuat";
                    gridColumn8.Caption = "Số Lượng Tồn";
                    gridColumn8.FieldName = "SoLuongTon";
                    tableDsNhapHang = DAO_Khay.Instance.selectDsXuatHang(this.Text.Trim());
                }
                else if(task == "Nhập Hàng")
                {
                    tableDsNhapHang = DAO_Khay.Instance.selectDsNhapHang(this.Text.Trim());
                    
                }
                gridControl1.DataSource = tableDsNhapHang;
                timer1.Start();

                this.Text = task + " "+ this.Text;
                loadFromNhapXuat();
                
            }  
            else if(task == "Thêm Khay")
            {
                this.Text = "THÊM KHAY";
                loadFromThemKhay();
            }    
            else if(task == "Xóa Khay")
            {
                this.Text = "XÓA KHAY";
                loadFromXoaKhay();
            }    
            else if(task == "Trống")
            {
                loadKhay(this.Text.ToString());
                gridControl1.DataSource = DAO_Khay.Instance.selectThongTinKhay(this.Text);
                tenKhay = this.Text;
                this.Text = "Thông tin chi tiết khay " + this.Text.ToString();
                loadFormCauHinh();
            }    
            else
            {
                MessageBox.Show("Tác vụ trống","Thông báo",MessageBoxButtons.OK,MessageBoxIcon.Information);
            }    
        }

/*/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////*/
/*/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////*/

        /*----------------------------------------------------------------------------------------------*-
         *          Sắp xếp list panel theo thứ tự tăng dần và từ trên xuống dưới theo vị trí           *
        -*----------------------------------------------------------------------------------------------*/
        private void sortListPanelY_PriorX(List<Panel> list)
        {
            for (int i = 0; i < list.Count; i++)
            {
                for (int j = list.Count - 1; j > i; j--)
                {
                    if (list[j].Location.Y < list[j - 1].Location.Y)
                    {
                        Panel tempPoint = list[j];
                        list[j] = list[j - 1];
                        list[j - 1] = tempPoint;
                    }
                    else if (list[j].Location.Y == list[j - 1].Location.Y)
                    {
                        if (list[j].Location.X < list[j - 1].Location.X)
                        {
                            Panel tempPoint = list[j];
                            list[j] = list[j - 1];
                            list[j - 1] = tempPoint;
                        }
                    }
                }
            }
        }

        /* ---------------------------------------------------------------------------------*-
         *          Kiểm tra listSelection (những ô đã chọn) có thể gộp lại không           *
         *                                                                                  *
         *  1. Tọa độ X của các ô đầu tiên trong hàng có bằng nhau không?                   *
         *  2. Kiểm tra số lượng ô trên 1 hàng có bằng nhau không?                          *
         *  3. Vị trí các ô trong hàng có liên tiếp không?                                  *                 
        -*----------------------------------------------------------------------------------*/
        private bool checkMerge()
        {
            if (listSelection.Count > 1)
            {
                bool position = true;       // Tọa độ X của các ô đầu tiên trong hàng có bằng nhau không?
                bool length = true;         // Chiều dài mỗi hàng có bằng nhau không?
                bool continuity = true;     // Vị trí các ô trong hàng có liên tiếp không? 

                List<int> firstPoint = new List<int>();

                sortListPanelY_PriorX(listSelection);
                // Lấy vị trí các ô đầu tiên mỗi hàng trong list merge
                firstPoint.Add(0);
                for (int i = 1; i < listSelection.Count; i++)
                {
                    if (listSelection[i].Location.Y != listSelection[i - 1].Location.Y)
                    {
                        firstPoint.Add(i);
                    }
                }
                // TH1: Có 2 hàng trở lên
                if (firstPoint.Count > 1)
                {
                    // Tọa độ X của các ô đầu tiên trong hàng có bằng nhau không?
                    for (int i = 0; i < firstPoint.Count - 1; i++)
                    {
                        if (listSelection[firstPoint[i]].Location.X != listSelection[firstPoint[i + 1]].Location.X)
                        {
                            position = false;
                            break;
                        }
                    }
                    // Chiều dài mỗi hàng có bằng nhau không?
                    if (position == true)
                    {
                        int tempLength = listSelection[listSelection.Count - 1].Location.X + listSelection[listSelection.Count - 1].Width;
                        for (int i = 1; i < firstPoint.Count; i++)
                        {
                            if (tempLength != listSelection[firstPoint[i] - 1].Location.X + listSelection[firstPoint[i] - 1].Width)
                            {
                                length = false;
                                break;
                            }
                        }
                    }
                    // Vị trí các ô trong hàng có liên tiếp không? 
                    if (length == true)
                    {
                        for (int i = 0; i < firstPoint.Count - 1; i++)
                        {
                            for (int j = firstPoint[i]; j < firstPoint[i + 1] - 1; j++)
                            {
                                if (listSelection[j + 1].Location.X != (listSelection[j].Location.X + listSelection[j].Width + 3))
                                {
                                    continuity = false;
                                    break;
                                }
                            }
                        }
                        // Hàng cuối cùng
                        for (int k = firstPoint[firstPoint.Count - 1]; k < listSelection.Count - 1; k++)
                        {
                            if (listSelection[k + 1].Location.X != (listSelection[k].Location.X + listSelection[k].Width + 3))
                            {
                                continuity = false;
                                break;
                            }
                        }
                    }
                }
                // TH2: Chỉ có 1 hàng duy nhất
                else
                {
                    // Vị trí các ô trong hàng có liên tiếp không? 
                    for (int i = 0; i < listSelection.Count - 1; i++)
                    {
                        if (listSelection[i + 1].Location.X != (listSelection[i].Location.X + listSelection[i].Width + 3))
                        {
                            continuity = false;
                            break;
                        }
                    }
                }

                // Kế luận
                if (length == true && position == true && continuity == true)
                    return true;
                else
                    return false;
            }    
            else
                return false;
        }

        /* ---------------------------------------------------------------------------------*-
         *          Kiểm tra listSelection (những ô đã chọn) có thể tách ra không           *
         *                                                                                  *
         *  Điều kiệ tách: Kích thước các ô phải lớn hơn kích thước ô mặc định              *               
        -*----------------------------------------------------------------------------------*/
        private bool checkSunder()
        {
            if (listSelection.Count > 0)
            {
                bool result = true;
                for (int i = 0; i < listSelection.Count; i++)
                {
                    if (listSelection[i].Size == new Size(widthDefault, heightDefault))
                    {
                        result = false;
                        break;
                    }
                }
                return result;
            }
            else
                return false;
        }    

        /*-------------------------------------------*-
         *         Even click selection cell         *  
        -*-------------------------------------------*/
        private void selectiontCellPanel_Click(object sender, EventArgs e)
        {
            Panel selectionCell = sender as Panel;
            if (selectionCell.BackColor == colorDefault)
            {
                selectionCell.BackColor = colorSelectionCell;
                listSelection.Add(selectionCell);
            }
            else
            {
                selectionCell.BackColor = colorDefault;
                for (int i = 0; i < listSelection.Count; i++)
                {
                    if (listSelection[i].Location == selectionCell.Location)
                    {
                        listSelection.RemoveAt(i);
                    }
                }
            }
        }

        /*--------------------------------------------------------------------------------------*-
         *          Tạo các ra các ô theo lựa chọn cấu hình và thêm vào panel hiển thị          *
        -*--------------------------------------------------------------------------------------*/
        private void createCell()
        {
            try
            {
                listCell.Clear();
                int colum = 0;
                int row = 0;

                colum = Convert.ToInt32(numberColum.Value);
                row = Convert.ToInt32(numberRow.Value);
                // Reset panelKhay trước khi add các cell vào
                pnlKhay.Controls.Clear();
                pnlKhay.Width = 600;
                pnlKhay.Height = 200;
                // Kích thước mặc định của một ô
                widthDefault = (pnlKhay.Width - ((colum + 1) * 3)) / colum;
                heightDefault = (pnlKhay.Height - ((row + 1) * 3)) / row;

                if (heightDefault > 20 && widthDefault > 20)    // Đảm bảo kích thước mỗi ô không bị quá nhỏ
                {
                    for (int i = 0; i < row; i++)
                    {
                        for (int j = 0; j < colum; j++)
                        {
                            Panel cellPanel = new Panel();
                            cellPanel.Name = (j + (i * Convert.ToInt32(numberColum.Value))).ToString();
                            cellPanel.Width = widthDefault;
                            cellPanel.Height = heightDefault;
                            cellPanel.BackColor = colorDefault;
                            cellPanel.Click += new System.EventHandler(this.selectiontCellPanel_Click);

                            if (i == 0 && j == 0)       // Vị trí đầu tiên
                                cellPanel.Location = new Point(3, 3);
                            else if (i == 0 && j != 0)  // Hàng đầu tiên
                                cellPanel.Location = new Point(3 + (j * (widthDefault + 3)), 3);
                            else if (i != 0 && j == 0)   // Cột đầu tiên
                                cellPanel.Location = new Point(3, 3 + (i * (heightDefault + 3)));
                            else
                                cellPanel.Location = new Point(3 + (j * (widthDefault + 3)), 3 + (i * (heightDefault + 3)));

                            // Thêm ô vào list Cell và hiển thị ô lên panel Khay
                            listCell.Add(cellPanel);
                            pnlKhay.Controls.Add(listCell[j + (i * (Convert.ToInt32(numberColum.Value)))]);
                        }
                    }

                    // Căn chỉnh lại panel chứa khay
                    pnlKhay.Width = listCell[listCell.Count - 1].Location.X + listCell[listCell.Count - 1].Width + 3;
                    pnlKhay.Height = listCell[listCell.Count - 1].Location.Y + listCell[listCell.Count - 1].Height + 3;

                    editPanelName();
                }
                else { MessageBox.Show("Ô có kích thước quá nhỏ. Xin vui lòng chọn lại !", "Cảnh báo", MessageBoxButtons.OK, MessageBoxIcon.Warning); }
            }
            catch(Exception err)
            {
                string infoErr = err.StackTrace.ToString();
                string[] line = infoErr.Split(' ');
                string mess = "Error at line " + line[line.Length - 1] + ": " + err.Message ;
                MessageBox.Show(mess, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        /*-------------------------------------------------*-
         *          Load cấu hình khay và hiển thị         *
        -*-------------------------------------------------*/
        private void loadKhay(string nameKhay)
        {
            try
            {
                // Load kích thước ô mắc định
                DataTable defaultCell = new DataTable();
                defaultCell = DAO_Khay.Instance.defaultCellLISTKHAY(nameKhay);
                widthDefault = Convert.ToInt32(defaultCell.Rows[0][0]);
                heightDefault = Convert.ToInt32(defaultCell.Rows[0][1]);

                // Load cấu hình khay
                DataTable configuration = new DataTable();
                configuration = DAO_Khay.Instance.selectCAUHINHKHAY(nameKhay);
                for (int i = 0; i < configuration.Rows.Count; i++)
                {
                    Panel cell = new Panel();
                    cell.Name = i.ToString();
                    cell.Location = new Point((int)configuration.Rows[i][2], (int)configuration.Rows[i][3]);
                    cell.Size = new Size((int)configuration.Rows[i][4], (int)configuration.Rows[i][5]);

                    // Xem tình trạng ô có hàng hay không có hàng?
                    if ((int)configuration.Rows[i][7] == 0)         // Không có hàng
                    {
                        cell.BackColor = colorDefault;
                        cell.Click += new System.EventHandler(this.selectiontCellPanel_Click);
                    }
                    else if ((int)configuration.Rows[i][7] == 1)    // Có hàng
                        cell.BackColor = colorCoHang;
                    else
                        cell.BackColor = colorFull;                 // Đầy hàng

                    // Thêm vào danh sách listCell, và hiển thị ra màn hình
                    listCell.Add(cell);
                    pnlKhay.Controls.Add(cell);

                    // Thêm vào danh sách listLoad(mục đích của danh sánh này để so sánh khi có sự thay đổi ô). Phải tạo 1 đối tượng mới không sẽ bị trùng đối tượng (cell != cellLoad) -> Dữ liệu bị sai
                    Panel cellLoad = new Panel();
                    cellLoad.Name = "load" + i.ToString();
                    cellLoad.Location = new Point((int)configuration.Rows[i][2], (int)configuration.Rows[i][3]);
                    cellLoad.Size = new Size((int)configuration.Rows[i][4], (int)configuration.Rows[i][5]);
                    listCellLoad.Add(cellLoad);
                }

                // Căn chỉnh lại panel chứa khay dựa vào ô có tọa độ X lớn nhất
                Panel panelXmax = listCell[0];
                Panel panelYmax = listCell[0];
                for (int i = 1; i < listCell.Count; i++)
                {
                    if (panelXmax.Location.X < listCell[i].Location.X)             
                    {
                        panelXmax = listCell[i];
                    }

                    if(panelYmax.Location.Y < listCell[i].Location.Y)
                    {
                        panelYmax = listCell[i];
                    }
                }

                pnlKhay.Width = panelXmax.Location.X + panelXmax.Width + 3;
                pnlKhay.Height = panelYmax.Location.Y + panelYmax.Height + 3;

                editPanelName();
            }
            catch (Exception err)
            {
                string infoErr = err.StackTrace.ToString();
                string[] line = infoErr.Split(' ');
                string mess = "Error at line " + line[line.Length - 1] + ": " + err.Message;
                MessageBox.Show("KHAY " + nameKhay + " CHƯA ĐƯỢC CẤU HÌNH. \n\n" + mess, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);

                this.Close();
            }
        }

        /*--------------------------------------------------------------*-
         *          Sửa tên panel trong list Cell theo thứ tự           *
        -*--------------------------------------------------------------*/
        private void editPanelName()
        {
            sortListPanelY_PriorX(listCell);
            for(int i = 0; i < listCell.Count; i++)
            {
                listCell[i].Name = i.ToString();

                Label lbCellName = new Label();
                listCell[i].Controls.Clear();
                listCell[i].Controls.Add(lbCellName);
                lbCellName.AutoSize = true;
                lbCellName.Text = (i+1).ToString();
                lbCellName.Font = new Font("Segoe UI", 14, FontStyle.Bold);
                lbCellName.ForeColor = Color.Black;
                lbCellName.Location = new Point((listCell[i].Width / 2) - (lbCellName.Width / 2), (listCell[i].Height / 2) - (lbCellName.Height / 2));
            }    
        }    

        /*------------------------------------------------------------------------------*-
         *          Lấy số khay đã sử dụng, số khay đầy, số khay chưa sử dụng           *
        -*------------------------------------------------------------------------------*/
        private void loadFormCauHinh()
        {
            int numberKhayFull = 0;
            int numberKhayUse = 0;
            int numberKhayNotUse = 0;

            for(int i = 0; i < listCell.Count; i++)     // Lấy số khay chưa sử dụng, khay đầy, khay có hàng
            {
                if (listCell[i].BackColor == colorFull)
                    numberKhayFull++;
                else if (listCell[i].BackColor == colorCoHang)
                    numberKhayUse++;
                else
                    numberKhayNotUse++;
            }

            lbFull.Text = numberKhayFull.ToString();
            lbCoHang.Text = numberKhayUse.ToString();
            lbChuaSD.Text = numberKhayNotUse.ToString();

            pnlChuThich.Visible = true;
            pnlChuThich.Location = new Point(820, pnlChuThich.Location.Y);
            pnlKhay.Location = new Point(150, pnlKhay.Location.Y);
        }

        /*--------------------------------------*-
         *          Load form xóa khay          *
        -*--------------------------------------*/
        private void loadFromXoaKhay()
        {
            label1.Visible = false;
            label2.Visible = false;
            label5.Visible = false;
            cbbGoiY.Visible = false;
            numberColum.Visible = false;
            numberRow.Visible = false;

            bttXoaKhay.Visible = true;
            pnlControl.Visible = true;
            lbTask.Text = "XÓA KHAY:";

            /*Load các khay đã sử dụng vào giợi ý*/
            cbbEmptyAndFull.Items.Clear();
            DataTable useKhay = DAO_Khay.Instance.useKhay();
            if (useKhay.Rows.Count > 0)
            {
                for (int i = 0; i < useKhay.Rows.Count; i++)
                {
                    cbbEmptyAndFull.Items.Add(useKhay.Rows[i][0].ToString().Trim());
                }
            }
            else
                MessageBox.Show("Chưa có khay nào được sử dụng", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
        }

        /*---------------------------------------*-
         *          Load form thêm khay          *
        -*---------------------------------------*/
        private void loadFromThemKhay()
        {
            pnlControl.Visible = true;

            /*Load các khay chưa sử dụng vào giợi ý*/
            cbbEmptyAndFull.Items.Clear();
            DataTable emptyKhay = DAO_Khay.Instance.emptyKhay();
            if (emptyKhay.Rows.Count > 0)
            {
                for (int i = 0; i < emptyKhay.Rows.Count; i++)
                {
                    cbbEmptyAndFull.Items.Add(emptyKhay.Rows[i][0].ToString().Trim());
                }
            }
            else
                MessageBox.Show("Đã sử dụng hết khay","Thông báo",MessageBoxButtons.OK, MessageBoxIcon.Information);    
        }

        /*---------------------------------------*-
         *          Load form thêm khay          *
        -*---------------------------------------*/
        private void loadFromNhapXuat()
        {
            pnlVerify.Visible = true;
            pnlChuThich.Visible = true;
            pnlChuThich.Location = new Point(820, pnlChuThich.Location.Y);
            pnlKhay.Location = new Point(150, pnlKhay.Location.Y);
        }

        /*/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////*/
        /*/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////*/

        /*--------------------------*-
         *          Gộp ô           *
        -*--------------------------*/
        private void bttGopO_Click(object sender, EventArgs e)
        {
            if (task == "Thêm Khay" || task == "Cấu hình khay")
            {
                if (checkMerge() == true)
                {
                    if (MessageBox.Show("Bạn có muốn gộp các ô đã chọn không ?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
                    {
                        // Xóa bỏ các ô đã lựa chọn tương ứng trong list cell và panel hiển thị
                        for (int i = 0; i < listSelection.Count; i++)
                        {
                            pnlKhay.Controls.Remove(listSelection[i]);
                            for (int j = 0; j < listCell.Count; j++)
                            {
                                if (listSelection[i].Location == listCell[j].Location)
                                {
                                    listCell.RemoveAt(j);
                                }
                            }
                        }

                        // Tạo ô thay thế cho các ô đã lựa chọn để merge
                        Panel panelMeger = new Panel();
                        listCell.Add(panelMeger);
                        panelMeger.Click += new System.EventHandler(this.selectiontCellPanel_Click);
                        panelMeger.BackColor = colorDefault;
                        panelMeger.Location = listSelection[0].Location;
                        panelMeger.Width = (listSelection[listSelection.Count - 1].Location.X - listSelection[0].Location.X + listSelection[listSelection.Count - 1].Width);
                        panelMeger.Height = (listSelection[listSelection.Count - 1].Location.Y - listSelection[0].Location.Y + listSelection[listSelection.Count - 1].Height);

                        pnlKhay.Controls.Add(panelMeger);
                        listSelection.Clear();
                        editPanelName();
                    }
                }
                else
                {
                    if (listSelection.Count < 2)
                        MessageBox.Show("Không thể gộp ô. Xin vui lòng chọn lại", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    else
                        MessageBox.Show("Những ô đã lựa chọn không thể gộp với nhau. Xin vui lòng chọn lại", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                }
            }
            else
            {
                DialogResult dr = MessageBox.Show("Bạn muốn chuyển sang chế độ \"Cấu hình Khay\"?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Information);
                if (dr == DialogResult.Yes)
                {
                    NhapXuatDAO.Instance.prUPDATETASK("Cấu hình khay");
                    FKhay fKhay = new FKhay();
                    fKhay.StartPosition = FormStartPosition.CenterScreen;
                    fKhay.Text = tenKhay;
                    fKhay.ShowDialog();
                    NhapXuatDAO.Instance.prUPDATETASK(task);
                    //createCell();
                    pnlKhay.Controls.Clear();
                    listCell.Clear();
                    loadKhay(tenKhay);
                    editPanelName();
                    loadFormCauHinh();

                }
            }
        }

        /*--------------------------*-
         *          Tách ô          *
        -*--------------------------*/
        private void bttTachO_Click(object sender, EventArgs e)
        {
            if (task == "Thêm Khay" || task == "Cấu hình khay")
            {
                if (checkSunder() == true)
                {
                    // Tính số cột, số hàng khi tách ra của những ô đã chọn
                    List<int> colum = new List<int>();
                    List<int> row = new List<int>();
                    for (int i = 0; i < listSelection.Count; i++)
                    {
                        colum.Add(listSelection[i].Size.Width / widthDefault);
                        row.Add(listSelection[i].Size.Height / heightDefault);
                    }

                    // Tách ô và hiển thị mới
                    for (int i = 0; i < listSelection.Count; i++)
                    {
                        // Xóa ô trong list cell và ô trong panel hiển thị
                        pnlKhay.Controls.Remove(listSelection[i]);
                        for (int h = 0; h < listCell.Count; h++)
                        {
                            if (listSelection[i].Location == listCell[h].Location)
                            {
                                listCell.RemoveAt(h);
                                break;
                            }
                        }

                        // Tính số chiều dài và chiều rộng của ô sau khi tách
                        int cellWidth = ((listSelection[i].Width - ((colum[i] - 1) * 3)) / colum[i]);
                        int cellHeight = ((listSelection[i].Height - ((row[i] - 1) * 3)) / row[i]);

                        // Thêm ô vào list cell và panel hiển thị sau khi tách nhỏ
                        for (int j = 0; j < row[i]; j++)
                        {
                            for (int k = 0; k < colum[i]; k++)
                            {
                                Panel cellSmall = new Panel();
                                cellSmall.Width = cellWidth;
                                cellSmall.Height = cellHeight;
                                cellSmall.BackColor = colorDefault;
                                cellSmall.Click += new System.EventHandler(this.selectiontCellPanel_Click);

                                if (j == 0 && k == 0)       //Vi tri đầu tien
                                    cellSmall.Location = new Point(listSelection[i].Location.X, listSelection[i].Location.Y);
                                else if (j == 0 && k != 0)  // Hàng đầu tiên
                                    cellSmall.Location = new Point((listSelection[i].Location.X) + ((cellWidth + 3) * k), listSelection[i].Location.Y);
                                else if (j != 0 && k == 0)   // Cột đầu tiên 
                                    cellSmall.Location = new Point(listSelection[i].Location.X, listSelection[i].Location.Y + ((cellHeight + 3) * j));
                                else
                                    cellSmall.Location = new Point(listSelection[i].Location.X + ((cellWidth + 3) * k), listSelection[i].Location.Y + ((cellHeight + 3) * j));

                                listCell.Add(cellSmall);
                                pnlKhay.Controls.Add(cellSmall);
                            }
                        }
                    }
                    editPanelName();
                    listSelection.Clear();
                }
                else
                    MessageBox.Show("Không thể tách ô. Xin vui lòng chọn lại", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
            else
            {
                DialogResult dr =  MessageBox.Show("Bạn muốn chuyển sang chế độ \"Cấu hình Khay\"?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Information);
                if (dr == DialogResult.Yes)
                {
                    NhapXuatDAO.Instance.prUPDATETASK("Cấu hình khay");
                    FKhay fKhay = new FKhay();
                    fKhay.StartPosition = FormStartPosition.CenterScreen;
                    fKhay.Text = tenKhay;
                    fKhay.ShowDialog();
                    NhapXuatDAO.Instance.prUPDATETASK(task);
                    //createCell();
                    pnlKhay.Controls.Clear();
                    listCell.Clear();
                    loadKhay(tenKhay);
                    editPanelName();
                    loadFormCauHinh();
                    
                }
            }
        }

        /*-------------------------------------*-
         *          Lưu cấu hình khay          *
        -*-------------------------------------*/
        private void bttSave_Click(object sender, EventArgs e)
        {
            if (listCell.Count > 0)
            {
                string nameKhay = "";
                bool flagSave = false;
                bool flagThemKhay = false;

                // Tác vụ thêm khay
                if (task == "Thêm Khay")
                {
                    nameKhay = cbbEmptyAndFull.Text.ToString();
                    for (int i = 0; i < cbbEmptyAndFull.Items.Count; i++)  // Kiểm tra xem tên khay có hợp lệ không?
                    {
                        if (nameKhay == cbbEmptyAndFull.Items[i].ToString())
                        {
                            flagThemKhay = true;
                            break;
                        }
                    }
                    if (flagThemKhay == false)
                        MessageBox.Show("Tên khay '" + nameKhay + "' không hợp lệ hoặc khay đã tồn tại", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);

                    else if (MessageBox.Show("Bạn có muốn lưu cấu hình cho khay " + nameKhay + " không?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
                    {
                        // Cập nhật LIST KHAY 
                        object[] parameterListKhay = new object[4];
                        parameterListKhay[0] = nameKhay;        //Tên Khay 
                        parameterListKhay[1] = 2;               //State
                        parameterListKhay[2] = widthDefault;    //W_Min
                        parameterListKhay[3] = heightDefault;   //H_Min
                        DAO_Khay.Instance.updateLISTKHAY(parameterListKhay);
                        DAO_Khay.Instance.lockKhay(nameKhay);   //Khóa khay phía trên

                        flagSave = true;
                    }
                }
                // Tác vụ cấu hình khay 
                else if (task == "Cấu hình khay")
                {
                    nameKhay = this.Text.ToString().Substring(24);   // Thông tin chi tiết khay Rxx
                    if (MessageBox.Show("Bạn có muốn lưu cấu hình cho khay " + nameKhay + " không?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
                    {
                        flagSave = true;
                    }
                }
                // Tác vụ khác
                else
                    MessageBox.Show("Chỉ có thể chỉnh sửa khay khi ở trong tác vụ \"Thêm Khay\" hoặc tác vụ \"Cấu hình khay\"", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                // Cập nhật CAU HINH KHAY và cập nhật TON KHO
                if (flagSave == true)
                {
                    // Cập nhật CAU HINH KHAY
                    DAO_Khay.Instance.deleteCAUHINHKHAY(nameKhay);
                    int state = 0;
                    for (int i = 0; i < listCell.Count; i++)
                    {
                        for (int j = 0; j < listCellLoad.Count; j++)            // Nếu trạng thái ô là có hàng -> khi cập nhật phải giữ nguyên trạng thái
                        {
                            if (listCellLoad[j].Location == listCell[i].Location)
                            {
                                if (listCell[i].BackColor == colorFull)
                                {
                                    state = 2;           // Ô đầy
                                    if (i != j)          // TH thứ tự ô thay đổi
                                        nameTransfer.Add(nameKhay + "-" + (Convert.ToInt32(listCellLoad[j].Name.Substring(4)) + 1).ToString() + "->" +
                                                     nameKhay + "-" + (Convert.ToInt32(listCell[i].Name) + 1).ToString());
                                }
                                else if (listCell[i].BackColor == colorCoHang)
                                {
                                    state = 1;           // Ô có hàng
                                    if (i != j)          // TH thứ tự ô thay đổi
                                        nameTransfer.Add(nameKhay + "-" + (Convert.ToInt32(listCellLoad[j].Name.Substring(4)) + 1).ToString() + "->" +
                                                     nameKhay + "-" + (Convert.ToInt32(listCell[i].Name) + 1).ToString());
                                }
                                else
                                    state = 0;
                            }
                        }

                        object[] parameterCauHinhKhay = new object[10];
                        parameterCauHinhKhay[0] = nameKhay;                             // Khay
                        parameterCauHinhKhay[1] = nameKhay + "-" + (i + 1).ToString();  // Vị trí
                        parameterCauHinhKhay[2] = listCell[i].Location.X;               // X
                        parameterCauHinhKhay[3] = listCell[i].Location.Y;               // Y
                        parameterCauHinhKhay[4] = listCell[i].Size.Width;               // W
                        parameterCauHinhKhay[5] = listCell[i].Size.Height;              // H
                        parameterCauHinhKhay[6] = 1;                                    // L
                        parameterCauHinhKhay[7] = state;                                // State
                        parameterCauHinhKhay[8] = Convert.ToInt32(nameKhay.Substring(1).Trim());    // STTKhay
                        parameterCauHinhKhay[9] = i + 1;                                            // STTViTri

                        DAO_Khay.Instance.insertCAUHINHKHAY(parameterCauHinhKhay);
                    }

                    // Cập nhật TON KHO
                    for (int i = 0; i < nameTransfer.Count; i++)    // EX nameTransfer: "R1-1->R1-3"    =>  R1-1: Vị trí cũ;    R1-3: Vị trí mới
                    {
                        string[] parameter = new string[2];
                        parameter[0] = nameTransfer[i].Substring(0, nameTransfer[i].IndexOf(">") - 1);
                        parameter[1] = nameTransfer[i].Substring(nameTransfer[i].LastIndexOf(">") + 1, nameTransfer[i].Length - nameTransfer[i].LastIndexOf(">") - 1);
                        DAO_Khay.Instance.updateTONKHO(parameter);
                    }

                    // Cập nhật list cell load 
                    listCellLoad.Clear();
                    for (int i = 0; i < listCell.Count; i++)
                    {
                        Panel cellLoad = new Panel();
                        cellLoad.Name = "load" + i.ToString();
                        cellLoad.Location = listCell[i].Location;
                        cellLoad.Size = listCell[i].Size;
                        listCellLoad.Add(cellLoad);
                    }

                    MessageBox.Show("Đã lưu cấu hình khay thành không", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                }
            }
            else
                MessageBox.Show("Bạn chưa cấu hình cho khay", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
        }

        /*--------------------------------------*-
         *          Về màn hình chính           *
        -*--------------------------------------*/
        private void bttHome_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        /*------------------------------*-
         *          Xóa Khay            *
        -*------------------------------*/
        bool flagXoaKhay = false;
        private void bttXoaKhay_Click(object sender, EventArgs e)
        {
            if (flagXoaKhay == true)
            {
                //Xem khay có còn tồn kho không?
                bool flagTonKho = true;
                DataTable cauHinhKhay = DAO_Khay.Instance.selectCAUHINHKHAY(cbbEmptyAndFull.Text.Trim());
                for (int i = 0; i<cauHinhKhay.Rows.Count; i++)
                {
                    if (DAO_Khay.Instance.checkTONKHO(cauHinhKhay.Rows[i][1].ToString().Trim()).Rows.Count > 0) // Nếu trả về bảng có số hàng lớn hơn 0 => Còn hàng tồn kho 
                    {
                        flagTonKho = false;
                        break;
                    }
                }

                if (flagTonKho == true)     // Không có hàng tồn kho => Được phép xóa khay
                {
                    // Cập nhật LIST KHAY 
                    object[] parameterListKhay = new object[4];
                    parameterListKhay[0] = cbbEmptyAndFull.Text.Trim();         //Tên Khay 
                    parameterListKhay[1] = 0;                                   //State
                    parameterListKhay[2] = 0;                                   //W_Min
                    parameterListKhay[3] = 0;                                   //H_Min
                    DAO_Khay.Instance.updateLISTKHAY(parameterListKhay);        //Cap nhat LISTKHAY
                    DAO_Khay.Instance.unLockKhay(cbbEmptyAndFull.Text.Trim());  //Mở khóa khay phía trên
                    // Xóa trong CAU HINH KHAY
                    DAO_Khay.Instance.deleteCAUHINHKHAY(cbbEmptyAndFull.Text.Trim());

                    pnlKhay.Controls.Clear();
                    MessageBox.Show("Đã xóa khay thành công","Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                }
                else    
                {
                    MessageBox.Show("Không thể xóa khay vẫn còn hàng. Vui lòng lấy hàng ra trước khi xóa", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                }    
            }
            else
                MessageBox.Show("Tên khay cần xóa không hợp lệ. Xin vui lòng chọn khay khác","Thông báo",MessageBoxButtons.OK, MessageBoxIcon.Information);
        }

        /*----------------------------------------------*-
         *          Load thong tin khay cần xóa         *
        -*----------------------------------------------*/
        private void cbbEmptyAndFull_TextChanged(object sender, EventArgs e)
        {
            if (task == "Xóa Khay")
            {
                bool flagThongTinKhay = false;
                for (int i = 0; i < cbbEmptyAndFull.Items.Count; i++)  // Kiểm tra xem tên khay có hợp lệ không?
                {
                    if (cbbEmptyAndFull.Text == cbbEmptyAndFull.Items[i].ToString())
                    {
                        flagThongTinKhay = true;
                        flagXoaKhay = true;
                        break;
                    }
                }
                if (flagThongTinKhay == true)       // Load thông tin khay
                {
                    pnlKhay.Controls.Clear();
                    loadKhay(cbbEmptyAndFull.Text);
                    flagThongTinKhay = false;
                }
            }
        }

        /*---------------------------------------------------------*-
         *          Lấy khay trống hoặc khay đã sử dụng            *
        -*---------------------------------------------------------*/
        private void cbbEmpty_MouseClick(object sender, MouseEventArgs e)
        {
            if (task == "Thêm Khay")
            {
                cbbEmptyAndFull.Items.Clear();
                DataTable emptyKhay = DAO_Khay.Instance.emptyKhay();

                for (int i = 0; i < emptyKhay.Rows.Count; i++)
                {
                    cbbEmptyAndFull.Items.Add(emptyKhay.Rows[i][0].ToString().Trim());
                }
            }
            else
            {
                cbbEmptyAndFull.Items.Clear();
                DataTable useKhay = DAO_Khay.Instance.useKhay();

                for (int i = 0; i < useKhay.Rows.Count; i++)
                {
                    cbbEmptyAndFull.Items.Add(useKhay.Rows[i][0].ToString().Trim());
                }
            }
        }

        /*----------------------------------*-
         *          Gợi ý chia khay         *
        -*----------------------------------*/
        bool cbbGoiYChanged = true;
        private void cbbGoiY_TextChanged(object sender, EventArgs e)
        {
            if (cbbGoiYChanged == true)
            {
                string Matrix = cbbGoiY.Text;
                string[] arrMatrix = Matrix.Split('x');
                numberRow.Value = Convert.ToInt32(arrMatrix[0]);
                numberColum.Value = Convert.ToInt32(arrMatrix[1]);
            }
        }

        private void numberRowCol_ValueChanged(object sender, EventArgs e)
        {
            cbbGoiYChanged = false;
            if ((numberRow.Value != 0) && (numberColum.Value != 0))
            {
                cbbGoiY.Items.Add(numberRow.Value.ToString() + " x " + numberColum.Value.ToString());
                cbbGoiY.Text = numberRow.Value.ToString() + " x " + numberColum.Value.ToString();

                listSelection.Clear();
                createCell();
            }
            cbbGoiYChanged = true;
        }

        /*------------------------------*
         *          Load Blink          * 
        -*------------------------------*/
        List<Color> colorPanelBlink = new List<Color>();
        List<Panel> panelBlink = new List<Panel>();
        public void blink(string khay)
        {
            DataTable tableCellBlink = new DataTable();
            if (task == "Nhập Hàng")
                tableCellBlink = DAO_Khay.Instance.selectionDsNhapHang();
            else
                tableCellBlink = DAO_Khay.Instance.selectionDsXuatHang();
            for (int i = 0; i < tableCellBlink.Rows.Count; i++)
            {
                string namePanelBlink = tableCellBlink.Rows[i][0].ToString().Trim();
                if (namePanelBlink.Substring(0, namePanelBlink.IndexOf("-")) == khay)
                {
                    int slipName = Convert.ToInt32(namePanelBlink.Substring(namePanelBlink.IndexOf("-") + 1)) - 1;
                    for (int j = 0; j < listCell.Count; j++)
                    {
                        if (listCell[j].Name == slipName.ToString().Trim())
                        {
                            panelBlink.Add(listCell[j]);
                            colorPanelBlink.Add(listCell[j].BackColor);
                        }
                    }
                }
            }
        }

        private void timer1_Tick(object sender, EventArgs e)
        {
            for(int i = 0; i < panelBlink.Count; i++)
            {
                if(panelBlink[i].BackColor == colorPanelBlink[i])
                    panelBlink[i].BackColor = Color.PaleGoldenrod;
                else
                    panelBlink[i].BackColor = colorPanelBlink[i];
            }    
        }

        /*/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////*/
        /*/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////*/

        void updateSQLNhapHang()
        {
            for (int i = 0; i < tableDsNhapHang.Rows.Count; i++)
            {

                int Stt = Convert.ToInt32(tableDsNhapHang.Rows[i][0].ToString().Trim());
                string Msp = tableDsNhapHang.Rows[i][1].ToString().Trim();
                string Tensp = tableDsNhapHang.Rows[i][2].ToString().Trim();
                object[] TtSanPham = NhapHangDAO.Instance.prTtSanPham(Msp);
                string NhomSp = TtSanPham[3].ToString() ;
                string Maker = tableDsNhapHang.Rows[i][3].ToString().Trim();
                string DonViTinh = tableDsNhapHang.Rows[i][4].ToString().Trim();
                int soLuong = Convert.ToInt32(tableDsNhapHang.Rows[i][5].ToString().Trim());
                string ViTri = tableDsNhapHang.Rows[i][6].ToString().Trim();
                int soLuongMax = Convert.ToInt32(tableDsNhapHang.Rows[i][7].ToString().Trim());
                string DienGiai = tableDsNhapHang.Rows[i][8].ToString().Trim();

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

                NhapXuatDAO.Instance.prdeleteDsNhapHang(Stt, ViTri);
            }
        }

        void updateSQLXuatHang()
        {
            for (int i = 0; i < tableDsNhapHang.Rows.Count; i++)
            {

                int Stt = Convert.ToInt32(tableDsNhapHang.Rows[i][0].ToString().Trim());
                string Msp = tableDsNhapHang.Rows[i][1].ToString().Trim();
                string Tensp = tableDsNhapHang.Rows[i][2].ToString().Trim();
                object[] TtSanPham = NhapHangDAO.Instance.prTtSanPham(Msp);
                string NhomSp = TtSanPham[3].ToString();
                string Maker = tableDsNhapHang.Rows[i][3].ToString().Trim();
                string DonViTinh = tableDsNhapHang.Rows[i][4].ToString().Trim();
                int soLuongXuat = Convert.ToInt32(tableDsNhapHang.Rows[i][5].ToString().Trim());
                string ViTri = tableDsNhapHang.Rows[i][6].ToString().Trim();
                int soLuongTon = Convert.ToInt32(tableDsNhapHang.Rows[i][7].ToString().Trim());
                string DienGiai = tableDsNhapHang.Rows[i][8].ToString().Trim();

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

                NhapXuatDAO.Instance.prdeleteDsXuatHang(Stt, ViTri);
            }
        }
        int _flagFinsh = -1;
        private void bttFinish_Click(object sender, EventArgs e)
        {
            if (task == "Xuất Hàng")
            {
                updateSQLXuatHang();
            }
            else if (task == "Nhập Hàng")
            {
                updateSQLNhapHang();
            }
            _flagFinsh = 1;
            this.Close();
        }

        private void bttCancel_Click(object sender, EventArgs e)
        {
             
            
            if (task == "Xuất Hàng")
            {
                DialogResult dr = MessageBox.Show("Bạn muốn kết thúc quá trình xuất hàng?", "Thông Báo!", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                if (dr == DialogResult.Yes)
                {
                    XuatHangDAO.Instance.deleteDsXuatHang();
                }
            }
            else if (task == "Nhập Hàng")
            {
                DialogResult dr = MessageBox.Show("Bạn muốn kết thúc quá trình xuất hàng?", "Thông Báo!", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                if (dr == DialogResult.Yes)
                {
                    NhapHangDAO.Instance.deleteDsNhapHang();
                }
            }
            _flagFinsh = 1;
            this.Close();
        }

        private void FKhay_FormClosed(object sender, FormClosedEventArgs e)
        {


        }

        private void FKhay_FormClosing(object sender, FormClosingEventArgs e)
        {
            if (task == "Xuất Hàng" || task == "Nhập Hàng")
            {
                if (_flagFinsh == -1)
                {
                    DialogResult dr = MessageBox.Show("Thao tác không hợp lệ!", "Thông Báo!", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    e.Cancel = true;
                }
            }
               
        }

        private void guna2Button6_Click(object sender, EventArgs e)
        {

        }
    }
}
