<%@ Page Title="SearchForSpecificItem" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SeachForSpecificItem.aspx.cs" Inherits="ATS.SeachForSpecificItem" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .formInputText
        {}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2> Search For Specific Equipment Item</h2>
    <p> 
        <asp:Label ID="Label13" runat="server" Text="Choose what you would like to search by: "></asp:Label>
       
        <asp:DropDownList ID="DropDownList" runat="server" CssClass="formInputText" 
            AutoPostBack="True" onselectedindexchanged="DropDownList_SelectedIndexChanged">
            <asp:ListItem>Item Number</asp:ListItem>
            <asp:ListItem>Name</asp:ListItem>
        </asp:DropDownList>
        <br /> </p>
        <p>
        <asp:Label ID="Label1" runat="server" Text="Enter Item to Search for" CssClass="label" style="top: 0px; left: 0px"></asp:Label>
        <asp:TextBox ID="SearchTextBox" runat="server" CssClass="formInputText" 
            ontextchanged="SearchTextBox_TextChanged"></asp:TextBox>
        <asp:Label ID="formatLabel" runat="server" Text="Format: '1234567890'"></asp:Label>
        <br />
        <asp:Label ID="FailLabel" runat="server" CssClass="failureNotification" 
            Text="Label" Visible="False"></asp:Label>
        <br />
        <asp:Button ID="SearchButton" runat="server" onclick="SearchButton_Click" 
            Text="Search" CssClass="button" />
    </p>
    <p> 
        <asp:Label ID="Label2" runat="server" Text="Item Number:" CssClass="label"></asp:Label>
      
        <asp:TextBox ID="ItemNumTextBox" runat="server" ReadOnly="True" 
            style="text-align: left" CssClass="formInputText"></asp:TextBox><br />
        <br />
        <asp:Label ID="Label3" runat="server" Text="Name:" CssClass="label"></asp:Label>
   
        <asp:TextBox ID="NameTextBox" runat="server" ReadOnly="True" 
            CssClass="formInputText"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="Label4" runat="server" Text="Serial Number:" CssClass="label"></asp:Label>

        <asp:TextBox ID="SerialTextBox" runat="server" ReadOnly="True" 
            CssClass="formInputText"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="Label5" runat="server" Text="Dollar Value:" CssClass="label"></asp:Label>

        <asp:TextBox ID="DollarValueTextBox" runat="server" ReadOnly="True" 
            CssClass="formInputText"></asp:TextBox>
        <br /><br />
        <asp:Label ID="Label6" runat="server" Text="Category:" CssClass="label"></asp:Label>
      
        <asp:TextBox ID="CategoryTextBox" runat="server" ReadOnly="True" 
            CssClass="formInputText" Height="27px" Width="135px"></asp:TextBox>
        <br /><br />
        <asp:Label ID="Label7" runat="server" Text="Keywords:" CssClass="label"></asp:Label>
      <asp:TextBox ID="KeywordTextBox" runat="server" ReadOnly="True" 
            CssClass="formInputText"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="Label8" runat="server" Text="Entry Date:" CssClass="label"></asp:Label>

        <asp:TextBox ID="EntryDateTextBox" runat="server" ReadOnly="True" 
            CssClass="formInputText"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="Label9" runat="server" Text="Check Out Length:" CssClass="label"></asp:Label>
 <asp:TextBox ID="CheckOutTextBox" runat="server" ReadOnly="True" 
            CssClass="formInputText"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="Label10" runat="server" Text="Comments:" Height="80px" 
            CssClass="label"></asp:Label>
      
        <asp:TextBox ID="CommentsTextBox" runat="server" Height="81px" Width="185px" 
            ReadOnly="True" TextMode="MultiLine" CssClass="formInputText"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="Label11" runat="server" Text="Status:" CssClass="label"></asp:Label>

        <asp:TextBox ID="StatusTextBox" runat="server" ReadOnly="True" 
            CssClass="formInputText"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="Label12" runat="server" Text="Visible:" CssClass="label"></asp:Label>
   
        <asp:TextBox ID="VisableTextBox" runat="server" ReadOnly="True" 
            CssClass="formInputText"></asp:TextBox>

        <br />
        <asp:Button ID="ClearButton" runat="server" Text="Clear" 
            CssClass="button" onclick="ClearButton_Click" Width="83px" />
        <br />
    </p>
</asp:Content>