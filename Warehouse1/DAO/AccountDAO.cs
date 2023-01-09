using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Warehouse1.DAO
{
    class AccountDAO
    {

        private static AccountDAO instance;
        public static AccountDAO Instance
        {
            get { if (instance == null) instance = new AccountDAO(); return instance; }
            private set { instance = value; }
        }

        private AccountDAO() { }

        public bool Login(string userName, string passWord)
        {
            string query = "EXEC dbo.prLogin @UserName ,  @Pass";
            object[] parameter = new object[2];
            parameter[0] = userName;
            parameter[1] = passWord;
            DataTable result = DataProvider.Instance.ExecuteQuery(query,parameter);

            return result.Rows.Count > 0;
        }

        public void updateRemember(string userName, string passWord)
        {

            string query = " EXEC dbo.prUpdateRemember @UserName , @Pass ";
            object[] parameter = new object[2];
            parameter[0] = userName;
            parameter[1] = passWord;
            DataProvider.Instance.ExecuteScalar(query, parameter);

        }

        /// <summary>
        /// [0] userName
        /// [1] pass
        /// </summary>
        /// <returns></returns>
        public List<string> selectRemember()
        {
            string query = "SELECT * FROM dbo.ACCOUNT WHERE remember = 1";
            DataTable result = DataProvider.Instance.ExecuteQuery(query);
            List<string> infor = new List<string>();
            infor.Add(result.Rows[0][0].ToString().Trim());
            infor.Add(result.Rows[0][1].ToString().Trim());
            return infor;
        }
        public string userLogin(string userName, string passWord)
        {
            string query = "EXEC dbo.prUserLogin @UserName , @Pass";
            object[] parameter = new object[2];
            parameter[0] = userName;
            parameter[1] = passWord;
            DataTable table = new DataTable();
            table=DataProvider.Instance.ExecuteQuery(query, parameter);
            string userLogin = "Null";
            try
            {
                userLogin = table.Rows[0][0].ToString().Trim();
            }
            catch 
            {
                userLogin = "NoName";
            }
            
            return userLogin;
        }
    }
}

