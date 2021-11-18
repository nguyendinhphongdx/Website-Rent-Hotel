using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebNCASP.Controllers.admin;
using WebNCASP.Models;

namespace WebNCASP.Admin
{
    public partial class Custumer : System.Web.UI.Page
    {
        KhachHangController khachHangController = new KhachHangController();
        List<KhachHangTaiKhoanModel> list = new List<KhachHangTaiKhoanModel>();

        protected void Page_Load(object sender, EventArgs e)
        {
            Session["typeNav"] = "custumer";

            Binding();
            
        }
        protected void Binding()
        {
            list.Clear();
            DataTable tableKhachHang = khachHangController.getKhachHang();
            foreach(DataRow dataRow in tableKhachHang.Rows)
            {
                KhachHangTaiKhoanModel khachHangTaiKhoan = new KhachHangTaiKhoanModel(
                    Convert.ToInt32(dataRow["MaKhachHang"]), Convert.ToInt32(dataRow["MaTaiKhoan"]),
                    (string)dataRow["TenKhachHang"], (string)dataRow["CMND"],
                    (string)dataRow["SoDienThoai"], (string)dataRow["Email"], (string)dataRow["MatKhau"]
                    );
                list.Add(khachHangTaiKhoan);
            }    
            listViewKH.DataSource = list;
            listViewKH.DataBind();
        }

        protected void btn_Sua_Click(object sender, EventArgs e)
        {
            Button button = (Button)sender;
            int maKH = Convert.ToInt32(button.CommandArgument);
            KhachHangTaiKhoanModel khachHangTaiKhoan = list.Find(Item =>Item.MaKhachHang==maKH );

        }

        protected void btn_Xoa_Click(object sender, EventArgs e)
        {
            Button button = (Button)sender;
            int maKH = Convert.ToInt32(button.CommandArgument);
            int khachhang = khachHangController.delete_KhachHang_Account(maKH);
            Binding();
           // if(khachhang==0)
                
        }
    }
}