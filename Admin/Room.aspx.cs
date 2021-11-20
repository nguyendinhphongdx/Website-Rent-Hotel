using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebNCASP.Models;
using WebNCASP.Ultis;

namespace WebNCASP.Admin
{
    public partial class Room : System.Web.UI.Page
    {
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;
        string cnn = WebConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString;
        SqlConnection con;
        private static int romID;
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["typeNav"] = "room";
            if (IsPostBack) return;
            loadDataRptPhong();
            loadDropTenKhachSan();
        }

     

        private void loadDataRptPhong()
        {
            con = new SqlConnection(cnn);
            con.Open();
            try
            {
                string sql = "select KhachSan.TenKhachSan, Phong.MaPhong, Phong.DonGia, Phong.TenPhong from Phong, KhachSan where Phong.MaKhachSan = KhachSan.MaKhachSan";
                cmd = new SqlCommand(sql, con);
                da = new SqlDataAdapter(cmd);
                ds = new DataSet();
                da.Fill(ds);
                rptPhong.DataSource = ds;
                rptPhong.DataBind();
                cmd.Dispose();
                con.Close();
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }
        private void loadDropTenKhachSan()
        {
            cmd.Connection = con;
            cmd.CommandText = "select * from KhachSan";
            SqlDataAdapter dataAdapter = new SqlDataAdapter(cmd);
            ds = new DataSet();
            dataAdapter.Fill(ds);
            ddlTenKhachSan.DataSource = ds;
            ddlTenKhachSan.DataTextField = "TenKhachSan";
            ddlTenKhachSan.DataValueField = "MaKhachSan";
            ddlTenKhachSan.DataBind();
        }

        private bool CheckMaPhong(int maPhong)
        {
            con = new SqlConnection(cnn);
            SqlCommand cmd = new SqlCommand("Select * from Phong,ChiTietDonDatPhong where Phong.MaPhong = '" + maPhong + "'and Phong.MaPhong = ChiTietDonDatPhong.MaPhong ", con);
            cmd.CommandType = CommandType.Text;
            SqlDataAdapter dataAdapter = new SqlDataAdapter(cmd);
            DataTable dataTable = new DataTable();
            dataAdapter.Fill(dataTable);
            if (dataTable.Rows.Count > 0)
            {
                return false;
            }
            return true;

        }

        private DataTable getPhongId(int id) 
        {
            con = new SqlConnection(cnn);
            SqlCommand cmd = new SqlCommand("select * from Phong, KhachSan where  Phong.MaPhong = '" + id + "'", con);
            cmd.CommandType = CommandType.Text;
            SqlDataAdapter dataAdapter = new SqlDataAdapter(cmd);
            DataTable dataTable = new DataTable();
            dataAdapter.Fill(dataTable);
            
            return dataTable;

        }
        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "XoaPhong")
            {
                con = new SqlConnection(cnn);
                if (CheckMaPhong(Convert.ToInt32(e.CommandArgument)))
                {
                    try
                    {
                        con.Open();
                        SqlCommand cmd = new SqlCommand("delete_Phong", con);
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@MaPhong", Convert.ToInt32(e.CommandArgument));
                        cmd.ExecuteNonQuery();
                        if (cmd.ExecuteNonQuery() > 0)
                        {
                            Response.Write("<script>alert('Thông báo')</script>");
                        }
                        con.Close();
                        reset();
                    }
                    catch (Exception ex)
                    {
                        Response.Write(ex.Message);
                    }
                }
                else
                {
                    Response.Write("<script>alert('Khong duoc xoa')</script>");
                }

            }
            if(e.CommandName == "SuaPhong")
            {
                romID = Convert.ToInt32(e.CommandArgument);
                if (romID>0)
                {
                    btnThemPhong.Text = "Lưu";
                    DataTable da = getPhongId(romID);
                    ddlTenKhachSan.SelectedItem.Text = da.Rows[0]["MaKhachSan"].ToString();
                    txtTenPhong.Text = da.Rows[0]["TenPhong"].ToString();
                    txtDonGia.Text = da.Rows[0]["DonGia"].ToString();
                }
            }
        }


        protected void btnThemPhong_Click(object sender, EventArgs e)
        {
            con = new SqlConnection(cnn);
            if(btnThemPhong.Text=="Thêm")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("insert_Phong", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@TenPhong", txtTenPhong.Text.Trim());
                cmd.Parameters.AddWithValue("@DonGia", txtDonGia.Text.Trim());
                cmd.Parameters.AddWithValue("@MaKhachSan", ddlTenKhachSan.Text.Trim());
                int ketqua = cmd.ExecuteNonQuery();
                if (ketqua > 0)
                {
                    Response.Write("<script>alert('Them thanh cong')</script>");
                }
                con.Close();
                reset();
            }
            //if (btnThemPhong.Text == "Lưu")
            //{
            //    //con.Open();
            //    //SqlCommand cmd = new SqlCommand("update_Phong", con);
            //    //cmd.CommandType = CommandType.StoredProcedure;
            //    //cmd.Parameters.AddWithValue("@MaPhong", romID);
            //    //cmd.Parameters.AddWithValue("@TenPhong", txtTenPhong.Text.Trim());
            //    //cmd.Parameters.AddWithValue("@DonGia", Convert.ToInt32(txtDonGia.Text));
            //    //cmd.Parameters.AddWithValue("@MaKhachSan", ddlTenKhachSan.Text.Trim());

            //    //int ketqua = cmd.ExecuteNonQuery();
            //    //if (ketqua > 0)
            //    //{
            //    //    Response.Write("<script>alert('Sửa thành công')</script>");
            //    //}
            //    //con.Close();
            //    //reset();
            //}
                if (btnThemPhong.Text == "Lưu")
                {
                    using (SqlConnection con = new SqlConnection(cnn))
                    {
                        if (con.State == ConnectionState.Closed)
                            con.Open();

                        using (SqlCommand cmd = new SqlCommand("Update_Phong", con))
                        {
                            cmd.CommandType = CommandType.StoredProcedure;
                            cmd.Parameters.AddWithValue("@MaPhong", romID);
                            cmd.Parameters.AddWithValue("@MaKhachSan", ddlTenKhachSan.Text.Trim());
                            cmd.Parameters.AddWithValue("@TenPhong", txtTenPhong.Text.Trim());
                            cmd.Parameters.AddWithValue("@DonGia", Convert.ToInt32(txtDonGia.Text));
                            cmd.ExecuteNonQuery();
                        if (cmd.ExecuteNonQuery() > 0)
                        {
                            Response.Write("<script>alert('Sửa thành công')</script>");
                        }
                        reset();
                        }
                    }
                }
        }

        private void reset()
        {
            btnThemPhong.Text = "Thêm";
            loadDataRptPhong();
            loadDropTenKhachSan();
            txtTenPhong.Text = "";
            txtDonGia.Text = "";
        }

        protected void btnHuyPhong_Click(object sender, EventArgs e)
        {
            reset();
        }
        //protected void btnUpdate_Click(object sender, EventArgs e)
        //{
        //    RoomModel1 room = new RoomModel1();
        //    room.MaPhong = Convert.ToInt32(update_roomId.Value);
        //    room.MaKhachSan = Convert.ToInt32(update_hotelName.SelectedValue);
        //    room.TenKhachSan = update_hotelName.Text;
        //    room.TenPhong = update_roomName.Text;
        //    room.DonGia = float.Parse(update_price.Text);
        //    IList<HttpPostedFile> files = update_image.PostedFiles;
        //    Helpers.MultiUploadFile(files);
        //}


        //protected void btnAdd_Click(object sender, EventArgs e)
        //{
        //    RoomModel1 room = new RoomModel1();
        //    room.MaKhachSan = Convert.ToInt32(add_nameHotel.SelectedValue);
        //    room.TenKhachSan = add_nameHotel.Text;
        //    room.TenPhong = add_nameRoom.Text;
        //    room.DonGia = float.Parse(add_price.Text);
        //    IList<HttpPostedFile> files = add_images.PostedFiles;
        //    Helpers.MultiUploadFile(files);
        //}
    }
}