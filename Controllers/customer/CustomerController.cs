using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using WebNCASP.Models;
using WebNCASP.Models.Customer;

namespace WebNCASP.Controllers.customer
{
    public class CustomerController
    {
        Converter converter = new Converter();
        SqlProvider provider = new SqlProvider();
        public DataTable Login(string email, string password)
        {
            //create proc check_Login
            // @email nvarchar(30),@password varchar(100)
            //as
            //select* from TaiKhoan
            //where Email = @email and MatKhau = @password
            //go
            string nameProc = "check_Login";
            string[] paramsName = new string[] { "@email", "@password" };
            object[] paramsValue = new object[] { email, password };
            return provider.ExecuteProc(nameProc, paramsName, paramsValue);
        }
        public CustomerModel GetKhachHangInFo(int MaTk)
        {
            //create proc show_KhachHang_By_ID_TaiKhoan @Matk int
            //as
            //begin
            //    select* from KhachHang where MaTaiKhoan = @Matk
            //end
            //go
            string nameProc = "show_KhachHang_By_ID_TaiKhoan";
            string[] paramsName = new string[] { "@Matk" };
            object[] paramsValue = new object[] { MaTk };
            DataTable result =  provider.ExecuteProc(nameProc, paramsName, paramsValue);
            if (result.Rows.Count >0)
            {
                return converter.GetCustomerInRow(result.Rows[0]);
            }
            else
            {
                return null;
            }
        }
        public bool SignUp(CustomerModel customer, AccountModel account)
        {
            //ALTER proc[dbo].[Sign_up]
            //        @Email nvarchar(30), @MatKhau varchar(100),
            //@HoTenKH nvarchar(50), @SDT varchar(10),
            //@CMND varchar(12)
            //as
            //begin
            //    insert TaiKhoan(TenTaiKhoan, MatKhau, MaLoaiTK)
            //    values(@TenTK, @MatKhau,2);
            //        declare @MaTK int
            //        set @MaTK=(select MaTaiKhoan from TaiKhoan where MatKhau=@MatKhau and Email=@TenTK)
            // insert into KhachHang(TenKhachHang, SoDienThoai, CMND, MaTaiKhoan)
            //    values(@TenTK, @SDT, @CMND, @MaTK)
            //end;
            string nameProc = "Sign_up";
            string[] paramsName = new string[] { "@Email", "@MatKhau", "@HoTenKH", "@SDT", "@CMND" };
            object[] paramsValue = new object[] { account.Email, account.MatKhau, customer.TenKhachHang, customer.SoDienThoai, customer.CMND };
            int result =  provider.ExecuteNonProc(nameProc, paramsName, paramsValue);
            if (result > 0) return true;
            return false;
        }
    }

}