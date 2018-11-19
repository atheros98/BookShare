using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Model;
using DAL;

namespace Presentation.admin
{
    public partial class ManageBook : System.Web.UI.Page
    {
        public List<Book> AcceptedList;
        public List<User> Creators = new List<User>();
        public List<Category> Categories = new List<Category>();

        public int PageId = 0;
        public int TotalPages = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            // Update status of book if this is action from a form
            string strBookId = Request.Params["bookId"];
            if (strBookId != null)
            {
                updateBookStatus(Book.STATUS_DELETED);
            }

           
            // get pageId param on query string
            string strPageId = Request.QueryString["pageId"];
            if(strPageId == null)
            {
                strPageId = "1";
            }

            // parse value of query string pageId to int
            try
            {
                PageId = int.Parse(strPageId);
            }catch
            {
                Response.Redirect("ErrorPage.aspx");
            }

            //get pending book and set it to AcceptedList
            setPendingBooks();


        }

        void setPendingBooks()
        {
            BookDAO bookDao = new BookDAO(3);
            UserDAO userDao = new UserDAO();
            CategoryDAO cateDao = new CategoryDAO();

            AcceptedList = bookDao.GetByPageId(PageId);
            // get total pages
            TotalPages = bookDao.getPages("NoFilter","");

            foreach (Book book in AcceptedList)
            {
                Creators.Add(userDao.GetById(book.CreatorID));
                Categories.Add(cateDao.GetById(book.CategoryID));

            }

            System.Diagnostics.Debug.WriteLine("\n NUMBER OF BOOKS: " + AcceptedList.Count);
        }


        void updateBookStatus(int status) 
        {
            try {
                int id = int.Parse(Request.Params["bookId"]);
                BookDAO bookDao = new BookDAO();
                bool ok = bookDao.UpdateStatus(id, status);
            } catch
            {
                ScriptManager.RegisterClientScriptBlock(this, GetType(),
              "alertMessage", @"alert('An error has occur')", true);
            }
            

        }

    }
}