/** 
 * ------------------------------------------------------------
 * File name:  Checkout.aspx
 * Project Name: ATS
 * ------------------------------------------------------------
 * Author's name and email: Keith Wilt
 * Course-Selection: CSCI-3350
 * Creation Date: 4/02/13
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
    public partial class Checkout : System.Web.UI.Page
    {
        string itemNumber, firstName, lastName, phoneNum, email, eNumber, department, dueDate,user = "";
        int checkOutLength;
        string checkOutDate = DateTime.Now.ToString("d");
        string istrue = "True";
        string isFalse = "False";
        protected void Page_Load(object sender, EventArgs e)
        {
            FailLabel.Visible = false;
             user = Membership.GetUser().UserName.ToString();
            //Confirm before submitting
            SearchButton.Attributes.Add("onclick", "javascript:return confirm('Are you sure you want to Checkout this item?\\nIf The Faculty is not already in the sytem they will be added');");
        }

        protected void SearchButton_Click1(object sender, EventArgs e)
        {
            itemNumber = ItemNumTextBox.Text;
            firstName = FirstNameTextBox.Text;
            lastName = LastNameTextBox.Text;
            phoneNum = PhoneNumTextBox.Text;
            email = EmailTextBox.Text;
            eNumber = EnumTextBox.Text;
            department = DepartmentTextBox.Text;
            //get item and faculty input
            string connectionString = ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                //Check if faculty exists
                string checkCommand = "SELECT * FROM Faculty WHERE [eNumber] = @Enumber";


                //Check if equipment exists and is checked out
                string CommandText = "SELECT * FROM EquipmentItem WHERE [itemNumber] = @itemNumber AND [checkedOut]=@true";
                //create checkout transaction
                string insertCommand = "INSERT INTO CheckOut (itemNumber,enumber,personnelCheckedOut,checkoutDate,dueDate)values(@itemNumber,@eNumber,@person,@checkoutDate,@dueDate)";
                //if faculty doesnt exists add them
                string insertFaculty = "INSERT INTO Faculty (eNumber,firstName,lastName,phoneNumber,email,department)values(@eNumber,@firstName,@lastName,@phoneNumber,@email,@department)";
                //update equipment item as checked out
                string update = "Update [EquipmentItem] SET [checkedOut] =@true  WHERE [itemNumber] =@item1 ";




                SqlCommand cmd = new SqlCommand(insertCommand, con);
                SqlCommand cmd1 = new SqlCommand(CommandText, con);
                SqlCommand cmd2 = new SqlCommand(checkCommand, con);
                SqlCommand cmd3 = new SqlCommand(insertFaculty, con);
                SqlCommand cmd4 = new SqlCommand(update, con);
                //Add paramters to SQL queries
                cmd4.Parameters.AddWithValue("@true", istrue);
                cmd4.Parameters.AddWithValue("@item1", itemNumber);
                cmd3.Parameters.Add(new SqlParameter("@eNumber", eNumber));
                cmd3.Parameters.Add(new SqlParameter("@firstName", firstName));
                cmd3.Parameters.Add(new SqlParameter("@lastName", lastName));
                cmd3.Parameters.Add(new SqlParameter("@phoneNumber", phoneNum));
                cmd3.Parameters.Add(new SqlParameter("@email", email));
                cmd3.Parameters.Add(new SqlParameter("@department", department));
                cmd.Parameters.Add(new SqlParameter("@itemNumber", itemNumber));
                cmd.Parameters.Add(new SqlParameter("@eNumber", eNumber));
                cmd.Parameters.Add(new SqlParameter("@person", user));

                cmd.Parameters.Add(new SqlParameter("@checkoutDate", checkOutDate));
                cmd1.Parameters.AddWithValue("@itemNumber", itemNumber);
                cmd2.Parameters.AddWithValue("@Enumber", eNumber);
                cmd1.Parameters.AddWithValue("@true", isFalse);
                //add item as parameter
                con.Open();


                SqlDataReader rd = cmd1.ExecuteReader();

                if (!rd.HasRows)
                {
                    //if item doesnt exists or is checked out error
                    rd.Close();
                    FailLabel.Visible = true;
                    FailLabel.Text = "Equipment item does not exist, or is already checked out ";

                }
                else
                {
                    while (rd.Read())
                    {
                        if (!DBNull.Value.Equals(rd["checkoutLength"]))
                            checkOutLength = Convert.ToInt32(rd["checkoutLength"].ToString());
                    }
                    DateTime today = new DateTime();
                    DateTime day = new DateTime();
                    today = DateTime.Today;
                    day = today.Date;

                    dueDate = day.AddDays(checkOutLength).ToString("d"); //calculate due date by adding check out length to current date

                    rd.Close();
                    cmd.Parameters.Add(new SqlParameter("@dueDate", dueDate));


                    SqlDataReader rd1 = cmd2.ExecuteReader();

                    if (rd1.HasRows)
                    {
                        rd1.Close();
                        //insert checkout and update equipment
                        cmd.ExecuteNonQuery();
                        cmd4.ExecuteNonQuery();
                    }
                    else
                    {
                        rd1.Close();
                        //insert faculty, insert checkout and update equipment
                        cmd3.ExecuteNonQuery();
                        cmd.ExecuteNonQuery();
                        cmd4.ExecuteNonQuery();

                    }

                }



                con.Close();
            }
        }
    }
}