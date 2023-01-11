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
    public partial class FormChiTietVatTu : Form
    {
        public FormChiTietVatTu()
        {
            InitializeComponent();
        }
        DataTable DataTableSoChiTiet = new DataTable();

        private void FormChiTietVatTu_Load(object sender, EventArgs e)
        {
            DataTableSoChiTiet.Clear();
            DataTableSoChiTiet = kiemKeDAO.Instance.DsSoChoTie(ucKiemKe.date1, ucKiemKe.date2, ucKiemKe.msp);
            gridControl1.DataSource = DataTableSoChiTiet;
            _header2 = "CÔNG TY CỔ PHẦN TẬP ĐOÀN KỸ THUẬT VÀ CÔNG NGHIỆP VIỆT NAM; Mặt hàng: " + ucKiemKe.Tensp + "; Từ: " + Convert.ToDateTime(ucKiemKe.date1).ToString("dd/MM/yyyy") + " Đến: " + Convert.ToDateTime(ucKiemKe.date2).ToString("dd/MM/yyyy");
            label2.Text = _header2;
        }

        private void buttonExcel_Click(object sender, EventArgs e)
        {
             using (System.Windows.Forms.SaveFileDialog saveDialog = new SaveFileDialog())
            {
                saveDialog.Filter = "Excel (Phiên bản 2007 trở lên (.xlsx)|*.xlsx";
                saveDialog.FileName = "Sổ chi tiết vật tư";
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
                        package.Workbook.Worksheets.Add("Mặt hàng: " + ucKiemKe.Tensp);
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
        string _header1 = "SỔ CHI TIẾT VẬT TƯ HÀNG HÓA";
        string _header2 = "CÔNG TY CỔ PHẦN TẬP ĐOÀN KỸ THUẬT VÀ CÔNG NGHIỆP VIỆT NAM; Kho: Intech;";

        string _Column1 = "Ngày";
        string _Column2 = "Mã hàng";
        string _Column3 = "Tên hàng";
        string _Column4 = "Diễn giải";
        string _Column5 = "ĐVT";
        string _Column6 = "Đơn giá";
        string _Column7 = "Số lượng";
        string _Column8 = "Giá trị";       
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
            worksheet.Column(3).Width = 30;
            worksheet.Column(4).Width = 30;
            worksheet.Column(5).Width = 16;
            worksheet.Column(6).Width = 20;
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
            //--------------------------------_Column5
            customheaderExcel(worksheet, _Column5, 9, false, 3, 5, 4, 5);
            BorderExcel(worksheet, ColorBoder, 3, 4, 4, 4);
            //--------------------------------_Column6
            customheaderExcel(worksheet, _Column6, 9, false, 3, 6, 4, 6);
            BorderExcel(worksheet, ColorBoder, 3, 4, 4, 4);

            //--------------------------------nhập kho
            //
            customheaderExcel(worksheet, _Banded2, 9, false, 3, 7, 3, 8);
            BorderExcel(worksheet, ColorBoder, 3, 7, 3, 8);
            ;
            //số lượng
            customheaderExcel(worksheet, _Column7, 9, false, 4, 7);
            BorderExcel(worksheet, ColorBoder, 4, 7);
            // giá trị
            customheaderExcel(worksheet, _Column8, 9, false, 4, 8);
            BorderExcel(worksheet, ColorBoder, 4, 8);
            //--------------------------------xuất kho
            //
            customheaderExcel(worksheet, _Banded3, 9, false, 3, 9, 3, 10);
            BorderExcel(worksheet, ColorBoder, 3, 9, 3, 10);
            ;
            //số lượng
            customheaderExcel(worksheet, _Column7, 9, false, 4, 9);
            BorderExcel(worksheet, ColorBoder, 4, 9);
            // giá trị
            customheaderExcel(worksheet, _Column8, 9, false, 4, 10);
            BorderExcel(worksheet, ColorBoder, 4, 10);
            //--------------------------------tồn
            //
            customheaderExcel(worksheet, _Banded4, 9, false, 3, 11, 3, 12);
            BorderExcel(worksheet, ColorBoder, 3, 11, 3, 12);
            ;
            //số lượng
            customheaderExcel(worksheet, _Column7, 9, false, 4, 11);
            BorderExcel(worksheet, ColorBoder, 4, 11);
            // giá trị
            customheaderExcel(worksheet, _Column8, 9, false, 4, 12);
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

            for (int i = 0; i < advBandedGridView.RowCount; i++)
            {

                customDataExcel(worksheet, advBandedGridView.GetRowCellValue(i, "Ngay").ToString(), i + 6, 1, ExcelHorizontalAlignment.Left);
                customDataExcel(worksheet, advBandedGridView.GetRowCellValue(i, "MaSp").ToString().Trim(), i + 6, 2, ExcelHorizontalAlignment.Left);
                customDataExcel(worksheet, advBandedGridView.GetRowCellValue(i, "TenSp").ToString().Trim(), i + 6, 3, ExcelHorizontalAlignment.Left);
                customDataExcel(worksheet, advBandedGridView.GetRowCellValue(i, "DienGiai").ToString().Trim(), i + 6, 4, ExcelHorizontalAlignment.Left);
                customDataExcel(worksheet, advBandedGridView.GetRowCellValue(i, "DVT").ToString().Trim(), i + 6, 5, ExcelHorizontalAlignment.Center);
                customDataExcel(worksheet, advBandedGridView.GetRowCellValue(i, "DonGia"), i + 6, 6, ExcelHorizontalAlignment.Right);
                customDataExcel(worksheet, advBandedGridView.GetRowCellValue(i, "slNhapKho"), i + 6, 7, ExcelHorizontalAlignment.Right);
                customDataExcel(worksheet, advBandedGridView.GetRowCellValue(i, "gtNhapKho"), i + 6, 8, ExcelHorizontalAlignment.Right);
                customDataExcel(worksheet, advBandedGridView.GetRowCellValue(i, "slXuatKho"), i + 6, 9, ExcelHorizontalAlignment.Right);
                customDataExcel(worksheet, advBandedGridView.GetRowCellValue(i, "gtXuatKho"), i + 6, 10, ExcelHorizontalAlignment.Right);
                customDataExcel(worksheet, advBandedGridView.GetRowCellValue(i, "slCuoiKy"), i + 6, 11, ExcelHorizontalAlignment.Right);
                customDataExcel(worksheet, advBandedGridView.GetRowCellValue(i, "gtCuoiKy"), i + 6, 12, ExcelHorizontalAlignment.Right);

      
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

            customToalExcel(worksheet, ColorTotal, 5, 7,  slNhapKho, gtNhapKho, slXuatKho, gtXuatKho, slCuoiKy, gtCuoiKy);

            //worksheet.Cells[advBandedGridView.RowCount, 1, 5, 3].Merge = true;
            worksheet.Cells[advBandedGridView.RowCount + 6, 1].Style.HorizontalAlignment = OfficeOpenXml.Style.ExcelHorizontalAlignment.Left;
            worksheet.Cells[advBandedGridView.RowCount + 6, 1].Style.VerticalAlignment = OfficeOpenXml.Style.ExcelVerticalAlignment.Center;
            worksheet.Cells[advBandedGridView.RowCount + 6, 1].Style.Font.Bold = true;
            worksheet.Cells[advBandedGridView.RowCount + 6, 1].Style.Font.Size = 9;
            worksheet.Cells[advBandedGridView.RowCount + 6, 1].Style.WrapText = false;
            worksheet.Cells[advBandedGridView.RowCount + 6, 1].Style.Fill.PatternType = ExcelFillStyle.Solid;
            worksheet.Cells[advBandedGridView.RowCount + 6, 1].Style.Fill.BackgroundColor.SetColor(ColorTotal);
            worksheet.Cells[advBandedGridView.RowCount + 6, 1].Value = "Số dòng = " + advBandedGridView.RowCount.ToString();
            customToalExcel(worksheet, ColorTotal, advBandedGridView.RowCount + 6, 7, slNhapKho, gtNhapKho, slXuatKho, gtXuatKho, slCuoiKy, gtCuoiKy);


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

        void customToalExcel(ExcelWorksheet worksheet, Color ColorTotal, int FromRow, int FromColumn, double slNhapKho = 0, double gtNhapKho = 0, double slXuatKho = 0, double gtXuatKho = 0, double slCuoiKy = 0, double gtCuoiKy = 0)
        {

            worksheet.Cells[FromRow, FromColumn ].Style.HorizontalAlignment = OfficeOpenXml.Style.ExcelHorizontalAlignment.Right;
            worksheet.Cells[FromRow, FromColumn ].Style.VerticalAlignment = OfficeOpenXml.Style.ExcelVerticalAlignment.Center;
            worksheet.Cells[FromRow, FromColumn ].Style.Font.Bold = true;
            worksheet.Cells[FromRow, FromColumn ].Style.Font.Size = 9;
            worksheet.Cells[FromRow, FromColumn ].Style.WrapText = false;
            worksheet.Cells[FromRow, FromColumn ].Style.Fill.PatternType = ExcelFillStyle.Solid;
            worksheet.Cells[FromRow, FromColumn ].Style.Fill.BackgroundColor.SetColor(ColorTotal);
            worksheet.Cells[FromRow, FromColumn ].Value = slNhapKho;

            worksheet.Cells[FromRow, FromColumn + 1].Style.HorizontalAlignment = OfficeOpenXml.Style.ExcelHorizontalAlignment.Right;
            worksheet.Cells[FromRow, FromColumn + 1].Style.VerticalAlignment = OfficeOpenXml.Style.ExcelVerticalAlignment.Center;
            worksheet.Cells[FromRow, FromColumn + 1].Style.Font.Bold = true;
            worksheet.Cells[FromRow, FromColumn + 1].Style.Font.Size = 9;
            worksheet.Cells[FromRow, FromColumn + 1].Style.WrapText = false;
            worksheet.Cells[FromRow, FromColumn + 1].Style.Fill.PatternType = ExcelFillStyle.Solid;
            worksheet.Cells[FromRow, FromColumn + 1].Style.Fill.BackgroundColor.SetColor(ColorTotal);
            worksheet.Cells[FromRow, FromColumn + 1].Value = gtNhapKho;

            worksheet.Cells[FromRow, FromColumn + 2].Style.HorizontalAlignment = OfficeOpenXml.Style.ExcelHorizontalAlignment.Right;
            worksheet.Cells[FromRow, FromColumn + 2].Style.VerticalAlignment = OfficeOpenXml.Style.ExcelVerticalAlignment.Center;
            worksheet.Cells[FromRow, FromColumn + 2].Style.Font.Bold = true;
            worksheet.Cells[FromRow, FromColumn + 2].Style.Font.Size = 9;
            worksheet.Cells[FromRow, FromColumn + 2].Style.WrapText = false;
            worksheet.Cells[FromRow, FromColumn + 2].Style.Fill.PatternType = ExcelFillStyle.Solid;
            worksheet.Cells[FromRow, FromColumn + 2].Style.Fill.BackgroundColor.SetColor(ColorTotal);
            worksheet.Cells[FromRow, FromColumn + 2].Value = slXuatKho;

            worksheet.Cells[FromRow, FromColumn + 3].Style.HorizontalAlignment = OfficeOpenXml.Style.ExcelHorizontalAlignment.Right;
            worksheet.Cells[FromRow, FromColumn + 3].Style.VerticalAlignment = OfficeOpenXml.Style.ExcelVerticalAlignment.Center;
            worksheet.Cells[FromRow, FromColumn + 3].Style.Font.Bold = true;
            worksheet.Cells[FromRow, FromColumn + 3].Style.Font.Size = 9;
            worksheet.Cells[FromRow, FromColumn + 3].Style.WrapText = false;
            worksheet.Cells[FromRow, FromColumn + 3].Style.Fill.PatternType = ExcelFillStyle.Solid;
            worksheet.Cells[FromRow, FromColumn + 3].Style.Fill.BackgroundColor.SetColor(ColorTotal);
            worksheet.Cells[FromRow, FromColumn + 3].Value = gtXuatKho;

            worksheet.Cells[FromRow, FromColumn + 4].Style.HorizontalAlignment = OfficeOpenXml.Style.ExcelHorizontalAlignment.Right;
            worksheet.Cells[FromRow, FromColumn + 4].Style.VerticalAlignment = OfficeOpenXml.Style.ExcelVerticalAlignment.Center;
            worksheet.Cells[FromRow, FromColumn + 4].Style.Font.Bold = true;
            worksheet.Cells[FromRow, FromColumn + 4].Style.Font.Size = 9;
            worksheet.Cells[FromRow, FromColumn + 4].Style.WrapText = false;
            worksheet.Cells[FromRow, FromColumn + 4].Style.Fill.PatternType = ExcelFillStyle.Solid;
            worksheet.Cells[FromRow, FromColumn + 4].Style.Fill.BackgroundColor.SetColor(ColorTotal);
            worksheet.Cells[FromRow, FromColumn + 4].Value = slCuoiKy;

            worksheet.Cells[FromRow, FromColumn + 5].Style.HorizontalAlignment = OfficeOpenXml.Style.ExcelHorizontalAlignment.Right;
            worksheet.Cells[FromRow, FromColumn + 5].Style.VerticalAlignment = OfficeOpenXml.Style.ExcelVerticalAlignment.Center;
            worksheet.Cells[FromRow, FromColumn + 5].Style.Font.Bold = true;
            worksheet.Cells[FromRow, FromColumn + 5].Style.Font.Size = 9;
            worksheet.Cells[FromRow, FromColumn + 5].Style.WrapText = false;
            worksheet.Cells[FromRow, FromColumn + 5].Style.Fill.PatternType = ExcelFillStyle.Solid;
            worksheet.Cells[FromRow, FromColumn + 5].Style.Fill.BackgroundColor.SetColor(ColorTotal);
            worksheet.Cells[FromRow, FromColumn + 5].Value = gtCuoiKy;

        }


        #endregion

        private void gridControl1_Click(object sender, EventArgs e)
        {

        }
    }
}
