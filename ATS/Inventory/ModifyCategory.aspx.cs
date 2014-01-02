/** 
 * ------------------------------------------------------------
 * File name:  ModifyCategory.aspx
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
    public partial class ModifyCategory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label2.Visible = false;
            Label4.Visible = false;
            TextBox1.Visible = false;
            Button3.Visible = false;
            FailLabel.Visible = false;
            Button2.Attributes.Add("onclick", "javascript:return confirm('Are you sure you want to delete this item?');");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            string category = CategoryTextBox.Text;

           

            string connectionString = ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connectionString))
            {

                //gcheck if category has items in it
                string checkCommand = "SELECT * FROM EquipmentItem INNER JOIN category on EquipmentItem.categoryID = category.categoryID WHERE [categoryname] = @category";
                //get category
                string CommandText = "SELECT * FROM category WHERE [categoryname] = @category";
                //delete category
                string deleteCommand = "DELETE FROM category WHERE [categoryname] = @category";
            

                SqlCommand cmd = new SqlCommand(deleteCommand, con);
                SqlCommand cmd1 = new SqlCommand(CommandText, con);
                SqlCommand cmd2 = new SqlCommand(checkCommand, con);
                cmd.Parameters.Add(new SqlParameter("@category", category));
                cmd1.Parameters.AddWithValue("@category", category);
                cmd2.Parameters.AddWithValue("@category", category);
                //add item as parameter
                con.Open();

                SqlDataReader rd1 = cmd2.ExecuteReader();

                if (!rd1.HasRows)
                {
                    rd1.Close();
                    SqlDataReader rd = cmd1.ExecuteReader();

                    if (!rd.HasRows)
                    {
                        rd.Close();
                        FailLabel.Visible = true;
                        FailLabel.Text = "Category could not be deleted";

                    }
                    else
                    {
                        rd.Close();

                        cmd.ExecuteNonQuery();



                    }

                }

                else
                {
                    rd1.Close();
                    FailLabel.Visible = true;
                    FailLabel.Text = "There are items in this category" + "<br />" +
                    "This category can not be deleted until it is empty";
                }
                con.Close();
                CategoryTextBox.Text = "";
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string category = CategoryTextBox.Text;



            string connectionString = ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connectionString))
            {


                string checkCommand = "SELECT * FROM category WHERE [categoryname] = @category";
                SqlCommand cmd2 = new SqlCommand(checkCommand, con);

                cmd2.Parameters.Add(new SqlParameter("@category", category));

                con.Open();
                SqlDataReader rd1 = cmd2.ExecuteReader();
                if (!rd1.HasRows)
                {
                    rd1.Close();
                    FailLabel.Visible = true;
                    FailLabel.Text = "Category could not be Modfied";

                }
                else
                {
                    rd1.Close();


                    Label2.Visible = true;
                    Label4.Visible = true;
                    TextBox1.Visible = true;
                    Button3.Visible = true;

                }
                con.Close();
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            string category = CategoryTextBox.Text;
            string connectionString = ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                //update category
                string modifyCommand = "Update [category] SET [categoryname] =@newcategory WHERE [categoryname] = @category";
                SqlCommand cmd1 = new SqlCommand(modifyCommand, con);
                string newCategory = TextBox1.Text;
                con.Open();
                cmd1.Parameters.Add(new SqlParameter("@newcategory", newCategory));
                cmd1.Parameters.Add(new SqlParameter("@category", category));
                try
                {

                    cmd1.ExecuteNonQuery();
                }
                catch (SqlException)
                {

                    FailLabel.Visible = true;
                    FailLabel.Text = "Category could not be modified";

                }

                con.Close();
                CategoryTextBox.Text = "";
            }
        }
    }
}