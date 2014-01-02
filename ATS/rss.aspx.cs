/*//////////////////////////////////////////////////////////////////////////
*
* Project: ATS
* File Name: rss.aspx.cs
* Description: Implement a RSS 2.0 feed in XML using asp:Repeater

* Course: CSCI 4957 - ASP.NET
* Author: Isaac Styles, styles@goldmail.etsu.edu
* Created: Friday June 14, 2013
* Copyright: Isaac Styles, 2013
*
=========================================================
*
* Last Modified: July 9, 2013
* Modified by: Isaac Styles
*
///////////////////////////////////////////////////////////////////////////*/
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace ATS
{
    public partial class rss : System.Web.UI.Page
    {

        protected void Page_Init()
        {
            // Get connection string from the web.config file  
            string connString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            // Create SqlConnection object  
            SqlConnection sqlConn = new SqlConnection();
            sqlConn.ConnectionString = connString;

            // SQL query to retrieve data from database  
            string sqlQuery = "SELECT TOP 10 ArticleID, Title, Author, Url, Description, DatePublished FROM NewsFeed ORDER BY DatePublished DESC";

            // Create SqlCommand object  
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = sqlConn;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = sqlQuery;

            // open connection and then binding data into RepeaterRSS control  
            sqlConn.Open();
            RepeaterRSS.DataSource = cmd.ExecuteReader();
            RepeaterRSS.DataBind();
            sqlConn.Close();
        }  

        protected string RemoveIllegalCharacters(object input)
        {
            // cast the input to a string  
            string data = input.ToString();

            // replace illegal characters in XML documents with their entity references  
            data = data.Replace("&", "&amp;");
            data = data.Replace("\"", "&quot;");
            data = data.Replace("'", "&apos;");
            data = data.Replace("<", "&lt;");
            data = data.Replace(">", "&gt;");

            return data;
        }  
    }
}