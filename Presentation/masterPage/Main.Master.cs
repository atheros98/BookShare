﻿using System;
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
        public int totalBooks = 0;
        public List<Category> Categories;
        public string[] StarList = new string[5];

        private int numCatagories = 10;

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
                RecentUploadBook = bookDao.GetLatestUploadBooks(CurrentUser.Id, 1)[0];
                totalBooks = bookDao.CountNumberUploadedBook(CurrentUser.Id);

                StarList = CurrentUser.GetStarFilledArray();
            }

        }
    }
}