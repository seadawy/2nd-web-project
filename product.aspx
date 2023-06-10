<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="product.aspx.cs" Inherits="Eapha.product" %>

<!DOCTYPE html>


<html data-theme="light" xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Eapha</title>
    <link rel="stylesheet" href="css/bootstrap.min.css" />
    <link rel="stylesheet" href="css/system.css" />
    <link href="css/product.css" rel="stylesheet" />
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
                <div class="float-end d-flex">
                    <asp:HyperLink ID="HyperLink1" runat="server" href="index.aspx" class="btnico active">
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
                </div>
            </div>
        </nav>
        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
            <ContentTemplate>

                <div class="container itemPage">
                    <div class="row ">
                        <div class="col-md-6 d-flex justify-content-center flex-column ">
                            <div class="row d-flex justify-content-center Pimage">
                                <asp:Image ID="Image1" runat="server" Height="420" Width="327" />
                            </div>
                            <div class="row d-flex justify-content-center">
                                <h2 class="text-center mt-2 Pname">
                                    <asp:Label ID="name" runat="server"></asp:Label>
                                </h2>
                            </div>
                        </div>
                        <div class="col-md-6 d-flex align-content-center flex-wrap flex-column">
                            <p class="Pdes">
                                <asp:Label ID="des" runat="server"></asp:Label>
                            </p>
                            <p>
                                Price:
                                <asp:Label ID="price" runat="server"></asp:Label>$<br />
                                In Stock:<asp:Label ID="stock" runat="server"></asp:Label>
                            </p>
                            <asp:TextBox ID="quantityBox" placeholder="Quantity" CssClass="form-control" runat="server"></asp:TextBox>
                            <div class="mt-2">
                                <a href="index.aspx" class="btn btn-outline-primary"><i class="fa-solid fa-arrow-left"></i></a>
                                <asp:Button ID="Button1" CssClass="btn btn-primary" runat="server" Text="Add to Cart" OnClick="Button1_Click" />
                            </div>
                            <h3 class="mt-3">Suggestion</h3>
                            <div class="containerUL mt-2">
                                <ul>
                                    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
                                        <ItemTemplate>
                                            <li class="sus">
                                                <a href="product.aspx?id=<%# Eval("item_id") %>">
                                                    <img src="content/products/<%# Eval("item_img") %>" />

                                                </a>
                                            </li>
                                        </ItemTemplate>
                                    </asp:ListView>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:websiteConnectionString %>" SelectCommand="SELECT TOP 9 [item_id],[item_img], [item_name] FROM [items] ORDER BY NEWID()"></asp:SqlDataSource>
                                </ul>
                                <a href="#" id="prev"><i class="fas fa-angle-left"></i></a>
                                <a href="#" id="next"><i class="fas fa-angle-right"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.bundle.min.js"></script>
    <script src="js/main.js"></script>
    <script>
        function responsiveSlider() {
            const slider = document.querySelector('.container');
            let sliderWidth = slider.offsetWidth / 3;
            const sliderList = document.querySelector('ul');
            let items = sliderList.querySelectorAll('li').length - 2;
            let count = 1;

            window.addEventListener('resize', function () {
                sliderWidth = slider.offsetWidth;
            });

            function prevSlide() {
                if (count > 1) {
                    count = count - 2;
                    sliderList.style.left = '-' + count * sliderWidth + 'px';
                    count++;
                } else if (count == 1) {
                    count = items - 1;
                    sliderList.style.left = '-' + count * sliderWidth + 'px';
                    count++;
                }

            }
            function nextSlide() {
                if (count < items) {
                    sliderList.style.left = '-' + count * sliderWidth + 'px';
                    count++;

                } else if (count == items) {
                    sliderList.style.left = '0px';
                    count = 1;

                }
            }
            prev.addEventListener('click', prevSlide);
            next.addEventListener('click', nextSlide);
        }

        window.onload = function () {
            responsiveSlider();
        }
    </script>
</body>
</html>
