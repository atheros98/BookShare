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
        public List<User> lenders;
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
                user = (User)Session["currentUser"];
                //int.TryParse(Request.QueryString["id"], out idBook); // get idbook
                //BookDAO bookDAO = new BookDAO();
                ////Get book by id
                //book = bookDAO.GetById(idBook);
                
                ////Get all lenders for this book
                //TradingDAO tradingDAO = new TradingDAO();
                //List<User> lenders = tradingDAO.getAllLendersByBookIDAndPaging(idBook, 1);

                //System.Diagnostics.Debug.WriteLine("--------------"+book.Title + "|" + book.ISBN1);
            }
            BookDAO bookDAO = new BookDAO();
            //Get book by id
            book = bookDAO.GetById(idBook);

            //Get all lenders for this book
            TradingDAO tradingDAO = new TradingDAO();
            lenders = tradingDAO.getAllLendersByBookIDAndPaging(idBook, 0);
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