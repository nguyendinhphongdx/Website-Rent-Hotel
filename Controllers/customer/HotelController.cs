using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace WebNCASP.Controllers.customer
{
    public class HotelController
    {
        SqlProvider provider = new SqlProvider();
        public DataTable GetAllHotel()
        {
            //create proc show_KhachSan
            // as
            // select* from KhachSan
            // go
            string nameProc = "show_KhachSan";
            return provider.ExecuteProc(nameProc);
        }
        public DataTable DetailHotel(int HotelId)
        {
            //create proc show_detailHotel @HotelId int
            //as
            //begin
            //    select* from KhachSan where MaKhachSan = @HotelId
            //end
            //go
            string nameProc = "show_detailHotel";
            string[] paramsName = new string[] { "@HotelId" };
            object[] paramsValue = new object[] { HotelId };
            return provider.ExecuteProc(nameProc, paramsName, paramsValue);
        }
     
    }
}