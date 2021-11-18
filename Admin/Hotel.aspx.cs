using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebNCASP.Controllers.admin;
using WebNCASP.Models;
using WebNCASP.Ultis;

namespace WebNCASP.Admin
{
    public partial class Hotel : System.Web.UI.Page
    {
        HotelController hotelControllers = new HotelController();
        List<HotelModel1> listHotel = new List<HotelModel1>();
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
            BindingListView();
            BindingDropDownList();
            
        }
        protected void BindingListView()
        {
            listHotel.Clear();
            controller_fill_Model();
            listViewHotel.DataSource = listHotel;
            listViewHotel.DataBind();
        }
        protected void BindingDropDownList()
        {
            listHotel.Clear();
            controller_fill_Model();
            update_nameHotel.DataSource = listHotel;
            update_nameHotel.DataValueField = "MaKhachSan";
            update_nameHotel.DataTextField = "TenKhachSan";
            update_nameHotel.DataBind();
        }
        protected void controller_fill_Model()
        {
            DataTable tableHotel = hotelControllers.getHotel_SoPhong();
            foreach (DataRow dataRow in tableHotel.Rows)
            {
                HotelModel1 hotel = new HotelModel1(Convert.ToInt32(dataRow["MaKhachSan"]),
                    (string)dataRow["TenKhachSan"], (string)dataRow["DiaChi"],
                    (string)dataRow["Anh"], Convert.ToInt32(dataRow["SoPhong"]));
                listHotel.Add(hotel);
            }
        }

        protected void addHotel_Click(object sender, EventArgs e)
        {
            HotelModel hotel = new HotelModel();
            hotel.TenKhachSan = add_nameHotel.Text;
            hotel.DiaChi = add_addressHotel.Text;
            HttpPostedFile image = add_imageHotel.PostedFile;
            hotel.Anh = image.FileName;
            Helpers.SingleUploadFile(image);
            int i=hotelControllers.addHotel(hotel.TenKhachSan,hotel.DiaChi,hotel.Anh);
            BindingListView();
            BindingDropDownList();
        }

        protected void updateHotel_Click(object sender, EventArgs e)
        {
            HotelModel hotel = new HotelModel();
            hotel.TenKhachSan = update_nameHotel.SelectedValue;
            hotel.DiaChi = update_Address.Text;
            HttpPostedFile image = update_image.PostedFile;
            hotel.Anh = image.FileName;
            Helpers.SingleUploadFile(image);
            int i = hotelControllers.updateHotel(hotel.MaKhachSan,hotel.TenKhachSan, hotel.DiaChi, hotel.Anh);
            BindingListView();
            BindingDropDownList();
        }

        protected void btn_Xoa_Click(object sender, EventArgs e)
        {
            Button button = (Button)sender;
            int maKS =Convert.ToInt32( button.CommandArgument);
            hotelControllers.deleteHotel(maKS);
            BindingListView();
            BindingDropDownList();
        }

        protected void btn_Sua_Click(object sender, EventArgs e)
        {
            Button button = (Button)sender;
            int maKS = Convert.ToInt32(button.CommandArgument);
            HotelModel1 hotelModel1 = listHotel.Find(Item => Item.MaKhachSan == maKS);
            update_nameHotel.SelectedValue = maKS.ToString();
            update_Address.Text = hotelModel1.DiaChi;
            update_number.Text = hotelModel1.SoPhong.ToString();
            
        }

        protected void update_image_Load(object sender, EventArgs e)
        {
            if (update_image.HasFile)
            {

            }
        }
    }
}