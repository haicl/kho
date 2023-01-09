using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;
using System.Threading;
using System.Data;
using System.Windows.Forms;
using OfficeOpenXml;
using OfficeOpenXml.Style;

namespace PL_NAMGUONG
{
    class C_ExportExcel
    {
        public static string _header1 = "广州汇翔国际货运代理有限公司";
        public static string _header2 = "HUIXIANG GUANGZHOU INTERNATIONAL FORWARDING CO., LTD  ";
        public static string _diaChi = "ADD：A26，Floor 28th, Southern security Building No.140 East sport road.Tianhe Area Guangzhou  Tel:020-38063110   www.hx-ep.com";
        public static string _MauBaoCao = "BÁO CÁO PHÂN LOẠI";
        public static string _Dau = "唛头：";
        public static string _SoSeri = "编号(NO#)：";
        public static string _DiaChiGiao = "địa chỉ đưa hàng 派送地址";
        public static string _Cap1 = "SHOPEE PO ID";
        public static string _Cap2 = "STT";
        public static string _Cap3 = "Số thông ";
        public static string _Cap4 = "Ngày giao hàng ";
        public static string _Cap5 = "tên hàng";
        public static string _Cap6 = "số kiện ";
        public static string _Cap7 = "Số kiện phân loại";

        private static C_ExportExcel instance;
        public static C_ExportExcel Instance
        {
            get { if (instance == null) instance = new C_ExportExcel(); return instance; }
            private set { instance = value; }
        }
        private C_ExportExcel() { }

