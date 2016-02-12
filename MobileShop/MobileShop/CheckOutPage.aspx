<%@ Page Title="" Language="C#" MasterPageFile="~/MobileShop.Master" AutoEventWireup="true" CodeBehind="CheckOutPage.aspx.cs" Inherits="MobileShop.CheckOutPage" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager runat="server"></asp:ScriptManager>
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <asp:Panel ID="pnlMyCart" runat="server">
                <asp:DataList ID="dlCart" align="center" runat="server" RepeatColumns="1" Width="80%" OnItemDataBound="dlCart_ItemDataBound" Style="margin-right: 127px" BorderColor="White">
                    <ItemTemplate>
                        <div align="left">
                            <table cellspacing="10" class="style4" style="border-color: #FFFFFF">
                                <tr>
                                    <td style="height: 218px; width: 194px">
                                        <%--<asp:Image ID="imgProductPhoto" runat="server" ImageUrl='<%# Eval("ImageUrl") %>' Style BorderStyle="Ridge" BorderWidth="1px" BorderColor="Black" />--%>

                                        <img alt="" src='<%#  Eval("ImageUrl") %>' runat="server" commandargument='<%# Eval("ProductID")%>' id="imgProductPhoto" style="border: 1px ridge #FFFFFF; width: 200px; height: 200px;" />

                                    </td>
                                    <td>&nbsp;
                                    </td>
                                    <td style="font-weight: bold; font-family: Verdana; height: 240px;">

                                        <asp:Label ID="lblProductName" runat="server" Style="font-weight: 700" Text='<%# Eval("Name") %>' Font-Bold="True" Font-Names="Verdana" Font-Underline="True"></asp:Label>
                                        <br />
                                        <br>
                                        AvailableStock:&nbsp;
                                                                    <asp:Label ID="lblAvailableStock" runat="server" Font-Bold="true" ForeColor="Red" Text='<%# Eval("ProductQuantity") %>' ToolTip="Available Stock"></asp:Label>
                                        <br>
                                        <br>
                                        Price:<asp:Label ID="lblPrice" runat="server" Text='<%# Eval("Price") %>'></asp:Label>
                                        &nbsp;x&nbsp;
                                                                    <asp:TextBox ID="tbProductQuantity" runat="server" AutoPostBack="true" Height="20px" MaxLength="1" OnTextChanged="tbProductQuantity_TextChanged" Text='<%# Eval("ProductQuantity") %>' Width="20px"></asp:TextBox>
                                        <asp:HiddenField ID="HiddenField1" runat="server" Value='<%# Eval("ProductID") %>' />
                                        <asp:HiddenField ID="hfProductID" runat="server" Value='<%# Eval("ProductID") %>' />

                                        <br>
                                        <br>
                                        <asp:Label ID="lblMsg" runat="server" Font-Bold="True" Font-Names="Verdana" ForeColor="Red"></asp:Label>
                                        <br />
                                        <br />
                                        <asp:Button ID="btnRemoveFromCart" runat="server" align="center" CausesValidation="False" CommandArgument='<%# Eval("ProductID")%>' Font-Bold="True" Font-Names="Verdana" Text="RemoveFromCart" Width="180px" OnClick="btnRemoveFromCart_Click" />
                                        <br>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </ItemTemplate>
                </asp:DataList>
                <div align="center">
                 <asp:Button ID="btnChkOut" runat="server" Text="CheckOut" BackColor="#F2F2F2" CausesValidation="False" Font-Bold="True" Font-Names="Verdana" Font-Size="Medium" ForeColor="Black" Height="27px" OnClick="btnChkOut_Click" Width="209px" />

                </div>
            </asp:Panel>
            <asp:Panel ID="pnlCustomerDetails" runat="server" Visible="False">                
                                            
                                            <table align="center" cellspacing="4"" style="background-color: #f2f2f2; width: 80%; height: 80%; font-family: Verdana; font-size: large; color: #000000;" >
                                                <tr>
                                                    <td colspan="1">
                                                        Name:
                                                    </td>
                                               
                                                    <td>
                                                       <asp:TextBox ID="tbCustomerName" runat="server" Width="230px"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="tbCustomerName"
                                                             ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        PhoneNo:
                                                    </td>
                                               
                                                    <td>
                                                       <asp:TextBox ID="tbCustomerPhone" runat="server" Width="230px"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="rfvPhone" runat="server" ControlToValidate="tbCustomerPhone"
                                                             ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        Email:
                                                    </td>
                                               
                                                    <td>
                                                       <asp:TextBox ID="tbCustomerEmail" runat="server" Width="230px"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="tbCustomerEmail"
                                                             ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        Address:
                                                    </td>
                                               
                                                    <td>
                                                       <asp:TextBox ID="tbCustomerAddress" runat="server" Width="230px"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="rfvAddress" runat="server" ControlToValidate="tbCustomerAddress"
                                                             ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        TotalProducts:
                                                    </td>
                                               
                                                    <td class="auto-style2">
                                                       <asp:TextBox ID="tbTotalProducts" runat="server" Width="230px"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="rfvTotalProducts" runat="server" ControlToValidate="tbTotalProducts"
                                                             ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                 <tr>
                                                    <td>
                                                        TotalPrice:
                                                    </td>
                                               
                                                    <td class="auto-style2">
                                                       <asp:TextBox ID="tbTotalPrice" runat="server" Width="230px"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="rfvTotalPrice" runat="server" ControlToValidate="tbTotalPrice"
                                                             ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                               
                                               
                                                <tr>                                                  
                                               
                                                    <td>
                                                        <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="tbCustomerEmail" ForeColor="Red" 
                                                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ErrorMessage="Please Enter Valid Email ">
                                                        </asp:RegularExpressionValidator>
                                                    </td>
                                                     <td>
                                                        <asp:Button ID="btnPlaceOrder" runat="server" Text="PlaceYourOrder" Width="230px" sty Font-Size="10pt" Font-Bold="True" OnClick="btnPlaceOrder_Click" Font-Names="Verdana" Height="23px" />
                                                    </td>
                                                </tr>
                                            </table>                                            
                                        </asp:Panel>
          <asp:Panel ID="pnlOrderPlacedSuccessfully" runat="server" Visible="False">
              <div style="text-align:center; font-family: Verdana;">
                                                <asp:Image ID="SuccessIcon" runat="server" ImageUrl="~/Images/success.jpe" ImageAlign="Middle" />
                                                <br />
                                                <br/>
                                                <label style="color: #336699; font-size: xx-large; font-family: Verdana;">
                                                    Order Placed Successfully.
                                                <br />
                                                </label><br />
                                                Transaction details Emailed.Your Transaction&nbsp;Number Is&nbsp;<br />&nbsp;<br />
                                                <asp:Label ID="lblTransactionNo" runat="server" Font-Size="Medium"></asp:Label>

                                                <br />
                                                <br />

                                                <br />
                                                <br />

                                            </div>
          </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
