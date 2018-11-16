using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Model;

namespace DAL
{
    public class TradingDAO : DBContext<Trading>
    {
        public override bool Delete(int id)
        {
            return false;
        }

        public override List<Trading> GetAll()
        {
            return null;
        }

        public override Trading GetById(int id)
        {
            return null;
        }

        public override List<Trading> GetByPageId(int pageIndex)
        {
            return null;
        }

        public override bool Insert(Trading t)
        {
            return false;
        }

        public override bool Update(int id, Trading newEntity)
        {
            return false;
        }
    }
}