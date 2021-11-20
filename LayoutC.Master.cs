using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebNCASP.Controllers.customer;
using WebNCASP.Models;
using WebNCASP.Models.Customer;
using WebNCASP.Ultis;

namespace WebNCASP
{
    public partial class LayoutC : System.Web.UI.MasterPage
    {
        CustomerController customer = new CustomerController();
        Converter converter = new Converter();
        public AccountModel currentCustomer;
        protected void Page_Load(object sender, EventArgs e)
        {
            List<RoomModel> roomsCart = (List<RoomModel>)Session["Cart"];
            Number.Text = roomsCart.Count + "";
            currentCustomer = (AccountModel)Session["customerCurrent"];
            if (currentCustomer!=null)
            {
                userName.Text = currentCustomer.Email;
            }
            Notifee.Text = "";
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

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text;
            string password = txtPassword.Text;
            DataTable result = customer.Login(email, password);
            if (result != null && result.Rows.Count > 0 && Convert.ToInt32(result.Rows[0]["MaTaiKhoan"]) == 1)
            {
                currentCustomer = converter.GetAccountInRow(result.Rows[0]);
                userName.Text = currentCustomer.Email;
                Session["customerCurrent"] = currentCustomer;
                ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "ToastMessage('Đăng nhập thành công!')", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "ToastMessage('Tài khoản hoặc mật khẩu không chính xác!')", true);
            }
        }

        protected void Logout_Click(object sender, EventArgs e)
        {
            Session["customerCurrent"] = null;
            currentCustomer = null;
        }

        protected void CartRoom_Click(object sender, EventArgs e)
        {
            AccountModel currentCustomer = (AccountModel)Session["customerCurrent"];
            if (currentCustomer != null)
            {
                string place = Request.QueryString["place"] != null ? Request.QueryString["place"] + "" : "Hà Nội";
                string daterange = Request.QueryString["daterange"] != null ? Request.QueryString["daterange"] + "" : Helpers.GetDateRangeStringDefault();
                string people = Request.QueryString["people"] != null ? Request.QueryString["people"] + "" : Helpers.GetPeopleStringDefault(1,2,0);
                Response.Redirect("bookroom.aspx?place=" + place + "&daterange=" + daterange + "&people=" + people);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "ToastMessage('Please Login')", true);
            }
        }
    }
}