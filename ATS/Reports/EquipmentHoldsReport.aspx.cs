/** 
 * ------------------------------------------------------------
 * File name: EquipmentHoldsReport.aspx
 * Project Name: ATS
 * ------------------------------------------------------------
 * Author's name and email: Keith Wilt
 * Course-Selection: CSCI-3350
 * Creation Date: 4/22/13
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
    public partial class EquipmentHoldsReport : System.Web.UI.Page
    {
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
                if (searchBy == "Holds")
                {
                    //search holds approved
                    cmd2.CommandText = "SELECT * FROM Request WHERE RequestType = @hold AND Done = @true";
                    cmd2.Parameters.AddWithValue("@hold", "Hold");
                    cmd2.Parameters.AddWithValue("@true", true);

                }
                else if (searchBy == "Reserve")
                {
                    //search reserves approved
                    cmd2.CommandText = "SELECT * FROM Request WHERE RequestType = @reserve AND Done = @true";
                    cmd2.Parameters.AddWithValue("@reserve", "Reserve");
                    cmd2.Parameters.AddWithValue("@true", true);

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
        protected void GridView1_Sorting(object sender, GridViewSortEventArgs e)
        {
            //set grid view to sort
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
            if (searchBy == "Holds")
            {
                //search holds approved
                cmd2.CommandText = "SELECT * FROM Request WHERE RequestType = @hold AND Done = @true";
                cmd2.Parameters.AddWithValue("@hold", "Hold");
                cmd2.Parameters.AddWithValue("@true", true);

            }
            else if (searchBy == "Reserve")
            {
                //search reserves approved
                cmd2.CommandText = "SELECT * FROM Request WHERE RequestType = @reserve AND Done = @true";
                cmd2.Parameters.AddWithValue("@reserve", "Reserve");
                cmd2.Parameters.AddWithValue("@true", true);

            }
            cmd2.Connection = con;
            //connect data to gridview
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
            //check sort order and update after sorting
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