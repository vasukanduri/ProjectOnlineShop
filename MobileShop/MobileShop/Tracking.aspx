<%@ Page Title="" Language="C#" MasterPageFile="~/MobileShop.Master" AutoEventWireup="true" CodeBehind="Tracking.aspx.cs" Inherits="MobileShop.Tracking" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager runat="server"></asp:ScriptManager>
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <asp:Panel align="center" ID="pnlTrack" runat="server" Width="100%">
                <table style="width: 90%; font-family: Verdana;" align="center">
                    <tr>
                        <td align="center">
                            <h1>Track Your Transaction
                            </h1>
                        </td>

                    </tr>
                </table>

                <table width="90%" align="center" style="font-family: Verdana">
                    <tr>
                        <td width="50%">TransactionId
                        </td>
                        <td width="50%" height="100%">
                            <asp:DropDownList ID="ddlTransID" runat="server" Height="19px" Width="223px" AutoPostBack="True" OnSelectedIndexChanged="ddlTransID_SelectedIndexChanged1">
                            </asp:DropDownList>

                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>

                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>

                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>

                    </tr>
                </table>
                
                           <asp:Repeater ID="rptrCustomer" runat="server">
                               <HeaderTemplate>
                                   <table style="border: thin double #336699; width: 500px; font-family: Verdana; font-size: medium;" cellpadding="0" align="center">
                                       <tr style="background-color: #FFFFFF; color: #000000; font-size: medium; font-family: Verdana; font-weight: bold;">
                                           <td colspan="2">
                                               <b>CustomerDetails</b>
                                           </td>
                                       </tr>
                               </HeaderTemplate>
                               <ItemTemplate>
                                   <tr style="background-color: #EBEFF0">
                                       <td>
                                           <table style="background-color: #EBEFF0; border-top: 1px dotted #df5015; width: 500px">
                                               <tr>
                                                   <td>Name:
                                                       <asp:Label ID="lblName" runat="server" Text='<%#Eval("Name") %>' Font-Bold="false" />
                                                   </td>
                                               </tr>
                                           </table>
                                       </td>
                                   </tr>
                                   <tr>
                                       <td>Phoneno:
                                           <asp:Label ID="lblPhone" runat="server" Text='<%#Eval("PhoneNo") %>' />
                                       </td>
                                   </tr>
                                   <tr>
                                       <td>Email:
     <asp:Label ID="lblUser" runat="server" Font-Bold="false" Text='<%#Eval("Email") %>' /></td>
                                   </tr>
                                   <tr>
                                       <td>Address:<asp:Label ID="lblDate" runat="server" Font-Bold="false" Text='<%#Eval("Address") %>' /></td>
                                   </tr>
                                   <tr>
                                       <td>TotalProducts:
                                           <asp:Label ID="Label1" runat="server" Font-Bold="false" Text='<%#Eval("TotalProducts") %>' /></td>
                                   </tr>
                                   <tr>
                                       <td>TotalPrice:<asp:Label ID="Label2" runat="server" Font-Bold="false" Text='<%#Eval("TotalPrice") %>' /></td>
                                   </tr>
                                   </table>
</td>
</tr>
                                   <tr>
                                       <td colspan="2">&nbsp;</td>
                                   </tr>
                               </ItemTemplate>
                               <FooterTemplate>
                                   </table>
                               </FooterTemplate>
                           </asp:Repeater>
                <br />
                <br />

                <table style="border: 1px none #336699; width: 500px; background-color: #FFFFFF;" cellpadding="0" align="center">
                    <asp:GridView ID="gvTransactionItems" runat="server" Style="margin-left: 0px" BorderColor="#336699" Font-Size="Medium" Font-Bold="False" Font-Names="Verdana" CellPadding="0" Width="500px">
                        <HeaderStyle BackColor="#CCCCCC" ForeColor="Black" Font-Bold="True" Width="500px" />
                    </asp:GridView>
                </table>

            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
