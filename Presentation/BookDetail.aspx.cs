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
        public int idBook;
        public Book book;
        public List<string> covers;
        public List<User> lenders;
        public List<Trading> tradings;
        public List<TradedBookImage> tradedImages;
        public DateTime currentDate = DateTime.Today;
        public List<BookReview> reviews;
        public string rootPath;

        protected void Page_Load(object sender, EventArgs e)
        {
            // set title for page
            Page.Title = "Book Details - BookShare";

            if (Request.QueryString["id"] == null || Session["currentUser"] == null)
            {
                Server.Transfer("ErrorPage.aspx");
            }
            else
            {
                user = (User)Session["currentUser"];
                idBook = int.Parse(Request.QueryString["id"]);
                BookDAO bookDAO = new BookDAO();
                //Get book by id
                book = bookDAO.GetById(idBook);

                //Get all lenders for this book
                TradingDAO tradingDAO = new TradingDAO();
                tradings = tradingDAO.getAllTradingOfOneBookPaging(idBook, 1);

                //Get all lenders according to tradings
                lenders = new List<User>();
                UserDAO userDAO = new UserDAO();
                foreach (Trading t in tradings)
                {
                    User u = userDAO.GetById(t.LenderID);
                    lenders.Add(u);
                }

                //Get all traded images
                tradedImages = new List<TradedBookImage>();

            }
            
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