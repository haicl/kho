using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Warehouse1.DAO;

namespace Warehouse1.DAO
{
    class DAO_MoPhong
    {
        private static DAO_MoPhong instance;
        public static DAO_MoPhong Instance
        {
            get { if (instance == null) instance = new DAO_MoPhong(); return DAO_MoPhong.instance; }
            private set { DAO_MoPhong.instance = value; }
        }

        private DAO_MoPhong() { }

        public DataTable selectionKhay()
        {
            string query = "SELECT TenKhay, State FROM dbo.LISTKHAY";
            return DataProvider.Instance.ExecuteQuery(query);
        }
    }
}
