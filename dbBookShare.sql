USE [master]
GO
/****** Object:  Database [DBBookShare]    Script Date: 11/15/2018 10:38:57 AM ******/
CREATE DATABASE [DBBookShare]
 CONTAINMENT = NONE
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DBBookShare].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DBBookShare] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DBBookShare] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DBBookShare] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DBBookShare] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DBBookShare] SET ARITHABORT OFF 
GO
ALTER DATABASE [DBBookShare] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DBBookShare] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DBBookShare] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DBBookShare] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DBBookShare] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DBBookShare] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DBBookShare] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DBBookShare] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DBBookShare] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DBBookShare] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DBBookShare] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DBBookShare] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DBBookShare] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DBBookShare] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DBBookShare] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DBBookShare] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DBBookShare] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DBBookShare] SET RECOVERY FULL 
GO
ALTER DATABASE [DBBookShare] SET  MULTI_USER 
GO
ALTER DATABASE [DBBookShare] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DBBookShare] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DBBookShare] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DBBookShare] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DBBookShare] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'DBBookShare', N'ON'
GO
ALTER DATABASE [DBBookShare] SET QUERY_STORE = OFF
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [DBBookShare]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 11/15/2018 10:38:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[id] [int] NOT NULL,
	[username] [nvarchar](100) NOT NULL,
	[password] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Book]    Script Date: 11/15/2018 10:38:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Book](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](200) NOT NULL,
	[author] [nvarchar](200) NOT NULL,
	[ISBN] [nvarchar](100) NOT NULL,
	[language] [nvarchar](100) NOT NULL,
	[description] [text] NOT NULL,
	[status] [int] NOT NULL,
	[coverImg] [nvarchar](100) NOT NULL,
	[createdTime] [datetime] NOT NULL,
	[creatorID] [int] NOT NULL,
	[categoryID] [int] NOT NULL,
 CONSTRAINT [PK_Book] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BookRating]    Script Date: 11/15/2018 10:38:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookRating](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ratePoint] [real] NOT NULL,
	[userID] [int] NOT NULL,
	[bookID] [int] NOT NULL,
 CONSTRAINT [PK_BookRating] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BookReview]    Script Date: 11/15/2018 10:38:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookReview](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[content] [text] NOT NULL,
	[createdTime] [datetime] NOT NULL,
	[userID] [int] NOT NULL,
	[bookID] [int] NOT NULL,
 CONSTRAINT [PK_BookReview] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 11/15/2018 10:38:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[id] [int] NOT NULL,
	[name] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TradedBookImage]    Script Date: 11/15/2018 10:38:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TradedBookImage](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[image] [nvarchar](100) NOT NULL,
	[tradingID] [int] NOT NULL,
 CONSTRAINT [PK_TradedBookImage] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Trading]    Script Date: 11/15/2018 10:38:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Trading](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[description] [text] NOT NULL,
	[tradingStatus] [int] NOT NULL,
	[completedTime] [datetime] NULL,
	[lenderRatePoint] [real] NULL,
	[borrowerRatePoint] [real] NULL,
	[bookID] [int] NOT NULL,
	[lenderID] [int] NULL,
	[borrowerID] [int] NULL,
 CONSTRAINT [PK_Trading] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 11/15/2018 10:38:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fullName] [nvarchar](200) NOT NULL,
	[dob] [date] NOT NULL,
	[username] [nvarchar](100) NOT NULL,
	[password] [nvarchar](100) NOT NULL,
	[email] [nvarchar](100) NOT NULL,
	[address] [text] NULL,
	[phoneNum] [nvarchar](50) NULL,
	[linkFacebook] [nvarchar](200) NULL,
	[avatar] [nvarchar](100) NULL,
	[userPoint] [real] NOT NULL,
	[createdTime] [datetime] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Book] ON 

