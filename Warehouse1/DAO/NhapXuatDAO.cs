using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;

namespace Warehouse1.DAO
{
    class NhapXuatDAO
    {
        private static NhapXuatDAO instance;
        public static NhapXuatDAO Instance
        {
            get { if (instance == null) instance = new NhapXuatDAO(); return instance; }
            private set { instance = value; }
        }

        private NhapXuatDAO() { }

        ////////////////////////////////////////////////////////////////////////////////////

        public List<string> listDSTangNhapHang()
        {
            List<string> vsListTangNhapHang = new List<string>();
            List<string> vsListTangNhapHangTam = new List<string>();
            string query = "SELECT ViTriO FROM dbo.DsNhapHang";
            DataTable result = DataProvider.Instance.ExecuteQuery(query);
            if (result.Rows.Count>0)
            {
                for (int i = 0; i < result.Rows.Count; i++)
                {
                    string[] tang = result.Rows[i][0].ToString().Split('-');
                    vsListTangNhapHangTam.Add(tang[0]);
                }
                vsListTangNhapHang = vsListTangNhapHangTam.Distinct().ToList();
            }
            return vsListTangNhapHang;
        }

        public List<string> listDSTangXuatHang()
        {
            List<string> vsListTangXuatHang = new List<string>();
            List<string> vsListTangXuatHangTam = new List<string>();
            string query = "SELECT ViTriO FROM dbo.DsXuatHang";
            DataTable result = DataProvider.Instance.ExecuteQuery(query);
            if (result.Rows.Count > 0)
            {
                for (int i = 0; i < result.Rows.Count; i++)
                {
                    string[] tang = result.Rows[i][0].ToString().Split('-');
                    vsListTangXuatHangTam.Add(tang[0]);
                }
                vsListTangXuatHang = vsListTangXuatHangTam.Distinct().ToList();
            }
            return vsListTangXuatHang;
        }

        public string tangTraKhay()
        {
            string tangTraKhay = "";

            string query = "SELECT * FROM dbo.tbBackUp	ORDER BY STT ASC";
            DataTable result = DataProvider.Instance.ExecuteQuery(query);
            if (result.Rows.Count > 0)
            {
                tangTraKhay = result.Rows[result.Rows.Count - 1][2].ToString().Trim();
            }
            return tangTraKhay;
        }

        ////////////////////////////////////////////////////////////////////////////////////

        public int prdeleteDsNhapHang(int Stt ,string ViTriO)
        {
            int stt = 0;
            string query = " EXEC dbo.prdeleteDsNhapHang @Stt ,  @ViTriO ";
            object[] parameter = new object[2];
            parameter[0] = Stt;
            parameter[1] = ViTriO;
            stt = DataProvider.Instance.ExecuteNonQuery(query, parameter);
            return stt;
        }

        ////////////////////////////////////////////////////////////////////////////////////
        public int prdeleteDsXuatHang(int Stt ,string ViTriO)
        {
            int stt = 0;
            string query = "  EXEC dbo.prdeleteDsXuatHang @Stt , @ViTriO ";
            object[] parameter = new object[2];
            parameter[0] = Stt;
            parameter[1] = ViTriO;
            stt = DataProvider.Instance.ExecuteNonQuery(query, parameter);
            return stt;
        }

    ////////////////////////////////////////////////////////////////////////////////////
    public int prInsertTbBackup(string TangDi, string TangDen)
        {
            int stt = 0;
            string query = " EXEC dbo.prInsertTbBackup @TangDi ,  @TangDen ";
            object[] parameter = new object[2];
            parameter[0] = TangDi;
            parameter[1] = TangDen;
            stt = DataProvider.Instance.ExecuteNonQuery(query, parameter);
            return stt;
        }

        ////////////////////////////////////////////////////////////////////////////////////
        public int prChieuCaoKhay(string Khay)
        { 
            int ccKhay = 1;
            string query = " EXEC dbo.prChieuCaoKhay @Khay ";
            object[] parameter = new object[1];
            parameter[0] = Khay;
            DataTable result = DataProvider.Instance.ExecuteQuery(query, parameter);
            if (result.Rows.Count>0)
            {
                ccKhay = Convert.ToInt32(result.Rows[0][6]);
            }
            return ccKhay;
        }
        ////////////////////////////////////////////////////////////////////////////////////
        public int prMAXtbBackup()
        {
            int ccKhay = 0;
            string query = " SELECT MAX(STT) FROM dbo.tbBackUp ";

            DataTable result = DataProvider.Instance.ExecuteQuery(query);
            if (result.Rows.Count > 0)
            {
                try
                {
                    ccKhay = Convert.ToInt32(result.Rows[0][0]);
                }
                catch 
                {

                    ccKhay = 1;
                }
                
            }
            return ccKhay;
        }
        ////////////////////////////////////////////////////////////////////////////////////
        public int prUpdateBackUp(int STTMax)
        {
            int stt = 0;
            string query = " EXEC dbo.prUpdateBackUp @STT";
            object[] parameter = new object[1];
            parameter[0] = STTMax;
            stt = DataProvider.Instance.ExecuteNonQuery(query, parameter);
            return stt;
        }

        ////////////////////////////////////////////////////////////////////////////////////
        public bool prCheckBackUp()
        {
            bool stt = false;
            string query = " SELECT tbBackUp.TangDen, tbBackUp.TrangThai FROM dbo.tbBackUp order by  STT asc";
               
            DataTable result = DataProvider.Instance.ExecuteQuery(query);
            if (result.Rows.Count>0)
            {
                string tang = result.Rows[result.Rows.Count - 1][0].ToString().Trim();
                int tt = Convert.ToInt32(result.Rows[result.Rows.Count - 1][1].ToString().Trim());
                if (tang!="F27" && tt==1)
                {
                    stt = true;
                }
            }

            return stt;
        }
        /// <summary>
        /// 1	Nhập Hàng
        /// 2	Xuất Hàng
        /// 3	Thêm Khay
        /// 4	Xóa Khay
        /// 5	Cấu hình khay
        /// 6	Trống
        /// </summary>
        /// <param name="TrangThai"></param>
        /// <returns></returns>
        public int prUPDATETASK(string TACVU)
        {
            int stt = 0;
            string query = "  EXEC dbo.prUPDATETASK @task ";
            object[] parameter = new object[1];
            parameter[0] = TACVU;
            stt = DataProvider.Instance.ExecuteNonQuery(query, parameter);
            return stt;
        }

    }
}
