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
        public bool ReadOnly = false;
        public User ViewedUser;
        public User CurrentUser;
        public List<Book> RecentBooks = new List<Book>();

        protected void Page_Load(object sender, EventArgs e)
        {
            // set title for page
            Page.Title = "Profile - BookShare";

            int idUser = 0;
            string strUserId = Request.QueryString["userid"];

            CurrentUser = Session["currentUser"] as User;

            // update data if this foward is from submit form
            UploadInfo();

            UserDAO userDao = new UserDAO();
            BookDAO bookDao = new BookDAO();

            if (Request.QueryString["userid"] == null)
            {
                if(CurrentUser == null)
                {
                    Response.Redirect("error_page");
                }else
                {
                    strUserId = "" + CurrentUser.Id;
                }
            }

            try
            {
                idUser = int.Parse(strUserId);
            }
            catch
            {
                System.Diagnostics.Debug.WriteLine("\n" + "Profile.apsx.cs: user id wrong");
            }
            ViewedUser = userDao.GetById(idUser);

            if (ViewedUser.Id != CurrentUser.Id)
            {
                ReadOnly = true;
            }

            RecentBooks = bookDao.GetLatestUploadBooks(idUser, 5);

            if (ReadOnly)
            {
                avatar.Visible = false;
                errorUpload.Visible = false;
                
            }


        }

        void UploadInfo()
        {
            string fullname = Request.Params["fullname"];
            if (fullname != null)
            {
                
                
                
            }
        }

        void fileUploadOnChange()
        {
            ScriptManager.RegisterClientScriptBlock(this, GetType(),
               "alertMessage", @"alert('Upload')", true);
        }

        protected void uploadAvatar_Click(object sender, EventArgs e)
        {
            // overwrite existing avatar
            HttpPostedFile uploadedFile = avatar.PostedFiles.Count > 0 ? avatar.PostedFiles[0] : null;
            if (uploadedFile != null)
            {
                string[] raw = uploadedFile.FileName.Split('.');
                uploadedFile.SaveAs(System.IO.Path.Combine(Server.MapPath("~/images/avatar/"), CurrentUser.Id+"."+raw[raw.Length-1]));
                ScriptManager.RegisterClientScriptBlock(this, GetType(),
                    "alertMessage", @"alert('Upload')", true);
            }
        }

    }
}