<%@ Page Title="" Language="C#" MasterPageFile="~/LayoutC2.Master" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="BookRoom.aspx.cs" Inherits="WebNCASP.Customer.BookRoom" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .box-option {
            display: none
        }

        td {
            text-align: center;
        }
    </style>
     <asp:UpdatePanel runat="server" ID="UpdatePanel1">
        <ContentTemplate>
    <% if (isEmpty)
        { %>
   
            <div class="container-pay">
                <div class="bill">
                    <div class="timer-pay">
                        <p class="timer">Hóa đơn trống</p>
                    </div>
                </div>
            </div>

            <%}
        else
        { %>
            <div class="container-pay">
                <div class="bill">
                    <div class="timer-pay">
                        <i class="far fa-clock"></i>
                        <p class="time">Thời gian hoàn tất thanh toán</p>
                        <p class="timer">14:03</p>
                    </div>
                    <div class="card infor-bill">
                        <div class="image">
                            <asp:Image runat="server" ID="imageHotel" />
                        </div>
                        <div class="infor-right">
                            <div class="name">
                                <asp:Label runat="server" ID="nameHotel" />
                            </div>
                            <div class="row">
                                <div class="col">
                                    <div class="title">Nhận phòng</div>
                                    <div class="value">
                                        <asp:Label runat="server" ID="startDate" />
                                    </div>
                                </div>
                                <div class="col">
                                    <div class="title">Trả phòng</div>
                                    <div class="value">
                                        <asp:Label runat="server" ID="endDate" />
                                    </div>
                                </div>
                                <div class="col">
                                    <div class="title">Số đêm</div>
                                    <div class="value">
                                        <%# night %>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card info-contact">
                        <div class="title">Thông tin liên hệ</div>
                        <div class="row">
                            <div class="col">
                                <label for="name">Họ tên *</label>
                                <asp:TextBox runat="server" ID="name" type="text" placeholder="Họ tên" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <label for="phone">Số điện thoại *</label>
                                <asp:TextBox runat="server" type="text" ID="phone" placeholder="Số điện thoại" />
                            </div>
                            <div class="col">
                                <label for="email">Email *</label>
                                <asp:TextBox runat="server" type="email" ID="email" placeholder="Email" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <label for="phone">Số người lớn</label>
                                <asp:TextBox runat="server" type="number" ID="numberParent" placeholder="Số lượng người lớn" />
                            </div>
                            <div class="col">
                                <label for="email">Số lượng trẻ em</label>
                                <asp:TextBox runat="server" type="number" ID="numberChild" placeholder="Số lượng trẻ em" />
                            </div>
                        </div>
                    </div>
                    <div class="card require">
                        <div class="title">Yêu cầu đặc biệt</div>
                        <p>chọn loại giường</p>
                        <div class="row bed">
                            <div class="check-item">
                                <input type="radio" class="option-input radio" name="example" checked />
                                <i class="fas fa-bed"></i>
                                <p>1 giường</p>
                            </div>
                            <div class="check-item">
                                <input type="radio" class="option-input radio" name="example" checked />
                                <i class="fas fa-bed"></i>
                                <p>2 giường</p>
                            </div>
                        </div>

                        <div class="row row-require">
                            <p>Yêu cầu đặc biệt</p>
                            <i class="far fa-plus-square"></i>
                        </div>
                        <div class="row row-require">
                            <p>Xuất hóa đơn</p>
                            <i class="far fa-plus-square"></i>
                        </div>
                    </div>
                    <div class="card pay">
                        <div class="title">Phương thức thanh toán</div>
                        <div class="sub-title">
                            Sau khi hoàn tất thanh toán, mã xác nhận phòng sẽ được gửi ngay qua SMS và Email
                của bạn
                        </div>
                        <div class="pay-item">
                            <p>Thanh toán QR-PAY</p>
                            <div class="check-item">
                                <input type="radio" class="option-input radio" name="method-pay" checked />
                            </div>
                        </div>
                        <div class="pay-item">
                            <p>Thẻ ATM/Tài khoản ngân hàng</p>
                            <div class="check-item">
                                <input type="radio" class="option-input radio" name="method-pay" checked />
                            </div>
                        </div>
                        <div class="pay-item">
                            <p>Thẻ Visa/ Master Card</p>
                            <div class="check-item">
                                <input type="radio" class="option-input radio" name="method-pay" checked />
                            </div>
                        </div>
                        <div class="pay-item">
                            <p>Chuyển khoản ngân hàng</p>
                            <div class="check-item">
                                <input type="radio" class="option-input radio" name="method-pay" checked />
                            </div>
                        </div>
                        <div class="pay-item pay">
                            <asp:Button runat="server" OnClick="btnPay_Click" ID="btnPay" class="btn-pay" Text="Thanh toán" />
                        </div>
                    </div>
                </div>
                <div class="card-detail">
                    <div class="card detail-room">
                        <asp:Repeater runat="server" ID="Repeater_RoomSelected">
                            <ItemTemplate>

                                <div class="image">
                                    <img src="/Content/upload/<%#GetFirstImageRoom(Container.DataItem) %>" alt="">
                                </div>
                                <div class="name" style="text-align: left; display: flex; justify-content: space-between">
                                    <%#Eval("TenPhong")%>
                                    <asp:LinkButton runat="server" ID="deleteItem" OnClick="deleteItem_Click" CommandArgument='<%#Eval("MaPhong")%>'>Xóa</asp:LinkButton>
                                </div>
                                <p>Đơn giá 1 đêm: <%#Eval("DonGia")%></p>
                            </ItemTemplate>
                        </asp:Repeater>

                        <div class="sub-item">
                            <i class="fas fa-user"></i>
                            <p>2 người </p>
                        </div>
                        <div class="sub-item">
                            <i class="fab fa-squarespace"></i>
                            <p>hướng thành phố </p>
                        </div>
                        <div class="sub-item">
                            <i class="far fa-id-card"></i>
                            <p>không hỗ trợ hoàn hủy</p>
                        </div>
                        <div class="sub-item">
                            <i class="fas fa-utensils"></i>
                            <p>không bao gồm bữa ăn sáng</p>
                        </div>
                        <div class="sub-item">
                            <i class="fas fa-bolt"></i>
                            <p>xác nhận ngay</p>
                        </div>
                        <div class="sub-item">
                            <p>Đừng bỏ lỡ! Chúng tôi chỉ còn 4 phòng có giá này. Hãy đặt ngay!</p>
                        </div>
                    </div>
                    <div class="card detail-pay">
                        <div class="item-detail">
                            <p class="key"><%# roomsInCart.Count+"" %> phòng x <%# night %> đêm</p>
                            <p class="value"><%# GetTotalBill() %></p>
                        </div>
                        <div class="item-detail">
                            <p class="key">Thuế và phí dịch vụ khách sạn</p>
                            <p class="value">0đ</p>
                        </div>
                        <div class="item-detail">
                            <p class="key">Gỉam trừ</p>
                            <p class="value">0đ</p>
                        </div>
                        <div class="item-detail total">
                            <div class="col">
                                <p class="key">Tổng tiền thanh toán</p>
                                <p class="sub-key">Đã bao gồm thuế, phí, VAT</p>
                            </div>
                            <p class="value"><%# GetTotalBill() %></p>
                        </div>
                        <div class="item-detail">
                            <p>Cảm ơn vì đã sử dụng dịch vụ của chúng tôi!</p>
                        </div>
                    </div>
                </div>
            </div>
            <%} %>
            <div class="container-pay">

                <div class="card" style="width: 100%">
                    <div class="title" style="font-weight: bolder;">Danh sách đơn đặt</div>
                    <table style="width: inherit;">

                        <thead>
                            <tr class="pay-item">
                                <td>Ảnh</td>
                                <td>Tên Khách Sạn</td>
                                <td>Ngày bắt đầu</td>
                                <td>Ngày kết thúc</td>
                                <td>Người lớn</td>
                                <td>Trẻ em</td>
                                <td>Số phòng</td>
                                <td>Trạng thái</td>
                            </tr>
                        </thead>

                        <asp:Repeater runat="server" ID="Repeater_BillInParted">
                            <HeaderTemplate>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr class="pay-item">
                                    <td>
                                        <img src="/Content/upload/<%# Eval("Anh") %>" style="width: 100px; height: 100px" />

                                    </td>
                                    <td><%# Eval("TenKhachSan") %></td>
                                    <td><%# Eval("NgayBatDau") %></td>
                                    <td><%# Eval("NgayKetThuc") %></td>
                                    <td><%# Eval("SoLuongNguoiLon") %></td>
                                    <td><%# Eval("SoLuongTreEm") %></td>
                                    <td><%# Eval("SoLuongPhong") %></td>
                                    <td><%# Convert.ToInt32(Eval("TrangThai"))==1?"Đã thanh toán":"Chưa thanh toán" %></td>
                                    <td>
                                        <asp:LinkButton runat="server" ID="Delete" CommandArgument='<%# Eval("MaDonDat") %>' OnCommand="Delete_Command">Delete</asp:LinkButton></td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </table>
                </div>
            </div>

        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>
