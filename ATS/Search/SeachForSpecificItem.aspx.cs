
/** 
 * ------------------------------------------------------------
 * File name:  SearchForSpecificItem.aspx
 * Project Name: ATS
 * ------------------------------------------------------------
 * Author's name and email: Keith Wilt
 * Course-Selection: CSCI-3350
 * Creation Date: 3/1/13
 * Last modified: Keith Wilt, 3/19/13
 * -------------------------------------------------------------
 */
using System;
using System.Data.SqlClient;
using System.Configuration;



namespace ATS
{
    public partial class SeachForSpecificItem : System.Web.UI.Page
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
       
        
        protected void Page_Load(object sender, EventArgs e)
        {
            
           
            
        }

        protected void SearchButton_Click(object sender, EventArgs e)
        {


            //connect to the DB
            string connectionString = ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();

                //Create sql query
                SqlCommand cmd = new SqlCommand();
                //add item as parameter
                string searchBy = DropDownList.SelectedItem.Text;
                if (searchBy == "Item Number")
                {
                    string item = SearchTextBox.Text; //get item to seach for
                    cmd.Parameters.AddWithValue("@item", SearchTextBox.Text);

                    cmd.CommandText = "SELECT * FROM EquipmentItem INNER JOIN category on EquipmentItem.categoryID = category.categoryID WHERE [itemNumber] = @item";
                }
                else if (searchBy == "Name")
                {

                    string item = SearchTextBox.Text; //get item to seach for
                    cmd.Parameters.AddWithValue("@item", SearchTextBox.Text);

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
                    CategoryTextBox.Text = clear;
                    KeywordTextBox.Text = clear;
                    EntryDateTextBox.Text = clear;
                    CheckOutTextBox.Text = clear;
                    CommentsTextBox.Text = clear;
                    StatusTextBox.Text = clear;
                    VisableTextBox.Text = clear;
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
                    CategoryTextBox.Text = category;
                    KeywordTextBox.Text = keywords;
                    EntryDateTextBox.Text = entryDate.ToShortDateString();
                    CheckOutTextBox.Text = checkOutLength.ToString();
                    CommentsTextBox.Text = comments;

                    //combine damged lost and surplus into a status of item
                    if (damaged == true)
                        status += "Damaged, ";
                    else if (sentToSurplus == true)
                        status += "Sent To Surplus, ";
                    else if (lost == true)
                        status += "Lost, ";
                    else
                        status = "Good";

                    StatusTextBox.Text = status;
                    VisableTextBox.Text = visable.ToString();
                } //end if item is entered
                con.Close(); //close connection
            } // end search button click
        }
        protected void ClearButton_Click(object sender, EventArgs e)
        {
            //clear all text boxes
            SearchTextBox.Text = clear;
            ItemNumTextBox.Text= clear;
            NameTextBox.Text = clear;
            SerialTextBox.Text = clear;
            DollarValueTextBox.Text = clear;
            CategoryTextBox.Text = clear;
            KeywordTextBox.Text = clear;
            EntryDateTextBox.Text = clear;
            CheckOutTextBox.Text = clear;
            CommentsTextBox.Text = clear;
            StatusTextBox.Text = clear;
            VisableTextBox.Text = clear;
        }

        protected void SearchTextBox_TextChanged(object sender, EventArgs e)
        {
            //clear all text boxes
            ItemNumTextBox.Text = clear;
            NameTextBox.Text = clear;
            SerialTextBox.Text = clear;
            DollarValueTextBox.Text = clear;
            CategoryTextBox.Text = clear;
            KeywordTextBox.Text = clear;
            EntryDateTextBox.Text = clear;
            CheckOutTextBox.Text = clear;
            CommentsTextBox.Text = clear;
            StatusTextBox.Text = clear;
            VisableTextBox.Text = clear;
            FailLabel.Visible = false;
        }

        protected void DropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            string searchBy =DropDownList.SelectedItem.Text;
            if (searchBy == "Name")
            {
                formatLabel.Text = "Format: 'Item Name'";
            }
            else
            {
                formatLabel.Text = "Format: '1234567890'";

            }
        }

      
    }
}