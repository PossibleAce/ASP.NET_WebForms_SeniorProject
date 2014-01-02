<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ModifyUserAccount.aspx.cs" Inherits="ATS.AccountManagement.ModifyUserAccount" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style1
        {
            width: 700px;
            float: left;
        }
        .style2
        {
            width: 192px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <p>
        Please make desiered changes to the following user:</p>
    <table align="left" class="style1">
        <tr>
            <td class="style2">
                Search for the user:&nbsp;&nbsp;&nbsp;&nbsp;
            </td>
            <td>
                <asp:TextBox ID="user" runat="server" MaxLength="20"></asp:TextBox>
                <asp:TextBoxWatermarkExtender ID="user_TextBoxWatermarkExtender" runat="server" 
                    TargetControlID="user" WatermarkText="User Name">
                </asp:TextBoxWatermarkExtender>
            </td>
            <td>
                <asp:Button ID="Button4" runat="server" Text="Search" onclick="Button4_Click" 
                    CssClass="button" />
                <asp:Label ID="FailLabel" runat="server" CssClass="failureNotification"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                User Name:</td>
            <td>
                <asp:Label ID="userName" runat="server"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                ATS Personel ID:&nbsp;&nbsp;&nbsp;</td>
            <td>
    <asp:TextBox ID="atsid" runat="server" MaxLength="9"></asp:TextBox>
                <asp:TextBoxWatermarkExtender ID="atsid_TextBoxWatermarkExtender" 
                    runat="server" TargetControlID="atsid" WatermarkText="E00000000">
                </asp:TextBoxWatermarkExtender>
            </td>
            <td>
                F<span id="MainContent_Label4" 
        style="color: rgb(105, 105, 105); font-family: 'Helvetica Neue', 'Lucida Grande', 'Segoe UI', Arial, Helvetica, Verdana, sans-serif; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 20.46875px; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);">ormat:&nbsp; 
    Exxxxxxxx</span></td>
        </tr>
        <tr>
            <td class="style2">
                First Name:</td>
            <td>
                <asp:TextBox ID="firstname" runat="server"></asp:TextBox>
                <asp:TextBoxWatermarkExtender ID="firstname_TextBoxWatermarkExtender" 
                    runat="server" TargetControlID="firstname" WatermarkText = "First">
                </asp:TextBoxWatermarkExtender>
            </td>
            <td>
                F<span id="MainContent_Label11" 
        style="color: rgb(105, 105, 105); font-family: 'Helvetica Neue', 'Lucida Grande', 'Segoe UI', Arial, Helvetica, Verdana, sans-serif; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 20.46875px; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);">ormat:&nbsp; 
    2 to 20 
    <span id="MainContent_Label13" 
        style="color: rgb(105, 105, 105); font-family: 'Helvetica Neue', 'Lucida Grande', 'Segoe UI', Arial, Helvetica, Verdana, sans-serif; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 20.46875px; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);">alphanumberic 
    </span>characters</span></td>
        </tr>
        <tr>
            <td class="style2">
                Last Name:&nbsp;&nbsp;</td>
            <td>
                <asp:TextBox ID="lastname" runat="server"></asp:TextBox>
                <asp:TextBoxWatermarkExtender ID="lastname_TextBoxWatermarkExtender" 
                    runat="server" TargetControlID="lastname" WatermarkText = "Last">
                </asp:TextBoxWatermarkExtender>
            </td>
            <td>
                F<span id="MainContent_Label12" 
        style="color: rgb(105, 105, 105); font-family: 'Helvetica Neue', 'Lucida Grande', 'Segoe UI', Arial, Helvetica, Verdana, sans-serif; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 20.46875px; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);">ormat:&nbsp; 
    2 to 20 
    <span id="MainContent_Label14" 
        style="color: rgb(105, 105, 105); font-family: 'Helvetica Neue', 'Lucida Grande', 'Segoe UI', Arial, Helvetica, Verdana, sans-serif; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 20.46875px; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);">alphanumberic 
    </span>characters</span></td>
        </tr>
        <tr>
            <td class="style2">
                Email Address:&nbsp;&nbsp;</td>
            <td>
                <asp:TextBox ID="email" runat="server"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                Phone Number:</td>
            <td>
                <asp:TextBox ID="phone" runat="server"></asp:TextBox>
                <asp:TextBoxWatermarkExtender ID="phone_TextBoxWatermarkExtender" 
                    runat="server" TargetControlID="phone" WatermarkText = "(555)555-5555">
                </asp:TextBoxWatermarkExtender>
            </td>
            <td>
                F<span id="MainContent_Label8" 
        style="color: rgb(105, 105, 105); font-family: 'Helvetica Neue', 'Lucida Grande', 'Segoe UI', Arial, Helvetica, Verdana, sans-serif; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 20.46875px; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);">ormat:&nbsp; 
    (xxx) xxx-xxxx</span></td>
        </tr>
        <tr>
            <td class="style2">
                Account Type:</td>
            <td>
                <asp:RadioButton ID="RadioButton1" runat="server" GroupName="2" 
                    Text="Super Admin" />
            </td>
            <td>
                <asp:RadioButton ID="RadioButton2" runat="server" GroupName="2" Text="Admin" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:RadioButton ID="RadioButton3" runat="server" GroupName="2" 
                    Text="ATS Personnel" />
            </td>
        </tr>
        <tr>
            <td class="style2">
                Account Status:</td>
            <td>
                <asp:RadioButton ID="RadioButton4" runat="server" GroupName="3" 
                    Text="Actived" />
            </td>
            <td>
                <asp:RadioButton ID="RadioButton5" runat="server" GroupName="3" 
                    Text="Inactived" />
            </td>
        </tr>
        <tr>
            <td class="style2">
    <asp:Button ID="update" runat="server" Text="Update User Account" 
        Width="208px" onclick="update_Click" CssClass="button" />
            </td>
            <td>
    <asp:Button ID="reset" runat="server" Text="Clear All Values" Width="164px" 
        onclick="Button1_Click" CssClass="button" />
            </td>
            <td>
    <asp:Button ID="cancel" runat="server" Text="Cancel" Width="164px" 
        onclick="Button3_Click" CssClass="button" />
            </td>
        </tr>
    </table>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <br />
    <br />&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
    <br />&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br />
    <br />&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br />
    <br />&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <br />
    <br />&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br />
    <br />&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
    <br />&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br />
    <br />
    <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </asp:Content>
