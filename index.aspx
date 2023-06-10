<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" UnobtrusiveValidationMode="none"
    EnableEventValidation="false" Inherits="Eapha.index" %>

<!DOCTYPE html>

<html data-theme="light" xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Eapha</title>
    <link rel="stylesheet" href="css/bootstrap.min.css" />
    <link rel="stylesheet" href="css/index.css" />
    <link rel="stylesheet" href="css/system.css" />
    <script src="js/FontAwsome.js"></script>
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
                <div class="float-end d-flex align-items-center">
                    <asp:HyperLink ID="HyperLink1" runat="server" href="#start" class="btnico active">
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
                    <asp:Button class="theme " ID="Button2" Style="font-family: 'FontAwesome'" OnClick="Button2_Click" OnClientClick="theme()" runat="server" Text="&#xf0eb;" />
                </div>
            </div>
        </nav>

        <span id="start"></span>
        <section>
            <div class="container-fluid mt-5">
                <div class="row">
                    <div class="col-sm-6 col-md-6 d-flex justify-content-center">
                        <img src="asset/1.png" class="img-fluid" width="599" alt="manange tasks">
                    </div>
                    <div class="col mt-2 ml-5 d-flex justify-content-center flex-column">
                        <h1 style="font-size: 70px;">A pharmacy
                            <br>
                            made with love 
                        </h1>
                        <p>to help you find your medication easily, quickly and without moving a muscle.</p>
                        <div class="d-flex gap-2">
                            <a href="#feature" class="btn btn-primary getting">Geting started</a>
                        </div>
                    </div>
                    <div id="tptohere"></div>
                </div>
            </div>
            <div class="container">
                <div class="row d-flex justify-content-center px-3 my-5">
                    <div id="cover">
                        <div class="tb">
                            <div class="td">
                                <input type="search" id="search" placeholder="Find your medication">
                            </div>
                            <div class="td" id="s-cover">
                                <i class="fa-solid fa-magnifying-glass fs-1" style="color: #ffffff;"></i>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="display">
                    <center>
                        <asp:UpdatePanel runat="server" ID="updatePanelN76">
                            <ContentTemplate>
                                <div class="card flex-column d-none" style="width: 500px; height: fit-content; padding: 10px" id="xxx">
                                    <p>This product was not found please enter product information and wait for response</p>
                                    <div class="mb-3">
                                        <label for="exampleFormControlInput1" class="form-label">Email address</label>
                                        <asp:TextBox type="email" class="form-control" placeholder="name@example.com" ID="txt_email" runat="server"></asp:TextBox>

                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ControlToValidate="txt_email" ValidationGroup="feadback"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="mb-3">
                                        <label for="txt_email" class="form-label">Midicine detaials</label>
                                        <asp:TextBox class="form-control" ID="TextArea1" Rows="3" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="TextArea1" ValidationGroup="feadback"></asp:RequiredFieldValidator>
                                    </div>
                                    <asp:Button ID="Button1" runat="server" CssClass="btn btn-primary" Text="Send" ValidationGroup="feadback" OnClick="Button1_Click" />
                                </div>
                                </center>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                        <ul class="cards" style="margin-top: 5em;">
                            <asp:UpdatePanel ID="UpdatePanel2" style="display: contents" runat="server">
                                <ContentTemplate>
                                    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1"
                                        OnItemCommand="view_addCart">
                                        <ItemTemplate>
                                            <li class="cards__item" id="<%# Container.DataItemIndex %>">
                                                <div class="card">
                                                    <div class="card-inner">
                                                        <div class="card-front">
                                                            <center>
                                                                <img width="273" src="content/products/<%# Eval(" item_img") %>"
                                                                    class="card__image">
                                                            </center>
                                                            <div class="card__content">
                                                                <div class="card__title">
                                                                    <!-- [item_id],[item_name],[priceprice],[offer_price],[description],[item_img] -->
                                                                    <%# Eval("item_name") %>
                                                                    <span>
                                                                        <%# Eval("price") %>$
                                                                    </span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="card-back">
                                                            <p>in stock: <%# Eval("quantity") %></p>
                                                            <p>
                                                                <%#Eval("description").ToString().Length > 100 ? Eval("description").ToString().Substring(0, 100) + "..." : Eval("description") %>
                                                            </p>
                                                        </div>
                                                    </div>
                                                    <div style="margin: 9px">
                                                        <div class="number">
                                                            <asp:TextBox ID="Quantity" class="quantity"
                                                                placeholder="quantity" min="1" type="number" runat="server"
                                                                ValidationGroup="item"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1"
                                                                runat="server" CssClass="d-none"
                                                                ErrorMessage="RequiredFieldValidator"
                                                                ControlToValidate="Quantity"></asp:RequiredFieldValidator>
                                                        </div>
                                                        <div class="d-flex Pbtncontain">
                                                            <asp:Button type="button" ID="AddCart"
                                                                class="btnCart form-control add_to_cart bright" runat="server"
                                                                Text="&#xf217;" CommandName="addCart"
                                                                CommandArgument='<%# Eval("item_id") + "," + Eval("item_name") +  "," + Eval("price") %>'
                                                                ValidationGroup="item" />
                                                            <a href="product.aspx?id=<%# Eval(" item_id") %>" class="btnCart
                                                            form-control bleft">show</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </li>
                                        </ItemTemplate>
                                    </asp:ListView>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                                ConnectionString="<%$ ConnectionStrings:websiteConnectionString %>"
                                ProviderName="<%$ ConnectionStrings:websiteConnectionString.ProviderName %>"
                                SelectCommand="SELECT TOP (5) * FROM [items]"></asp:SqlDataSource>
                        </ul>
                </div>
            </div>

            <svg id="ff" data-name="Layer 1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1200 120"
                preserveAspectRatio="none">
                <path d="M600,112.77C268.63,112.77,0,65.52,0,7.23V120H1200V7.23C1200,65.52,931.37,112.77,600,112.77Z"
                    class="shape-fill">
                </path>
            </svg>
        </section>
        <section class="d-flex justify-content-center flex-column" id="feature">
            <div class="topic">
                <h2 class="feature__title">Our Features</h2>
            </div>
            <div class="features">
                <div class="feature feature-one">
                    <h2 class="feature__title">Simple pricing</h2>
                    <p class="feature__desc">
                        Our pricing options are clear and understandable.
                    </p>
                    <img class="feature__img"
                        src="https://kellychi22.github.io/frontend-mentor-solutions/10-four-card-feature-section/images/icon-supervisor.svg"
                        alt="">
                </div>
                <div class="wrapper">
                    <div class="feature feature-two">
                        <h2 class="feature__title">24/7 Service</h2>
                        <p class="feature__desc">
                            Many consumers prefer to seek a solution themselves, we offer you the
                        assistance needed 24/7.
                        </p>
                        <img class="feature__img"
                            src="https://kellychi22.github.io/frontend-mentor-solutions/10-four-card-feature-section/images/icon-team-builder.svg"
                            alt="">
                    </div>
                    <div class="feature feature-three">
                        <h2 class="feature__title">Saves Time & Effort</h2>
                        <p class="feature__desc">Instead of going far for a local pharmacy , Eapha does that for you.</p>
                        <img class="feature__img"
                            src="https://kellychi22.github.io/frontend-mentor-solutions/10-four-card-feature-section/images/icon-karma.svg"
                            alt="">
                    </div>
                </div>
                <div class="feature feature-four">
                    <h2 class="feature__title">Works with insurance</h2>
                    <p class="feature__desc">You'll see medication prices based on your plan.</p>
                    <img class="feature__img"
                        src="https://kellychi22.github.io/frontend-mentor-solutions/10-four-card-feature-section/images/icon-calculator.svg"
                        alt="">
                </div>
            </div>
            <br>
            <br>
            <br>
            <div id="team">
                <div class="topic">
                    <h2 class="feature__title">Our Team</h2>
                </div>
                <div class="features">
                    <div class="team member-one">
                        <h2 class="feature__title">Sief Ibrahim </h2>
                        <img class="s" src="asset/seif.png" alt="seif">
                        <i class="fa-solid fa-person fa-2xl" style="color: hsl(0, 78%, 62%);"></i>
                        <p class="feature__desc">
                            The leader of the team, also responsible for most of the back-end and the master page.
                        <br>
                            <br>
                            sief0ibrahem@gmail.com
                        </p>

                    </div>

                    <div class="team member-two">
                        <h2 class="feature__title">Seadawy </h2>
                        <img class="s" src="asset/seadawy.png" alt="seadawy">
                        <i class="fa-solid fa-person fa-2xl" style="color: hsl(34, 97%, 64%);"></i>
                        <p class="feature__desc">
                            The coach, helps the other members with every error & responsible for the front-end .
                        <br>
                            <br>
                            k9335551@gmail.com
                        </p>
                    </div>


                    <div class="team member-three">
                        <h2 class="feature__title">Omnia Maher </h2>
                        <img class="s" src="asset/Awish.png" alt="omnia">
                        <i class="fa-solid fa-person-dress fa-2xl" style="color: #64e42a;"></i>
                        <p class="feature__desc">
                            The feminine touch, helps in the designs, some of the back-end and the ASP.NET .
                        <br>
                            <br>
                            omniamaher565@gmail.com
                        </p>

                    </div>
                </div>
                <br>
                <br>
                <br>
                <br>
                <br>
                <br>
            </div>
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
    <script src="js/main.js"></script>
    <script>
        $('#search').click(function () { $('#tptohere')[0].scrollIntoView({ behavior: "smooth" }); });
        const main = document.getElementsByTagName("html")[0];
        console.log(main);
        const es = $("#Button2");
        function theme() {
            if (main.getAttribute("data-theme") == "light") {
                main.setAttribute("data-theme", "dark")
            } else {
                main.setAttribute("data-theme", "light")
            }
        }
        $(window).scroll(function () {
            var scrollPosition = $(this).scrollTop();
            var navbar = $('.navbar');
            var search = $('#cover');

            if (scrollPosition >= 600) {
                navbar.removeClass('fixed-top');
                search.addClass('fixed-top');
            } else {
                navbar.addClass('fixed-top');
                search.removeClass('fixed-top');
            }
        });
    </script>


</body>

</html>
