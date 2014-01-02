<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageHolds.aspx.cs" MasterPageFile="~/Site.master" Inherits="ATS.Holds.ManageHolds" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <style type="text/css">

        .style1
        {
            width: 99%;
            height: 561px;
        }
        .style2
        {
        }
        .style17
        {
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
            color: #666666;
        }
        .style22
        {
            color: #666666;
        }
        .style23
        {
            width: 138px;
        }
        .style24
        {
            width: 195px;
        }
        .style25
        {
            color: #0000FF;
        }
        .style26
        {
            color: #0000FF;
        }
        .style27
        {
            width: 138px;
            height: 26px;
        }
        .style28
        {
            width: 195px;
            height: 26px;
        }
        .style29
        {
            width: 161px;
            height: 26px;
        }
        .style30
        {
            width: 256px;
            height: 26px;
        }
    </style>
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <table class="style1" frame="box" >
        <tr>
            <td class="style2" rowspan="21">
                <asp:ListBox ID="ListBox1" runat="server" AutoPostBack="True" Height="197px" 
                    onselectedindexchanged="ListBox1_SelectedIndexChanged" 
                    style="margin-right: 0px" Width="223px"></asp:ListBox>
            </td>
            <td class="style23">
                <asp:Label ID="Label10" runat="server" Text="Reserve item: "></asp:Label>
            </td>
            <td class="style17" colspan="2">
                <asp:Label ID="IN" runat="server" CssClass="style25"></asp:Label>
            </td>
            <td class="style15">
                <asp:Label ID="FailLabel0" runat="server" CssClass="failureNotification"></asp:Label>
                </td>
        </tr>
        <tr>
            <td class="style23">
                <asp:Label ID="Label14" runat="server" Text="Name: "></asp:Label>
                <asp:Label ID="Name" runat="server" CssClass="style25"></asp:Label>
            </td>
            <td class="style24">
                <asp:Label ID="Label15" runat="server" Text="Serial Number: "></asp:Label>
                <asp:Label ID="SN" runat="server" CssClass="style25"></asp:Label>
            </td>
            <td class="style19">
                <asp:Label ID="Category" runat="server" Text="Category: "></asp:Label>
                <asp:Label ID="Cate" runat="server" CssClass="style25"></asp:Label>
            </td>
            <td class="style15">
                <asp:Label ID="COL1" runat="server" Text="Checkout length(Days): "></asp:Label>
                <asp:Label ID="COL" runat="server" CssClass="style25"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style4" colspan="2">
                <asp:Label ID="Label1" runat="server" Text="This item is currently:"></asp:Label>
            </td>
            <td class="style20">
            </td>
            <td class="style16">
            </td>
        </tr>
        <tr>
            <td class="style23">
                <asp:Label ID="Label2" runat="server" Text="Checked Out"></asp:Label>
                :</td>
            <td class="style24">
                <asp:Label ID="checkout" runat="server" CssClass="style25"></asp:Label>
            </td>
            <td class="style19">
                <asp:Label ID="Label6" runat="server" Text="From:"></asp:Label>
                <asp:Label ID="from" runat="server" CssClass="style25"></asp:Label>
            </td>
            <td class="style15">
                <asp:Label ID="Label8" runat="server" Text="To:"></asp:Label>
                <asp:Label ID="to" runat="server" CssClass="style25"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style23">
                Reserved:</td>
            <td class="style24">
                <asp:Label ID="reserved" runat="server" CssClass="style25"></asp:Label>
            </td>
            <td class="style19">
                <asp:Label ID="Label11" runat="server" Text="From:"></asp:Label>
                <asp:Label ID="from2" runat="server" CssClass="style25"></asp:Label>
            </td>
            <td class="style15">
                <asp:Label ID="Label12" runat="server" Text="To:"></asp:Label>
                <asp:Label ID="to2" runat="server" CssClass="style25"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style23">
                <asp:Label ID="Label3" runat="server" Text="On Hold:"></asp:Label>
            </td>
            <td class="style24">
                <asp:Label ID="onhold" runat="server" CssClass="style25"></asp:Label>
            </td>
            <td class="style19">
                <asp:Label ID="Label7" runat="server" Text="From:"></asp:Label>
                <asp:Label ID="from1" runat="server" CssClass="style25"></asp:Label>
            </td>
            <td class="style15">
                <asp:Label ID="Label9" runat="server" Text="To:"></asp:Label>
                <asp:Label ID="to1" runat="server" CssClass="style25"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style23">
                &nbsp;</td>
            <td class="style24">
                &nbsp;</td>
            <td class="style19">
                &nbsp;</td>
            <td class="style15">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2" colspan="2">
                Request Information:</td>
            <td class="style19">
                &nbsp;</td>
            <td class="style15">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style23">
                E #:</td>
            <td class="style24">
                <asp:Label ID="EN" runat="server" CssClass="style25"></asp:Label>
            </td>
            <td class="style19">
                &nbsp;</td>
            <td class="style15">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style23">
                First Name:</td>
            <td class="style24">
                <asp:Label ID="FN" runat="server" CssClass="style25"></asp:Label>
            </td>
            <td class="style19">
                &nbsp;</td>
            <td class="style15">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style23">
                Last Name:</td>
            <td class="style24">
                <asp:Label ID="LN" runat="server" CssClass="style25"></asp:Label>
            </td>
            <td class="style19">
                &nbsp;</td>
            <td class="style15">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style27">
                Email:</td>
            <td class="style28">
                <asp:Label ID="Email" runat="server" CssClass="style26"></asp:Label>
            </td>
            <td class="style29">
                </td>
            <td class="style30">
                </td>
        </tr>
        <tr>
            <td class="style23">
                Phone Number:</td>
            <td class="style24">
                <asp:Label ID="PN" runat="server" CssClass="style25"></asp:Label>
            </td>
            <td class="style19">
                &nbsp;</td>
            <td class="style15">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style23">
                Department:</td>
            <td class="style24">
                <asp:Label ID="DPT" runat="server" CssClass="style26"></asp:Label>
            </td>
            <td class="style19">
                &nbsp;</td>
            <td class="style15">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style23">
                &nbsp;</td>
            <td class="style24">
                &nbsp;</td>
            <td class="style19">
                &nbsp;</td>
            <td class="style15">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style23">
                Request Type:</td>
            <td class="style24">
                <asp:Label ID="RT" runat="server" CssClass="style26"></asp:Label>
            </td>
            <td class="style19">
                &nbsp;</td>
            <td class="style15">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style23">
                Start Date:</td>
            <td class="style24">
                <asp:Label ID="SD" runat="server" CssClass="style25"></asp:Label>
            </td>
            <td class="style22">
                End Date:</td>
            <td class="style21" id="ED">
                <asp:Label ID="ED" runat="server" CssClass="style25"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style23">
                Proccessed:</td>
            <td class="style24">
                <asp:Label ID="PRO" runat="server" CssClass="style25"></asp:Label>
            </td>
            <td class="style22">
                &nbsp;</td>
            <td class="style21" id="ED">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style23">
                Process Personnel:</td>
            <td class="style24">
                <asp:Label ID="PP" runat="server" CssClass="style25"></asp:Label>
            </td>
            <td class="style22">
                &nbsp;</td>
            <td class="style21" id="ED">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style23">
                Processed Time</td>
            <td class="style24">
                <asp:Label ID="PT" runat="server" CssClass="style25"></asp:Label>
            </td>
            <td class="style22">
                &nbsp;</td>
            <td class="style21" id="ED">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style23">
                <asp:Button ID="approve" runat="server" Text="Approve" 
                    onclick="Button1_Click1" Width="123px" CssClass="button" />
            </td>
            <td class="style24">
                <asp:Button ID="deny" runat="server" Text="Deny" onclick="Button2_Click" 
                    Width="100px" CssClass="button" />
            </td>
            <td class="style9" colspan="2">
                <asp:Label ID="FailLabel1" runat="server" CssClass="failureNotification"></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>
