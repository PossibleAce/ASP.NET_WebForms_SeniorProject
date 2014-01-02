<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" MasterPageFile="~/Site.master" Inherits="ATS.Reports.Default" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2>
        Report Options: Select the prefered type of Report to Produce
    </h2>
    <p>
                    <asp:Button ID="Button4" runat="server" onclick="Button4_Click" 
                        Text="Equipment Items Report" Width="216px" CssClass="button" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="Button2" runat="server" onclick="Button2_Click" 
                        Text="Equipment Holds Report" Width="222px" CssClass="button" />
                        </p>
                        <p>
                    <asp:Button ID="Button1" runat="server" onclick="Button1_Click" 
                        Text="Equipment Report By Date" Width="233px" CssClass="button" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="Button3" runat="server" onclick="Button3_Click" 
                        Text="Statistical Reports" Width="180px" CssClass="button" />
                    
                </p>
    <p>
        <img src="http://www.wrlibrary.org/images/etsu.jpg" 
            style="height: 437px; width: 654px" /></p>
</asp:Content>