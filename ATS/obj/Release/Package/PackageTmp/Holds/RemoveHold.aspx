<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RemoveHold.aspx.cs" MasterPageFile="~/Site.master" Inherits="ATS.Holds.RemoveHold" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2>
        Welcome to the ATS Inventory Management System!
    </h2>
    <h4> Items Currently On Hold
    </h4>
    
    
    <asp:Label ID="FailLabel" runat="server" CssClass="failureNotification" 
        Visible="False"></asp:Label>
    
    <div id="Layer1" style="position:relative;width:676px; height:500px; overflow:
scroll; top: 0px; left: 143px;" align="center">

    <asp:Table ID="HoldTable" runat="server" GridLines="Both" HorizontalAlign="Center">
       
         <asp:TableRow ID="TableRow1" runat="server">
            <asp:TableCell runat="server" ID="checkCell">Select </asp:TableCell>
            
            <asp:TableCell ID="TableCell1" runat="server">ATS Personnel ID</asp:TableCell>
            <asp:TableCell ID="TableCell2" runat="server">Item Number</asp:TableCell>
             
            <asp:TableCell ID="TableCell3" runat="server">E-Number</asp:TableCell>
            <asp:TableCell ID="TableCell4" runat="server">Date Processed</asp:TableCell>
            <asp:TableCell ID="TableCell5" runat="server">Reserve Date</asp:TableCell>
            <asp:TableCell ID="TableCell6" runat="server">End Date</asp:TableCell>
        </asp:TableRow> 
         </asp:Table>
   

  
   
    </div>
    <asp:Button ID="SubmitButton" runat="server" Text="Submit" 
        CssClass="submitButton" onclick="SubmitButton_Click" />
        <asp:Button ID="ClearButton" runat="server" Text="Clear" CssClass="clear" 
        onclick="ClearButton_Click" />
     
</asp:Content>
