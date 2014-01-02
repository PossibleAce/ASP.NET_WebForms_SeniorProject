<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ScrAddEquipment.aspx.cs" Inherits="ATS_Admin.ScrAddEquipment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

  <h2>Add Equipment</h2>
    <p> 
        <asp:Label ID="Label1" runat="server" Text="ItemNumber" CssClass="label"></asp:Label>
        <asp:TextBox ID="EtsuNumTextBox" runat="server" ReadOnly="False"></asp:TextBox>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label3" runat="server" Text="Format: xxxxxxxxx"></asp:Label>
        <br />
        <br />
        <asp:Label ID="Label16" runat="server" Text="Name" CssClass="label"></asp:Label>
        <asp:TextBox ID="NameTextBox" runat="server" ReadOnly="False"></asp:TextBox>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label2" runat="server" Text="Format: 2 to 320 characters"></asp:Label>
        
        <br />
        <br />
        <asp:Label ID="Label17" runat="server" Text="Serial Number" CssClass="label"></asp:Label>
        <asp:TextBox ID="SerialTextBox" runat="server" ReadOnly="False"></asp:TextBox>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label4" runat="server" Text="Format: 2 to 32 alphanumeric characters"></asp:Label>

        <br />
        <br />
        <asp:Label ID="Label18" runat="server" Text="Dollar Value" CssClass="label"></asp:Label>
        <asp:TextBox ID="DollarValueTextBox" runat="server" ReadOnly="False"></asp:TextBox>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label5" runat="server" Text="Format: ###.##"></asp:Label>

        <br /><br />
        <asp:Label ID="Label19" runat="server" Text="Category" CssClass="label"></asp:Label>
           <asp:DropDownList ID="DropDownList1" runat="server"  
            Width="130px"  AutoPostBack="True" Height="26px" >
        </asp:DropDownList>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label6" runat="server" Text="Select from the list, add category if needed"></asp:Label>

        <br /><br />
        <asp:Label ID="Label20" runat="server" Text="Keywords" CssClass="label"></asp:Label>
        <asp:TextBox ID="KeywordTextBox" runat="server" ReadOnly="False"></asp:TextBox>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;


        <br />
        <br />
        <asp:Label ID="Label23" runat="server" Text="Comments" Height="80px" CssClass="label"></asp:Label>
        <asp:TextBox ID="CommentsTextBox" runat="server" Height="81px" Width="141px" ReadOnly="False" TextMode="MultiLine" style="margin-left: 6px"></asp:TextBox>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label7" runat="server" Text="(Optional) Format: 2 to 320 alphanumeric characters"></asp:Label>

        <br />
        <br />
        <asp:Label ID="Label22" runat="server" Text="Check Out Length" CssClass="label"></asp:Label>
        <asp:TextBox ID="CheckOutTextBox" runat="server" ReadOnly="False"></asp:TextBox>



        <br />
    </p>
    <asp:Label ID="FailLabel" runat="server" CssClass="failureNotification" 
        Text="Label" Visible="False"></asp:Label>
    <br />

    <p>
        &nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button1" runat="server" Text="Submit" onclick="Button1_Click" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button2" runat="server" Text="Clear" onclick="Button2_Click" />
    </p>

</asp:Content>
