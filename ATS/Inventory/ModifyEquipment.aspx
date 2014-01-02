<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ModifyEquipment.aspx.cs" MasterPageFile="~/Site.master" Inherits="ATS.Inventory.ModifyEquipment" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <style type="text/css">
        .formInputText
        {}
        .formInputDropBox
        {
            margin-bottom: 0px;
        }
    </style>
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2>Modify Equipment</h2>
    <p> 
        <asp:Label ID="Label13" runat="server" Text="Choose what to search by: " 
            CssClass="label" Width="160px"></asp:Label>
       
        <asp:DropDownList ID="DropDownList" runat="server" CssClass="formInputText" 
            AutoPostBack="True" 
            onselectedindexchanged="DropDownList_SelectedIndexChanged" Height="26px" 
            Width="130px">
            <asp:ListItem>Item Number</asp:ListItem>
            <asp:ListItem>Name</asp:ListItem>
        </asp:DropDownList>
        <br /> 
        <br />
        <br />

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
        <asp:Button ID="SearchButton" runat="server" 
            Text="Search" CssClass="button" onclick="SearchButton_Click1" />
    </p>
  <p> 
        <asp:Label ID="Label2" runat="server" Text="Item Number:" CssClass="label"></asp:Label>
      
        <asp:TextBox ID="ItemNumTextBox" runat="server" 
            style="text-align: left" CssClass="formInputText"></asp:TextBox>
        <asp:TextBoxWatermarkExtender ID="ItemNumTextBox_TextBoxWatermarkExtender" 
            runat="server" TargetControlID="ItemNumTextBox" WatermarkText="Item #">
        </asp:TextBoxWatermarkExtender>
        <br />
        <br />
        <asp:Label ID="Label3" runat="server" Text="Name:" CssClass="label"></asp:Label>
   
        <asp:TextBox ID="NameTextBox" runat="server" 
            CssClass="formInputText"></asp:TextBox>
        <asp:TextBoxWatermarkExtender ID="NameTextBox_TextBoxWatermarkExtender" 
            runat="server" TargetControlID="NameTextBox" WatermarkText ="Name">
        </asp:TextBoxWatermarkExtender>
        <br />
        <br />
        <asp:Label ID="Label4" runat="server" Text="Serial Number:" CssClass="label"></asp:Label>

        <asp:TextBox ID="SerialTextBox" runat="server" 
            CssClass="formInputText"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="Label5" runat="server" Text="Dollar Value:" CssClass="label"></asp:Label>

        <asp:TextBox ID="DollarValueTextBox" runat="server" 
            CssClass="formInputText"></asp:TextBox>
        <asp:TextBoxWatermarkExtender ID="DollarValueTextBox_TextBoxWatermarkExtender" 
            runat="server" TargetControlID="DollarValueTextBox" WatermarkText="$0.00">
        </asp:TextBoxWatermarkExtender>
        <br /><br />
        <asp:Label ID="Label6" runat="server" Text="Category:" CssClass="label"></asp:Label>
      
        <asp:DropDownList ID="DropDownList1" runat="server" CssClass="formInputDropBox" 
            Width="130px"  AutoPostBack="True" Height="26px" >
        </asp:DropDownList>
        <br /><br />
        <asp:Label ID="Label7" runat="server" Text="Keywords:" CssClass="label"></asp:Label>
      <asp:TextBox ID="KeywordTextBox" runat="server" 
            CssClass="formInputText"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="Label1" runat="server" Text="Entry Date:" CssClass="label"></asp:Label>

        <asp:TextBox ID="EntryDateTextBox" runat="server" 
            CssClass="formInputText"></asp:TextBox>
        <asp:TextBoxWatermarkExtender ID="EntryDateTextBox_TextBoxWatermarkExtender" 
            runat="server" TargetControlID="EntryDateTextBox" WatermarkText="mm/dd/yyyy">
        </asp:TextBoxWatermarkExtender>
        <br />
        <br />
        <asp:Label ID="Label" runat="server" Text="Check Out Length:" CssClass="label"></asp:Label>
 <asp:TextBox ID="CheckOutTextBox" runat="server" 
            CssClass="formInputText"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="Label10" runat="server" Text="Comments:" Height="80px" 
            CssClass="label"></asp:Label>
      
        <asp:TextBox ID="CommentsTextBox" runat="server" Height="81px" Width="185px" 
            TextMode="MultiLine" CssClass="formInputText"></asp:TextBox>
        <br />
        <br />
      <asp:Button ID="Button1" runat="server" Text="Update" CssClass="button" 
            onclick="Button1_Click" />
        <br />
        <br />

        <br />
</asp:Content>
