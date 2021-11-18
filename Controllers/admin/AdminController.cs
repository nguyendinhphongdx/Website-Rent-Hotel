using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace WebNCASP.Controllers.admin
{
    public class AdminController
    {
        SqlProvider sqlProvider = new SqlProvider();
        internal DataTable check_Login(string email, string password)
        {
            //create proc check_Login
            //@email nvarchar(30),@password varchar(100)
            //as
            //select* from TaiKhoan
            //where Email=email and password=@password

            string[] nameParams = new string[] { "@email", "@password" };
            Object[] values = new Object[] {email,password};
            return sqlProvider.ExecuteProc("check_Login",nameParams,values);
        }
       
    }
}