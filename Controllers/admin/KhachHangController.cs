using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace WebNCASP.Controllers.admin
{
    public class KhachHangController
    {
        SqlProvider sqlProvider = new SqlProvider();
        internal DataTable getKhachHang()
        {
            //create proc show_KhachHang_TaiKhoan
            //as
            //select MaKhachHang,TenKhachHang,SoDienThoai,KhachHang.Email as Email,CMND,TaiKhoan.MaTaiKhoan as MaTaiKhoan,MatKhau from KhachHang, TaiKhoan
            //where KhachHang.MaTaiKhoan = TaiKhoan.MaTaiKhoan;
            return sqlProvider.ExecuteProc("show_KhachHang_TaiKhoan", null, null);
        }
        internal DataTable getKhachHang_MaKH(int maKH)
        {
            //            create proc show_KhachHang_MaKH
            //@MaKH int
            //as
            //select MaKhachHang,TenKhachHang,SoDienThoai,KhachHang.Email as Email,CMND,TaiKhoan.MaTaiKhoan as MaTaiKhoan from KhachHang, TaiKhoan
            //where KhachHang.MaTaiKhoan = TaiKhoan.MaTaiKhoan and MaLoaiTK = 2 and MaKhachHang = @MaKH
            string[] nameParams = new string[] { "@MaKH" };
            Object[] values = new object[] { maKH };
            return sqlProvider.ExecuteProc("show_KhachHang_MaKH", nameParams, values);

        }
        internal int updateKhachHang_Account(string MaKH, string ten,string SDT,string email,string pass,string CMND,int MaTK)
        {

            //create proc update_KhachHang_TaiKhoan
            //@maKH int, @tenKH nvarchar(50),@SDT varchar(10),@email varchar(50),@CMND varchar(12),@MatKhau varchar(100),@maTK int
            //as
            //begin
            //update KhachHang
            //set TenKhachHang = @tenKH, SoDienThoai = @SDT, Email = @email, CMND = @CMND
            //where MaKhachHang = @maKH
            //update TaiKhoan
            //set Email = @email, MatKhau = @MatKhau
            //where MaTaiKhoan = @maTK
            //end

            string[] nameParams = new string[] { "@maKH", "@tenKH", "@SDT", "@email", "@CMND", "@MatKhau", "@maTK" };
            Object[] values = new object[] { MaKH, ten, SDT,email,CMND, pass, MaTK};
            return sqlProvider.ExecuteNonProc("update_KhachHang_TaiKhoan", nameParams, values);
        }
        internal int insertKhachHang_Account(string email, string pass, int loaiTK)
        {

            //create proc insert_TaiKhoan
            //@email varchar(50), @MatKhau varchar(100), @LoaiTaiKhoan int
            //as
            //insert into TaiKhoan(Email, MatKhau, MaLoaiTK)
            //values(@email, @MatKhau, @LoaiTaiKhoan);
            string[] nameParams = new string[] { "@email", "@MatKhau", "@LoaiTaiKhoan" };
            Object[] values = new object[] { email, pass, loaiTK };
            return sqlProvider.ExecuteNonProc("insert_TaiKhoan", nameParams, values);
        }

        internal int delete_KhachHang_Account(int maKH)
        {
            //create proc delete_KhachHang_TaiKhoan
            //@MaKH int
            //as
            //begin
            //delete KhachHang
            //where MaKhachHang = @MaKH
            //declare @maTK int
            //set @maTK = (select KhachHang.MaTaiKhoan from TaiKhoan,KhachHang where MaKhachHang = @MaKH)
            //delete TaiKhoan
            //where MaTaiKhoan = @maTK
            //end

            string[] nameParams = new string[] { "@MaKH" };
            Object[] values = new object[] { maKH };
            return sqlProvider.ExecuteNonProc("delete_KhachHang_TaiKhoan", nameParams, values);
        }
    }
}