        public void XuatFormBaocao()
        {
            using (System.Windows.Forms.SaveFileDialog saveDialog = new SaveFileDialog())
            {
                saveDialog.Filter = "Excel (Phiên bản 2007 trở lên (.xlsx)|*.xlsx";
                saveDialog.FileName = "Báo cáo phân loại ";
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
                        package.Workbook.Worksheets.Add("Báo cáo phân loại");
                        ExcelWorksheet worksheet = package.Workbook.Worksheets[1];
                        export_form_excel(worksheet);
                        try
                        {

                            exportDuLieuPL(worksheet);
                        }
                        catch
                        {

                            MessageBox.Show("Không có dữ liệu báo cáo!");
                        }


                        try
                        {
                            package.Save();
                            Thread.Sleep(1000);
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

        public void export_form_excel(ExcelWorksheet worksheet)
        {
            worksheet.Column(1).Width = 10;
            worksheet.Column(2).Width = 9;
            worksheet.Column(3).Width = 41;
            worksheet.Column(4).Width = 21;
            worksheet.Column(5).Width = 26;
            worksheet.Column(6).Width = 10;
            worksheet.Column(7).Width = 10;
            //
            worksheet.Cells.Style.Font.Name = "Times new roman";
            worksheet.Cells.Style.Font.Size = 11;
            //
            worksheet.Cells[1, 1, 1, 3].Merge = true;
            worksheet.Cells[1, 1].Style.HorizontalAlignment = OfficeOpenXml.Style.ExcelHorizontalAlignment.Left;
            worksheet.Cells[1, 1].Style.VerticalAlignment = OfficeOpenXml.Style.ExcelVerticalAlignment.Center;
            worksheet.Cells[1, 1].Value = _header1;
            worksheet.Cells[1, 1].Style.Font.Bold = false;
            worksheet.Cells[1, 1].Style.Font.Size = 11;
            worksheet.Cells[1, 1].Style.WrapText = false;
            //
            worksheet.Cells[2, 1, 2, 4].Merge = true;
            worksheet.Cells[2, 1].Style.HorizontalAlignment = OfficeOpenXml.Style.ExcelHorizontalAlignment.Left;
            worksheet.Cells[2, 1].Style.VerticalAlignment = OfficeOpenXml.Style.ExcelVerticalAlignment.Center;
            worksheet.Cells[2, 1].Value = _header2;
            worksheet.Cells[2, 1].Style.Font.Bold = false;
            worksheet.Cells[2, 1].Style.Font.Size = 11;
            worksheet.Cells[2, 1].Style.WrapText = false;

            //
            worksheet.Cells[3, 1, 3, 7].Merge = true;
            worksheet.Cells[3, 1].Style.HorizontalAlignment = OfficeOpenXml.Style.ExcelHorizontalAlignment.Left;
            worksheet.Cells[3, 1].Style.VerticalAlignment = OfficeOpenXml.Style.ExcelVerticalAlignment.Center;
            worksheet.Cells[3, 1].Value = _diaChi;
            worksheet.Cells[3, 1].Style.Font.Bold = false;
            worksheet.Cells[3, 1].Style.Font.Size = 11;
            worksheet.Cells[3, 1].Style.WrapText = false;
           
            //
            worksheet.Cells[4, 1, 5, 7].Merge = true;
            worksheet.Cells[4, 1].Style.HorizontalAlignment = OfficeOpenXml.Style.ExcelHorizontalAlignment.Center;
            worksheet.Cells[4, 1].Style.VerticalAlignment = OfficeOpenXml.Style.ExcelVerticalAlignment.Center;
            worksheet.Cells[4, 1].Value = _MauBaoCao;
            worksheet.Cells[4, 1].Style.Font.Bold = true;
            worksheet.Cells[4, 1].Style.Font.Size = 20;
            worksheet.Cells[4, 1].Style.WrapText = false;
            //
            worksheet.Cells[6, 1, 6, 3].Merge = true;
            worksheet.Cells[6, 1].Style.HorizontalAlignment = OfficeOpenXml.Style.ExcelHorizontalAlignment.Left;
            worksheet.Cells[6, 1].Style.VerticalAlignment = OfficeOpenXml.Style.ExcelVerticalAlignment.Center;
            worksheet.Cells[6, 1].Value = _Dau;
            worksheet.Cells[6, 1].Style.Font.Bold = false;
            worksheet.Cells[6, 1].Style.Font.Size = 11;
            worksheet.Cells[6, 1].Style.WrapText = false;

            //
            worksheet.Cells[6, 5, 6, 7].Merge = true;
            worksheet.Cells[6, 5].Style.HorizontalAlignment = OfficeOpenXml.Style.ExcelHorizontalAlignment.Center;
            worksheet.Cells[6, 5].Style.VerticalAlignment = OfficeOpenXml.Style.ExcelVerticalAlignment.Center;
            worksheet.Cells[6, 5].Value = _SoSeri;
            worksheet.Cells[6, 5].Style.Font.Bold = false;
            worksheet.Cells[6, 5].Style.Font.Size = 11;
            worksheet.Cells[6, 5].Style.WrapText = false;
            //
            worksheet.Cells[8, 1, 8, 7].Merge = true;
            worksheet.Cells[8, 1].Style.HorizontalAlignment = OfficeOpenXml.Style.ExcelHorizontalAlignment.Left;
            worksheet.Cells[8, 1].Style.VerticalAlignment = OfficeOpenXml.Style.ExcelVerticalAlignment.Center;
            worksheet.Cells[8, 1].Value = _DiaChiGiao;
            worksheet.Cells[8, 1].Style.Font.Bold = false;
            worksheet.Cells[8, 1].Style.Font.Size = 11;
            worksheet.Cells[8, 1].Style.WrapText = true;
            //
            worksheet.Cells[10, 1].Style.Border.BorderAround(ExcelBorderStyle.Thin);
            worksheet.Cells[10, 1].Style.Border.Right.Style = ExcelBorderStyle.Thin;
            worksheet.Cells[10, 1].Style.HorizontalAlignment = OfficeOpenXml.Style.ExcelHorizontalAlignment.Center;
            worksheet.Cells[10, 1].Style.VerticalAlignment = OfficeOpenXml.Style.ExcelVerticalAlignment.Center;
            worksheet.Cells[10, 1].Value = _Cap1;
            worksheet.Cells[10, 1].Style.Font.Bold = true;
            worksheet.Cells[10, 1].Style.Font.Size = 11;
            worksheet.Cells[10, 1].Style.WrapText = true;
            //
            worksheet.Cells[10, 2].Style.Border.BorderAround(ExcelBorderStyle.Thin);
            worksheet.Cells[10, 2].Style.Border.Right.Style = ExcelBorderStyle.Thin;
            worksheet.Cells[10, 2].Style.HorizontalAlignment = OfficeOpenXml.Style.ExcelHorizontalAlignment.Center;
            worksheet.Cells[10, 2].Style.VerticalAlignment = OfficeOpenXml.Style.ExcelVerticalAlignment.Center;
            worksheet.Cells[10, 2].Value = _Cap2;
            worksheet.Cells[10, 2].Style.Font.Bold = true;
            worksheet.Cells[10, 2].Style.Font.Size = 11;
            worksheet.Cells[10, 2].Style.WrapText = true;
            //
            worksheet.Cells[10, 3].Style.Border.BorderAround(ExcelBorderStyle.Thin);
            worksheet.Cells[10, 3].Style.Border.Right.Style = ExcelBorderStyle.Thin;
            worksheet.Cells[10, 3].Style.HorizontalAlignment = OfficeOpenXml.Style.ExcelHorizontalAlignment.Center;
            worksheet.Cells[10, 3].Style.VerticalAlignment = OfficeOpenXml.Style.ExcelVerticalAlignment.Center;
            worksheet.Cells[10, 3].Value = _Cap3;
            worksheet.Cells[10, 3].Style.Font.Bold = true;
            worksheet.Cells[10, 3].Style.Font.Size = 11;
            worksheet.Cells[10, 3].Style.WrapText = true;
            //
            worksheet.Cells[10, 4].Style.Border.BorderAround(ExcelBorderStyle.Thin);
            worksheet.Cells[10, 4].Style.Border.Right.Style = ExcelBorderStyle.Thin;
            worksheet.Cells[10, 4].Style.HorizontalAlignment = OfficeOpenXml.Style.ExcelHorizontalAlignment.Center;
            worksheet.Cells[10, 4].Style.VerticalAlignment = OfficeOpenXml.Style.ExcelVerticalAlignment.Center;
            worksheet.Cells[10, 4].Value = _Cap4;
            worksheet.Cells[10, 4].Style.Font.Bold = true;
            worksheet.Cells[10, 4].Style.Font.Size = 11;
            worksheet.Cells[10, 4].Style.WrapText = true;
            //
            worksheet.Cells[10, 5].Style.Border.BorderAround(ExcelBorderStyle.Thin);
            worksheet.Cells[10, 5].Style.Border.Right.Style = ExcelBorderStyle.Thin;
            worksheet.Cells[10, 5].Style.HorizontalAlignment = OfficeOpenXml.Style.ExcelHorizontalAlignment.Center;
            worksheet.Cells[10, 5].Style.VerticalAlignment = OfficeOpenXml.Style.ExcelVerticalAlignment.Center;
            worksheet.Cells[10, 5].Value = _Cap5;
            worksheet.Cells[10, 5].Style.Font.Bold = true;
            worksheet.Cells[10, 5].Style.Font.Size = 11;
            worksheet.Cells[10, 5].Style.WrapText = true;
            //
            worksheet.Cells[10, 6].Style.Border.BorderAround(ExcelBorderStyle.Thin);
            worksheet.Cells[10, 6].Style.Border.Right.Style = ExcelBorderStyle.Thin;
            worksheet.Cells[10, 6].Style.HorizontalAlignment = OfficeOpenXml.Style.ExcelHorizontalAlignment.Center;
            worksheet.Cells[10, 6].Style.VerticalAlignment = OfficeOpenXml.Style.ExcelVerticalAlignment.Center;
            worksheet.Cells[10, 6].Value = _Cap6;
            worksheet.Cells[10, 6].Style.Font.Bold = true;
            worksheet.Cells[10, 6].Style.Font.Size = 11;
            worksheet.Cells[10, 6].Style.WrapText = true;
            //
            worksheet.Cells[10, 7].Style.Border.BorderAround(ExcelBorderStyle.Thin);
            worksheet.Cells[10, 7].Style.Border.Right.Style = ExcelBorderStyle.Thin;
            worksheet.Cells[10, 7].Style.HorizontalAlignment = OfficeOpenXml.Style.ExcelHorizontalAlignment.Center;
            worksheet.Cells[10, 7].Style.VerticalAlignment = OfficeOpenXml.Style.ExcelVerticalAlignment.Center;
            worksheet.Cells[10, 7].Value = _Cap7;
            worksheet.Cells[10, 7].Style.Font.Bold = true;
            worksheet.Cells[10, 7].Style.Font.Size = 11;
            worksheet.Cells[10, 7].Style.WrapText = true;
            //

            //worksheet.Cells[8, 18, 9, 18].Merge = true;
            //worksheet.Cells[8, 18, 9, 18].Style.Border.BorderAround(ExcelBorderStyle.Thin);
            //worksheet.Cells[8, 18, 9, 18].Style.Border.Right.Style = ExcelBorderStyle.Thin;
            //worksheet.Cells[8, 18].Style.HorizontalAlignment = OfficeOpenXml.Style.ExcelHorizontalAlignment.Center;
            //worksheet.Cells[8, 18].Style.VerticalAlignment = OfficeOpenXml.Style.ExcelVerticalAlignment.Center;
            //worksheet.Cells[8, 18].Value = "Tổng";
            //worksheet.Cells[8, 18].Style.Font.Bold = true;
            //worksheet.Cells[8, 18].Style.Font.Size = 11;
            //worksheet.Cells[8, 18].Style.WrapText = true;
        }

        void exportDuLieuPL(ExcelWorksheet worksheet)
        {
            int i = 0;
            DataTable dataTableExcel = new DataTable();
            for ( i = 0; i < dataTableExcel.Rows.Count; i++)
            {
                string _Cap1 = dataTableExcel.Rows[i][2].ToString();
                string _Cap2 = dataTableExcel.Rows[i][0].ToString();
                string _Cap3 = dataTableExcel.Rows[i][3].ToString();
                DateTime dateTime = Convert.ToDateTime(dataTableExcel.Rows[i][5].ToString());
                string _Cap4 = dateTime.ToString("dd-MM-yyyy");
                //string[] _Cap4 = dataTableExcel.Rows[i][5].ToString().Split(' ');
                string _Cap5 = dataTableExcel.Rows[i][4].ToString();
                string _Cap6 = dataTableExcel.Rows[i][6].ToString();
                string _Cap7 = dataTableExcel.Rows[i][7].ToString();

                worksheet.Cells[i + 11, 1].Style.Border.BorderAround(ExcelBorderStyle.Thin);
                worksheet.Cells[i + 11, 1].Style.Border.Right.Style = ExcelBorderStyle.Thin;
                worksheet.Cells[i + 11, 1].Style.HorizontalAlignment = OfficeOpenXml.Style.ExcelHorizontalAlignment.Center;
                worksheet.Cells[i + 11, 1].Style.VerticalAlignment = OfficeOpenXml.Style.ExcelVerticalAlignment.Center;
                worksheet.Cells[i + 11, 1].Value = _Cap1 ;
                worksheet.Cells[i + 11, 1].Style.Font.Bold = false;
                worksheet.Cells[i + 11, 1].Style.Font.Size = 11;
                worksheet.Cells[i + 11, 1].Style.WrapText = false;

                worksheet.Cells[i + 11, 2].Style.Border.BorderAround(ExcelBorderStyle.Thin);
                worksheet.Cells[i + 11, 2].Style.Border.Right.Style = ExcelBorderStyle.Thin;
                worksheet.Cells[i + 11, 2].Style.HorizontalAlignment = OfficeOpenXml.Style.ExcelHorizontalAlignment.Center;
                worksheet.Cells[i + 11, 2].Style.VerticalAlignment = OfficeOpenXml.Style.ExcelVerticalAlignment.Center;
                worksheet.Cells[i + 11, 2].Value = _Cap2;
                worksheet.Cells[i + 11, 2].Style.Font.Bold = false;
                worksheet.Cells[i + 11, 2].Style.Font.Size = 11;
                worksheet.Cells[i + 11, 2].Style.WrapText = false;

                worksheet.Cells[i + 11, 3].Style.Border.BorderAround(ExcelBorderStyle.Thin);
                worksheet.Cells[i + 11, 3].Style.Border.Right.Style = ExcelBorderStyle.Thin;
                worksheet.Cells[i + 11, 3].Style.HorizontalAlignment = OfficeOpenXml.Style.ExcelHorizontalAlignment.Left;
                worksheet.Cells[i + 11, 3].Style.VerticalAlignment = OfficeOpenXml.Style.ExcelVerticalAlignment.Center;
                worksheet.Cells[i + 11, 3].Value = _Cap3;
                worksheet.Cells[i + 11, 3].Style.Font.Bold = false;
                worksheet.Cells[i + 11, 3].Style.Font.Size = 11;
                worksheet.Cells[i + 11, 3].Style.WrapText = false;

                worksheet.Cells[i + 11, 4].Style.Border.BorderAround(ExcelBorderStyle.Thin);
                worksheet.Cells[i + 11, 4].Style.Border.Right.Style = ExcelBorderStyle.Thin;
                worksheet.Cells[i + 11, 4].Style.HorizontalAlignment = OfficeOpenXml.Style.ExcelHorizontalAlignment.Center;
                worksheet.Cells[i + 11, 4].Style.VerticalAlignment = OfficeOpenXml.Style.ExcelVerticalAlignment.Center;
                worksheet.Cells[i + 11, 4].Value = _Cap4;
                worksheet.Cells[i + 11, 4].Style.Font.Bold = false;
                worksheet.Cells[i + 11, 4].Style.Font.Size = 11;
                worksheet.Cells[i + 11, 4].Style.WrapText = false;

                worksheet.Cells[i + 11, 5].Style.Border.BorderAround(ExcelBorderStyle.Thin);
                worksheet.Cells[i + 11, 5].Style.Border.Right.Style = ExcelBorderStyle.Thin;
                worksheet.Cells[i + 11, 5].Style.HorizontalAlignment = OfficeOpenXml.Style.ExcelHorizontalAlignment.Left;
                worksheet.Cells[i + 11, 5].Style.VerticalAlignment = OfficeOpenXml.Style.ExcelVerticalAlignment.Center;
                worksheet.Cells[i + 11, 5].Value = _Cap5;
                worksheet.Cells[i + 11, 5].Style.Font.Bold = false;
                worksheet.Cells[i + 11, 5].Style.Font.Size = 11;
                worksheet.Cells[i + 11, 5].Style.WrapText = false;

                worksheet.Cells[i + 11, 6].Style.Border.BorderAround(ExcelBorderStyle.Thin);
                worksheet.Cells[i + 11, 6].Style.Border.Right.Style = ExcelBorderStyle.Thin;
                worksheet.Cells[i + 11, 6].Style.HorizontalAlignment = OfficeOpenXml.Style.ExcelHorizontalAlignment.Right;
                worksheet.Cells[i + 11, 6].Style.VerticalAlignment = OfficeOpenXml.Style.ExcelVerticalAlignment.Center;
                worksheet.Cells[i + 11, 6].Value = _Cap6;
                worksheet.Cells[i + 11, 6].Style.Font.Bold = false;
                worksheet.Cells[i + 11, 6].Style.Font.Size = 11;
                worksheet.Cells[i + 11, 6].Style.WrapText = false;
            
                worksheet.Cells[i + 11, 7].Style.Border.BorderAround(ExcelBorderStyle.Thin);
                worksheet.Cells[i + 11, 7].Style.Border.Right.Style = ExcelBorderStyle.Thin;
                worksheet.Cells[i + 11, 7].Style.HorizontalAlignment = OfficeOpenXml.Style.ExcelHorizontalAlignment.Right;
                worksheet.Cells[i + 11, 7].Style.VerticalAlignment = OfficeOpenXml.Style.ExcelVerticalAlignment.Center;
                worksheet.Cells[i + 11, 7].Value = _Cap7;
                worksheet.Cells[i + 11, 7].Style.Font.Bold = false;
                worksheet.Cells[i + 11, 7].Style.Font.Size = 11;
                worksheet.Cells[i + 11, 7].Style.WrapText = false;
            }

            worksheet.Cells[i + 11, 1].Style.Border.BorderAround(ExcelBorderStyle.Thin);
            worksheet.Cells[i + 11, 1].Style.Border.Right.Style = ExcelBorderStyle.Thin;
            worksheet.Cells[i + 11, 1].Style.HorizontalAlignment = OfficeOpenXml.Style.ExcelHorizontalAlignment.Center;
            worksheet.Cells[i + 11, 1].Style.VerticalAlignment = OfficeOpenXml.Style.ExcelVerticalAlignment.Center;
            worksheet.Cells[i + 11, 1].Value = "Tổng: ";
            worksheet.Cells[i + 11, 1].Style.Font.Bold = true;
            worksheet.Cells[i + 11, 1].Style.Font.Size = 11;
            worksheet.Cells[i + 11, 1].Style.WrapText = false;

            worksheet.Cells[i + 11, 2].Style.Border.BorderAround(ExcelBorderStyle.Thin);
            worksheet.Cells[i + 11, 2].Style.Border.Right.Style = ExcelBorderStyle.Thin;


            worksheet.Cells[i + 11, 3].Style.Border.BorderAround(ExcelBorderStyle.Thin);
            worksheet.Cells[i + 11, 3].Style.Border.Right.Style = ExcelBorderStyle.Thin;


            worksheet.Cells[i + 11, 4].Style.Border.BorderAround(ExcelBorderStyle.Thin);
            worksheet.Cells[i + 11, 4].Style.Border.Right.Style = ExcelBorderStyle.Thin;


            worksheet.Cells[i + 11, 5].Style.Border.BorderAround(ExcelBorderStyle.Thin);
            worksheet.Cells[i + 11, 5].Style.Border.Right.Style = ExcelBorderStyle.Thin;

            worksheet.Cells[i + 11, 6].Style.Border.BorderAround(ExcelBorderStyle.Thin);
            worksheet.Cells[i + 11, 6].Style.Border.Right.Style = ExcelBorderStyle.Thin;
            worksheet.Cells[i + 11, 6].Style.HorizontalAlignment = OfficeOpenXml.Style.ExcelHorizontalAlignment.Right;
            worksheet.Cells[i + 11, 6].Style.VerticalAlignment = OfficeOpenXml.Style.ExcelVerticalAlignment.Center;
            //worksheet.Cells[i + 11, 6].Value = HomeDAO.Instance.SumSolongLenhHT().ToString() ;
            worksheet.Cells[i + 11, 6].Style.Font.Bold = true;
            worksheet.Cells[i + 11, 6].Style.Font.Size = 11;
            worksheet.Cells[i + 11, 6].Style.WrapText = false;

            worksheet.Cells[i + 11, 7].Style.Border.BorderAround(ExcelBorderStyle.Thin);
            worksheet.Cells[i + 11, 7].Style.Border.Right.Style = ExcelBorderStyle.Thin;
            worksheet.Cells[i + 11, 7].Style.HorizontalAlignment = OfficeOpenXml.Style.ExcelHorizontalAlignment.Right;
            worksheet.Cells[i + 11, 7].Style.VerticalAlignment = OfficeOpenXml.Style.ExcelVerticalAlignment.Center;
            //worksheet.Cells[i + 11, 7].Value = HomeDAO.Instance.SumSolongThucTeLenhHT().ToString();
            worksheet.Cells[i + 11, 7].Style.Font.Bold = true;
            worksheet.Cells[i + 11, 7].Style.Font.Size = 11;
            worksheet.Cells[i + 11, 7].Style.WrapText = false;
        }
    }
}
