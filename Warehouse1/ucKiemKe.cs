using DevExpress.XtraGrid.Views.BandedGrid;
using OfficeOpenXml;
using OfficeOpenXml.Style;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Warehouse1.DAO;

namespace Warehouse1
{
    public partial class ucKiemKe : UserControl
    {
        DataTable dataTableKiemKe = new DataTable();
        public ucKiemKe()
        {
            InitializeComponent();
            guna2DateTimePicker2.Text = DateTime.Now.Date.ToString();
            guna2DateTimePicker1.Text = DateTime.Now.Date.ToString();
            guna2NumericUpDownNamN.Value = Convert.ToInt64(DateTime.Now.Date.ToString("yyyy"));
            guna2NumericUpDownNamQ.Value = Convert.ToInt64(DateTime.Now.Date.ToString("yyyy"));
            guna2NumericUpDownNamT.Value = Convert.ToInt64(DateTime.Now.Date.ToString("yyyy"));
            guna2ComboBoxMau.SelectedItem = 1;
        }
        public static string date1 = "";
        public static string date2 = "";
        public static string msp = "";
        public static string Tensp = "";

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
        public string LayNgayCuoiCungCuaThang(DateTime dtInput)
        {
            DateTime dtResult = dtInput;
            dtResult = dtResult.AddMonths(1);
            dtResult = dtResult.AddDays(-(dtResult.Day));
            return dtResult.ToString("dd");
        }
        private void buttonTimkiem_Click(object sender, EventArgs e)
        {
            dataTableKiemKe.Clear();
            switch (guna2ComboBoxMau.Text)
            {

                case "Tất cả":

                    date1 = kiemKeDAO.Instance.minDateHisstory();
                    date2 = kiemKeDAO.Instance.maxDateHisstory();
                    dataTableKiemKe = kiemKeDAO.Instance.DsNXT(date1, date2);

                    break;
                case "Theo năm":
                    try
                    {
                        date1 = guna2NumericUpDownNamN.Value.ToString() + "-01-01";
                        date2 = guna2NumericUpDownNamN.Value.ToString() + "-12-31";
                        dataTableKiemKe = kiemKeDAO.Instance.DsNXT(date1, date2);

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
                            case "1":
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

                        dataTableKiemKe = kiemKeDAO.Instance.DsNXT(date1, date2);

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
                        dataTableKiemKe = kiemKeDAO.Instance.DsNXT(date1, date2);

                    }
                    catch (Exception)
                    {

                        MessageBox.Show("Năm không hợp lệ!");
                    }
                    break;
                case "Theo ngày":
                    date1 = guna2DateTimePicker1.Value.ToString("yyyy-MM-dd");
                    date2 = guna2DateTimePicker2.Value.ToString("yyyy-MM-dd");
                    dataTableKiemKe = kiemKeDAO.Instance.DsNXT(date1, date2);
                    break;
                default:
                    break;
            }
            gridControl1.DataSource = dataTableKiemKe;
        }

