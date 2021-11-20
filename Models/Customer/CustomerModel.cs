using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebNCASP.Models
{
    public class CustomerModel
    {
        int maKhachHang;
        string tenKhachHang;
        string soDienThoai;
        string cMND;
        int maTaiKhoan;
        string email;

        public CustomerModel()
        {
        }

        public CustomerModel(int maKhachHang, string tenKhachHang, string soDienThoai, string cMND, int maTaiKhoan, string email)
        {
            this.maKhachHang = maKhachHang;
            this.tenKhachHang = tenKhachHang;
            this.soDienThoai = soDienThoai;
            this.cMND = cMND;
            this.maTaiKhoan = maTaiKhoan;
            this.email = email;
        }

        public int MaKhachHang { get => maKhachHang; set => maKhachHang = value; }
        public string TenKhachHang { get => tenKhachHang; set => tenKhachHang = value; }
        public string SoDienThoai { get => soDienThoai; set => soDienThoai = value; }
        public string CMND { get => cMND; set => cMND = value; }
        public int MaTaiKhoan { get => maTaiKhoan; set => maTaiKhoan = value; }
        public string Email { get => email; set => email = value; }
    }
}