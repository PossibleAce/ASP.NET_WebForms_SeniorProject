/** 
 * ------------------------------------------------------------
 * File name:  ModifyEquipment.aspx
 * Project Name: ATS
 * ------------------------------------------------------------
 * Author's name and email: Keith Wilt
 * Course-Selection: CSCI-3350
 * Creation Date: 4/10/13
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
using System.Data;
using System.Configuration;
namespace ATS.Inventory
{
    public partial class ModifyEquipment : System.Web.UI.Page
    {
        //initialize values
        string clear = "";
        string name, itemNumber, serialNumber, category, keywords, comments;
        double dollarvalue;
        DateTime entryDate;
        int checkOutLength;
        Boolean lost, damaged, sentToSurplus = false;
        Boolean visable = true;
        string status = "";
        string searchBy ;
        string selecCategory;
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }


        protected void SearchButton_Click1(object sender, EventArgs e)
        {


            //connect to the DB
            string connectionString = ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();

          
                SqlCommand cmd = new SqlCommand();
             
                string searchBy = DropDownList.SelectedItem.Text;
                if (searchBy == "Item Number")
                {
                    string item = SearchTextBox.Text; //get item to seach for
                    cmd.Parameters.AddWithValue("@item", SearchTextBox.Text);
                    //get item and category by item number
                    cmd.CommandText = "SELECT * FROM EquipmentItem INNER JOIN category on EquipmentItem.categoryID = category.categoryID WHERE [itemNumber] = @item";
                }
                else if (searchBy == "Name")
                {

                    string item = SearchTextBox.Text; //get item to seach for
                    cmd.Parameters.AddWithValue("@item", SearchTextBox.Text);
                    //get item and category by name
                    cmd.CommandText = "SELECT * FROM EquipmentItem INNER JOIN category on EquipmentItem.categoryID = category.categoryID WHERE [name] = @item";


                }
                //run query
                cmd.Connection = con;
                SqlDataReader dr;
                dr = cmd.ExecuteReader();
                if (!dr.HasRows) // if no item is entered or item doesnt exist
                {

                    //clear all text boxes 
                    ItemNumTextBox.Text = clear;
                    NameTextBox.Text = clear;
                    SerialTextBox.Text = clear;
                    DollarValueTextBox.Text = clear;

                    KeywordTextBox.Text = clear;
                    EntryDateTextBox.Text = clear;
                    CheckOutTextBox.Text = clear;
                    CommentsTextBox.Text = clear;

                    FailLabel.Visible = true;
                    FailLabel.Text = "item not found"; //display item not found

                }
                else // if valid item is entered
                {
                    FailLabel.Visible = false;
                    //read values from sql query
                    while (dr.Read())
                    {
                        itemNumber = dr["itemNumber"].ToString();
                        name = dr["name"].ToString();
                        serialNumber = dr["serialNumber"].ToString();
                        dollarvalue = double.Parse(dr["dollarValue"].ToString());
                        category = dr["categoryname"].ToString();
                        keywords = dr["keywords"].ToString();
                        if (!DBNull.Value.Equals(dr["entryDate"]))
                            entryDate = DateTime.Parse(dr["entryDate"].ToString());
                        checkOutLength = Convert.ToInt32(dr["checkoutLength"].ToString());
                        comments = dr["comments"].ToString();

                        //checked for null values before accepting
                        if (!DBNull.Value.Equals(dr["damaged"]))
                            damaged = Convert.ToBoolean(dr["damaged"]);

                        if (!DBNull.Value.Equals(dr["lost"]))
                            lost = Convert.ToBoolean(dr["lost"]);
                        if (!DBNull.Value.Equals(dr["visible"]))
                            visable = Convert.ToBoolean(dr["visible"]);
                        if (!DBNull.Value.Equals(dr["sentToSurplus"]))
                            sentToSurplus = Convert.ToBoolean(dr["sentToSurplus"]);

                    } // end while



                    //display values
                    ItemNumTextBox.Text = itemNumber;
                    NameTextBox.Text = name;
                    SerialTextBox.Text = serialNumber;
                    DollarValueTextBox.Text = dollarvalue.ToString();

                    KeywordTextBox.Text = keywords;
                    EntryDateTextBox.Text = entryDate.ToShortDateString();
                    CheckOutTextBox.Text = checkOutLength.ToString();
                    CommentsTextBox.Text = comments;

                    //combine damged lost and surplus into a status of item
                    if (damaged == true)
                        status += "Damaged, ";
                    if (sentToSurplus == true)
                        status += "Sent To Surplus, ";
                    if (lost == true)
                        status += "Lost, ";


                } //end if item is entered
                con.Close(); //close connection  
            }
            string connectionString1 = ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString;

            using (SqlConnection con1 = new SqlConnection(connectionString1))
            {
                //get categories
                string com = "SELECT * FROM category ";
                SqlDataAdapter adpt = new SqlDataAdapter(com, con1);

                DataTable dt = new DataTable();

                adpt.Fill(dt);
                DropDownList1.DataSource = dt;

                DropDownList1.DataBind();
                //set categories in dropdown box
                DropDownList1.DataTextField = "categoryname";

                DropDownList1.DataValueField = "categoryID";
                DropDownList1.DataBind();
            } // end search button click
        }

        protected void SearchTextBox_TextChanged(object sender, EventArgs e)
        {
            //clear all text boxes
            ItemNumTextBox.Text = clear;
            NameTextBox.Text = clear;
            SerialTextBox.Text = clear;
            DollarValueTextBox.Text = clear;
           
            KeywordTextBox.Text = clear;
            EntryDateTextBox.Text = clear;
            CheckOutTextBox.Text = clear;
            CommentsTextBox.Text = clear;
    
        }

        protected void DropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            //check what dropdown is selected
             searchBy = DropDownList.SelectedItem.Text;
            if (searchBy == "Name")
            {
                formatLabel.Text = "Format: 'Item Name'";
            }
            else
            {
                formatLabel.Text = "Format: '1234567890'";

            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            FailLabel.Visible = false;
            string connectionString = ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connectionString))
            {





                SqlCommand cmd1 = new SqlCommand();

                if (DropDownList.SelectedItem.Text == "Name")
                {
                    cmd1.Parameters.AddWithValue("@name1", SearchTextBox.Text);
                    //update item by name
                    cmd1.CommandText = "Update [EquipmentItem] SET [itemNumber] =@item, [name] = @name, [serialNumber] = @serial, [dollarValue]= @value, [categoryID] = @category,  [keywords] = @keywords,  [checkoutLength] = @checkout, [comments] = @comments WHERE [name] =@name1 ";


                }
                else
                {
                    cmd1.Parameters.AddWithValue("@item1", SearchTextBox.Text);
                    //update item by item number
                    cmd1.CommandText = "Update [EquipmentItem] SET [itemNumber] =@item, [name] = @name, [serialNumber] = @serial, [dollarValue]= @value, [categoryID] = @category ,[keywords] = @keywords,  [checkoutLength] = @checkout, [comments] = @comments WHERE [itemNumber] =@item1 ";



                }
                cmd1.Connection = con;
                con.Open();
                //add parameters
                cmd1.Parameters.Add(new SqlParameter("@item", ItemNumTextBox.Text));
                cmd1.Parameters.Add(new SqlParameter("@name", NameTextBox.Text));
                cmd1.Parameters.Add(new SqlParameter("@serial", SerialTextBox.Text));
                cmd1.Parameters.Add(new SqlParameter("@value", DollarValueTextBox.Text));
                cmd1.Parameters.Add(new SqlParameter("@keywords", KeywordTextBox.Text));
                cmd1.Parameters.Add(new SqlParameter("@category", DropDownList1.SelectedValue));
                cmd1.Parameters.Add(new SqlParameter("@checkout", CheckOutTextBox.Text));
                cmd1.Parameters.Add(new SqlParameter("@comments", CommentsTextBox.Text));
                try
                {

                    cmd1.ExecuteNonQuery();
                }
                catch (SqlException)
                {
                    FailLabel.Visible = true;
                    FailLabel.Text = "Item could not be updated, Values may confilct with existing items" + "\n" + "Please be sure that the Item Number is unique";
                }
                con.Close();

            }










        }
    }
}