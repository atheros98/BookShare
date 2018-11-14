using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Data.SqlClient;

namespace DAL
{
    public abstract class DBContext<T>
    {
        private static string connectionString;

        static DBContext()
        {
            connectionString = WebConfigurationManager.ConnectionStrings["MyBookShareConnectionString"].ConnectionString;
        }

        public string ConnectionString {
            get {
                return connectionString;
            }
             }

        public SqlConnection GetConnection()
        {
            return new SqlConnection(connectionString);
        }

        public abstract List<T> GetAll();
        public abstract List<T> GetByPageId(int pageIndex);
        public abstract T GetById(int id);
        public abstract bool Insert(T t);
        public abstract bool Delete(int id);
        public abstract bool Update(int id, T newEntity);
    }
}