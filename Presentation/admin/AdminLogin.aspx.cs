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
    public partial class AdminLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // set title for page
            Page.Title = "Login - BookShare";

            if (Session["adminUsername"] != null && Request.QueryString["command"] == "logout")
            {
                Session.RemoveAll();
            }else if(Session["adminUsername"] != null)
            {
                Response.Redirect("DashboardStatistics.aspx");
            }
        }

        protected void submit_Click(object sender, EventArgs e)
        {
            // authenticate user
            string username = Request.Params["usernameTxt"].ToString();
            string password = Request.Params["passwordTxt"].ToString();

            Admin user = new AdminDAO().GetAdminByUsernamePassword(username, password);
            if (user == null)
            {
                errorTxt.Text = "Username or password is incorrect";
                //ScriptManager.RegisterClientScriptBlock(this, GetType(),
                //    "alertMessage", @"alert('Login success')", true);
                return;
            }

            Session.Add("adminUsername", username);
            Session.Add("currentAdmin", user);
            Response.Redirect("DashboardStatistics.aspx");
        }
    }
}