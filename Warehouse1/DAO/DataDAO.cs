using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;

namespace Warehouse1.DAO
{
    internal class DataDAO
    {
        private static DataDAO instance;

        public static DataDAO Instance
        {
            get { if (instance == null) instance = new DataDAO(); return instance; }
            private set { instance = value; }
        }

        private DataDAO()
        { }

        public int prUpdateSlTonDsSanPham(string msp, int sl)
        {
            int rt = -1;
            string query = " EXEC dbo.prUpdateDsSanPhamSlNhap @MaSp , @SoLuongNhap ";
            object[] parameter = new object[2];
            parameter[0] = msp;
            parameter[1] = sl;
            rt = DataProvider.Instance.ExecuteNonQuery(query, parameter);
            return rt;
        }

        /// <summary>
        /// Kiểm tra sp nhập có tồn kho không . có thì update, không thì thêm mới
        /// </summary>
        /// <param name="maSp"></param>
        /// <param name="ViTriO"></param>
        /// <returns></returns>
        public bool prCheckTonKho(string maSp, string ViTriO)
        {
            bool check = false;
            string query = "EXEC dbo.prCheckTonKho @MaSp , @ViTriO ";
            object[] parameter = new object[2];
            parameter[0] = maSp;
            parameter[1] = ViTriO;
            DataTable result = DataProvider.Instance.ExecuteQuery(query, parameter);
            if (result.Rows.Count > 0)
            {
                check = true;
            }
            return check;
        }

        public int prUpdateSlTonKhoNhap(string msp, string ViTrio, int sl)
        {
            int rt = -1;
            string query = "EXEC dbo.prUpdateSlTonKhoNhap @MaSp ,  @ViTriO  , @SoLuongNhap  ";
            object[] parameter = new object[3];
            parameter[0] = msp;
            parameter[1] = ViTrio;
            parameter[2] = sl;
            rt = DataProvider.Instance.ExecuteNonQuery(query, parameter);
            return rt;
        }

        public int prUpdateSlTonKhoXuat(string msp, string ViTrio, int sl)
        {
            int rt = -1;
            string query = "EXEC dbo.prUpdateSlTonKhoXuat @MaSp ,  @ViTriO  , @SoLuongNhap  ";
            object[] parameter = new object[3];
            parameter[0] = msp;
            parameter[1] = ViTrio;
            parameter[2] = sl;
            rt = DataProvider.Instance.ExecuteNonQuery(query, parameter);
            return rt;
        }

        public int prDeleteSlTonKho(string msp, string ViTrio)
        {
            int rt = -1;
            string query = "EXEC dbo.prDeleteTonKho @MaSp , @ViTriO   ";
            object[] parameter = new object[2];
            parameter[0] = msp;
            parameter[1] = ViTrio;
            rt = DataProvider.Instance.ExecuteNonQuery(query, parameter);
            return rt;
        }

        /// <summary>
        ///0 MaSp char(25),
        ///1 TenSp nvarchar(100),
        ///2 NhomSp nvarchar(50),
        ///3 Maker nvarchar(50),
        ///4 DonViTinh nvarchar(10),
        ///5 SoLuong int,
        ///6 ViTriO char (10),
        ///7 SoLuongMaxO int
        /// </summary>
        /// <param name="parameter"></param>
        /// <returns></returns>
        public int prINSERTTonKho(object[] parameter)
        {
            int rt = -1;
            string query = " EXEC dbo.prINSERTTonKho @MaSp , @TenSp , @NhomSp , @Maker , @DonViTinh , @SoLuong , @ViTriO , @SoLuongMaxO ";
            rt = DataProvider.Instance.ExecuteNonQuery(query, parameter);
            return rt;
        }

        /// <summary>
        /// tt= 0 Trống
        /// tt= 1 có hàng
        /// tt= 2 Đầy
        /// </summary>
        /// <param name="ViTrio"></param>
        /// <param name="TrangThai"></param>
        /// <returns></returns>
        public int prUpdateTtViTriChk(string ViTrio, int TrangThai)
        {
            int rt = -1;
            string query = " EXEC dbo.prUpdateTtViTriChk @ViTriO ,  @TrangThai  ";
            object[] parameter = new object[2];
            parameter[0] = ViTrio;
            parameter[1] = TrangThai;
            rt = DataProvider.Instance.ExecuteNonQuery(query, parameter);
            return rt;
        }

        /// <summary>
        ///0 MaSp  char(25),
        ///1 TenSp nvarchar(100),
        ///2 Maker nvarchar(50),
        ///3 TacVu nvarchar(15),
        ///4 DonViTinh nvarchar(10),
        ///5 SoLuong int,
        ///6 ViTriO char (10),
        ///7 DienGiai ntext
        /// </summary>
        /// <param name="parameter"></param>
        /// <returns></returns>
        public int prINSERTLichSu(object[] parameter)
        {
            int rt = -1;
            string query = " EXEC dbo.prINSERTLichSu @MaSp ,  @TenSp , @Maker , @TacVu , @DonViTinh , @SoLuong , @ViTriO ,  @DienGiai  ";
            rt = DataProvider.Instance.ExecuteNonQuery(query, parameter);
            return rt;
        }

