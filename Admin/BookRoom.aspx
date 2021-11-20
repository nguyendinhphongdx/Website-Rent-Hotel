<%@ Page Title="" Language="C#" MasterPageFile="~/LayoutAdmin.Master" AutoEventWireup="true" CodeBehind="BookRoom.aspx.cs" Inherits="WebNCASP.Admin.BookRoom" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="../Content/assets/css/admin/hotel.css" rel="stylesheet" />
    <div class="row-container">
            <div class="card card-list col-10">
             <div class="title">Danh sách đơn đặt phòng</div>
              <div class="tbl-header">
                <table cellpadding="0" cellspacing="0" border="0">
                    <tr>
                      <td>Mã đơn đặt</td>
                      <td>Tên khách hàng</td>
                      <td>Ngày bắt đầu</td>
                      <td>Ngày kết thúc</td>
                       <td>Số lượng người lớn</td>
                        <td>Số lượng trẻ em</td>
                      <td>Trạng thái</td>
                        <td>Chi tiết đơn</td>
                      <td>Sửa</td>
                      <td>Xóa</td>
                    </tr>
                  
                </table>
              </div>
        
        <asp:Repeater ID="rptDonDatPhong" runat="server" OnItemCommand="rptDonDatPhong_ItemCommand1" OnItemDataBound="rptDonDatPhong_ItemDataBound"  >
                            
            <HeaderTemplate>
            </HeaderTemplate>          
            <ItemTemplate>
                
                  <table class="tbl-fill" cellpadding="0" cellspacing="0" border="0">
                <tr>
                    <td><%#Eval("MaDonDat") %></td>
                    <td><asp:Literal ID="ltrTenkhachhang" runat="server"></asp:Literal></td>
                    <td><%# string.Format("{0 :dd/MM/yyyy}",Eval("NgayBatDau")) %> </td>
                    <td><%# string.Format("{0 :dd/MM/yyyy}",Eval("NgayKetThuc")) %> </td>
                    <td><%#Eval("SoLuongNguoiLon") %> </td>
                    <td><%#Eval("SoLuongTreEm") %> </td>
                    <td><%# Convert.ToBoolean(Eval("TrangThai")) == true ? "Đã thanh toán" : "Chưa thanh toán" %> </td>
                  <td><asp:Button ID="btnChitiet" runat="server" Text="Chi tiết" CommandName="Chitiet" CommandArgument='<%#Eval("MaDonDat") %> '/></td>
                    <td><asp:Button  ID="btnSua" runat="server" Text="Sửa" CommandName="Sua" CommandArgument='<%#Eval("MaDonDat") %> '/></td>
                    <td><asp:Button ID="btnXoa" runat="server" Text="Xóa" CommandName="Xoa" CommandArgument='<%#Eval("MaDonDat") %> '/></td>
                </tr>             
                    </table>                                      
            </ItemTemplate>
        </asp:Repeater>
             
            </div>
            </div>
          <div class="row-container" id="card-info">
            <div class="card card-list col-10">
              <div class="title">Thông tin đơn đặt</div>
               <div class="form-group">
                    <asp:Label ID="Label1" runat="server" Text="Mã khách hàng"></asp:Label>  
                    <asp:DropDownList ID="ddlKhachHang" runat="server"  ></asp:DropDownList>                  
                  </div>
                <div class="form-group">
                  <asp:Label ID="Label3" runat="server" Text="Ngày bắt đầu"></asp:Label>
                  <asp:TextBox ID="txtNgayBD" runat="server" TextMode="Date"></asp:TextBox>
                </div>
                <div class="form-group">
                  <asp:Label ID="Label4" runat="server" Text="Ngày kết thúc"></asp:Label>
                  <asp:TextBox ID="txtNgayKT" runat="server" TextMode="Date"></asp:TextBox>
                </div>
                <div class="form-group">
                  <asp:Label ID="Label5" runat="server" Text="Số người lớn"></asp:Label>
                  <asp:TextBox ID="txtSoNguoiLon" runat="server"  ></asp:TextBox>
                </div>
                <div class="form-group">
                 <asp:Label ID="Label6" runat="server" Text="Số Trẻ Em"></asp:Label>
                  <asp:TextBox ID="txtSoTreEm" runat="server"></asp:TextBox>
                </div>
                  <div >
                 <asp:Label ID="Label7" runat="server" Text="Trạng Thái"></asp:Label>
                  <asp:RadioButton ID="rdChuaThanhToan" runat="server"  GroupName="TrangThai" Checked/>Chưa thanh toán
                   <asp:RadioButton ID="rdbDaThanhToan" runat="server" GroupName ="TrangThai" />Đã thanh toán
                </div>
                <div class="card-footer">
                    <asp:Button ID="btnHuy" runat="server" Text="Hủy" CssClass="btn btn-dash"/>
                    <asp:Button ID="btnThem" runat="server" Text="Thêm" CssClass="btn btn-primary" OnClick="btnThem_Click"  /><br />
                </div>
            </div>
          </div>

</asp:Content>
