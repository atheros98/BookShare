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
        private int pageSize = 5;
        public Book getByISBN(string isbn)
        {
            Book book = null;
            string query = "select * from Book where ISBN = @isbn and status = " + Book.STATUS_ACCEPTED;
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

        public List<Book> searchBook(string query, string filter, int page)
        {
            if (query == null) return null;
            BookDAO dao = new BookDAO();
            List<Book> books = new List<Book>();
            switch (filter)
            {
                case "All":
                    books = dao.getBook(query, page);
                    break;
                case "Title":
                    books = dao.getBooksByName(query, page);
                    break;
                case "Author":
                    books = dao.getBooksByAuthor(query, page);
                    break;
                case "ISBN":
                    books = dao.getBooksByISBN(query, page);
                    break;
            }
            return books;
        }


        public List<Book> getBook(string queryStr, int page)
        {
            int from = (page - 1) * pageSize + 1;
            int to = page * pageSize;
            string query = "select * from"
                    + " (select distinct * , ROW_NUMBER() over (order by id DESC) as row from"
                    + " (select * from Book where title LIKE '%" + queryStr + "%'"
                    + " union select * from Book where ISBN LIKE '%" + queryStr + "%'"
                    + " union select * from Book where author LIKE '%" + queryStr + "%') result) final_result"
                    + " where final_result.row between " + from + " and " + to + " and status = " + Book.STATUS_ACCEPTED;
            return getBookByCommand(query);
        }

        // For search: tab Name
        public List<Book> getBooksByName(string name, int page)
        {
            int from = (page - 1) * pageSize + 1;
            int to = page * pageSize;
            string query = "select * from "
                    + "(select *, row_number() over (order by id DESC) as row from Book"
                    + " where title LIKE '%" + name + "%') result"
                    + " where result.row between " + from + " and " + to + " and status = " + Book.STATUS_ACCEPTED; ;
            return getBookByCommand(query);
        }

        // For search: tab ISBN
        public List<Book> getBooksByISBN(string ISBN, int page)
        {
            int from = (page - 1) * pageSize + 1;
            int to = page * pageSize;
            string query = "select * from "
                    + "(select *, row_number()  over (order by id DESC) as row from Book"
                    + " where ISBN LIKE '%" + ISBN + "%') result"
                    + " where result.row between " + from + " and " + to + " and status = " + Book.STATUS_ACCEPTED; ;
            return getBookByCommand(query);
        }

        // For search: tab Author
        public List<Book> getBooksByAuthor(string author, int page)
        {
            int from = (page - 1) * pageSize + 1;
            int to = page * pageSize;
            string query = "select * from "
                    + "(select *, row_number() over (order by id DESC) as row from Book"
                    + " where author LIKE '%" + author + "%') result"
                    + " where result.row between " + from + " and " + to + " and status = " + Book.STATUS_ACCEPTED; ;
            return getBookByCommand(query);
        }

        public List<Book> getBookByCommand(string sqlCommand)
        {
            List<Book> books = new List<Book>();
            SqlCommand cmd = null;
            SqlConnection conn = GetConnection();
            try
            {
                conn.Open();
                cmd = new SqlCommand(sqlCommand, conn);

                SqlDataReader reader = cmd.ExecuteReader();
                {
                    if (reader.HasRows)
                    {
                        while (reader.Read())
                        {
                            Book book = new Book
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
                            books.Add(book);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                cmd.Dispose();
                conn.Close();
            }
            return books;
        }


        // For paging: get total of row
        public int getRowCount(string type, string queryStr)
        {
            int pages = 0;
            string sqlCommand = "";
            SqlCommand cmd = null;
            SqlConnection conn = GetConnection();

            switch (type)
            {
                case "All":
                    sqlCommand = "select count (distinct id) from"
                            + "(select * from Book where title LIKE '%" + queryStr + "%'"
                    + " union select * from Book where ISBN LIKE '%" + queryStr + "%'"
                    + " union select * from Book where author LIKE '%" + queryStr + "%') result where status = " + Book.STATUS_ACCEPTED;
                    break;
                case "Title":
                    sqlCommand = "select count (*) from Book where title LIKE '%" + queryStr + "%' where status = " + Book.STATUS_ACCEPTED; 
                    break;
                case "Author":
                    sqlCommand = "select count (*) from Book where author LIKE '%" + queryStr + "%' where status = " + Book.STATUS_ACCEPTED; 
                    break;
                case "ISBN":
                    sqlCommand = "select count (*) from Book where ISBN LIKE '%" + queryStr + "%' where status = " + Book.STATUS_ACCEPTED; 
                    break;
            }

            try
            {
                conn.Open();
                cmd = new SqlCommand(sqlCommand, conn);
                pages = int.Parse(cmd.ExecuteScalar().ToString());

            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                cmd.Dispose();
                conn.Close();
            }
            return pages;
        }

        // For paging: calculator number of page
        public int getPages(string type, string queryStr)
        {
            int rows = getRowCount(type, queryStr);
            return rows / (pageSize) + ((rows % pageSize) != 0 ? 1 : 0);
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

        public int GetTotalAcceptedBooks()
        {
            string query = "select count(id) from Book where status = " + Book.STATUS_ACCEPTED;

            SqlConnection conn = new SqlConnection(ConnectionString);
            conn.Open();
            SqlCommand cmd = new SqlCommand(query, conn);
            try
            {
                int book_num = (int)cmd.ExecuteScalar();
                return book_num;
            }
            catch
            {
                Console.WriteLine("Get total book num return not a number");
            }
            return -1;
        }

        public override List<Book> GetByPageId(int pageIndex)
        {
            List<Book> list = new List<Book>();
            string query = @"with temp as(
	                        select *, ROW_NUMBER() over(order by createdTime desc) row_num
	                        from Book
                            )
                            select * from temp
                            where row_num >= @start and row_num <=@end";

            SqlConnection conn = new SqlConnection(ConnectionString);
            conn.Open();
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("start", (pageIndex - 1) * pageSize + 1);
            cmd.Parameters.AddWithValue("end", pageIndex * pageSize + 1);

            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
               
                Book book = new Book
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

                list.Add(book);

            }

            return list;
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