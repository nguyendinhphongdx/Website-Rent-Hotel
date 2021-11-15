using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebNCASP.Admin
{
    public partial class Hotel : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["typeNav"] = "hotel";
            if (Request.Form.Count>0)
            {
                string type = Request.Form["type"];
                if (type==null) return;
                switch (type)
                {

                }
            }
        }
    }
}