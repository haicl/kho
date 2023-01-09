using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;


namespace Warehouse1.DAO
{
    class NhapHangDAO
    {

        private static NhapHangDAO instance;
        public static NhapHangDAO Instance
        {
            get { if (instance == null) instance = new NhapHangDAO(); return instance; }
            private set { instance = value; }
        }

        private NhapHangDAO() { }

        public DataTable LoadThongTinSanPham()
        {
            string query = "SELECT * FROM dbo.DSSANPHAM ORDER BY MaSp ASC";
            DataTable result = DataProvider.Instance.ExecuteQuery(query);
            return result;
        }

        public DataTable dboDsNhapHang()
        {
            string query = "SELECT * FROM dbo.DsNhapHang";
            DataTable result = DataProvider.Instance.ExecuteQuery(query);
            return result;
        }

        public string[] prMaker(string MaSp, string TenSp)
        {
            string query = " EXEC dbo.prMaker @MaSp , @TenSp ";
            object[] parameter = new object[8];
            parameter[0] = MaSp;
            parameter[1] = TenSp;
            DataTable result = DataProvider.Instance.ExecuteQuery(query, parameter);
            string[] maker = new string[8];
            if (result.Rows.Count > 0)
            {
                maker[0] = result.Rows[0][0].ToString();
                maker[1] = result.Rows[0][1].ToString();
                maker[2] = result.Rows[0][2].ToString();
                maker[3] = result.Rows[0][3].ToString();
                maker[4] = result.Rows[0][4].ToString();
                maker[5] = result.Rows[0][5].ToString();
                maker[6] = result.Rows[0][6].ToString();
                maker[7] = result.Rows[0][7].ToString();
            }

            return maker;
        }

        public bool CheckSpTonKho(string MaSp)
        {
            bool check = false;
            string query = "dbo.prCheckSpTonKho @MaSp";
            object[] parameter = new object[1];
            parameter[0] = MaSp;
            DataTable result = DataProvider.Instance.ExecuteQuery(query, parameter);
            if (result.Rows.Count > 0)
            {
                check = true;
            }
            return check;
        }

        public DataTable dbolistR()
        {
            string query = "SELECT * FROM  CAUHINHKHAY WHERE tenKhay like 'R%' AND tinhTrangO = 0 ORDER BY sttKhay ASC , sttO ASC";
            DataTable result = DataProvider.Instance.ExecuteQuery(query);
            return result;
        }

        public DataTable dbolistF()
        {
            string query = "SELECT * FROM  CAUHINHKHAY WHERE tenKhay like 'F%' AND tinhTrangO = 0 ORDER BY sttKhay ASC , sttO ASC";
            DataTable result = DataProvider.Instance.ExecuteQuery(query);
            return result;
        }

        public DataTable dsOtrong( double m3Sp )
        {
            DataTable result = new DataTable();
            result.Columns.Add("viTriO", typeof(string));
            result.Columns.Add("m3", typeof(string));
            result.Columns.Add("slMaxNhap", typeof(string));
            result.Columns.Add("slMaxO", typeof(string));
            DataTable dataTableR = dbolistR();
            DataTable dataTableF = dbolistF();
            for (int i = 0; i < dataTableR.Rows.Count; i++)
            {
                string vitri = dataTableR.Rows[i][1].ToString();
                double cdai = Convert.ToDouble(dataTableR.Rows[i][4].ToString()) *3;
                double cRong = Convert.ToDouble(dataTableR.Rows[i][5].ToString()) *3 ;
                double cCao = Convert.ToDouble(dataTableR.Rows[i][6].ToString()) *100 ;
                double m3 = cdai *  cRong   * cCao;
                double sl = 2000;
                if (m3Sp > 0)
                {
                    sl = Math.Floor( m3 / m3Sp);
                }
                result.Rows.Add(vitri, m3.ToString(), sl.ToString(), sl.ToString());
            }

            for (int i = 0; i < dataTableF.Rows.Count; i++)
            {
                string vitri = dataTableF.Rows[i][1].ToString();
                double cdai = Convert.ToDouble(dataTableF.Rows[i][4].ToString()) * 3;
                double cRong = Convert.ToDouble(dataTableF.Rows[i][5].ToString()) * 3;
                double cCao = Convert.ToDouble(dataTableF.Rows[i][6].ToString()) * 100 ;
                double m3 = cdai * cRong * cCao;
                double sl = 2000;
                if (m3Sp >0)
                {
                    sl = Math.Floor(m3 / m3Sp);
                }
                result.Rows.Add(vitri, m3.ToString(), sl.ToString(), sl.ToString()) ;
            }

            return result;
        }

