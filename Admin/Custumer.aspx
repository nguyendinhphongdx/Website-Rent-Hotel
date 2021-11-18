<%@ Page Title="" Language="C#" MasterPageFile="~/LayoutAdmin.Master" AutoEventWireup="true" CodeBehind="Custumer.aspx.cs" Inherits="WebNCASP.Admin.Custumer" enableEventValidation="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
   <link href="../Content/assets/css/admin/hotel.css" rel="stylesheet" />
    <div class="row-container">
                    <div class="card card-list col-10">
                        <div class="title">Danh sách khách hàng</div>
                        <%--<div class="tbl-header">
                            <table cellpadding="0" cellspacing="0" border="0">
                                <thead>
                                    <tr>
                                        <th>STT</th>
                                        <th>Tên khách hàng</th>
                                        <th>Số điện thoại</th>
                                        <th>CMND</th>
                                        <th>Tài khoản</th>
                                        <th>Mật khẩu</th>
                                        <th>Hành động</th>
                                    </tr>
                                </thead>
                            </table>
                        </div>--%>
                        <div class="tbl-content">
                           <%-- <table cellpadding="0" cellspacing="0" border="0">
                                <tbody id="table-fill">
                                </tbody>
                            </table>--%>
                            <div class="tbl-header">
                            <table cellpadding="0" cellspacing="0" border="0">

                                <tr>
                                            <td>Mã Khách Hàng</td>
                                             <td>Tên Khách Hàng</td>
                                             <td>Số điện thoại</td>
                                             <td>Email</td>
                                             <td>CMND</td>
                                             <td>Mật khẩu</td>
                                             <td>Mã Tài Khoản</td>
                                             <td>Sửa</td>
                                             <td>Xóa</td>
                                </tr>
                                </table>
                                </div>
                            <table cellpadding="0" cellspacing="0" border="0">
                                <asp:ListView runat="server" ID="listViewKH" >
                                
                                    <ItemTemplate>
                                        <tr>
                                            <td><%#Eval("MaKhachHang") %></td>
                                             <td><%#Eval("TenKhachHang") %></td>
                                             <td><%#Eval("Sdt") %></td>
                                             <td><%#Eval("Email") %></td>
                                             <td><%#Eval("Cmnd") %></td>
                                             <td><%#Eval("Matkhau") %></td>
                                             <td><%#Eval("MaTaiKhoan") %></td>
                                             <td><asp:Button runat="server" ID="btn_Sua" Text="Sửa" CommandArgument='<%#Eval("MaKhachHang") %>' OnClick="btn_Sua_Click"/></td>
                                             <td><asp:Button runat="server" ID="btn_Xoa" Text="Xóa" CommandArgument='<%#Eval("MaKhachHang") %>' OnClick="btn_Xoa_Click"/></td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:ListView>
                            </table>
                        </div>
                    </div>
                   
                   </div>
    <script>
    const tableFill = document.getElementById("table-fill");
    var element = "";
    for (let index = 0; index < 10; index++) {
      element += `<tr>
              <td> ${index} </td>
              <td>Khách hàng ${index} </td>
              <td> 0352337342A </td>
              <td>001200028407</td>
              <td>DINHPHONG</td>
              <td>****</td>
             <td style="display:flex">
                  <div class="scroll-card-info">Sửa</div> <button>Xóa</button>
              </td>
          </tr>`;
    }
    tableFill.innerHTML = element;
    </script>
</asp:Content>
