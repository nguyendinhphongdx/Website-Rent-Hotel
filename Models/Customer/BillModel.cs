using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebNCASP.Models.Customer
{
    public class BillModel
    {
        int maDonDat;
        int maKhachHang;
        int soLuongNguoiLon;
        int soLuongTreEm;
        DateTime ngayBatDau;
        DateTime ngayKetThuc;
        int trangThai;

        public BillModel()
        {
        }

        public BillModel(int maDonDat, int maKhachHang, int soLuongNguoiLon, int soLuongTreEm, DateTime ngayBatDau, DateTime ngayKetThuc, int trangThai)
        {
            this.MaDonDat = maDonDat;
            this.MaKhachHang = maKhachHang;
            this.SoLuongNguoiLon = soLuongNguoiLon;
            this.SoLuongTreEm = soLuongTreEm;
            this.NgayBatDau = ngayBatDau;
            this.NgayKetThuc = ngayKetThuc;
            this.TrangThai = trangThai;
        }

        public int MaDonDat { get => maDonDat; set => maDonDat = value; }
        public int MaKhachHang { get => maKhachHang; set => maKhachHang = value; }
        public int SoLuongNguoiLon { get => soLuongNguoiLon; set => soLuongNguoiLon = value; }
        public int SoLuongTreEm { get => soLuongTreEm; set => soLuongTreEm = value; }
        public DateTime NgayBatDau { get => ngayBatDau; set => ngayBatDau = value; }
        public DateTime NgayKetThuc { get => ngayKetThuc; set => ngayKetThuc = value; }
        public int TrangThai { get => trangThai; set => trangThai = value; }
    }
}