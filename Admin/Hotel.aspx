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
            checked />
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
                <div class="row-container" id="card-info">
                    <div class="card card-list col-10">
                        <div class="title">Sửa khách sạn</div>
                        <div class="form">
                            <input type="hidden" name="type" value="updateHotel" />
                            <div class="form-group">
                                <label for="name">Tên khách sạn</label>
                                <asp:DropDownList name="name" runat="server" id="update_nameHotel">
                                    <asp:ListItem value="1">Khách sạn 1</asp:ListItem>
                                     <asp:ListItem value="2">Khách sạn 2</asp:ListItem>
                                     <asp:ListItem value="3">Khách sạn 3</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="form-group">
                                <label for="image">Ảnh khách sạn</label>
                                <asp:FileUpload runat="server"
                                    type="file"
                                    ID="update_image"
                                    name="image"
                                    onchange="handleOnChangeInputImage(this,'imagesUpdate')" />
                                <div class="image" id="imagesUpdate">
                                    <!-- <img id="print-picture" src="../assets/images/photos-hotel/logo_4_1009828.jpg" alt=""> -->
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="address">Địa chỉ</label>
                                <asp:TextBox
                                    runat="server"
                                    type="text"
                                    ID="update_Address"
                                    placeholder="Địa chỉ" />
                            </div>
                            <div class="form-group">
                                <label for="number">Số lượng phòng</label>
                                <asp:TextBox
                                    runat="server"
                                    type="number"
                                    ID="update_number"
                                    placeholder="Số lượng phòng" />
                            </div>
                            <div class="form-group">
                                <label for="description">Mô tả</label>
                                <textarea id="description" rows="5"></textarea>
                            </div>
                            <div class="card-footer">
                                <button class="btn btn-dash">Hủy</button>
                                <asp:Button runat="server" OnClick="updateHotel_Click" ID="updateHotel" CssClass="btn btn-primary" Text="Thêm hoặc Sửa"></asp:Button>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <section id="new" class="tab-panel">
                <div class="card card-info col-12">
                    <div class="title">Thông tin khách sạn</div>
                    <div class="form">
                        <input type="hidden" name="type" value="addHotel" />
                        <div class="form-group">
                            <label for="name">Tên khách sạn</label>
                            <asp:TextBox runat="server"
                                type="text"
                                ID="add_nameHotel"
                                placeholder="Tên khách sạn" />
                        </div>
                        <div class="form-group">
                            <label for="image">Ảnh khách sạn</label>
                            <asp:FileUpload runat="server"
                                type="file"
                                name="image"
                                ID="add_imageHotel"
                                onchange="handleOnChangeInputImage(this,'imagesAdd')" />
                            <div class="image" id="imagesAdd">
                                <!-- <img id="print-picture" src="../assets/images/photos-hotel/logo_4_1009828.jpg" alt=""> -->
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="address">Địa chỉ</label>
                            <asp:TextBox runat="server"
                                type="text"
                                name="address"
                                ID="add_addressHotel"
                                placeholder="Địa chỉ" />
                        </div>
                        <div class="form-group">
                            <label for="number">Số lượng phòng</label>
                            <asp:TextBox runat="server"
                                type="number"
                                name="number"
                                ID="add_numberHotel"
                                placeholder="Số lượng phòng" />
                        </div>
                        <div class="form-group">
                            <label for="description">Mô tả</label>
                            <textarea name="description" rows="5"></textarea>
                        </div>
                        <div class="card-footer">
                            <button class="btn btn-dash">Hủy</button>
                            <asp:Button ID="addHotel" OnClick="addHotel_Click" runat="server" Text="Thêm hoặc Sửa" CssClass="btn btn-primary"></asp:Button>
                        </div>
                    </div>
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
              <td><img id="print-picture" src="/Content/assets/images/photos-hotel/logo_4_1009828.jpg" alt=""></td>
              <td>Khách sạn ${index} </td>
              <td>Địa chỉ</td>
              <td>${index}</td>
              <td style="display:flex">
                  <div class="scroll-card-info">Sửa</div> <button>Xóa</button>
              </td>
          </tr>`;
        }
        tableFill.innerHTML = element;
    </script>
</asp:Content>
