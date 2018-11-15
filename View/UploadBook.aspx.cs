using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL;
using Model;

namespace View
{
    public partial class UploadBook : System.Web.UI.Page
    {
        public List<Category> categories;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                categories = new CategoryDAO().GetAll();
            }
        }

        protected void isbn_TextChanged(object sender, EventArgs e)
        {
            string ISBN = isbn.Text;
            Book book = new BookDAO().getByISBN(ISBN);
            if (book != null)
            {
                title.Value = book.Title;
                author.Value = book.Author;
                category.Value = book.CategoryID.ToString();
            }
        }
    }
}