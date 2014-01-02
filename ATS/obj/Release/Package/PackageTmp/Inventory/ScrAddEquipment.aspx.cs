/** 
 * ------------------------------------------------------------
 * File name:  ScrAddEquipment.aspx
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
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Configuration;
namespace ATS_Admin
{
    public partial class ScrAddEquipment : System.Web.UI.Page
    { 
        string name,
            itemNumber,
            serialNumber,
            category,
            keywords,
            comments,
            strdollar,
            strcheckout;
        Boolean convert;
        Double dollarvalue = 0;
       DateTime entryDate =  DateTime.Now;
   
        int checkOutLength = 0;
        Boolean lost = false, 
            damaged = false, 
            stolen = false,
            sentToSurplus = false,
            visible = true;
        string clear = "";
        Boolean test = false;
       
        protected void Page_Load(object sender, EventArgs e)
        {
             string connectionString = ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString;
             using (SqlConnection con = new SqlConnection(connectionString))
             {
                 con.Open();
                 string com = "SELECT * FROM category ";
                 SqlDataAdapter adpt = new SqlDataAdapter(com, con);

                 DataTable dt = new DataTable();

                 adpt.Fill(dt);
                 DropDownList1.DataSource = dt;

                 DropDownList1.DataBind();

                 DropDownList1.DataTextField = "categoryname";

                 DropDownList1.DataValueField = "categoryID";
                 DropDownList1.DataBind();
                 Button1.Attributes.Add("onclick", "javascript:return confirm('Are you sure you want to add this item?');");
             }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
            

            FailLabel.Visible = false;
            itemNumber = EtsuNumTextBox.Text;
            name = NameTextBox.Text;
            serialNumber = SerialTextBox.Text;
            category = DropDownList1.SelectedValue;
            keywords = KeywordTextBox.Text;
            comments = CommentsTextBox.Text;
            strdollar = DollarValueTextBox.Text;
            strcheckout = CheckOutTextBox.Text;


            if (strdollar == null || strdollar == "")
            {
                FailLabel.Visible = true;
                test = true;
                FailLabel.Text = "Error: No Dollar Value " + '\n' + "Please fill all fields unless marked as optional.";

            }
            else
            {
                convert = Double.TryParse(strdollar, out dollarvalue);
                if (convert == true)
                {
                    dollarvalue = Double.Parse(strdollar);
                }
            }

            if (strcheckout == null || strcheckout == "")
            {
                FailLabel.Visible = true;
                test = true;
                FailLabel.Text = "Error: No Checkout Length " + '\n' + "Please fill all fields unless marked as optional.";
            }
            else
            {
                convert = Int32.TryParse(strcheckout, out checkOutLength);
                if (convert == true)
                {
                    checkOutLength = Int32.Parse(strcheckout);
                }
            }


            entryDate = entryDate.ToLocalTime();


           
                SqlCommand cmd1 = new SqlCommand();
                //add item as parameter
                cmd1.Parameters.AddWithValue("@item", itemNumber);

                cmd1.CommandText = "SELECT * FROM EquipmentItem WHERE [itemNumber] = @item";

                //run query
                cmd1.Connection = con;
                SqlDataReader dr;
                dr = cmd1.ExecuteReader();
                if (!dr.HasRows && test == false)
                {
                    dr.Close();
                    EtsuNumTextBox.Text = clear;
                    NameTextBox.Text = clear;
                    SerialTextBox.Text = clear;
                    DollarValueTextBox.Text = clear;
                  
                    KeywordTextBox.Text = clear;
                    CommentsTextBox.Text = clear;
                    CheckOutTextBox.Text = clear;
                    string sql = "INSERT INTO EquipmentItem(itemNumber,name,serialNumber,dollarValue,categoryID,keywords,entryDate,checkOutLength,comments,lost,damaged,visible,sentToSurplus) VALUES ('" +
                        itemNumber + "', '" + name + "', '" + serialNumber + "', '" + dollarvalue + "', '" +
                        category + "', '" + keywords + "','" +
                        entryDate + "', '" + checkOutLength + "', '" + comments + "',  '" + lost + "', '" + damaged + "', '" + visible + "', '" + sentToSurplus + "')";
                        dr.Close();
                    SqlCommand cmd = new SqlCommand(sql, con);

                    StringBuilder sb = new StringBuilder(string.Empty);


                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = sql;
                    cmd.Connection = con;
                    cmd.ExecuteNonQuery();
                    con.Close();

                }
                else
                {
                 FailLabel.Visible = true;
                    FailLabel.Text = "This Item already exists and can not be added";
                    con.Close();
                }


            }
        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            EtsuNumTextBox.Text = clear;
            NameTextBox.Text = clear;
            SerialTextBox.Text = clear;
            DollarValueTextBox.Text = clear;
           
            KeywordTextBox.Text = clear;
            CommentsTextBox.Text = clear;
            CheckOutTextBox.Text = clear;
        }


   
    }
}