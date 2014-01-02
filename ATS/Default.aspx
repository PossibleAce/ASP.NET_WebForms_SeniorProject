<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="ATS._Default" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    </asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2>
        Welcome to the ATS Inventory Management System!
    </h2>
    <p>
       <i>Providing short-term equipment loans for ETSU faculty and staff<asp:MultiView ID="MultiView1" runat="server">
            <i>
            <asp:View ID="View3" runat="server">

                <i>
                <asp:GridView ID="GridViewATSFeed" runat="server">
                </asp:GridView>
                </i>

            </asp:View>
            </i>
            <asp:View ID="View2" runat="server">

                <asp:GridView ID="GridViewETSUFeed" runat="server">
                </asp:GridView>

            </asp:View>
        </asp:MultiView>
        </i></p>

       <i __designer:mapid="14">
    <asp:ImageButton ID="Button1" runat="server" 
        ImageUrl="~/Picture/atsRssLogo.jpg" onclick="Button1_Click1" />
    <asp:ImageButton ID="Button3" runat="server" 
        ImageUrl="~/Picture/etsuRssLogo.jpg" onclick="Button3_Click1" />
        </i>

</asp:Content>
