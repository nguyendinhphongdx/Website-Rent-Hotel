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
        public DataTable GetAllBillSet(int Makh)
        {
            //create proc show_DonDaDat @MaKh int
            //as
            //begin
            //    select a.MaDonDat,a.NgayBatDau,a.NgayKetThuc,a.SoLuongNguoiLon,a.SoLuongTreEm, COUNT(a.MaDonDat) as N'SoLuongPhong',c.TenKhachSan,c.Anh
            //    from DonDatPhong a, ChiTietDonDatPhong b, KhachSan c, Phong d
            //    where a.MaDonDat = b.MaDonDat and b.MaPhong = d.MaPhong and d.MaKhachSan = c.MaKhachSan and a.MaKhachHang = @MaKh
            //    group by a.MaDonDat,a.NgayBatDau,a.NgayKetThuc,a.SoLuongNguoiLon,a.SoLuongTreEm,c.TenKhachSan,c.Anh
            //end
            string nameProc = "show_DonDaDat";
            string[] paramsName = new string[] { "@MaKh" };
            object[] paramsValue = new object[] { Makh };
            return provider.ExecuteProc(nameProc, paramsName, paramsValue);
        }
        public bool DeleteBill(int MaHD)
        {
            //create proc delete_DonDaDat @MaDon int
            //as
            //begin
            //    begin
            //        delete
            //        from ChiTietDonDatPhong
            //        where MaDonDat = @MaDon
            //    end
            //    begin
            //        delete
            //        from DonDatPhong
            //        where MaDonDat = @MaDon
            //    end
            //end
            string nameProc = "delete_DonDaDat";
            string[] paramsName = new string[] { "@MaDon" };
            object[] paramsValue = new object[] { MaHD };
            if (provider.ExecuteNonProc(nameProc, paramsName, paramsValue)>0) return true;
            return false;
        }

    }

}