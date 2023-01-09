using F_Khay;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Warehouse1.DAO
{
    class DAO_Khay
    {
        private static DAO_Khay instance;
        public static DAO_Khay Instance
        {
            get { if (instance == null) instance = new DAO_Khay(); return DAO_Khay.instance; }
            private set { DAO_Khay.instance = value; }
        }

        private DAO_Khay() { }

        /*----------------------------------*-
         *          CAU HINH KHAY           *
        -*----------------------------------*/
        public void insertCAUHINHKHAY(object[] prameter)    // Thêm cấu hình 1 ô vào bảng
        {
            string query = "EXEC dbo.prInsertCAUHINHKHAY @tenKhay , @ViTriO , @locationX , @locationY , @width , @height , @chieuCao , @tinhTrangO , @sttKhay , @sttVitri ";
            DataProvider.Instance.ExecuteNonQuery(query, prameter);
        }

        public void deleteCAUHINHKHAY(string nameKhay)     // Xóa cấu hình 1 khay
        {
            string query = "DELETE FROM dbo.CAUHINHKHAY WHERE tenKhay = '" + nameKhay + "'";
            DataProvider.Instance.ExecuteNonQuery(query);
        }

        public DataTable selectCAUHINHKHAY(string nameKhay)   // Lọc cấu hình khay theo tên -> Hiển thị
        {
            string query = "SELECT * FROM dbo.CAUHINHKHAY WHERE tenKhay = '" + nameKhay + "'";
            return DataProvider.Instance.ExecuteQuery(query);
        }

        /*------------------------------*-
         *          LIST KHAY           *
        -*------------------------------*/
        public DataTable emptyKhay()   // Lấy khay chưa sử dụng
        {
            DataTable emptyKhay;
            string query = "SELECT TenKhay FROM dbo.LISTKHAY WHERE State = 0";
            emptyKhay = DataProvider.Instance.ExecuteQuery(query);

            return emptyKhay;                                                   
        }

        public DataTable useKhay()
        {
            DataTable useKhay;
            string query = "SELECT TenKhay FROM dbo.LISTKHAY WHERE State = 2";
            useKhay = DataProvider.Instance.ExecuteQuery(query);

            return useKhay;
        }

        public void lockKhay(string tenKhay)   // Khóa khay phía trên khay sử dụng
        {
            string tenKhayLock = tenKhay.Substring(0, 1) + (Convert.ToInt32(tenKhay.Substring(1)) + 1).ToString();
            string query = "UPDATE dbo.LISTKHAY SET State = 1 WHERE TenKhay = '" + tenKhayLock + "' AND State != 2";
            DataProvider.Instance.ExecuteNonQuery(query);
        }
        public void unLockKhay(string tenKhay)   // Khóa khay phía trên khay sử dụng
        {
            string tenKhayLock = tenKhay.Substring(0, 1) + (Convert.ToInt32(tenKhay.Substring(1)) + 1).ToString();
            string query = "UPDATE dbo.LISTKHAY SET State = 0 WHERE TenKhay = '" + tenKhayLock + "' AND State != 2";
            DataProvider.Instance.ExecuteNonQuery(query);
        }

        public void updateLISTKHAY(object[] prameter)   // Update List Khay
        {
            string query = "EXEC dbo.prUpdateLISTKHAY @TenKhay , @State , @W_Min , @H_Min ";
            DataProvider.Instance.ExecuteNonQuery(query, prameter);
        }

        public DataTable defaultCellLISTKHAY(string nameKhay)   // Lấy kích thước ô mặc định 
        {
            string query = "SELECT W_Min, H_Min FROM dbo.LISTKHAY WHERE TenKhay = '" + nameKhay + "'";
            return DataProvider.Instance.ExecuteQuery(query);
        }

        /*--------------------------*-
         *          TON KHO         *
        -*--------------------------*/
        public void updateTONKHO(string[] prameter)
        {
            string query = "EXEC dbo.prUpdateTONKHO @ViTri_Old , @ViTri_New ";
            DataProvider.Instance.ExecuteNonQuery(query, prameter);
        }
        public DataTable checkTONKHO(string ViTriO)
        {
            string query = "SELECT * FROM dbo.TonKho WHERE ViTriO = '"+ ViTriO + "'";
            return DataProvider.Instance.ExecuteQuery(query);
        }


        /// <summary>
        /// //////////////////////////////////////////////////////
        /// </summary>
        /// <returns></returns>
        /*------------------------------*-
         *          DsNhapHang          *
        -*------------------------------*/
        public DataTable selectionDsNhapHang()
        {
            string query = "SELECT ViTriO FROM dbo.DsNhapHang";
            return DataProvider.Instance.ExecuteQuery(query);
        }

        public DataTable selectDsNhapHang(string Khay)
        {
            string query = "SELECT * FROM dbo.DsNhapHang";
            DataTable table = DataProvider.Instance.ExecuteQuery(query);
            if (table.Rows.Count > 0)
            {
                for (int i = table.Rows.Count - 1; i >= 0; i--)
                {
                    string[] vs = table.Rows[i][6].ToString().Split('-');
                    if (vs[0] != Khay)
                    {
                        table.Rows.RemoveAt(i);
                    }
                }
            }
            return table;
        }
        /// <summary>
        /// //////////////////////////////////////////////////////
        /// </summary>
        /// <returns></returns>
        /*------------------------------*-
         *          DsXuatHang          *
        -*------------------------------*/
        public DataTable selectionDsXuatHang()
        {
            string query = "SELECT ViTriO  FROM dbo.DsXuatHang";
            return DataProvider.Instance.ExecuteQuery(query);
        }

        public DataTable selectDsXuatHang(string Khay)
        {
            string query = "SELECT * FROM dbo.DsXuatHang";
            DataTable table = DataProvider.Instance.ExecuteQuery(query);
            if (table.Rows.Count > 0)
            {
                for (int i = table.Rows.Count - 1; i >= 0; i--)
                {
                    string[] vs = table.Rows[i][6].ToString().Split('-');
                    if (vs[0] != Khay)
                    {
                        table.Rows.RemoveAt(i);
                    }
                }
            }
            return table;
        }

        /**********************************************************************************************************/
        /// <summary>
        /// //////////////////////////////////////////////////////
        /// </summary>
        /// <returns></returns>
        /*------------------------------*-
         *          Thông tin khay          *
        -*------------------------------*/

        public DataTable selectThongTinKhay(string Khay)
        {
            string query = "SELECT * FROM dbo.TonKho WHERE ViTriO LIKE '"+ Khay + "-%' ";
            DataTable table = DataProvider.Instance.ExecuteQuery(query);
            return table;
        }

        /**********************************************************************************************************/

        /*--------------------------*-
         *          TACVU           *
        -*--------------------------*/
        public string selectTASK()
        {
            string query = "SELECT * FROM dbo.TASK";
            return DataProvider.Instance.ExecuteQuery(query).Rows[0][1].ToString().Trim();
        }

        /**********************************************************************************************************/
        /// <summary>
        /// //////////////////////////////////////////////////////
        /// </summary>
        /// <returns></returns>
        /*------------------------------*-
         *          soLuongKhay          *
        -*------------------------------*/

        public DataTable soLuongKhay()
        {
            string query = "SELECT DISTINCT [CAUHINHKHAY].tenKhay FROM [CAUHINHKHAY]";
            DataTable table = DataProvider.Instance.ExecuteQuery(query);
            return table;
        }
        /**********************************************************************************************************/
        /// <summary>
        /// //////////////////////////////////////////////////////
        /// </summary>
        /// <returns></returns>
        /*------------------------------*-
         *          soLuongMatHang          *
        -*------------------------------*/

        public int soLuongMatHang()
        {
            int sl = 0;
            string query = "SELECT count([DSSANPHAM].MaSp) FROM [DSSANPHAM] where [DSSANPHAM].[SoLuongTon] > 0";
            DataTable table = DataProvider.Instance.ExecuteQuery(query);
            if (table.Rows.Count>0)
            {
                sl = Convert.ToInt32(table.Rows[0][0]);
            }
            return sl;
        }

        /**********************************************************************************************************/
        /// <summary>
        /// //////////////////////////////////////////////////////
        /// </summary>
        /// <returns></returns>
        /*------------------------------*-
         *          giaTriKho          *
        -*------------------------------*/

        public double giaTriKho()
        {
            double sl = 0;
            string query = "SELECT sum([DSSANPHAM].[SoLuongTon] *[DSSANPHAM].DonGia ) FROM [DSSANPHAM] where [DSSANPHAM].[SoLuongTon] > 0";
            DataTable table = DataProvider.Instance.ExecuteQuery(query);
            if (table.Rows.Count > 0)
            {
                sl = Convert.ToDouble(table.Rows[0][0]);
            }
            return sl;
        }


        /**********************************************************************************************************/
        /// <summary>
        /// //////////////////////////////////////////////////////
        /// </summary>
        /// <returns></returns>
        /*------------------------------*-
         *          slOtrong          *
        -*------------------------------*/

        public double slOtrong()
        {
            double sl = 0;
            string query = "SELECT count(tinhTrangO) FROM [CAUHINHKHAY] where tinhTrangO = 0";
            DataTable table = DataProvider.Instance.ExecuteQuery(query);
            if (table.Rows.Count > 0)
            {
                sl = Convert.ToDouble(table.Rows[0][0]);
            }
            return sl;
        }

        /**********************************************************************************************************/
        /// <summary>
        /// //////////////////////////////////////////////////////
        /// </summary>
        /// <returns></returns>
        /*------------------------------*-
         *          slOtrong          *
        -*------------------------------*/

        public double slOdaDung()
        {
            double sl = 0;
            string query = "SELECT count(tinhTrangO) FROM [CAUHINHKHAY] where tinhTrangO = 1";
            DataTable table = DataProvider.Instance.ExecuteQuery(query);
            if (table.Rows.Count > 0)
            {
                sl = Convert.ToDouble(table.Rows[0][0]);
            }
            return sl;
        }
        /**********************************************************************************************************/
        /// <summary>
        /// //////////////////////////////////////////////////////
        /// </summary>
        /// <returns></returns>
        /*------------------------------*-
         *          slOtrong          *
        -*------------------------------*/

        public double slOday()
        {
            double sl = 0;
            string query = "SELECT count(tinhTrangO) FROM [CAUHINHKHAY] where tinhTrangO = 2";
            DataTable table = DataProvider.Instance.ExecuteQuery(query);
            if (table.Rows.Count > 0)
            {
                sl = Convert.ToDouble(table.Rows[0][0]);
            }
            return sl;
        }
    }
}
