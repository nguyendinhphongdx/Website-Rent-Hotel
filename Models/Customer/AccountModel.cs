using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebNCASP.Models.Customer
{
    public class AccountModel
    {
        int maTaiKhoan;
        string matKhau;
        int maLoaiTK;
        string email;

        public AccountModel()
        {
        }

        public AccountModel(int maTaiKhoan, string matKhau, int maLoaiTK, string email)
        {
            this.MaTaiKhoan = maTaiKhoan;
            this.MatKhau = matKhau;
            this.MaLoaiTK = maLoaiTK;
            this.Email = email;
        }

        public int MaTaiKhoan { get => maTaiKhoan; set => maTaiKhoan = value; }
        public string MatKhau { get => matKhau; set => matKhau = value; }
        public int MaLoaiTK { get => maLoaiTK; set => maLoaiTK = value; }
        public string Email { get => email; set => email = value; }
    }
}