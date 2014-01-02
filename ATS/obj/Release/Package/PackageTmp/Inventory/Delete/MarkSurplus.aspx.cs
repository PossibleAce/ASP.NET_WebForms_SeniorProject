/** 
 * ------------------------------------------------------------
 * File name:  MarkSurplus.aspx
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
    public partial class MarkSurplus : System.Web.UI.Page
    {
        string istrue = "true";
        string isfalse = "false";
        protected void Page_Load(object sender, EventArgs e)
        {
            FailLabel.Visible = false;
            //confirm before marking as surplus
            if (RadioButtonList1.Text == "Deleted")
            {
                SearchButton.Attributes.Add("onclick", "javascript:return confirm('Are you sure you want to mark this item as Surplus?');");
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

     //Create sql query
     if (RadioButtonList1.Text == "Deleted")
     {
         //update item to show as surplus
         string mark = "Update [EquipmentItem] SET [sentToSurplus] =@false WHERE [itemNumber] =@item1 ";
         SqlCommand cmd = new SqlCommand(mark, con);
         cmd.Parameters.AddWithValue("@false", isfalse);
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
         //update item to available
         string mark = "Update [EquipmentItem] SET [sentToSurplus] =@false WHERE [itemNumber] =@item1 ";
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