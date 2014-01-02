<%@ Page Title="Hold" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Hold.aspx.cs" Inherits="ATS.Request.Hold" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">

        .style1
        {
            width: 83%;
            height: 208px;
        }
        .style2
        {
        }
        .style17
        {
            width: 266px;
        }
        .style19
        {
            width: 161px;
        }
        .style15
        {
            width: 256px;
        }
        
        .style4
        {
            width: 234px;
            height: 25px;
        }
        .style18
        {
            width: 266px;
            height: 25px;
        }
        .style20
        {
            width: 161px;
            height: 25px;
        }
        .style16
        {
            width: 256px;
            height: 25px;
        }
        .style21
        {
            color: #FF3300;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table class="style1">
        <tr>
            <td class="style2">
                <asp:Label ID="Label10" runat="server" Text="Hold this item: "></asp:Label>
                <asp:Label ID="Label13" runat="server"></asp:Label>
            </td>
            <td class="style17">
                <asp:Label ID="FailLabel0" runat="server" CssClass="failureNotification"></asp:Label>
            </td>
            <td class="style19">
                &nbsp;</td>
            <td class="style15">
            </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="Label14" runat="server" Text="Name: "></asp:Label>
                <asp:Label ID="Name" runat="server"></asp:Label>
            </td>
            <td class="style17">
                <asp:Label ID="Label15" runat="server" Text="Serial Number: "></asp:Label>
                <asp:Label ID="SN" runat="server"></asp:Label>
            </td>
            <td class="style19">
                <asp:Label ID="Category" runat="server" Text="Category: "></asp:Label>
                <asp:Label ID="Cate" runat="server"></asp:Label>
            </td>
            <td class="style15">
                <asp:Label ID="COL1" runat="server" Text="Checkout length(Days): "></asp:Label>
                <asp:Label ID="COL" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style4">
                <asp:Label ID="Label1" runat="server" Text="This item is currently:"></asp:Label>
            </td>
            <td class="style18">
            </td>
            <td class="style20">
            </td>
            <td class="style16">
            </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="Label2" runat="server" Text="Checked Out"></asp:Label>
                :</td>
            <td class="style17">
                <asp:Label ID="checkout" runat="server"></asp:Label>
            </td>
            <td class="style19">
                <asp:Label ID="Label6" runat="server" Text="From:"></asp:Label>
                <asp:Label ID="from" runat="server"></asp:Label>
            </td>
            <td class="style15">
                <asp:Label ID="Label8" runat="server" Text="To:"></asp:Label>
                <asp:Label ID="to" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Reserved:</td>
            <td class="style17">
                <asp:Label ID="reserved" runat="server"></asp:Label>
            </td>
            <td class="style19">
                <asp:Label ID="Label11" runat="server" Text="From:"></asp:Label>
                <asp:Label ID="from2" runat="server"></asp:Label>
            </td>
            <td class="style15">
                <asp:Label ID="Label12" runat="server" Text="To:"></asp:Label>
                <asp:Label ID="to2" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="Label3" runat="server" Text="On Hold:"></asp:Label>
            </td>
            <td class="style17">
                <asp:Label ID="onhold" runat="server"></asp:Label>
            </td>
            <td class="style19">
                <asp:Label ID="Label7" runat="server" Text="From:"></asp:Label>
                <asp:Label ID="from1" runat="server"></asp:Label>
            </td>
            <td class="style15">
                <asp:Label ID="Label9" runat="server" Text="To:"></asp:Label>
                <asp:Label ID="to1" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style2">
                E #:</td>
            <td class="style17">
                <asp:TextBox ID="EN" runat="server" MaxLength="9"></asp:TextBox>
            </td>
            <td class="style19">
                &nbsp;</td>
            <td class="style15">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                First Name:</td>
            <td class="style17">
                <asp:TextBox ID="FN" runat="server" MaxLength="10"></asp:TextBox>
            </td>
            <td class="style19">
                &nbsp;</td>
            <td class="style15">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                Last Name:</td>
            <td class="style17">
                <asp:TextBox ID="LN" runat="server" MaxLength="10"></asp:TextBox>
            </td>
            <td class="style19">
                &nbsp;</td>
            <td class="style15">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                Email:</td>
            <td class="style17">
                <asp:TextBox ID="Email" runat="server" MaxLength="32"></asp:TextBox>
            </td>
            <td class="style19">
                &nbsp;</td>
            <td class="style15">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                Phone Number:</td>
            <td class="style17">
                <asp:TextBox ID="PN" runat="server"></asp:TextBox>
            </td>
            <td class="style19">
                &nbsp;</td>
            <td class="style15">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                Department:</td>
            <td class="style17">
                <asp:TextBox ID="DPT" runat="server" MaxLength="10"></asp:TextBox>
            </td>
            <td class="style19">
                &nbsp;</td>
            <td class="style15">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style21" colspan="4">
                The hold starts at the day when item will be returned and will be valid for 3 
                days to pick up.</td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Button ID="Button1" runat="server" Text="Submit" 
                    onclick="Button1_Click1" />
            </td>
            <td class="style17">
                <asp:Button ID="Button2" runat="server" Text="Cancel" onclick="Button2_Click" />
            </td>
            <td class="style9" colspan="2">
                <asp:Label ID="FailLabel1" runat="server" CssClass="failureNotification"></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>
