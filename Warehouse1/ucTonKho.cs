using DevExpress.Export;
using DevExpress.XtraPrinting;
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
using DevExpress.XtraReports.UI;
using Warehouse1.DAO;
using DevExpress.Printing.ExportHelpers;
using DevExpress.Export.Xl;

namespace Warehouse1
{
    public partial class ucTonKho : UserControl
    {
        public ucTonKho()
        {
            InitializeComponent();
        }
        private void ucTonKho_Load(object sender, EventArgs e)
        {
            DataTable dataTable = DataDAO.Instance.SELECTTonKho();
            gridControl1.DataSource = dataTable;

           
        }
        private void button1_Click(object sender, EventArgs e)
        {
            DataTable dataTable = DataDAO.Instance.SELECTTonKho();
            gridControl1.DataSource = dataTable;
        }

        private void button3_Click(object sender, EventArgs e)
        {  
            using (System.Windows.Forms.SaveFileDialog saveDialog = new SaveFileDialog())
            {
                saveDialog.Filter = "Excel (Phiên bản 2007 trở lên (.xlsx)|*.xlsx";
                saveDialog.FileName = "Tồn Kho";
                if (saveDialog.ShowDialog() != DialogResult.Cancel)
                {
                    string exportFilePath = saveDialog.FileName;

                    try
                    {

                        ExportSettings.DefaultExportType = ExportType.WYSIWYG;
                        XlsxExportOptionsEx options = new XlsxExportOptionsEx();
                        options.SuppressMaxRowsWarning = true;
                        options.SuppressMaxColumnsWarning = true;
                        options.SheetName = "Tồn Kho";

   
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

        private void gridControl1_Click(object sender, EventArgs e)
        {

        }


    }
}
