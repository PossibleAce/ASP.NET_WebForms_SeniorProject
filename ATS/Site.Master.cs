/** 
 * ------------------------------------------------------------
 * File name:  SiteMaster.cs
 * Project Name: ATS
 * ------------------------------------------------------------
 * Author's name and email: Nathaniel Davis
 * Course-Selection: CSCI-3350
 * Creation Date: 2/01/13
 * Last modified: Nathaniel Davis, 5/1/13
 * -------------------------------------------------------------
 */
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
namespace ATS
{
    public partial class Site : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Header.DataBind();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Session["search"] = SearchTextBox.Text;
            Response.Redirect("~/Search.aspx");
        }
    }
}