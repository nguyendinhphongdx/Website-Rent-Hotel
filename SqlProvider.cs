using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace WebNCASP
{
    public class SqlProvider
    {
        public string CnnString = ConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString;
        // string query = "slect * from tblTaikHON Where email=@ and matkhat=@",
        // object[] values = new object[]{"email@gmail.com","123"};
        // => datatable select
        public DataTable ExecuteQuery(string query, Object[] parameters = null)
        {
            DataTable data = new DataTable();
            using (SqlConnection cnn = new SqlConnection(CnnString))
            {
                cnn.Open();
                SqlCommand cmd = new SqlCommand(query, cnn);
                if (parameters != null)
                {
                    string[] listpara = query.Split(' ');
                    int i = 0;
                    foreach (string item in listpara)
                    {
                        if (item.Contains('@'))
                        {
                            cmd.Parameters.AddWithValue(item, parameters[i]);
                            i++;
                        }
                    }
                }

                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                adapter.Fill(data);
                cnn.Close();
            }
            return data;
        }

        // string query = "update from tblTaikHON set matkhau=123 where ádsda",
        // object[] values = new object[]{"email@gmail.
        // => datatable delete, update
        public int ExecuteNonQuery(string query, Object[] parameters = null)
        {
            int data = 0;
            using (SqlConnection cnn = new SqlConnection(CnnString))
            {
                cnn.Open();
                SqlCommand cmd = new SqlCommand(query, cnn);
                if (parameters != null)
                {
                    string[] listpara = query.Split(' ');
                    int i = 0;
                    foreach (string item in listpara)
                    {
                        if (item.Contains('@'))
                        {
                            cmd.Parameters.AddWithValue(item, parameters[i]);
                            i++;
                        }
                    }
                }
                data = cmd.ExecuteNonQuery();
                cnn.Close();
            }
            return data;
        }

        // select count(*) from TaiKhoan
        // convêrt.toin32(Object)
        public Object ExecuteScalar(string query, Object[] parameters = null)
        {
            Object data = 0;
            using (SqlConnection cnn = new SqlConnection(CnnString))
            {
                cnn.Open();
                SqlCommand cmd = new SqlCommand(query, cnn);
                if (parameters != null)
                {
                    string[] listpara = query.Split(' ');
                    int i = 0;
                    foreach (string item in listpara)
                    {
                        if (item.Contains('@'))
                        {
                            cmd.Parameters.AddWithValue(item, parameters[i]);
                            i++;
                        }
                    }
                }
                data = cmd.ExecuteScalar();
                cnn.Close();
            }
            return data;
        }
        //create proc delete_DanhGia_Phong
        //@MaPhong int, @MaTaiKhoan int 1,2
        //as
        //delete DanhGia_Phong
        //where MaPhong = @MaPhong and MaTaiKhoan = @MaTaiKhoan
        //go
        // string[] parameterNames = new string[]{"@MaPhong","@MaTaiKhoan"};
        // object[] parameters = new object[]{1,2};
        // datatable = ExecuteProc("delete_DanhGia_Phong",parameterNames,parameters)
        public DataTable ExecuteProc(string nameProc, String[] parameterNames = null, Object[] parameters = null)
        {
            DataTable data = new DataTable();
            using (SqlConnection cnn = new SqlConnection(CnnString))
            {
                cnn.Open();
                SqlCommand cmd = new SqlCommand(nameProc, cnn);
                if (parameters != null && parameterNames != null && parameters.Length == parameterNames.Length)
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    int i = 0;
                    foreach (string item in parameterNames)
                    {
                        cmd.Parameters.AddWithValue(parameterNames[i], parameters[i]);
                        i++;
                    }

                }
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                adapter.Fill(data);
                cnn.Close();
            }
            return data;
        }
        //create proc delete_DanhGia_Phong
        //@MaPhong int, @MaTaiKhoan int 1,2
        //as
        //delete DanhGia_Phong
        //where MaPhong = @MaPhong and MaTaiKhoan = @MaTaiKhoan
        //go
        // string[] parameterNames = new string[]{"@MaPhong","@MaTaiKhoan"};
        // object[] parameters = new object[]{1,2};
        // datatable = ExecuteProc("delete_DanhGia_Phong",parameterNames,parameters)
        public int ExecuteNonProc(string nameProc, String[] parameterNames = null, Object[] parameters = null)
        {
            int data = 0;
            using (SqlConnection cnn = new SqlConnection(CnnString))
            {
                cnn.Open();
                SqlCommand cmd = new SqlCommand(nameProc, cnn);
                if (parameters != null && parameterNames != null && parameters.Length == parameterNames.Length)
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    int i = 0;
                    foreach (string item in parameterNames)
                    {
                        cmd.Parameters.AddWithValue(parameterNames[i], parameters[i]);
                        i++;
                    }
                }
                data = cmd.ExecuteNonQuery();
                cnn.Close();
            }
            return data;
        }
    }
}