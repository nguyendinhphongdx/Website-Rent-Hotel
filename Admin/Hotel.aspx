<%@ Page Title="" Language="C#" MasterPageFile="~/LayoutAdmin.Master" AutoEventWireup="true" CodeBehind="Hotel.aspx.cs" Inherits="WebNCASP.Admin.Hotel" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="../Content/assets/css/admin/hotel.css" rel="stylesheet" />
    <div class="tabset">
            <!-- Tab 1 -->
            <input
              type="radio"
              name="tabset"
              id="tab1"
              aria-controls="list"
              checked
            />
            <label for="tab1">Danh sách</label>
            <!-- Tab 2 -->
            <input type="radio" name="tabset" id="tab2" aria-controls="new" />
            <label for="tab2">Thêm khách sạn</label>

            <div class="tab-panels">
              <section id="list" class="tab-panel">
                <div class="row-container">
                  <div class="card card-list col-10">
                    <div class="title">Danh sách khách sạn</div>
                    <div class="tbl-header">
                      <table cellpadding="0" cellspacing="0" border="0">
                        <thead>
                          <tr>
                            <th class="col-1">STT</th>
                            <th>Hình ảnh</th>
                            <th>Tên khách sạn</th>
                            <th>địa chỉ</th>
                            <th>Số phòng</th>
                            <th>Hành động</th>
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
                <div class="row-container" id="card-info" >
                  <div class="card card-list col-10">
                    <div class="title">Sửa khách sạn</div>
                    <form class="form">
                      <div class="form-group">
                        <label for="name">Tên khách sạn</label>
                        <select name="name">
                          <option>Khách sạn 1</option>
                          <option>Khách sạn 2</option>
                          <option>Khách sạn 3</option>
                        </select>
                      </div>
                      <div class="form-group">
                        <label for="image">Ảnh khách sạn</label>
                        <input
                          type="file"
                          id="image"
                          onchange="handleOnChangeInputImage(this,'print-picture')"
                        />
                        <div class="image">
                          <!-- <img id="print-picture" src="../assets/images/photos-hotel/logo_4_1009828.jpg" alt=""> -->
                        </div>
                      </div>
                      <div class="form-group">
                        <label for="address">Địa chỉ</label>
                        <input
                          type="text"
                          id="address"
                          placeholder="Tên khách sạn"
                        />
                      </div>
                      <div class="form-group">
                        <label for="number">Số lượng phòng</label>
                        <input
                          type="number"
                          id="number"
                          placeholder="Số lượng phòng"
                        />
                      </div>
                      <div class="form-group">
                        <label for="description">Mô tả</label>
                        <textarea id="description" rows="5"></textarea>
                      </div>
                      <div class="card-footer">
                        <button class="btn btn-dash">Hủy</button>
                        <button class="btn btn-primary">Thêm hoặc Sửa</button>
                      </div>
                    </form>
                  </div>
                </div>
              </section>
              <section id="new" class="tab-panel">
                <div class="card card-info col-12">
                  <div class="title">Thông tin khách sạn</div>
                  <form class="form">
                    <div class="form-group">
                      <label for="name">Tên khách sạn</label>
                      <input
                        type="text"
                        id="name"
                        placeholder="Tên khách sạn"
                      />
                    </div>
                    <div class="form-group">
                      <label for="image">Ảnh khách sạn</label>
                      <input
                        type="file"
                        id="image"
                        onchange="handleOnChangeInputImage(this,'print-picture')"
                      />
                      <div class="image">
                        <!-- <img id="print-picture" src="../assets/images/photos-hotel/logo_4_1009828.jpg" alt=""> -->
                      </div>
                    </div>
                    <div class="form-group">
                      <label for="address">Địa chỉ</label>
                      <input
                        type="text"
                        id="address"
                        placeholder="Tên khách sạn"
                      />
                    </div>
                    <div class="form-group">
                      <label for="number">Số lượng phòng</label>
                      <input
                        type="number"
                        id="number"
                        placeholder="Số lượng phòng"
                      />
                    </div>
                    <div class="form-group">
                      <label for="description">Mô tả</label>
                      <textarea id="description" rows="5"></textarea>
                    </div>
                    <div class="card-footer">
                      <button class="btn btn-dash">Hủy</button>
                      <button class="btn btn-primary">Thêm hoặc Sửa</button>
                    </div>
                  </form>
                </div>
              </section>
            </div>
          </div>
    <script>
  const tableFill = document.getElementById("table-fill");
  var element = "";
  for (let index = 0; index < 10; index++) {
    element += `<tr>
              <td  class="col-1"> ${index} </td>
              <td><img id="print-picture" src="../assets/images/photos-hotel/logo_4_1009828.jpg" alt=""></td>
              <td>Khách sạn ${index} </td>
              <td>Địa chỉ</td>
              <td>${index}</td>
              <td>
                  <button class="scroll-card-info">Sửa</button> <button>Xóa</button>
              </td>
          </tr>`;
  }
  tableFill.innerHTML = element;
    </script>
</asp:Content>
