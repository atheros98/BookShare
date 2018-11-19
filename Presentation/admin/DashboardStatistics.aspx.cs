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
    public partial class DashboardStatistics : System.Web.UI.Page
    {
        public int UserNum = 0;
        public int TotalPendings = 0;
        public int TotalAccepted = 0;
        public int N_LastestAvailableTradings = 0;

        int tradingNum = 5;

        public List<Trading> LastestCompletedTradings;
        public List<User> Lenders = new List<Model.User>();
        public List<User> Borrowers = new List<Model.User>();
        public List<Book> Books = new List<Book>();

        protected void Page_Load(object sender, EventArgs e)
        {
            // get total number of users
            UserDAO userDao = new UserDAO();
            UserNum = userDao.GetRowCount();

            // get total pending books
            BookDAO bookDao = new BookDAO();
            TotalPendings = bookDao.GetRowCountBookByStatus(Book.STATUS_PENDING);
            TotalAccepted = bookDao.GetRowCountBookByStatus(Book.STATUS_ACCEPTED);

            // get number of lastest avaible tradings
            TradingDAO tradingDao = new TradingDAO(5);
            N_LastestAvailableTradings = tradingDao.Get_N_BookNumByStatus(tradingNum, Trading.STATUS_AVAILABLE);

            // get list of Lastest Tradings
            LastestCompletedTradings = tradingDao.GetTradingByCommand("select top 5 * from Trading order by (completedTime) desc");
            foreach(Trading trading in LastestCompletedTradings)
            {
                Lenders.Add(userDao.GetById(trading.LenderID));
                Borrowers.Add(userDao.GetById(trading.BorrowerID));
                Books.Add(bookDao.GetById(trading.BookID));
            }

            // set status

        }   
    }
}