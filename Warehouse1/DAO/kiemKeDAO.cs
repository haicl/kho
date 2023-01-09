using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;

namespace Warehouse1.DAO
{
    class kiemKeDAO
    {
        private static kiemKeDAO instance;
        public static kiemKeDAO Instance
        {
            get { if (instance == null) instance = new kiemKeDAO(); return instance; }
            private set { instance = value; }
        }

        private kiemKeDAO() { }

        public DataTable DsNXT(string date1, string date2 )
        {
            DataTable dataTable = new DataTable();
            dataTable.Columns.Add("MaSp",typeof(string));
            dataTable.Columns.Add("TenSp", typeof(string));
            dataTable.Columns.Add("DVT", typeof(string));
            dataTable.Columns.Add("DonGia", typeof(Int32));
            dataTable.Columns.Add("slDauKy", typeof(Int32));
            dataTable.Columns.Add("gtDauKy", typeof(Int32));
            dataTable.Columns.Add("slNhapKho", typeof(Int32));
            dataTable.Columns.Add("gtNhapKho", typeof(Int32));
            dataTable.Columns.Add("slXuatKho", typeof(Int32));
            dataTable.Columns.Add("gtXuatKho", typeof(Int32));
            dataTable.Columns.Add("slCuoiKy", typeof(Int32));
            dataTable.Columns.Add("gtCuoiKy", typeof(Int32));
            List<string> vsListTangNhapHang = new List<string>();
            string query = "EXEC dbo.prDsNxt @date1 ,  @date2 ";
            object[] parameter = new object[2];
            parameter[0] = date1;
            parameter[1] = date2;
            DataTable result = DataProvider.Instance.ExecuteQuery(query, parameter);
            if (result.Rows.Count > 0)
            {
                for (int i = 0; i < result.Rows.Count; i++)
                {
                    string MaSp = result.Rows[i][0].ToString().Trim();
                    double donGia = 0;
                    try
                    {
                        donGia = Convert.ToDouble(result.Rows[i][3].ToString().Trim());
                    }
                    catch 
                    {
                        donGia = 0;

                    }
                    double[] sl = prSlNXT(date1, date2, MaSp);

                    dataTable.Rows.Add(MaSp, // msp
                                        result.Rows[i][1].ToString().Trim(), // ten sp
                                        result.Rows[i][2].ToString().Trim(), // dvt
                                        donGia, // don gia
                                        sl[0], // sl dau ky
                                        sl[0] * donGia, // gia tri dau ky
                                        sl[1], // sl nhap kho
                                        sl[1] * donGia,
                                        sl[2], // sl xuat kho
                                        sl[2] * donGia,
                                        sl[3], // sl cuoi ky
                                        sl[3] * donGia
                                        );
                }
                 
            }
            return dataTable;
        }

        public double[] prSlNXT(string date1, string date2, string MaSp)
        {
            double[] sl = new double[4];
            string query = " EXEC dbo.prSlNXT @date1 ,  @date2 ,  @MaSp";
            object[] parameter = new object[3];
            parameter[0] = date1;
            parameter[1] = date2;
            parameter[2] = MaSp;
            DataTable result = DataProvider.Instance.ExecuteQuery(query, parameter);
            if (result.Rows.Count > 0)
            {
                try
                {
                    sl[0] = Convert.ToDouble(result.Rows[0][0].ToString().Trim());
                }
                catch
                {

                    sl[0] = 0;
                }
                try
                {
                    sl[1] = Convert.ToDouble(result.Rows[0][1].ToString().Trim());
                }
                catch
                {

                    sl[1] = 0;
                }
                try
                {
                    sl[2] = Convert.ToDouble(result.Rows[0][2].ToString().Trim());
                }
                catch
                {

                    sl[2] = 0;
                }
                try
                {
                    sl[3] = Convert.ToDouble(result.Rows[0][3].ToString().Trim());
                }
                catch
                {

                    sl[3] = 0;
                }


            }
            return sl;

        }

