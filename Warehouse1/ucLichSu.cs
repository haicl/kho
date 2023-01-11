using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Diagnostics;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Warehouse1.DAO;
using DevExpress.Export;
using DevExpress.XtraPrinting;
namespace Warehouse1
{
    public partial class ucLichSu : UserControl
    {
        DataTable dataTableHistory = new DataTable();
        public ucLichSu()
        {
            InitializeComponent();
        }

        private void ucLichSu_Load(object sender, EventArgs e)
        {
            dataTableHistory = DataDAO.Instance.SELECTHistory();
            gridControl1.DataSource = dataTableHistory;
            guna2DateTimePicker2.Text = DateTime.Now.Date.ToString();
            guna2DateTimePicker1.Text = DateTime.Now.Date.ToString();
            guna2NumericUpDownNamN.Value = Convert.ToInt64(DateTime.Now.Date.ToString("yyyy"));
            guna2NumericUpDownNamQ.Value = Convert.ToInt64(DateTime.Now.Date.ToString("yyyy"));
            guna2NumericUpDownNamT.Value = Convert.ToInt64(DateTime.Now.Date.ToString("yyyy"));
            guna2ComboBoxMau.SelectedItem = 1;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            
            gridControl1.DataSource = dataTableHistory;
            advBandedGridView1.ClearColumnsFilter();


        }
        string date1 = "";
        string date2 = "";
        public string LayNgayCuoiCungCuaThang(DateTime dtInput)
        {
            DateTime dtResult = dtInput;
            dtResult = dtResult.AddMonths(1);
            dtResult = dtResult.AddDays(-(dtResult.Day));
            return dtResult.ToString("dd");
        }
        private void button2_Click(object sender, EventArgs e)
        {
            //DataTable table = new DataTable();
            //date1 = guna2DateTimePicker1.Value.ToString("yyyy-MM-dd");
            //date2 = guna2DateTimePicker2.Value.ToString("yyyy-MM-dd");
            //table = DataDAO.Instance.SELECTHistory(date1, date2);
            //gridControl1.DataSource = table;
            //////
            dataTableHistory.Clear();
            switch (guna2ComboBoxMau.Text)
            {

                case "Tất cả":
                    
                    dataTableHistory = DataDAO.Instance.SELECTHistory();
                    
                    break;
                case "Theo năm":
                    try
                    {
                        date1 = guna2NumericUpDownNamN.Value.ToString() + "-01-01";
                        date2 = guna2NumericUpDownNamN.Value.ToString() + "-12-31";
                        dataTableHistory = DataDAO.Instance.SELECTHistory(date1, date2);
                       
                    }
                    catch (Exception)
                    {

                        MessageBox.Show("Năm không hợp lệ!");
                    }
                    
                    break;
                case "Theo quý":
                    try
                    {
                        DataTable table = new DataTable();
                        switch (guna2ComboBoxQuy.Text)
                        {
                            case  "1":
                                date1 = guna2NumericUpDownNamQ.Value.ToString() + "-01-01";
                                date2 = guna2NumericUpDownNamQ.Value.ToString() + "-03-31";
                                break;
                            case "2":
                                date1 = guna2NumericUpDownNamQ.Value.ToString() + "-04-01";
                                date2 = guna2NumericUpDownNamQ.Value.ToString() + "-06-30";
                                break;
                            case "3":
                                date1 = guna2NumericUpDownNamQ.Value.ToString() + "-07-01";
                                date2 = guna2NumericUpDownNamQ.Value.ToString() + "-09-30";
                                break;
                            case "4":
                                date1 = guna2NumericUpDownNamQ.Value.ToString() + "-10-01";
                                date2 = guna2NumericUpDownNamQ.Value.ToString() + "-12-31";
                                break;
                            default:
                                break;
                        }

                        dataTableHistory = DataDAO.Instance.SELECTHistory(date1, date2);
                       
                    }
                    catch (Exception)
                    {

                        MessageBox.Show("Năm không hợp lệ!");
                    }
                    break;
                case "Theo tháng":
                    try
                    {
                       
                        date1 = guna2NumericUpDownNamT.Value.ToString() + "-" + guna2ComboBoxthangt.Text + "-01";
                        string ThangaNam = guna2NumericUpDownNamT.Value.ToString() + "-" + guna2ComboBoxthangt.Text;
                        date2 = ThangaNam + "-" + LayNgayCuoiCungCuaThang(Convert.ToDateTime(ThangaNam));
                        dataTableHistory = DataDAO.Instance.SELECTHistory(date1, date2);

                    }
                    catch (Exception)
                    {

                        MessageBox.Show("Năm không hợp lệ!");
                    }
                    break;
                case "Theo ngày":
                    date1 = guna2DateTimePicker1.Value.ToString("yyyy-MM-dd");
                    date2 = guna2DateTimePicker2.Value.ToString("yyyy-MM-dd");
                    dataTableHistory = DataDAO.Instance.SELECTHistory(date1, date2);
                    break;
                default:
                    break;
            }
            gridControl1.DataSource = dataTableHistory;
        }

