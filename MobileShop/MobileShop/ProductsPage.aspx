<%@ Page Title="" Language="C#" MasterPageFile="~/MobileShop.Master" AutoEventWireup="true" CodeBehind="ProductsPage.aspx.cs" Inherits="MobileShop.ProductsPage" %>
<%--<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>--%>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="pnlProducts" runat="server" ScrollBars="Auto" Height="500px" BorderColor="#CCCCCC" BorderStyle="Inset" BorderWidth="2px">
                                            <asp:DataList ID="dlProducts"  align="center"   runat="server" RepeatColumns="2" Width="80%" OnItemDataBound="dlProducts_ItemDataBound" style="margin-right: 127px" BorderColor="White" >
                                                <ItemTemplate>
                                                    <div align="left">
                                                        <table cellspacing="10" class="style4" style="border-color: #FFFFFF">
                                                            <tr>
                                                                <td style="height: 218px; width: 194px">                                                                 
                                                                    <%--<asp:Image ID="imgProductPhoto" runat="server" ImageUrl='<%# Eval("ImageUrl") %>' Style BorderStyle="Ridge" BorderWidth="1px" BorderColor="Black" />--%>

                                                                    <img alt="" src='<%#  Eval("ImageUrl") %>' runat="server" CommandArgument='<%# Eval("ProductID")%>' id="imgProductPhoto" style="border: 1px ridge #FFFFFF; width: 200px; height: 200px;" />
                                                                        
                                                                </td>
                                                                <td style="font-weight: bold; font-family: Verdana; height: 218px;">

                                                                    <asp:Label ID="lblProductName" runat="server" Style="font-weight:700" Text='<%# Eval("Name") %>' Font-Bold="True" Font-Names="Verdana"></asp:Label>
                                                                    <br />
                                                                    Price:
                                                                    <asp:Label ID="lblPrice" runat="server" Text='<%# Eval("Price") %>' Font-Bold="True" Font-Names="Verdana"></asp:Label>
                                                                    &nbsp;<br /> Available Stock:<asp:Label ID="lblStock" runat="server" ForeColor="#CC0000" Text='<%# Eval("AvailableStock") %>'></asp:Label>
                                                                    <br />
                                                                    <asp:Label ID="lblMsg" runat="server" ForeColor="Red" Font-Bold="True" Font-Names="Verdana"></asp:Label>
                                                                    <br />
                                                                    <br />
                                                                    <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# Eval("ProductID")%>' ForeColor="Black" OnClick="LinkButton1_Click">View Details</asp:LinkButton>
                                                                    <br />
                                                                    <br />
                                                                    <asp:Button ID="btnAddToCart" runat="server" align="center" CausesValidation="False" CommandArgument='<%# Eval("ProductID")%>' OnClick="btnAddToCart_Click" Text="Add To Cart" Width="180px" Font-Bold="True" Font-Names="Verdana" />

                                                                </td>
                                                            </tr>                                                            
                                                        </table>
                                                    </div>
                                                </ItemTemplate>
                                            </asp:DataList>
                                            <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
                                            <br />
                                        </asp:Panel>

    <asp:Panel ID="pnlDetails" runat="server" Visible="false">
        <asp:DataList ID="dlProductDetails"  align="center"   runat="server" RepeatColumns="1" Width="80%" OnItemDataBound="dlProductDetails_ItemDataBound" style="margin-right: 127px" BorderColor="White"  >
                                                <ItemTemplate>
                                                    <div align="left">
                                                        <table cellspacing="10" class="style4" style="border-color: #FFFFFF">
                                                            <tr>
                                                                <td style="height: 218px; width: 194px">                                                                 
                                                                    <%--<asp:Image ID="imgProductPhoto" runat="server" ImageUrl='<%# Eval("ImageUrl") %>' Style BorderStyle="Ridge" BorderWidth="1px" BorderColor="Black" />--%>

                                                                    <img alt="" src='<%#  Eval("ImageUrl") %>' runat="server" CommandArgument='<%# Eval("ProductID")%>' id="imgProductPhoto" style="border: 1px ridge #FFFFFF; width: 200px; height: 200px;" />
                                                                        
                                                                </td>
                                                                <td>
                                                                    &nbsp;
                                                                </td>
                                                                <td style="font-weight: bold; font-family: Verdana; height: 240px;">

                                                                    <asp:Label ID="lblProductName" runat="server" Style="font-weight:700" Text='<%# Eval("Name") %>' Font-Bold="True" Font-Names="Verdana"></asp:Label>
                                                                    <br />
                                                                    Price:
                                                                    <asp:Label ID="lblPrice" runat="server" Text='<%# Eval("Price") %>' Font-Bold="True" Font-Names="Verdana"></asp:Label>
                                                                    <br />
                                                                    <asp:Label ID="lblMsg" runat="server" ForeColor="Red" Font-Bold="True" Font-Names="Verdana"></asp:Label>
                                                                    <br />
                                                                    <br />
                                                                    Details:
                                                                    <asp:Label ID="lblDetails" runat="server" Text='<%#Eval("Description") %>' Font-Bold="false" Font-Names="Verdana" Font-Size="Medium"></asp:Label>
                                                                    <br />
                                                                    <br />
                                                                    <asp:Button ID="btnAddToCart2" runat="server" align="center" CausesValidation="False" CommandArgument='<%# Eval("ProductID")%>' OnClick="btnAddToCart2_Click" Text="Add To Cart" Width="180px" Font-Bold="True" Font-Names="Verdana" />

                                                                </td>
                                                            </tr>                                                            
                                                        </table>
                                                    </div>
                                                </ItemTemplate>
                                            </asp:DataList>
    </asp:Panel>
</asp:Content>
