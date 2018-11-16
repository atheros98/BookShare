using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DAL
{
    public class BookDAO : DBContext<Book>
    {
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
            return null;
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