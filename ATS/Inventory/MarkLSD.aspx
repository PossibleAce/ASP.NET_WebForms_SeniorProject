<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MarkLSD.aspx.cs" MasterPageFile="~/Site.master" Inherits="ATS.Inventory.MarkLSD" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2>
        Mark Item as Lost, Damaged, or Stolen
    </h2>
     <p> 
       

        <asp:Label ID="Label8" runat="server" Text="Enter Item to Modify" 
            CssClass="label" style="top: 0px; left: 0px" Width="140px"></asp:Label>
        <asp:TextBox ID="SearchTextBox" runat="server" CssClass="formInputText" 
            ></asp:TextBox>
         <asp:TextBoxWatermarkExtender ID="SearchTextBox_TextBoxWatermarkExtender" 
             runat="server" TargetControlID="SearchTextBox" WatermarkText="Item #">
         </asp:TextBoxWatermarkExtender>
        <asp:Label ID="formatLabel" runat="server" Text="Format: '1234567890'"></asp:Label>
        <br />
        <asp:Label ID="FailLabel" runat="server" CssClass="failureNotification" 
            Text="Label" Visible="False"></asp:Label>
        <br />
        <br />
         <asp:CheckBoxList ID="CheckBoxList" runat="server" AutoPostBack="True">
         <asp:ListItem>Lost</asp:ListItem>
           <asp:ListItem>Damaged</asp:ListItem>
             <asp:ListItem>Stolen</asp:ListItem>
         </asp:CheckBoxList>
        <br />
        <asp:Button ID="SearchButton" runat="server" 
            Text="Mark " CssClass="button" onclick="SearchButton_Click1" />
    </p>
</asp:Content>