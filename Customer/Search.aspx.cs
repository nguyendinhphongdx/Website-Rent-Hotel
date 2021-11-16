using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebNCASP.Models;

namespace WebNCASP.Customer
{
    public partial class Search : System.Web.UI.Page
    {
        List<HotelModel> list = new List<HotelModel> { };
        protected void Page_Load(object sender, EventArgs e)
        {
            // Response.Redirect("search.aspx?place=" + place + "&daterange=" + daterange + "&people=" + people);
            for (var i = 0; i < 5; i++)
            {
                HotelModel hotel = new HotelModel(i,"Khách sạn "+i,"Địa chỉ "+i,"Anh");
                list.Add(hotel);
            }
            Repeater_Hotel.DataSource = list;
            Repeater_Hotel.DataBind();
        }

        protected void nameHotel_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            int idHotel = Convert.ToInt32(btn.CommandArgument.ToString());
            string query = Request.QueryString.ToString();
            Response.Redirect("Hotel.aspx?"+query+"?"+"hotel="+ idHotel);
        }
    }
}