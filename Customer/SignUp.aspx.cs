using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebNCASP.Controllers.customer;
using WebNCASP.Models;
using WebNCASP.Models.Customer;

namespace WebNCASP.Customer
{
    public partial class SignUp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSignUp_Click(object sender, EventArgs e)
        {
            CustomerModel customer = new CustomerModel();
            customer.TenKhachHang = name.Text;
            customer.SoDienThoai = phone.Text;
            customer.CMND = CMND.Text;
            customer.Email = email.Text;
            AccountModel account = new AccountModel();
            account.Email = email.Text;
            account.MatKhau = password.Text;
            CustomerController customerController = new CustomerController();
            if (customerController.SignUp(customer, account)) {
                Session["customerCurrent"] = account;
                Response.Redirect("index.aspx");
                ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "ToastMessage('Đăng kí thành công!')", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "ToastMessage('Đăng kí thất bại!')", true);
            }
        }
    }
}