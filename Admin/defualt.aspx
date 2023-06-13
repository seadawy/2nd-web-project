<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/main.Master" AutoEventWireup="true" CodeBehind="defualt.aspx.cs" Inherits="Eapha.Admin.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="assets/css/home.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="page-header">
        <h3 class="page-title">Task Management</h3>
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item">Admin Controls</li>
                <li class="breadcrumb-item active" aria-current="page"><a href="#">Task Management</a></li>
            </ol>
        </nav>
    </div>

    <div class="row">
        <div class="col grid-margin stretch-card">
            <div class="card">
                <div class="card-body" style="height: 32em">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <ul id="listTask" style="display: flex; flex-direction: column; gap: 6px">
                                <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" OnItemCommand="ListView1_ItemCommand">
                                    <ItemTemplate>
                                        <li class="item">
                                            <div class="start">
                                                <i class="fa-solid fa-grip"></i>
                                                <span class="text"><%# Eval("description") %></span>
                                            </div>
                                            <div class="tools">
                                                <asp:Button ID="Button2" runat="server"
                                                    Style="font-family: 'FontAwesome'" class="btn btn-danger btn-sm" Text="&#xf1f8;" CommandName="del" CommandArgument='<%# Eval("id") %>' />
                                            </div>
                                        </li>
                                    </ItemTemplate>
                                </asp:ListView>
                            </ul>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:websiteConnectionString %>" SelectCommand="SELECT * FROM [Tasks]"></asp:SqlDataSource>
                    <div id="new">
                        <div class="item">
                            <asp:TextBox type="text" name="add" ID="Add" runat="server"></asp:TextBox>
                            <asp:Button ID="Button1" runat="server" Text="Add" Style="width: 100px" OnClick="Button1_Click" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="js" runat="server">
    <script src="../js/jquery.min.js"></script>
    <script src="assets/js/jquery-sortable.js"></script>
    <script>
        $(document).ready(
            function () {
                $("#listTask").sortable({
                    group: 'listTask',
                    pullPlaceholder: false,
                    // animation on drop
                    onDrop: function ($item, container, _super) {
                        var $clonedItem = $('<li/>').css({ height: 0 });
                        $item.before($clonedItem);
                        $clonedItem.animate({ 'height': $item.height() });

                        $item.animate($clonedItem.position(), function () {
                            $clonedItem.detach();
                            _super($item, container);
                        });
                    },

                    // set $item relative to cursor position
                    onDragStart: function ($item, container, _super) {
                        var offset = $item.offset(),
                            pointer = container.rootGroup.pointer;

                        adjustment = {
                            left: pointer.left - offset.left,
                            top: pointer.top - offset.top
                        };

                        _super($item, container);
                    },
                    onDrag: function ($item, position) {
                        $item.css({
                            left: position.left - adjustment.left,
                            top: position.top - adjustment.top
                        });
                    }
                });
            }
        )
    </script>
</asp:Content>
