<%@ Page Title="" Language="C#" MasterPageFile="~/LayoutAdmin.Master" AutoEventWireup="true" CodeBehind="Room.aspx.cs" Inherits="WebNCASP.Admin.Room" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
  <link href="../Content/assets/css/admin/hotel.css" rel="stylesheet" />
    <div class="tabset">
                    <!-- Tab 1 -->
                    <input type="radio" name="tabset" id="tab1" aria-controls="list" checked>
                    <label for="tab1">Danh sách</label>
                    <!-- Tab 2 -->
                    <input type="radio" name="tabset" id="tab2" aria-controls="new">
                    <label for="tab2">Thêm phòng</label>
                    
                    <div class="tab-panels">
                      <section id="list" class="tab-panel">
                        <div class="row-container">
                            <div class="card card-list col-10">
                                <div class="title">Danh sách phòng</div>
                                <div class="tbl-header">
                                    <table cellpadding="0" cellspacing="0" border="0">
                                        <thead>
                                            <tr>
                                                <th>STT</th>
                                                <th>Tên khách sạn</th>
                                                <th>Tên phòng</th>
                                                <th>Số giường</th>
                                                <th>Gía 1 đêm</th>
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
                           <div class="row-container" id="card-info">
                            <div class="card card-list col-10">
                                <div class="title">Thông tin phòng</div>
                                    <div class="form-group">
                                        <label for="name">Tên khách sạn</label>
                                        <select name="name">
                                            <option>Khách sạn 1</option>
                                            <option>Khách sạn 2</option>
                                            <option>Khách sạn 3</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label for="nameRoom">Tên phòng</label>
                                        <input type="text" id="nameRoom" placeholder="Tên phòng">
                                    </div>
                                    <div class="form-group">
                                        <label for="image">Ảnh phòng</label>
                                        <input 
                                            type="file" id="image" multiple="multiple" 
                                            onchange="handleOnChangeInputImage(this,'imagesUpload')">
                                        <div class="image" id="imagesUpload">
                                            <!-- <img id="print-picture" src="../assets/images/photos-hotel/logo_4_1009828.jpg" alt=""> -->
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="price">Gía 1 đêm</label>
                                        <input type="text" id="price" placeholder="Gía 1 đêm">
                                    </div>
                                    <div class="form-group">
                                        <label for="number">Số giường</label>
                                        <input type="number" id="number" placeholder="Số lượng phòng">
                                    </div>
                                    <div class="form-group">
                                        <label for="description">Mô tả</label>
                                        <textarea id="description" rows="5" ></textarea>
                                    </div>
                                    <div class="card-footer">
                                        <button class="btn btn-dash">Hủy</button>
                                        <button class="btn btn-primary">Thêm hoặc Sửa</button>
                                    </div>
                            </div>
                           </div>
                    </section>
                      <section id="new" class="tab-panel">
                        <div class="card card-info col-12">
                            <div class="title">Thông tin phòng</div>
                                <div class="form-group">
                                    <label for="name">Tên khách sạn</label>
                                    <select name="name">
                                        <option>Khách sạn 1</option>
                                        <option>Khách sạn 2</option>
                                        <option>Khách sạn 3</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="nameRoom">Tên phòng</label>
                                    <input type="text" id="nameRoom" placeholder="Tên phòng">
                                </div>
                                <div class="form-group">
                                    <label for="image">Ảnh phòng</label>
                                    <input type="file" id="image" multiple="multiple" 
                                        onchange="handleOnChangeInputImage(this,'imagesAdd')">
                                    <div class="image" id="imagesAdd">
                                        <!-- <img id="print-picture" src="../assets/images/photos-hotel/logo_4_1009828.jpg" alt=""> -->
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="price">Gía 1 đêm</label>
                                    <input type="text" id="price" placeholder="Gía 1 đêm">
                                </div>
                                <div class="form-group">
                                    <label for="number">Số giường</label>
                                    <input type="number" id="number" placeholder="Số lượng phòng">
                                </div>
                                <div class="form-group">
                                    <label for="description">Mô tả</label>
                                    <textarea id="description" rows="5" ></textarea>
                                </div>
                                <div class="card-footer">
                                    <button class="btn btn-dash">Hủy</button>
                                    <button class="btn btn-primary">Thêm hoặc Sửa</button>
                                </div>
                        </div>
                    </section>
                    
                    </div>
                  </div>
    <script>
        const tableFill = document.getElementById("table-fill");
        var element = "";
        for (let index = 0; index < 5; index++) {
            element += `<tr>
              <td class="col-1"> ${index} </td>
              <td>Khách hàng ${index} </td>
              <td>Khách sạn ${index} </td>
              <td>${index}</td>
              <td>${index % 2 == 0 ? "Đã thanh toán" : "Chưa thanh toán"}</td>
             <td style="display:flex">
                  <div class="scroll-card-info">Sửa</div> <button>Xóa</button>
              </td>
          </tr>`;
        }
        tableFill.innerHTML = element;
    </script>
</asp:Content>

