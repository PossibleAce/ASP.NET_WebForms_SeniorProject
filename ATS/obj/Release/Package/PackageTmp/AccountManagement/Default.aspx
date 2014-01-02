<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ATS.AccountManagement.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            height: 81px;
            width: 277px;
        }
        .style3
        {
            width: 277px;
        }
    </style>
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        Account Magagement: Select an Option
        </h2>
    <p>
                    &nbsp;</p>
    <p>
        <table class="style1">
            <tr>
                <td class="style2" height="300">
                    <br />
                    <asp:Button ID="Button4" runat="server" onclick="Button4_Click" 
                        Text="Add User Account" Width="206px" />
                    <br />
                    <br />
                    <asp:Button ID="Button2" runat="server" onclick="Button2_Click" 
                        Text="Modify User Account" Width="206px" />
                    <br />
                    <br />
                    <asp:Button ID="Button3" runat="server" onclick="Button3_Click" 
                        Text="Change Password" style="margin-bottom: 0px" 
            Width="206px" />
                </td>
                <td rowspan="3">
                    <img src="http://imgsrv.thompsononline.ca/image/DbLiteGraphic/201209/11538128.jpg?1366492890" /></td>
            </tr>
            <tr>
                <td class="style3" height="300">
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                </td>
            </tr>
            <tr>
                <td class="style3">
                    &nbsp;</td>
            </tr>
        </table>
    </p>
</asp:Content>