        /////////////////////////////////////////////////////////////////////////////////////

        public DataTable SELECTTonKho()
        {
            string query = " SELECT * FROM dbo.TonKho ORDER BY ViTriO ASC";
            DataTable result = DataProvider.Instance.ExecuteQuery(query);
            return result;
        }

        public DataTable SELECTHistory(string date1 =null, string date2 = null)
        {
            string query = " SELECT * FROM dbo.History ORDER BY Ngay ASC ";
            if (date1 != null && date2 != null)
            {
                query = " SELECT * FROM dbo.History Where Ngay > '" + date1 + " 00:00:00'" + "and Ngay<' " + date2 + " 23:59:59' ORDER BY Ngay ASC";
            }
         
  
            DataTable result = DataProvider.Instance.ExecuteQuery(query);
            return result;
        }

        #region thêm sửa xóa dsSanPham

        /// <summary>
        /// @MaSp char(25),
        /// @TenSp nvarchar(100),
        /// @NhomSp nvarchar(50),
        /// @Maker nvarchar(50),
        /// @DonViTinh nvarchar(10),
        /// @KhoiLuong float,
        /// @Cdai float,
        /// @cRong float,
        /// @cCao float,
        /// @DonGia float,
        /// @SoLuongTon int,
        /// @QuyDoi text
        /// </summary>
        /// <param name="parameter"></param>
        /// <returns></returns>
        public int prInsertDsSanPham(object[] parameter)
        {
            int rt = -1;
            string query = " EXEC dbo.prInsertDsSanPham @MaSp ,  @TenSp , @NhomSp ,  @Maker , @DonViTinh , @KhoiLuong , @Cdai , @cRong ,  @cCao ,  @DonGia ,  @SoLuongTon , @QuyDoi";
            rt = DataProvider.Instance.ExecuteNonQuery(query, parameter);
            return rt;
        }
        /// <summary>
        /// 0 --@key  CHAR(25), 
        /// 1 --@MaSp char (25),
        /// 2 --@TenSp nvarchar(100),
        /// 3 --@Maker nvarchar(50),
        /// 4 --@DonViTinh nvarchar(10),
        /// 5 --@KhoiLuong FLOAT,
        /// 6 --@Cdai FLOAT,
        /// 7 --@cRong FLOAT,
        /// 8 --@cCao FLOAT,
        /// 9 --@DonGia FLOAT,
        /// 10--@SoLuongTon INT,
        /// 11--@QuyDoi NTEXT
        /// </summary>
        /// <param name="parameter"></param>
        /// <returns></returns>
        public int prUpdateDsSanPham(object[] parameter)
        {
            int rt = -1;
            string query = "EXEC dbo.prUpdateDsSanpham @key , @MaSp , @TenSp ,  @Maker , @DonViTinh ,  @KhoiLuong ,  @Cdai ,  @cRong , @cCao , @DonGia ,  @SoLuongTon , @QuyDoi ";
            rt = DataProvider.Instance.ExecuteNonQuery(query, parameter);
            return rt;
        }

        public bool prCheckInsertDsSanPham(string msp)
        {
            bool rt = false;
            string query = " EXEC dbo.prCheckInsertDsSanPham @MaSp  ";
            object[] parameter = new object[1];
            parameter[0] = msp;
            DataTable result = DataProvider.Instance.ExecuteQuery(query, parameter);
            if (result.Rows.Count > 0)
            {
                rt = true;
            }
            return rt;
        }

        public int prDeletetDsSanPham(string msp)
        {
            int rt = -1;
            string query = " EXEC dbo.prDeleteDssanpham @MaSp";
            object[] parameter = new object[1];
            parameter[0] = msp;
            rt = DataProvider.Instance.ExecuteNonQuery(query, parameter);
            return rt;
        }
        public bool prCheckInsertDonViTinh(string DonViTinh)
        {
            bool rt = true;
            string query = " EXEC dbo.prCheckInsertDonViTinh @DonViTinh  ";
            object[] parameter = new object[1];
            parameter[0] = DonViTinh;
            DataTable result = DataProvider.Instance.ExecuteQuery(query, parameter);
            if (result.Rows.Count > 0)
            {
                rt = false;
            }
            return rt;
        }

        public DataTable dboDONVITINH()
        {
            string query = "SELECT * FROM dbo.DONVITINH ORDER BY STT ASC";
            DataTable result = DataProvider.Instance.ExecuteQuery(query);
            return result;
        }

        #endregion thêm sửa xóa dsSanPham
    }
}