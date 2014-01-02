/** 
 * ------------------------------------------------------------
 * File name:  Checkin.aspx
 * Project Name: ATS
 * ------------------------------------------------------------
 * Author's name and email: Keith Wilt
 * Course-Selection: CSCI-3350
 * Creation Date: 4/01/13
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
using System.Web.Security;
using System.Configuration;

namespace ATS.Checkinouts
{
    public partial class Checkin : System.Web.UI.Page
    {
        string itemNumber,enumber,user;
        string istrue = "true"; //strings for testing 
        string isfalse = "false";
        string checkInDate = DateTime.Now.ToString("d");
        protected void Page_Load(object sender, EventArgs e)
        {
            FailLabel.Visible = false;
            user = Membership.GetUser().UserName.ToString();
            SearchButton.Attributes.Add("onclick", "javascript:return confirm('Are you sure you want to Check in this item?');"); //Confirm before submitting
        }

        protected void SearchButton_Click1(object sender, EventArgs e)
        {
            itemNumber = ItemNumTextBox.Text;
            enumber = EnumTextBox.Text;
            string connectionString = ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connectionString))
            {


                //Check if item is valid and checked out
                string CommandText = "SELECT * FROM EquipmentItem WHERE [itemNumber] = @itemNumber and [checkedout]=@true";
                SqlCommand cmd1 = new SqlCommand(CommandText, con);
                //add parameters
                cmd1.Parameters.AddWithValue("@itemNumber", itemNumber);
                cmd1.Parameters.AddWithValue("@true", istrue);
                //update equipment item as checked in
                string update = "Update [EquipmentItem] SET [checkedout] =@false  WHERE [itemNumber] =@item1 ";

                SqlCommand cmd2 = new SqlCommand(update, con);
                //add parameters
                cmd2.Parameters.AddWithValue("@false", isfalse);
                cmd2.Parameters.AddWithValue("@item1", itemNumber);
             //Update checkout transaction
                string updateCheckout = "Update [Checkout] SET [dateReturned] =@date ,[personnelCheckedIn]=@person WHERE [itemNumber] =@item2 and [eNumber] = @enum ";

                SqlCommand cmd3 = new SqlCommand(updateCheckout, con);
                //add parameters
                cmd3.Parameters.AddWithValue("@date", checkInDate);
                cmd3.Parameters.AddWithValue("@item2", itemNumber);
                cmd3.Parameters.AddWithValue("@enum", enumber);
                cmd3.Parameters.Add(new SqlParameter("@person", user));
                con.Open();
                SqlDataReader rd = cmd1.ExecuteReader();

                //if item is not valid or is not checked out error
                if (!rd.HasRows)
                {
                    rd.Close();
                    FailLabel.Visible = true;
                    FailLabel.Text = "Wrong Equipment item Number, or item is not checked out ";

                }
                else
                {
                    //update equipment item and create checkout transaction
                    rd.Close();
                    cmd2.ExecuteNonQuery();
                    cmd3.ExecuteNonQuery();
                    Response.Redirect("Default.aspx");
                }
            }
        }
    }
}