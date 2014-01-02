<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" MasterPageFile="~/Site.master" Inherits="ATS.Checkinouts.Checkout" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2>
        Check Out Equipment
    </h2>
   
    <p> 
        
        <asp:Label ID="Label8" runat="server" Text="Enter Item Number:" 
            CssClass="label" style="top: 0px; left: 0px" Width="140px"></asp:Label>
        <asp:TextBox ID="ItemNumTextBox" runat="server" CssClass="formInputText" MaxLength="8" 
            ></asp:TextBox>
        <asp:TextBoxWatermarkExtender ID="ItemNumTextBox_TextBoxWatermarkExtender" 
            runat="server" TargetControlID="ItemNumTextBox" WatermarkText="Item #">
        </asp:TextBoxWatermarkExtender>
        <asp:Label ID="formatLabel" runat="server" Text="Format: '12345678'"></asp:Label>
        &nbsp;<asp:RequiredFieldValidator ID="ItemNumberCheckoutValidator" 
            runat="server" ErrorMessage="Enter an Item Number" 
            ControlToValidate="ItemNumTextBox" ForeColor="Red"></asp:RequiredFieldValidator>
        <br />
        <asp:Label ID="FailLabel" runat="server" CssClass="failureNotification" 
            Text="Label" Visible="False"></asp:Label>
        
        </p >
      

       
      
        <h3 align="left" style="text-decoration: underline; margin-left: 40px;"> Faculty Information</h3> 
         <p>
            <asp:Label ID="Label4" runat="server" Text="First Name:" 
        CssClass="label"></asp:Label>
            <asp:TextBox
                ID="FirstNameTextBox" runat="server" CssClass="formInputText" 
                 MaxLength="32"></asp:TextBox>
                <asp:TextBoxWatermarkExtender ID="FirstNameTextBox_TextBoxWatermarkExtender" 
                 runat="server" TargetControlID="FirstNameTextBox" WatermarkText="First">
             </asp:TextBoxWatermarkExtender>
                <asp:RequiredFieldValidator ID="FirstNameValidator" runat="server" 
                 ControlToValidate="FirstNameTextBox" ErrorMessage="Enter a First Name" 
                 ForeColor="Red"></asp:RequiredFieldValidator>
                <br />  <br />
                 <asp:Label ID="Label5" runat="server" Text="Last Name:" 
        CssClass="label"></asp:Label>
            <asp:TextBox
                ID="LastNameTextBox" runat="server" CssClass="formInputText" MaxLength="32"></asp:TextBox>
                <asp:TextBoxWatermarkExtender ID="LastNameTextBox_TextBoxWatermarkExtender" 
                 runat="server" TargetControlID="LastNameTextBox" WatermarkText="Last">
             </asp:TextBoxWatermarkExtender>
                <asp:RequiredFieldValidator ID="LastNameValidator" runat="server" 
                 ControlToValidate="LastNameTextBox" ErrorMessage="Enter a Last Name" 
                 ForeColor="Red"></asp:RequiredFieldValidator>
                <br />  <br />
                 <asp:Label ID="Label6" runat="server" Text="E-Number:" 
        CssClass="label"></asp:Label>
            <asp:TextBox
                ID="EnumTextBox" runat="server" CssClass="formInputText" MaxLength="10"></asp:TextBox>
                <asp:TextBoxWatermarkExtender ID="EnumTextBox_TextBoxWatermarkExtender" 
                 runat="server" TargetControlID="EnumTextBox" WatermarkText="E00000000">
             </asp:TextBoxWatermarkExtender>
                <asp:RequiredFieldValidator ID="ENumberValidator" runat="server" 
                 ControlToValidate="EnumTextBox" ErrorMessage="Enter an E-Number" 
                 ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:RangeValidator ID="RangeValidator1" runat="server" 
                 ControlToValidate="EnumTextBox" Display="Dynamic" 
                 ErrorMessage="Enter a valid E-Number" ForeColor="Red" MaximumValue="99999999" 
                 MinimumValue="00000000"></asp:RangeValidator>
                <br />  <br />
                 <asp:Label ID="Label7" runat="server" Text="Phone Number:" 
        CssClass="label"></asp:Label>
            <asp:TextBox
                ID="PhoneNumTextBox" runat="server" CssClass="formInputText" MaxLength="20"></asp:TextBox>
                <asp:TextBoxWatermarkExtender ID="PhoneNumTextBox_TextBoxWatermarkExtender" 
                 runat="server" TargetControlID="PhoneNumTextBox" WatermarkText="(555)555-5555">
             </asp:TextBoxWatermarkExtender>
                <asp:RequiredFieldValidator ID="PhoneValidator" runat="server" 
                 ControlToValidate="PhoneNumTextBox" ErrorMessage="Enter a Phone Number" 
                 ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
             <asp:RegularExpressionValidator ID="PhoneExpressionValidator" runat="server" 
                 ControlToValidate="PhoneNumTextBox" Display="Dynamic" 
                 ErrorMessage="Enter A Valid Phone Number" ForeColor="Red" 
                 ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}"></asp:RegularExpressionValidator>
                <br />  <br />
                 <asp:Label ID="Label9" runat="server" Text="Email:" 
        CssClass="label"></asp:Label>
            <asp:TextBox
                ID="EmailTextBox" runat="server" CssClass="formInputText" MaxLength="320"></asp:TextBox>
                <asp:RequiredFieldValidator ID="EmailValidator" runat="server" 
                 ControlToValidate="EmailTextBox" ErrorMessage="Enter an Email" 
                 ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
             <asp:RegularExpressionValidator ID="EmailExpressionValidator" runat="server" 
                 ControlToValidate="EmailTextBox" Display="Dynamic" 
                 ErrorMessage="Enter a valid E-mail" ForeColor="Red" 
                 ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                <br />  <br />
                     <asp:Label ID="Label10" runat="server" Text="Department:" 
        CssClass="label"></asp:Label>
            <asp:TextBox
                ID="DepartmentTextBox" runat="server" CssClass="formInputText" 
                 MaxLength="32"></asp:TextBox>
                <asp:TextBoxWatermarkExtender ID="DepartmentTextBox_TextBoxWatermarkExtender" 
                 runat="server" TargetControlID="DepartmentTextBox" WatermarkText="Department #">
             </asp:TextBoxWatermarkExtender>
                <asp:RequiredFieldValidator ID="DepartmentValidator" runat="server" 
                 ControlToValidate="DepartmentTextBox" ErrorMessage="Enter a Department" 
                 ForeColor="Red"></asp:RequiredFieldValidator>
                <br />  <br />
               
        <asp:Button ID="SearchButton" runat="server" 
            Text="Submit Checkout" CssClass="button" onclick="SearchButton_Click1" />
    </p>
</asp:Content>
