using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebNCASP.Models;
using WebNCASP.Ultis;

namespace WebNCASP.Admin
{
    public partial class Hotel : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["typeNav"] = "hotel";
            //if (Request.Form.Count>0)
            //{
            //    string type = Request.Form["type"];
            //    if (type==null) return;
            //    switch (type)
            //    {
            //        case "addHotel": onAddHotel(); break;
                    
            //    }
                
            //}
        }


        protected void addHotel_Click(object sender, EventArgs e)
        {
            HotelModel hotel = new HotelModel();
            hotel.TenKhachSan = add_nameHotel.Text;
            hotel.DiaChi = add_addressHotel.Text;
            HttpPostedFile image = add_imageHotel.PostedFile;
            hotel.Anh = image.FileName;
            Helpers.SingleUploadFile(image);
        }

        protected void updateHotel_Click(object sender, EventArgs e)
        {
            HotelModel hotel = new HotelModel();
            hotel.TenKhachSan = update_nameHotel.SelectedValue;
            hotel.DiaChi = update_Address.Text;
            HttpPostedFile image = update_image.PostedFile;
            hotel.Anh = image.FileName;
            Helpers.SingleUploadFile(image);
        }
    }
}