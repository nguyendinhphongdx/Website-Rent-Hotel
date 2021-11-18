using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebNCASP.Controllers.customer;

namespace WebNCASP.Customer
{
    public partial class Index : System.Web.UI.Page
    {
        HotelController hotelController = new HotelController();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                Repeater_Hotel.DataSource = hotelController.GetAllHotel();
                Repeater_Hotel.DataBind();
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            if (Request.Form.Count > 0)
            {
                string place = Request.Form["place"];
                string daterange = Request.Form["daterange"];
                string people = Request.Form["people"];
                Response.Redirect("search.aspx?place=" + place + "&daterange=" + daterange + "&people=" + people);
            }
        }

        protected void nameHotel_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            int idHotel = Convert.ToInt32(btn.CommandArgument.ToString());
            Session["HotelSelected"] = idHotel;
            Response.Redirect("Hotel.aspx?hotel=" + idHotel);
        }
    }
}