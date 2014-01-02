/** 
 * ------------------------------------------------------------
 * File name: Default.aspx
 * Project Name: ATS
 * ------------------------------------------------------------
 * Author's name and email: Nathaniel Davis (davisn@goldmail.etsu.edu)
 * Course-Selection: CSCI-3350
 * Creation Date: 02/01/2013
 * Last modified: Nathaniel Davis, 04/30/2013, davisn@goldmail.etsu.edu
 * -------------------------------------------------------------
 */
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace ATS
{
    public partial class _Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            
        }

        protected void Button1_Click1(object sender, ImageClickEventArgs e)
        {

            this.MultiView1.ActiveViewIndex = 0;
            XDocument feed = XDocument.Load("http://www.etsu.edu/calendar/RSSSyndicator.aspx?type=N&number=5&category=26-31&range=today&ics=Y&rssid=40");
            var atsFeed = from feeds in feed.Descendants("item") select new { title = (string)feeds.Element("title"), description = (string)feeds.Element("description"), pubDate = (DateTime)feeds.Element("pubDate"), category = (string)feeds.Element("category") };

            GridViewATSFeed.DataSource = atsFeed;
            GridViewATSFeed.DataBind();
        }

        protected void Button3_Click1(object sender, ImageClickEventArgs e)
        {
            this.MultiView1.ActiveViewIndex = 1;
            XDocument feedETSU = XDocument.Load("http://www.etsu.edu/calendar/RSSSyndicator.aspx?type=N&range=today&rssid=3");

            var etsuFeed = from feeds2 in feedETSU.Descendants("item") select new { title = (string)feeds2.Element("title"), description = (string)feeds2.Element("description"), pubDate = (DateTime)feeds2.Element("pubDate"), category = (string)feeds2.Element("category") };

            GridViewETSUFeed.DataSource = etsuFeed;
            GridViewETSUFeed.DataBind();
        }
    }
}
