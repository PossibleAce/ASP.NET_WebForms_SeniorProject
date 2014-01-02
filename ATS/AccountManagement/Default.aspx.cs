/** 
 * ------------------------------------------------------------
 * File name:  Default.aspx
 * Project Name: ATS
 * ------------------------------------------------------------
 * Author's name and email: Yuan Lu
 * Course-Selection: CSCI-3350
 * Creation Date: 4/02/13
 * Last modified: Yuan Lu, 5/1/13
 * -------------------------------------------------------------
 */
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ATS.AccountManagement
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("CreateAccount.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("ModifyUserAccount.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("ChangePW.aspx");
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            Response.Redirect("CreateAccount.aspx");
        }
    }
}