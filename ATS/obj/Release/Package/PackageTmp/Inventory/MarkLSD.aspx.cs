/** 
 * ------------------------------------------------------------
 * File name:  MarkLSD.aspx
 * Project Name: ATS
 * ------------------------------------------------------------
 * Author's name and email: Keith Wilt
 * Course-Selection: CSCI-3350
 * Creation Date: 4/20/13
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
namespace ATS.Inventory
{
    public partial class MarkLSD : System.Web.UI.Page
    {
        string istrue = "true";
        string isfalse = "false";
        protected void Page_Load(object sender, EventArgs e)
        {
            FailLabel.Visible = false;
            if (CheckBoxList.Items[0].Selected)
            {
                SearchButton.Attributes.Add("onclick", "javascript:return confirm('Are you sure you want to mark this item as Damaged?');");
            }
            else if (CheckBoxList.Items[1].Selected)
            {
                SearchButton.Attributes.Add("onclick", "javascript:return confirm('Are you sure you want to mark this item as Lost?');");
            }
            else
            {
                SearchButton.Attributes.Add("onclick", "javascript:return confirm('Are you sure you want to mark this item as Stolen?');");
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

                if (CheckBoxList.Items[0].Selected)
                {
                    //set lost to true for item
                    string mark = "Update [EquipmentItem] SET [lost] =@false WHERE [itemNumber] =@item1 ";
                    SqlCommand cmd = new SqlCommand(mark, con);
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
                else if (CheckBoxList.Items[1].Selected)
                {
                    //set damged to true for item
                    string mark = "Update [EquipmentItem] SET [damaged] =@false WHERE [itemNumber] =@item1 ";
                    SqlCommand cmd = new SqlCommand(mark, con);
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
                else
                {
                    //set stolen to true for item
                    string mark = "Update [EquipmentItem] SET [stolen] =@false WHERE [itemNumber] =@item1 ";
                    SqlCommand cmd = new SqlCommand(mark, con);
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