        public string minDateHisstory()
        {
            string dateMin = DateTime.Now.Date.ToString("yyyy-MM-dd");

            string query = " SELECT MIN(dbo.History.Ngay) FROM dbo.History";
            DataTable result = DataProvider.Instance.ExecuteQuery(query);
            if (result.Rows.Count > 0)
            {
                DateTime date = Convert.ToDateTime(result.Rows[0][0].ToString().Trim());
                dateMin = date.ToString("yyyy-MM-dd");
            }
            return dateMin;
        }
        public string maxDateHisstory()
        {
            string dateMax = DateTime.Now.Date.ToString("yyyy-MM-dd");

            string query = " SELECT MAX(dbo.History.Ngay) FROM dbo.History";
            DataTable result = DataProvider.Instance.ExecuteQuery(query);
            if (result.Rows.Count > 0)
            {
                DateTime date = Convert.ToDateTime(result.Rows[0][0].ToString().Trim());
                dateMax = date.ToString("yyyy-MM-dd");
            }
            return dateMax;
        }

        public DataTable DsSoChoTie(string date1, string date2 , string MaSp)
        {
            DataTable dataTable = new DataTable();
            dataTable.Columns.Add("Ngay", typeof(DateTime));
            dataTable.Columns.Add("MaSp", typeof(string));
            dataTable.Columns.Add("TenSp", typeof(string));
            dataTable.Columns.Add("DienGiai", typeof(string));
            dataTable.Columns.Add("DVT", typeof(string));
            dataTable.Columns.Add("DonGia", typeof(Int32));
            dataTable.Columns.Add("slNhapKho", typeof(Int32));
            dataTable.Columns.Add("gtNhapKho", typeof(Int32));
            dataTable.Columns.Add("slXuatKho", typeof(Int32));
            dataTable.Columns.Add("gtXuatKho", typeof(Int32));
            dataTable.Columns.Add("slCuoiKy", typeof(Int32));
            dataTable.Columns.Add("gtCuoiKy", typeof(Int32));

            string query = "EXEC dbo.prDsSoChiTiet @date1 , @date2 ,  @MaSp ";
            object[] parameter = new object[3];
            parameter[0] = date1;
            parameter[1] = date2;
            parameter[2] = MaSp;
            DataTable result = DataProvider.Instance.ExecuteQuery(query, parameter);
            if (result.Rows.Count > 0)
            {
                for (int i = 0; i < result.Rows.Count; i++)
                {
                    string date = result.Rows[i][0].ToString().Trim();
                    string MaSp1 = result.Rows[i][1].ToString().Trim();
                    string TacVu = result.Rows[i][3].ToString().Trim();
                    double donGia = 0;
                    
                    try
                    {
                        donGia = Convert.ToDouble(result.Rows[i][4].ToString().Trim());
                    }
                    catch
                    {
                        donGia = 0;

                    }
                    string DienGiai = result.Rows[i][5].ToString().Trim();
                    double STT = 0;
                    try
                    {
                        STT = Convert.ToDouble(result.Rows[i][6].ToString().Trim());
                    }
                    catch
                    {
                        STT = 0;

                    }
                    double[] sl = prSlSochitiet(date, MaSp1, TacVu, STT);

                    dataTable.Rows.Add(date,
                                        MaSp1, // msp
                                        result.Rows[i][1].ToString().Trim(), // ten sp
                                        DienGiai,
                                        result.Rows[i][7].ToString().Trim(), // dvt
                                        donGia, // don gia
                                        sl[0], // sl dau ky
                                        sl[0] * donGia, // gia tri dau ky
                                        sl[1], // sl nhap kho
                                        sl[1] * donGia,
                                        sl[2], // sl xuat kho
                                        sl[2] * donGia
                                        );
                }

            }
            return dataTable;
        }

        public double[] prSlSochitiet(string date, string Masp, string TacVu, double STT)
        {
            double[] sl = new double[3];
            string query = " EXEC dbo.prSlSochitiet @date1 ,  @MaSp , @TacVu , @STT";
            object[] parameter = new object[4];
            try
            {
                parameter[0] = Convert.ToDateTime(date);
            }
            catch
            {

                parameter[0] = DateTime.Now;

            }
           
            parameter[1] = Masp;
            parameter[2] = TacVu;
            parameter[3] = STT;
            DataTable result = DataProvider.Instance.ExecuteQuery(query, parameter);
            if (result.Rows.Count > 0)
            {
                try
                {
                    sl[0] = Convert.ToDouble(result.Rows[0][0].ToString().Trim());
                }
                catch
                {

                    sl[0] = 0;
                }
                try
                {
                    sl[1] = Convert.ToDouble(result.Rows[0][1].ToString().Trim());
                }
                catch
                {

                    sl[1] = 0;
                }
                try
                {
                    sl[2] = Convert.ToDouble(result.Rows[0][2].ToString().Trim());
                }
                catch
                {

                    sl[2] = 0;
                }

            }
            return sl;

        }

    }
}
