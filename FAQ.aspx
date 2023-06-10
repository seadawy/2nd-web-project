<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FAQ.aspx.cs" Inherits="Eapha.FAQ" %>

<!DOCTYPE html>

<html data-theme="light">
<head runat="server">

    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <script>document.getElementsByTagName("html")[0].className += " js";</script>
    <link rel="stylesheet" href="css/bootstrap.min.css" />
    <link rel="stylesheet" href="css/system.css" />
    <link rel="stylesheet" href="css/faq.css" />
    <script src="js/FontAwsome.js"></script>
    <title>FAQ </title>
</head>
<body>

    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div class="notification-box"></div>
        <div class="popup" id="popup" role="alert">
            <div class="popup-container">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <table class="table table-striped table-hover">
                            <thead>
                                <tr>
                                    <th scope="col">Product</th>
                                    <th scope="col">Quantity</th>
                                    <th scope="col">Price</th>
                                    <th scope="col">Total</th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:ListView ID="ListView2" runat="server">
                                    <ItemTemplate>
                                        <tr>
                                            <td>
                                                <%# Eval("Name") %>
                                            </td>
                                            <td>
                                                <%# Eval("Quantity") %>
                                            </td>
                                            <td>
                                                <%# Eval("Price") %>$
                                            </td>
                                            <td>
                                                <%# Eval("Total") %>$
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:ListView>
                            </tbody>
                        </table>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <div class="d-flex align-items-center justify-content-between">
                    <asp:Label ID="Label1" runat="server" CssClass="fs-5" Text="Total"></asp:Label>
                    <a href="payment.aspx" class="btn btn-primary">Payment</a>
                </div>
            </div>
        </div>
        <nav class="navbar fixed-top">
            <div class="container">
                <a class="navbar-brand" href="#">
                    <i class="fa-solid fa-prescription-bottle-medical fa-flip"></i>
                    &nbsp;&nbsp; Eapha
                </a>
                <div class="float-end d-flex">
                    <asp:HyperLink ID="HyperLink1" runat="server" href="index.aspx" class="btnico ">
                            <i class="fa-solid fa-house"></i>
                            <p class="d-none d-lg-block">Home</p>
                    </asp:HyperLink>
                    <asp:HyperLink ID="HyperLink2" runat="server" href="#start" class="btnico active">
                            <i class="fa-solid fa-headset"></i>
                            <p class="d-none d-lg-block">Support</p>
                    </asp:HyperLink>
                    <asp:HyperLink ID="profile" runat="server" href="userProfile.aspx" class="btnico">
                            <i class="fa-solid fa-user"></i>
                            <p class="d-none d-lg-block">Profile</p>
                    </asp:HyperLink>

                    <asp:HyperLink ID="cart" runat="server" href="#cart" class="btnico">
                            <i class="fa-solid fa-cart-shopping"></i>
                            <p class="d-none d-lg-block">Cart</p>
                    </asp:HyperLink>
                    <asp:HyperLink ID="login" runat="server" href="login.aspx" class="btnico">
                            <i class="fa-solid fa-user"></i>
                            <p class="d-none d-lg-block">Login</p>
                    </asp:HyperLink>
                    <asp:HyperLink ID="signup" runat="server" href="login.aspx#regist" class="btnico">
                            <i class="fa-solid fa-user-plus"></i>
                            <p class="d-none d-lg-block">Sign-up</p>
                    </asp:HyperLink>
                    <asp:HyperLink ID="logout" runat="server" class="btnico" href="logout.aspx">
                            <i class="fa-solid fa-right-from-bracket"></i>
                            <p class="d-none d-lg-block">Logout</p>
                    </asp:HyperLink>
                </div>
            </div>
        </nav>
        <div id="start"></div>
        <header class="cd-header flex flex-column flex-center">
            <div class="text-component text-center">
                <h1>FAQ</h1>
                <p style="color: white">We know some problems might face you so here is some Frequently Asked Questions and there answers.</p>
            </div>
        </header>

        <section class="cd-faq js-cd-faq container max-width-md margin-top-lg margin-bottom-lg">
            <ul class="cd-faq__categories d-none">
                <li><a class="cd-faq__category cd-faq__category-selected truncate" href="#account">Account</a></li>
                <li><a class="cd-faq__category truncate" href="#payments">Payments</a></li>
                <li><a class="cd-faq__category truncate" href="#delivery">Delivery</a></li>
            </ul>
            <!-- cd-faq__categories -->

            <div class="cd-faq__items">
                <ul id="account" class="cd-faq__group">
                    <li class="cd-faq__title">
                        <h2>Account</h2>
                    </li>
                    <li class="cd-faq__item">
                        <a class="cd-faq__trigger" href="#0"><span>Do I just stay logged in ?</span></a>
                        <div class="cd-faq__content">
                            <div class="text-component">
                                <p>No, you can logout. There is a 'Logout' icon in the navigation bar , with just one press you are logged out.  </p>
                            </div>
                        </div>
                        <!-- cd-faq__content -->
                    </li>


                    <li class="cd-faq__item">
                        <a class="cd-faq__trigger" href="#0"><span>How do I change my password ?</span></a>
                        <div class="cd-faq__content">
                            <div class="text-component">
                                <p>Press the 'Profile' icon in the navigation bar , then beneath your profile picture you'll find a 'Change password' button.</p>
                            </div>
                        </div>
                        <!-- cd-faq__content -->
                    </li>

                    <li class="cd-faq__item">
                        <a class="cd-faq__trigger" href="#0"><span>How do I sign up ?</span></a>
                        <div class="cd-faq__content">
                            <div class="text-component">
                                <p>Press the 'Sign-up' icon in the navigation bar and fill your information.  </p>
                            </div>
                        </div>
                        <!-- cd-faq__content -->
                    </li>
                    <li class="cd-faq__item">
                        <a class="cd-faq__trigger" href="#0"><span>How do I change my account information ?</span></a>
                        <div class="cd-faq__content">
                            <div class="text-component">
                                <p>Press the 'Profile' icon in the navigation bar and change as information as you want. </p>
                            </div>
                        </div>
                        <!-- cd-faq__content -->
                    </li>


                    <li class="cd-faq__item">
                        <a class="cd-faq__trigger" href="#0"><span>Can users add or remove products ?</span></a>
                        <div class="cd-faq__content">
                            <div class="text-component">
                                <p>
                                    NO. users can not add or remove any product , but we would be happy to hear your complains and suggestions about products.
						<br />
                                    So please let us know  using <a href="#">our emails.</a>
                                </p>
                            </div>
                        </div>
                        <!-- cd-faq__content -->
                    </li>


                    <li class="cd-faq__item">
                        <a class="cd-faq__trigger" href="#0"><span>Can I change my username ?</span></a>
                        <div class="cd-faq__content">
                            <div class="text-component">
                                <p>Unfortunately NO, Your username can not be changed. </p>
                            </div>
                        </div>
                        <!-- cd-faq__content -->
                    </li>
                </ul>
                <!-- cd-faq__group -->



                <ul id="payments" class="cd-faq__group">
                    <li class="cd-faq__title">
                        <h2>Payments</h2>
                    </li>
                    <li class="cd-faq__item">
                        <a class="cd-faq__trigger" href="#0"><span>Can I have an invoice for my order ?</span></a>
                        <div class="cd-faq__content">
                            <div class="text-component">
                                <p>
                                    YES, Press the 'Profile' icon in the navigation bar , then beneath your profile picture you'll find an 'Orders' button.
				  <br />
                                    you'll find a table of your orders , press 'Details' infront of the order you want to have its invoice.
                                </p>
                            </div>
                        </div>
                        <!-- cd-faq__content -->
                    </li>

                    <li class="cd-faq__item">
                        <a class="cd-faq__trigger" href="#0"><span>Why did my credit card fail ?</span></a>
                        <div class="cd-faq__content">
                            <div class="text-component">
                                <p>Maybe you should refill your credit card information correctly and in case this did not help please contact our team using <a href="#">email.</a> </p>
                            </div>
                        </div>
                        <!-- cd-faq__content -->
                    </li>

                    <li class="cd-faq__item">
                        <a class="cd-faq__trigger" href="#0"><span>Why isn't the promo code working ?</span></a>
                        <div class="cd-faq__content">
                            <div class="text-component">
                                <p>Maybe you entered an expired promo code. </p>
                            </div>
                        </div>
                        <!-- cd-faq__content -->
                    </li>
                </ul>
                <!-- cd-faq__group -->

                <ul id="delivery" class="cd-faq__group">
                    <li class="cd-faq__title">
                        <h2>Delivery</h2>
                    </li>
                    <li class="cd-faq__item">
                        <a class="cd-faq__trigger" href="#0"><span>What should I do if my order hasn't been delivered yet ?</span></a>
                        <div class="cd-faq__content">
                            <div class="text-component">
                                <p>
                                    That's unfortunate.
				<br>
                                    You can call the customer service 14572 or contact our team using <a href="#">email.</a>
                                </p>
                            </div>
                        </div>
                        <!-- cd-faq__content -->
                    </li>

                    <li class="cd-faq__item">
                        <a class="cd-faq__trigger" href="#0"><span>Who takes care of shipping?</span></a>
                        <div class="cd-faq__content">
                            <div class="text-component">
                                <p>Our delivery team.</p>
                            </div>
                        </div>
                        <!-- cd-faq__content -->
                    </li>

                    <li class="cd-faq__item">
                        <a class="cd-faq__trigger" href="#0"><span>Do you have international delivery ?</span></a>
                        <div class="cd-faq__content">
                            <div class="text-component">
                                <p>Unfortunately NOT YET, we are working on it and it will be available soon.</p>
                            </div>
                        </div>
                        <!-- cd-faq__content -->
                    </li>


                    <li class="cd-faq__item">
                        <a class="cd-faq__trigger" href="#0"><span>When will my order arrive?</span></a>
                        <div class="cd-faq__content">
                            <div class="text-component">
                                <p>
                                    Beneath your profile picture you'll find an 'Orders' button.
				  <br />
                                    you'll find a table of your orders shipping information.
                                </p>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
            <a href="#0" class="cd-faq__close-panel text-replace">Close</a>
            <div class="cd-faq__overlay" aria-hidden="true"></div>
        </section>
        <footer class="my-3 text-body-secondary text-center text-small">
            <p class="mb-1"><a href="welcome.html">Eapha</a> ©2023 </p>
        </footer>
        <a href="#start" class="up">
            <i class="fa-solid fa-square-caret-up fs-1" style="color: #104b82"></i>
        </a>
    </form>
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.bundle.min.js"></script>
    <script src="js/util.js"></script>
    <script src="js/faqmain.js"></script>
</body>
</html>
