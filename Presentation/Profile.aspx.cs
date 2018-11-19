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

        public string[] StarList;

        protected void Page_Load(object sender, EventArgs e)
        {
            // set title for page
            Page.Title = "Profile - BookShare";

            int idUser = 0;
            string strUserId = Request.QueryString["userid"];

            CurrentUser = Session["currentUser"] as User;

            // update data if this foward is from submit form
            UpdateInfo();

            UserDAO userDao = new UserDAO();
            BookDAO bookDao = new BookDAO();

            // get current profile id
            // if userid param is not on query string
            if (Request.QueryString["userid"] == null)
            {
                // if current user has not logged in
                if(CurrentUser == null)
                {
                    Response.Redirect("Login.aspx");
                }else
                {
                    // if logged in, userid=null -> let user see their own profile
                    strUserId = "" + CurrentUser.Id;
                }
            }
            else  // userid param is on query string
            {
                // if current user has not logged in: read only
                if (CurrentUser == null)
                {
                    ReadOnly = true;
                    avatar.Visible = false;
                    errorUpload.Visible = false;
                    uploadAvatar.Visible = false;
                }
            }
            

            // check if user insert non-digit character on userid param
            try
            {
                idUser = int.Parse(strUserId);
            }
            catch
            {
                System.Diagnostics.Debug.WriteLine("\n" + "Profile.apsx.cs: user id wrong");
            }

            // set user whose profile is being view as ViewdUser
            ViewedUser = userDao.GetById(idUser);
            StarList = ViewedUser.GetStarFilledArray();

            // if ViewedUser is Current logged in user, let him edit his profile
            if (CurrentUser!= null && ViewedUser.Id != CurrentUser.Id)
            {
                ReadOnly = true;
                avatar.Visible = false;
                errorUpload.Visible = false;
                uploadAvatar.Visible = false;
            }

            // get recent upload book, max=5
            RecentBooks = bookDao.GetLatestUploadBooks(idUser, 5);

        }

        void UpdateInfo()
        {
            string fullname = Request.Params["fullname"];
            if (fullname != null)
            {
                DateTime dob = DateTime.Parse(Request.Params["datepicker"]);
                string email = Request.Params["email"];
                string address = Request.Params["address"];
                string phoneNum = Request.Params["phonenumber"];
                string linkFacebook = Request.Params["linkfacebook"];

                User newEntity = new Model.User
                {
                    Id = CurrentUser.Id,
                    FullName = fullname,
                    Dob = dob,
                    Email = email,
                    Address = address,
                    PhoneNum = phoneNum,
                    LinkFacebook = linkFacebook
                };

                bool ok = new UserDAO().Update(CurrentUser.Id, newEntity);

                if (ok)
                {
                    updateInfomer.ForeColor = System.Drawing.Color.Blue;
                    updateInfomer.Text = "Update sucessfully";
                }
                else
                {
                    updateInfomer.ForeColor = System.Drawing.Color.Red;
                    updateInfomer.Text = "Update failed";
                }
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
            HttpPostedFile uploadedFile = avatar.PostedFile;
            
            if(!uploadedFile.FileName.Equals("")){
                string[] raw = uploadedFile.FileName.Split('.');
                uploadedFile.SaveAs(System.IO.Path.Combine(Server.MapPath("~/images/avatar/"),ViewedUser.GetAvatarFilenameOnly()));
                //ScriptManager.RegisterClientScriptBlock(this, GetType(),
                //    "alertMessage", @"alert('"+uploadedFile.ToString()+"')", true);
                errorUpload.Text = "File upload sucessfully";
            }else
            {
                errorUpload.Text = "Please choose file to upload";
            }
        }

    }
}