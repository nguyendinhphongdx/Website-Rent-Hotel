<%@ Page Title="" Language="C#" MasterPageFile="~/LayoutAdmin.Master" AutoEventWireup="true" CodeBehind="BookRoom.aspx.cs" Inherits="WebNCASP.Admin.BookRoom" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
  <link href="../Content/assets/css/admin/hotel.css" rel="stylesheet" />
    <div class="row-container">
            <div class="card card-list col-10">
              <div class="title">Danh sách đơn đặt phòng</div>
              <div class="tbl-header">
                <table cellpadding="0" cellspacing="0" border="0">
                  <thead>
                    <tr>
                      <th>STT</th>
                      <th>Tên khách hàng</th>
                      <th>Tên khách sạn</th>
                      <th>Số phòng</th>
                      <th>Trạng thái</th>
                      <th>Hành Động</th>
                    </tr>
                  </thead>
                </table>
              </div>
              <div class="tbl-content">
                <table cellpadding="0" cellspacing="0" border="0">
                  <tbody id="table-fill"></tbody>
                </table>
              </div>
            </div>
          </div>
          <div class="row-container" id="card-info">
            <div class="card card-list col-10">
              <div class="title">Thông tin đơn đặt</div>
              <form class="form">
                <div class="form-group">
                  <label for="name">khách sạn</label>
                  <select name="name">
                    <option>Khách sạn 1</option>
                    <option>Khách sạn 2</option>
                    <option>Khách sạn 3</option>
                  </select>
                </div>
                <div class="form-group">
                    <label for="name">khách hàng</label>
                    <select name="name">
                      <option>Khách hàng 1</option>
                      <option>Khách hàng 2</option>
                      <option>Khách hàng 3</option>
                    </select>
                  </div>
                <div class="form-group">
                  <label for="nameRoom">Phòng 1</label>
                  <select name="nameRoom">
                    <option>Phòng 1</option>
                    <option>Phòng 1</option>
                    <option>Phòng 1</option>
                  </select>
                </div>
                <div class="form-group">
                    <label for="nameRoom">Phòng 2</label>
                    <select name="nameRoom">
                      <option>Phòng 1</option>
                      <option>Phòng 1</option>
                      <option>Phòng 1</option>
                    </select>
                  </div>
                <div class="form-group">
                  <label for="startDate">Ngày bắt đầu</label>
                  <input
                    type="date"
                    id="startDate"
                    placeholder="Ngày bắt đầu"
                  />
                </div>
                <div class="form-group">
                  <label for="endDate">Ngày kết thúc</label>
                  <input type="date" id="endDate" placeholder="Ngày kết thúc" />
                </div>
                <div class="form-group">
                  <label for="price">Người lớn</label>
                  <input type="number" id="person" placeholder="Số người lớn" />
                </div>
                <div class="form-group">
                  <label for="number">Trẻ em</label>
                  <input type="number" id="number" placeholder="Số trẻ em" />
                </div>
                <div class="form-group">
                  <label for="description">Ghi chú</label>
                  <textarea id="description" rows="5"></textarea>
                </div>
                <div class="card-footer">
                  <button class="btn btn-dash">Hủy</button>
                  <button class="btn btn-primary">Thêm đơn</button>
                </div>
              </form>
            </div>
          </div>
<script>
  const tableFill = document.getElementById("table-fill");
  var element = "";
  for (let index = 0; index < 10; index++) {
    element += `<tr>
            <td> ${index} </td>
            <td>Khách hàng ${index} </td>
            <td>Khách sạn ${index} </td>
            <td>${index}</td>
            <td>${index%2==0?"Đã thanh toán":"Chưa thanh toán"}</td>
           <td style="display:flex">
                  <div class="scroll-card-info">Sửa</div> <button>Xóa</button>
              </td>
        </tr>`;
  }
  tableFill.innerHTML = element;
</script>
</asp:Content>
