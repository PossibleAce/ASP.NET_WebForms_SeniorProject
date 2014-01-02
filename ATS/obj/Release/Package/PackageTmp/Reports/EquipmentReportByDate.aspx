<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EquipmentReportByDate.aspx.cs" MasterPageFile="~/Site.master" Inherits="ATS.Reports.EquipmentReportByDate" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
  <h2>
        Equipment Reports By Date
    </h2>
      
            <div id="Div1" style="position:relative;width:880px; height:500px; overflow:
scroll; top: 0px; left: 20px;" >
<br />
<br />
                <asp:Label ID="Label1" runat="server" Text="Select Dates. Between:"></asp:Label>
                <asp:TextBox ID="Date1TextBox"
                    runat="server"></asp:TextBox>
                <asp:Label ID="Label2" runat="server" Text="and"></asp:Label>
                <asp:TextBox ID="Date2TextBox"
                    runat="server"></asp:TextBox>
                    <asp:Label ID="Label3" runat="server" Text="Format: 1/10/1990"></asp:Label>
                    <br />
                    <br />
           
            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True">
            <asp:ListItem>Items</asp:ListItem>
            <asp:ListItem>Faculty</asp:ListItem>
            <asp:ListItem>Check Outs</asp:ListItem>
            <asp:ListItem>Category</asp:ListItem>
            </asp:DropDownList> <asp:Button ID="Button1" runat="server" Text="Report" 
                    onclick="Button1_Click" />
                <br />
            <br />
                 
            <asp:Label ID="FailLabel" runat="server" Text="Label" 
            CssClass="failureNotification" Visible="False"></asp:Label>
<asp:GridView ID="GridView1" runat="server" AllowSorting="true"   OnSorting="GridView1_Sorting" 
                    CellPadding="2" CellSpacing="2" HorizontalAlign="Center">
    </asp:GridView>
    </div>
    <script language="javascript" type="text/javascript">
        function Print() {
            var prtContent = document.getElementById('<%= GridView1.ClientID %>');
            prtContent.border = 0; //set no border here
            var WinPrint = window.open('', '', 'letf=100,top=100,width=1000,height=1000,toolbar=0,scrollbars=1,status=0,resizable=1');
            WinPrint.document.write(prtContent.outerHTML);
            WinPrint.document.close();
            WinPrint.focus();
            WinPrint.print();
            WinPrint.close();
        }

</script>

<asp:Button ID="btnPrint" runat="server" Text="Print" OnClientClick="Print();" />
</asp:Content>
