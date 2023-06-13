<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/main.Master" AutoEventWireup="true" CodeBehind="order.aspx.cs" Inherits="Eapha.Admin.order" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="assets/css/datatables.min.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="page-header">
        <h3 class="page-title">Orders </h3>
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item">Admin Controls</li>
                <li class="breadcrumb-item active" aria-current="page"><a href="#">Orders</a></li>
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
                                    <th>ID</th>
                                    <th>Total</th>
                                    <th>State</th>
                                    <th>Date</th>
                                    <th>Action</th>

                                </tr>
                            </thead>
                            <tbody>
                                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                    <ContentTemplate>
                                        <asp:ListView ID="List12" runat="server" OnItemCommand="List12_ItemCommand">
                                            <ItemTemplate>
                                                <tr>
                                                    <td><%# Eval("order_id") %></td>
                                                    <td>$<%# Eval("total") %></td>
                                                    <td><%# Eval("state") %></td>
                                                    <td><%# Eval("date","{0:dd/M/yyyy}") %></td>
                                                    <td>
                                                        <asp:Button ID="Button1" type="button" runat="server" Text="Cancel" class="btn btn-danger " CommandName="canc" CommandArgument='<%# Eval("order_id") %>' />
                                                        <asp:Button ID="Button2" type="button" runat="server" Text="Delivered" class="btn btn-primary " CommandName="done" CommandArgument='<%# Eval("order_id") %>' />
                                                    </td>
                                                </tr>
                                            </ItemTemplate>
                                        </asp:ListView>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
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
