<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" MasterPageFile="~/Site.master" Inherits="ATS.Checkinouts.Checkout" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2>
        Check Out Equipment
    </h2>
   
    <p> 
        
        <asp:Label ID="Label8" runat="server" Text="Enter Item Number:" 
            CssClass="label" style="top: 0px; left: 0px" Width="140px"></asp:Label>
        <asp:TextBox ID="ItemNumTextBox" runat="server" CssClass="formInputText" 
            ></asp:TextBox>
        <asp:Label ID="formatLabel" runat="server" Text="Format: '1234567890'"></asp:Label>
        <br />
        <asp:Label ID="FailLabel" runat="server" CssClass="failureNotification" 
            Text="Label" Visible="False"></asp:Label>
        
        </p >
      

       
      
        <h3 align="left" style="text-decoration: underline"> Faculty Information</h3> 
         <p>
            <asp:Label ID="Label4" runat="server" Text="First Name:" 
        CssClass="label"></asp:Label>
            <asp:TextBox
                ID="FirstNameTextBox" runat="server" CssClass="formInputText"></asp:TextBox>
                <br />  <br />
                 <asp:Label ID="Label5" runat="server" Text="Last Name:" 
        CssClass="label"></asp:Label>
            <asp:TextBox
                ID="LastNameTextBox" runat="server" CssClass="formInputText"></asp:TextBox>
                <br />  <br />
                 <asp:Label ID="Label6" runat="server" Text="E-Number:" 
        CssClass="label"></asp:Label>
            <asp:TextBox
                ID="EnumTextBox" runat="server" CssClass="formInputText" MaxLength="10"></asp:TextBox>
                <br />  <br />
                 <asp:Label ID="Label7" runat="server" Text="Phone Number:" 
        CssClass="label"></asp:Label>
            <asp:TextBox
                ID="PhoneNumTextBox" runat="server" CssClass="formInputText"></asp:TextBox>
                <br />  <br />
                 <asp:Label ID="Label9" runat="server" Text="Email:" 
        CssClass="label"></asp:Label>
            <asp:TextBox
                ID="EmailTextBox" runat="server" CssClass="formInputText"></asp:TextBox>
                <br />  <br />
                     <asp:Label ID="Label10" runat="server" Text="Department:" 
        CssClass="label"></asp:Label>
            <asp:TextBox
                ID="DepartmentTextBox" runat="server" CssClass="formInputText"></asp:TextBox>
                <br />  <br />
               
        <asp:Button ID="SearchButton" runat="server" 
            Text="Submit Checkout" CssClass="button" onclick="SearchButton_Click1" />
    </p>
</asp:Content>
