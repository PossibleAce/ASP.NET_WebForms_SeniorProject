<%@ Page Title="Reserve" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Reserve.aspx.cs" Inherits="ATS.Request.Reserve" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">

        .style4
        {
            width: 234px;
            height: 25px;
        }
        .style2
        {
            width: 234px;
        }
        .style1
        {
            width: 83%;
            height: 208px;
        }
        .style9
        {
        }
        .style15
        {
            width: 256px;
        }
        .style16
        {
            width: 256px;
            height: 25px;
        }
        .style17
        {
            width: 266px;
        }
        .style18
        {
            width: 266px;
            height: 25px;
        }
        .style19
        {
            width: 161px;
        }
        .style20
        {
            width: 161px;
            height: 25px;
        }
        .style21
        {
            color: #FF3300;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table class="style1">
        <tr>
            <td class="style2">
                <asp:Label ID="Label10" runat="server" Text="Reserve this item: "></asp:Label>
                <asp:Label ID="Label13" runat="server"></asp:Label>
            </td>
            <td class="style17">
                <asp:Label ID="FailLabel0" runat="server" CssClass="failureNotification"></asp:Label>
            </td>
            <td class="style19">
                &nbsp;</td>
            <td class="style15">
                </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="Label14" runat="server" Text="Name: "></asp:Label>
                <asp:Label ID="Name" runat="server"></asp:Label>
            </td>
            <td class="style17">
                <asp:Label ID="Label15" runat="server" Text="Serial Number: "></asp:Label>
                <asp:Label ID="SN" runat="server"></asp:Label>
            </td>
            <td class="style19">
                <asp:Label ID="Category" runat="server" Text="Category: "></asp:Label>
                <asp:Label ID="Cate" runat="server"></asp:Label>
            </td>
            <td class="style15">
                <asp:Label ID="COL1" runat="server" Text="Checkout length(Days): "></asp:Label>
                <asp:Label ID="COL" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style4">
                <asp:Label ID="Label1" runat="server" Text="This item is currently:"></asp:Label>
            </td>
            <td class="style18">
            </td>
            <td class="style20">
            </td>
            <td class="style16">
            </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="Label2" runat="server" Text="Checked Out"></asp:Label>
                :</td>
            <td class="style17">
                <asp:Label ID="checkout" runat="server"></asp:Label>
            </td>
            <td class="style19">
                <asp:Label ID="Label6" runat="server" Text="From:"></asp:Label>
                <asp:Label ID="from" runat="server"></asp:Label>
            </td>
            <td class="style15">
                <asp:Label ID="Label8" runat="server" Text="To:"></asp:Label>
                <asp:Label ID="to" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Reserved:</td>
            <td class="style17">
                <asp:Label ID="reserved" runat="server"></asp:Label>
            </td>
            <td class="style19">
                <asp:Label ID="Label11" runat="server" Text="From:"></asp:Label>
                <asp:Label ID="from2" runat="server"></asp:Label>
            </td>
            <td class="style15">
                <asp:Label ID="Label12" runat="server" Text="To:"></asp:Label>
                <asp:Label ID="to2" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="Label3" runat="server" Text="On Hold:"></asp:Label>
            </td>
            <td class="style17">
                <asp:Label ID="onhold" runat="server"></asp:Label>
            </td>
            <td class="style19">
                <asp:Label ID="Label7" runat="server" Text="From:"></asp:Label>
                <asp:Label ID="from1" runat="server"></asp:Label>
            </td>
            <td class="style15">
                <asp:Label ID="Label9" runat="server" Text="To:"></asp:Label>
                <asp:Label ID="to1" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style2">
                E #:</td>
            <td class="style17">
                <asp:TextBox ID="EN" runat="server" MaxLength="9"></asp:TextBox>
            </td>
            <td class="style19">
                &nbsp;</td>
            <td class="style15">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                First Name:</td>
            <td class="style17">
                <asp:TextBox ID="FN" runat="server" MaxLength="10"></asp:TextBox>
            </td>
            <td class="style19">
                &nbsp;</td>
            <td class="style15">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                Last Name:</td>
            <td class="style17">
                <asp:TextBox ID="LN" runat="server" MaxLength="10"></asp:TextBox>
            </td>
            <td class="style19">
                &nbsp;</td>
            <td class="style15">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                Email:</td>
            <td class="style17">
                <asp:TextBox ID="Email" runat="server" MaxLength="32"></asp:TextBox>
            </td>
            <td class="style19">
                &nbsp;</td>
            <td class="style15">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                Phone Number:</td>
            <td class="style17">
                <asp:TextBox ID="PN" runat="server" MaxLength="15"></asp:TextBox>
            </td>
            <td class="style19">
                &nbsp;</td>
            <td class="style15">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                Department:</td>
            <td class="style17">
                <asp:TextBox ID="DPT" runat="server" MaxLength="10"></asp:TextBox>
            </td>
            <td class="style19">
                &nbsp;</td>
            <td class="style15">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                Start Date:</td>
            <td class="style17">
                <asp:DropDownList ID="YY" runat="server">
                    <asp:ListItem>2013</asp:ListItem>
                    <asp:ListItem>2014</asp:ListItem>
                </asp:DropDownList>
                <asp:DropDownList ID="MM" runat="server" Width="60px">
                    <asp:ListItem Value="01">Jan</asp:ListItem>
                    <asp:ListItem Value="02">Feb</asp:ListItem>
                    <asp:ListItem Value="03">Mar</asp:ListItem>
                    <asp:ListItem Value="04">Apr</asp:ListItem>
                    <asp:ListItem Value="05">May</asp:ListItem>
                    <asp:ListItem Value="06">Jun</asp:ListItem>
                    <asp:ListItem Value="07">Jul</asp:ListItem>
                    <asp:ListItem Value="08">Aug</asp:ListItem>
                    <asp:ListItem Value="09">Sep</asp:ListItem>
                    <asp:ListItem Value="10">Oct</asp:ListItem>
                    <asp:ListItem Value="11">Nov</asp:ListItem>
                    <asp:ListItem Value="12">Dec</asp:ListItem>
                </asp:DropDownList>
                <asp:DropDownList ID="DD" runat="server" Width="60px">
                    <asp:ListItem>01</asp:ListItem>
                    <asp:ListItem>02</asp:ListItem>
                    <asp:ListItem>03</asp:ListItem>
                    <asp:ListItem>04</asp:ListItem>
                    <asp:ListItem>05</asp:ListItem>
                    <asp:ListItem>06</asp:ListItem>
                    <asp:ListItem>07</asp:ListItem>
                    <asp:ListItem>08</asp:ListItem>
                    <asp:ListItem>09</asp:ListItem>
                    <asp:ListItem>10</asp:ListItem>
                    <asp:ListItem>11</asp:ListItem>
                    <asp:ListItem>12</asp:ListItem>
                    <asp:ListItem>13</asp:ListItem>
                    <asp:ListItem>14</asp:ListItem>
                    <asp:ListItem>15</asp:ListItem>
                    <asp:ListItem>16</asp:ListItem>
                    <asp:ListItem>17</asp:ListItem>
                    <asp:ListItem>18</asp:ListItem>
                    <asp:ListItem>19</asp:ListItem>
                    <asp:ListItem>20</asp:ListItem>
                    <asp:ListItem>21</asp:ListItem>
                    <asp:ListItem>22</asp:ListItem>
                    <asp:ListItem>23</asp:ListItem>
                    <asp:ListItem>24</asp:ListItem>
                    <asp:ListItem>25</asp:ListItem>
                    <asp:ListItem>26</asp:ListItem>
                    <asp:ListItem>27</asp:ListItem>
                    <asp:ListItem>28</asp:ListItem>
                    <asp:ListItem>29</asp:ListItem>
                    <asp:ListItem>30</asp:ListItem>
                    <asp:ListItem>31</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td class="style21" colspan="2">
                (The item will be picked up within 3 days after start date)</td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Button ID="Button1" runat="server" Text="Submit" 
                    onclick="Button1_Click1" />
            </td>
            <td class="style17">
                <asp:Button ID="Button2" runat="server" Text="Cancel" onclick="Button2_Click" />
            </td>
            <td class="style9" colspan="2">
                <asp:Label ID="FailLabel1" runat="server" CssClass="failureNotification"></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>
