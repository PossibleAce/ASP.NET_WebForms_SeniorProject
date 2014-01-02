/** 
 * ------------------------------------------------------------
 * File name:  AddCategory.aspx
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
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Configuration;

namespace ATS.Inventory
{   /**
    * Class Name: AddCategory
    * Class Purpose: Allows user to add a new category item
    *
    * 
    * Date created: 3/20/13
    * Last modified: Nathaniel Davis, 4/1/13
    * @author Nathaniel Davis
    */
    public partial class AddCategory : System.Web.UI.Page
    {
        string category;
        Boolean test;

        protected void Page_Load(object sender, EventArgs e)
        {
            Button1.Attributes.Add("onclick", "javascript:return confirm('Are you sure you want to add this category?');");
            Button2.PostBackUrl = "Default.aspx";
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            FailLabel.Visible = false;
            category = CategoryTextBox.Text;



            if ( category == null || category == "" )
            {
                FailLabel.Visible = true;
                test = true;
                FailLabel.Text = "Error: No Category was Entered";
            }

 string connectionString = ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString;

 using (SqlConnection con = new SqlConnection(connectionString))
 {
     con.Open();
     SqlCommand cmd1 = new SqlCommand();
     //add item as parameter
     cmd1.Parameters.AddWithValue("@categoryname", category);

     cmd1.CommandText = "SELECT * FROM category WHERE [categoryname] = @categoryname";

     //run query
     cmd1.Connection = con;
     SqlDataReader dr;
     dr = cmd1.ExecuteReader();
     if (!dr.HasRows && test == false)
     {
         dr.Close();
         CategoryTextBox.Text = "";
         string sql = "INSERT INTO category(categoryname) VALUES ('" + category + "')";
       
         SqlCommand cmd = new SqlCommand(sql, con);
         StringBuilder sb = new StringBuilder(string.Empty);
         cmd.CommandType = CommandType.Text;
         cmd.CommandText = sql;
         
         cmd.ExecuteNonQuery();
         con.Close();
         FailLabel.Text = "Success!" + category + " has been added";
        
     }
     else
     {
         dr.Close();
         FailLabel.Visible = true;
         FailLabel.Text = "Error: This Category already exists and can not be added";
         con.Close();
     }
 }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }
    }
}