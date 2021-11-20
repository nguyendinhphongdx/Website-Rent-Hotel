<%@ Page Title="Home" Language="C#" MasterPageFile="~/LayoutC.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="WebNCASP.Customer.Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="bannerTop">
        <div class="wrapper-content">
            <div class="box-option">
                <div class="title-box">Khách sạn</div>
                <div class="container-box">
                    <div class="box-item item-place">
                        <div class="title">Địa điểm</div>
                        <input class="input input-place" name="place" type="text" id="input-place" autocomplete="off"
                            placeholder="Thành phố, khách sạn, điểm đến" />
                        <div class="indicator"></div>
                        <div class="dropdown cities">
                            <h3>Các địa điểm nổi bật</h3>
                            <ul>
                                <li class="item-cities"><i class="fas fa-map-marker-alt"></i>Hà Nội</li>
                                <li class="item-cities">
                                    <i class="fas fa-map-marker-alt"></i>TP Hồ Chí Minh
                                </li>
                                <li class="item-cities">
                                    <i class="fas fa-map-marker-alt"></i>Bà Rịa - Vũng Tàu
                                </li>
                                <li class="item-cities"><i class="fas fa-map-marker-alt"></i>Đà Nẵng</li>
                                <li class="item-cities"><i class="fas fa-map-marker-alt"></i>Đà Lạt</li>
                                <li class="item-cities"><i class="fas fa-map-marker-alt"></i>Nha Trang</li>
                                <li class="item-cities"><i class="fas fa-map-marker-alt"></i>Hội An</li>
                                <li class="item-cities"><i class="fas fa-map-marker-alt"></i>Long An</li>
                                <li class="item-cities"><i class="fas fa-map-marker-alt"></i>Bến Tre</li>
                                <li class="item-cities"><i class="fas fa-map-marker-alt"></i>Vĩnh Long</li>
                                <li class="item-cities"><i class="fas fa-map-marker-alt"></i>Khánh Hòa</li>
                                <li class="item-cities"><i class="fas fa-map-marker-alt"></i>Phú Thọ</li>
                                <li class="item-cities"><i class="fas fa-map-marker-alt"></i>Hà Giang</li>
                                <li class="item-cities">
                                    <i class="fas fa-map-marker-alt"></i>Thừa Thiên Huế
                                </li>
                                <li class="item-cities"><i class="fas fa-map-marker-alt"></i>Quảng Ngãi</li>
                                <li class="item-cities"><i class="fas fa-map-marker-alt"></i>Cao Bằng</li>
                                <li class="item-cities"><i class="fas fa-map-marker-alt"></i>Thái Nghyên</li>
                            </ul>
                        </div>
                    </div>
                    <div class="box-item item-start-day">
                        <div class="title">Thời gian đi</div>
                        <input class="input input-start-day" name="daterange" id="daterange" autocomplete="off"
                            placeholder="Ngày đến" value="" onchange="listentInputTime(this)" />
                        <div class="indicator active"></div>
                    </div>
                    <div class="total-day">
                        <span>
                            <span id="number-date">2</span>
                            <i class="fas fa-moon" style="color: black"></i>
                        </span>
                    </div>
                    <div class="box-item item-people">
                        <div class="title">Số phòng, số khách</div>
                        <input class="input input-people" type="text" id="input-people" name="people" autocomplete="off"
                            placeholder="1 Phòng, 2 người lớn, 0 trẻ em" value="1 Phòng, 2 người lớn, 0 trẻ em" readonly />
                        <div class="dropdown people">
                            <div class="row room">
                                <div class="type">Phòng</div>
                                <div class="edit-number">
                                    <div class="circle minus" onclick="editNumber('room','minus')">
                                        <i class="fas fa-minus"></i>
                                    </div>
                                    <div class="quality" id="quality-room">1</div>
                                    <div class="circle plus" onclick="editNumber('room','plus')">
                                        <i class="fas fa-plus"></i>
                                    </div>
                                </div>
                            </div>
                            <div class="row room">
                                <div class="type">Người lớn</div>
                                <div class="edit-number">
                                    <div class="circle minus" onclick="editNumber('person','minus')">
                                        <i class="fas fa-minus"></i>
                                    </div>
                                    <div class="quality" id="quality-person">2</div>
                                    <div class="circle plus" onclick="editNumber('person','plus')">
                                        <i class="fas fa-plus"></i>
                                    </div>
                                </div>
                            </div>
                            <div class="row room">
                                <div class="type">Trẻ em</div>
                                <div class="edit-number" onclick="editNumber('child','minus')">
                                    <div class="circle minus">
                                        <i class="fas fa-minus"></i>
                                    </div>
                                    <div class="quality" id="quality-child">0</div>
                                    <div class="circle plus" onclick="editNumber('child','plus')">
                                        <i class="fas fa-plus"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="indicator active"></div>
                    </div>
                    <asp:LinkButton runat="server" ID="btnSearch" CssClass="box-item item-search" Style="color: white" OnClick="btnSearch_Click">
                <i class="fas fa-search fa-2x"></i>
                    </asp:LinkButton>
                </div>
            </div>
        </div>
    </div>
    <div class="wrapper-content">
        <div class="container-ultility">
            <div class="box-utility">
                <div class="picture">
                    <img src="/Content/assets/images/icons/icon_support_247.svg" alt="" />
                </div>
                <div class="title">Hỗ trợ khách hàng 24/7</div>
                <div class="description">
                    Chat là có, gọi là nghe, không quản đêm hôm, ngày nghỉ và ngày lễ
                </div>
            </div>
            <div class="box-utility">
                <div class="picture">
                    <img src="/Content/assets/images/icons/icon_best_price.svg" alt="" />
                </div>
                <div class="title">Gía tốt sát ngày</div>
                <div class="description">
                    Cam kết giá tốt nhất khi đặt gần ngày cho chuyến đi của bạn.
                </div>
            </div>
            <div class="box-utility">
                <div class="picture">
                    <img src="/Content/assets/images/icons/icon_payment.svg" alt="" />
                </div>
                <div class="title">Thanh toán dễ dàng, đa dạng</div>
                <div class="description">
                    Bao gồm thêm chuyển khoản ngân hàng và tiền mặt tại cửa hàng
                </div>
            </div>
            <div class="box-utility">
                <div class="picture">
                    <img src="/Content/assets/images/icons/icon_total_hotel.svg" alt="" />
                </div>
                <div class="title">Hơn 8000+ khách sạn dọc Việt Nam</div>
                <div class="description">
                    Hàng nghìn khách sạn, đặc biệt là 4 sao và 5 sao, cho phép bạn
            thoải mái lựa chọn, giá cạnh tranh, phong phú.
                </div>
            </div>
        </div>
        <div class="component hotel-location">
            <div class="title">Khách sạn theo địa điểm</div>
        </div>
        <div class="container-hotel-by-location">
            <div class="item-hotel-by-location">
                <div class="picture">
                    <img src="/Content/assets/images/wall/hochiminh.png" alt="" />
                </div>
                <div class="caption">Hồ Chí Minh</div>
                <div class="description">4577 Khách sạn</div>
            </div>
            <div class="item-hotel-by-location">
                <div class="picture">
                    <img src="/Content/assets/images/wall/hanoi.png" alt="" />
                </div>
                <div class="caption">Hà Nội</div>
                <div class="description">2831 Khách sạn</div>
            </div>
            <div class="item-hotel-by-location">
                <div class="picture">
                    <img src="/Content/assets/images/wall/danang.png" alt="" />
                </div>
                <div class="caption">Đà Nẵng</div>
                <div class="description">1996 Khách sạn</div>
            </div>
            <div class="item-hotel-by-location">
                <div class="picture">
                    <img src="/Content/assets/images/wall/da-lat.png" alt="" />
                </div>
                <div class="caption">Đà Lạt</div>
                <div class="description">1629 Khách sạn</div>
            </div>
            <div class="item-hotel-by-location">
                <div class="picture">
                    <img src="/Content/assets/images/wall/vung-tau.png" alt="" />
                </div>
                <div class="caption">Bà Rịa- Vũng Tàu</div>
                <div class="description">1661 Khách sạn</div>
            </div>
            <div class="item-hotel-by-location">
                <div class="picture">
                    <img src="/Content/assets/images/wall/nha-trang.png" alt="" />
                </div>
                <div class="caption">Nha Trang</div>
                <div class="description">1172 Khách sạn</div>
            </div>
            <div class="item-hotel-by-location">
                <div class="picture">
                    <img src="/Content/assets/images/wall/hoi-an.png" alt="" />
                </div>
                <div class="caption">Hội An</div>
                <div class="description">1100 Khách sạn</div>
            </div>
            <div class="item-hotel-by-location">
                <div class="picture">
                    <img src="/Content/assets/images/wall/hochiminh.png" alt="" />
                </div>
                <div class="caption">Hồ Chí Minh</div>
                <div class="description">4577 Khách sạn</div>
            </div>
        </div>
    </div>
    <div class="content-page">
        <div class="wrapper-content">
            <div class="component">
                <div class="header">
                    <div class="title">Khách sạn giá tốt chỉ có trên Mytour</div>
                    <div class="options">
                        <div class="item-option">
                            <div class="icon-option">
                                <img src="/Content/assets/images/icons/hotel.png" alt="" />
                            </div>
                            <div class="title-option">Khách sạn mới</div>
                        </div>
                        <div class="item-option">
                            <div class="icon-option">
                                <img src="/Content/assets/images/icons/fire.png" alt="" />
                            </div>
                            <div class="title-option">Gía hấp dẫn</div>
                        </div>
                        <div class="item-option">
                            <div class="icon-option">
                                <img src="/Content/assets/images/icons/refresh.png" alt="" />
                            </div>
                            <div class="title-option">Cập nhật hàng tuần</div>
                        </div>
                        <div class="item-option">
                            <div class="icon-option">
                                <img src="/Content/assets/images/icons/like.png" alt="" />
                            </div>
                            <div class="title-option">Dành riêng cho bạn</div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container-hotel">
                <asp:Repeater runat="server" ID="Repeater_Hotel">
                    <ItemTemplate>
                        <div class="box-hotel">
                            <div class="picture">
                                <img src="/Content/upload/<%#Eval("Anh")%>" alt="<%#Eval("Anh")%>" />
                                <div class="sale-percent">0%</div>
                                <div class="favorous">
                                    <i class="fas fa-heart"></i>
                                </div>
                                <div class="medal">
                                    <img src="/Content/assets/images/icons/icon_tag_the_best.svg" alt="" srcset="" />
                                </div>
                            </div>
                            <div class="container-content-hotel">
                                <div class="content-hotel">
                                     <asp:LinkButton runat="server" ID="nameHotel" OnClick="nameHotel_Click" CommandArgument='<%#Eval("MaKhachSan")%>'>
                                        <div class="name"><%# Eval("TenKhachSan") %></div>
                                    </asp:LinkButton>
                                    <div class="star-voted">
                                        <i class="fas fa-star active"></i>
                                        <i class="fas fa-star active"></i>
                                        <i class="fas fa-star active"></i>
                                        <i class="fas fa-star active"></i>
                                        <i class="fas fa-star"></i>
                                    </div>
                                    <div class="location">
                                        <i class="fas fa-map-signs"></i>
                                        <%#Eval("DiaChi")%>
                                    </div>
                                    <div class="review">
                                        <div class="mark">9.0</div>
                                        <div class="comment">Tuyệt vời (572 đánh giá)</div>
                                        <div class="mark-reivew">
                                            <img src="/Content/assets/images/icons/icon_tripadvisor.svg" alt="" />
                                            9.0
                                        </div>
                                    </div>
                                </div>
                                <div class="price">
                                    <div class="old-price">3.527.204đ</div>
                                    <div class="current-price">1.527.204đ</div>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </div>
    <div class="dowload-app">
        <div class="wallpaper"></div>
        <div class="container-app">
            <div class="qr-code">
                <div class="title">Tải ứng dụng Mytour.vn</div>
                <p>Đặt vé máy bay, khách sạn hạng sang</p>
                <div class="row">
                    <div class="picture-qr">
                        <img src="/Content/assets/images/icons/qrcode.png" alt="" />
                    </div>
                    <div class="button-download">
                        <div class="button">
                            <img src="/Content/assets/images/icons/icon_app_store.svg" alt="" />
                        </div>
                        <div class="button">
                            <img src="/Content/assets/images/icons/icon_chplay.svg" alt="" />
                        </div>
                    </div>
                </div>
            </div>
            <div class="picture">
                <img src="/Content/assets/images/wall/phone.png" alt="" />
            </div>
            <div class="check-list">
                <div class="item-checked">
                    Giá tốt hơn so với đặt phòng trực tiếp tại khách sạn
                </div>
                <div class="item-checked">
                    Nhân viên chăm sóc, tư vấn nhiều kinh nghiệm
                </div>
                <div class="item-checked">
                    Hơn 5000 khách sạn tại Việt Nam với đánh giá thực
                </div>
                <div class="item-checked">
                    Nhiều chương trình khuyến mãi và tích lũy điểm
                </div>
                <div class="item-checked">Thanh toán dễ dàng, đa dạng</div>
            </div>
        </div>
    </div>
    <div class="wrapper-content">
        <div class="component">
            <div class="title">Các khách sạn hàng đầu</div>
            <div class="table-province">
                <div class="item-province">Thừa Thiên - Huế</div>
            </div>
        </div>
        <div class="container-sign-up">
            <div class="picture">
                <img src="/Content/assets/images/icons/icon_mail_red.svg" alt="" srcset="" />
            </div>
            <div class="text-box">
                <div class="title">
                    Bạn muốn tiết kiệm tới 50% khi đặt phòng khách sạn, vé máy bay?
                </div>
                <div class="description">
                    Nhập số điện thoại để Mytour có thể gửi đến bạn những chương trình
            khuyến mại mới nhất!
                </div>
            </div>
            <div class="input-phone-number">
                <input type="text" placeholder="Nhập số điện thoại" />
                <button>Đăng ký</button>
            </div>
        </div>
    </div>
</asp:Content>
