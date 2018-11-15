//using Entity;
using System;
using System.Drawing;
using System.Web.UI;
using Model;
using DAL;

namespace BookShare
{
    public partial class LoginPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // set title for page
            Page.Title = "Login - BookShare";

            if (Session["username"] != null && Request.QueryString["command"] != null)
            {
                Session.RemoveAll();
            }
        }

        protected void submit_Click(object sender, EventArgs e)
        {
            // authenticate user
            string username = Request.Params["usernameTxt"].ToString();
            string password = Request.Params["passwordTxt"].ToString();

            User user = new UserDAO().GetUserByUsernamePassword(username, password);
            if(user!= null)
            {
                ScriptManager.RegisterClientScriptBlock(this, GetType(),
        "alertMessage", @"alert('Login success')", true);
            }
        }
    }
}