using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebNCASP.Controllers.customer
{
    public class ImageRoom
    {
        int maPhong;
        string anh;

        public int MaPhong { get => maPhong; set => maPhong = value; }
        public string Anh { get => anh; set => anh = value; }

        public ImageRoom(int maPhong, string anh)
        {
            this.MaPhong = maPhong;
            this.Anh = anh;
        }

        public ImageRoom()
        {
        }
    }
}