<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" MasterPageFile="~/Site.master" Inherits="ATS.Holds.Default" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2>
        Hold Management: Select an Option to Modify Holds
    </h2>
                    <p>
                    
                        <asp:Button ID="Button4" runat="server" onclick="Button4_Click" 
                        Text="Manage Holds" Width="206px" />
                    <asp:Button ID="Button2" runat="server" onclick="Button2_Click" 
                        Text="Remove Holds" Width="206px" />
                    </p>
    <p>
        <img src="http://www.wrlibrary.org/images/etsu.jpg" 
            style="height: 437px; width: 654px" /></p>
</asp:Content>