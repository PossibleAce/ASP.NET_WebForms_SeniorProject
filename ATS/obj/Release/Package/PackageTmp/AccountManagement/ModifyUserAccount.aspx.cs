/** 
 * ------------------------------------------------------------
 * File name:  ModifyUserAccount.aspx
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
    public partial class ModifyUserAccount : System.Web.UI.Page
    {
        string clear = "";
        Guid newUserId;
        MembershipUser newUser;
        string role;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("ModifyUserAccount.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
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

                    //clear all text boxes 
                    atsid.Text = clear;
                    firstname.Text = clear;
                    lastname.Text = clear;
                    phone.Text = clear;
                    email.Text = clear;

                    FailLabel.Text = "User not found"; //display item not found
                }
                else // if valid item is entered
                {
                    FailLabel.Text = "";
                    newUserId = (Guid)newUser.ProviderUserKey;
                    //read values from sql query
                    while (dr.Read())
                    {  
                        firstname.Text = dr[1].ToString();
                        lastname.Text = dr[2].ToString();
                        atsid.Text = dr[3].ToString();
                        userName.Text = dr[4].ToString();
                        phone.Text = dr[5].ToString();
                    } // end while
                    dr.Close();
                    SqlCommand cmd2 = new SqlCommand();
                    //add item as parameter
                    cmd2.Parameters.AddWithValue("@UserId", newUserId);
                    cmd2.CommandText = "SELECT * FROM aspnet_Membership WHERE [UserId] = @UserId";
                    cmd2.Connection = myConnection;
                    SqlDataReader dr2;
                    dr2 = cmd2.ExecuteReader();
                    while (dr2.Read())
                    {
                        email.Text = dr2[6].ToString();
                    } // end while

                if (Roles.IsUserInRole(newUser.UserName, "Admin"))
                   
                RadioButton2.Checked = true;

                else
                    if (Roles.IsUserInRole(newUser.UserName, "SuperAdmin"))

                        RadioButton1.Checked = true;

                    else

                        RadioButton3.Checked = true;


                
                if (newUser.IsApproved)
                    RadioButton4.Checked = true;
                else
                    RadioButton5.Checked = true;

                }
                myConnection.Close();

            }
            
        }

        protected void update_Click(object sender, EventArgs e)
        {
            string FirstName = firstname.Text;
            string LastName = lastname.Text;
            string ATSID = atsid.Text;
            string UserName = userName.Text;
            string Phone = phone.Text;
            string Email = email.Text;
            string connectionString = ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString;
            string insertSql = "UPDATE UserInfo SET ATSID = @ATSID, FirstName = @FirstName, LastName = @LastName, PhoneNumber = @PhoneNumber WHERE UserName = @UserName";
            
            using (SqlConnection myConnection = new SqlConnection(connectionString))
            {

                myConnection.Open();

                SqlCommand myCommand = new SqlCommand(insertSql, myConnection);
                myCommand.Parameters.AddWithValue("@ATSID", ATSID);
                myCommand.Parameters.AddWithValue("@FirstName", FirstName);
                myCommand.Parameters.AddWithValue("@LastName", LastName);
                myCommand.Parameters.AddWithValue("@PhoneNumber", Phone);
                myCommand.Parameters.AddWithValue("@UserName", UserName);
                myCommand.ExecuteNonQuery();
                
                myConnection.Close();
            }
            newUser = Membership.GetUser(UserName);
            newUser.Email = Email;
            

            if (Roles.IsUserInRole(newUser.UserName, "Admin"))
                role = "Admin";
            else
                if (Roles.IsUserInRole(newUser.UserName, "SuperAdmin"))
                    role = "SuperAdmin";
                else
                    role = "ATSPersonnel";

            Roles.RemoveUserFromRole(newUser.UserName, role);
             

            if (RadioButton2.Checked)
                Roles.AddUserToRole(newUser.UserName, "Admin");
            else
                if (RadioButton1.Checked)
                    Roles.AddUserToRole(newUser.UserName, "SuperAdmin");
                else
                    Roles.AddUserToRole(newUser.UserName, "ATSPersonnel");

            if (RadioButton4.Checked)
                newUser.IsApproved = true;
            else
                newUser.IsApproved = false;

            Membership.UpdateUser(newUser);
            Response.Redirect("ModifyUserAccount.aspx");
        }

    }
}