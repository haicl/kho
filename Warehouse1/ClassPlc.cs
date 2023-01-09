using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ActUtlTypeLib;
namespace Warehouse1
{
    class ClassPlc
    {
        private static ClassPlc instance;
        public static ClassPlc Instance
        {
            get { if (instance == null) instance = new ClassPlc(); return instance; }
            private set { instance = value; }
        }

        private ClassPlc() { }

        public static  ActUtlType Plc = new ActUtlType();

        public void chayplc_uchome()
        {
            ClassPlc.Plc.SetDevice("M201", 0);
        }

    }
}
