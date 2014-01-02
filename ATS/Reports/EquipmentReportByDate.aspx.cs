/** 
 * ------------------------------------------------------------
 * File name: EquipmentReportByDate.aspx
 * Project Name: ATS
 * ------------------------------------------------------------
 * Author's name and email: Keith Wilt
 * Course-Selection: CSCI-3350
 * Creation Date: 4/16/13
 * Last modified: Keith Wilt, 5/1/13
 * -------------------------------------------------------------
 */
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
namespace ATS.Reports
{
    public partial class EquipmentReportByDate : System.Web.UI.Page
    {
        string date1, date2;
        string istrue = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)//on first load only
            {
                ViewState["sortOrder"] = "";
            }
        }
        protected void GridView1_Sorting(object sender, GridViewSortEventArgs e)
        {

            bindGridView(e.SortExpression, sortOrder);

        }

        public void bindGridView(string sortExp, string sortDir)
        {
            // string variable to store the connection string  
            // defined in ConnectionStrings section of web.config file.  
            string searchBy = DropDownList1.SelectedItem.Text;
            //   DataTable taskTable = new DataTable("TaskList");
            string connectionString = ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                SqlCommand cmd2 = new SqlCommand();
                if (searchBy == "Items")
                {
                    cmd2.CommandText = "SELECT  CheckOut.itemNumber,name, COUNT(DISTINCT checkOutDate) AS checkedOut ,categoryname,keywords,damaged,lost,stolen,visible,sentToSurplus FROM  CheckOut INNER JOIN EquipmentItem on EquipmentItem.itemNumber = CheckOut.itemNumber  INNER JOIN category on EquipmentItem.categoryID = category.categoryID WHERE checkOutDate < @date2 and checkOutDate > @date1 GROUP BY CheckOut.itemNumber, name,categoryname,keywords,damaged,lost,stolen,visible,sentToSurplus";
                    cmd2.Parameters.AddWithValue("@date1", date1);
                    cmd2.Parameters.AddWithValue("@date2", date2);
                }
                else if (searchBy == "Faculty")
                {

                    cmd2.CommandText = "SELECT  FirstName AS FirstName,LastName AS LastName,CheckOut.eNumber AS ENumber,CheckOut.itemNumber AS ItemNumber, COUNT( itemNumber) AS CheckedOut FROM  CheckOut  INNER JOIN Faculty on Faculty.eNumber = CheckOut.eNumber  WHERE checkOutDate < @date2 and checkOutDate > @date1 GROUP BY FirstName,LastName,CheckOut.itemNumber,CheckOut.eNumber";
                    cmd2.Parameters.AddWithValue("@date1", date1);
                    cmd2.Parameters.AddWithValue("@date2", date2);

                }
                else if (searchBy == "Check Outs")
                {
                    cmd2.CommandText = "SELECT * FROM CheckOut WHERE checkOutDate < @date2 and checkOutDate > @date1";
                    cmd2.Parameters.AddWithValue("@date1", date1);
                    cmd2.Parameters.AddWithValue("@date2", date2);
                }
                else if (searchBy == "Category")
                {
                    cmd2.CommandText = "SELECT  DISTINCT categoryname, COUNT(checkOutDate) AS checkedOut  FROM  CheckOut INNER JOIN EquipmentItem on EquipmentItem.itemNumber = CheckOut.itemNumber  INNER JOIN category on EquipmentItem.categoryID = category.categoryID  WHERE checkOutDate < @date2 and checkOutDate > @date1 GROUP BY categoryname";
                    cmd2.Parameters.AddWithValue("@date1", date1);
                    cmd2.Parameters.AddWithValue("@date2", date2);
                }
               
                cmd2.Connection = con;
                SqlDataAdapter da = new SqlDataAdapter(cmd2);
                DataSet ds = new DataSet();
                da.Fill(ds);
                DataView myDataView = new DataView();
                if (!(ds.Tables[0].Rows.Count > 0))
                {
                    FailLabel.Visible = true;
                    FailLabel.Text = "No Reports found";
                }
                myDataView = ds.Tables[0].DefaultView;

                if (sortExp != string.Empty)
                {
                    myDataView.Sort = string.Format("{0} {1}", sortExp, sortDir);
                }

                GridView1.DataSource = myDataView;
                GridView1.DataBind();

                // if condition that can be used to check the sql connection  
                // if it is open then close it.  

                con.Close();

            }
        }
        public string sortOrder
        {
            get
            {
                if (ViewState["sortOrder"].ToString() == "desc")
                {

                    ViewState["sortOrder"] = "asc";
                }
                else
                {
                    string trys = ViewState["sortOrder"].ToString();
                    ViewState["sortOrder"] = "desc";
                }

                return ViewState["sortOrder"].ToString();
            }
            set
            {
                ViewState["sortOrder"] = value;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            GridView1.DataSource = null;
            GridView1.DataBind();
            FailLabel.Visible = false;
            date1 = Date1TextBox.Text;
            date2 = Date2TextBox.Text;
            string connectionString = ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                SqlCommand cmd2 = new SqlCommand();
                string searchBy = DropDownList1.SelectedItem.Text;
                if (searchBy == "Items")
                {
                    cmd2.CommandText = "SELECT  CheckOut.itemNumber,name, COUNT(DISTINCT checkOutDate) AS checkedOut ,categoryname,keywords,damaged,lost,stolen,visible,sentToSurplus FROM  CheckOut INNER JOIN EquipmentItem on EquipmentItem.itemNumber = CheckOut.itemNumber  INNER JOIN category on EquipmentItem.categoryID = category.categoryID WHERE checkOutDate < @date2 and checkOutDate > @date1 GROUP BY CheckOut.itemNumber, name,categoryname,keywords,damaged,lost,stolen,visible,sentToSurplus";
                    cmd2.Parameters.AddWithValue("@date1", date1);
                    cmd2.Parameters.AddWithValue("@date2", date2);
                }
                else if (searchBy == "Faculty")
                {

                    cmd2.CommandText = "SELECT  FirstName AS FirstName,LastName AS LastName,CheckOut.eNumber AS ENumber,CheckOut.itemNumber AS ItemNumber, COUNT( itemNumber) AS CheckedOut FROM  CheckOut  INNER JOIN Faculty on Faculty.eNumber = CheckOut.eNumber  WHERE checkOutDate < @date2 and checkOutDate > @date1 GROUP BY FirstName,LastName,CheckOut.itemNumber,CheckOut.eNumber";
                    cmd2.Parameters.AddWithValue("@date1", date1);
                    cmd2.Parameters.AddWithValue("@date2", date2);

                }
                else if (searchBy == "Check Outs")
                {
                    cmd2.CommandText = "SELECT * FROM CheckOut WHERE checkOutDate < @date2 and checkOutDate > @date1";
                    cmd2.Parameters.AddWithValue("@date1", date1);
                    cmd2.Parameters.AddWithValue("@date2", date2);
                }
                else if (searchBy == "Category")
                {
                    cmd2.CommandText = "SELECT  DISTINCT categoryname, COUNT(checkOutDate) AS checkedOut  FROM  CheckOut INNER JOIN EquipmentItem on EquipmentItem.itemNumber = CheckOut.itemNumber  INNER JOIN category on EquipmentItem.categoryID = category.categoryID  WHERE checkOutDate < @date2 and checkOutDate > @date1 GROUP BY categoryname";
                    cmd2.Parameters.AddWithValue("@date1", date1);
                    cmd2.Parameters.AddWithValue("@date2", date2);
                }
               
                cmd2.Connection = con;
                try
                {
                    SqlDataAdapter da = new SqlDataAdapter(cmd2);
                    DataSet ds = new DataSet();
                    da.Fill(ds);
                    GridView1.DataSource = ds;
                    GridView1.DataBind();
                    if (!(ds.Tables[0].Rows.Count > 0))
                    {
                        FailLabel.Visible = true;
                        FailLabel.Text = "No Reports found";
                    }
                }
                catch (SqlException)
                {
                    FailLabel.Visible = true;
                    FailLabel.Text = "No Reports found";
                }

                con.Close();
            }
        }
    }
}