<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/main.Master" AutoEventWireup="true" UnobtrusiveValidationMode="none" CodeBehind="addProduct.aspx.cs" Inherits="Eapha.Admin.addProduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <div class="page-header">
        <h3 class="page-title">Add Product </h3>
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item">Admin Controls</li>
                <li class="breadcrumb-item active" aria-current="page"><a href="#">Add Product</a></li>
            </ol>
        </nav>
    </div>
    <div class="row">
        <div class="col grid-margin stretch-card">
            <div class="card">
                <div class="card-body">
                    <div class="forms-sample">
                        <div class="form-group">
                            <label for="productname">Product Name</label>
                            <asp:TextBox ID="productname" runat="server" type="text" class="form-control" placeholder="Product Name"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" class="req" runat="server" ErrorMessage="required field" ControlToValidate="productname"></asp:RequiredFieldValidator>
                        </div>

                        <div class="form-group">
                            <label for="productprice">Product Price</label>
                            <asp:TextBox ID="productprice" runat="server" type="number" class="form-control" placeholder="Product Price"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" class="req" runat="server" ErrorMessage="required field" ControlToValidate="productprice"></asp:RequiredFieldValidator>
                        </div>

                        <div class="form-group">
                            <label for="productdes">Product Description</label>
                            <asp:TextBox ID="productdes" runat="server" type="text" class="form-control" placeholder="Product Description"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" class="req" runat="server" ErrorMessage="required field" ControlToValidate="productdes"></asp:RequiredFieldValidator>
                        </div>

                        <div class="form-group">
                            <label for="productStock">Product in Stock</label>
                            <asp:TextBox ID="productStock" runat="server" type="number" class="form-control" placeholder="Product in Stock"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" class="req" runat="server" ErrorMessage="required field" ControlToValidate="productdes"></asp:RequiredFieldValidator>
                        </div>

                        <div class="form-group">
                            <label for="productname">Product image</label>
                            <asp:FileUpload ID="productImage" class="form-control" runat="server" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" class="req" runat="server" ErrorMessage="required field" ControlToValidate="productImage"></asp:RequiredFieldValidator>
                        </div>

                        <asp:Button ID="Button1" runat="server" class="btn btn-primary me-2" Text="Submit" OnClick="Add_Click" />
                        <button class="btn btn-dark" type="reset">Cancel</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
