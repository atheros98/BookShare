using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL;
using Model;

namespace Presentation
{
    public partial class Search : System.Web.UI.Page
    {
        public List<string> listQuery = new List<string>();
        public List<Book> books;
        public int totalPage;
        public int page;
        public string filter;

        protected void Page_Load(object sender, EventArgs e)
        {
            // set title for page
            Page.Title = "Search result - BookShare";

            if (!IsPostBack)
            {
                // check query search is null or not thing then redirect to home page
                if (Request.QueryString["query"] == null || Request.QueryString["query"].Trim() == "") Server.Transfer("Home.aspx");

                listQuery.Add("All");
                listQuery.Add("Title");
                listQuery.Add("Author");
                listQuery.Add("ISBN");

                string query = Request.QueryString["query"];
                filter = Request.QueryString["filter"] == null ? "All" : Request.QueryString["filter"];
                page = Request.QueryString["page"] == null ? 1 : int.Parse(Request.QueryString["page"]);

                BookDAO bookDAO = new BookDAO();
                books = bookDAO.searchBook(query, filter, page).ToList();
                totalPage = bookDAO.getPages(filter, query);
                //
            }

        }
    }
}