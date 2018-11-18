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
        private int pageSize = 10;

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

        public List<Trading> GetPendingBorrowing(int userID, int page)
        {
            int from = (page - 1) * pageSize + 1;
            int to = page * pageSize;
            string query = @"select * from 
                            (select *, row_number() over (order by completedTime DESC) as row from Trading
                            where tradingStatus = " + Trading.STATUS_PENDING + " and borrowerID = " + userID + @") result
                            where result.row between " + from + " and " + to;
            return GetTradingByCommand(query);
        }

        public List<Trading> GetBorrowing(int userID, int page)
        {
            int from = (page - 1) * pageSize + 1;
            int to = page * pageSize;
            string query = @"select * from 
                            (select *, row_number() over (order by completedTime DESC) as row from Trading
                            where tradingStatus = " + Trading.STATUS_LENDING + " and borrowerID = " + userID + @") result
                            where result.row between " + from + " and " + to;
            return GetTradingByCommand(query);
        }

        public List<Trading> GetCompletedBorrow(int userID, int page)
        {
            int from = (page - 1) * pageSize + 1;
            int to = page * pageSize;
            string query = @"select * from 
                            (select *, row_number() over (order by completedTime DESC) as row from Trading
                            where tradingStatus = " + Trading.STATUS_COMPLETED + " and borrowerID = " + userID + @") result
                            where result.row between " + from + " and " + to;
            return GetTradingByCommand(query);
        }

        public List<Trading> GetTradingByCommand(string query)
        {
            SqlConnection conn = GetConnection();
            SqlCommand cmd = null;
            List<Trading> tradings = new List<Trading>();
            try
            {
                conn.Open();
                cmd = new SqlCommand(query, conn);

                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    Trading trade = new Trading
                    {
                        Id = reader.GetInt32(0),
                        Description = reader.GetString(1),
                        TradingStatus = reader.GetInt32(2),
                        CompletedTime = reader.GetDateTime(3),
                        LenderRatePoint = reader.GetString(4) == null ? -1 : reader.GetFloat(4),
                        BorrowerRatePoint = reader.GetString(5) == null ? -1 : reader.GetFloat(5),
                        BookID = reader.GetInt32(6),
                        LenderID = reader.GetInt32(7),
                        BorrowerID = reader.GetString(8) == null ? -1 : reader.GetInt32(8)
                    };

                    tradings.Add(trade);
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
            return tradings;
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
            bool finish = false;
            SqlConnection conn = null;
            SqlCommand cmd = null;
            try
            {
                string query = @"UPDATE Trading
                            SET [borrowerID] = @borrowerId
                            WHERE id = @tradingId;";
                conn = GetConnection();
                conn.Open();

                cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@borrowerId", newEntity.BorrowerID);
                cmd.Parameters.AddWithValue("@tradingId", id);

                cmd.ExecuteNonQuery();
                finish = true;
            }
            catch (Exception ex)
            {
                finish = false;
                throw ex;
            }
            finally
            {
                cmd.Dispose();
                conn.Close();
            }
            return finish;
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


        public int getRowCount(string type, int userID)
        {
            int pages = 0;
            string sqlCommand = "";
            SqlCommand cmd = null;
            SqlConnection conn = GetConnection();

            switch (type)
            {
                case "PendingBR":
                    sqlCommand = "select COUNT(*) from Trading where tradingStatus = " + Trading.STATUS_PENDING + " and borrowerID = " + userID;
                    break;
                case "Borrowing":
                    sqlCommand = "select COUNT(*) from Trading where tradingStatus = " + Trading.STATUS_LENDING + " and borrowerID = " + userID;
                    break;
                case "CompletedBorrow":
                    sqlCommand = "select COUNT(*) from Trading where tradingStatus = " + Trading.STATUS_COMPLETED + " and borrowerID = " + userID;
                    break;
                case "Author":
                    sqlCommand = "select count (*) from Book where author LIKE '%%' and status = " + Book.STATUS_ACCEPTED;
                    break;
                case "ISBN":
                    sqlCommand = "select count (*) from Book where ISBN LIKE '%%' and status = " + Book.STATUS_ACCEPTED;
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
        public int getPages(string type, int userID)
        {
            int rows = getRowCount(type, userID);
            return rows / (pageSize) + ((rows % pageSize) != 0 ? 1 : 0);
        }
    }
}