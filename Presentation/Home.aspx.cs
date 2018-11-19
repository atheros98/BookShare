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
        public int TotalPages;
        public int PageIndex = 1;
        public int categoryID = 0;
        public List<Book> Books;
        public List<Trading> Tradings;
        public List<User> Users = new List<User>();

        //public TradingService.Trading[] tradings;

        protected void Page_Load(object sender, EventArgs e)
        {
            // set title for page
            Page.Title = "Home page - BookShare";

            BookDAO bookDao = new BookDAO();
            UserDAO userDao = new UserDAO();



            // get page in hype link
            if (Request.QueryString["pageIndex"] != null)
            {
                int.TryParse(Request.QueryString["pageIndex"], out PageIndex);
            }

            if (Request.QueryString["categoryID"] != null)
            {
                int.TryParse(Request.QueryString["categoryID"], out categoryID);
            }

            if (categoryID == 0)
            {
                // get list of book at current page
                Books = bookDao.GetByPageId(PageIndex);
                // get total number of books
                TotalPages = bookDao.getPages("NoFilter", "");
            } else
            {
                Books = bookDao.getBooksByCategory(categoryID, PageIndex);
                TotalPages = bookDao.getPages("category", categoryID.ToString());
            }
            

            // get list of user who is the lastest upload available book
            foreach(Book book in Books)
            {
                User user = userDao.GetLatestUploadUser(book.Id);
                Users.Add(user);
            }

        }
    }
}