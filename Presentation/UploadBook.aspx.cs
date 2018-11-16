using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL;
using Model;

namespace Presentation
{
    public partial class UploadBook : System.Web.UI.Page
    {
        public List<Category> categories;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                categories = new CategoryDAO().GetAll();
                foreach (Category cat in categories)
                {
                    cate.Items.Add(new ListItem(cat.Name, cate.ID));
                }
            }
        }

        private void disableInput(bool disable)
        {
            title.Disabled = disable;
            author.Disabled = disable;
            cate.ClearSelection();
            cate.Enabled = !disable;
            image.Visible = disable;
            FileUpload1.Visible = !disable;
            language.Disabled = disable;
            description.Disabled = disable;

            if (!disable)
            {
                title.Value = "";
                author.Value = "";
                cate.Items[0].Selected = true;
                language.Value = "";
                description.Value = "";
            }
        }

        protected void isbn_TextChanged(object sender, EventArgs e)
        {
            string ISBN = isbn.Text;
            Book book = new BookDAO().getByISBN(ISBN);
            if (book != null)
            {
                disableInput(true);
                title.Value = book.Title;
                author.Value = book.Author;
                cate.Items[book.CategoryID - 1].Selected = true;
                image.ImageUrl = book.CoverImg;
                language.Value = book.Language;
                description.Value = book.Description;
            } else
            {
                disableInput(false);
            }
        }

        protected void uploadBtn_Click(object sender, EventArgs e)
        {
            User user = (User)Session["currentUser"];
            if (user != null)
            {
                BookDAO bookDAO = new BookDAO();
                Book book = bookDAO.getByISBN(isbn.Text);
                if (book == null)
                {

                }
            }
        }
    }
}