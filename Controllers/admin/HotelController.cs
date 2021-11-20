using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace WebNCASP.Controllers.admin
{
    public class HotelController
    {
        SqlProvider sqlProvider = new SqlProvider();
        internal DataTable getHotel()
        {
            //    create proc show_KhachSan
            //    as
            //    select MaKhachSan,TenKhachSan,DiaChi,Anh from KhachSan

            return sqlProvider.ExecuteProc("show_KhachSan",null,null);
        }
        internal DataTable getHotel_SoPhong()
        {
            //create proc show_KhachSan_SoPhong
            //as
            //select KhachSan.MaKhachSan as MaKhachSan,TenKhachSan,DiaChi,Anh,count(MaPhong) as SoPhong from KhachSan left join Phong
            //on KhachSan.MaKhachSan = Phong.MaKhachSan
            //group by KhachSan.MaKhachSan,TenKhachSan,DiaChi,Anh

            return sqlProvider.ExecuteProc("show_KhachSan_SoPhong", null, null);
        }

        internal int addHotel(string tenKS,string diachi,string anh)
        {
            //create proc insert_KhachSan
            //@TenKS nvarchar(30),@Diachi nvarchar(50),@Anh varchar(100)
            //as
            //insert into KhachSan(TenKhachSan, DiaChi, Anh)
            //values(@TenKS, @Diachi, @Anh)
            string[] nameParams = new string[] { "@TenKS", "@Diachi", "@Anh" };
            object[] values = new object[] { tenKS,diachi,anh};
            return sqlProvider.ExecuteNonProc("insert_KhachSan", nameParams,values);
        }

        internal int updateHotel(int maKS,string tenKS, string diachi, string anh)
        {
            //create proc update_KhachSan 
            //@MaKS int, @TenKS nvarchar(30),@Diachi nvarchar(50),@Anh varchar(100)
            //as
            //update KhachSan
            //set TenKhachSan = @TenKS, DiaChi = @Diachi, Anh = @Anh
            //where MaKhachSan = @MaKS

            string[] nameParams = new string[] { "@MaKS", "@TenKS", ",@Diachi", "@Anh" };
            object[] values = new object[] { maKS,tenKS, diachi, anh };
            return sqlProvider.ExecuteNonProc("update_KhachSan", nameParams, values);
        }
        internal int deleteHotel(int maKS)
        {
            //create proc delete_KhachSan
            //@MaKhachSan int
            //as
            //delete KhachSan
            //where MaKhachSan = @MaKhachSan
            //delete Phong
            //where MaKhachSan = @MaKhachSan
            string[] nameParams = new string[] { "@MaKhachSan" };
            object[] values = new object[] { maKS };
            return sqlProvider.ExecuteNonProc("delete_KhachSan", nameParams, values);
        }

    }
}