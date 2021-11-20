using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebNCASP.Models
{
    public class RoomModel1
    {
        int maPhong;
        string tenPhong;
        float donGia;
        int maKhachSan;
        string tenKhachSan;

        public int MaPhong { get => maPhong; set => maPhong = value; }
        public string TenPhong { get => tenPhong; set => tenPhong = value; }
        public float DonGia { get => donGia; set => donGia = value; }
        public int MaKhachSan { get => maKhachSan; set => maKhachSan = value; }
        public string TenKhachSan { get => tenKhachSan; set => tenKhachSan = value; }

        public RoomModel1(int maPhong, string tenPhong, float donGia, int maKhachSan, string tenKhachSan)
        {
            this.MaPhong = maPhong;
            this.TenPhong = tenPhong;
            this.DonGia = donGia;
            this.MaKhachSan = maKhachSan;
            this.TenKhachSan = tenKhachSan;
        }

        public RoomModel1()
        {
        }
    }

}