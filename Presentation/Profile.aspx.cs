using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Model;
using DAL;

namespace Presentation
{
    public partial class Profile : System.Web.UI.Page
    {
        public bool ReadOnly = true;
        public User ViewedUser;
        public User CurrentUser;

        protected void Page_Load(object sender, EventArgs e)
        {
            // set title for page
            Page.Title = "Profile - BookShare";

            int idUser = 0;

            CurrentUser = Session["currentUser"] as User;

            UserDAO userDao = new UserDAO();

            if (Request.QueryString["userid"] != null)
            {
                try
                {
                    idUser = int.Parse(Request.QueryString["userid"]);
                }catch
                {
                    System.Diagnostics.Debug.WriteLine("\n" + "Profile.apsx.cs: user id wrong");
                }
                ViewedUser = userDao.GetById(idUser);

            }
            else
            {
                
            }
        }

    }
}