        public List<string> prTangChuaSp(string maSp)
        {
            List<string> prTangChuaSp = new List<string>();
            string query = "EXEC dbo.prTangChuaSp @MaSp";
            object[] parameter = new object[1];
            parameter[0] = maSp;
            DataTable result = DataProvider.Instance.ExecuteQuery(query, parameter);
            if (result.Rows.Count>0)
            {
                for (int i = 0; i <result.Rows.Count; i++)
                {
                    string[] tang = result.Rows[i][0].ToString().Trim().Split('-');
                    prTangChuaSp.Add(tang[0]);
                }
            }

            return prTangChuaSp;
        }

        public DataTable dsOspDaNhap(string maSp, double m3Sp)
        {
            DataTable result = new DataTable();
            result.Columns.Add("viTriO", typeof(string));
            result.Columns.Add("m3", typeof(string));
            result.Columns.Add("slMaxNhap", typeof(string));
            result.Columns.Add("slMaxO", typeof(string));

            string query1 = "EXEC dbo.prOchuaSp @MaSp";  // ô thừa đang có sản phẩm cùng loại
            object[] parameter1 = new object[1];
            parameter1[0] = maSp;
            DataTable result1 = DataProvider.Instance.ExecuteQuery(query1, parameter1);

            if (result1.Rows.Count >0)
            {
                for (int i = 0; i < result1.Rows.Count; i++)
                {
                    string vitri = result1.Rows[i][0].ToString().Trim();
                    string m3 = "M-SL";
                    string slMaxNhap = result1.Rows[i][2].ToString().Trim();
                    string slMaxO = result1.Rows[i][3].ToString().Trim();
                    result.Rows.Add(vitri , m3, slMaxNhap, slMaxO);
                }

                // lay ds cac o trong , lay ds cac o trong cung tang , add vao result

            }
            DataTable result2 = dsOtrong(m3Sp);
            List<string> TangChuaSp = prTangChuaSp(maSp);
            if (TangChuaSp.Count>0 && result2.Rows.Count>0 )
            {
                for (int i = 0; i < TangChuaSp.Count; i++)
                {
                    List<string> vsVitriRemoveAt = new List<string>(); ;
                    string tang = TangChuaSp[i];
                    for (int j = 0; j < result2.Rows.Count; j++)
                    {
                        string[] vitri = result2.Rows[j][0].ToString().Trim().Split('-');
                        if (vitri[0] == tang)
                        {
                            string vitri1 = result2.Rows[j][0].ToString().Trim();
                            string m3 = result2.Rows[j][1].ToString().Trim();
                            string slMax = result2.Rows[j][2].ToString().Trim();
                            result.Rows.Add(vitri1, m3, slMax, slMax);
                            vsVitriRemoveAt.Add(vitri1);
                           
                        }
                    }
                    if (vsVitriRemoveAt.Count>0)
                    {
                        for (int k = 0; k < vsVitriRemoveAt.Count; k++)
                        {
                            for (int L = result2.Rows.Count-1; L >=0; L--)
                            {
                                string vitri1 = result2.Rows[L][0].ToString().Trim();
                                string vitri2 = vsVitriRemoveAt[k].Trim();
                                if (vitri1== vitri2)
                                {
                                    result2.Rows.RemoveAt(L);
                                }
                            }
                            
                        }
                    }
                    vsVitriRemoveAt.Clear();
                }
            }

            if (result2.Rows.Count>0)
            {
                for (int j = 0; j < result2.Rows.Count; j++)
                {
                    string vitri1 = result2.Rows[j][0].ToString().Trim();
                    string m3 = result2.Rows[j][1].ToString().Trim();
                    string slMax = result2.Rows[j][2].ToString().Trim();
                    result.Rows.Add(vitri1, m3, slMax, slMax);
                }
                
            }
            return result;
        }

        /// <summary>
        /// [0] cdai
        /// [1] cRong
        /// [2] cCao
        /// </summary>
        /// <param name="maSp"></param>
        /// <returns></returns>
        public double ktSanPham (string maSp)
        {
            double kt = 0;

            string query = "EXEC dbo.prKtSp @maSp";
            object[] parameter = new object[1];
            parameter[0] = maSp;
            DataTable result = DataProvider.Instance.ExecuteQuery(query, parameter);
            if (result.Rows.Count>0)
            {
                double cdai = Convert.ToDouble(result.Rows[0][0].ToString())*10;
                double crong = Convert.ToDouble(result.Rows[0][1].ToString())*10;
                double ccao = Convert.ToDouble(result.Rows[0][2].ToString())*10;
                kt = cdai * crong * ccao;
            }

            return kt;
        }

