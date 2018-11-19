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
    public partial class Lending : System.Web.UI.Page
    {
        public List<string> listQuery = new List<string>();
        public User user;
        public string filter;
        public int page;

        public List<Trading> tradings = new List<Trading>();
        public List<User> borrowers = new List<User>();
        public List<Book> books = new List<Book>();

        public int totalPages = -1;
        public int borrowerId = -1;

        protected void Page_Load(object sender, EventArgs e)
        {
            // set title for page
            Page.Title = "Lending - BookShare";
            if (Session["currentUser"] == null)
            {
                Server.Transfer("ErrorPage.aspx");
            }
            else
            {
                User user = (User)Session["currentUser"];

                listQuery.Add("Available");
                listQuery.Add("Pending");
                listQuery.Add("Lending");
                listQuery.Add("Completed");

                filter = Request.QueryString["filter"] == null ? "Pending" : Request.QueryString["filter"];
                page = Request.QueryString["page"] == null ? 1 : int.Parse(Request.QueryString["page"]);
                int id = Request.QueryString["id"] == null ? -1 : int.Parse(Request.QueryString["id"]);

                int point = Request.QueryString["point"] == null ? -1 : int.Parse(Request.QueryString["point"]);

                //Check if page is reload and there is some deletion action 
                if (filter == "Delete")
                {
                    int tradingID = int.Parse(Request.QueryString["deleteID"]);
                    DeleteTrading(tradingID);
                    Response.Redirect("Lending.aspx?filter=Available");
                }
                else if (filter == "Approve")
                {
                    //Check if page is reload and there is some aprroval action 
                    int tradingID = int.Parse(Request.QueryString["approveID"]);
                    ApproveTrading(tradingID);
                    Response.Redirect("Lending.aspx?filter=Pending");
                }
                else if (filter == "Complete")
                {
                    //Check if page is reload and there is some complete action 
                    int tradingID = int.Parse(Request.QueryString["completeID"]);
                    ApproveTrading(tradingID);
                    Response.Redirect("Lending.aspx?filter=Complete");
                }

                FillData(filter, user.Id);

                if (id != -1)
                {
                    borrowerId = borrowers[id].Id;
                    myModal.Visible = true;
                    info.InnerHtml = "Trading no: " + (id + 1) + "<br/>Borrower: " + borrowers[id].FullName + "<br/>";
                    trading.InnerText = tradings[id].Id + "";
                }

                if (point != -1)
                {
                    int tradingID = int.Parse(Request.QueryString["trading"]);
                    TradingDAO tradingDAO = new TradingDAO();
                    tradingDAO.UpdateBorrowerRatePoint(tradingID, point);
                    Response.Redirect("Lending.aspx?filter=Completed");
                }
            }


        }
        private void FillData(string filter, int userID)
        {
            TradingDAO tradingDAO = new TradingDAO();
            BookDAO bookDAO = new BookDAO();
            UserDAO userDAO = new UserDAO();

            if (filter == "Available")
            {
                tradings = tradingDAO.GetAvailableLending(userID, page);
                totalPages = tradingDAO.getPages("AvailableLending", userID);
            }
            else if (filter == "Pending")
            {
                tradings = tradingDAO.GetPendingLending(userID, page);
                totalPages = tradingDAO.getPages("PendingLending", userID);
            }
            else if (filter == "Lending")
            {
                tradings = tradingDAO.GetLending(userID, page);
                totalPages = tradingDAO.getPages("Lending", userID);
            }
            else if (filter == "Completed")
            {
                tradings = tradingDAO.GetCompletedLending(userID, page);
                totalPages = tradingDAO.getPages("CompletedLending", userID);
            }

            foreach (Trading t in tradings)
            {
                books.Add(bookDAO.GetById(t.BookID));
                if (filter != "Available")
                {
                    borrowers.Add(userDAO.GetById(t.BorrowerID));
                }
            }
        }
        private void DeleteTrading(int tradingID)
        {
            TradingDAO tradingDAO = new TradingDAO();
            tradingDAO.DeleteLending(tradingID);
        }

        private void ApproveTrading(int tradingID)
        {
            TradingDAO tradingDAO = new TradingDAO();
            tradingDAO.ApproveLending(tradingID);
        }
        private void CompleteTrading(int tradingID)
        {
            TradingDAO tradingDAO = new TradingDAO();
            tradingDAO.CompleteLending(tradingID);
        }
        protected void CloseRating(object sender, EventArgs e)
        {
            myModal.Visible = false;
        }
    }
}