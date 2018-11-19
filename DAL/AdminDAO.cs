using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Model;
using System.Data.SqlClient;
using System.Data;

namespace DAL
{
    public class AdminDAO : DBContext<Admin>
    {

        public Admin GetAdminByUsernamePassword(string adminUsername, string password)
        {
            Admin admin = null;
            SqlConnection conn = GetConnection();
            conn.Open();
            SqlCommand cmd = new SqlCommand("select * from [Admin] where username = @username and password = @password", conn);

            cmd.Parameters.AddWithValue("username", adminUsername);
            cmd.Parameters.AddWithValue("password", password);

            SqlDataReader reader = cmd.ExecuteReader();

            if (reader.HasRows)
            {
                if (reader.Read())
                {
                    admin = new Admin
                    {
                        Id = reader.GetInt32(0),
                        Username = adminUsername,
                        Password = password
                    };
                }
            }
            conn.Close();
            return admin;
        }
        public override bool Delete(int id)
        {
            return false;
        }

        public override List<Admin> GetAll()
        {
            return null;
        }

        public override Admin GetById(int id)
        {
            return null;
        }

        public override List<Admin> GetByPageId(int pageIndex)
        {
            return null;
        }

        public override bool Insert(Admin t)
        {
            return false;
        }

        public override bool Update(int id, Admin newEntity)
        {
            return false;
        }
    }
}