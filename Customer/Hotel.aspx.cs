using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebNCASP.Controllers.customer;
using WebNCASP.Models;
using WebNCASP.Models.Customer;

namespace WebNCASP.Customer
{
    public partial class Hotel : System.Web.UI.Page
    {
        List<RoomModel> list = new List<RoomModel> { };
        HotelController hotelController = new HotelController();
        RoomController roomController = new RoomController();
        Converter converter = new Converter();
        protected void Page_Load(object sender, EventArgs e)
        {
            var hotelId = Session["HotelSelected"];
            if (hotelId != null)
            {
                ShowDetailHotelAndListRoom();
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "ToastMessage('Not Found Hotel')", true);
            }

        }

        private void ShowDetailHotelAndListRoom()
        {
            int HotelId = Convert.ToInt32(Session["HotelSelected"]);
            DataTable Result = hotelController.DetailHotel(HotelId);
            if (Result.Rows.Count > 0)
            {
                HotelModel hotel = converter.GetHotelInRow(Result.Rows[0]);
                // show hotel 
                nameHotel.Text = hotel.TenKhachSan;
                imageHotel.ImageUrl = "/Content/upload/" + hotel.Anh;
                addressHotel.Text = hotel.DiaChi;
                // show list room
                DataTable result = roomController.GetAllRoomInHotel(HotelId);
                list = (List<RoomModel>)converter.GetRoomInTable(result);
                Session["ListRoom"] = list;
                RepeaterRoom.DataSource = list;
                RepeaterRoom.DataBind();
            }

        }
        protected DataTable GetAllImageFromRoom(object item)
        {
            RoomModel room = (RoomModel)item;
            return roomController.GetAllImageInRoom(Convert.ToInt32(room.MaPhong));
        }
        protected string GetFirstImageRoom(object item)
        {
            RoomModel room = (RoomModel)item;
            DataTable result = roomController.GetAllImageInRoom(Convert.ToInt32(room.MaPhong));
            if (result.Rows.Count>0)
            {
                return result.Rows[0]["Anh"] + "";
            }
            else
            {
                return "room1.jpg";
            }
        }
        protected void btnSelect_Click(object sender, EventArgs e)
        {
        }

        protected void RepeaterRoom_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

        }

        public void btnSelect_Command(object sender, CommandEventArgs e)
        {
            Button btn = (Button)sender;
            int idRoom = Convert.ToInt32(btn.CommandArgument.ToString());
            List<RoomModel> list = (List<RoomModel>)Session["ListRoom"];
            RoomModel roomIsSeleted = list.Find(item => item.MaPhong == idRoom);
            if (roomIsSeleted != null)
            {
                List<RoomModel> cartRooms = (List<RoomModel>)Session["Cart"];
                cartRooms.Add(roomIsSeleted);
                Session["Cart"] = cartRooms;
                var master = Master as LayoutC2;
                if (master != null)
                {
                    master.NumberRoomCart = cartRooms.Count + "";
                    Label label = (Label)master.FindControl("Number");
                    label.Text = cartRooms.Count + "";
                    txtTest.Text = cartRooms.Count + "";
                    ScriptManager.RegisterStartupScript(this, Page.GetType(), "Initialize", "ToastMessage('Thêm thành công')", true);
                }
            }
        }
    }
}