        private void button3_Click(object sender, EventArgs e)
        {
            using (System.Windows.Forms.SaveFileDialog saveDialog = new SaveFileDialog())
            {
                saveDialog.Filter = "Excel (Phiên bản 2007 trở lên (.xlsx)|*.xlsx";
                saveDialog.FileName = "Lịch Sử Nhập Xuất";
                if (saveDialog.ShowDialog() != DialogResult.Cancel)
                {
                    string exportFilePath = saveDialog.FileName;

                    try
                    {

                        ExportSettings.DefaultExportType = ExportType.WYSIWYG;
                        XlsxExportOptionsEx options = new XlsxExportOptionsEx();
                        options.SuppressMaxRowsWarning = true;
                        options.SuppressMaxColumnsWarning = true;
                        options.SheetName = "Lịch Sử Nhập Xuất";


                        options.LayoutMode = LayoutMode.Table;
                        options.BandedLayoutMode = BandedLayoutMode.Default;

                        advBandedGridView1.ExportToXlsx(exportFilePath, options);

                        //gridControl1.ExportToXlsx(exportFilePath, options);
                        Process.Start(exportFilePath);
                    }
                    catch
                    {
                        MessageBox.Show("Lỗi!");
                    }

                }
            }

        }

        private void guna2ComboBoxMau_SelectedValueChanged(object sender, EventArgs e)
        {
            switch (guna2ComboBoxMau.Text)
            {
                case "Tất cả":

                    guna2PanelNgay.Visible = false;
                    guna2PanelThang.Visible = false;
                    guna2PanelQuy.Visible = false;
                    guna2PanelNam.Visible = false;

                    guna2PanelButton.Location = new Point(174, 7);
                    break;
                case "Theo năm":
                    guna2PanelNgay.Visible = false;
                    guna2PanelThang.Visible = false;
                    guna2PanelQuy.Visible = false;
                    guna2PanelNam.Visible = true;

                    guna2PanelNam.Location = new Point(174, 7);
                    guna2PanelButton.Location = new Point(guna2PanelNam.Size.Width + 174 + 10, 7);
                    break;
                case "Theo quý":
                    guna2PanelNgay.Visible = false;
                    guna2PanelThang.Visible = false;
                    guna2PanelQuy.Visible = true;
                    guna2PanelNam.Visible = false;

                    guna2PanelQuy.Location = new Point(174, 7);
                    guna2PanelButton.Location = new Point(guna2PanelQuy.Size.Width + 174 + 10, 7);
                    break;
                case "Theo tháng":
                    guna2PanelNgay.Visible = false;
                    guna2PanelThang.Visible = true;
                    guna2PanelQuy.Visible = false;
                    guna2PanelNam.Visible = false;

                    guna2PanelThang.Location = new Point(174, 7);
                    guna2PanelButton.Location = new Point(guna2PanelThang.Size.Width + 174 + 10, 7);
                    break;
                case "Theo ngày":
                    guna2PanelNgay.Visible = true;
                    guna2PanelThang.Visible = false;
                    guna2PanelQuy.Visible = false;
                    guna2PanelNam.Visible = false;

                    guna2PanelNgay.Location = new Point(174, 7);
                    guna2PanelButton.Location = new Point(guna2PanelNgay.Size.Width + 174 + 10, 7);
                    break;
                default:
                    break;
            }
        }

        private void gridControl1_Click(object sender, EventArgs e)
        {

        }
    }
}
