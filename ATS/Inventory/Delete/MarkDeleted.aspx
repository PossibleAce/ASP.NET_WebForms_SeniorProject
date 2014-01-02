<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MarkDeleted.aspx.cs" MasterPageFile="~/Site.master" Inherits="ATS.Inventory.Delete.MarkDeleted" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2>Mark item as deleted</h2>
    <p> 
       

        <asp:Label ID="Label8" runat="server" Text="Enter Item to Modify" 
            CssClass="label" style="top: 0px; left: 0px" Width="140px"></asp:Label>
        <asp:TextBox ID="SearchTextBox" runat="server" CssClass="formInputText" 
            ></asp:TextBox>


       
        <asp:Label ID="FailLabel" runat="server" CssClass="failureNotification" 
            Text="Label" Visible="False"></asp:Label>
        <br />
        <br />
        <asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="True">
        <asp:ListItem>Deleted</asp:ListItem>
        <asp:ListItem>Available</asp:ListItem>
        </asp:RadioButtonList>
        <br />
        <asp:Button ID="SearchButton" runat="server" 
            Text="Mark Deleted" CssClass="button" onclick="SearchButton_Click1" />
    </p>
</asp:Content>