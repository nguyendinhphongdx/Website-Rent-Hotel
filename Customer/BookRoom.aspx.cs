using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebNCASP.Models;

namespace WebNCASP.Customer
{
    public partial class BookRoom : System.Web.UI.Page
    {
        public List<RoomModel> roomsInCart = new List<RoomModel> { };
        protected void Page_Load(object sender, EventArgs e)
        {
            roomsInCart = (List<RoomModel>)Session["Cart"];
            Repeater_RoomSelected.DataSource = roomsInCart;
            Repeater_RoomSelected.DataBind();
        }

    }
}