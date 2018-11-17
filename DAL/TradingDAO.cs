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

        public int CreateNewTrading(string description, int bookID, int lenderID)
        {
            SqlConnection conn = GetConnection();
            SqlCommand cmd = null;
            int tradingID = -1;
            try
            {
                string sql = @"INSERT INTO Trading 
                            (description, tradingStatus, completedTime, bookID, lenderID) 
                            VALUES (@description, @tradingStatus, @completedTime, @bookID, @lenderID);
                            SELECT SCOPE_IDENTITY()";
                conn.Open();
                cmd = new SqlCommand(sql, conn);

                cmd.Parameters.AddWithValue("@description", description);
                cmd.Parameters.AddWithValue("@tradingStatus", Trading.STATUS_AVAILABLE);
                cmd.Parameters.AddWithValue("@completedTime", DateTime.Now);
                cmd.Parameters.AddWithValue("@bookID", bookID);
                cmd.Parameters.AddWithValue("@lenderID", lenderID);

                tradingID = Convert.ToInt32(cmd.ExecuteScalar());
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
            return tradingID;
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
        public List<Trading> getAllTradingOfOneBookPaging(int bookId, int pageIndex)
        {
            List<Trading> lists = new List<Trading>();
            SqlConnection conn = null;
            SqlCommand cmd = null;
            try
            {
                string query = @"select id, [description], tradingStatus, 
                                completedTime, lenderRatePoint, borrowerRatePoint, bookID, lenderID, borrowerID
		
                                from Trading t
                                where t.bookID = @id";

                conn = new SqlConnection(ConnectionString);
                conn.Open();
                cmd = new SqlCommand(query, conn);

                cmd.Parameters.AddWithValue("@id", bookId);
                
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    Trading trade = new Trading
                    {
                        Id = reader.GetInt32(0),
                        Description = reader.GetString(1),
                        TradingStatus = reader.GetInt32(2),
                        CompletedTime = reader.GetDateTime(3),
                        BookID = reader.GetInt32(6),
                        LenderID = reader.GetInt32(7)
                    };

                    lists.Add(trade);

                }
            }catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                cmd.Dispose();
                conn.Close();
            }
            return lists;
        }
        //Get all traded images of one traidings
        public List<string> getAllTradedImages(int tradingId)
        {
            List<string> lists = new List<string>();
            SqlConnection conn = null;
            SqlCommand cmd = null;
            try
            {
                string query = @"select id, image, tradingID 
                                from TradedBookImage
                                where tradingID = @tradingId";

                conn = new SqlConnection(ConnectionString);
                conn.Open();
                cmd = new SqlCommand(query, conn);

                cmd.Parameters.AddWithValue("@tradingId", tradingId);

                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    string imagePath = Trading.ImageFolder + reader.GetString(1);
                    lists.Add(imagePath);

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
            return lists;
        }
    }
}