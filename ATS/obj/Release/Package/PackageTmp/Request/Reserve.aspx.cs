/** 
 * ------------------------------------------------------------
 * File name:  Reserve.aspx
 * Project Name: ATS
 * ------------------------------------------------------------
 * Author's name and email: Nathaniel Davis
 * Course-Selection: CSCI-3350
 * Creation Date: 3/20/13
 * Last modified: Nathaniel Davis, 4/30/13
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
using System.Globalization;

namespace ATS.Request
{
    public partial class Reserve : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label13.Text = Request.QueryString["field1"];
            string inum = Label13.Text;

            string connectionString = ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString;

            using (SqlConnection myConnection = new SqlConnection(connectionString))
            {
                myConnection.Open();
                //Create sql query
                SqlCommand cmd = new SqlCommand();
                //add item as parameter
                cmd.Parameters.AddWithValue("@inum", inum);
                cmd.CommandText = "SELECT * FROM EquipmentItem Join category on EquipmentItem.categoryID = category.categoryID WHERE [itemNumber] = @inum";
                cmd.Connection = myConnection;
                SqlDataReader dr;
                dr = cmd.ExecuteReader();
                if (!dr.HasRows) // if no item is entered or item doesnt exist
                {

                    FailLabel0.Text = "Item not found!"; //display item not found
                }
                else // if valid item is entered
                {
                    string checkedout = "";
                    
                    //read values from sql query
                    while (dr.Read())
                    {
                        Name.Text = dr[1].ToString();
                        SN.Text = dr[2].ToString();
                        Cate.Text = dr[16].ToString();
                        COL.Text = dr[7].ToString();
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
                        checkout.Text = "No";
                    SqlCommand cmd2 = new SqlCommand();
                    //add item as parameter
                    cmd2.Parameters.AddWithValue("@inum", inum);
                    cmd2.CommandText = "SELECT * FROM Hold WHERE [itemNumber] = @inum";
                    cmd2.Connection = myConnection;
                    dr = cmd2.ExecuteReader();
                    if (!dr.HasRows) // if no item is entered or item doesnt exist
                    {
                        onhold.Text = "No";
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
        }


        protected void Button1_Click1(object sender, EventArgs e)
        {
            if (EN.Text == "" || FN.Text == "" || LN.Text == "" || PN.Text == "" || Email.Text == "" || DPT.Text == "")
                FailLabel1.Text = "All fields must not be empty!";
            else
            {
                string Y = "";
                string M = "";
                string D = "";
                string date = "";
                Y = YY.SelectedValue;
                M = MM.SelectedValue;
                D = DD.SelectedValue;
                date = Y + M + D;
                DateTime startdate = DateTime.ParseExact(date, "yyyyMMdd", CultureInfo.InvariantCulture);
                int days = Convert.ToInt16(COL.Text);
                DateTime endate = startdate.AddDays(days);
                DateTime RequestTime = DateTime.Now;
                string ID = "Unprocessed" + RequestTime.ToString();
                string connectionString = ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString;
                string insertSql = "INSERT INTO Request (RequestID, eNumber, RequestType, StartDate, EndDate, ItemNumber, FirstName, LastName, Email, PhoneNumber, Department) VALUES(@ID, @EN, @RT, @SD, @ED, @IN, @FN, @LN, @Email, @PN, @DPT)";

                using (SqlConnection myConnection = new SqlConnection(connectionString))
                {

                    myConnection.Open();

                    SqlCommand myCommand = new SqlCommand(insertSql, myConnection);

                    myCommand.Parameters.AddWithValue("@ID", ID);
                    myCommand.Parameters.AddWithValue("@EN", EN.Text);
                    myCommand.Parameters.AddWithValue("@RT", "Reserve");
                    myCommand.Parameters.AddWithValue("@SD", startdate);
                    myCommand.Parameters.AddWithValue("@ED", endate);
                    myCommand.Parameters.AddWithValue("@IN", Request.QueryString["field1"]);
                    myCommand.Parameters.AddWithValue("@FN", FN.Text);
                    myCommand.Parameters.AddWithValue("@LN", LN.Text);
                    myCommand.Parameters.AddWithValue("@Email", Email.Text);
                    myCommand.Parameters.AddWithValue("@PN", PN.Text);
                    myCommand.Parameters.AddWithValue("@DPT", DPT.Text);
                    myCommand.ExecuteNonQuery();

                    myConnection.Close();
                }
                Response.Redirect("Confirm.aspx");
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("../Default.aspx");
        }

    }
}