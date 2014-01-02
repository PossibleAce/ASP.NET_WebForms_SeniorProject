/** 
 * ------------------------------------------------------------
 * File name:  EquipmentItemsReport.aspx
 * Project Name: ATS
 * ------------------------------------------------------------
 * Author's name and email: Keith Wilt
 * Course-Selection: CSCI-3350
 * Creation Date: 4/15/13
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
namespace ATS.Reports
{
    public partial class EquipmentItemsReport : System.Web.UI.Page
    {
        string istrue = "true";
        string isfalse = "false";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)//only on first load
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
               
                if (searchBy == "Lost, Damaged, or Stolen")
                {
                    //search for any items lost damged or stolen
                    cmd2.CommandText = "SELECT * FROM EquipmentItem WHERE lost = @true or damaged = @true or stolen = @true";
                    cmd2.Parameters.AddWithValue("@true", istrue);

                }
                else if (searchBy == "Checked Out")
                {
                    //search for all items currently checked out
                    cmd2.CommandText = "SELECT   transactionID,eNumber,CheckOut.itemNumber,name,serialNumber, personnelCheckedIn,personnelCheckedOut,checkOutDate,dateReturned,duedate dollarValue, keywords,checkOutLength,comments, damaged, stolen FROM CheckOut INNER JOIN EquipmentItem on CheckOut.itemNumber = EquipmentItem.itemNumber WHERE checkedOut = @true and dateReturned IS NULL";
                    cmd2.Parameters.AddWithValue("@true", istrue);

                }
                else if (searchBy == "Equipment Item List")
                {
                    //search for all items
                    cmd2.CommandText = "SELECT * FROM EquipmentItem";


                }
                cmd2.Connection = con;
                try
                {
                    SqlDataAdapter da = new SqlDataAdapter(cmd2);
                    DataSet ds = new DataSet();
                    da.Fill(ds);
                    //connect data to gridview
                    GridView1.DataSource = ds;
                    GridView1.DataBind();
                    if (!(ds.Tables[0].Rows.Count > 0))
                    {
                        //if no data display error
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
            //allow for sorting of gridview
            bindGridView(e.SortExpression, sortOrder);

        }
       
        public void bindGridView(string sortExp, string sortDir)
        {
           
            string searchBy = DropDownList1.SelectedItem.Text;
           
            string connectionString = ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                SqlCommand cmd2 = new SqlCommand();
                if (searchBy == "Lost, Damaged, or Stolen")
                {
                    cmd2.CommandText = "SELECT * FROM EquipmentItem WHERE lost = @true or damaged = @true or stolen = @true";
                    cmd2.Parameters.AddWithValue("@true", istrue);

                }
                else if (searchBy == "Checked Out")
                {

                    cmd2.CommandText = "SELECT   transactionID,eNumber,CheckOut.itemNumber,name,serialNumber, personnelCheckedIn,personnelCheckedOut,checkOutDate,dateReturned,duedate dollarValue, keywords,checkOutLength,comments, damaged, stolen FROM CheckOut INNER JOIN EquipmentItem on CheckOut.itemNumber = EquipmentItem.itemNumber WHERE checkedOut = @true and dateReturned IS NULL";
                    cmd2.Parameters.AddWithValue("@true", istrue);

                }
                else if (searchBy == "Equipment Item List")
                {

                    cmd2.CommandText = "SELECT * FROM EquipmentItem";


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
            //get sort order and update after sorting
            get
            {
                if (ViewState["sortOrder"].ToString() == "desc")
                {
                    ViewState["sortOrder"] = "asc";
                }
                else
                {
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