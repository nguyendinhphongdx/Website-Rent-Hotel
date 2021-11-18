using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using WebNCASP.Models;
using WebNCASP.Models.Customer;

namespace WebNCASP.Controllers.customer
{
    public class BillController
    {
        SqlProvider provider = new SqlProvider();
        
        public int BookBill(BillModel bill)
        {
            //create proc insert_DonDatPhong @MaKhachHang int, @SoLuongNguoiLon int, @SoLuongTreEm int, @NgayBatDau datetime, @NgayKetThuc datetime
            //as
            //begin
            //    insert into  DonDatPhong output inserted.MaDonDat values(@MaKhachHang, @SoLuongNguoiLon, @SoLuongTreEm, @NgayBatDau, @NgayKetThuc,1)
            //end
            //exec insert_DonDatPhong 1,2,2,'11/18/2021','11/19/2021'
            //go
            string nameProc = "insert_DonDatPhong";
            string[] paramsName = new string[] { "@MaKhachHang", "@SoLuongNguoiLon", "@SoLuongTreEm", "@NgayBatDau", "@NgayKetThuc" };
            object[] paramsValue = new object[] { bill.MaKhachHang, bill.SoLuongNguoiLon, bill.SoLuongTreEm, bill.NgayBatDau, bill.NgayKetThuc };
            DataTable result = provider.ExecuteProc(nameProc, paramsName, paramsValue);
            if (result.Rows.Count > 0)
            {
                return Convert.ToInt32(result.Rows[0]["MaDonDat"]);
            }
            else return -1;
        }
        public int AddRoomIntoBill(int MaDon, int MaPhong)
        {
            //create proc insert_ChiTiet_DonDatPhong @MaPhong int, @MaDon int
            //as
            //begin
            //    insert into ChiTietDonDatPhong values(@MaDon, @MaPhong)
            //end
            string nameProc = "insert_ChiTiet_DonDatPhong";
            string[] paramsName = new string[] { "@MaPhong", "@MaDon"};
            object[] paramsValue = new object[] { MaPhong, MaDon };
            return provider.ExecuteNonProc(nameProc, paramsName, paramsValue);
        }

    }

}