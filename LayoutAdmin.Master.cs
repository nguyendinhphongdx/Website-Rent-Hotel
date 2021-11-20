using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebNCASP
{
    public partial class LayoutAdmin : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            bool logedIn = (bool)Session["adMinLogedIn"];
            if (logedIn!=true) { Response.Redirect("Login.aspx"); }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session["adMinLogedIn"] = false;
            Response.Redirect("Login.aspx");
        }
    }
}