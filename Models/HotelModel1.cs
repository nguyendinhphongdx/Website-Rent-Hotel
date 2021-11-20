using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebNCASP.Models
{
    public class HotelModel1
    {
        int maKhachSan;
        string tenKhachSan;
        string diaChi;
        string anh;
        int soPhong;

        public HotelModel1(int maKhachSan, string tenKhachSan, string diaChi, string anh)
        {
            this.MaKhachSan = maKhachSan;
            this.TenKhachSan = tenKhachSan;
            this.DiaChi = diaChi;
            this.Anh = anh;
        }
        public HotelModel1()
        {
        }
        public HotelModel1(int maKhachSan, string tenKhachSan, string diaChi, string anh, int soPhong)
        {
            this.maKhachSan = maKhachSan;
            this.tenKhachSan = tenKhachSan;
            this.diaChi = diaChi;
            this.anh = anh;
            this.soPhong = soPhong;
        }

        public int MaKhachSan { get => maKhachSan; set => maKhachSan = value; }
        public string TenKhachSan { get => tenKhachSan; set => tenKhachSan = value; }
        public string DiaChi { get => diaChi; set => diaChi = value; }
        public string Anh { get => anh; set => anh = value; }
        public int SoPhong { get => soPhong; set => soPhong = value; }
    }
}