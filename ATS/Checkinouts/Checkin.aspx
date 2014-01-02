<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Checkin.aspx.cs" MasterPageFile="~/Site.master" Inherits="ATS.Checkinouts.Checkin" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2>
       Check In Equipment Item
    </h2>
    <p> 
    

        <asp:Label ID="Label8" runat="server" Text="Enter Item to Check In" 
            CssClass="label" style="top: 0px; left: 0px" Width="140px"></asp:Label>
        <asp:TextBox ID="ItemNumTextBox" runat="server" CssClass="formInputText" MaxLength="10" 
            ></asp:TextBox>
        <asp:TextBoxWatermarkExtender ID="ItemNumTextBox_TextBoxWatermarkExtender" 
            runat="server" TargetControlID="ItemNumTextBox" WatermarkText = "Item Number" >
        </asp:TextBoxWatermarkExtender>
        <asp:Label ID="formatLabel" runat="server" Text="Format: '1234567890'"></asp:Label>
        &nbsp;<asp:RequiredFieldValidator ID="ItemCheckInValidator" runat="server" 
            ErrorMessage="Enter an Item ID" ForeColor="Red" 
            ControlToValidate="ItemNumTextBox"></asp:RequiredFieldValidator>
        <br />
        <br /> 
          <asp:Label ID="Label1" runat="server" Text="Enter Faculty E-Number" 
            CssClass="label" style="top: 0px; left: -1px" Width="140px"></asp:Label>
        <asp:TextBox ID="EnumTextBox" runat="server" CssClass="formInputText" MaxLength="10" 
            ></asp:TextBox>
        <asp:TextBoxWatermarkExtender ID="EnumTextBox_TextBoxWatermarkExtender" 
            runat="server" TargetControlID="EnumTextBox" WatermarkText= "E00000000">
        </asp:TextBoxWatermarkExtender>
        <asp:Label ID="Label2" runat="server" Text="Format: 'E12345678'"></asp:Label>
        &nbsp;<asp:RequiredFieldValidator ID="FacultyIDValidator" runat="server" 
            ErrorMessage="Enter a Faculty ID" ForeColor="Red" 
            ControlToValidate="EnumTextBox"></asp:RequiredFieldValidator>
        <br />
        <br /> 
        <asp:Label ID="FailLabel" runat="server" CssClass="failureNotification" 
            Text="Label" Visible="False"></asp:Label>
            <br /> <br /> 
        <asp:Button ID="SearchButton" runat="server" 
            Text="Submit Check-In" CssClass="button" onclick="SearchButton_Click1" />
    </p>
</asp:Content>