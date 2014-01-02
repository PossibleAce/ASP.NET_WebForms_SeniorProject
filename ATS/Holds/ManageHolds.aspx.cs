/** 
 * ------------------------------------------------------------
 * File name:  ManageHolds.aspx
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

namespace ATS.Holds
{
    public partial class ManageHolds : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
         {
             if (ListBox1.Items.Count == 0)
             {
                 string connectionString = ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString;

                 using (SqlConnection myConnection = new SqlConnection(connectionString))
                 {
                     myConnection.Open();
                     //Create sql query
                     SqlCommand cmd = new SqlCommand();
                     cmd.CommandText = "SELECT RequestID FROM Request";
                     cmd.Connection = myConnection;
                     SqlDataReader dr;
                     dr = cmd.ExecuteReader();
                     if (dr.HasRows) // if no item is entered or item doesnt exist
                     {
                         while (dr.Read())
                         {
                             ListBox1.Items.Add(dr[0].ToString());
                         } // end while
                         dr.Close();
                     }
                 }
             }

        }

        protected void ListBox1_SelectedIndexChanged(object sender, EventArgs e)
        {

            string ID = ListBox1.SelectedValue;
            string connectionString = ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString;

            using (SqlConnection myConnection = new SqlConnection(connectionString))
            {
                myConnection.Open();
                //Create sql query
                SqlCommand cmd4 = new SqlCommand();
                cmd4.Parameters.AddWithValue("@ID", ID);
                cmd4.CommandText = "SELECT * FROM Request WHERE [RequestID] = @ID";
                cmd4.Connection = myConnection;
                SqlDataReader dr;
                dr = cmd4.ExecuteReader();
                if (dr.HasRows) // if no item is entered or item doesn't exist
                {
                    while (dr.Read())
                    {

                        EN.Text = dr[1].ToString();
                        RT.Text = dr[2].ToString();

                        if (dr[3].ToString() != "")
                            SD.Text = dr[3].ToString();
                        else
                            SD.Text = "Null";

                        if (dr[4].ToString() != "")
                            ED.Text = dr[4].ToString();
                        else
                            ED.Text = "Null";

                        IN.Text = dr[5].ToString();
                        FN.Text = dr[6].ToString();
                        LN.Text = dr[7].ToString();
                        Email.Text = dr[8].ToString();
                        PN.Text = dr[9].ToString();
                        DPT.Text = dr[10].ToString();

                        if (dr[11].ToString() == "True")
                            PRO.Text = "Yes";
                        if (dr[11].ToString() == "False")
                            PRO.Text = "No";

                        if (dr[12].ToString() != "")
                            PP.Text = dr[12].ToString();
                        else
                            PP.Text = "Null";

                        if (dr[13].ToString() != "")
                            PT.Text = dr[13].ToString();
                        else
                            PT.Text = "Null";

                    } // end while
                    
                }dr.Close();

                SqlCommand cmd = new SqlCommand();
                //add item as parameter
                cmd.Parameters.AddWithValue("@inum", IN.Text);
                cmd.CommandText = "SELECT * FROM EquipmentItem WHERE [itemNumber] = @inum";
                cmd.Connection = myConnection;
                dr = cmd.ExecuteReader();
                if (!dr.HasRows) // if no item is entered or item doesnt exist
                {

                    FailLabel0.Text = "Item not found!"; //display item not found
                    dr.Close();
                }
                else // if valid item is entered
                {
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
                        cmd1.Parameters.AddWithValue("@inum", IN.Text);
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
                    cmd2.Parameters.AddWithValue("@inum", IN.Text);
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
                    cmd3.Parameters.AddWithValue("@inum", IN.Text);
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
                //Create sql query
                SqlCommand cmd5 = new SqlCommand();
                //add item as parameter
                cmd5.Parameters.AddWithValue("@inum", IN.Text);
                cmd5.CommandText = "SELECT * FROM EquipmentItem Join category on EquipmentItem.categoryID = category.categoryID WHERE [itemNumber] = @inum";
                cmd5.Connection = myConnection;
                dr = cmd5.ExecuteReader();
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
                    myConnection.Close();
                }
            }
        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            if (RT.Text.Substring(0,7) == "Reserve" && PRO.Text.Substring(0,2) == "No")
            {
                string connectionString = ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString;
                string insertSql1 = "UPDATE Request SET Done = @Do, ProcessPersonnel = @ProP, ProcessedTime = @ProT, RequestID = @ReID WHERE  RequestID= @RID";
                string insertSql = "INSERT INTO Reserve (atsPersonnel, itemNumber, eNumber, processedDate, startReserveDate, endReserveDate) VALUES(@NM, @IN, @EN, @PD, @SD, @ED)";
                string ProP = Membership.GetUser().UserName;
                DateTime ProT = DateTime.Now;
                string Do = "True";
                string ReID = "Approved" + ListBox1.SelectedValue.Substring(11);
                using (SqlConnection myConnection = new SqlConnection(connectionString))
                {

                    myConnection.Open();

                    SqlCommand myCommand = new SqlCommand(insertSql, myConnection);
                    myCommand.Parameters.AddWithValue("@NM", ProP);
                    myCommand.Parameters.AddWithValue("@IN", IN.Text);
                    myCommand.Parameters.AddWithValue("@EN", EN.Text);
                    myCommand.Parameters.AddWithValue("@PD", ProT);
                    myCommand.Parameters.AddWithValue("@SD", SD.Text);
                    myCommand.Parameters.AddWithValue("@ED", ED.Text);
                    myCommand.ExecuteNonQuery();

                    SqlCommand myCommand1 = new SqlCommand(insertSql1, myConnection);
                    myCommand1.Parameters.AddWithValue("@Do", Do);
                    myCommand1.Parameters.AddWithValue("@Prop", ProP);
                    myCommand1.Parameters.AddWithValue("@ProT", ProT);
                    myCommand1.Parameters.AddWithValue("@ReID", ReID);
                    myCommand1.Parameters.AddWithValue("@RID", ListBox1.SelectedValue);
                    myCommand1.ExecuteNonQuery();

                    myConnection.Close();
                }
                FailLabel1.Text = "Operation successed!";
            }
            else
                if (RT.Text.Substring(0,4) == "Hold" && PRO.Text.Substring(0,2) == "No")
                {
                    string connectionString = ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString;
                    string insertSql1 = "UPDATE Request SET Done = @Do, ProcessPersonnel = @ProP, ProcessedTime = @ProT, RequestID = @ReID WHERE  RequestID= @RID";
                    string insertSql = "INSERT INTO Hold (atsPersonnel, itemNumber, eNumber, processedDate) VALUES(@NM, @IN, @EN, @PD)";
                    string ProP = Membership.GetUser().UserName;
                    DateTime ProT = DateTime.Now;
                    string Do = "True";
                    string ReID = "Approved" + ListBox1.SelectedValue.Substring(11);
                    using (SqlConnection myConnection = new SqlConnection(connectionString))
                    {

                        myConnection.Open();

                        SqlCommand myCommand = new SqlCommand(insertSql, myConnection);
                        myCommand.Parameters.AddWithValue("@NM", ProP);
                        myCommand.Parameters.AddWithValue("@IN", IN.Text);
                        myCommand.Parameters.AddWithValue("@EN", EN.Text);
                        myCommand.Parameters.AddWithValue("@PD", ProT);
                        myCommand.ExecuteNonQuery();

                        SqlCommand myCommand1 = new SqlCommand(insertSql1, myConnection);
                        myCommand1.Parameters.AddWithValue("@Do", Do);
                        myCommand1.Parameters.AddWithValue("@Prop", ProP);
                        myCommand1.Parameters.AddWithValue("@ProT", ProT);
                        myCommand1.Parameters.AddWithValue("@ReID", ReID);
                        myCommand1.Parameters.AddWithValue("@RID", ListBox1.SelectedValue);
                        myCommand1.ExecuteNonQuery();

                        myConnection.Close();
                    }
                    FailLabel1.Text = "Operation successed!";
                }
                else
                    if (RT.Text.Substring(0, 5) == "Renew" && PRO.Text.Substring(0, 2) == "No")
                    {
                        string connectionString = ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString;
                        string insertSql1 = "UPDATE Request SET Done = @Do, ProcessPersonnel = @ProP, ProcessedTime = @ProT, RequestID = @ReID WHERE  RequestID= @RID";
                        string insertSql = "UPDATE CheckOut SET dueDate = @Due WHERE  itemNumber = @IN";
                        string ProP = Membership.GetUser().UserName;
                        DateTime ProT = DateTime.Now;
                        string Do = "True";
                        string ReID = "Approved" + ListBox1.SelectedValue.Substring(11);
                        DateTime StartDate = Convert.ToDateTime(to.Text);
                        int days = Convert.ToInt16(COL.Text);
                        DateTime Due = StartDate.AddDays(days);
                        string IN1 = IN.Text;
                        using (SqlConnection myConnection = new SqlConnection(connectionString))
                        {

                            myConnection.Open();

                            SqlCommand myCommand = new SqlCommand(insertSql, myConnection);
                            myCommand.Parameters.AddWithValue("@Due", Due);
                            myCommand.Parameters.AddWithValue("@IN", IN1);
                            
                            myCommand.ExecuteNonQuery();

                            SqlCommand myCommand1 = new SqlCommand(insertSql1, myConnection);
                            myCommand1.Parameters.AddWithValue("@Do", Do);
                            myCommand1.Parameters.AddWithValue("@Prop", ProP);
                            myCommand1.Parameters.AddWithValue("@ProT", ProT);
                            myCommand1.Parameters.AddWithValue("@ReID", ReID);
                            myCommand1.Parameters.AddWithValue("@RID", ListBox1.SelectedValue);
                            myCommand1.ExecuteNonQuery();

                            myConnection.Close();
                        }
                        FailLabel1.Text = "Operation successed!";
                    }
                    else
                    FailLabel1.Text = "Error! Can not excute!";
            ListBox1.Items.Clear();
            string connectionString1 = ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString;
            using (SqlConnection myConnection = new SqlConnection(connectionString1))
            {
                myConnection.Open();
                //Create sql query
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "SELECT RequestID FROM Request";
                cmd.Connection = myConnection;
                SqlDataReader dr;
                dr = cmd.ExecuteReader();
                if (dr.HasRows) // if no item is entered or item doesnt exist
                {
                    while (dr.Read())
                    {
                        ListBox1.Items.Add(dr[0].ToString());
                    } // end while
                    dr.Close();
                }
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            if (PRO.Text.Substring(0, 2) == "No")
            {
                string connectionString = ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString;
                string insertSql1 = "UPDATE Request SET Done = @Do, ProcessPersonnel = @ProP, ProcessedTime = @ProT, RequestID = @ReID WHERE  RequestID= @RID";

                string ProP = Membership.GetUser().UserName;
                DateTime ProT = DateTime.Now;
                string Do = "True";
                string ReID = "Denied" + ListBox1.SelectedValue.Substring(11);
                using (SqlConnection myConnection = new SqlConnection(connectionString))
                {

                    myConnection.Open();

                    SqlCommand myCommand1 = new SqlCommand(insertSql1, myConnection);
                    myCommand1.Parameters.AddWithValue("@Do", Do);
                    myCommand1.Parameters.AddWithValue("@Prop", ProP);
                    myCommand1.Parameters.AddWithValue("@ProT", ProT);
                    myCommand1.Parameters.AddWithValue("@ReID", ReID);
                    myCommand1.Parameters.AddWithValue("@RID", ListBox1.SelectedValue);
                    myCommand1.ExecuteNonQuery();

                    myConnection.Close();
                }
                FailLabel1.Text = "Operation successed!";
                ListBox1.Items.Clear();
                string connectionString1 = ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString;
                using (SqlConnection myConnection = new SqlConnection(connectionString1))
                {
                    myConnection.Open();
                    //Create sql query
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandText = "SELECT RequestID FROM Request";
                    cmd.Connection = myConnection;
                    SqlDataReader dr;
                    dr = cmd.ExecuteReader();
                    if (dr.HasRows) // if no item is entered or item doesnt exist
                    {
                        while (dr.Read())
                        {
                            ListBox1.Items.Add(dr[0].ToString());
                        } // end while
                        dr.Close();
                    }
                }

            }
            else
            {
                FailLabel1.Text = "Can not excute!";
            }
        }

       

    }
}