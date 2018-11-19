using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Model
{

    public class User
    {
        private int id;
        private string fullName;
        private DateTime dob;
        private string username;
        private string password;
        private string email;
        private string address;
        private string phoneNum;
        private string linkFacebook;
        private string avatar;
        private double userPoint;
        private DateTime createdDate;
        private int status;

        private string imageFolder = "/images/avatar/";

        public const int STATUS_DEACTIVE = -1;
        public const int STATUS_ACTIVE = 1;

        public const string STAR_NO_FILLED = "far fa-star checked";
        public const string STAR_HALF_FILLED = "fas fa-star-half-alt checked";
        public const string STAR_FILLED = "fas fa-star checked";

        public User()
        {

        }

        public string[] GetStarFilledArray()
        {
            string[] array = new string[5];
            for (int i = 1; i <= 5; i++)
            {
                if(userPoint - i < 0)
                {
                    array[i-1] = STAR_NO_FILLED;
                }else if(userPoint - i >= 1)
                {
                    array[i-1] = STAR_FILLED;
                }
                else
                {
                    array[i-1] = STAR_HALF_FILLED;
                }
            }

            return array;
        }

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

        public string FullName
        {
            get
            {
                return fullName;
            }

            set
            {
                fullName = value;
            }
        }

        public DateTime Dob
        {
            get
            {
                return dob;
            }

            set
            {
                dob = value;
            }
        }

        public string Username
        {
            get
            {
                return username;
            }

            set
            {
                username = value;
            }
        }

        public string Password
        {
            get
            {
                return password;
            }

            set
            {
                password = value;
            }
        }

        public string Email
        {
            get
            {
                return email;
            }

            set
            {
                email = value;
            }
        }

        public string Address
        {
            get
            {
                return address;
            }

            set
            {
                address = value;
            }
        }

        public string PhoneNum
        {
            get
            {
                return phoneNum;
            }

            set
            {
                phoneNum = value;
            }
        }

        public string LinkFacebook
        {
            get
            {
                return linkFacebook;
            }

            set
            {
                linkFacebook = value;
            }
        }

        public string Avatar
        {
            get
            {
                return imageFolder + avatar;
            }

            set
            {
                avatar = value;
            }
        }

        public double UserPoint
        {
            get
            {
                return userPoint;
            }

            set
            {
                userPoint = value;
            }
        }

        public DateTime CreatedDate
        {
            get
            {
                return createdDate;
            }

            set
            {
                createdDate = value;
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

        public string GetAvatarFilenameOnly()
        {
            return avatar;
        }

        public User(int id, string fullName, DateTime dob, string username, string password, string email, string address, string phoneNum, string linkFacebook, string avatar, double userPoint, DateTime createdDate)
        {
            this.Id = id;
            this.FullName = fullName;
            this.Dob = dob;
            this.Username = username;
            this.Password = password;
            this.Email = email;
            this.Address = address;
            this.PhoneNum = phoneNum;
            this.LinkFacebook = linkFacebook;
            this.Avatar = avatar;
            this.UserPoint = userPoint;
            this.CreatedDate = createdDate;
        }

        public User(string fullName, DateTime dob, string username, string password, string email, string address, string phoneNum, string linkFacebook, string avatar, double userPoint, DateTime createdDate)
        {
            this.FullName = fullName;
            this.Dob = dob;
            this.Username = username;
            this.Password = password;
            this.Email = email;
            this.Address = address;
            this.PhoneNum = phoneNum;
            this.LinkFacebook = linkFacebook;
            this.Avatar = avatar;
            this.UserPoint = userPoint;
            this.CreatedDate = createdDate;
        }
    }
}