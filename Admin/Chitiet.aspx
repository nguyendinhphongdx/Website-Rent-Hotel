<%@ Page Title="" Language="C#" MasterPageFile="~/LayoutAdmin.Master" AutoEventWireup="true" CodeBehind="Chitiet.aspx.cs" Inherits="WebNCASP.Admin.Chitiet" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="../Content/assets/css/admin/hotel.css" rel="stylesheet" />
    <style>        
        .ma {
     
        }
    </style>
    <div class="row-container">
        <asp:Button ID="btnBack" runat="server" Text="Trở về" OnClick="btnBack_Click" />
        <div class="card card-list col-10">
            <div class="title">Danh sách đơn đặt phòng</div>
            <div class="tbl-header">
                <table cellpadding="0" cellspacing="0" border="0">
                    <tr>
                        <td>Mã đơn đặt</td>
                        <td>Tên Phòng</td>
                        <td>Số giường</td>
                       <%-- <td>Sửa</td>--%>
                        <td>Xóa</td>
                    </tr>
                </table>
            </div>

            <asp:Repeater ID="rptChitiet" runat="server" OnItemCommand="rptChitiet_ItemCommand">

                <HeaderTemplate>

                </HeaderTemplate>
                <ItemTemplate>
                    <table class="tbl-fill" cellpadding="0" cellspacing="0" border="0">
                        <tr>
                            <td><%#Eval("MaDonDat") %> </td>
                            <td><%#Eval("TenPhong") %> </td>
                             <td><%#Eval("SoGiuong") %> </td>
                            <%--<td>
                                <asp:Button ID="btnSua" runat="server" Text="Sửa" CommandName="Sua" CommandArgument='<%#Eval("MaDonDat") %> ' /></td>--%>
                            <td>
                                <asp:Button ID="btnXoa" runat="server" Text="Xóa" CommandName="Xoa" CommandArgument='<%#Eval("MaDonDat") %> ' /></td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:Repeater>

        </div>
    </div>
  <%--  <div class="row-container" id="card-info">
        <div class="card card-list col-10">
            <div class="title">Thông tin đơn đặt</div>
            <div class="form-group">
                <asp:Label ID="Label1" runat="server" Text="Mã đơn đặt"></asp:Label>
                <asp:TextBox ID="txtdondat" runat="server"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Label ID="Label2" runat="server" Text="Tên phòng"></asp:Label>
                <asp:DropDownList ID="ddlPhong" runat="server"></asp:DropDownList>
            </div>
            <div class="form-group">
            <asp:Label ID="Label5" runat="server" Text="Số giường"></asp:Label>
                <asp:TextBox ID="txtSoGiuong" runat="server"></asp:TextBox>
                </div>
            <div class="card-footer">
                <asp:Button ID="btnHuy" runat="server" Text="Hủy" CssClass="btn btn-dash" />
                <asp:Button ID="btnThem" runat="server" Text="Thêm" CssClass="btn btn-primary" OnClick="btnThem_Click" /><br />
            </div>
        </div>
    </div>--%>

</asp:Content>
