/** 
 * ------------------------------------------------------------
 * File name: RemoveEquipment.aspx
 * Project Name: ATS
 * ------------------------------------------------------------
 * Author's name and email: Keith Wilt
 * Course-Selection: CSCI-3350
 * Creation Date: 4/25/13
 * Last modified: Keith Wilt, 5/1/13
 * -------------------------------------------------------------
 */
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
namespace ATS.Inventory.Delete
{
    public partial class RemoveEquipment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            FailLabel.Visible = false;
            SearchButton.Attributes.Add("onclick", "javascript:return confirm('Are you sure you want to Delete this item?\\n This will permanently delete the item');");
        }

        protected void SearchButton_Click1(object sender, EventArgs e)
        {

            string item = SearchTextBox.Text; //get item to seach for
            SearchTextBox.Text = "";
            string connectionString = ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                //permently delete item
                string deleteCommand = "DELETE FROM EquipmentItem WHERE [itemNumber] = @item";
                //Create sql query
                SqlCommand cmd = new SqlCommand(deleteCommand, con);
                cmd.Parameters.AddWithValue("@item", item);
                try
                {
                    cmd.ExecuteNonQuery();
                }
                catch (SqlException)
                {

                    FailLabel.Visible = true;
                    FailLabel.Text = " Unable to delete the item";
                }
            }
        }
    }
}