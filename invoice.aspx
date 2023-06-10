<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="invoice.aspx.cs" Inherits="Eapha.invoice" %>

<!DOCTYPE html>
<html>
<head>
    <title>Invoice</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            font-size: 14px;
            line-height: 1.5;
            margin: 30px;
        }

        table {
            border-collapse: collapse;
            width: 80%;
        }

        th, td {
            padding: 8px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #f2f2f2;
            font-weight: bold;
        }

        .invoice-header {
            display: flex;
            justify-content: space-between;
            margin-bottom: 20px;
        }

            .invoice-header h1 {
                margin: 0;
                font-size: 24px;
                font-weight: bold;
            }

            .invoice-header p {
                margin: 0;
                font-size: 14px;
            }

        .invoice-footer {
            margin-top: 20px;
            font-size: 12px;
            color: #777;
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="invoice-header">
            <div>
                <h1>Invoice</h1>
                <p>
                    <asp:Label ID="Label1" runat="server"></asp:Label>
                </p>

                <p>
                    <asp:Label ID="Label2" runat="server"></asp:Label>
                </p>
                <p>
                    Phone:
                    <asp:Label ID="Label3" runat="server"></asp:Label>
                </p>
                <p>
                    Email:
                    <asp:Label ID="Label4" runat="server"></asp:Label>
                </p>
            </div>
            <div>
                <p>
                    Invoice Number:                    
                    <asp:Label ID="Label5" runat="server"></asp:Label>
                </p>
                <p>
                    Invoice Date:
                    <asp:Label ID="Label6" runat="server"></asp:Label>
                </p>
            </div>
        </div>

        <center>

            <table>
                <thead>
                    <tr>
                        <th>Description</th>
                        <th>Quantity</th>
                        <th>Price</th>
                        <th>Total</th>
                    </tr>
                </thead>
                <tbody>
                    <asp:ListView ID="ListView1" runat="server">
                        <ItemTemplate>
                            <tr>
                                <td><%# Eval("name") %></td>
                                <td><%# Eval("quantity") %></td>
                                <td>$<%# Eval("Price") %></td>
                                <td>$<%# Eval("total") %></td>
                            </tr>
                        </ItemTemplate>
                    </asp:ListView>

                    <tr>
                        <td colspan="3">Total</td>
                        <td>$<asp:Label ID="Label7" runat="server"></asp:Label></td>
                    </tr>
                </tbody>
            </table>
        </center>

        <div class="invoice-footer">
            <p>Thank you for your business!</p>
        </div>
    </form>
</body>
<script>
    window.print();
    window.open('', '_self').close();


</script>
</html>
