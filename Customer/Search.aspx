<%@ Page Title="" Language="C#" MasterPageFile="~/LayoutC2.Master" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="WebNCASP.Customer.Search" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="path">
        <div class="item">Khách sạn</div>
        <i class="fas fa-angle-right"></i>
        <div class="item">Hà Nội</div>
    </div>
    <div class="container-content">
        <div class="box-filter">
            <div class="tittle">
                <div class="">Bộ lọc</div>
                <a href="">xóa tất cả</a>
            </div>
            <div class="filter-item price">
                <div class="tittle">Khoảng giá (1 đêm)</div>
                <div id="slider">
                    <input
                        type="number"
                        name="min"
                        min="0"
                        oninput="OnchangePriceDistance(this)"
                        placeholder="From" />
                    <i class="fas fa-angle-double-right"></i>
                    <input
                        type="number"
                        id="max"
                        name="max"
                        max="0"
                        placeholder="To" />
                </div>
            </div>
            <div class="filter-item ranked-hotel">
                <div class="tittle">Hạng khách sạn</div>
                <div class="filter-row stars five-star">
                    <input type="checkbox" name="" id="" />
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                </div>
                <div class="filter-row stars four-star">
                    <input type="checkbox" name="" id="" />
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                </div>
                <div class="filter-row stars three-star">
                    <input type="checkbox" name="" id="" />
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                </div>
                <div class="filter-row stars two-star">
                    <input type="checkbox" name="" id="" />
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                </div>
                <div class="filter-row stars one-star">
                    <input type="checkbox" name="" id="" />
                    <i class="fas fa-star"></i>
                </div>
            </div>
            <div class="filter-item bonus">
                <div class="tittle">Dịch vụ đi kèm</div>
                <div class="filter-row">
                    <input type="checkbox" name="bonus" id="" />
                    Ăn sáng miễn phí
                </div>
                <div class="filter-row">
                    <input type="checkbox" name="bonus" id="" />
                    Hủy linh hoạt
                </div>
                <div class="filter-row">
                    <input type="checkbox" name="bonus" id="" />
                    Khuyến mãi - Giảm giá
                </div>
            </div>
            <div class="filter-item review">
                <div class="tittle">Người dùng đánh giá</div>
                <div class="filter-row">
                    <input type="checkbox" name="wonderful" id="" />
                    Tuyệt vời (9.0 +)
                </div>
                <div class="filter-row">
                    <input type="checkbox" name="great" id="" />
                    Rất tốt (8.0 +)
                </div>
                <div class="filter-row">
                    <input type="checkbox" name="good" id="" />
                    Tốt (7.0 +)
                </div>
            </div>
        </div>
        <div class="tabs-container">
            <div class="tabs-header">
                <ul>
                    <li>
                        <a href="search.html?suggestion">
                            <p>MYTOUR đề xuất</p>
                        </a>
                        <div class="active-tab"></div>
                    </li>
                    <li>
                        <a href="search.html?sort=asc">
                            <p>Gía tăng dần</p>
                        </a>
                        <div class="active-tab"></div>
                    </li>
                    <li>
                        <a href="search.html?sort=desc">
                            <p>Gía giảm dần</p>
                        </a>
                        <div class="active-tab"></div>
                    </li>
                    <li>
                        <a href="search.html?sort=rank">
                            <p>Xếp hạng sao</p>
                        </a>

                        <div class="active-tab"></div>
                    </li>
                    <li>
                        <a href="search.html?sort=top">
                            <p>Đánh giá cao nhất</p>
                        </a>
                        <div class="active-tab"></div>
                    </li>
                </ul>
            </div>
            <div class="container-hotel">
                <asp:Repeater runat="server" ID="Repeater_Hotel">
                    <ItemTemplate>
                        <div class="box-hotel">
                            <div class="picture">
                                <img 
                                    src="/Content/upload/<%# Eval("Anh") %>"
                                    alt="<%# Eval("Anh") %>" />
                                <div class="sale-percent">58%</div>
                                <div class="favorous">
                                    <i class="fas fa-heart"></i>
                                </div>
                                <div class="medal">
                                    <img
                                        src="/Content/assets/images/icons/icon_tag_the_best.svg"
                                        alt="" />
                                </div>
                            </div>
                            <div class="container-content-hotel">
                                <div class="content-hotel">
                                    <asp:LinkButton runat="server" ID="nameHotel" OnClick="nameHotel_Click" CommandArgument='<%#Eval("MaKhachSan")%>'>
                                        <div class="name"><%# Eval("TenKhachSan") %></div>
                                    </asp:LinkButton>
                                    </a>
                                    <div class="star-voted">
                                        <i class="fas fa-star active"></i>
                                        <i class="fas fa-star active"></i>
                                        <i class="fas fa-star active"></i>
                                        <i class="fas fa-star active"></i>
                                        <i class="fas fa-star active"></i>
                                        <span class="type-hotel">Home stay</span>
                                    </div>
                                    <div class="location">
                                        <i class="fas fa-map-signs"></i>
                                        <%# Eval("DiaChi") %>
                                    </div>
                                    <div class="review">
                                        <div class="mark">9.0</div>
                                        <div class="comment">Tuyệt vời (572 đánh giá)</div>
                                        <div class="mark-reivew">
                                            <img
                                                src="/Content/assets/images/icons/icon_tripadvisor.svg"
                                                alt="" />
                                            9.0
                                        </div>
                                    </div>
                                </div>
                                <div class="price">
                                    <div class="old-price">3.527.204đ / đêm</div>
                                    <div class="current-price">1.527.204đ / đêm</div>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
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
</asp:Content>
