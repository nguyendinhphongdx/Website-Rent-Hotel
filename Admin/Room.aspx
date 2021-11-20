<%@ Page Title="" Language="C#" MasterPageFile="~/LayoutAdmin.Master" AutoEventWireup="true" CodeBehind="Room.aspx.cs" Inherits="WebNCASP.Admin.Room" EnableEventValidation="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="../Content/assets/css/admin/hotel.css" rel="stylesheet" />
<%--    <div class="tabset">--%>
       <%-- <!-- Tab 1 -->
        <input type="radio" name="tabset" id="tab1" aria-controls="list" checked>
        <label for="tab1">Danh sách</label>
        <!-- Tab 2 -->
        <input type="radio" name="tabset" id="tab2" aria-controls="new">
        <label for="tab2">Thêm phòng</label>--%>
                    
         <div class="row-container">
            <div class="card card-list col-10">
             <div class="title">Danh sách phòng</div>
              <div class="tbl-header">
                <table cellpadding="0" cellspacing="0" border="0">
                    <tr>
                      <td>Tên khách sạn</td>
                        <td>Tên phòng</td>
                      <td>Đơn giá</td>
                      <td>Sửa</td>
                      <td>Xóa</td>
                    </tr>
                  
                </table>
              </div>
       <asp:Repeater ID="rptPhong" runat="server" OnItemCommand="Repeater1_ItemCommand">
           <HeaderTemplate>
            </HeaderTemplate>          
            <ItemTemplate>
                
                  <table class="tbl-fill" cellpadding="0" cellspacing="0" border="0">
                <tr>
                    <td><%#Eval("TenKhachSan") %> </td>
                   <%-- <td><%#Eval("MaPhong") %> </td>--%>
                     <td><%#Eval("TenPhong") %> </td>
                    <td><%#Eval("DonGia") %> </td>
                  
                    <td><asp:Button ID="btnSuaPhong" runat="server" Text="Sửa" CommandName="SuaPhong" CommandArgument='<%#Eval("MaPhong") %> '/></td>
                    <td><asp:Button ID="btnXoaPhong" runat="server" Text="Xóa" CommandName="XoaPhong" CommandArgument='<%#Eval("MaPhong") %> '/></td>
                </tr>             
                    </table>                                      
            </ItemTemplate>
       </asp:Repeater>
      
             
            </div>
            </div>
          <div class="row-container" id="card-info">
            <div class="card card-list col-10">
              <div class="title">Thông tin đơn đặt</div>
              <form class="form">
               <div class="form-group">         
                  </div>
                <div class="form-group">
                 <asp:Label ID="lblKhachSan" runat="server" Text="Tên khách sạn"></asp:Label>
                  <asp:DropDownList ID="ddlTenKhachSan" runat="server"></asp:DropDownList>
                </div>
             
<%--                <div class="form-group">
                   <asp:Label ID="Label2" runat="server" Text="Ma phòng"></asp:Label>
                  <asp:TextBox ID="txtMaPhong" runat="server"  ></asp:TextBox>
                </div>--%>
                  <div class="form-group">
                 <asp:Label ID="Label6" runat="server" Text="Tên phòng"></asp:Label>
                  <asp:TextBox ID="txtTenPhong" runat="server"></asp:TextBox>
                     
                </div>
                <div class="form-group">
                  <asp:Label ID="Label5" runat="server" Text="Đơn giá"></asp:Label>
                  <asp:TextBox ID="txtDonGia" runat="server"  ></asp:TextBox>
     
                </div>
                

                <div class="card-footer">
                    <asp:Button ID="btnHuyPhong" runat="server" Text="Hủy" CssClass="btn btn-dash" OnClick="btnHuyPhong_Click"/>
                    <asp:Button ID="btnThemPhong" runat="server" Text="Thêm" CssClass="btn btn-primary" OnClick="btnThemPhong_Click" /><br />
                </div>
              </form>
            </div>
          </div>
</asp:Content>

