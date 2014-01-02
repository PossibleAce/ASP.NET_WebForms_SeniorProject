<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" MasterPageFile="~/Site.master" Inherits="ATS.Inventory.Default" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        Inventory Management: Select an Option to Modify Equipment Inventory
        </h2>
            <p>
            <asp:Button ID="Button4" runat="server" onclick="Button4_Click" 
                Text="Add Equpment" Width="206px" />
            <asp:Button ID="Button2" runat="server" onclick="Button2_Click" 
                Text="Add Category" Width="206px" />
            <asp:Button ID="Button3" runat="server" onclick="Button3_Click" 
                Text="Delete Equipment" style="margin-bottom: 0px" 
            Width="206px" />
                </p>
                <p>
                <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Modify Equipment" Width="206px" />
                    <asp:Button ID="Button5" runat="server" onclick="Button5_Click" 
                        Text="Modify Category" Width="206px" />
                    <asp:Button ID="Button6" runat="server" onclick="Button6_Click" 
                        Text="Mark Lost/Stolen/Damaged" style="margin-bottom: 0px" 
            Width="206px" />
                
                </p>
    <p>
        <img src="http://www.wrlibrary.org/images/etsu.jpg" 
            style="height: 437px; width: 654px" /></p>
</asp:Content>
