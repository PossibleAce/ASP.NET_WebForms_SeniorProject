<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" MasterPageFile="~/Site.master" Inherits="ATS.Checkinouts.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        Checkin/out Management: Select an option to Continue </h2>
    <p>
                    <asp:Button ID="Button4" runat="server" onclick="Button4_Click" 
                        Text="Check-Out Equipment" Width="206px" />
                    <asp:Button ID="Button2" runat="server" onclick="Button2_Click" 
                        Text="Check-In Equipment" Width="206px" />
                    
                </p>
    <p>
        <img src="http://www.wrlibrary.org/images/etsu.jpg" 
            style="height: 437px; width: 654px" /></p>
</asp:Content>