using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Model;
using DAL;

namespace Presentation.masterPage
{
    public partial class Main : System.Web.UI.MasterPage
    {
        public Book RecentUploadBook;
        public User CurrentUser;
        public List<Category> Categories;

        private int numCatagories = 5;

        protected void Page_Load(object sender, EventArgs e)
        {
            loadRecentUploadBook();
            Categories = new CategoryDAO().GetNRandom(numCatagories);
        }

        void loadRandomCatagories()
        {

        }

        void loadRecentUploadBook()
        {
            object obj = Session["currentUser"];
            if(obj != null)
            {
                CurrentUser = obj as User;
                BookDAO bookDao = new BookDAO();
                RecentUploadBook = bookDao.GetLatestUploadBook(CurrentUser.Id);
            }

        }
    }
}