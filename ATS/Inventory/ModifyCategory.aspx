<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ModifyCategory.aspx.cs" MasterPageFile="~/Site.master" Inherits="ATS.Inventory.ModifyCategory" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2>
       Select a Category to Modify
    </h2>
    
    <p>
    <asp:Label ID="Label1" runat="server" Text="Category  Name" CssClass="label"></asp:Label>
        <asp:TextBox ID="CategoryTextBox" runat="server" ReadOnly="False" 
            CssClass="formInputText"></asp:TextBox>
        <asp:TextBoxWatermarkExtender ID="CategoryTextBox_TextBoxWatermarkExtender" 
            runat="server" TargetControlID="CategoryTextBox" WatermarkText= "Category Name" >
        </asp:TextBoxWatermarkExtender>
        <asp:Label ID="Label3" runat="server" Text="Format: 2-32 characters"></asp:Label>
   <br />
   <br />
    <asp:Label ID="FailLabel" runat="server" CssClass="failureNotification" 
            Text="Error" Visible="False"></asp:Label>
    </p>
    <asp:Button ID="Button1" runat="server" Text="Modify" CssClass="button" 
        onclick="Button1_Click" />

    <asp:Button ID="Button2"
        runat="server" Text="Delete" CssClass="button" onclick="Button2_Click" />
        <p>
            <asp:Label ID="Label4" runat="server" Text="Please Update the Category Name:" 
                Visible="False"></asp:Label>
            <br />
            <br />
            <asp:Label ID="Label2" runat="server" Text="Category Name" CssClass="label" 
                Visible="False"></asp:Label>
            <asp:TextBox ID="TextBox1" runat="server" CssClass="formInputText" 
                Visible="False"></asp:TextBox>
            <asp:TextBoxWatermarkExtender ID="TextBox1_TextBoxWatermarkExtender" 
                runat="server" TargetControlID="TextBox1" WatermarkText="Category Name">
            </asp:TextBoxWatermarkExtender>
            <br /> </p>

            <asp:Button ID="Button3" runat="server" Text="Submit" CssClass="button" 
        onclick="Button3_Click" Visible="False" />
       
</asp:Content>
