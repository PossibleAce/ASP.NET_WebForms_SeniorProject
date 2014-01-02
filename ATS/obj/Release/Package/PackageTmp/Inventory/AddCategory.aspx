<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddCategory.aspx.cs" MasterPageFile="~/Site.master" Inherits="ATS.Inventory.AddCategory" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2>
        Add Category
    </h2>
    <p>
    <br />
    Enter the Name of the Category to Add.
    <br />
    </p>
   


    <p>
    <asp:Label ID="Label1" runat="server" Text="Category  Name" CssClass="label"></asp:Label>
        <asp:TextBox ID="CategoryTextBox" runat="server" ReadOnly="False"></asp:TextBox>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label3" runat="server" Text="Format: 2-32 characters"></asp:Label>
        <br />
        <br />
    </p>

    <p>
    <asp:Label ID="FailLabel" runat="server" CssClass="failureNotification" 
            Text="Error" Visible="False"></asp:Label>
    </p>



    <br />

    <p>
        &nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button1" runat="server" Text="Submit" onclick="Button1_Click" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button2" runat="server" Text="Cancel" onclick="Button2_Click" />
    </p>

</asp:Content>