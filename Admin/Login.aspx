<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebNCASP.Admin.Login" %>
<html>
<!DOCTYPE html>

<head runat="server">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="../Content/assets/css/admin/login.css" rel="stylesheet" />
    <title>Login</title>
</head>
<body>
       <section class="forms-section">
        <h1 class="section-title">Quản lý truy cập</h1>
        <div class="forms">
            <asp:Label ID="label" runat="server"></asp:Label>
            <div class="form-wrapper is-active">
                <button type="button" class="switcher switcher-login">
                    Đăng nhập
                    <span class="underline"></span>
                </button>
                <form class="form form-login" method="post">
                    <fieldset>
                        <legend>Please, enter your email and password for login.</legend>
                        <div class="input-block">
                            <label for="login-email">E-mail</label>
                            <input name="email" id="login-email" type="email" required>
                        </div>
                        <div class="input-block">
                            <label for="login-password">Password</label>
                            <input name="password" id="login-password" type="password" required>
                        </div>
                            <input name="type" type="hidden" value="signin">
                    </fieldset>
                    <button type="submit" class="btn-login">Login</button>
                </form>
            </div>
            <div class="form-wrapper">
                <button type="button" class="switcher switcher-signup">
                    Đăng kí
                    <span class="underline"></span>
                </button>
                <form  class="form form-signup">
                    <input name="type" type="hidden" value="signup">
                    <fieldset>
                        <legend>Please, enter your email, password and password confirmation for sign up.</legend>
                        <div class="input-block">
                            <label for="signup-email">E-mail</label>
                            <input id="signup-email" type="email" required>
                        </div>
                        <div class="input-block">
                            <label for="signup-password">Password</label>
                            <input id="signup-password" type="password" required>
                        </div>
                        <div class="input-block">
                            <label for="signup-password-confirm">Confirm password</label>
                            <input id="signup-password-confirm" type="password" required>
                        </div>
                    </fieldset>
                    <button type="submit" class="btn-signup">Continue</button>
                </form>
            </div>
        </div>
           <p>admin@gmail.com - 123</p>
           </section>
</body>
    <script > 
    const switchers = [...document.querySelectorAll('.switcher')]

    switchers.forEach(item => {
        item.addEventListener('click', function () {
            switchers.forEach(item => item.parentElement.classList.remove('is-active'))
            this.parentElement.classList.add('is-active')
        })
    })
    </script>
</html>