        int index = -1;
        private void gridView1_RowCellClick(object sender, DevExpress.XtraGrid.Views.Grid.RowCellClickEventArgs e)
        {
            index = e.RowHandle;
            if (index>=0)
            {
                try
                {
                    msp = advBandedGridView1.GetRowCellValue(index, "MaSp").ToString().Trim();
                    Tensp = advBandedGridView1.GetRowCellValue(index, "TenSp").ToString().Trim();
                    FormChiTietVatTu formChiTietVatTu = new FormChiTietVatTu();
                    formChiTietVatTu.StartPosition = FormStartPosition.CenterParent;
                    formChiTietVatTu.ShowDialog();
                }
                catch (Exception line)
                {

                    string er = line.StackTrace.ToString();
                    string[] b = er.Split(' ');
                    string mess = "Err:" + b[b.Length - 1] + " " + line.Message + "";
                    MessageBox.Show(mess, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
                
            }
            
        }

        private void buttonExcel_Click(object sender, EventArgs e)
        {
            _header2 = "CÔNG TY CỔ PHẦN TẬP ĐOÀN KỸ THUẬT VÀ CÔNG NGHIỆP VIỆT NAM; Kho: Intech;" + " Từ: " + Convert.ToDateTime(date1).ToString("dd/MM/yyyy") + " Đến: " + Convert.ToDateTime(date2).ToString("dd/MM/yyyy");
            using (System.Windows.Forms.SaveFileDialog saveDialog = new SaveFileDialog())
            {
                saveDialog.Filter = "Excel (Phiên bản 2007 trở lên (.xlsx)|*.xlsx";
                saveDialog.FileName = "Báo cáo tồn kho ";
                if (saveDialog.ShowDialog() != DialogResult.Cancel)
                {
                    string exportFilePath = saveDialog.FileName;

                    var newFile = new FileInfo(exportFilePath);

                    using (var package = new ExcelPackage(newFile))
                    {
                        if (File.Exists(newFile.ToString()))
                        {
                            string dele = package.Workbook.Worksheets[1].Name;
                            package.Workbook.Worksheets.Delete(dele);


                        }
                        //Tạo 1 Sheet mới với tên Sheet là NewSheet1
                        package.Workbook.Worksheets.Add("Báo cáo tồn kho");
                        ExcelWorksheet worksheet = package.Workbook.Worksheets[1];
                        export_form_excel(worksheet);
                        try
                        {

                            exportDuLieuPL(worksheet, advBandedGridView1);
                        }
                        catch
                        {

                            MessageBox.Show("Không có dữ liệu báo cáo!");
                        }


                        try
                        {
                            package.Save();
                            System.Diagnostics.Process.Start(exportFilePath);
                            //MessageBox.Show("Xuất báo cáo thành công!");
                        }
                        catch
                        {

                            MessageBox.Show("Lỗi xuất báo cáo!");
                        }


                    }
                }

            }

        }

        #region xuất file excel
        string _header1 = "TỔNG HỢP TỒN KHO";
        string _header2 = "CÔNG TY CỔ PHẦN TẬP ĐOÀN KỸ THUẬT VÀ CÔNG NGHIỆP VIỆT NAM; Kho: Intech;";
        string _Column1 = "Mã hàng";
        string _Column2 = "Tên hàng";
        string _Column3 = "ĐVT";
        string _Column4 = "Đơn giá";
        string _Column5 = "Số lượng";
        string _Column6 = "Giá trị";
        string _Column7 = "";
        string _Column8 = "";
        string _Column9 = "";
        string _Column10 = "";
        string _Column11 = "";
        string _Column12 = "";
        string _Banded1 = "Đầu kỳ";
        string _Banded2 = "Nhập kho";
        string _Banded3 = "Xuất kho";
        string _Banded4 = "Cuối kỳ";
        Color ColorHeader = Color.FromArgb(230, 234, 238);
        Color ColorBoder = Color.FromArgb(125, 162, 206);
        Color ColorTotal = Color.FromArgb(191, 191, 191);

        public void export_form_excel(ExcelWorksheet worksheet)
        {
            worksheet.Column(1).Width = 30;
            worksheet.Column(2).Width = 30;
            worksheet.Column(3).Width = 14;
            worksheet.Column(4).Width = 14;
            worksheet.Column(5).Width = 16;
            worksheet.Column(6).Width = 16;
            worksheet.Column(7).Width = 16;
            worksheet.Column(8).Width = 16;
            worksheet.Column(9).Width = 16;
            worksheet.Column(10).Width = 16;
            worksheet.Column(11).Width = 16;
            worksheet.Column(12).Width = 16;

            worksheet.Row(1).Height = 19;
            //
            worksheet.Cells.Style.Font.Name = "Times new roman";
            worksheet.Cells.Style.Font.Size = 11;

            // _header1
            worksheet.Cells[1, 1, 1, 12].Merge = true;
            worksheet.Cells[1, 1].Style.HorizontalAlignment = OfficeOpenXml.Style.ExcelHorizontalAlignment.Center;
            worksheet.Cells[1, 1].Style.VerticalAlignment = OfficeOpenXml.Style.ExcelVerticalAlignment.Center;
            worksheet.Cells[1, 1].Value = _header1;
            worksheet.Cells[1, 1].Style.Font.Bold = true;
            worksheet.Cells[1, 1].Style.Font.Size = 14;
            worksheet.Cells[1, 1].Style.WrapText = false;

            //--------------------------------_header2
            worksheet.Cells[2, 1, 2, 12].Merge = true;
            worksheet.Cells[2, 1].Style.HorizontalAlignment = OfficeOpenXml.Style.ExcelHorizontalAlignment.Center;
            worksheet.Cells[2, 1].Style.VerticalAlignment = OfficeOpenXml.Style.ExcelVerticalAlignment.Center;
            worksheet.Cells[2, 1].Value = _header2;
            worksheet.Cells[2, 1].Style.Font.Bold = true;
            worksheet.Cells[2, 1].Style.Font.Size = 11;
            worksheet.Cells[2, 1].Style.WrapText = false;

            //--------------------------------_Column1


            customheaderExcel(worksheet, _Column1, 9, false, 3, 1, 4, 1);
            BorderExcel(worksheet, ColorBoder, 3, 1, 4, 1);

            //--------------------------------_Column2

            customheaderExcel(worksheet, _Column2, 9, false, 3, 2, 4, 2);
            BorderExcel(worksheet, ColorBoder, 3, 2, 4, 2);


            //--------------------------------_Column3

            customheaderExcel(worksheet, _Column3, 9, false, 3, 3, 4, 3);
            BorderExcel(worksheet, ColorBoder, 3, 3, 4, 3);


            //--------------------------------_Column4
            customheaderExcel(worksheet, _Column4, 9, false, 3, 4, 4, 4);
            BorderExcel(worksheet, ColorBoder, 3, 4, 4, 4);

            //--------------------------------đầu kỳ
            //
            customheaderExcel(worksheet, _Banded1, 9, false, 3, 5, 3, 6);
            BorderExcel(worksheet, ColorBoder, 3, 5, 3, 6);
            ;
            //số lượng
            customheaderExcel(worksheet, _Column5, 9, false, 4, 5);
            BorderExcel(worksheet, ColorBoder, 4, 5);
            // giá trị
            customheaderExcel(worksheet, _Column6, 9, false, 4, 6);
            BorderExcel(worksheet, ColorBoder, 4, 6);

            //--------------------------------nhập kho
            //
            customheaderExcel(worksheet, _Banded2, 9, false, 3, 7, 3, 8);
            BorderExcel(worksheet, ColorBoder, 3, 7, 3, 8);
            ;
            //số lượng
            customheaderExcel(worksheet, _Column5, 9, false, 4, 7);
            BorderExcel(worksheet, ColorBoder, 4, 7);
            // giá trị
            customheaderExcel(worksheet, _Column6, 9, false, 4, 8);
            BorderExcel(worksheet, ColorBoder, 4, 8);
            //--------------------------------xuất kho
            //
            customheaderExcel(worksheet, _Banded3, 9, false, 3, 9, 3, 10);
            BorderExcel(worksheet, ColorBoder, 3, 9, 3, 10);
            ;
            //số lượng
            customheaderExcel(worksheet, _Column5, 9, false, 4, 9);
            BorderExcel(worksheet, ColorBoder, 4, 9);
            // giá trị
            customheaderExcel(worksheet, _Column6, 9, false, 4, 10);
            BorderExcel(worksheet, ColorBoder, 4, 10);
            //--------------------------------tồn
            //
            customheaderExcel(worksheet, _Banded4, 9, false, 3, 11, 3, 12);
            BorderExcel(worksheet, ColorBoder, 3, 11, 3, 12);
            ;
            //số lượng
            customheaderExcel(worksheet, _Column5, 9, false, 4, 11);
            BorderExcel(worksheet, ColorBoder, 4, 11);
            // giá trị
            customheaderExcel(worksheet, _Column6, 9, false, 4, 12);
            BorderExcel(worksheet, ColorBoder, 4, 12);

        }

        void exportDuLieuPL(ExcelWorksheet worksheet, AdvBandedGridView advBandedGridView)
        {
            double slDauKy = 0;
            double gtDauKy = 0;
            double slNhapKho = 0;
            double gtNhapKho = 0;
            double slXuatKho = 0;
            double gtXuatKho = 0;
            double slCuoiKy = 0;
            double gtCuoiKy = 0;
            ExcelHorizontalAlignment excelHorizontalAlignment2 = ExcelHorizontalAlignment.Right;
            ExcelHorizontalAlignment excelHorizontalAlignment1 = ExcelHorizontalAlignment.Left;
            for (int i = 0; i < advBandedGridView.RowCount; i++)
            {

                
                customDataExcel(worksheet, advBandedGridView.GetRowCellValue(i, "MaSp").ToString().Trim(), i + 6, 1, excelHorizontalAlignment1);
                customDataExcel(worksheet, advBandedGridView.GetRowCellValue(i, "TenSp").ToString().Trim(), i + 6, 2, excelHorizontalAlignment1);
                customDataExcel(worksheet, advBandedGridView.GetRowCellValue(i, "DVT").ToString().Trim(), i + 6, 3, excelHorizontalAlignment1);
                customDataExcel(worksheet, advBandedGridView.GetRowCellValue(i, "DonGia"), i + 6, 4, excelHorizontalAlignment2);
                customDataExcel(worksheet,  advBandedGridView.GetRowCellValue(i, "slDauKy"), i + 6, 5, excelHorizontalAlignment2);
                customDataExcel(worksheet,  advBandedGridView.GetRowCellValue(i, "gtDauKy"), i + 6, 6, excelHorizontalAlignment2);
                customDataExcel(worksheet,  advBandedGridView.GetRowCellValue(i, "slNhapKho"), i + 6, 7, excelHorizontalAlignment2);
                customDataExcel(worksheet,  advBandedGridView.GetRowCellValue(i, "gtNhapKho"), i + 6, 8, excelHorizontalAlignment2);
                customDataExcel(worksheet,  advBandedGridView.GetRowCellValue(i, "slXuatKho"), i + 6, 9, excelHorizontalAlignment2);
                customDataExcel(worksheet,  advBandedGridView.GetRowCellValue(i, "gtXuatKho"), i + 6, 10, excelHorizontalAlignment2);
                customDataExcel(worksheet,  advBandedGridView.GetRowCellValue(i, "slCuoiKy"), i + 6, 11, excelHorizontalAlignment2);
                customDataExcel(worksheet,  advBandedGridView.GetRowCellValue(i, "gtCuoiKy"), i + 6, 12, excelHorizontalAlignment2);

                slDauKy += Convert.ToDouble(advBandedGridView.GetRowCellValue(i, "slDauKy").ToString().Trim());
                gtDauKy += Convert.ToDouble(advBandedGridView.GetRowCellValue(i, "gtDauKy").ToString().Trim());
                slNhapKho += Convert.ToDouble(advBandedGridView.GetRowCellValue(i, "slNhapKho").ToString().Trim());
                gtNhapKho += Convert.ToDouble(advBandedGridView.GetRowCellValue(i, "gtNhapKho").ToString().Trim());
                slXuatKho += Convert.ToDouble(advBandedGridView.GetRowCellValue(i, "slXuatKho").ToString().Trim());
                gtXuatKho += Convert.ToDouble(advBandedGridView.GetRowCellValue(i, "gtXuatKho").ToString().Trim());
                slCuoiKy += Convert.ToDouble(advBandedGridView.GetRowCellValue(i, "slCuoiKy").ToString().Trim());
                gtCuoiKy += Convert.ToDouble(advBandedGridView.GetRowCellValue(i, "gtCuoiKy").ToString().Trim());
            }

            worksheet.Cells[5, 1, 5, 3].Merge = true;
            worksheet.Cells[5, 1].Style.HorizontalAlignment = OfficeOpenXml.Style.ExcelHorizontalAlignment.Left;
            worksheet.Cells[5, 1].Style.VerticalAlignment = OfficeOpenXml.Style.ExcelVerticalAlignment.Center;
            worksheet.Cells[5, 1].Style.Font.Bold = true;
            worksheet.Cells[5, 1].Style.Font.Size = 9;
            worksheet.Cells[5, 1].Style.WrapText = false;
            worksheet.Cells[5, 1].Value = "Tên kho: Kho INTECH";
         
            customToalExcel(worksheet, ColorTotal, 5, 5, slDauKy, gtDauKy, slNhapKho, gtNhapKho, slXuatKho, gtXuatKho, slCuoiKy, gtCuoiKy);

            //worksheet.Cells[advBandedGridView.RowCount, 1, 5, 3].Merge = true;
            worksheet.Cells[advBandedGridView.RowCount + 6, 1].Style.HorizontalAlignment = OfficeOpenXml.Style.ExcelHorizontalAlignment.Left;
            worksheet.Cells[advBandedGridView.RowCount + 6, 1].Style.VerticalAlignment = OfficeOpenXml.Style.ExcelVerticalAlignment.Center;
            worksheet.Cells[advBandedGridView.RowCount + 6, 1].Style.Font.Bold = true;
            worksheet.Cells[advBandedGridView.RowCount + 6, 1].Style.Font.Size = 9;
            worksheet.Cells[advBandedGridView.RowCount + 6, 1].Style.WrapText = false;
            worksheet.Cells[advBandedGridView.RowCount + 6, 1].Style.Fill.PatternType = ExcelFillStyle.Solid;
            worksheet.Cells[advBandedGridView.RowCount + 6, 1].Style.Fill.BackgroundColor.SetColor(ColorTotal);
            worksheet.Cells[advBandedGridView.RowCount + 6, 1].Value = "Số dòng = " + advBandedGridView.RowCount.ToString();
            customToalExcel(worksheet, ColorTotal, advBandedGridView.RowCount + 6, 5, slDauKy, gtDauKy, slNhapKho, gtNhapKho, slXuatKho, gtXuatKho, slCuoiKy, gtCuoiKy);


        }

        void BorderExcel(ExcelWorksheet worksheet, Color ColorBoder, int FromRow, int FromColumn, int ToRow = -1, int ToColumn = -1)
        {
            if (ToRow > -1 && ToColumn > -1)
            {

                worksheet.Cells[FromRow, FromColumn, ToRow, ToColumn].Style.Border.BorderAround(ExcelBorderStyle.Thin);
                worksheet.Cells[FromRow, FromColumn, ToRow, ToColumn].Style.Border.Left.Style = ExcelBorderStyle.Thin;
                worksheet.Cells[FromRow, FromColumn, ToRow, ToColumn].Style.Border.Left.Color.SetColor(ColorBoder);
                worksheet.Cells[FromRow, FromColumn, ToRow, ToColumn].Style.Border.Right.Style = ExcelBorderStyle.Thin;
                worksheet.Cells[FromRow, FromColumn, ToRow, ToColumn].Style.Border.Right.Color.SetColor(ColorBoder);
                worksheet.Cells[FromRow, FromColumn, ToRow, ToColumn].Style.Border.Top.Style = ExcelBorderStyle.Thin;
                worksheet.Cells[FromRow, FromColumn, ToRow, ToColumn].Style.Border.Top.Color.SetColor(ColorBoder);
                worksheet.Cells[FromRow, FromColumn, ToRow, ToColumn].Style.Border.Bottom.Style = ExcelBorderStyle.Thin;
                worksheet.Cells[FromRow, FromColumn, ToRow, ToColumn].Style.Border.Bottom.Color.SetColor(ColorBoder);
            }
            else
            {
                worksheet.Cells[FromRow, FromColumn].Style.Border.BorderAround(ExcelBorderStyle.Thin);
                worksheet.Cells[FromRow, FromColumn].Style.Border.Left.Style = ExcelBorderStyle.Thin;
                worksheet.Cells[FromRow, FromColumn].Style.Border.Left.Color.SetColor(ColorBoder);
                worksheet.Cells[FromRow, FromColumn].Style.Border.Right.Style = ExcelBorderStyle.Thin;
                worksheet.Cells[FromRow, FromColumn].Style.Border.Right.Color.SetColor(ColorBoder);
                worksheet.Cells[FromRow, FromColumn].Style.Border.Top.Style = ExcelBorderStyle.Thin;
                worksheet.Cells[FromRow, FromColumn].Style.Border.Top.Color.SetColor(ColorBoder);
                worksheet.Cells[FromRow, FromColumn].Style.Border.Bottom.Style = ExcelBorderStyle.Thin;
                worksheet.Cells[FromRow, FromColumn].Style.Border.Bottom.Color.SetColor(ColorBoder);
            }

        }

        void customheaderExcel(ExcelWorksheet worksheet, object sData, int FontSize, bool FontBold, int FromRow, int FromColumn, int ToRow = -1, int ToColumn = -1)
        {
            if (ToRow > -1 && ToColumn > -1)
            {
                worksheet.Cells[FromRow, FromColumn, ToRow, ToColumn].Merge = true;
                worksheet.Cells[FromRow, FromColumn].Style.HorizontalAlignment = OfficeOpenXml.Style.ExcelHorizontalAlignment.Center;
                worksheet.Cells[FromRow, FromColumn].Style.VerticalAlignment = OfficeOpenXml.Style.ExcelVerticalAlignment.Center;
                worksheet.Cells[FromRow, FromColumn].Style.Font.Bold = FontBold;
                worksheet.Cells[FromRow, FromColumn].Style.Font.Size = FontSize;
                worksheet.Cells[FromRow, FromColumn].Style.WrapText = false;
                worksheet.Cells[FromRow, FromColumn].Style.Fill.PatternType = ExcelFillStyle.Solid;
                worksheet.Cells[FromRow, FromColumn].Style.Fill.BackgroundColor.SetColor(ColorHeader);
                worksheet.Cells[FromRow, FromColumn].Value = sData;
                
            }
            else
            {

                worksheet.Cells[FromRow, FromColumn].Style.HorizontalAlignment = OfficeOpenXml.Style.ExcelHorizontalAlignment.Center;
                worksheet.Cells[FromRow, FromColumn].Style.VerticalAlignment = OfficeOpenXml.Style.ExcelVerticalAlignment.Center;
                worksheet.Cells[FromRow, FromColumn].Style.Font.Bold = FontBold;
                worksheet.Cells[FromRow, FromColumn].Style.Font.Size = FontSize;
                worksheet.Cells[FromRow, FromColumn].Style.WrapText = false;
                worksheet.Cells[FromRow, FromColumn].Style.Fill.PatternType = ExcelFillStyle.Solid;
                worksheet.Cells[FromRow, FromColumn].Style.Fill.BackgroundColor.SetColor(ColorHeader);
                worksheet.Cells[FromRow, FromColumn].Value = sData;
            }

        }

        void customDataExcel(ExcelWorksheet worksheet, object sData, int FromRow, int FromColumn, ExcelHorizontalAlignment excelHorizontalAlignment = ExcelHorizontalAlignment.Center, ExcelVerticalAlignment excelVerticalAlignment = ExcelVerticalAlignment.Center)
        {
            //worksheet.Cells[FromRow, FromColumn].Style.Border.BorderAround(ExcelBorderStyle.Thin);
            //worksheet.Cells[FromRow, FromColumn].Style.Border.Right.Style = ExcelBorderStyle.Thin;
            worksheet.Cells[FromRow, FromColumn].Style.HorizontalAlignment = excelHorizontalAlignment;
            worksheet.Cells[FromRow, FromColumn].Style.VerticalAlignment = excelVerticalAlignment;
            worksheet.Cells[FromRow, FromColumn].Style.Font.Bold = false;
            worksheet.Cells[FromRow, FromColumn].Style.Font.Size = 9;
            worksheet.Cells[FromRow, FromColumn].Style.WrapText = false;
            worksheet.Cells[FromRow, FromColumn].Value = sData;

        }

        void customToalExcel(ExcelWorksheet worksheet, Color ColorTotal, int FromRow, int FromColumn, double slDauKy = 0, double gtDauKy = 0, double slNhapKho = 0, double gtNhapKho = 0, double slXuatKho = 0, double gtXuatKho = 0, double slCuoiKy = 0, double gtCuoiKy = 0)
        {
            worksheet.Cells[FromRow, FromColumn].Style.HorizontalAlignment = OfficeOpenXml.Style.ExcelHorizontalAlignment.Right;
            worksheet.Cells[FromRow, FromColumn].Style.VerticalAlignment = OfficeOpenXml.Style.ExcelVerticalAlignment.Center;
            worksheet.Cells[FromRow, FromColumn].Style.Font.Bold = true;
            worksheet.Cells[FromRow, FromColumn].Style.Font.Size = 9;
            worksheet.Cells[FromRow, FromColumn].Style.WrapText = false;
            worksheet.Cells[FromRow, FromColumn].Style.Fill.PatternType = ExcelFillStyle.Solid;
            worksheet.Cells[FromRow, FromColumn].Style.Fill.BackgroundColor.SetColor(ColorTotal);
            worksheet.Cells[FromRow, FromColumn].Value = slDauKy;

            worksheet.Cells[FromRow, FromColumn + 1].Style.HorizontalAlignment = OfficeOpenXml.Style.ExcelHorizontalAlignment.Right;
            worksheet.Cells[FromRow, FromColumn + 1].Style.VerticalAlignment = OfficeOpenXml.Style.ExcelVerticalAlignment.Center;
            worksheet.Cells[FromRow, FromColumn + 1].Style.Font.Bold = true;
            worksheet.Cells[FromRow, FromColumn + 1].Style.Font.Size = 9;
            worksheet.Cells[FromRow, FromColumn + 1].Style.WrapText = false;
            worksheet.Cells[FromRow, FromColumn + 1].Style.Fill.PatternType = ExcelFillStyle.Solid;
            worksheet.Cells[FromRow, FromColumn + 1].Style.Fill.BackgroundColor.SetColor(ColorTotal);
            worksheet.Cells[FromRow, FromColumn + 1].Value = gtDauKy;

            worksheet.Cells[FromRow, FromColumn + 2].Style.HorizontalAlignment = OfficeOpenXml.Style.ExcelHorizontalAlignment.Right;
            worksheet.Cells[FromRow, FromColumn + 2].Style.VerticalAlignment = OfficeOpenXml.Style.ExcelVerticalAlignment.Center;
            worksheet.Cells[FromRow, FromColumn + 2].Style.Font.Bold = true;
            worksheet.Cells[FromRow, FromColumn + 2].Style.Font.Size = 9;
            worksheet.Cells[FromRow, FromColumn + 2].Style.WrapText = false;
            worksheet.Cells[FromRow, FromColumn + 2].Style.Fill.PatternType = ExcelFillStyle.Solid;
            worksheet.Cells[FromRow, FromColumn + 2].Style.Fill.BackgroundColor.SetColor(ColorTotal);
            worksheet.Cells[FromRow, FromColumn + 2].Value = slNhapKho;

            worksheet.Cells[FromRow, FromColumn + 3].Style.HorizontalAlignment = OfficeOpenXml.Style.ExcelHorizontalAlignment.Right;
            worksheet.Cells[FromRow, FromColumn + 3].Style.VerticalAlignment = OfficeOpenXml.Style.ExcelVerticalAlignment.Center;
            worksheet.Cells[FromRow, FromColumn + 3].Style.Font.Bold = true;
            worksheet.Cells[FromRow, FromColumn + 3].Style.Font.Size = 9;
            worksheet.Cells[FromRow, FromColumn + 3].Style.WrapText = false;
            worksheet.Cells[FromRow, FromColumn + 3].Style.Fill.PatternType = ExcelFillStyle.Solid;
            worksheet.Cells[FromRow, FromColumn + 3].Style.Fill.BackgroundColor.SetColor(ColorTotal);
            worksheet.Cells[FromRow, FromColumn + 3].Value = gtNhapKho;

            worksheet.Cells[FromRow, FromColumn + 4].Style.HorizontalAlignment = OfficeOpenXml.Style.ExcelHorizontalAlignment.Right;
            worksheet.Cells[FromRow, FromColumn + 4].Style.VerticalAlignment = OfficeOpenXml.Style.ExcelVerticalAlignment.Center;
            worksheet.Cells[FromRow, FromColumn + 4].Style.Font.Bold = true;
            worksheet.Cells[FromRow, FromColumn + 4].Style.Font.Size = 9;
            worksheet.Cells[FromRow, FromColumn + 4].Style.WrapText = false;
            worksheet.Cells[FromRow, FromColumn + 4].Style.Fill.PatternType = ExcelFillStyle.Solid;
            worksheet.Cells[FromRow, FromColumn + 4].Style.Fill.BackgroundColor.SetColor(ColorTotal);
            worksheet.Cells[FromRow, FromColumn + 4].Value = slXuatKho;

            worksheet.Cells[FromRow, FromColumn + 5].Style.HorizontalAlignment = OfficeOpenXml.Style.ExcelHorizontalAlignment.Right;
            worksheet.Cells[FromRow, FromColumn + 5].Style.VerticalAlignment = OfficeOpenXml.Style.ExcelVerticalAlignment.Center;
            worksheet.Cells[FromRow, FromColumn + 5].Style.Font.Bold = true;
            worksheet.Cells[FromRow, FromColumn + 5].Style.Font.Size = 9;
            worksheet.Cells[FromRow, FromColumn + 5].Style.WrapText = false;
            worksheet.Cells[FromRow, FromColumn + 5].Style.Fill.PatternType = ExcelFillStyle.Solid;
            worksheet.Cells[FromRow, FromColumn + 5].Style.Fill.BackgroundColor.SetColor(ColorTotal);
            worksheet.Cells[FromRow, FromColumn + 5].Value = gtXuatKho;

            worksheet.Cells[FromRow, FromColumn + 6].Style.HorizontalAlignment = OfficeOpenXml.Style.ExcelHorizontalAlignment.Right;
            worksheet.Cells[FromRow, FromColumn + 6].Style.VerticalAlignment = OfficeOpenXml.Style.ExcelVerticalAlignment.Center;
            worksheet.Cells[FromRow, FromColumn + 6].Style.Font.Bold = true;
            worksheet.Cells[FromRow, FromColumn + 6].Style.Font.Size = 9;
            worksheet.Cells[FromRow, FromColumn + 6].Style.WrapText = false;
            worksheet.Cells[FromRow, FromColumn + 6].Style.Fill.PatternType = ExcelFillStyle.Solid;
            worksheet.Cells[FromRow, FromColumn + 6].Style.Fill.BackgroundColor.SetColor(ColorTotal);
            worksheet.Cells[FromRow, FromColumn + 6].Value = slCuoiKy;

            worksheet.Cells[FromRow, FromColumn + 7].Style.HorizontalAlignment = OfficeOpenXml.Style.ExcelHorizontalAlignment.Right;
            worksheet.Cells[FromRow, FromColumn + 7].Style.VerticalAlignment = OfficeOpenXml.Style.ExcelVerticalAlignment.Center;
            worksheet.Cells[FromRow, FromColumn + 7].Style.Font.Bold = true;
            worksheet.Cells[FromRow, FromColumn + 7].Style.Font.Size = 9;
            worksheet.Cells[FromRow, FromColumn + 7].Style.WrapText = false;
            worksheet.Cells[FromRow, FromColumn + 7].Style.Fill.PatternType = ExcelFillStyle.Solid;
            worksheet.Cells[FromRow, FromColumn + 7].Style.Fill.BackgroundColor.SetColor(ColorTotal);
            worksheet.Cells[FromRow, FromColumn + 7].Value = gtCuoiKy;

        }


        #endregion

        private void gridControl1_Click(object sender, EventArgs e)
        {

        }
    }
}
