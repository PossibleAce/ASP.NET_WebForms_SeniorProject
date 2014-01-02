<%@ Page Language="C#" ContentType="text/xml" AutoEventWireup="true" CodeBehind="rss.aspx.cs" Inherits="ATS.rss" %>  

<asp:Repeater ID="RepeaterRSS" runat="server">  
		<HeaderTemplate>  
		   <rss version="2.0">  
				<channel>  
					<title>ATS Development News Feed</title>  
					<link></link>  
					<description>  
					Home of The Inventory Management System
					</description>  
		</HeaderTemplate>  
		<ItemTemplate>  
			   <item>  
				<title><%# RemoveIllegalCharacters(DataBinder.Eval(Container.DataItem, "Title")) %></title>  
				<link>http://www.isaacstyl.es/news.aspx?ID=<%# DataBinder.Eval(Container.DataItem, "ArticleID") %></link>  
				<author><%# RemoveIllegalCharacters(DataBinder.Eval(Container.DataItem, "Author"))%></author>  
				<pubDate><%# String.Format("{0:R}", DataBinder.Eval(Container.DataItem, "DatePublished"))%></pubDate>  
				<description><%# RemoveIllegalCharacters(DataBinder.Eval(Container.DataItem, "Description"))%></description>  
				<url><%# DataBinder.Eval(Container.DataItem, "Url")%></url>
		</item>  
		</ItemTemplate>  
		<FooterTemplate>  
				</channel>  
			</rss>    
		</FooterTemplate>  
</asp:Repeater>