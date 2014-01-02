/** 
 * ------------------------------------------------------------
 * File name:  Confirm.aspx
 * Project Name: ATS
 * ------------------------------------------------------------
 * Author's name and email: Yuan Lu
 * Course-Selection: CSCI-3350
 * Creation Date: 3/20/13
 * Last modified: Yuan Lu, 4/30/13
 * -------------------------------------------------------------
 */
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ATS.Request
{
    public partial class Confirm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("../Default.aspx");
        }
    }
}