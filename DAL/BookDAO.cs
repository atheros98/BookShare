using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;

namespace DAL
{
    public class BookDAO : DBContext<Book>
    {

        public Book getByISBN(string isbn)
        {
            Book book = null;
            string query = "select * from Book where ISBN = @isbn";
            SqlConnection conn = GetConnection();
            conn.Open();
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@isbn", isbn);

            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                book = new Book
                {
                    Id = reader.GetInt32(0),
                    Title = reader.GetString(1),
                    Author = reader.GetString(2),
                    ISBN1 = reader.GetString(3),
                    Language = reader.GetString(4),
                    Description = reader.GetString(5),
                    Status = reader.GetInt32(6),
                    CoverImg = reader.GetString(7),
                    CreatedTime = reader.GetDateTime(8),
                    CreatorID = reader.GetInt32(9),
                    CategoryID = reader.GetInt32(10)    
                };
            }

            return book;
        }

        public override bool Delete(int id)
        {
            return false;   
        }

        public override List<Book> GetAll()
        {
            return null;
        }

        public override Book GetById(int id)
        {
            Book book = null;
            string query = @"select * from Book
                        where id= @id";
            SqlConnection conn = GetConnection();
            conn.Open();
            SqlCommand cmd = new SqlCommand(query, conn);

            cmd.Parameters.AddWithValue("id", id);

            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                book = new Book
                {
                    Id = id,
                    Title = reader.GetString(1),
                    Author = reader.GetString(2),
                    ISBN1 = reader.GetString(3),
                    Language = reader.GetString(4),
                    Description = reader.GetString(5),
                    Status = reader.GetInt32(6),
                    CoverImg = reader.GetString(7),
                    CreatedTime = reader.GetDateTime(8),
                    CreatorID = reader.GetInt32(9),
                    CategoryID = reader.GetInt32(10)
                };
            }

            return book;
        }

        public override List<Book> GetByPageId(int pageIndex)
        {

            return null;
        }

        public override bool Insert(Book t)
        {
            return false;
        }

        public override bool Update(int id, Book newEntity)
        {
            return false;
        }
    }
}