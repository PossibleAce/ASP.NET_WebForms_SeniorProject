<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EquipmentHoldsReport.aspx.cs" MasterPageFile="~/Site.master" Inherits="ATS.Reports.EquipmentHoldsReport" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2>
       Equipment Holds Report
    </h2>
        <p>
            <div id="Layer1" style="position:relative;width:880px; height:500px; overflow:
scroll; top: 0px; left: 20px;" align="Left">
            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True">
            <asp:ListItem>Holds</asp:ListItem>
            <asp:ListItem>Reserve</asp:ListItem>
            </asp:DropDownList> 
            <br />
            <asp:Label ID="FailLabel" runat="server" Text="Label" 
            CssClass="failureNotification" Visible="False"></asp:Label>
<asp:GridView ID="GridView1" runat="server" AllowSorting="true"   OnSorting="GridView1_Sorting">
    </asp:GridView>
    </div></p>
</asp:Content>