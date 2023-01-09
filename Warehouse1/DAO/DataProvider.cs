using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Warehouse1.DAO
{
    internal class DataProvider
    {
        //  Data Source=kho1-pc ;Initial Catalog=KhoIntech22;Persist Security Info=True;User ID=vip1;Password=111111  
        //  Data Source=kho1-pc;Initial Catalog=KhoIntech22;Integrated Security=True

        //  Data Source=DESKTOP-28P0JT6\MSSQLSERVER01;Initial Catalog=KhoIntech22;Integrated Security=True
        private string connectionSTR = @"Data Source=DESKTOP-28P0JT6\MSSQLSERVER01;Initial Catalog=KhoIntech22;Integrated Security=True";
        //private string connectionSTR = @"Data Source=kho1-pc;Initial Catalog=KhoIntech22;Integrated Security=True";

        private static DataProvider instance; // Ctrl + R + E

        public static DataProvider Instance
        {
            get { if (instance == null) instance = new DataProvider(); return DataProvider.instance; }
            private set { DataProvider.instance = value; }
        }

        private DataProvider()
        { }

        /// <summary>
        ///  thực thi lệnh sql
        /// </summary>
        /// <param câu lệnh truy vấn="query"></param>
        /// <param Parameter truyền vào nếu có="parameter"></param>
        /// <returns></returns>
        public DataTable ExecuteQuery(string query, object[] parameter = null)
        {
            DataTable data = new DataTable();

            using (SqlConnection connection = new SqlConnection(connectionSTR))
            {
                connection.Open();

                SqlCommand command = new SqlCommand(query, connection);

                if (parameter != null)
                {
                    string[] listPara = query.Split(' ');
                    int i = 0;
                    foreach (string item in listPara)
                    {
                        if (item.Contains('@'))
                        {
                            command.Parameters.AddWithValue(item, parameter[i]);
                            i++;
                        }
                    }
                }

                SqlDataAdapter adapter = new SqlDataAdapter(command);

                adapter.Fill(data);

                connection.Close();
            }

            return data;
        }

        public List<string> SqlDataReader(string query, object[] parameter = null)
        {
            List<string> data = new List<string>();
            using (SqlConnection connection = new SqlConnection(connectionSTR))
            {
                connection.Open();

                SqlCommand command = new SqlCommand(query, connection);

                if (parameter != null)
                {
                    string[] listPara = query.Split(' ');
                    int i = 0;
                    foreach (string item in listPara)
                    {
                        if (item.Contains('@'))
                        {
                            command.Parameters.AddWithValue(item, parameter[i]);
                            i++;
                        }
                    }
                }

                SqlDataReader reader = command.ExecuteReader();
                while (reader.Read())
                {
                    IDataRecord dataRecord = (IDataRecord)reader;
                    data.Add(dataRecord[1].ToString().Trim());
                }

                connection.Close();
            }
            return data;
        }

        /// <summary>
        /// trả về Số dòng thực thi lệnh sql
        /// </summary>
        /// <param câu lệnh truy vấn="query"></param>
        /// <param Parameter truyền vào nếu có="parameter"></param>
        /// <returns></returns>
        public int ExecuteNonQuery(string query, object[] parameter = null)
        {
            int data = 0;

            using (SqlConnection connection = new SqlConnection(connectionSTR))
            {
                connection.Open();

                SqlCommand command = new SqlCommand(query, connection);

                if (parameter != null)
                {
                    string[] listPara = query.Split(' ');
                    int i = 0;
                    foreach (string item in listPara)
                    {
                        if (item.Contains('@'))
                        {
                            command.Parameters.AddWithValue(item, parameter[i]);
                            i++;
                        }
                    }
                }

                data = command.ExecuteNonQuery();

                connection.Close();
            }

            return data;
        }

        public object ExecuteScalar(string query, object[] parameter = null)
        {
            object data = 0;

            using (SqlConnection connection = new SqlConnection(connectionSTR))
            {
                connection.Open();

                SqlCommand command = new SqlCommand(query, connection);

                if (parameter != null)
                {
                    string[] listPara = query.Split(' ');
                    int i = 0;
                    foreach (string item in listPara)
                    {
                        if (item.Contains('@'))
                        {
                            command.Parameters.AddWithValue(item, parameter[i]);
                            i++;
                        }
                    }
                }

                data = command.ExecuteScalar();

                connection.Close();
            }

            return data;
        }

        public void checkConnectSql()
        {
            using (SqlConnection connection = new SqlConnection(connectionSTR))
            {
                connection.Open();
                connection.Close();
            }
        }
    }
}