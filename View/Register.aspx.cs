using DAL;
using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace View
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void submitBtn_Click(object sender, EventArgs e)
        {
            //Create new User
            string fullname = Request.Params["fullName"].ToString();
            DateTime dob = Convert.ToDateTime(Request.Params["birthDay"].ToString() );
            string username = Request.Params["username"].ToString();
            string password = Request.Params["psw"].ToString();
            string email = Request.Params["email"].ToString();
            string address = Request.Params["address"].ToString();
            string phoneNum = Request.Params["phoneNum"].ToString();
            string facebook = Request.Params["facebook"].ToString();
            string avatar = "";
            double userPoint = 0;
            DateTime dayCreated = DateTime.Now;

            User user = new User(fullname, dob, username, password, email, 
                address, phoneNum, facebook, avatar, userPoint, dayCreated);
            //Create new UserDAO instance to add new data to database
            UserDAO ud = new UserDAO();
            bool successfully = ud.Insert(user);

            if (successfully)
            {
                //Register successfully new accout
                //Forward to Login page
                Response.Redirect("Login.aspx");
            }
            else
            {
                Label1.Text = "Can not register";
            }
        }
    }
}