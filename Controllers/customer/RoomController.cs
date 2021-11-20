using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace WebNCASP.Controllers.customer
{
    public class RoomController
    {
        SqlProvider provider = new SqlProvider();

        public DataTable GetAllRoomInHotel(int HotelId)
        {
            //create proc show_allRoom_In_Hotel @HotelId int
            //as
            //begin
            //    select* from Phong where MaKhachSan = @HotelId
            //end
            string nameProc = "show_allRoom_In_Hotel";
            string[] paramsName = new string[] { "@HotelId" };
            object[] paramsValue = new object[] { HotelId };
            return provider.ExecuteProc(nameProc, paramsName, paramsValue);
        }
        public DataTable GetAllImageInRoom(int RoomId)
        {
            //create proc show_allImage_In_Room @RoomID int
            //as
            //begin
            //    select* from Phong_Anh where MaPhong = @RoomID
            //end
            //GO
            string nameProc = "show_allImage_In_Room";
            string[] paramsName = new string[] { "@RoomID" };
            object[] paramsValue = new object[] { RoomId };
            return provider.ExecuteProc(nameProc, paramsName, paramsValue);
        }
    }
}