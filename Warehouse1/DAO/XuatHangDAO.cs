using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;


namespace Warehouse1.DAO
{
    class XuatHangDAO
    {
        private static XuatHangDAO instance;
        public static XuatHangDAO Instance
        {
            get { if (instance == null) instance = new XuatHangDAO(); return instance; }
            private set { instance = value; }
        }

        private XuatHangDAO() { }

        public DataTable dboDsSanPhamXuat()
        {
            string query = "SELECT * FROM dbo.DSSANPHAM WHERE SoLuongTon > 0";
            DataTable result = DataProvider.Instance.ExecuteQuery(query);
            return result;
        }

        public DataTable DsXuatHang()
        {
            string query = "SELECT * FROM dbo.DsXuatHang";
            DataTable result = DataProvider.Instance.ExecuteQuery(query);
            return result;
        }

        public int prInsertDsXuatHang(object[] parameter)
        {
            int stt = 0;
            string query = " EXEC dbo.prInsertDsXuatHang @STT , @MaSp , @TenSp ,  @Maker ,  @DonViTinh ,  @SoLuongXuat , @ViTriO , @SoLuongTon , @DienGiai ";
            stt = DataProvider.Instance.ExecuteNonQuery(query, parameter);
            return stt;
        }

        public int deleteDsXuatHang()
        {
            int stt = 0;
            string query = " DELETE dbo.DsXuatHang  ";
            stt = DataProvider.Instance.ExecuteNonQuery(query);
            return stt;
        }

        public DataTable dbolistXuat()
        {
            string query = "SELECT * FROM dbo.listXuat";
            DataTable result = DataProvider.Instance.ExecuteQuery(query);
            return result;
        }

        public int prInsertlistXuat(string maSp)
        {
            int stt = 0;
            string query = " EXEC dbo.prInsertlistXuat @maSp ";
            object[] parameter = new object[1];
            parameter[0] = maSp;
            stt = DataProvider.Instance.ExecuteNonQuery(query, parameter);
            return stt;
        }

        public int updateSoLuonglistXuat(string MaSp, int soLuong)
        {
            int stt = 0;
            string query = "  EXEC dbo.prUpdateListXuat @MaSp , @Soluong ";
            object[] parameter = new object[2];
            parameter[0] = MaSp;
            parameter[1] = soLuong;
            stt = DataProvider.Instance.ExecuteNonQuery(query, parameter);
            return stt;
        }

        public int deletelistXuat()
        {
            int stt = 0;
            string query = "  DELETE dbo.listXuat ";
            stt = DataProvider.Instance.ExecuteNonQuery(query);
            return stt;
        }

        public bool CheckSpXuat(string MaSp)
        {
            bool check = true;
            string query = " EXEC dbo.prCheckSpXuat @MaSp ";
            object[] parameter = new object[1];
            parameter[0] = MaSp;
            DataTable result = DataProvider.Instance.ExecuteQuery(query, parameter);
            if (result.Rows.Count > 0)
            {
                check = false;
            }
            return check;
        }

        public int prSoLuongTonKho(string MaSp)
        {
            int sl = 0;
            string query = " EXEC dbo.prSoLuongTonKho @MaSp ";
            object[] parameter = new object[1];
            parameter[0] = MaSp;
            DataTable result = DataProvider.Instance.ExecuteQuery(query, parameter);
            if (result.Rows.Count>0)
            {
                sl = Convert.ToInt32(result.Rows[0][10].ToString());
            }
            return sl;
        }
        /// <summary>
        /// 5 = sl
        /// 6 = vitri
        /// </summary>
        /// <param name="MaSp"></param>
        /// <returns></returns>
        public DataTable prVitriHangTon(string MaSp)
        {
            string query = " EXEC dbo.prVitriHangTon @MaSp ";
            object[] parameter = new object[1];
            parameter[0] = MaSp;
            DataTable result = DataProvider.Instance.ExecuteQuery(query, parameter);
            return result;
        }
    }
}
