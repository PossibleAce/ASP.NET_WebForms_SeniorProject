/** 
 * ------------------------------------------------------------
 * File name:  ChangePW.aspx
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
using System.Configuration;
using System.Data.SqlClient;
using System.Web.Security;


namespace ATS.AccountManagement
{
    public partial class ChangePW : System.Web.UI.Page
    {
        Guid newUserId;
        MembershipUser newUser;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            string username = user.Text;
            // Get the UserId of the just-added user
            newUser = Membership.GetUser(username);


            string connectionString = ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString;

            using (SqlConnection myConnection = new SqlConnection(connectionString))
            {
                myConnection.Open();
                //Create sql query
                SqlCommand cmd = new SqlCommand();
                //add item as parameter
                cmd.Parameters.AddWithValue("@username", user.Text);
                cmd.CommandText = "SELECT * FROM UserInfo WHERE [UserName] = @username";
                cmd.Connection = myConnection;
                SqlDataReader dr;
                dr = cmd.ExecuteReader();
                if (!dr.HasRows) // if no item is entered or item doesnt exist
                {
                    FailLabel.Text = "User not found"; //display item not found
                }
                else // if valid item is entered
                {
                    FailLabel.Text = "";
                    newUserId = (Guid)newUser.ProviderUserKey;
                    //read values from sql query
                    while (dr.Read())
                    {
                        userName.Text = dr[4].ToString();

                    } // end while
                    dr.Close();

                    myConnection.Close();

                }
            }
        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            if (NewPW.Text.Length>0 && OldPW.Text.Length>0 && ConfirmPW.Text.Length>0)
            {
                if (NewPW.Text != ConfirmPW.Text)
                    FailLabel0.Text = "Password does not match";
                else
                {
                    newUser = Membership.GetUser(user.Text);
                    if (newUser.ChangePassword(OldPW.Text, NewPW.Text))
                    {
                        Membership.UpdateUser(newUser);
                        Response.Redirect("ChangePW.aspx");
                    }
                    else
                    {
                        FailLabel1.Text = "Current Password is wrong!";
                    }
                }
            }
            else
            {
                FailLabel2.Text = "Text boxes can not be empty!";
            }
        }
    }
}