/** 
 * ------------------------------------------------------------
 * File name: Search.aspx
 * Project Name: ATS
 * ------------------------------------------------------------
 * Author's name and email: Keith Wilt (wiltkj@goldmail.etsu.edu)
 * Course-Selection: CSCI-3350
 * Creation Date: 04/01/2013
 * Last modified: Nathaniel Davis, 04/30/2013, davisn@goldmail.etsu.edu
 * -------------------------------------------------------------
 */
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
namespace ATS.Inventory
{
    /**
     * Class Name: Search
     * Class Purpose: The main class of the search page. It dislays search information
     * retrieved from the database search.
     * 
     * 
     * Date created: Fed 01, 2013
     * Date last modified: April 01, 2013
     * @author Nathaniel Davis
     */
    public partial class Search : System.Web.UI.Page
    {
        /**
         * Method Name: Page_Load
         * Method Purpose: The method when the page loads. Displays search from the input.
         * 
         * 
         * Date created: Feb 01, 2013
         * Date last modified: March 30, 2013
         * 
         * 
         * Notes on specification, special algorithms, and assumptions: N/A
         * 
         * 
         * @param object sender (not used in this program)
         * @param EventArgs e (not used in this program)
         * @returns void
         */
        protected void Page_Load(object sender, EventArgs e)
        {
            FailLabel.Visible = false;
            string searchQuery = (string)Session["search"];
            string connectionString = ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connectionString))
            {

                string checkCommand = "SELECT itemNumber,name,serialNumber,categoryname,keywords,checkoutLength,comments FROM EquipmentItem FULL OUTER JOIN category on EquipmentItem.categoryID = category.categoryID WHERE name LIKE '%'+@search+'%' OR itemNumber LIKE '%'+@search+'%' OR serialNumber LIKE '%'+@search+'%' OR categoryname LIKE '%'+@search+'%' OR keywords LIKE '%'+@search+'%' OR comments LIKE '%'+@search+'%'   ";

                SqlCommand cmd2 = new SqlCommand(checkCommand, con);

                cmd2.Parameters.Add(new SqlParameter("@search", searchQuery));


                try
                {
                    SqlDataAdapter da = new SqlDataAdapter(cmd2);
                    DataSet ds = new DataSet();
                    da.Fill(ds);
                    GridView1.DataSource = ds;
                    GridView1.DataBind();
                }
                catch (SqlException)
                {
                    FailLabel.Visible = true;
                    FailLabel.Text = "Could Not Find Search Term. Please Try Again";
                }

                con.Close();
            }
        } // end class Page_Load


        /**
         * Method Name: Button4_Click
         * Method Purpose: The event handler for when button2 is clicked
         * 
         * 
         * Date created: Feb 01, 2013
         * Date last modified: March 30, 2013
         * 
         * 
         * Notes on specification, special algorithms, and assumptions: N/A
         * 
         * 
         * @param object sender (not used in this program)
         * @param EventArgs e (not used in this program)
         * @returns void
         */
        protected void Button4_Click(object sender, EventArgs e)
        {
            string inum = itemnumber.Text;

            string connectionString = ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString;

            using (SqlConnection myConnection = new SqlConnection(connectionString))
            {
                myConnection.Open();
                //Create sql query
                SqlCommand cmd = new SqlCommand();
                //add item as parameter
                cmd.Parameters.AddWithValue("@inum", inum);
                cmd.CommandText = "SELECT * FROM EquipmentItem WHERE [itemNumber] = @inum";
                cmd.Connection = myConnection;
                SqlDataReader dr;
                dr = cmd.ExecuteReader();
                if (!dr.HasRows) // if no item is entered or item doesnt exist
                {

                    FailLabel0.Text = "Item not found!"; //display item not found
                    checkout.Text = "";
                    from.Text = "";
                    to.Text = "";
                    from1.Text = "";
                    to1.Text = "";
                    to2.Text = "";
                    from2.Text = "";
                    reserved.Text = "";
                    onhold.Text = "";

                }
                else // if valid item is entered
                {
                    FailLabel0.Text = "";
                    string checkedout = "";
                    //read values from sql query
                    while (dr.Read())
                    {
                        checkedout = dr[13].ToString();

                    } // end while
                    dr.Close();
                    if (checkedout == "True")
                    {
                        checkout.Text = "Yes";
                        SqlCommand cmd1 = new SqlCommand();
                        //add item as parameter
                        cmd1.Parameters.AddWithValue("@inum", inum);
                        cmd1.CommandText = "SELECT * FROM CheckOut WHERE [itemNumber] = @inum";
                        cmd1.Connection = myConnection;
                        dr = cmd1.ExecuteReader();

                        while (dr.Read())
                        {
                            from.Text = dr[5].ToString();
                            to.Text = dr[7].ToString();
                        } // end while
                        dr.Close();

                    }
                    else
                    {
                        checkout.Text = "No";
                        from.Text = "";
                        to.Text = "";
                    }
                    SqlCommand cmd2 = new SqlCommand();
                    //add item as parameter
                    cmd2.Parameters.AddWithValue("@inum", inum);
                    cmd2.CommandText = "SELECT * FROM Hold WHERE [itemNumber] = @inum";
                    cmd2.Connection = myConnection;
                    dr = cmd2.ExecuteReader();
                    if (!dr.HasRows) // if no item is entered or item doesnt exist
                    {
                        onhold.Text = "No";
                        from1.Text = "";
                        to1.Text = "";
                    }
                    else
                    {
                        onhold.Text = "Yes";
                        while (dr.Read())
                        {
                            from1.Text = dr[4].ToString();
                            to1.Text = dr[5].ToString();
                        } // end while

                    } dr.Close();

                    SqlCommand cmd3 = new SqlCommand();
                    //add item as parameter
                    cmd3.Parameters.AddWithValue("@inum", inum);
                    cmd3.CommandText = "SELECT * FROM Reserve WHERE [itemNumber] = @inum";
                    cmd3.Connection = myConnection;
                    dr = cmd3.ExecuteReader();
                    if (!dr.HasRows) // if no item is entered or item doesnt exist
                    {
                        reserved.Text = "No";
                        from2.Text = "";
                        to2.Text = "";
                    }
                    else
                    {
                        reserved.Text = "Yes";
                        while (dr.Read())
                        {
                            from2.Text = dr[4].ToString();
                            to2.Text = dr[5].ToString();
                        } // end while

                    } dr.Close();
                }
                myConnection.Close();

            }
        } // end Page_Load Method

        /**
         * Method Name: Button2_Click
         * Method Purpose: The button1 is clicked, this is the event that handles
         * 
         * 
         * Date created: Feb 01, 2013
         * Date last modified: March 30, 2013
         * 
         * 
         * Notes on specification, special algorithms, and assumptions: N/A
         * 
         * 
         * @param object sender (not used in this program)
         * @param EventArgs e (not used in this program)
         * @returns void
         */
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (reserved.Text == "No" && checkout.Text == "No" && onhold.Text == "No")
            {
                String url = "Request/Reserve.aspx?field1=" + itemnumber.Text;
                Response.Redirect(url);
            }
            else
            {
                FailLabel1.Text = "Can not reserve, item already is checked out or reserved!";
            }
        } // end method Button1_Click


        /**
         * Method Name: Button2_Click
         * Method Purpose: The button2 is clicked, this is the event that handles it.
         * 
         * 
         * Date created: Feb 01, 2013
         * Date last modified: March 30, 2013
         * 
         * 
         * Notes on specification, special algorithms, and assumptions: N/A
         * 
         * 
         * @param object sender (not used in this program)
         * @param EventArgs e (not used in this program)
         * @returns void
         */
        protected void Button2_Click(object sender, EventArgs e)
        {
            if (checkout.Text == "Yes" && onhold.Text == "No")
            {
                String url = "Request/Hold.aspx?field1=" + itemnumber.Text;
                Response.Redirect(url);
            }
            else
            {
                FailLabel1.Text = "Can not hold, item already is still in inventory or has a hold currently!";
            }
        } // End method Button2_Click


        /**
         * Method Name: Button3_Click
         * Method Purpose: The button3 is clicked, this is the event that handles it.
         * 
         * 
         * Date created: Feb 01, 2013
         * Date last modified: March 30, 2013
         * 
         * 
         * Notes on specification, special algorithms, and assumptions: N/A
         * 
         * 
         * @param object sender (not used in this program)
         * @param EventArgs e (not used in this program)
         * @returns void
         */
        protected void Button3_Click(object sender, EventArgs e)
        {
            if (checkout.Text == "Yes" && onhold.Text == "No")
            {
                String url = "Request/Renew.aspx?field1=" + itemnumber.Text;
                Response.Redirect(url);
            }
            else
            {
                FailLabel1.Text = "Can not renew, item is on hold or reserved currently";
            }
        } // End Button3_Click

    } // end class Search

} // end namespace ATS.Inventory