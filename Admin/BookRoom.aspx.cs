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
    public partial class BookRoom : System.Web.UI.Page
    {
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;
        string cnn = WebConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString;
        SqlConnection con;
        private static int donDatphongID;

        protected void Page_Load(object sender, EventArgs e)
        {
            ddlKhachHang.Enabled = false;
            Session["typeNav"] = "bookroom";
            if (IsPostBack) return;
            loadDataRept();
            loadDropKhachHang();
        }



        private void loadDataRept()
        {
            con = new SqlConnection(cnn);
            con.Open();
            try
            {
                string sql = "Select * from DonDatPhong";
                cmd = new SqlCommand(sql, con);
                da = new SqlDataAdapter(cmd);
                ds = new DataSet();
                da.Fill(ds);
                rptDonDatPhong.DataSource = ds;
                rptDonDatPhong.DataBind();
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
        //    cmd.Connection = con;
        //    cmd.CommandText = "select * from Phong";
        //    SqlDataAdapter dataAdapter = new SqlDataAdapter(cmd);
        //    ds = new DataSet();
        //    dataAdapter.Fill(ds);
        //    ddlPhong.DataSource = ds;
        //    ddlPhong.DataTextField = "TenPhong";
        //    ddlPhong.DataValueField = "MaPhong";
        //    ddlPhong.DataBind();
        //}
        private void loadDropKhachHang()
        {
            cmd.Connection = con;
            cmd.CommandText = "select * from KhachHang";
            SqlDataAdapter dataAdapter = new SqlDataAdapter(cmd);
            ds = new DataSet();
            dataAdapter.Fill(ds);
            ddlKhachHang.DataSource = ds;
            ddlKhachHang.DataTextField = "TenKhachHang";
            ddlKhachHang.DataValueField = "MaKhachHang";
            ddlKhachHang.DataBind();
        }

        private bool CheckDonDatPhong(int dondat)
        {
            con = new SqlConnection(cnn);
            SqlCommand cmd = new SqlCommand("Select * from DonDatPhong,ChiTietDonDatPhong where DonDatPhong.MaDonDat = '" + dondat + "'and DonDatPhong.MaDonDat = ChiTietDonDatPhong.MaDonDat ", con);
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


        private DataTable getDoDatphongId(int id)
        {
            con = new SqlConnection(cnn);
            SqlCommand cmd = new SqlCommand("Select KhachHang.TenKhachHang,Khachhang.MaKhachHang ,DonDatPhong.MaDonDat, DonDatPhong.NgayBatDau, DonDatPhong.NgayKetThuc, DonDatPhong.SoLuongNguoiLon, DonDatPhong.SoLuongTreEm, DonDatPhong.TrangThai from DonDatPhong,KhachHang where DonDatPhong.MaDonDat = '" + id + "' and  DonDatPhong.MaKhachHang = KhachHang.MaKhachHang ", con);
            cmd.CommandType = CommandType.Text;
            SqlDataAdapter dataAdapter = new SqlDataAdapter(cmd);
            DataTable dataTable = new DataTable();
            dataAdapter.Fill(dataTable);

            return dataTable;

        }
        protected void rptDonDatPhong_ItemCommand1(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Chitiet")
            {
                Response.Redirect("~/Admin/Chitiet.aspx?id=" + Convert.ToInt32(e.CommandArgument));
            }
            if (e.CommandName == "Xoa")
            {
                con = new SqlConnection(cnn);
                if (CheckDonDatPhong(Convert.ToInt32(e.CommandArgument)))
                {
                    try
                    {
                        con.Open();
                        SqlCommand cmd = new SqlCommand("delete_DonDatPhong", con);
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@MaDonDatPhong", Convert.ToInt32(e.CommandArgument));
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
            if (e.CommandName == "Sua")
            {
                donDatphongID = Convert.ToInt32(e.CommandArgument);
                if (donDatphongID > 0)
                {
                    btnThem.Text = "Lưu";
                    DataTable da = getDoDatphongId(donDatphongID);
                    ddlKhachHang.SelectedItem.Text = da.Rows[0]["TenKhachHang"].ToString();
                    txtNgayBD.Text = string.Format("{0 :yyyy-MM-dd}", Convert.ToDateTime(da.Rows[0]["NgayBatDau"]));
                    txtNgayKT.Text = string.Format("{0 :yyyy-MM-dd}", Convert.ToDateTime(da.Rows[0]["NgayKetThuc"]));
                    txtSoNguoiLon.Text = da.Rows[0]["SoLuongNguoiLon"].ToString();
                    txtSoTreEm.Text = da.Rows[0]["SoLuongTreEm"].ToString();
                    if (Convert.ToBoolean(da.Rows[0]["MaKhachHang"]) == true)
                    {
                        rdbDaThanhToan.Checked = true;
                    }
                    else
                        rdChuaThanhToan.Checked = true;
                }
            }
            if (e.CommandName == "Xoa")
            {
                con = new SqlConnection(cnn);
                if (CheckDonDatPhong(Convert.ToInt32(e.CommandArgument)))
                {
                    try
                    {
                        con.Open();
                        SqlCommand cmd = new SqlCommand("delete_DonDatPhong", con);
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@MaDonDatPhong", Convert.ToInt32(e.CommandArgument));
                        cmd.ExecuteNonQuery();
                        if (cmd.ExecuteNonQuery() > 0)
                        {
                            Response.Write("<script>alert('Thông báo')</script>");
                        }
                        loadDataRept();
                        con.Close();
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
        }

        protected void reset()
        {
            btnThem.Text = "Thêm";
            loadDataRept();
            loadDropKhachHang();
            txtNgayBD.Text = "";
            txtNgayKT.Text = "";
            txtSoNguoiLon.Text = "";
            txtSoTreEm.Text = "";
            rdChuaThanhToan.Checked = true;
        }

        protected void btnThem_Click(object sender, EventArgs e)
        {
            if (btnThem.Text == "Lưu")
            {
                using (SqlConnection con = new SqlConnection(cnn))
                {
                    if (con.State == ConnectionState.Closed)
                        con.Open();

                    using (SqlCommand cmd = new SqlCommand("Update_DonDat", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@MaDonDat", donDatphongID);
                        cmd.Parameters.AddWithValue("@NgayKetThuc", Convert.ToDateTime(txtNgayKT.Text));
                        cmd.Parameters.AddWithValue("@SoNguoiLon", Convert.ToInt32(txtSoNguoiLon.Text));
                        cmd.Parameters.AddWithValue("@SoTreEm", Convert.ToInt32(txtSoTreEm.Text));
                        if (rdbDaThanhToan.Checked)
                            cmd.Parameters.AddWithValue("@TrangThai", 1);
                        if (rdChuaThanhToan.Checked)
                            cmd.Parameters.AddWithValue("@TrangThai", 0);
                        cmd.ExecuteNonQuery();
                        reset();
                    }
                }
            }
        }

        private DataTable getKhachhang(int makhachhang)
        {
            using(SqlConnection con = new SqlConnection(cnn))
            {
                using(SqlCommand cmd = new SqlCommand("select * from KhachHang where MaKhachHang =" + makhachhang, con))
                {
                    cmd.CommandType = CommandType.Text;
                    using(SqlDataAdapter apt = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        apt.Fill(dt);
                        return dt;
                    }
                }
            }
        }
        protected void rptDonDatPhong_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if(e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                DataRowView row = (DataRowView)e.Item.DataItem;
                if (row != null)
                {
                    Literal ltrKhachhang = e.Item.FindControl("ltrTenkhachhang") as Literal;
                    DataTable dt = getKhachhang(Convert.ToInt32(row
                        ["MaKhachHang"]));
                    if (dt.Rows.Count > 0)
                        ltrKhachhang.Text = dt.Rows[0]["TenKhachHang"].ToString();
                }
            }
        }
    }
}