<%@ Page Title="Default" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ATS.Request.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">


 <h2>
        Request Item Home: Submit an equipment item Request based on the Item's Status
        </h2>
    <p>
                    <asp:Button ID="Button4" runat="server" onclick="Button4_Click" 
                        Text="Request Hold" Width="206px" />
                    <asp:Button ID="Button2" runat="server" onclick="Button2_Click" 
                        Text="Reserve Request" Width="206px" />
                        <asp:Button ID="Button5" runat="server" onclick="Button3_Click" 
                        Text="Request Renew" style="margin-bottom: 0px" 
            Width="206px" />
                   
                </p>

    <p>
        <img src="http://www.wrlibrary.org/images/etsu.jpg" 
            style="height: 437px; width: 654px" /></p>



</asp:Content>
