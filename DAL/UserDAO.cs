﻿using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Model;
using System.Data.SqlClient;
using System.Data;

namespace DAL
{
    public class UserDAO : DBContext<UserDAO>
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

        public override List<UserDAO> GetAll()
        {
            return null;
        }

        public override UserDAO GetById(int id)
        {
            return null;
        }

        public override List<UserDAO> GetByPageId(int pageIndex)
        {
            return null;
        }

        public override bool Insert(UserDAO t)
        {
            return false;
        }

        public override bool Update(int id, UserDAO newEntity)
        {
            return false;
        }
    }
}