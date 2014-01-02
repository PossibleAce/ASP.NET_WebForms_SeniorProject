<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StatisticalReport.aspx.cs" MasterPageFile="~/Site.master" Inherits="ATS.Reports.StatisticalReport" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
 <h2>
       Statistical Reports
    </h2>
  <div id="Layer1" style="position:relative;width:880px; height:500px; overflow:
scroll; top: 0px; left: 20px;" >
            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True">
            <asp:ListItem>Items</asp:ListItem>
            <asp:ListItem>Faculty</asp:ListItem>
            <asp:ListItem>Check Outs</asp:ListItem>
               <asp:ListItem>Category</asp:ListItem>
            </asp:DropDownList> 
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
