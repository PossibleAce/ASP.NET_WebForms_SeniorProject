<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EquipmentItemsReport.aspx.cs" MasterPageFile="~/Site.master" Inherits="ATS.Reports.EquipmentItemsReport" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2>
       Equipment Item Holds
    </h2>
        <p>
            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True">
            <asp:ListItem>Lost, Damaged, or Stolen</asp:ListItem>
            <asp:ListItem>Checked Out</asp:ListItem>
            <asp:ListItem>Equipment Item List</asp:ListItem>
            </asp:DropDownList> 
            <br />
            </p>
              <div id="Layer1" style="position:relative;width:880px; height:500px; overflow:
scroll; top: 0px; left: 20px;" >
<p>
            <asp:Label ID="FailLabel" runat="server" Text="Label" 
            CssClass="failureNotification" Visible="False"></asp:Label>
<asp:GridView ID="GridView1" runat="server" AllowSorting="true"   OnSorting="GridView1_Sorting" >
               

    </asp:GridView>
    </p>
    </div>
    
</asp:Content>
