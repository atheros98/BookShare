using System;
using System.Collections.Generic;
using System.Linq;
using System.Data.SqlClient;
using System.Data;
using Model;
using DAL;

namespace View
{
    public partial class Home : System.Web.UI.Page
    {
        public int pageNum = 99;
        public int page = 1;
        public List<Book> books;
        public string rootPath;
        //public TradingService.Trading[] tradings;

        protected void Page_Load(object sender, EventArgs e)
        {
            // set title for page
            Page.Title = "Home page - BookShare";

            BookDAO bookDao = new BookDAO();

            // get page in hype link
            if (Request.QueryString["page"] != null)
            {
                int.TryParse(Request.QueryString["page"], out page);
            }

            

            rootPath = Request.ApplicationPath;

        }
    }
}