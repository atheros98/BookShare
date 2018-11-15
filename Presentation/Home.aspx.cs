using System;
using System.Collections.Generic;
using System.Linq;
using System.Data.SqlClient;
using System.Data;
using Model;
using DAL;

namespace Presentation
{
    public partial class Home : System.Web.UI.Page
    {
        public int BookNum;
        public int TotalPages;
        public int PageIndex = 1;
        public List<Book> Books;

        //public TradingService.Trading[] tradings;

        protected void Page_Load(object sender, EventArgs e)
        {
            // set title for page
            Page.Title = "Home page - BookShare";

            BookDAO bookDao = new BookDAO();

            // get total number of books
            BookNum = bookDao.GetTotalAcceptedBooks();

            // get page in hype link
            if (Request.QueryString["page"] != null)
            {
                int.TryParse(Request.QueryString["page"], out PageIndex);
            }

            // get list of book at current page
            Books = bookDao.GetByPageId(PageIndex);

            // total page
            

            //rootPath = Request.ApplicationPath;

        }
    }
}