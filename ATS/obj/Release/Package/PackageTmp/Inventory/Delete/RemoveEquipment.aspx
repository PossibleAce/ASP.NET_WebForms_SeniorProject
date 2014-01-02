<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RemoveEquipment.aspx.cs" MasterPageFile="~/Site.master" Inherits="ATS.Inventory.Delete.RemoveEquipment" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2>
        Remove Equipment Item

    </h2>
        <p> 
       

        <asp:Label ID="Label8" runat="server" Text="Enter Item to Remove" 
            CssClass="label" style="top: 0px; left: 0px" Width="140px"></asp:Label>
        <asp:TextBox ID="SearchTextBox" runat="server" CssClass="formInputText" 
            ></asp:TextBox>
        <asp:Label ID="formatLabel" runat="server" Text="Format: '1234567890'"></asp:Label>
        <br />
        <asp:Label ID="FailLabel" runat="server" CssClass="failureNotification" 
            Text="Label" Visible="False"></asp:Label>
        <br />
        <asp:Button ID="SearchButton" runat="server" 
            Text="Delete" CssClass="button" onclick="SearchButton_Click1" />
    </p>
</asp:Content>