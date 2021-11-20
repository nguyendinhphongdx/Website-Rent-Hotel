using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebNCASP.Admin
{
    public partial class Chitiet : System.Web.UI.Page
    {
        private const string QUERYPHONGID = "id";
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;
        string cnn = WebConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString;
        SqlConnection con;
        private int chitietID;
        private int dondatID;
        protected void Page_Load(object sender, EventArgs e)
        {
            //txtdondat.Enabled = false;
            Session["typeNav"] = "bookroom";
            if (IsPostBack) return;
            //loadDropPhong();
            if (!string.IsNullOrEmpty(Request.QueryString[QUERYPHONGID]))
            {
                dondatID = Convert.ToInt32(Request.QueryString[QUERYPHONGID]);
                if (dondatID > 0)
                    loadDataRept(dondatID);
            }
            else
                Response.Redirect("~/BookRoom.aspx");
        }



        private void loadDataRept(int dondat)
        {
            con = new SqlConnection(cnn);
            con.Open();
            try
            {
                string sql = "Select ChiTietDonDatPhong.MaDonDat, Phong.TenPhong, ChiTietDonDatPhong.SoGiuong from ChiTietDonDatPhong, Phong where ChiTietDonDatPhong.MaPhong = Phong.MaPhong and ChiTietDonDatPhong.MaDonDat = '" + dondat + "'";
                cmd = new SqlCommand(sql, con);
                da = new SqlDataAdapter(cmd);
                ds = new DataSet();
                da.Fill(ds);
                rptChitiet.DataSource = ds;
                rptChitiet.DataBind();
                cmd.Dispose();
                con.Close();
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }
        //private void loadDropPhong()
        //{
        //    //con = new SqlConnection(cnn);
        //    //cmd.Connection = con;
        //    //cmd.CommandType = CommandType.Text;
        //    //cmd.CommandText = "select * from Phong";
        //    //SqlDataAdapter dataAdapter = new SqlDataAdapter(cmd);
        //    //ds = new DataSet();
        //    //dataAdapter.Fill(ds);
        //    //ddlPhong.DataSource = ds;
        //    //ddlPhong.DataTextField = "TenPhong";
        //    //ddlPhong.DataValueField = "MaPhong";
        //    //ddlPhong.DataBind();
        //    using(SqlConnection con = new SqlConnection(cnn))
        //    {
        //        using(SqlCommand cmd = new SqlCommand("select * from Phong", con))
        //        {
        //            cmd.CommandType = CommandType.Text;
        //            using(SqlDataAdapter apt = new SqlDataAdapter(cmd))
        //            {
        //                DataTable dt = new DataTable();
        //                apt.Fill(dt);
        //                ddlPhong.DataSource = dt;
        //                ddlPhong.DataTextField = "TenPhong";
        //                ddlPhong.DataValueField = "MaPhong";
        //                ddlPhong.DataBind();
        //            }
        //        }
        //    }
        //}

        private DataTable getChitiet(int id)
        {
            con = new SqlConnection(cnn);
            SqlCommand cmd = new SqlCommand("Select * from ChiTietDonDatPhong where ChiTietDonDatPhong.MaDonDat = '" + id + "'", con);
            cmd.CommandType = CommandType.Text;
            SqlDataAdapter dataAdapter = new SqlDataAdapter(cmd);
            DataTable dataTable = new DataTable();
            dataAdapter.Fill(dataTable);
            return dataTable;

        }

        private DataTable getPhong(int id)
        {
            con = new SqlConnection(cnn);
            SqlCommand cmd = new SqlCommand("Select * from Phong where Phong.MaPhong = '" + id + "'", con);
            cmd.CommandType = CommandType.Text;
            SqlDataAdapter dataAdapter = new SqlDataAdapter(cmd);
            DataTable dataTable = new DataTable();
            dataAdapter.Fill(dataTable);
            return dataTable;
        }
  
        protected void reset()
        {
            //btnThem.Text = "Thêm";
            loadDataRept(dondatID);
           // loadDropPhong();
        }

        protected void rptChitiet_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Xoa")
            {
                con = new SqlConnection(cnn);
                try
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("delete_Chitiet", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@MaDonDat", Convert.ToInt32(e.CommandArgument));
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
            //if (e.CommandName == "Sua")
            //{
            //    chitietID = Convert.ToInt32(e.CommandArgument);
            //    if (chitietID > 0)
            //    {
            //        btnThem.Text = "Lưu";
            //        DataTable da = getChitiet(chitietID);

            //        DataTable dataPhong = getPhong(Convert.ToInt32(da.Rows[0]["MaPhong"]));
            //        ddlPhong.SelectedItem.Text = dataPhong.Rows[0]["TenPhong"].ToString();
            //        txtdondat.Text = da.Rows[0]["MaDonDat"].ToString();
            //    }
            //}
        }

        protected void btnThem_Click(object sender, EventArgs e)
        {

        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Admin/BookRoom.aspx");
        }
    }
}