<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ChangePW.aspx.cs" Inherits="ATS.AccountManagement.ChangePW" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style1
    {
        width: 869px;
        height: 201px;
    }
        .style4
        {
            width: 152px;
            height: 21px;
        }
        .style6
        {
            width: 152px;
            height: 7px;
        }
        .style8
        {
            width: 152px;
            height: 29px;
        }
        .style10
        {
            width: 152px;
            height: 31px;
        }
        .style12
        {
            width: 152px;
            height: 30px;
        }
        .style24
        {
            width: 154px;
            height: 21px;
        }
        .style25
        {
            width: 154px;
            height: 7px;
        }
        .style26
        {
            width: 154px;
            height: 29px;
        }
        .style27
        {
            width: 154px;
            height: 31px;
        }
        .style28
        {
            width: 154px;
            height: 30px;
        }
        .style34
        {
            width: 203px;
            height: 21px;
        }
        .style35
        {
            width: 203px;
            height: 7px;
        }
        .style36
        {
            width: 203px;
            height: 29px;
        }
        .style37
        {
            width: 203px;
            height: 31px;
        }
        .style38
        {
            width: 203px;
            height: 30px;
        }
        .style39
        {
            width: 379px;
            height: 21px;
        }
        .style40
        {
            width: 379px;
            height: 7px;
        }
        .style41
        {
            width: 379px;
            height: 29px;
        }
        .style42
        {
            width: 379px;
            height: 31px;
        }
        .style43
        {
            width: 379px;
            height: 30px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <p>
        Please make desiered changes to the following user:<br />
    <table class="style1">
        <tr>
            <td class="style4">
                Search for the user:</td>
            <td class="style24">
                <asp:TextBox ID="user" runat="server"></asp:TextBox>
            </td>
            <td class="style39">
                <asp:Button ID="Button4" runat="server" Text="Search" onclick="Button4_Click" />
            </td>
            <td class="style34">
                <asp:Label ID="FailLabel" runat="server" CssClass="failureNotification"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style6">
                </td>
            <td class="style25">
                </td>
            <td class="style40">
                </td>
            <td class="style35">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style8">
                User Name:</td>
            <td class="style26">
                <asp:Label ID="userName" runat="server"></asp:Label>
            </td>
            <td class="style41">
                </td>
            <td class="style36">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style10">
                Current Password:</td>
            <td class="style27">
                <asp:TextBox ID="OldPW" runat="server" TextMode="Password"></asp:TextBox>
            </td>
            <td class="style42">
                F<span id="MainContent_Label11" 
        style="color: rgb(105, 105, 105); font-family: 'Helvetica Neue', 'Lucida Grande', 'Segoe UI', Arial, Helvetica, Verdana, sans-serif; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 20.46875px; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);">ormat:&nbsp; 
    2 to 20 
    <span id="MainContent_Label13" 
        style="color: rgb(105, 105, 105); font-family: 'Helvetica Neue', 'Lucida Grande', 'Segoe UI', Arial, Helvetica, Verdana, sans-serif; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 20.46875px; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);">alphanumberic 
    </span>characters</span></td>
            <td class="style37">
                <asp:Label ID="FailLabel1" runat="server" CssClass="failureNotification"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style12">
                New Password:</td>
            <td class="style28">
                <asp:TextBox ID="NewPW" runat="server" TextMode="Password"></asp:TextBox>
            </td>
            <td class="style43">
                F<span id="MainContent_Label14" 
        
                    style="color: rgb(105, 105, 105); font-family: 'Helvetica Neue', 'Lucida Grande', 'Segoe UI', Arial, Helvetica, Verdana, sans-serif; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 20.46875px; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);">ormat:&nbsp; 
    2 to 20 
    <span id="MainContent_Label15" 
        
                    style="color: rgb(105, 105, 105); font-family: 'Helvetica Neue', 'Lucida Grande', 'Segoe UI', Arial, Helvetica, Verdana, sans-serif; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 20.46875px; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);">alphanumberic 
    </span>characters</span></td>
            <td class="style38">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style12">
                Confirm Password:</td>
            <td class="style28">
                <asp:TextBox ID="ConfirmPW" runat="server" TextMode="Password"></asp:TextBox>
            </td>
            <td class="style43">
                F<span id="MainContent_Label16" 
        
                    style="color: rgb(105, 105, 105); font-family: 'Helvetica Neue', 'Lucida Grande', 'Segoe UI', Arial, Helvetica, Verdana, sans-serif; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 20.46875px; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);">ormat:&nbsp; 
    2 to 20 
    <span id="MainContent_Label17" 
        
                    style="color: rgb(105, 105, 105); font-family: 'Helvetica Neue', 'Lucida Grande', 'Segoe UI', Arial, Helvetica, Verdana, sans-serif; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 20.46875px; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);">alphanumberic 
    </span>characters</span></td>
            <td class="style38">
                <asp:Label ID="FailLabel0" runat="server" CssClass="failureNotification"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style12">
                <asp:Label ID="FailLabel2" runat="server" CssClass="failureNotification"></asp:Label>
            </td>
            <td class="style28">
                &nbsp;</td>
            <td class="style43">
                &nbsp;</td>
            <td class="style38">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style4">
                <asp:Button ID="Button5" runat="server" onclick="Button5_Click" 
                    Text="Change Password" Width="200px" />
            </td>
            <td class="style24">
                <asp:Button ID="Button6" runat="server" onclick="Button6_Click" Text="Cancel" 
                    Width="200px" />
            </td>
            <td class="style39">
                </td>
            <td class="style34">
                &nbsp;</td>
        </tr>
    </table>
</p>
<p>
    &nbsp;</p>
<p>
    &nbsp;</p>
</asp:Content>
