using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace WebNCASP.Models.Customer
{
    public class Converter
    {
        public CustomerModel GetCustomerInRow(DataRow dataRow)
        {
            CustomerModel x = new CustomerModel();
            x.MaKhachHang = Convert.ToInt32(dataRow["MaKhachHang"]);
            x.TenKhachHang = dataRow["TenKhachHang"]+"";
            x.SoDienThoai = dataRow["SoDienThoai"]+"";
            x.CMND = dataRow["CMND"]+"";
            x.MaTaiKhoan = Convert.ToInt32(dataRow["MaTaiKhoan"]);
            return x;
        }

        internal List<object> GetCustomersInTable(DataTable result)
        {
            List<object> ls = new List<object>();
            for (int i = 0; i < result.Rows.Count; i++)
            {
                ls.Add(this.GetCustomerInRow(result.Rows[i]));
            }
            return ls;
        }
        public AccountModel GetAccountInRow(DataRow dataRow)
        {
            AccountModel x = new AccountModel();
            x.MaTaiKhoan = Convert.ToInt32(dataRow["MaTaiKhoan"]);
            x.Email = dataRow["Email"] + "";
            x.MatKhau = dataRow["MatKhau"] + "";
            x.MaLoaiTK = Convert.ToInt32(dataRow["MaLoaiTK"]);
            return x;
        }

        internal List<object> GetAccountInTable(DataTable result)
        {
            List<object> ls = new List<object>();
            for (int i = 0; i < result.Rows.Count; i++)
            {
                ls.Add(this.GetAccountInRow(result.Rows[i]));
            }
            return ls;
        }
        public HotelModel GetHotelInRow(DataRow dataRow)
        {
            HotelModel x = new HotelModel();
            x.MaKhachSan = Convert.ToInt32(dataRow["MaKhachSan"]);
            x.TenKhachSan = dataRow["TenKhachSan"] + "";
            x.DiaChi = dataRow["DiaChi"] + "";
            x.Anh = dataRow["Anh"] + "";
            return x;
        }

        internal List<object> GetHotelInTable(DataTable result)
        {
            List<object> ls = new List<object>();
            for (int i = 0; i < result.Rows.Count; i++)
            {
                ls.Add(this.GetHotelInRow(result.Rows[i]));
            }
            return ls;
        }
        public RoomModel GetRoomInRow(DataRow dataRow)
        {
            RoomModel x = new RoomModel();
            x.MaPhong = Convert.ToInt32(dataRow["MaPhong"]);
            x.MaKhachSan = Convert.ToInt32(dataRow["MaKhachSan"]);
            x.TenPhong = dataRow["TenPhong"] + "";
            x.DonGia = float.Parse(dataRow["DonGia"]+"");
            return x;
        }

        internal List<RoomModel> GetRoomInTable(DataTable result)
        {
            List<RoomModel> ls = new List<RoomModel>();
            for (int i = 0; i < result.Rows.Count; i++)
            {
                ls.Add(this.GetRoomInRow(result.Rows[i]));
            }
            return ls;
        }
    }
}