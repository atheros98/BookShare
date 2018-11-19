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
    public partial class ManageUser : System.Web.UI.Page
    {
        public List<User> Users;

        public int PageId = 0;
        public int TotalPages = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            // Delete user if this is action from a form
            string strUserId = Request.Params["userid"];
            if (strUserId != null)
            {
                try
                {
                    int id = int.Parse(strUserId);
                    bool ok = new UserDAO().Delete(id);
                    
                }catch
                {
                    Response.Redirect("ErroPage.aspx");
                }
                
            }

            // get pageId param on query string
            string strPageId = Request.QueryString["pageId"];
            if (strPageId == null)
            {
                strPageId = "1";
            }

            // parse value of query string pageId to int
            try
            {
                PageId = int.Parse(strPageId);
            }
            catch
            {
                Response.Redirect("ErrorPage.aspx");
            }

            //get pending book and set it to PendingList
            setUsers();

        }


        void setUsers()
        {
            UserDAO userDao = new UserDAO();

            Users = userDao.GetByPageId(PageId);
            // get total pages
            TotalPages = userDao.GetTotalPages();

            System.Diagnostics.Debug.WriteLine("\n NUMBER OF USERS: " + Users.Count);
        }

    }
}