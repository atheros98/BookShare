using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Model;
using System.Data.SqlClient;
using System.Data;

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
            return null;
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