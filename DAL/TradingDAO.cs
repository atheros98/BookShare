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
  
        //Get all tradings of one bookId
        public List<Trading> getAllTradingOfOneBook(int bookId, int pageIndex)
        {
            List<Trading> lists = new List<Trading>();

            string query = @"with temp as (select id, [description], tradingStatus, 
                                    completedTime, lenderRatePoint, borrowerRatePoint, bookID, lenderID, borrowerID,
                                    ROW_NUMBER() over (order by completedTime desc) row_num 

                                    from Trading 
                                    where bookID = @id
                                    )    
                            select id, [description], tradingStatus, 
                            completedTime, lenderRatePoint, borrowerRatePoint, bookID, lenderID, borrowerID
                            from temp
                            where temp.row_num between @start and @end";

            SqlConnection conn = new SqlConnection(ConnectionString);
            conn.Open();
            SqlCommand cmd = new SqlCommand(query, conn);

            cmd.Parameters.AddWithValue("@id", bookId);
            cmd.Parameters.AddWithValue("@start", (pageIndex - 1) * pageSize + 1);
            cmd.Parameters.AddWithValue("@end", pageIndex * pageSize + 1);

            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                int temp1 = reader.GetInt32(0);
                string temp = reader.GetString(1);
                Trading trade = new Trading
                {
                    Id = reader.GetInt32(0),
                    Description = reader.GetString(1),
                    TradingStatus = reader.GetInt32(2),
                    CompletedTime = reader.GetDateTime(3),
                    //LenderRatePoint = reader.GetFloat(4),
                    //BorrowerRatePoint = reader.GetFloat(5),
                    //BookID = reader.GetInt32(6),
                    LenderID = reader.GetInt32(7),
                    //BorrowerID = reader.GetInt32(8)
                };

                lists.Add(trade);

            }
            return lists;
        }
    }
}