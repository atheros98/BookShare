using Model;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace DAL
{
    public class TradingDAO : DBContext<Trading>
    {
        private int pageSize = 5;
        public override bool Delete(int id)
        {
            throw new NotImplementedException();
        }

        public override List<Trading> GetAll()
        {
            throw new NotImplementedException();
        }

        public override Trading GetById(int id)
        {
            throw new NotImplementedException();
        }

        public override List<Trading> GetByPageId(int pageIndex)
        {
            throw new NotImplementedException();
        }

        public override bool Insert(Trading t)
        {
            throw new NotImplementedException();
        }

        public override bool Update(int id, Trading newEntity)
        {
            throw new NotImplementedException();
        }
        //Get a specific number of lenders by book ID 
        public List<User> getAllLendersByBookIDAndPaging(int bookId, int pageIndex)
        {
            List<User> lists = new List<User>();

            string query = @"with temp as(
                            select u.id, u.fullName, u.email, u.[address], u.phoneNum, u.linkFacebook,
                            t.completedTime, ROW_NUMBER() over(order by uploadDate desc) row_num
	                        from Trading t, [User] u
			                where t.lenderID = u.id
							and t.bookID = 2)
                            
                            select * from temp 
                            where temp.row_num >= @start and temp.row_num <= @end";

            SqlConnection conn = new SqlConnection(ConnectionString);
            conn.Open();
            SqlCommand cmd = new SqlCommand(query, conn);

            cmd.Parameters.AddWithValue("start", (pageIndex - 1) * pageSize + 1);
            cmd.Parameters.AddWithValue("end", pageIndex * pageSize + 1);

            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                User user = new User
                {
                    Id = reader.GetInt32(0),
                    FullName = reader.GetString(1),
                    Email = reader.GetString(2),
                    Address = reader.GetString(3),
                    PhoneNum = reader.GetString(4),
                    LinkFacebook = reader.GetString(5)
                };
                
                lists.Add(user);

            }
            return lists;
        }
        //Get all tradings of one bookId
        public List<Trading> getAllTradingOfOneBook(int bookId, int pageIndex)
        {
            List<Trading> lists = new List<Trading>();

            string query = @"";

            SqlConnection conn = new SqlConnection(ConnectionString);
            conn.Open();
            SqlCommand cmd = new SqlCommand(query, conn);

            cmd.Parameters.AddWithValue("start", (pageIndex - 1) * pageSize + 1);
            cmd.Parameters.AddWithValue("end", pageIndex * pageSize + 1);

            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                Trading trade = new Trading
                {
                    trade.Id
                };

                lists.Add(user);

            }
            return lists;
        }
    }
}