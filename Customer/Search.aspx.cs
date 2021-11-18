using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebNCASP.Controllers.customer;
using WebNCASP.Models;

namespace WebNCASP.Customer
{
    public partial class Search : System.Web.UI.Page
    {
        HotelController hotelController = new HotelController();
        List<HotelModel> list = new List<HotelModel> { };
        protected void Page_Load(object sender, EventArgs e)
        {
            Repeater_Hotel.DataSource = hotelController.GetAllHotel();
            Repeater_Hotel.DataBind();
        }

        protected void nameHotel_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            int idHotel = Convert.ToInt32(btn.CommandArgument.ToString());
            Session["HotelSelected"] = idHotel;
            string query = Request.QueryString.ToString();
            Response.Redirect("Hotel.aspx?"+query+"&"+"hotel="+ idHotel);
        }
    }
}