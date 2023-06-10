<%@ Page Language="C#" AutoEventWireup="true" UnobtrusiveValidationMode="none" EnableEventValidation="false" CodeBehind="userProfile.aspx.cs" Inherits="Eapha.userProfile" %>

<!DOCTYPE html>

<html data-theme="light" xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Eapha</title>
    <link rel="stylesheet" href="css/bootstrap.min.css" />
    <link rel="stylesheet" href="css/system.css" />
    <link rel="stylesheet" href="css/setting.css" />
    <link href="css/datatables.min.css" rel="stylesheet" />
    <script src="js/FontAwsome.js"></script>
</head>

<body>
    <form id="form1" runat="server" enctype="multipart/form-data">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div class="notification-box">
        </div>
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
                    <asp:HyperLink ID="HyperLink3" runat="server" href="payment.aspx" class="btn btn-primary">Payment</asp:HyperLink>
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
                    <asp:HyperLink ID="HyperLink1" runat="server" href="index.aspx" class="btnico">
                            <i class="fa-solid fa-house"></i>
                            <p class="d-none d-lg-block">Home</p>
                    </asp:HyperLink>

                    <asp:HyperLink ID="HyperLink2" runat="server" href="faq.aspx" class="btnico">
                            <i class="fa-solid fa-headset"></i>
                            <p class="d-none d-lg-block">Support</p>
                    </asp:HyperLink>
                    <asp:HyperLink ID="profile" runat="server" href="userProfile.aspx" class="btnico active">
                            <i class="fa-solid fa-user"></i>
                            <p class="d-none d-lg-block">Profile</p>
                    </asp:HyperLink>
                    <asp:HyperLink ID="cart" runat="server" href="#cart" class="btnico">
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
        <div class="overallcontainer">
            <div class="container align-middle">
                <div class="row align-middle gap-5">
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server" style="display: contents">
                        <ContentTemplate>
                            <div class="col col-lg-4 d-flex flex-column align-items-center">
                                <center>
                                    <asp:Image ID="Image1" class="rounded-circle shadow-4-strong profileshadow my-3" width="300" height="300" alt="profile" runat="server" />
                                </center>
                                <div class="btn-group-vertical" role="group">
                                    <a class="btn btn-primary taps tablinks active" id="START" onclick="taps(event, 'setting')">Settings</a>
                                    <a class="btn btn-primary taps tablinks" id="pp" onclick="taps(event, 'password')">Change password</a>
                                    <a class="btn btn-primary taps tablinks" id="ord" onclick="taps(event, 'orders')">Orders</a>
                                </div>
                            </div>
                            <!--setting-->
                            <div class="col col-lg-7 tabcontent" id="setting">
                                <div class="input-group mb-3">
                                    <div class="input-group">
                                        <label class="input-label">First name</label>
                                        <asp:TextBox type="text" class="form-control input-element" placeholder="Frist Name" ID="fname" runat="server" ValidationGroup="setting"></asp:TextBox>
                                    </div>
                                    <div class="input-group">
                                        <label class="input-label">Last Name</label>
                                        <asp:TextBox type="text" class="form-control input-element" placeholder="Last Name" ID="lname" runat="server" ValidationGroup="setting"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="input-group mb-3">
                                    <label class="input-label">Username</label>
                                    <asp:TextBox type="text" class="form-control input-element" placeholder="Username" ID="uname" runat="server" ValidationGroup="setting" Style="background: #7a7a7a59" ReadOnly="true"></asp:TextBox>
                                </div>
                                <div class="input-group mb-3">
                                    <label class="input-label">Email</label>
                                    <asp:TextBox type="text" class="form-control input-element" placeholder="Email" ID="email" runat="server" ValidationGroup="setting" Style="background: #7a7a7a59" ReadOnly="true"></asp:TextBox>
                                </div>
                                <div class="input-group mb-3">
                                    <label class="input-label">Phone</label>
                                    <asp:TextBox type="text" class="form-control input-element" placeholder="phone" ID="phone" runat="server" ValidationGroup="setting"></asp:TextBox>
                                </div>
                                <div class="input-group mb-3">
                                    <div class="input-group" style="width: 35%;">
                                        <label class="input-label">City</label>
                                        <asp:TextBox type="text" class="form-control input-element" placeholder="City" ID="city" runat="server" ValidationGroup="setting"></asp:TextBox>
                                    </div>
                                    <div class="input-group">
                                        <label class="input-label">Address</label>
                                        <asp:TextBox type="text" class="form-control input-element" placeholder="Address" ID="address" runat="server" ValidationGroup="setting"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="mb-3 input-group" style="gap: 0;">
                                    <label class="input-group-text" for="inputGroupFile01">Avastar</label>
                                    <asp:FileUpload ID="FileUpload1" class="form-control" type="file" runat="server" />
                                </div>
                                <asp:Button ID="Button1" class="btn btn-primary float-end" runat="server" Text="Save changes" OnClick="setting" ValidationGroup="setting" />
                            </div>
                            <!-- change password-->
                            <div class="col col-lg-7 tabcontent" id="password">
                                <div class="input-group mb-3">
                                    <label class="input-label">Old Password</label>
                                    <asp:TextBox type="text" class="form-control input-element" placeholder="Old Password" ID="oldpass" runat="server" ValidationGroup="change"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="*" ControlToValidate="oldpass" ForeColor="Red" ValidationGroup="change" CssClass="req"></asp:RequiredFieldValidator>
                                </div>
                                <div class="input-group mb-3">
                                    <label class="input-label">New Password</label>
                                    <asp:TextBox type="text" class="form-control input-element" placeholder="New Password" ID="newpass" runat="server" ValidationGroup="change"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="*" ControlToValidate="newpass" ForeColor="Red" ValidationGroup="change" CssClass="req"></asp:RequiredFieldValidator>
                                </div>
                                <div class="input-group mb-3">
                                    <label class="input-label">Confirm Password</label>
                                    <asp:TextBox type="text" class="form-control input-element" placeholder="New Password" ID="confirm" runat="server" ValidationGroup="change"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="*" ControlToValidate="confirm" ForeColor="Red" ValidationGroup="change" CssClass="req"></asp:RequiredFieldValidator>
                                    <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Not the same password" ValidationGroup="change" ControlToValidate="confirm" ControlToCompare="newpass" Operator="Equal" ForeColor="Red" CssClass="req"></asp:CompareValidator>
                                </div>
                                <asp:Button ID="Button2" class="btn btn-primary float-end" runat="server" Text="change the password" OnClick="Button2_click" ValidationGroup="change" />
                            </div>
                        </ContentTemplate>
                        <Triggers>
                            <asp:PostBackTrigger ControlID="Button1" />
                        </Triggers>
                    </asp:UpdatePanel>

                    <!--orders-->
                    <div class="col col-lg-7 tabcontent" id="orders">
                        <table id="ordersTable" class="table table-striped card d-table" style="width: 100%; padding: 5px">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Total</th>
                                    <th>State</th>
                                    <th>Date</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:ListView ID="ListView1" runat="server" OnItemCommand="ListView1_Details">
                                    <ItemTemplate>
                                        <tr>
                                            <td>SD23<%# Eval("order_id") %>XW</td>
                                            <td>$<%# Eval("total") %></td>
                                            <td><%# Eval("state") %></td>
                                            <td><%# Eval("date","{0:dd/M/yyyy}") %></td>
                                            <td>
                                                <asp:Button ID="Button3" type="button" runat="server" Text="Details" class="btn btn-info btn-sm" CommandName="invoice" CommandArgument='<%# Eval("order_id") %>' />
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:ListView>
                            </tbody>
                        </table>
                    </div>

                </div>
            </div>
        </div>
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.bundle.min.js"></script>
        <script src="js/datatables.min.js"></script>
        <script src="js/main.js"></script>
        <script>
            $(document).ready(function () {
                $('#ordersTable').DataTable();
                $("#START").click();
                if (window.location.href.includes("#order")) {
                    $("#ord").click();
                }
            });
        </script>
    </form>
</body>

</html>
