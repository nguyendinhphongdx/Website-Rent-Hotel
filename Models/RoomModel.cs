using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebNCASP.Models
{
    public class RoomModel
    {
        int maPhong;
        string tenPhong;
        float donGia;
        int maKhachSan;

        public RoomModel()
        {

        }

        public RoomModel(int maPhong, string tenPhong, float donGia, int maKhachSan)
        {
            this.MaPhong = maPhong;
            this.TenPhong = tenPhong;
            this.DonGia = donGia;
            this.MaKhachSan = maKhachSan;
        }

        public int MaPhong { get => maPhong; set => maPhong = value; }
        public string TenPhong { get => tenPhong; set => tenPhong = value; }
        public float DonGia { get => donGia; set => donGia = value; }
        public int MaKhachSan { get => maKhachSan; set => maKhachSan = value; }
    }
}