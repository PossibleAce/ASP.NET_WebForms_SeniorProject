<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="Login.aspx.cs" Inherits="ATS._Default" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2>
        Welcome to the ATS Inventory Management System!
    </h2>
    <p>
       <i>Providing short-term equipment loans for ETSU faculty and staff</i></p>
    <div>
        <table class="style1">
            <tr>
                <td>
                    <asp:Login ID="Login1" runat="server">
                    </asp:Login>
                &nbsp;&nbsp;&nbsp;&nbsp;
                </td>
                <td>
                         <img src="http://umorotsemenicha.ru/wp-content/uploads/2012/11/61.jpg" 
                        style="height: 327px; width: 471px" alt="NULL" /></td>
            </tr>
        </table>
&nbsp;</div>
</asp:Content>