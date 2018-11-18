using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Presentation
{
    public partial class Borrowing : System.Web.UI.Page
    {
        public List<string> listQuery = new List<string>();
        public int page;
        public string filter;

        protected void Page_Load(object sender, EventArgs e)
        {
            // set title for page
            Page.Title = "Borrowing - BookShare";

            if (!IsPostBack)
            {

                listQuery.Add("Pending");
                listQuery.Add("Borrowing");
                listQuery.Add("Completed");

                filter = Request.QueryString["filter"] == null ? "Pending" : Request.QueryString["filter"];
                page = Request.QueryString["page"] == null ? 1 : int.Parse(Request.QueryString["page"]);

            }
        }
    }
}