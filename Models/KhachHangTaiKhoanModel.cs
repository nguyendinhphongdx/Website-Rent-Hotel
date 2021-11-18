using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebNCASP.Models
{
    public class KhachHangTaiKhoanModel
    {
        int maKhachHang;
        int maTaiKhoan;
        string tenKhachHang;
        string cmnd;
        string sdt;
        string email;
        string matkhau;

        public int MaKhachHang { get => maKhachHang; set => maKhachHang = value; }
        public int MaTaiKhoan { get => maTaiKhoan; set => maTaiKhoan = value; }
        public string TenKhachHang { get => tenKhachHang; set => tenKhachHang = value; }
        public string Cmnd { get => cmnd; set => cmnd = value; }
        public string Sdt { get => sdt; set => sdt = value; }
        public string Email { get => email; set => email = value; }
        public string Matkhau { get => matkhau; set => matkhau = value; }

        public KhachHangTaiKhoanModel(int maKhachHang, int maTaiKhoan, string tenKhachHang, string cmnd, string sdt, string email, string matkhau)
        {
            this.maKhachHang = maKhachHang;
            this.maTaiKhoan = maTaiKhoan;
            this.tenKhachHang = tenKhachHang;
            this.cmnd = cmnd;
            this.sdt = sdt;
            this.email = email;
            this.matkhau = matkhau;
        }
        public KhachHangTaiKhoanModel()
        { 
        }
    }
}