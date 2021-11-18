using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace WebNCASP.Controllers.admin
{
    public class AccountController
    {
        SqlProvider sqlProvider = new SqlProvider();
        DataTable getAccount()
        {

            //create proc show_TaiKhoan
            //as
            //select* from TaiKhoan
            return sqlProvider.ExecuteProc("show_TaiKhoan",null,null);
        }
        internal int insertAccount(string email,string pass,int loaiTK)
        {

            //create proc insert_TaiKhoan
            //@email varchar(50), @MatKhau varchar(100), @LoaiTaiKhoan int
            //as
            //insert into TaiKhoan(Email, MatKhau, MaLoaiTK)
            //values(@email, @MatKhau, @LoaiTaiKhoan);
            string[] nameParams = new string[] { "@email", "@MatKhau", "@LoaiTaiKhoan" };
            Object[] values = new object[] {email,pass,loaiTK };
            return sqlProvider.ExecuteNonProc("insert_TaiKhoan",nameParams,values);
        }
    }
}