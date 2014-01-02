<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Checkin.aspx.cs" MasterPageFile="~/Site.master" Inherits="ATS.Checkinouts.Checkin" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2>
       Check In Equipment Item
    </h2>
    <p> 
    

        <asp:Label ID="Label8" runat="server" Text="Enter Item to Check In" 
            CssClass="label" style="top: 0px; left: 0px" Width="140px"></asp:Label>
        <asp:TextBox ID="ItemNumTextBox" runat="server" CssClass="formInputText" 
            ></asp:TextBox>
        <asp:Label ID="formatLabel" runat="server" Text="Format: '1234567890'"></asp:Label>
        <br />
        <br /> 
          <asp:Label ID="Label1" runat="server" Text="Enter Faculty E-Number" 
            CssClass="label" style="top: 0px; left: 0px" Width="140px"></asp:Label>
        <asp:TextBox ID="EnumTextBox" runat="server" CssClass="formInputText" 
            ></asp:TextBox>
        <asp:Label ID="Label2" runat="server" Text="Format: 'E12345678'"></asp:Label>
        <br />
        <br /> 
        <asp:Label ID="FailLabel" runat="server" CssClass="failureNotification" 
            Text="Label" Visible="False"></asp:Label>
            <br /> <br /> 
        <asp:Button ID="SearchButton" runat="server" 
            Text="Submit Checkin" CssClass="button" onclick="SearchButton_Click1" />
    </p>
</asp:Content>