INSERT [dbo].[Book] ([id], [title], [author], [ISBN], [language], [description], [status], [coverImg], [createdTime], [creatorID], [categoryID]) VALUES (2, N'How to Win Friends and Influence People', N'Dale Carnegie', N'561107', N'English', N'You can go after the job you want...and get it! You can take the job you have...and improve it! You can take any situation you''re in...and make it work for you!

Since its release in 1936, How to Win Friends and Influence People has sold more than 15 million copies. Dale Carnegie''s first book is a timeless bestseller, packed with rock-solid advice that has carried thousands of now famous people up the ladder of success in their business and personal lives.

As relevant as ever before, Dale Carnegie''s principles endure, and will help you achieve your maximum potential in the complex and competitive modern age.

Learn the six ways to make people like you, the twelve ways to win people to your way of thinking, and the nine ways to change people without arousing resentment.', 1, N'pic1.jpg', CAST(N'2018-10-03T21:22:00.000' AS DateTime), 1, 3)
INSERT [dbo].[Book] ([id], [title], [author], [ISBN], [language], [description], [status], [coverImg], [createdTime], [creatorID], [categoryID]) VALUES (6, N'Nhà Giả Kim', N'Paulo Coelho', N'123456', N'Vietnamese', N'Nhà Gi? Kim là cu?n sách du?c in nhi?u nh?t ch? sau Kinh Thánh. Cu?n sách c?a Paulo Coelho có s? h?p d?n ra sao khi?n d?c gi? không ch? các x? dùng ngôn ng? B? Ðào Nha mà các ngôn ng? khác say mê nhu v?y?

T?t c? nh?ng tr?i nghi?m trong chuy?n phiêu du theo du?i v?n m?nh c?a mình dã giúp Santiago th?u hi?u du?c ý nghia sâu xa nh?t c?a h?nh phúc, hòa h?p v?i vu tr? và con ngu?i.', 1, N'pic2.jpg', CAST(N'2018-08-03T22:11:00.000' AS DateTime), 1, 25)
INSERT [dbo].[Book] ([id], [title], [author], [ISBN], [language], [description], [status], [coverImg], [createdTime], [creatorID], [categoryID]) VALUES (8, N'Cà Phê Cùng Tony', N'Tony Buổi Sáng', N'456789', N'Vietnamese', N'…Th?t ra Tony hi?u vì sao các bác giáo su ti?n si so?n sách dã ph?i dua vào nhi?u n?i dung nhu v?y. R?t là tâm huy?t và dáng trân tr?ng. Vì ngày xua, ki?n th?c r?t khó tìm. Nhi?u di?u h?u ích ch? n?m trong sách, trong thu vi?n các thành ph? l?n, các tru?ng các vi?n d?i h?c l?n và ngu?i ta ph?i nh? m?i th?, nên ph?i c?ng di?m cho h?c sinh nông thôn vì ít co h?i ti?p c?n ki?n th?c.

Nhung, bây gi? ki?n th?c n?m h?t trên m?ng, trong file máy tính, truy c?p là ra ngay, nên các nu?c dã ph?i thay d?i chuong trình h?c ph? thông sau khi máy tính và internet ra d?i. H?c sinh ch? c?n nh? nh?ng gì c?t lõi, và PHUONG PHÁP tìm ki?m tài li?u. Vì ch? nghia r?i cung s? r?ng roi theo th?i gian, ki?n th?c m?i l?i b? sung liên t?c, nên phuong pháp tìm ki?m thông tin t?t s? giúp ích cho các b?n trong cu?c s?ng sau này. Làm ngành ngh? gì cung ph?i c?p nh?t cái m?i…', 1, N'pic3.jpg', CAST(N'2019-07-02T22:11:00.000' AS DateTime), 1, 25)
INSERT [dbo].[Book] ([id], [title], [author], [ISBN], [language], [description], [status], [coverImg], [createdTime], [creatorID], [categoryID]) VALUES (11, N'Tuổi Trẻ Đáng Giá Bao Nhiêu', N'Rosie Nguyễn', N'147258', N'Vietnamese', N'Khi v? già, ngu?i ta s? h?i ti?c vì nh?ng vi?c h? không làm hon là nh?ng vi?c h? dã làm.

Tu?i tr? ng?n ng?i l?m, d?ng vùi chân ? m?t ch?n nào dó mà b?n không thích, c?m c?i sáng di t?i v? và l?p l?i vòng lu?n qu?n bán tu?i tr? l?y chút ti?n. Suy cho cùng Tu?i Tr? Ðáng Giá Bao Nhiêu d? b?n ph?i dánh d?i?', 1, N'pic4.jpg', CAST(N'2018-03-05T12:12:00.000' AS DateTime), 1, 25)
INSERT [dbo].[Book] ([id], [title], [author], [ISBN], [language], [description], [status], [coverImg], [createdTime], [creatorID], [categoryID]) VALUES (12, N'White Fang', N'Jack London', N'9781505313109', N'English', N'White Fang is a novel by American author Jack London (1876–1916) — and the name of the book''s eponymous character, a wild wolfdog. First serialized in Outing magazine, it was published in 1906. The story takes place in Yukon Territory and the Northwest Territories, Canada, during the 1890s Klondike Gold Rush and details White Fang''s journey to domestication. It is a companion novel (and a thematic mirror) to London''s best-known work, The Call of the Wild, which is about a kidnapped, domesticated dog embracing his wild ancestry to survive and thrive in the wild.', 1, N'pic5.jpg', CAST(N'2018-03-02T00:00:00.000' AS DateTime), 1, 16)
INSERT [dbo].[Book] ([id], [title], [author], [ISBN], [language], [description], [status], [coverImg], [createdTime], [creatorID], [categoryID]) VALUES (14, N'Steve Jobs', N'Walter Isaacson', N'1451648537', N'English', N'It is difficult to read the opening pages of Walter Isaacson’s Steve Jobs without feeling melancholic. Jobs retired at the end of August and died about six weeks later. Now, just weeks after his death, you can open the book that bears his name and read about his youth, his promise, and his relentless press to succeed. But the initial sadness in starting the book is soon replaced by something else, which is the intensity of the read--mirroring the intensity of Jobs’s focus and vision for his products. Few in history have transformed their time like Steve Jobs, and one could argue that he stands with the Fords, Edisons, and Gutenbergs of the world. This is a timely and complete portrait that pulls no punches and gives insight into a man whose contradictions were in many ways his greatest strength. ', 1, N'pic6.jpg', CAST(N'2018-04-01T00:00:00.000' AS DateTime), 1, 25)
INSERT [dbo].[Book] ([id], [title], [author], [ISBN], [language], [description], [status], [coverImg], [createdTime], [creatorID], [categoryID]) VALUES (16, N'Software Requirements (3rd Edition) ', N'Karl Wiegers & Joy Beatty', N'0735679665
', N'English', N'From the first edition in 1999 through each successive edition, the guidance that Software Requirements provides has been the foundation of my requirements consulting practice. To beginning and experienced practitioners alike, I cannot recommend this book highly enough.', 1, N'pic7.jpg', CAST(N'2018-01-01T00:00:00.000' AS DateTime), 2, 6)
INSERT [dbo].[Book] ([id], [title], [author], [ISBN], [language], [description], [status], [coverImg], [createdTime], [creatorID], [categoryID]) VALUES (19, N'Chapters of Horror: A collection of Horror stories', N'Rhonda Bilson ', N'34124512', N'English', N'A collection of horror short stories...
Two Goth teenage girls develop a popular Youtube channel where they talk about make-up... proving that the existence of vampires are real. But when they go to investigate an abandoned house where an unsolved "vampire" killing took place, they find out first hand how real vampires really are...', 1, N'pic8.jpg', CAST(N'2018-01-09T00:00:00.000' AS DateTime), 2, 14)
SET IDENTITY_INSERT [dbo].[Book] OFF
INSERT [dbo].[Category] ([id], [name]) VALUES (1, N'Art and music')
INSERT [dbo].[Category] ([id], [name]) VALUES (2, N'Biographies')
INSERT [dbo].[Category] ([id], [name]) VALUES (3, N'Business')
INSERT [dbo].[Category] ([id], [name]) VALUES (4, N'Kids')
INSERT [dbo].[Category] ([id], [name]) VALUES (5, N'Comics')
INSERT [dbo].[Category] ([id], [name]) VALUES (6, N'Computer and Tech')
INSERT [dbo].[Category] ([id], [name]) VALUES (7, N'Cooking')
INSERT [dbo].[Category] ([id], [name]) VALUES (8, N'Hobbies and Crafts')
INSERT [dbo].[Category] ([id], [name]) VALUES (9, N'Edu and Reference')
INSERT [dbo].[Category] ([id], [name]) VALUES (10, N'Gay and Lesbian')
INSERT [dbo].[Category] ([id], [name]) VALUES (11, N'Health and Fitness')
INSERT [dbo].[Category] ([id], [name]) VALUES (12, N'History')
INSERT [dbo].[Category] ([id], [name]) VALUES (13, N'Home and Garden')
INSERT [dbo].[Category] ([id], [name]) VALUES (14, N'Horror')
INSERT [dbo].[Category] ([id], [name]) VALUES (15, N'Entertainment')
INSERT [dbo].[Category] ([id], [name]) VALUES (16, N'Literature and Fiction')
INSERT [dbo].[Category] ([id], [name]) VALUES (17, N'Medical')
INSERT [dbo].[Category] ([id], [name]) VALUES (18, N'Mysteries')
INSERT [dbo].[Category] ([id], [name]) VALUES (19, N'Family')
INSERT [dbo].[Category] ([id], [name]) VALUES (20, N'Social Science')
INSERT [dbo].[Category] ([id], [name]) VALUES (21, N'Religion')
INSERT [dbo].[Category] ([id], [name]) VALUES (22, N'Romance')
INSERT [dbo].[Category] ([id], [name]) VALUES (23, N'Science and Math')
INSERT [dbo].[Category] ([id], [name]) VALUES (24, N'Sci-fi and Fantasy')
INSERT [dbo].[Category] ([id], [name]) VALUES (25, N'Self-help')
INSERT [dbo].[Category] ([id], [name]) VALUES (26, N'Sports')
INSERT [dbo].[Category] ([id], [name]) VALUES (27, N'Teen')
INSERT [dbo].[Category] ([id], [name]) VALUES (28, N'Travel')
INSERT [dbo].[Category] ([id], [name]) VALUES (29, N'True Crime')
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([id], [fullName], [dob], [username], [password], [email], [address], [phoneNum], [linkFacebook], [avatar], [userPoint], [createdTime]) VALUES (1, N'nam nguyen the', CAST(N'1998-10-06' AS Date), N'nam', N'123', N'namnguyen61031@gmail.com', N'Co Nhue, Ha Noi', N'012345678', N'Nam Nguyen Galilei', N'nam.jpg', 0, CAST(N'2018-10-06T22:11:00.000' AS DateTime))
INSERT [dbo].[User] ([id], [fullName], [dob], [username], [password], [email], [address], [phoneNum], [linkFacebook], [avatar], [userPoint], [createdTime]) VALUES (2, N'tuan dao thien', CAST(N'1998-10-12' AS Date), N'tuan', N'123', N'tuandao@gmail.com', N'Dich Vong, Ha Noi', N'012345678', N'Tuan Dao Thien', N'tuan.jpg', 0, CAST(N'2018-03-03T00:00:00.000' AS DateTime))
INSERT [dbo].[User] ([id], [fullName], [dob], [username], [password], [email], [address], [phoneNum], [linkFacebook], [avatar], [userPoint], [createdTime]) VALUES (3, N'nam anh', CAST(N'1998-01-22' AS Date), N'namanh', N'123', N'namanh@gmail.com', N'Cau Dien, Ha Noi', N'012345678', N'Nam Anh Le', N'na.jpg', 0, NULL)
SET IDENTITY_INSERT [dbo].[User] OFF
ALTER TABLE [dbo].[Book]  WITH CHECK ADD  CONSTRAINT [FK_Book_Category] FOREIGN KEY([categoryID])
REFERENCES [dbo].[Category] ([id])
GO
ALTER TABLE [dbo].[Book] CHECK CONSTRAINT [FK_Book_Category]
GO
ALTER TABLE [dbo].[Book]  WITH CHECK ADD  CONSTRAINT [FK_Book_User] FOREIGN KEY([creatorID])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[Book] CHECK CONSTRAINT [FK_Book_User]
GO
ALTER TABLE [dbo].[BookRating]  WITH CHECK ADD  CONSTRAINT [FK_BookRating_Book] FOREIGN KEY([bookID])
REFERENCES [dbo].[Book] ([id])
GO
ALTER TABLE [dbo].[BookRating] CHECK CONSTRAINT [FK_BookRating_Book]
GO
ALTER TABLE [dbo].[BookRating]  WITH CHECK ADD  CONSTRAINT [FK_BookRating_User] FOREIGN KEY([userID])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[BookRating] CHECK CONSTRAINT [FK_BookRating_User]
GO
ALTER TABLE [dbo].[BookReview]  WITH CHECK ADD  CONSTRAINT [FK_BookReview_Book] FOREIGN KEY([bookID])
REFERENCES [dbo].[Book] ([id])
GO
ALTER TABLE [dbo].[BookReview] CHECK CONSTRAINT [FK_BookReview_Book]
GO
ALTER TABLE [dbo].[BookReview]  WITH CHECK ADD  CONSTRAINT [FK_BookReview_User] FOREIGN KEY([userID])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[BookReview] CHECK CONSTRAINT [FK_BookReview_User]
GO
ALTER TABLE [dbo].[TradedBookImage]  WITH CHECK ADD  CONSTRAINT [FK_TradedBookImage_Trading] FOREIGN KEY([tradingID])
REFERENCES [dbo].[Trading] ([id])
GO
ALTER TABLE [dbo].[TradedBookImage] CHECK CONSTRAINT [FK_TradedBookImage_Trading]
GO
ALTER TABLE [dbo].[Trading]  WITH CHECK ADD  CONSTRAINT [FK_Trading_Book] FOREIGN KEY([bookID])
REFERENCES [dbo].[Book] ([id])
GO
ALTER TABLE [dbo].[Trading] CHECK CONSTRAINT [FK_Trading_Book]
GO
ALTER TABLE [dbo].[Trading]  WITH CHECK ADD  CONSTRAINT [FK_Trading_User] FOREIGN KEY([lenderID])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[Trading] CHECK CONSTRAINT [FK_Trading_User]
GO
ALTER TABLE [dbo].[Trading]  WITH CHECK ADD  CONSTRAINT [FK_Trading_User1] FOREIGN KEY([borrowerID])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[Trading] CHECK CONSTRAINT [FK_Trading_User1]
GO
USE [master]
GO
ALTER DATABASE [DBBookShare] SET  READ_WRITE 
GO
