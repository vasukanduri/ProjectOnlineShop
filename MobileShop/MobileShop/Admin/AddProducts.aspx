<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMstr.Master" AutoEventWireup="true" CodeBehind="AddProducts.aspx.cs" Inherits="MobileShop.Admin.AddProducts" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div align="center" style="height: 27px">
        <h4>
            <b>Add New Products </b></h4>

    </div>
    <table align="center" cellspacing="4" style="width: 100%; background-color: #f2f2f2; color: #000000; height: 519px; font-size: large;">
        <tr>
            <td style="width: 50%; padding-left: 200px; font-size: large;" align="left" colspan="1">Product Name:                              
            </td>
            <td style="width: 50%;" align="left">
                <asp:TextBox ID="tbProductName" runat="server" Width="212px" Height="27px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 50%; padding-left: 200px; font-size: large;" align="left">&nbsp;                             
            </td>
            <td style="width: 50%;" align="left">&nbsp;              
            </td>
        </tr>
        <tr>
            <td style="width: 50%; padding-left: 200px; font-size: large;" align="left">Product Category:                              
            </td>
            <td style="width: 50%;" align="left">
                <asp:DropDownList ID="ddlCategory" runat="server" Width="212px" Height="23px"></asp:DropDownList>

            </td>
        </tr>
        <tr>
            <td style="width: 50%; padding-left: 100px" align="left">&nbsp;                             
            </td>
            <td style="width: 50%;" align="left">&nbsp;              
            </td>
        </tr>
        <tr>
            <td style="width: 50%; padding-left: 200px; font-size: large;" align="left">Product Description:                              
            </td>
            <td style="width: 50%;" align="left">
                <asp:TextBox ID="tbProductDescription" runat="server" Width="212px" TextMode="MultiLine"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 50%;" align="right">&nbsp;                             
            </td>
            <td style="width: 50%;" align="left">&nbsp;              
            </td>
        </tr>
        <tr>
            <td style="width: 50%; padding-left: 200px; font-size: large;" align="left">Product Image:                              
            </td>
            <td style="width: 50%;" align="left">
                <asp:FileUpload ID="UploadProductImage" runat="server" Width="212px"></asp:FileUpload>
            </td>
        </tr>
        <tr>
            <td style="width: 50%; padding-left: 100px" align="left">&nbsp;                             
            </td>
            <td style="width: 50%;" align="left">&nbsp;              
            </td>
        </tr>
        <tr>
            <td style="width: 50%; padding-left: 200px; font-size: large;" align="left">Product Price:                              
            </td>
            <td style="width: 50%;" align="left">
                <asp:TextBox ID="tbProductPrice" runat="server" Width="212px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 50%; padding-left: 100px" align="left">&nbsp;                             
            </td>
            <td style="width: 50%;" align="left">&nbsp;              
            </td>
        </tr>
        <tr>
            <td style="width: 50%; padding-left: 200px; font-size: large;" align="left">Product Quantity:                              
            </td>
            <td style="width: 50%;" align="left">
                <asp:TextBox ID="tbProductQuantity" runat="server" Width="212px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 50%; padding-left: 100px" align="left">&nbsp;                             
            </td>
            <td style="width: 50%;" align="left">&nbsp;              
            </td>
        </tr>
        <tr>
            <td style="width: 50%; padding-left: 100px" align="left"></td>
            <td style="width: 50%;" align="left">
                <asp:Button ID="btnProductSubmit" runat="server" Width="212px" Text="Submit" OnClick="btnProductSubmit_Click" CausesValidation="False"></asp:Button>
            </td>
        </tr>
        <tr>
            <td style="width: 50%; padding-left: 100px" align="left">&nbsp;                             
            </td>
            <td style="width: 50%;" align="left">&nbsp;              
            </td>
        </tr>
    </table>
</asp:Content>
