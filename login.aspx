<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" UnobtrusiveValidationMode="none"
    Inherits="Eapha.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="css/login.css" />
    <title>Sign in & Sign up</title>
    <script src="js/FontAwsome.js"></script>
</head>

<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div class="container sign-mood">
            <div class="forms-container">
                <div class="signin-signup">
                    <!-- LOGIN -->
                    <div autocomplete="off" class="form sign-in-form">
                        <h2 class="title">Sign in</h2>
                        <asp:UpdatePanel ID="UpdatePanel1" class="panelfix" runat="server">
                            <ContentTemplate>
                                <div class="alertlable">
                                    <input type="checkbox" class="alertCheckbox" autocomplete="off" />
                                    <div class="alert error" id="loginError">
                                        <span class="alertText">check your login information</span>
                                    </div>
                                </div>
                                <div class="input-field">
                                    <i class="fas fa-user"></i>
                                    <asp:TextBox ID="user1" runat="server" autocomplete="off" type="text"
                                        name="user1" placeholder="Username" ValidationGroup="login"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                        ErrorMessage="*" ControlToValidate="user1" CssClass="req"
                                        ValidationGroup="login"></asp:RequiredFieldValidator>
                                </div>

                                <div class="input-field">
                                    <i class="fas fa-lock"></i>
                                    <asp:TextBox ID="pass1" runat="server" autocomplete="off" type="password"
                                        name="pass1" placeholder="Password" ValidationGroup="login"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                                        ErrorMessage="*" ControlToValidate="pass1" CssClass="req"
                                        ValidationGroup="login"></asp:RequiredFieldValidator>
                                </div>
                                <asp:Button ID="signin" runat="server" Text="Login" autocomplete="false"
                                    name="signin" class="btn solid" ValidationGroup="login" OnClick="login_btn" />
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                    <!-- REGIST -->
                    <div autocomplete="off" class="form sign-up-form ">
                        <h2 class="title">Sign up</h2>
                        <asp:UpdatePanel ID="UpdatePanel2" class="panelfix" runat="server">
                            <ContentTemplate>
                                <div class="alertlable">
                                    <input type="checkbox" class="alertCheckbox" autocomplete="off" />
                                    <div class="alert error" id="registError">
                                        <asp:Label ID="registLabel" class="alertText" runat="server" Text="Label">
                                        </asp:Label>
                                    </div>
                                </div>
                                <div class="input-field">
                                    <i class="fas fa-user"></i>
                                    <asp:TextBox ID="user" runat="server" autocomplete="off" type="text" name="user"
                                        placeholder="Username" ValidationGroup="signup"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" CssClass="req"
                                        runat="server" ErrorMessage="*" ValidationGroup="signup"
                                        ControlToValidate="user"></asp:RequiredFieldValidator>
                                </div>
                                <div class="input-field">
                                    <i class="fas fa-envelope"></i>
                                    <asp:TextBox ID="email" runat="server" autocomplete="off" type="email"
                                        name="email" placeholder="Email" ValidationGroup="signup"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" CssClass="req"
                                        runat="server" ErrorMessage="*" ValidationGroup="signup"
                                        ControlToValidate="email"></asp:RequiredFieldValidator>

                                </div>
                                <div class="input-field">
                                    <i class="fas fa-lock"></i>
                                    <asp:TextBox ID="pass" runat="server" ValidationGroup="signup"
                                        autocomplete="off" type="password" name="pass" placeholder="Password">
                                    </asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6"
                                        ValidationGroup="signup" runat="server" ErrorMessage="*" CssClass="req"
                                        ControlToValidate="pass"></asp:RequiredFieldValidator>

                                </div>
                                <div class="input-field">
                                    <i class="fas fa-lock"></i>
                                    <asp:TextBox ID="confirmpass" runat="server" ValidationGroup="signup"
                                        autocomplete="off" type="password" name="pass"
                                        placeholder="Confirm Password"></asp:TextBox>
                                    <asp:CompareValidator ID="CompareValidator1" ValidationGroup="signup"
                                        runat="server" ErrorMessage="X" ControlToCompare="confirmpass"
                                        ControlToValidate="pass" CssClass="req"></asp:CompareValidator>

                                </div>
                                <asp:Button ID="signup" ValidationGroup="signup" runat="server" Text="Sign up"
                                    autocomplete="false" class="btn" name="signup" OnClick="sign_btn" />

                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>
            </div>

            <div class="panels-container">
                <div class="panel left-panel">
                    <center>
                        <div class="content">
                            <h3>New here ?</h3>
                            <div class="btncontainer">
                                <input type="button" value="Sign up" class="btn transparent" id="sign-up-btn" />
                                <a href="index.aspx" class="btn transparent home"><i class="fas fa-home"></i></a>
                            </div>
                        </div>
                    </center>
                </div>
                <div class="panel right-panel">
                    <div class="content">
                        <h3>Already have an account ?</h3>
                        <div class="btncontainer">

                            <input type="button" value="Sign in" name="signin" class="btn transparent"
                                id="sign-in-btn" />
                            <a href="index.aspx" class="btn transparent home"><i class="fas fa-home"></i></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
<script>
    function walert() {
        document.getElementByClassName('alert').style.display = 'block';
    }
    const sign_in_btn = document.querySelector("#sign-in-btn");
    const sign_up_btn = document.querySelector("#sign-up-btn");
    const container = document.querySelector(".container");

    sign_up_btn.addEventListener("click", () => {
        container.classList.add("sign-up-mode");
        container.classList.remove("sign-mood");
    });

    sign_in_btn.addEventListener("click", () => {
        container.classList.remove("sign-up-mode");
        container.classList.add("sign-mode");
    });
    if (window.location.href.includes("#regist")) {
        sign_up_btn.click();
    }

</script>

</html>
