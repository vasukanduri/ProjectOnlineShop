<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="MobileShop.Admin.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <div style="margin: 200px;">
            <table align="center" style="border:1px ridge #240202; width: 558px; height: 253px; background-color: #f2f2f2;">
                <tr>
                    <td align="center" colspan="2" style="background-color: #f2f2f2; font-size: large">
                        <asp:Label ID="lblAdminModule" runat="server" Font-Names="Aharoni" ForeColor="#800000" Text="OnlineShopAdminPanel"
                            Style="font-weight: 700"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td align="center" style="background-color: #f2f2f2; font-size: large;">Login ID:
                    </td>
                    <td style="width: 50%;">
                        <asp:TextBox ID="tbAdminID" runat="server" Width="168px"></asp:TextBox>

                    </td>
                </tr>
                <tr>
                    <td align="center" style="background-color: #f2f2f2; font-size: large;">Password:
                    </td>
                    <td style="width: 50%;">
                        <asp:TextBox ID="tbPassword" runat="server" TextMode="Password" Width="167px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td align="center" style="background-color: #f2f2f2; font-size: large;">
                        &nbsp
                    </td>
                    <td style="width:50%;">
                        <asp:Button ID="btnSubmit" runat="server" Text="Login" OnClick="btnSubmit_Click" Width="175px" />
                     </td>
                </tr>
                <tr>
                    <td align="center" colspan="2" style="background-color: #f2f2f2; font-size: large">
                        <hr />
                           <asp:Label ID="lblAlert" runat="server" Font-Names="Aharoni" ForeColor="Red"></asp:Label>
                    </td>                    
                </tr>
            </table>
        </div>
    </div>
    </form>
</body>
</html>
