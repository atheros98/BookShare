using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Model;
using DAL;

namespace Presentation
{
    public partial class Borrowing : System.Web.UI.Page
    {
        public List<string> listQuery = new List<string>();
        public int page;
        public string filter;
        public List<Trading> tradings = new List<Trading>();
        public List<User> users = new List<User>();
        public List<Book> books = new List<Book>();
        public int totalPages = -1;
        public int lenderID = -1;

        protected void Page_Load(object sender, EventArgs e)
        {
            // set title for page
            Page.Title = "Borrowing - BookShare";
            User user = (User)Session["currentUser"];


            listQuery.Add("Pending");
            listQuery.Add("Borrowing");
            listQuery.Add("Completed");

            filter = Request.QueryString["filter"] == null ? "Pending" : Request.QueryString["filter"];
            page = Request.QueryString["page"] == null ? 1 : int.Parse(Request.QueryString["page"]);
            int id = Request.QueryString["id"] == null ? -1 : int.Parse(Request.QueryString["id"]);

            int point = Request.QueryString["point"] == null ? -1 : int.Parse(Request.QueryString["point"]);


            FillData(filter, user.Id);
            if (id != -1)
            {
                lenderID = users[id].Id;
                myModal.Visible = true;
                info.InnerHtml = "Trading no: " + (id + 1) + "<br/>Lender: " + users[id].FullName + "<br/>";
                trading.InnerText = tradings[id].Id + "";
            }

            if (point != -1)
            {
                int tradingID = int.Parse(Request.QueryString["trading"]);
                TradingDAO tradingDAO = new TradingDAO();
                tradingDAO.UpdateLenderRatePoint(tradingID, point);
                Response.Redirect("Borrowing.aspx?filter=Completed");
            }

        }

        private void FillData(string filter, int userID)
        {
            TradingDAO tradingDAO = new TradingDAO();
            BookDAO bookDAO = new BookDAO();
            UserDAO userDAO = new UserDAO();

            if (filter == "Pending")
            {
                tradings = tradingDAO.GetPendingBorrowing(userID, page);
                totalPages = tradingDAO.getPages("PendingBR", userID);


            }
            else if (filter == "Borrowing")
            {
                tradings = tradingDAO.GetBorrowing(userID, page);
                totalPages = tradingDAO.getPages("Borrowing", userID);
            }
            else if (filter == "Completed")
            {
                tradings = tradingDAO.GetCompletedBorrow(userID, page);
                totalPages = tradingDAO.getPages("Borrowing", userID);
            }

            foreach (Trading t in tradings)
            {
                books.Add(bookDAO.GetById(t.BookID));
                users.Add(userDAO.GetById(t.LenderID));
            }
        }

        protected void CloseRating(object sender, EventArgs e)
        {
            myModal.Visible = false;
        }

    }
}