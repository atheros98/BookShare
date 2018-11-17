using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Model;
using System.Data.SqlClient;
using System.Data;
using System.IO;
using System.Diagnostics;

namespace DAL
{
    public class UserDAO : DBContext<User>
    {
        public User GetUserByUsernamePassword(string username, string password)
        {
            User user = null;
            SqlConnection conn = GetConnection();
            conn.Open();
            SqlCommand cmd = new SqlCommand("select * from [User] where username = @username and password = @password", conn);

            cmd.Parameters.AddWithValue("username", username);
            cmd.Parameters.AddWithValue("password", password);

            SqlDataReader reader = cmd.ExecuteReader();

            if (reader.HasRows)
            {
                if (reader.Read())
                {
                    user = new User
                    {
                        Id = reader.GetInt32(0),
                        Username = username,
                        Password = password
                    };
                }
            }
            conn.Close();
            return user;
        }

        public User GetLatestUploadUser(int bookID)
        {
            User user = null;
            string query = @"select top 1 u.id, u.username, u.avatar, u.userPoint
                            from [User] u, trading t
                            where u.id = t.lenderID and t.tradingStatus= @status and t.bookID = @bookID order by (t.completedTime) desc";
            
            SqlConnection conn = GetConnection();
            conn.Open();
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@status", Trading.STATUS_AVAILABLE);
            cmd.Parameters.AddWithValue("bookID", bookID);

            //ScriptManager.RegisterClientScriptBlock(this, GetType(),
            //    "alertMessage", @"alert('Login success')", true);
            
            SqlDataReader reader = cmd.ExecuteReader();
          
            if (reader.Read())
            {
                System.Diagnostics.Debug.WriteLine(reader.GetInt32(0));
                user = new User
                {
                    Id = reader.GetInt32(0),
                    Username = reader.GetString(1), 
                    Avatar = reader.GetString(2),
                    UserPoint = reader.GetFloat(3)
                };

            }
            conn.Close();
            return user;
        }

        public override bool Delete(int id)
        {
            return false;
        }

        public override List<User> GetAll()
        {
            return null;
        }

        public override User GetById(int id)
        {
            User user = null;
            string query = "select * from [User] where id = @id";

            SqlConnection conn = GetConnection();
            conn.Open();
            SqlCommand cmd = new SqlCommand(query, conn);

            cmd.Parameters.AddWithValue("@id", id);

            SqlDataReader reader = cmd.ExecuteReader();

            if (reader.Read())
            {
                System.Diagnostics.Debug.WriteLine(reader.GetInt32(0));
                user = new User
                {
                    Id = reader.GetInt32(0),
                    FullName = reader.GetString(1), Dob = reader.GetDateTime(2),
                    Username = reader.GetString(3), Password = reader.GetString(4),
                    Email = reader.GetString(5), Address = reader.GetString(6),
                    PhoneNum = reader.GetString(7), LinkFacebook = reader.GetString(8),
                    Avatar = reader.GetString(9),
                    UserPoint = reader.GetFloat(10),
                    CreatedDate = reader.GetDateTime(11)
                };

            }
            conn.Close();
            return user;
        }

        public override List<User> GetByPageId(int pageIndex)
        {
            return null;
        }

        public override bool Insert(User u)
        {
            try
            {
                string query = @"insert into [User] (fullName, dob, username, password, email, 
                                address, phoneNum, linkFacebook, avatar, userPoint, createdTime)
                             values (@fullName, @dob, @username, @password, @email, 
                                @address, @phoneNum, @linkFacebook, @avatar, @userPoint, @createdTime);";

                SqlConnection conn = GetConnection();
                conn.Open();

                SqlCommand cmd = new SqlCommand(query, conn);

                cmd.Parameters.AddWithValue("fullName", u.FullName);
                cmd.Parameters.AddWithValue("dob", u.Dob);
                cmd.Parameters.AddWithValue("username", u.Username);
                cmd.Parameters.AddWithValue("password", u.Password);
                cmd.Parameters.AddWithValue("email", u.Email);
                cmd.Parameters.AddWithValue("address", u.Address);
                cmd.Parameters.AddWithValue("phoneNum", u.PhoneNum);
                cmd.Parameters.AddWithValue("linkFacebook", u.LinkFacebook);
                cmd.Parameters.AddWithValue("avatar", u.Avatar);
                cmd.Parameters.AddWithValue("userPoint", u.UserPoint);
                cmd.Parameters.AddWithValue("createdTime", u.CreatedDate);

                cmd.ExecuteNonQuery();
                conn.Close();
            } catch (Exception ex)
            {
                return false;
            }
            
            return true;
        }

        public override bool Update(int id, User newEntity)
        {
            return false;
        }
    }
}