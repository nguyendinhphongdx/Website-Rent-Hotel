using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebNCASP.Ultis;

namespace WebNCASP.Admin
{
    public partial class Login : System.Web.UI.Page
    {
        Constant constant = new Constant();
        protected void Page_Load(object sender, EventArgs e)
        {
            label.Text = "";
            if (Request.Form.Count>0 && Request.Form["type"] == "signin")
            {
                String email = Request.Form["email"];
                String pass = Request.Form["password"];
                if (email == "admin@gmail.com" && pass == "123")
                {
                    Session["adminLogedin"] = true;
                    Response.Redirect("index.aspx");
                }
                else
                {
                    label.Text = "Thông tin tài khoản không chính xác!";
                }
            }
        }


        protected void btnLogin_Click(object sender, EventArgs e)
        {
            //String email = login_email.Text;
            //String pass = login_password.Text;
            //if (email == "admin@gmail.com" && pass=="123")
            //{
            //    Session["adminLogedin"] = true;
            //    Response.Redirect("index.aspx");
            //}
        }
    }
}