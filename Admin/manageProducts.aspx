<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/main.Master" AutoEventWireup="true" CodeBehind="manageProducts.aspx.cs" EnableEventValidation="false" Inherits="Eapha.Admin.manageProducts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="assets/css/datatables.min.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <div class="page-header">
        <h3 class="page-title">Products </h3>
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item">Admin Controls</li>
                <li class="breadcrumb-item active" aria-current="page"><a href="#">Products</a></li>
            </ol>
        </nav>
    </div>
    <div class="row">
        <div class="col grid-margin stretch-card">
            <div class="card">
                <div class="card-body">
                    <div class="table-responsive">
                        <table id="ordersTable" class="table card d-table" style="width: 100%; padding: 5px">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Product</th>
                                    <th>Price</th>
                                    <th>Left in stock</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:ListView ID="Listview1" runat="server" OnItemCommand="List_ItemCommand">
                                    <ItemTemplate>
                                        <tr>
                                            <td><%# Container.DataItemIndex +1 %></td>
                                            <td><%# Eval("item_name") %></td>
                                            <td>$<%# Eval("price") %></td>
                                            <td><%# Eval("quantity") %></td>
                                            <td>
                                                <a href='editProduct.aspx?id=<%# Eval("item_id") %>' style="font-size: 18px;" class="btn btn-primary btn-sm"><i class="fa-solid fa-pen-to-square"></i></a>
                                                <asp:Button type="button" ID="Button1" Style="font-family: 'FontAwesome'" runat="server" class="btn btn-danger btn-sm" Text="&#xf1f8;" CommandName="del" CommandArgument='<%# Eval("item_id") %>' />
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
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="js" runat="server">
    <script src="assets/js/datatables.min.js"></script>
    <script>
        $('#ordersTable').DataTable();
    </script>
</asp:Content>
