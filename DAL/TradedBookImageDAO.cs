using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Model;
using System.Data.SqlClient;

namespace DAL
{
    public class TradedBookImageDAO : DBContext<TradedBookImage>
    {
        public override bool Delete(int id)
        {
            throw new NotImplementedException();
        }

        public override List<TradedBookImage> GetAll()
        {
            throw new NotImplementedException();
        }

        public override TradedBookImage GetById(int id)
        {
            throw new NotImplementedException();
        }

        public override List<TradedBookImage> GetByPageId(int pageIndex)
        {
            throw new NotImplementedException();
        }

        public override bool Insert(TradedBookImage t)
        {
            SqlConnection conn = GetConnection();
            SqlCommand cmd = null;
            try
            {
                string sql = @"INSERT INTO TradedBookImage (image, tradingID) 
                               values (@image, @tradingID)";
                conn.Open();
                cmd = new SqlCommand(sql, conn);
                cmd.Parameters.AddWithValue("@image", t.Image);
                cmd.Parameters.AddWithValue("@tradingID", t.TradingID);

                cmd.ExecuteNonQuery();
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
            return true;
        }

        public override bool Update(int id, TradedBookImage newEntity)
        {
            throw new NotImplementedException();
        }
    }
}