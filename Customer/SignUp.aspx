<%@ Page Title="" Language="C#" MasterPageFile="~/LayoutC2.Master" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="WebNCASP.Customer.SignUp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <style>
        .box-option{
            display:none
        }
    </style>
      <div class="container-form">
          <form action="" class="form-signUp" method="get">
            <div class="card info-contact">
              <div class="title">Đăng ký tài khoản</div>
              <div class="row">
                <div class="col">
                  <label for="name">Họ tên *</label>
                  <input id="name" name="name" type="text" required="required" placeholder="Họ tên">
                </div>
                <div class="col">
                  <label for="phone">Số điện thoại *</label>
                  <input type="text" required="required" name="phone"  id="phone" placeholder="Số điện thoại">
                </div>
              </div>
              <div class="row">
                <div class="col col-full">
                  <label for="address">Địa chỉ *</label>
                  <input type="text" required="required" name="address" id="address" placeholder="Địa chỉ">
                </div>
                <div class="col">
                  <label for="age">Tuổi</label>
                  <input id="age" name="age" type="number" min="18" placeholder="Tuổi">
                </div>
              </div>
              <div class="row">
                <div class="col">
                  <label for="email">Email *</label>
                  <input type="email" required="required" name="email" id="email" placeholder="Email">
                </div>
                <div class="col">
                  <label for="password">Mật khẩu</label>
                  <input type="password" required="required" name="password" id="password"  placeholder="Password">
                </div>
              </div>
              <div class="row">
                <button class="btn-sign">
                  Đăng ký
                </B>
              </div>
            </div>
          </form>
        </div>
</asp:Content>
