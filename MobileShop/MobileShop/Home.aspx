<%@ Page Title="" Language="C#" MasterPageFile="~/MobileShop.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="MobileShop.Home" %>

<%@ Register Assembly="DevExpress.Web.v15.2, Version=15.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="gallery-slider-parent" align="center" style="height: 286px">
        <updatepanel runat="server">
            <table width="100%">
                <tr>
                    <td width="1%" align="center">
                        <asp:ImageButton ID="ibLeft" runat="server" Height="60px" ImageUrl="~/Images/ImageSlider/LP/left.jpe" OnClick="ibLeft_Click" />

                    </td>
                    <td width="98%" align="center">
                  <asp:Image ID="Image1" runat="server" Height="300px"  Visible ="true" ImageUrl="~/Images/ImageSlider/LP/L5.jpe" Width="100%" />

                    </td >
                    <td width="1%" align="center">
                        <asp:ImageButton ID="ibRight" runat="server" Height="60px" ImageUrl="~/Images/ImageSlider/LP/right.jpe" Width="63px" OnClick="ibRight_Click" />

                    </td>
                </tr>
                <tr>                
                  <td>
                      &nbsp;
                  </td>      
                  
                </tr>
                <tr>
                    <td>
                        &nbsp;
                    </td>
                </tr>
            </table>
         <asp:Image ID="Image2" runat="server" Height="0px" Width="0px" Visible ="false" ImageUrl="~/Images/ImageSlider/LP/L4.jpg" />
            <asp:Image ID="Image3" runat="server" Height="0px" Width="0px" Visible ="false" ImageUrl="~/Images/ImageSlider/LP/l3.jpg" />
</updatepanel>
        <updatepanel runat="server">
                 <div style="background-color:#f2f2f2;font:large;" align="left">
                <span align="left" style="background-color: #f2f2f2; font-size: x-large">
                    Available Products
                </span>
            </div>
                    
            <table width="100%">                
                <tr>
                    <td width="1%">
                        <asp:ImageButton ID="lft" runat="server" ImageUrl="~/Images/ImageSlider/LP/left.jpe" Height="50px" OnClick="lft_Click" />
                    </td>
                    <td width="24.5%">
                        <asp:Image ID="img1" runat="server" ImageUrl="~/Images/ImageSlider/camera i4.jpe" />
                    </td>
                    <td width="24.5%">
                        <asp:Image ID="img2" runat="server" ImageUrl="~/Images/ImageSlider/images (1).jpe" />
                    </td>
                    <td width="24.5%">
                        <asp:Image ID="img3" runat="server" ImageUrl="~/Images/ImageSlider/ipad i3.jpe" />
                    </td>
                    <td width="24.5%">
                        <asp:Image ID="img4" runat="server" ImageUrl="~/Images/ImageSlider/laptop i6.jpe" />
                    </td>
                    <td width="1%">
                        <asp:ImageButton ID="rgt" runat="server" ImageUrl="~/Images/ImageSlider/LP/right.jpe" Height="50px" OnClick="rgt_Click" />
                    </td>
                </tr>
                <asp:Image ID="img5" runat="server" Visible="false" ImageUrl="~/Images/ImageSlider/laptop i7.jpe" Height="0px" Width="0px" />
                <asp:Image ID="img6" runat="server" Visible="false" ImageUrl="~/Images/ImageSlider/phone i2.jpe" Height="0px" Width="0px" /> 
                <asp:Image ID="img7" runat="server" Visible="false" ImageUrl="~/Images/ImageSlider/printer i1.jpe" Height="0px" Width="0px" />
            </table>
</updatepanel>

    </div>
    <div class="right-slider-button">
    </div>

</asp:Content>

