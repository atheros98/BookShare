using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL;
using Model;
using System.IO;

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
            string ISBN = isbn.Text.Trim();
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
            int bookID = -1;
            if (user != null)
            {
                BookDAO bookDAO = new BookDAO();
                Book book = bookDAO.getByISBN(isbn.Text.Trim());
                if (book == null)
                {
                    string filename = uploadBookCover();
                    bookID = bookDAO.CreateBook(title.Value.Trim(), author.Value.Trim(), isbn.Text.Trim(), language.Value.Trim(), description.Value.Trim(), filename, user.Id, cate.SelectedValue);
                }
                if (bookID != -1)
                {

                }
            }
        }

        private string uploadBookCover()
        {
            string filename = "";
            int maxSizeFile = 1024 * 1024 * 4;

            if (FileUpload1.FileContent.Length > maxSizeFile)
            {
            }
            else if (checkType(Path.GetExtension(FileUpload1.FileName)) == false)
            {
            }
            else
            {
                BinaryReader br = new BinaryReader(FileUpload1.PostedFile.InputStream);
                byte[] bytes = br.ReadBytes((int)FileUpload1.PostedFile.InputStream.Length);

                filename = string.Format("{0}{1}", isbn.Text, Path.GetExtension(FileUpload1.FileName));
                uploadImage(Server.MapPath("~"), filename, bytes);
            }
            return filename;
        }

        public void uploadImage(string rootPath, string fileName, byte[] bytes)
        {
            string folderPath = string.Format("{0}/{1}", rootPath, Book.ImageFolder);
            string filePath = string.Format("{0}/{1}{2}{3}", rootPath, Book.ImageFolder, Path.DirectorySeparatorChar, fileName);
            try
            {
                if (!Directory.Exists(folderPath))
                {
                    Directory.CreateDirectory(folderPath);
                }

                if (bytes != null) File.WriteAllBytes(filePath, bytes);
            }
            catch (Exception e)
            {
                throw e;
            }
        }

        public bool checkType(string type)
        {
            if (type.Equals(".jpg") || type.Equals(".png") || type.Equals(".jpeg")) return true;
            else return false;
        }
    }
}