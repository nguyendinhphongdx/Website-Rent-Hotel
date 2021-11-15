using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebNCASP.Customer
{
    public partial class Index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Form.Count>0)
            {
                string place = Request.Form["place"];
                string daterange = Request.Form["daterange"];
                string people = Request.Form["people"];
                Response.Redirect("search.aspx?place="+place+"&daterange="+daterange+"&people="+people);
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {

        }
    }
}