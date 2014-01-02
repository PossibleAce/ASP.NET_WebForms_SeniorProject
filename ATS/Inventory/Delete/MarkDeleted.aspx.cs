/** 
 * ------------------------------------------------------------
 * File name:  MarkDeleted.aspx
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
    public partial class MarkDeleted : System.Web.UI.Page
    {
        string istrue = "true";
        string isfalse = "false";
        protected void Page_Load(object sender, EventArgs e)
        {
           
            FailLabel.Visible = false;
            //confirm if it is to be deleted
            if (RadioButtonList1.Text == "Deleted")
            {
                SearchButton.Attributes.Add("onclick", "javascript:return confirm('Are you sure you want to mark this item as Deleted?');");
            }
            else
            {
                SearchButton.Attributes.Add("onclick", "javascript:return confirm('Are you sure you want to mark this item as Available?');");
            }
        }

        protected void SearchButton_Click1(object sender, EventArgs e)
        {

           
            string item = SearchTextBox.Text; //get item to seach for
            SearchTextBox.Text = "";
            string connectionString = ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();

                
                if (RadioButtonList1.Text == "Deleted")
                {
                    //if it is to be deleted update equipment item as not visible
                    string mark = "Update [EquipmentItem] SET [visible] =@false WHERE [itemNumber] =@item1 ";
                    SqlCommand cmd = new SqlCommand(mark, con);
                    //add paramrters
                    cmd.Parameters.AddWithValue("@false", isfalse);
                    cmd.Parameters.AddWithValue("@item1", item);
                    try
                    {
                        cmd.ExecuteNonQuery();

                    }
                    catch (SqlException)
                    {
                        //display error if fails
                        FailLabel.Visible = true;
                        FailLabel.Text = "Item could not be marked";
                    }
                }
                else
                {
                    //update equipment item to mark available
                    string mark = "Update [EquipmentItem] SET [visible] =@false WHERE [itemNumber] =@item1 ";
                    SqlCommand cmd = new SqlCommand(mark, con);
                    //add parameters
                    cmd.Parameters.AddWithValue("@false", istrue);
                    cmd.Parameters.AddWithValue("@item1", item);
                    try
                    {
                        cmd.ExecuteNonQuery();
                    }
                    catch (SqlException)
                    {
                        FailLabel.Visible = true;
                        FailLabel.Text = "Item could not be marked";
                    }

                }





            }
        }
    }
}