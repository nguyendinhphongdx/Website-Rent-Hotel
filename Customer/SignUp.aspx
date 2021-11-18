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
                  <asp:TextBox runat="server" ID="name" name="name" type="text" required="required" placeholder="Họ tên"/>
                </div>
                <div class="col">
                  <label for="phone">Số điện thoại *</label>
                     <asp:TextBox runat="server" ID="phone" name="name" type="text" required="required" placeholder="Số điện thoại"/>
                </div>
              </div>
              <div class="row">
                <div class="col col-full">
                  <label for="address">CMND *</label>
                      <asp:TextBox runat="server" ID="CMND" name="name" type="text" required="required" placeholder="Số CMND"/>
                </div>
                <div class="col">
                  <label for="age">Tuổi</label>
                  <asp:TextBox runat="server" ID="age" name="name" type="number" required="required" placeholder="Tuổi"/>
                </div>
              </div>
              <div class="row">
                <div class="col">
                  <label for="email">Email *</label>
                      <asp:TextBox runat="server" ID="email" name="email" type="email" required="required" placeholder="Email"/>
                </div>
                <div class="col">
                  <label for="password">Mật khẩu</label>
                 <asp:TextBox runat="server" ID="password" name="password" type="password" required="required" placeholder="Password"/>
                </div>
              </div>
              <div class="row">
                <asp:Button ID="btnSignUp" OnClick="btnSignUp_Click" runat="server" CssClass="btn-sign" Text="Đăng ký"/>
              </div>
            </div>
          </form>
        </div>
</asp:Content>
