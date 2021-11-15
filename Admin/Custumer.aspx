<%@ Page Title="" Language="C#" MasterPageFile="~/LayoutAdmin.Master" AutoEventWireup="true" CodeBehind="Custumer.aspx.cs" Inherits="WebNCASP.Admin.Custumer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
   <link href="../Content/assets/css/admin/hotel.css" rel="stylesheet" />
    <div class="row-container">
                    <div class="card card-list col-10">
                        <div class="title">Danh sách khách hàng</div>
                        <div class="tbl-header">
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
                        </div>
                        <div class="tbl-content">
                            <table cellpadding="0" cellspacing="0" border="0">
                                <tbody id="table-fill">
                                </tbody>
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
