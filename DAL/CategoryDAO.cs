using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Model;
using System.Data.SqlClient;

namespace DAL
{
    public class CategoryDAO : DBContext<Category>
    {
        public override bool Delete(int id)
        {
            throw new NotImplementedException();
        }

        public override List<Category> GetAll()
        {
            List<Category> categories = new List<Category>();

            SqlConnection conn = GetConnection();
            conn.Open();

            SqlCommand cmd = new SqlCommand("select * from Category", conn);
            SqlDataReader reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                categories.Add(new Category
                {
                    Id = reader.GetInt32(0),
                    Name = reader.GetString(1)
                });
            }
            return categories;
        }

        public List<Category> GetNRandom(int num)
        {
            List<Category> categories = new List<Category>();
            string query = "select top "+num+ " * from Category order by NEWID()";
            SqlConnection conn = GetConnection();
            conn.Open();

            SqlCommand cmd = new SqlCommand(query, conn);
            //cmd.Parameters.AddWithValue("num", num);
            SqlDataReader reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                categories.Add(new Category
                {
                    Id = reader.GetInt32(0),
                    Name = reader.GetString(1)
                });
            }
            return categories;
        }

        public override Category GetById(int id)
        {
            throw new NotImplementedException();
        }

        public override List<Category> GetByPageId(int pageIndex)
        {
            throw new NotImplementedException();
        }

        public override bool Insert(Category t)
        {
            throw new NotImplementedException();
        }

        public override bool Update(int id, Category newEntity)
        {
            throw new NotImplementedException();
        }
    }
}