        public int prInsertlistNhap(string maSp)
        {
            int stt = 0;
            string query = " EXEC dbo.prInsertlistNhap @maSp ";
            object[] parameter = new object[1];
            parameter[0] = maSp;
            stt = DataProvider.Instance.ExecuteNonQuery(query, parameter);
            return stt;
        }

        public int deletelistNhap()
        {
            int stt = 0;
            string query = " DELETE dbo.listNhap ";
            stt = DataProvider.Instance.ExecuteNonQuery(query);
            return stt;
        }

        public bool CheckSpNhap(string MaSp)
        {
            bool check = true;
            string query = "EXEC dbo.prCheckSpNhap @MaSp";
            object[] parameter = new object[1];
            parameter[0] = MaSp;
            DataTable result = DataProvider.Instance.ExecuteQuery(query, parameter);
            if (result.Rows.Count > 0)
            {
                check = false;
            }
            return check;
        }

        public int updateSoLuonglistNhap(string MaSp , int soLuong)
        {
            int stt = 0;
            string query = " EXEC dbo.prUpdateListNhap @MaSp ,   @Soluong ";
            object[] parameter = new object[2];
            parameter[0] = MaSp;
            parameter[1] = soLuong;
            stt = DataProvider.Instance.ExecuteNonQuery(query, parameter);
            return stt;
        }

        public DataTable dbolistNhap()
        {
            string query = "SELECT * FROM  dbo.listNhap";
            DataTable result = DataProvider.Instance.ExecuteQuery(query);
            return result;
        }
        //
        /// <summary>
        /// 0-tensp, 
        /// 1-Maker, 
        /// 2-DVT, 
        /// 3-Nhóm SP
        /// 4-Quy Đổi
        /// 5- tồn kho
        /// </summary>
        /// <param name="maSp"></param>
        /// <returns></returns>
        public object[] prTtSanPham(string maSp)
        {
            object[] TtSanPham = new object[6];
            string query = " EXEC dbo.prTtSanPham @MaSp ";
            object[] parameter = new object[1];
            parameter[0] = maSp;
            DataTable result = DataProvider.Instance.ExecuteQuery(query, parameter);
            TtSanPham[0] = result.Rows[0][1].ToString().Trim();
            TtSanPham[1] = result.Rows[0][3].ToString().Trim();
            TtSanPham[2] = result.Rows[0][4].ToString().Trim();
            TtSanPham[3] = result.Rows[0][2].ToString().Trim();
            TtSanPham[4] = result.Rows[0][11].ToString().Trim();
            TtSanPham[5] = result.Rows[0][10];
            return TtSanPham;
        }

        public int CheckViTriNhap(string MaSp, string VitriO)
        {
            int check = 0;
            string query = "EXEC dbo.prcheckViTri @ViTriO";
            object[] parameter = new object[1];
            parameter[0] = VitriO;
            DataTable result = DataProvider.Instance.ExecuteQuery(query, parameter);
            if (result.Rows.Count > 0)
            {
                check = 1;
                string query1 = "EXEC dbo.prTTo @ViTriO";
                object[] parameter1 = new object[1];
                parameter1[0] = VitriO;
                DataTable result1 = DataProvider.Instance.ExecuteQuery(query1, parameter1);
                if (result1.Rows.Count > 0)
                {
                    check = 2;
                    string mspO = result1.Rows[0][0].ToString().Trim();
                    if (mspO == MaSp)
                    {
                        check = 3;
                    }
                }
            }
            return check;
        }

        /// <summary>
        /// 0-- STT - int
        /// 1-- MaSp - char (25)
        /// 2-- TenSp - nvarchar(100)
        /// 3-- Maker - nvarchar(50)
        /// 4-- DonViTinh - nvarchar(10)
        /// 5-- SoLuong - int
        /// 6-- ViTriO - char (10)
        /// 7-- SoLuongMaxO - int
        /// 8-- DienGiai - ntext
        /// 9-- checkDay - bit
        /// </summary>
        /// <param name="parameter"></param>
        /// <returns></returns>
        public int prInserDsNhapHang(object[] parameter)
        {
            int stt = 0;
            string query = " EXEC dbo.prInsertDsNhapHang @STT , @MaSp , @TenSp , @Maker , @DonViTinh , @SoLuong ,  @ViTriO , @SoLuongMaxO , @DienGiai ,  @checkDay  ";
            stt = DataProvider.Instance.ExecuteNonQuery(query, parameter);
            return stt;
        }

        public int deleteDsNhapHang()
        {
            int stt = 0;
            string query = " DELETE dbo.DsNhapHang ";
            stt = DataProvider.Instance.ExecuteNonQuery(query);
            return stt;
        }


    }
}
