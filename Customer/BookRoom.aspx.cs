using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebNCASP.Controllers.customer;
using WebNCASP.Models;
using WebNCASP.Models.Customer;
using WebNCASP.Ultis;

namespace WebNCASP.Customer
{
    public partial class BookRoom : System.Web.UI.Page
    {
        public List<RoomModel> roomsInCart = new List<RoomModel> { };
        HotelController hotelController = new HotelController();
        CustomerController customerController = new CustomerController();
        BillController billController = new BillController();
        Converter converter = new Converter();
        CustomerModel customer;
        public bool isEmpty = false;
        public string night = "1";
        AccountModel currentCustomer;
        protected void Page_Load(object sender, EventArgs e)
        {
            currentCustomer = (AccountModel)Session["customerCurrent"];
            if (currentCustomer != null)
            {
                ShowInfoBill();
            }
            else
            {
                Response.Redirect("Search.aspx");
            }
        }

        private void ShowInfoBill()
        {
            GetInFoQueryString();
            //show info hotel
            int HotelSelected = Convert.ToInt32(Session["HotelSelected"]);
            DataTable result = hotelController.DetailHotel(HotelSelected);
            if (result.Rows.Count > 0)
            {
                HotelModel hotel = converter.GetHotelInRow(result.Rows[0]);
                nameHotel.Text = hotel.TenKhachSan;
                imageHotel.ImageUrl = "/Content/upload/" + hotel.Anh;
                //show info hotel
                roomsInCart = (List<RoomModel>)Session["Cart"];
                Repeater_RoomSelected.DataSource = roomsInCart;
                FillInfoCustomer();
                DataBind();
            }
            else
            {
                isEmpty = true;
                ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "ToastMessage('Đơn trống!')", true);
            }
            AccountModel accCurrent = (AccountModel)Session["customerCurrent"];
            if (accCurrent != null)
            {
                customer = customerController.GetKhachHangInFo(accCurrent.MaTaiKhoan);
                Repeater_BillInParted.DataSource = billController.GetAllBillSet(customer.MaKhachHang);
                Repeater_BillInParted.DataBind();
            }
        }

        private void GetInFoQueryString()
        {
            //show info bill
            string place = Request.QueryString["place"] != null ? Request.QueryString["place"] + "" : "Hà Nội";
            string daterange = Request.QueryString["daterange"] != null ? Request.QueryString["daterange"] + "" : Helpers.GetDateRangeStringDefault();
            string people = Request.QueryString["people"] != null ? Request.QueryString["people"] + "" : Helpers.GetPeopleStringDefault(1, 2, 0);
            string[] daterangeSplit = daterange.Split('-');
            string start = daterangeSplit[0].Trim();
            string end = daterangeSplit[1].Trim();
            endDate.Text = end;
            startDate.Text = start;
            long timeend = DateTime.ParseExact(end, "MM/dd/yyyy", CultureInfo.InvariantCulture).Ticks;
            long timestart = DateTime.ParseExact(start, "MM/dd/yyyy", CultureInfo.InvariantCulture).Ticks;
            night = (timeend - timestart) / 864000000000 + "";

        }

        private void FillInfoCustomer()
        {
            string people = Request.QueryString["people"] != null ? Request.QueryString["people"] + "" : Helpers.GetPeopleStringDefault(1, 2, 0);
            email.Text = currentCustomer.Email;
            string[] peopleSplit = people.Split(',');
            numberParent.Text = peopleSplit[1].Trim().Split(' ')[0];
            numberChild.Text = peopleSplit[2].Trim().Split(' ')[0];
            AccountModel accCurrent = (AccountModel)Session["customerCurrent"];
            if (accCurrent != null)
            {
                customer = customerController.GetKhachHangInFo(accCurrent.MaTaiKhoan);
                name.Text = customer.TenKhachHang;
                phone.Text = customer.SoDienThoai;
            }
        }
        public string GetTotalBill()
        {
            float total = 0;
            int numberNight = Convert.ToInt32(night);
            roomsInCart.ForEach(item => total += item.DonGia * numberNight);
            return total.ToString("C", new CultureInfo("vi-vn"));
        }

        protected void deleteItem_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            int idRoom = Convert.ToInt32(btn.CommandArgument.ToString());
            List<RoomModel> list = (List<RoomModel>)Session["Cart"];
            int index = list.FindIndex(item => item.MaPhong == idRoom);
            list.RemoveAt(index);
            roomsInCart = list;
            if (roomsInCart != null)
            {
                Session["Cart"] = roomsInCart;
                Repeater_RoomSelected.DataSource = roomsInCart;
                var master = Master as LayoutC2;
                if (master != null)
                {
                    master.NumberRoomCart = roomsInCart.Count + "";
                }
                Repeater_RoomSelected.DataBind();
            }
            DataBind();
        }
        protected string GetFirstImageRoom(object item)
        {
            RoomController roomController = new RoomController();
            RoomModel room = (RoomModel)item;
            DataTable result = roomController.GetAllImageInRoom(Convert.ToInt32(room.MaPhong));
            if (result.Rows.Count > 0)
            {
                return result.Rows[0]["Anh"] + "";
            }
            else
            {
                return "room1.jpg";
            }
        }


        protected void btnPay_Click(object sender, EventArgs e)
        {
            if (customer != null)
            {
                if (roomsInCart.Count > 0)
                {
                    BillModel bill = new BillModel();
                    bill.MaKhachHang = customer.MaKhachHang;
                    bill.SoLuongNguoiLon = Convert.ToInt32(numberParent.Text);
                    bill.SoLuongTreEm = Convert.ToInt32(numberChild.Text);
                    bill.NgayBatDau = Convert.ToDateTime(DateTime.ParseExact(startDate.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture));
                    bill.NgayKetThuc = Convert.ToDateTime(DateTime.ParseExact(endDate.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture));
                    // insert hoa don
                    int BillId = billController.BookBill(bill);
                    if (BillId != -1)
                    {
                        List<RoomModel> roomsInCart = (List<RoomModel>)Session["Cart"];
                        roomsInCart.ForEach(item =>
                        {
                            billController.AddRoomIntoBill(BillId, item.MaPhong);
                        });
                        Repeater_BillInParted.DataSource = billController.GetAllBillSet(customer.MaKhachHang);
                        Repeater_BillInParted.DataBind();
                        ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "ToastMessage('Đặt phòng thành công!')", true);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "ToastMessage('Đặt đơn không thành công!')", true);
                    }
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "ToastMessage('Chưa chọn phòng!')", true);
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "ToastMessage('Vui lòng đăng nhập lại!')", true);
            }
        }


        protected void Delete_Command(object sender, CommandEventArgs e)
        {
            LinkButton button = (LinkButton)sender;
            int MaHoaDon = Convert.ToInt32(button.CommandArgument.ToString());
            billController.DeleteBill(MaHoaDon);
            AccountModel accCurrent = (AccountModel)Session["customerCurrent"];
            customer = customerController.GetKhachHangInFo(accCurrent.MaTaiKhoan);
            Repeater_BillInParted.DataSource = billController.GetAllBillSet(customer.MaKhachHang);
            ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "ToastMessage('Xóa thành công!')", true);
            DataBind();
        }
    }
}