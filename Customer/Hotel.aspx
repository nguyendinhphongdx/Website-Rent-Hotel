<%@ Page Title="" Language="C#" MasterPageFile="~/LayoutC2.Master" AutoEventWireup="true" CodeBehind="Hotel.aspx.cs" Inherits="WebNCASP.Customer.Hotel" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <asp:UpdatePanel runat="server" ID="UpdatePanel1">
      <ContentTemplate>
            <div class="path">
        <div class="item">Khách sạn</div>
        <i class="fas fa-angle-right"></i>
        <div class="item">Hà Nội</div>
        <i class="fas fa-angle-right"></i>
        <div class="item">Khách sạn A & Em Signature</div>
    </div>
    <div class="container-content">
        <div class="card-hotel">
            <div class="span">Khách sạn cách ly</div>
            <div class="header-card">
                <div class="header-left">
                    <div class="content-hotel">
                        <div class="name">
                            <asp:Label runat="server" ID="nameHotel" Text="Khách sạn Sheraton Nha Trang" />
                        </div>
                        <div class="star-voted">
                            <i class="fas fa-star active"></i>
                            <i class="fas fa-star active"></i>
                            <i class="fas fa-star active"></i>
                            <i class="fas fa-star active"></i>
                            <i class="fas fa-star active"></i>
                            <span class="type-hotel">Home stay</span>
                        </div>
                        <div class="review">
                            <div class="mark">9.0</div>
                            <div class="comment">Tuyệt vời (572 đánh giá)</div>
                            <div class="mark-reivew">
                                <img src="/Content/assets/images/icons/icon_tripadvisor.svg" alt="" />
                                9.0
                            </div>
                            <a href="">Xem đánh giá</a>
                        </div>
                        <div class="location">
                            <i class="fas fa-map-signs"></i>
                            <asp:Label runat="server" ID="addressHotel" />
                            <a href="">Xem bản đồ</a>
                        </div>
                    </div>
                </div>
                <div class="container-price">
                    <div class="price">
                        <div class="old-price">
                            <p>1.7000.000 VND / đêm</p>
                            <div class="percent">5%</div>
                        </div>
                        <div class="new-price">
                            1.7000.000 VND / đêm
                        </div>

                    </div>
                    <a href="bookroom.aspx">
                        <div class="btn-select">
                            Chọn Phòng
                        </div>
                    </a>
                </div>
            </div>
            <div class="pictures">
                <div class="image main">
                    <asp:Image runat="server" ID="imageHotel" />
                </div>
                <div class="garery">
                    <div class="image main">
                        <img src="/Content/assets/images/photos-hotel/A&E/overview.jpg" alt="">
                    </div>
                    <div class="image main">
                        <img src="/Content/assets/images/photos-hotel/A&E/pool.jpg" alt="">
                    </div>
                    <div class="image main">
                        <img src="/Content/assets/images/photos-hotel/A&E/pool2.jpg" alt="">
                    </div>
                    <div class="image main">
                        <img src="/Content/assets/images/photos-hotel/A&E/badroom.jpg" alt="">
                    </div>
                </div>
            </div>
            <div class="more-infor">
                <div class="convenients">
                    <div class="header">
                        <div class="title">
                            Tiện nghi khách sạn
                        </div>
                        <div class="docLink">
                            Xem tất cả tiện nghi
                        </div>
                    </div>
                    <div class="container-convenients">
                        <div class="item-convenient">
                            <img src="/Content/assets/images/icons/dat-tour.png" alt="">
                            <p>Bán tour</p>
                        </div>
                        <div class="item-convenient">
                            <img src="/Content/assets/images/icons/doi-ngoai-te.png" alt="">
                            <p>Thu đổi ngoại tệ</p>
                        </div>
                        <div class="item-convenient">
                            <img src="/Content/assets/images/icons/reception-hotel-24h.svg" alt="">
                            <p>Lễ tân 24h</p>
                        </div>
                        <div class="item-convenient">
                            <img src="/Content/assets/images/icons/giu-hanh-ly.png" alt="">
                            <p>Giữ hành lý</p>
                        </div>
                        <div class="item-convenient">
                            <img src="/Content/assets/images/icons/Amenities_wifi.png" alt="">
                            <p>Internet miễn phí</p>
                        </div>
                        <div class="item-convenient">
                            <img src="/Content/assets/images/icons/don-dep-hang-ngay.png" alt="">
                            <p>Dọn phòng hàng ngày</p>
                        </div>
                        <div class="item-convenient">
                            <img src="/Content/assets/images/icons/bua-sang-tru-toi.png" alt="">
                            <p>Bữa tối</p>
                        </div>
                        <div class="item-convenient">
                            <img src="/Content/assets/images/icons/bua-sang-tru-toi.png" alt="">
                            <p>Bữa trưa</p>
                        </div>
                        <div class="item-convenient">
                            <img src="/Content/assets/images/icons/nha-hang.png" alt="">
                            <p>Nhà hàng</p>
                        </div>
                        <div class="item-convenient">
                            <p>+8</p>
                        </div>
                    </div>
                </div>
                <div class="review">
                    <div class="header">
                        <div class="title">
                            Đánh giá
                        </div>
                        <div class="docLink">
                            Xem tất cả đánh giá
                        </div>
                    </div>
                    <div class="container-review">
                        <div class="compete">
                            <div class="item-compete">
                                <p class="name">
                                    Vị trí
                                </p>
                                <progress id="vitri" value="80" max="100"></progress>
                                <div class="total">9.0</div>
                            </div>
                            <div class="item-compete">
                                <p class="name">
                                    Giá cả
                                </p>
                                <progress id="vitri" value="80" max="100"></progress>
                                <div class="total">9.0</div>
                            </div>
                            <div class="item-compete">
                                <p class="name">
                                    Phục vụ
                                </p>
                                <progress id="vitri" value="80" max="100"></progress>
                                <div class="total">9.0</div>
                            </div>
                            <div class="item-compete">
                                <p class="name">
                                    Vệ sinh
                                </p>
                                <progress id="vitri" value="80" max="100"></progress>
                                <div class="total">9.0</div>
                            </div>
                            <div class="item-compete">
                                <p class="name">
                                    Tiện nghi
                                </p>
                                <progress id="vitri" value="80" max="100"></progress>
                                <div class="total">9.0</div>
                            </div>
                        </div>
                        <div class="comment">
                            <div class="card-comment">
                                <div class="title">Tốt</div>
                                <div class="content">
                                    Phòng Deluxe Room cung cấp cũng khá ổn về mặt vệ sinh, tiện nghi cũng như thái độ đón tiếp phục
                        vụ khách ân cần chu đáo.
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="wrapper wrapper-rooms">
        <div class="title">Chọn phòng</div>
        <div class="container container-rooms">
            <asp:Repeater runat="server" ID="RepeaterRoom" OnItemCommand="RepeaterRoom_ItemCommand">
                <ItemTemplate>
                    <div class="item-room">
                        <div class="col col-left">
                            <div class="container-picture">
                                <div class="pictures">
                                    <div id="pointer-mini">
                                        <div class="cnt">
                                            <p>Được đề xuất</p>
                                        </div>
                                    </div>
                                    <div class="picture-main">
                                        <img src="/Content/upload/<%# GetFirstImageRoom(Container.DataItem) %>" alt="">
                                    </div>
                                    <div class="picture-more">
                                        <asp:Repeater runat="server" DataSource='<%# GetAllImageFromRoom(Container.DataItem) %>'>
                                            <ItemTemplate>
                                                <div class="picture">
                                                    <%--<img src="/Content/upload/<%# Eval("Anh") %>" alt="<%# Eval("Anh") %>">--%>
                                                    <img src="/Content/assets/images/photos-hotel/sheraton-nhatrang.jpg" alt="">
                                                </div>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </div>
                                </div>
                                <div class="more-picture">
                                    Xem hình ảnh và tiện nghi
                                </div>
                            </div>

                        </div>
                        <div class="col col-right">
                            <div class="header">
                                <div class="name"><%# Eval("TenPhong")  %></div>
                                <div class="more">
                                    <div class="area"><i class="fas fa-landmark"></i>32m2</div>
                                    <div class="facade">
                                        <i class="fab fa-squarespace"></i>Hướng Thành Phố
                                    </div>
                                </div>
                            </div>
                            <div class="selections">
                                <div class="selection-item">
                                    <div class="col col-info">
                                        <div class="select-name">
                                            Lựa chọn phòng
                                        </div>
                                        <p class="return">
                                            <i class="far fa-id-card"></i>
                                            Không hỗ trợ hoàn trả hủy
                                        </p>
                                        <p class="breakfast">
                                            <i class="fas fa-utensils"></i>
                                            Không bao gồm bữa ăn sáng
                                        </p>
                                        <p class="verify">
                                            <i class="fas fa-bolt"></i>
                                            Xác nhận ngay
                                        </p>
                                        <p>Chỉ còn 3 phòng chống</p>
                                    </div>
                                    <div class="col col-person">
                                        <i class="fas fa-user"></i>
                                        <p>x2 người</p>
                                    </div>
                                    <div class="col col-bed">
                                        <div class="item-bed">
                                            <i class="fas fa-bed"></i>
                                            <p>1 giường đôi</p>
                                        </div>
                                        <div class="item-bed">
                                            <i class="fas fa-bed"></i>
                                            <p>2 giường đơn</p>
                                        </div>
                                    </div>
                                    <div class="col col-select container-price">
                                        <div class="price">
                                            <p class="percent">5%</p>
                                            <div class="old-price">
                                                <p><%#Eval("DonGia")%> / đêm</p>
                                            </div>
                                            <div class="new-price">
                                                <%#Eval("DonGia")%> / đêm
                                            </div>

                                        </div>

                                        <asp:Button runat="server" CssClass="btn-select" CommandArgument='<%#Eval("MaPhong")%>' Text="Chọn Phòng" ID="btnSelect" OnCommand="btnSelect_Command" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
            <asp:Label ID="txtTest" runat="server"/>
        </div>
    </div>
    <div class="wrapper wrapper-review">
        <div class="title">
            Đánh giá
        </div>
        <div class="sub-title">100% đánh giá từ khách hàng đặt phòng trên Mytour</div>
        <div class="container con-review">
            <div class="tabs-review">
                <div class="tab active">
                    <img src="/Content/assets/images/icons/icon_logo_mytour_v1.svg" alt="">
                    <p>
                        Đánh giá từ Mytour
                    </p>
                    <div class="laser"></div>
                </div>
                <div class="tab">
                    <img src="/Content/assets/images/icons/icon_tripadvisor.svg" alt="">
                    <p>Đánh giá từ TripAdvisor</p>
                    <div class="laser"></div>
                </div>
            </div>
            <div class="checklists">
                <div class="check-item">
                    <input type="radio" class="option-input radio" name="example" checked />
                    <p>Tất cả (322)</p>
                </div>
                <div class="check-item">
                    <input type="radio" class="option-input radio" name="example" />

                    <p>Công tác (322)</p>
                </div>
                <div class="check-item">

                    <input type="radio" class="option-input radio" name="example" />


                    <p>Cặp đôi (322)</p>
                </div>
                <div class="check-item">

                    <input type="radio" class="option-input radio" name="example" />


                    <p>Gia đình có em bé (322)</p>
                </div>
                <div class="check-item">

                    <input type="radio" class="option-input radio" name="example" checked />


                    <p>Nhóm (322)</p>
                </div>
                <div class="check-item">

                    <input type="radio" class="option-input radio" name="example" checked />


                    <p>Khác (322)</p>
                </div>
                <div class="check-item">

                    <input type="radio" class="option-input radio" name="example" checked />

                    <p>Du lịch 1 mình (322)</p>
                </div>
            </div>
            <div class="analysis">
                <div class="wrapper-circle" data-anim="base wrapper">
                    <div class="circle" data-anim="base left"></div>
                    <div class="circle" data-anim="base right"></div>
                    <label for="">75%</label>
                </div>
                <div class="reviews">
                    <div class="compete">
                        <div class="item-compete">
                            <p class="name">
                                Vị trí
                            </p>
                            <progress id="vitri" value="80" max="100"></progress>
                            <div class="total">9.0</div>
                        </div>
                        <div class="item-compete">
                            <p class="name">
                                Giá cả
                            </p>
                            <progress id="vitri" value="80" max="100"></progress>
                            <div class="total">9.0</div>
                        </div>
                        <div class="item-compete">
                            <p class="name">
                                Phục vụ
                            </p>
                            <progress id="vitri" value="80" max="100"></progress>
                            <div class="total">9.0</div>
                        </div>
                        <div class="item-compete">
                            <p class="name">
                                Vệ sinh
                            </p>
                            <progress id="vitri" value="80" max="100"></progress>
                            <div class="total">9.0</div>
                        </div>
                        <div class="item-compete">
                            <p class="name">
                                Tiện nghi
                            </p>
                            <progress id="vitri" value="80" max="100"></progress>
                            <div class="total">9.0</div>
                        </div>
                    </div>
                    <div class="comment">
                        <div class="services">
                            <div class="item-compete">
                                <p class="name">
                                    Vị trí
                                </p>
                                <progress id="vitri" value="80" max="100"></progress>
                                <div class="total">9.0</div>
                            </div>
                            <div class="item-compete">
                                <p class="name">
                                    Giá cả
                                </p>
                                <progress id="vitri" value="80" max="100"></progress>
                                <div class="total">9.0</div>
                            </div>
                            <div class="item-compete">
                                <p class="name">
                                    Phục vụ
                                </p>
                                <progress id="vitri" value="80" max="100"></progress>
                                <div class="total">9.0</div>
                            </div>
                            <div class="item-compete">
                                <p class="name">
                                    Vệ sinh
                                </p>
                                <progress id="vitri" value="80" max="100"></progress>
                                <div class="total">9.0</div>
                            </div>
                            <div class="item-compete">
                                <p class="name">
                                    Tiện nghi
                                </p>
                                <progress id="vitri" value="80" max="100"></progress>
                                <div class="total">9.0</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container-comment">
                <div class="header">
                    <div class="header-left">
                        <div class="title">Ảnh người dùng đánh giá</div>
                        <div class="images">
                            <div class="image">
                                <img src="/Content/assets/images/photos-hotel/sheraton-nhatrang.jpg" alt="">
                            </div>
                            <div class="image">
                                <img src="/Content/assets/images/photos-hotel/sheraton-nhatrang.jpg" alt="">
                            </div>
                            <div class="image">
                                <img src="/Content/assets/images/photos-hotel/sheraton-nhatrang.jpg" alt="">
                            </div>
                            <div class="image">
                                <img src="/Content/assets/images/photos-hotel/sheraton-nhatrang.jpg" alt="">
                            </div>
                            <div class="image">
                                <img src="/Content/assets/images/photos-hotel/sheraton-nhatrang.jpg" alt="">
                            </div>
                        </div>
                    </div>
                    <div class="header-right">
                        <div class="btn-option active">Mới nhất</div>
                        <div class="btn-option ">Cũ nhất</div>
                        <div class="btn-option ">Điểm thấp nhất</div>
                        <div class="btn-option ">Điểm cao nhất</div>
                    </div>
                </div>
                <div class="content-comment">
                    <div class="item-comment">
                        <div class="col-left">
                            <div class="avatar">
                                <img src="/Content/assets/images/icons/user.png" alt="">
                            </div>
                            <div class="infor">
                                <div class="name">
                                    Hương
                                </div>
                                <p class="bird-day"><i class="fas fa-pencil-alt"></i>21/04/2021</p>
                                <p class="time"><i class="fas fa-calendar-week"></i>1 đêm - tháng 4/2021</p>
                                <p class="type-used"><i class="far fa-address-card"></i>Gia đình có em bé</p>
                            </div>
                        </div>
                        <div class="col-center">
                            <div class="title">Khách sạn ngay Trung tâm thành phố</div>
                            <div class="content">
                                Khách sạn nằm ngay trung tâm sài gòn, có hồ bơi khá lớn và sân vườn nhiều cây xanh
                      tạo cảm giác thư giãn thoải mái mặc dù Khách sạn nằm ngay trung tâm thành phố đông
                      đúc. Món ăn sáng phong phú và khá ngon ,tuy nhiên món Phở và mì quảng lại không thuần
                      Việt. Phòng ốc sạch sẽ và nếu trang bị thêm vòi xịt rửa trong nhà vệ sinh sẽ tuyệt
                      vời hơn.
                            </div>
                            <div class="like">
                                <i class="far fa-thumbs-up"></i>
                                Đánh giá này hữu ích với bạn
                            </div>
                        </div>
                        <div class="col-right">
                            <div class="mark">
                                <div class="row number">
                                    9.0
                                </div>
                                <div class="row">
                                    Rất tốt
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="item-comment">
                        <div class="col-left">
                            <div class="avatar">
                                <img src="/Content/assets/images/icons/user.png" alt="">
                            </div>
                            <div class="infor">
                                <div class="name">
                                    Hương
                                </div>
                                <p class="bird-day"><i class="fas fa-pencil-alt"></i>21/04/2021</p>
                                <p class="time"><i class="fas fa-calendar-week"></i>1 đêm - tháng 4/2021</p>
                                <p class="type-used"><i class="far fa-address-card"></i>Gia đình có em bé</p>
                            </div>
                        </div>
                        <div class="col-center">
                            <div class="title">Khách sạn ngay Trung tâm thành phố</div>
                            <div class="content">
                                Khách sạn nằm ngay trung tâm sài gòn, có hồ bơi khá lớn và sân vườn nhiều cây xanh
                      tạo cảm giác thư giãn thoải mái mặc dù Khách sạn nằm ngay trung tâm thành phố đông
                      đúc. Món ăn sáng phong phú và khá ngon ,tuy nhiên món Phở và mì quảng lại không thuần
                      Việt. Phòng ốc sạch sẽ và nếu trang bị thêm vòi xịt rửa trong nhà vệ sinh sẽ tuyệt
                      vời hơn.
                            </div>
                            <div class="like">
                                <i class="far fa-thumbs-up"></i>
                                Đánh giá này hữu ích với bạn
                            </div>
                        </div>
                        <div class="col-right">
                            <div class="mark">
                                <div class="row number">
                                    9.0
                                </div>
                                <div class="row">
                                    Rất tốt
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="item-comment">
                        <div class="col-left">
                            <div class="avatar">
                                <img src="/Content/assets/images/icons/user.png" alt="">
                            </div>
                            <div class="infor">
                                <div class="name">
                                    Hương
                                </div>
                                <p class="bird-day"><i class="fas fa-pencil-alt"></i>21/04/2021</p>
                                <p class="time"><i class="fas fa-calendar-week"></i>1 đêm - tháng 4/2021</p>
                                <p class="type-used"><i class="far fa-address-card"></i>Gia đình có em bé</p>
                            </div>
                        </div>
                        <div class="col-center">
                            <div class="title">Khách sạn ngay Trung tâm thành phố</div>
                            <div class="content">
                                Khách sạn nằm ngay trung tâm sài gòn, có hồ bơi khá lớn và sân vườn nhiều cây xanh
                      tạo cảm giác thư giãn thoải mái mặc dù Khách sạn nằm ngay trung tâm thành phố đông
                      đúc. Món ăn sáng phong phú và khá ngon ,tuy nhiên món Phở và mì quảng lại không thuần
                      Việt. Phòng ốc sạch sẽ và nếu trang bị thêm vòi xịt rửa trong nhà vệ sinh sẽ tuyệt
                      vời hơn.
                            </div>
                            <div class="like">
                                <i class="far fa-thumbs-up"></i>
                                Đánh giá này hữu ích với bạn
                            </div>
                        </div>
                        <div class="col-right">
                            <div class="mark">
                                <div class="row number">
                                    9.0
                                </div>
                                <div class="row">
                                    Rất tốt
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="item-comment">
                        <div class="col-left">
                            <div class="avatar">
                                <img src="/Content/assets/images/icons/user.png" alt="">
                            </div>
                            <div class="infor">
                                <div class="name">
                                    Hương
                                </div>
                                <p class="bird-day"><i class="fas fa-pencil-alt"></i>21/04/2021</p>
                                <p class="time"><i class="fas fa-calendar-week"></i>1 đêm - tháng 4/2021</p>
                                <p class="type-used"><i class="far fa-address-card"></i>Gia đình có em bé</p>
                            </div>
                        </div>
                        <div class="col-center">
                            <div class="title">Khách sạn ngay Trung tâm thành phố</div>
                            <div class="content">
                                Khách sạn nằm ngay trung tâm sài gòn, có hồ bơi khá lớn và sân vườn nhiều cây xanh
                      tạo cảm giác thư giãn thoải mái mặc dù Khách sạn nằm ngay trung tâm thành phố đông
                      đúc. Món ăn sáng phong phú và khá ngon ,tuy nhiên món Phở và mì quảng lại không thuần
                      Việt. Phòng ốc sạch sẽ và nếu trang bị thêm vòi xịt rửa trong nhà vệ sinh sẽ tuyệt
                      vời hơn.
                            </div>
                            <div class="like">
                                <i class="far fa-thumbs-up"></i>
                                Đánh giá này hữu ích với bạn
                            </div>
                        </div>
                        <div class="col-right">
                            <div class="mark">
                                <div class="row number">
                                    9.0
                                </div>
                                <div class="row">
                                    Rất tốt
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="item-comment">
                        <div class="col-left">
                            <div class="avatar">
                                <img src="/Content/assets/images/icons/user.png" alt="">
                            </div>
                            <div class="infor">
                                <div class="name">
                                    Hương
                                </div>
                                <p class="bird-day"><i class="fas fa-pencil-alt"></i>21/04/2021</p>
                                <p class="time"><i class="fas fa-calendar-week"></i>1 đêm - tháng 4/2021</p>
                                <p class="type-used"><i class="far fa-address-card"></i>Gia đình có em bé</p>
                            </div>
                        </div>
                        <div class="col-center">
                            <div class="title">Khách sạn ngay Trung tâm thành phố</div>
                            <div class="content">
                                Khách sạn nằm ngay trung tâm sài gòn, có hồ bơi khá lớn và sân vườn nhiều cây xanh
                      tạo cảm giác thư giãn thoải mái mặc dù Khách sạn nằm ngay trung tâm thành phố đông
                      đúc. Món ăn sáng phong phú và khá ngon ,tuy nhiên món Phở và mì quảng lại không thuần
                      Việt. Phòng ốc sạch sẽ và nếu trang bị thêm vòi xịt rửa trong nhà vệ sinh sẽ tuyệt
                      vời hơn.
                            </div>
                            <div class="like">
                                <i class="far fa-thumbs-up"></i>
                                Đánh giá này hữu ích với bạn
                            </div>
                        </div>
                        <div class="col-right">
                            <div class="mark">
                                <div class="row number">
                                    9.0
                                </div>
                                <div class="row">
                                    Rất tốt
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="pagination">
                        <div class="pagination-container">
                            <div class="pagination-hover-overlay"></div>
                            <a href="#0" class="pagination-prev">
                                <span class="icon-pagination icon-pagination-prev">
                                    <i class="fas fa-chevron-left"></i>
                                </span>
                            </a>
                            <a href="#0" class="pagination-page-number active">1</a>
                            <a href="#0" class="pagination-page-number">2</a>
                            <a href="#0" class="pagination-page-number">3</a>
                            <a href="#0" class="pagination-page-number">4</a>
                            <a href="#0" class="pagination-page-number">5</a>
                            <a href="#0" class="pagination-page-number">6</a>
                            <a href="#0" class="pagination-page-number">7</a>

                            <a href="#0" class="pagination-next">
                                <span class="icon-pagination icon-pagination-next">
                                    <i class="fas fa-chevron-right"></i>
                                </span>
                            </a>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
    <div class="wrapper-intro">
        <div class="header">
            <div class="title">Mô tả khách sạn</div>
        </div>
        <div class="row-intro">
            <div class="introduction">
                <div class="box">
                    <div class="title">Khách sạn M Boutique</div>
                    <div class="content">
                        Được xây dựng vào năm 2015, Khách Sạn Millennium Boutique là điểm du lịch bổ sung cho Hồ Chí Minh và
                  là sự lựa chọn tuyệt vời dành cho khách du lịch. Tọa lạc ở vị trí chỉ cách trung tâm thành phố 0.3 km,
                  khách hàng sẽ có được chỗ ở tốt để tận hưởng các điểm thú vị và hoạt động nổi tiếng ở đây. Với vị trí
                  thuận lợi, khách sạn dễ dàng tiếp cận những điểm tham quan du lịch nổi tiếng của thành phố.
                    </div>
                    <div class="view-more">
                        Xem thêm
                    </div>
                </div>
            </div>
            <div class="image">
                <img src="/Content/assets/images/photos-hotel/logo_4_1009828.jpg" alt="">
            </div>
        </div>
    </div>
      </ContentTemplate>
  </asp:UpdatePanel>
</asp:Content>
