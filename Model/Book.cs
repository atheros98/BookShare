using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Model
{
    public class Book
    {
        public static string ImageFolder = "images/bookCover/";

        private int id;
        private string title;
        private string author;
        private string ISBN;
        private string language;
        private string description;
        private int status;
        private string coverImg;
        private DateTime createdTime;
        private int creatorID;
        private int categoryID;

        public const int STATUS_PENDING = 0;
        public const int STATUS_ACCEPTED = 1;
        public const int STATUS_DELETED = 2;

        public int Id
        {
            get
            {
                return id;
            }

            set
            {
                id = value;
            }
        }

        public string Title
        {
            get
            {
                return title;
            }

            set
            {
                title = value;
            }
        }

        public string Author
        {
            get
            {
                return author;
            }

            set
            {
                author = value;
            }
        }

        public string ISBN1
        {
            get
            {
                return ISBN;
            }

            set
            {
                ISBN = value;
            }
        }

        public string Language
        {
            get
            {
                return language;
            }

            set
            {
                language = value;
            }
        }

        public string Description
        {
            get
            {
                return description;
            }

            set
            {
                description = value;
            }
        }

        public string CoverImg
        {
            get
            {
                return ImageFolder + coverImg;
            }

            set
            {
                coverImg = value;
            }
        }

        public DateTime CreatedTime
        {
            get
            {
                return createdTime;
            }

            set
            {
                createdTime = value;
            }
        }

        public int CategoryID
        {
            get
            {
                return categoryID;
            }

            set
            {
                categoryID = value;
            }
        }

        public int Status
        {
            get
            {
                return status;
            }

            set
            {
                status = value;
            }
        }

        public int CreatorID
        {
            get
            {
                return creatorID;
            }

            set
            {
                creatorID = value;
            }
        }
    }
}