using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebNCASP.Admin
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Form.Count>0)
            {
                String email = Request.Form["email"];
                String password = Request.Form["password"];
                if (email == "admin@gmail.com" && password=="123")
                {
                    Response.Redirect("Admin/Index.asp");
                }
            }
            String email1 = Request.QueryString["email"];
            String password2 = Request.QueryString["password"];

        }
    }
}