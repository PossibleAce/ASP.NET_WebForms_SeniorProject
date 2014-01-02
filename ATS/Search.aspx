<%@ Page Title="Search" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="ATS.Inventory.Search" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <style type="text/css">
        .style1
        {
            width: 76%;
        }
        .style2
        {
            width: 202px;
        }
        .style3
        {
            width: 134px;
        }
        .style4
        {
            width: 202px;
            height: 25px;
        }
        .style5
        {
            width: 134px;
            height: 25px;
        }
        .style7
        {
            width: 225px;
            height: 25px;
        }
        .style8
        {
            width: 225px;
        }
        .style9
        {
            width: 196px;
            height: 25px;
        }
        .style10
        {
            width: 196px;
        }
    </style>
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">

    <p> <asp:Label ID="FailLabel" runat="server" Text="Label" 
            CssClass="failureNotification" Visible="False"></asp:Label>
<asp:GridView ID="GridView1" runat="server">
    </asp:GridView></p>
    <table class="style1">
        <tr>
            <td class="style4">
                <asp:Label ID="Label10" runat="server" Text="Enter an item number:"></asp:Label>
            </td>
            <td class="style5">
                <asp:TextBox ID="itemnumber" runat="server" style="margin-left: 0px" 
                    Width="190px" MaxLength="10"></asp:TextBox>
            </td>
            <td class="style9">
                <asp:Button ID="Button4" runat="server" onclick="Button4_Click" Text="Search" />
                <asp:Label ID="FailLabel0" runat="server" CssClass="failureNotification"></asp:Label>
            </td>
            <td class="style7">
                <asp:RequiredFieldValidator ID="ItemNumberRequiredValidator" runat="server" 
                    ControlToValidate="itemnumber" ErrorMessage="Enter an item number" 
                    Font-Size="Medium" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style4">
                <asp:Label ID="Label1" runat="server" Text="This item is currently:"></asp:Label>
            </td>
            <td class="style5">
            </td>
            <td class="style9">
            </td>
            <td class="style7">
            </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="Label2" runat="server" Text="Checked Out"></asp:Label>
                :</td>
            <td class="style3">
                <asp:Label ID="checkout" runat="server"></asp:Label>
            </td>
            <td class="style10">
                <asp:Label ID="Label6" runat="server" Text="From:"></asp:Label>
                <asp:Label ID="from" runat="server"></asp:Label>
            </td>
            <td class="style8">
                <asp:Label ID="Label8" runat="server" Text="To:"></asp:Label>
                <asp:Label ID="to" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Reserved:</td>
            <td class="style3">
                <asp:Label ID="reserved" runat="server"></asp:Label>
            </td>
            <td class="style10">
                <asp:Label ID="Label11" runat="server" Text="From:"></asp:Label>
                <asp:Label ID="from2" runat="server"></asp:Label>
            </td>
            <td class="style8">
                <asp:Label ID="Label12" runat="server" Text="To:"></asp:Label>
                <asp:Label ID="to2" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="Label3" runat="server" Text="On Hold:"></asp:Label>
            </td>
            <td class="style3">
                <asp:Label ID="onhold" runat="server"></asp:Label>
            </td>
            <td class="style10">
                <asp:Label ID="Label7" runat="server" Text="From:"></asp:Label>
                <asp:Label ID="from1" runat="server"></asp:Label>
            </td>
            <td class="style8">
                <asp:Label ID="Label9" runat="server" Text="To:"></asp:Label>
                <asp:Label ID="to1" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Request:</td>
            <td class="style3">
                <asp:Button ID="Button1" runat="server" Text="Reserve" Width="100px" 
                    onclick="Button1_Click" />
            </td>
            <td class="style10">
                <asp:Button ID="Button3" runat="server" Text="Renew" Width="100px" 
                    onclick="Button3_Click" />
            </td>
            <td class="style8">
                <asp:Button ID="Button2" runat="server" Text="Hold" Width="100px" 
                    onclick="Button2_Click" />
            </td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td class="style3">
                <asp:Label ID="FailLabel1" runat="server" CssClass="failureNotification"></asp:Label>
            </td>
            <td class="style10">
                <asp:Label ID="FailLabel2" runat="server" CssClass="failureNotification"></asp:Label>
            </td>
            <td class="style8">
                <asp:Label ID="FailLabel3" runat="server" CssClass="failureNotification"></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>