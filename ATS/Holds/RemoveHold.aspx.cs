/** 
 * ------------------------------------------------------------
 * File name: RemoveHold.aspx
 * Project Name: ATS
 * ------------------------------------------------------------
 * Author's name and email: Keith Wilt
 * Course-Selection: CSCI-3350
 * Creation Date: 4/20/13
 * Last modified: Keith Wilt, 5/1/13
 * -------------------------------------------------------------
 */
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
namespace ATS.Holds
{
    public partial class RemoveHold : System.Web.UI.Page
    {

        ArrayList item = new ArrayList();
        string itemNumber;
        protected void Page_Load(object sender, EventArgs e)
        {


            int i = 0;
            //connect to the DB
            string connectionString = ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();

                //Create sql query
                SqlCommand cmd = new SqlCommand();
               


                cmd.CommandText = "SELECT * FROM Request WHERE RequestType = @hold AND Done = @true";
                cmd.Parameters.AddWithValue("@hold", "Hold");
                    cmd.Parameters.AddWithValue("@true", true);
                //run query
                cmd.Connection = con;
                SqlDataReader dr;
                dr = cmd.ExecuteReader();
                if (!dr.HasRows) // if no item is entered or item doesnt exist
                {
                    FailLabel.Visible = true;
                    FailLabel.Text = "There are no items on Hold.";
                }
                else // if valid item is entered
                {
                    //read values from sql query
                    while (dr.Read())
                    {

                        TableRow row = new TableRow();
                        row.ID = "row" + i;

                        CheckBox c = new CheckBox();
                        //create table
                        TableCell cell0 = new TableCell();
                        cell0.ID = "cell0-" + i;
                        TableCell cell1 = new TableCell();
                        cell1.ID = "cell1-" + i;
                        TableCell cell2 = new TableCell();
                        TableCell cell3 = new TableCell();
                        TableCell cell4 = new TableCell();
                        TableCell cell5 = new TableCell();
                        TableCell cell6 = new TableCell();
                        // c.
                        c.ID = "box" + i;
                        cell0.Controls.Add(c);

                        cell1.Controls.Add(new LiteralControl(dr[0].ToString()));


                        cell2.Attributes.Add("name", "myName" + i);

                        cell2.Attributes.Add("type", "Text");


                        cell2.Controls.Add(new LiteralControl(dr[1].ToString()));
                        item.Add(dr[1].ToString());
                        cell3.Controls.Add(new LiteralControl(dr[2].ToString()));

                        cell4.Controls.Add(new LiteralControl(dr[3].ToString()));
                        cell5.Controls.Add(new LiteralControl(dr[4].ToString()));
                        cell6.Controls.Add(new LiteralControl(dr[5].ToString()));
                        row.Cells.Add(cell0);
                        row.Cells.Add(cell1);
                        row.Cells.Add(cell2);
                        row.Cells.Add(cell3);
                        row.Cells.Add(cell4);
                        row.Cells.Add(cell5);
                        row.Cells.Add(cell6);
                        HoldTable.Rows.Add(row);
                        i++;

                    } // end while
                    con.Close(); //close connection

                    //confirm before removing
                    SubmitButton.Attributes.Add("onclick", "javascript:return confirm('Are you sure you want to remove this Hold?');");
                }
            }
        }

        protected void ClearButton_Click(object sender, EventArgs e)
        {
            //clear all checks in table
            int count = HoldTable.Rows.Count;
            CheckBox[] c = new CheckBox[count];
            for (int i = 0; i < count - 1; i++)
            {
                c[i] = (CheckBox)HoldTable.FindControl("box" + i);
                if (c[i].Checked)
                {
                    c[i].Checked = false;
                }
            }
        }

        protected void SubmitButton_Click(object sender, EventArgs e)
        {
            //Remove hold if checked


            int count = HoldTable.Rows.Count;
            ArrayList rowsChecked = new ArrayList();
            CheckBox[] c = new CheckBox[count];
            int row = 0;
            //get which values are checked

            for (int i = 0; i < count - 1; i++)
            {
                //please dont touch this
                //Needs to be updated from table to gridview
                //unless you are doing that dont change this
                //it will break =(
                c[i] = (CheckBox)HoldTable.FindControl("box" + i);
                if (c[i].Checked)
                {
                    TableCell tc = new TableCell();
                    TableRow tr = new TableRow();
                    tc = (TableCell)c[i].Parent;
                    tr = (TableRow)tc.Parent;
                    string data = tc.ID;
                    row = int.Parse(data.Substring(6, 1));

                    rowsChecked.Add(row);

                }

            }
            for (int i = 0; i < rowsChecked.Count; i++)
            {

                itemNumber = item[(int)rowsChecked[i] - i].ToString();




                string connectionString = ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString;

                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    con.Open();

                    
                    SqlCommand cmd = new SqlCommand();
                 
                    //delete the hold from the system
                    cmd = new SqlCommand("DELETE FROM Hold WHERE [itemNumber] ='" + itemNumber + "'", con);


                    cmd.ExecuteNonQuery();

                    con.Close();

                    item.RemoveAt((int)rowsChecked[i] - i);


                }
                for (int x = 0; x <= count; x++)
                {
                    //remove from the table after deleting
                    TableRow tr2 = new TableRow();
                    tr2 = (TableRow)HoldTable.FindControl("row" + x);
                    HoldTable.Rows.Remove(tr2);
                }
                Page_Load(sender, e);
            }

        }
    }
}
