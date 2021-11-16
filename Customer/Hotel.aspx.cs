using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebNCASP.Models;

namespace WebNCASP.Customer
{
    public partial class Hotel : System.Web.UI.Page
    {
        List<RoomModel> list = new List<RoomModel> { };
        protected void Page_Load(object sender, EventArgs e)
        {
            for (var i = 0; i < 5; i++)
            {
                RoomModel room = new RoomModel(i, "phòng " + i, i * 100, i);
                list.Add(room);
            }
            RepeaterRoom.DataSource = list;
            RepeaterRoom.DataBind();
        }

        protected void btnSelect_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            int idRoom = Convert.ToInt32(btn.CommandArgument.ToString());
            RoomModel roomIsSeleted = list.Find(item => item.MaPhong == idRoom);
            List<RoomModel> cartRooms = (List<RoomModel>)Session["Cart"];
            cartRooms.Add(roomIsSeleted);
            Session["Cart"] = cartRooms;
        }

        protected void RepeaterRoom_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            
        }
    }
}