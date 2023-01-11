using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ActUtlTypeLib;
using DevExpress.XtraEditors;
namespace Warehouse1
{
    class ClassPlc
    {
        public static ClassPlc instance;
        public static ClassPlc Instance
        {
            get { if (instance == null) instance = new ClassPlc(); return instance; }
            private set { instance = value; }
        }

        public ClassPlc() { }

        public static  ActUtlType Plc = new ActUtlType();

        public void chayplc_uchome()
        {
            Plc.SetDevice("M201", 0);/// thanh ghi start
        }
        public void resetplc_uchome()
        {
            Plc.SetDevice("M203", 1);/// thanh ghi reset
        }
        public bool check_connect_plc()
        {
            Plc.GetDevice("M8000", out int M8);
            if (M8 == 0)
            {
                return false;  
            }
            else
            {
                return true;
            }
        }

        public void dungplc_uchome()
        {
            Plc.SetDevice("M202", 0); ;/// thanh ghi stop
        }

        public void plc_vegoc_uchome()
        {
            Plc.SetDevice("M2800", 1);// thanh ghi ve goc 
        }

        public bool check_dk_admin()
        {
            Plc.GetDevice("D296", out int value); // thanh ghi bao co khay
            if (value == 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public void hoanthanh_transfer()
        {
            Plc.SetDevice("M2025", 0);/// bit bao thuc hien xong
            Plc.SetDevice("M2024", 0);///bit bao khay ra cua
            Plc.SetDevice("M2480", 0);///bit xe day khay vao tang
            Plc.SetDevice("M2481", 0);/// bit keo khay ra xe
            Plc.SetDevice("M2378", 0);///
        }

        public void check_loaitangdi_uchome(string loai, int tang)
        {
            if (0 < tang && tang <= 27)
            {
                if (loai == "R")
                {
                    Plc.SetDevice("D1900", 82);
                }
                else
                {
                    Plc.SetDevice("D1900", 70);
                }

                Plc.SetDevice("D1901", tang);
            }
        }

        public void check_loaitangden_uchome(string loai, int tang)
        {
            if (0 < tang && tang <= 27)
            {
                if (loai == "R")
                {
                    Plc.SetDevice("D1910", 82);
                }
                else
                {
                    Plc.SetDevice("D1910", 70);
                }

                Plc.SetDevice("D1911", tang);
            }
        }

        public bool check_conn_loaitang()
        {
            Plc.GetDevice("D1900", out int d1900);
            Plc.GetDevice("D1901", out int d1901);
            Plc.GetDevice("D1910", out int d1910);
            Plc.GetDevice("D1911", out int d1911);
            Plc.GetDevice("D1850", out int d1850);
            if (d1900 * d1901 * d1910 * d1911 * d1850 == 0)
            {
                return false;
            }
            else
            {
                return true;
            }
        }
        public void exchange()
        {
            Plc.SetDevice("M2022", 1);
        }

        public bool check_chieucao_uchome()
        {
            Plc.GetDevice("D1310", out int D1310);
            if (D1310 == 1)
            {
                return false;
            }
            else return true;
        }

    }
}
