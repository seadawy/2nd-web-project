<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/main.Master" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="feadback.aspx.cs" Inherits="Eapha.Admin.feadback" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <div class="page-header">
        <h3 class="page-title">Feadback </h3>
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item">Admin Controls</li>
                <li class="breadcrumb-item active" aria-current="page"><a href="#">Feadback</a></li>
            </ol>
        </nav>
    </div>
    <div class="row">
        <div class="col grid-margin stretch-card">
            <div class="card">
                <div class="card-body">
                    <div class="table-responsive">
                        <table id="feadbackTable" class="table card d-table" style="width: 100%; padding: 5px">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Email</th>
                                    <th>Feadback message</th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:ListView ID="ListView12" runat="server" OnItemCommand="ListView12_ItemCommand">
                                    <ItemTemplate>
                                        <tr>
                                            <td><%# Container.DataItemIndex +1 %></td>
                                            <td><%# Eval("email") %></td>
                                            <td><%# Eval("msg") %></td>
                                            <td>
                                                <asp:Button type="button" ID="Button1" runat="server" class="btn btn-danger btn-sm" Text="delete" CommandName="dele" CommandArgument='<%# Eval("id") %>' /></td>
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
