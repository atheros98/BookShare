using DAL;
using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Presentation
{
    public partial class BookDetail : System.Web.UI.Page
    {
        public User user;
        public int idBook = 2;
        public Book book;
        public List<string> covers;
        public List<Trading> tradings;
        public DateTime currentDate = DateTime.Today;
        public List<BookReview> reviews;
        public string rootPath;

        protected void Page_Load(object sender, EventArgs e)
        {
            // set title for page
            Page.Title = "Book Details - BookShare";

            if (Request.QueryString["id"] == null || Session["currentUser"] == null)
            {
                //Server.Transfer("ErrorPage.aspx");
            }
            else
            {
                
            }
            user = (User)Session["currentUser"];
            BookDAO bookDao = new BookDAO();
            book = bookDao.GetById(idBook);
        }

        public void updateReview(int top)
        {
            
        }

        protected void selectTop_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }

        protected void sendReview_Click(object sender, EventArgs e)
        {
            
        }
    }
}