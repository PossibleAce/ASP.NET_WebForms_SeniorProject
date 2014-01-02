<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" MasterPageFile="~/Site.master" Inherits="ATS.Inventory.Delete.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <p>
        Welcome to ATS INVENTORY MANAGEMENT SYSTEM</p>
    <p>
                    <asp:Button ID="Button4" runat="server" onclick="Button4_Click" 
                        Text="Mark as Deleted Only" Width="206px" />
                    <asp:Button ID="Button2" runat="server" onclick="Button2_Click" 
                        Text="Mark as Sent to Surplus" Width="206px" />
                    <asp:Button ID="Button3" runat="server" onclick="Button3_Click" 
                        Text="Remove Equipment Completely" style="margin-bottom: 0px" 
            Width="206px" />
                </p>
    <p>
        <img src="http://www.wrlibrary.org/images/etsu.jpg" 
            style="height: 437px; width: 654px" /></p>
</asp:Content>