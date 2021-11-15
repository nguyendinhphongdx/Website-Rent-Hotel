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
    public partial class Room : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["typeNav"] = "room";
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            RoomModel room = new RoomModel();
            room.MaPhong = Convert.ToInt32(update_roomId.Value);
            room.MaKhachSan = Convert.ToInt32(update_hotelName.SelectedValue);
            room.TenPhong = update_roomName.Text;
            room.DonGia = float.Parse(update_price.Text);
            IList<HttpPostedFile> files = update_image.PostedFiles;
            Helpers.MultiUploadFile(files);
        }


        protected void btnAdd_Click(object sender, EventArgs e)
        {
            RoomModel room = new RoomModel();
            room.MaKhachSan = Convert.ToInt32(add_nameHotel.SelectedValue);
            room.TenPhong = add_nameRoom.Text;
            room.DonGia = float.Parse(add_price.Text);
            IList<HttpPostedFile> files = add_images.PostedFiles;
            Helpers.MultiUploadFile(files);
        }
    }
}