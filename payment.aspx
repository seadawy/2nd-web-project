<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="payment.aspx.cs" UnobtrusiveValidationMode="none" Inherits="Eapha.checkout" %>

<!DOCTYPE html>

<html data-theme="light">
<head runat="server">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Eapha</title>
    <link rel="stylesheet" href="css/bootstrap.min.css" />
    <link rel="stylesheet" href="css/system.css" />
    <script src="js/FontAwsome.js"></script>
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.bundle.min.js"></script>
    <script src="js/main.js"></script>


</head>
<body class="bg-body-tertiary">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div class="notification-box">
        </div>
        <nav class="navbar fixed-top">
            <div class="container">
                <a class="navbar-brand" href="#">
                    <i class="fa-solid fa-prescription-bottle-medical fa-flip"></i>
                    &nbsp;&nbsp; Eapha
                </a>
                <div class="float-end d-flex">
                    <asp:HyperLink ID="HyperLink1" runat="server" href="index.aspx" class="btnico">
                            <i class="fa-solid fa-house"></i>
                            <p class="d-none d-lg-block">Home</p>
                    </asp:HyperLink>

                    <asp:HyperLink ID="HyperLink2" runat="server" href="faq.aspx" class="btnico">
                            <i class="fa-solid fa-headset"></i>
                            <p class="d-none d-lg-block">Support</p>
                    </asp:HyperLink>
                    <asp:HyperLink ID="profile" runat="server" href="userProfile.aspx" class="btnico">
                            <i class="fa-solid fa-user"></i>
                            <p class="d-none d-lg-block">Profile</p>
                    </asp:HyperLink>

                    <asp:HyperLink ID="cart" runat="server" href="#cart" class="btnico active">
                            <i class="fa-solid fa-cart-shopping"></i>
                            <p class="d-none d-lg-block">Cart</p>
                    </asp:HyperLink>
                    <asp:HyperLink ID="logout" runat="server" class="btnico" href="logout.aspx">
                            <i class="fa-solid fa-right-from-bracket"></i>
                            <p class="d-none d-lg-block">Logout</p>
                    </asp:HyperLink>
                </div>
            </div>
        </nav>
        <div class="container" style="margin-top: 6rem">
            <main>
                <div class="row g-5">
                    <div class="col-md-5 col-lg-4 order-md-last">
                        <h4 class="d-flex justify-content-between align-items-center mb-3">
                            <span class="text-primary">Your cart</span>
                            <asp:Label ID="Label1" runat="server" class="badge bg-primary rounded-pill"></asp:Label>
                        </h4>
                        <ul class="list-group mb-3">
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server" style="display: contents">
                                <ContentTemplate>
                                    <asp:ListView ID="ListView1" runat="server">
                                        <ItemTemplate>
                                            <li class="list-group-item d-flex justify-content-between lh-sm">
                                                <div>
                                                    <h6 class="my-0"><%# Eval("Quantity") %> of <%# Eval("Name") %></h6>
                                                </div>
                                                <span class="text-body-secondary">$<%# Eval("Total") %></span>
                                            </li>
                                        </ItemTemplate>
                                    </asp:ListView>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                            <li class="list-group-item d-flex justify-content-between bg-light" id="promo0" style="display: none !important">
                                <div class="text-success">
                                    <h6 class="my-0">Promo code</h6>
                                    <small>
                                        <asp:Label ID="Label2" runat="server"></asp:Label>
                                    </small>
                                </div>
                                <span class="text-success">−$<asp:Label ID="Label3" runat="server"></asp:Label></span>
                            </li>
                            <li class="list-group-item d-flex justify-content-between">
                                <span>Total (USD)</span>
                                <strong>$<asp:Label ID="total" runat="server"></asp:Label>
                                </strong>
                            </li>
                        </ul>
                        <div class="card p-2">
                            <div class="input-group">
                                <div class="input-group">
                                    <asp:TextBox ID="promo" runat="server" class="form-control" placeholder="Promo code" ValidationGroup="promoo"></asp:TextBox>
                                    <asp:Button ID="redeem" type="button" runat="server" class="btn btn-secondary" ValidationGroup="promoo" Text="Redeem" OnClick="Redeem_Click" />
                                </div>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ValidationGroup="promoo" ErrorMessage="No Promo code founded" ControlToValidate="promo"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-7 col-lg-8">
                        <h4 class="mb-3">Billing address</h4>
                        <div class="needs-validation" novalidate="">
                            <div class="card mb-3">
                                <div class="row g-0">
                                    <div class="col-4 rounded-circle" style="width: fit-content">
                                        <asp:Image Width="150" Height="174" ID="Image1" runat="server" class="img-fluid rounded-start rounded-circle" alt="profile" />
                                    </div>
                                    <div class="col-8">
                                        <div class="card-body">
                                            <h5 class="card-title">
                                                <asp:Label ID="FullName" runat="server"></asp:Label>
                                            </h5>
                                            <p class="card-text">
                                                <small>@<asp:Label ID="userId" runat="server"></asp:Label></small><br />
                                                <small>
                                                    <asp:Label ID="phone" runat="server"></asp:Label></small><br />
                                                <asp:Label ID="Adress" runat="server"></asp:Label><br />
                                                <asp:HyperLink ID="comp" runat="server" CssClass="btn btn-primary btn-sm" Visible="False" NavigateUrl="~/userProfile.aspx">Complete Profile</asp:HyperLink>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <hr class="my-4">

                            <h4 class="mb-3">Payment</h4>

                            <div class="my-3">
                                <asp:RadioButtonList ID="MyRadioButtons" runat="server">
                                    <asp:ListItem class="form-check" Text=" Debit card" Value="1" />
                                    <asp:ListItem class="form-check" Text=" Upon receipt" Value="2" />
                                </asp:RadioButtonList>
                            </div>
                            <asp:UpdatePanel ID="UpdatePanel2" runat="server" style="display: contents">
                                <ContentTemplate>
                                    <asp:Button class="w-100 btn btn-primary btn-lg " ValidationGroup="payment" ID="check" runat="server" Text="Continue to checkout" OnClick="checkout_btn" />
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>
                    </div>
                </div>
            </main>

            <footer class="my-5 pt-5 text-body-secondary text-center text-small">
                <p class="mb-1">©2023 EAPHA</p>
            </footer>
        </div>
    </form>
    <script>
        $(document).ready(function () {
            $('input[type="radio"]').click(function () {
                var inputValue = $(this).attr("value");
                var targetBox = $("." + inputValue);
                $(".box").not(targetBox).hide();
                $(targetBox).show();
            });
        });</script>
</body>
</html>
