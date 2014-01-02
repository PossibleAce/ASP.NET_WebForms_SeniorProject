/** 
 * ------------------------------------------------------------
 * File name:  StatisticalReport.aspx
 * Project Name: ATS
 * ------------------------------------------------------------
 * Author's name and email: Keith Wilt
 * Course-Selection: CSCI-3350
 * Creation Date: 4/17/13
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
    public partial class StatisticalReport : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)//on first load only
            {
                ViewState["sortOrder"] = "";
            }
            GridView1.DataSource = null;
            GridView1.DataBind();
            FailLabel.Visible = false;

            string connectionString = ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                SqlCommand cmd2 = new SqlCommand();
                string searchBy = DropDownList1.SelectedItem.Text;
                if (searchBy == "Items")
                {
                    cmd2.CommandText = "SELECT  CheckOut.itemNumber,name, COUNT(DISTINCT checkOutDate) AS checkedOut ,categoryname,keywords,damaged,lost,stolen,visible,sentToSurplus FROM  CheckOut INNER JOIN EquipmentItem on EquipmentItem.itemNumber = CheckOut.itemNumber  INNER JOIN category on EquipmentItem.categoryID = category.categoryID GROUP BY CheckOut.itemNumber, name,categoryname,keywords,damaged,lost,stolen,visible,sentToSurplus";


                }
                else if (searchBy == "Faculty")
                {

                    cmd2.CommandText = "SELECT  FirstName AS FirstName,LastName AS LastName,CheckOut.eNumber AS ENumber,CheckOut.itemNumber AS ItemNumber, COUNT( itemNumber) AS CheckedOut FROM  CheckOut  INNER JOIN Faculty on Faculty.eNumber = CheckOut.eNumber GROUP BY FirstName,LastName,CheckOut.itemNumber,CheckOut.eNumber";


                }
                else if (searchBy == "Check Outs")
                {
                    cmd2.CommandText = "SELECT * FROM CheckOut";
                }
                else if (searchBy == "Category")
                {
                    cmd2.CommandText = "SELECT  categoryname, COUNT(DISTINCT checkOutDate) AS checkedOut  FROM  CheckOut INNER JOIN EquipmentItem on EquipmentItem.itemNumber = CheckOut.itemNumber  INNER JOIN category on EquipmentItem.categoryID = category.categoryID GROUP BY categoryname";
                }
                cmd2.Connection = con;
                try
                {
                    SqlDataAdapter da = new SqlDataAdapter(cmd2);
                    DataSet ds = new DataSet();
                    da.Fill(ds);
                    GridView1.DataSource = ds;
                    GridView1.DataBind();
                    //bind data to gridview
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
                    cmd2.CommandText = "SELECT  CheckOut.itemNumber,name, COUNT(DISTINCT checkOutDate) AS checkedOut ,categoryname,keywords,damaged,lost,stolen,visible,sentToSurplus FROM  CheckOut INNER JOIN EquipmentItem on EquipmentItem.itemNumber = CheckOut.itemNumber  INNER JOIN category on EquipmentItem.categoryID = category.categoryID GROUP BY CheckOut.itemNumber, name,categoryname,keywords,damaged,lost,stolen,visible,sentToSurplus";


                }
                else if (searchBy == "Faculty")
                {

                    cmd2.CommandText = "SELECT  FirstName AS FirstName,LastName AS LastName,CheckOut.eNumber AS ENumber,CheckOut.itemNumber AS ItemNumber, COUNT( itemNumber) AS TimesCheckedOut FROM  CheckOut  INNER JOIN Faculty on Faculty.eNumber = CheckOut.eNumber GROUP BY FirstName,LastName,CheckOut.itemNumber,CheckOut.eNumber";



                }
                else if (searchBy == "Check Outs")
                {
                    cmd2.CommandText = "SELECT * FROM CheckOut";
                }
                else if (searchBy == "Category")
                {
                    cmd2.CommandText = "SELECT  categoryname, COUNT( checkOutDate) AS checkedOut  FROM  CheckOut INNER JOIN EquipmentItem on EquipmentItem.itemNumber = CheckOut.itemNumber  INNER JOIN category on EquipmentItem.categoryID = category.categoryID GROUP BY categoryname";
                }
                cmd2.Connection = con;
                SqlDataAdapter da = new SqlDataAdapter(cmd2);
                DataSet ds = new DataSet();
                da.Fill(ds);
                DataView myDataView = new DataView();
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
            //get the sortorder and update after sorting
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
    }
}