/** 
 * ------------------------------------------------------------
 * File name:  Default.aspx
 * Project Name: ATS
 * ------------------------------------------------------------
 * Author's name and email: Nathaniel Davis
 * Course-Selection: CSCI-3350
 * Creation Date: 4/02/13
 * Last modified: Nathaniel Davis, 5/1/13
 * -------------------------------------------------------------
 */
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ATS.Holds
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            Response.Redirect("ManageHolds.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("RemoveHold.aspx");
        }
    }
}