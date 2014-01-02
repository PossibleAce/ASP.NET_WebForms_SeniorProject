/** 
 * ------------------------------------------------------------
 * File name:  CreateAccount.aspx
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
using System.Data.SqlClient;
using System.Web.Security;
using System.Configuration;

namespace ATS.AccountManagement
{
    public partial class CreateAccount : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void CreateUserWizard1_CreatedUser(object sender, EventArgs e)
        {
            // Get the UserId of the just-added user
            MembershipUser newUser = Membership.GetUser(CreateUserWizard1.UserName);

            Guid newUserId = (Guid)newUser.ProviderUserKey;

            //Get Profile Data Entered by user in CUW control
            String FirstName = ((TextBox)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("FirstName")).Text;

            String ATSID = ((TextBox)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("ID")).Text;

            String LastName = ((TextBox)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("LastName")).Text;

            String UserName = ((TextBox)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("UserName")).Text;

            String PhoneNumber = ((TextBox)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("PhoneNumber")).Text;

            Console.WriteLine(FirstName); Console.WriteLine(LastName); Console.WriteLine(UserName); Console.Read();
            // Insert a new record into User_Profile

            // Get your Connection String from the web.config. MembershipConnectionString is the name I have in my web.config

            string connectionString = ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString;
            string insertSql = "INSERT INTO UserInfo(UserId, UserName, ATSID, FirstName, LastName, PhoneNumber) VALUES(@UserId, @UserName, @ATSID, @FirstName, @LastName, @PhoneNumber)";

            using (SqlConnection myConnection = new SqlConnection(connectionString))
            {
            
                myConnection.Open();
            
                SqlCommand myCommand = new SqlCommand(insertSql, myConnection);

                myCommand.Parameters.AddWithValue("@UserId", newUserId);
                myCommand.Parameters.AddWithValue("@UserName", UserName);
                myCommand.Parameters.AddWithValue("@ATSID", ATSID);
                myCommand.Parameters.AddWithValue("@FirstName", FirstName);
                
                myCommand.Parameters.AddWithValue("@LastName", LastName);
                myCommand.Parameters.AddWithValue("@PhoneNumber", PhoneNumber);
                myCommand.ExecuteNonQuery();

                myConnection.Close();
            }
            
        }

        protected void SuperAdmin_CheckedChanged(object sender, EventArgs e)
        {
            Roles.AddUserToRole(CreateUserWizard1.UserName, ((RadioButton)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("SuperAdmin")).Text);
        }

        protected void Admin_CheckedChanged(object sender, EventArgs e)
        {
            Roles.AddUserToRole(CreateUserWizard1.UserName, ((RadioButton)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("Admin")).Text);
        }

        protected void ATSPersonnel_CheckedChanged(object sender, EventArgs e)
        {
            Roles.AddUserToRole(CreateUserWizard1.UserName, ((RadioButton)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("ATSPersonnel")).Text);
        }

  
        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("CreateAccount.aspx");
        }

        protected void ContinueButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }

    



  }
}
