USE [master]
GO
/****** Object:  Database [DBBookShare]    Script Date: 11/17/2018 10:36:05 ******/
CREATE DATABASE [DBBookShare]
USE [DBBookShare]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 11/17/2018 10:36:05 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 11/17/2018 10:36:05 ******/
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
	[address] [nvarchar](max) NULL,
	[phoneNum] [nvarchar](50) NULL,
	[linkFacebook] [nvarchar](200) NULL,
	[avatar] [nvarchar](100) NULL,
	[userPoint] [real] NOT NULL,
	[createdTime] [datetime] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[User] ON
INSERT [dbo].[User] ([id], [fullName], [dob], [username], [password], [email], [address], [phoneNum], [linkFacebook], [avatar], [userPoint], [createdTime]) VALUES (1, N'nam nguyen the', CAST(0x43220B00 AS Date), N'nam', N'123', N'namnguyen61031@gmail.com', N'Co Nhue, Ha Noi', N'012345678', N'Nam Nguyen Galilei', N'nam.jpg', 0, CAST(0x0000A971016D91F0 AS DateTime))
INSERT [dbo].[User] ([id], [fullName], [dob], [username], [password], [email], [address], [phoneNum], [linkFacebook], [avatar], [userPoint], [createdTime]) VALUES (2, N'tuan dao thien', CAST(0x49220B00 AS Date), N'tuan', N'123', N'tuandao@gmail.com', N'Dich Vong, Ha Noi', N'012345678', N'Tuan Dao Thien', N'tuan.jpg', 0, CAST(0x0000A89800000000 AS DateTime))
INSERT [dbo].[User] ([id], [fullName], [dob], [username], [password], [email], [address], [phoneNum], [linkFacebook], [avatar], [userPoint], [createdTime]) VALUES (3, N'nam anh', CAST(0x42210B00 AS Date), N'namanh', N'123', N'namanh@gmail.com', N'Cau Dien, Ha Noi', N'012345678', N'Nam Anh Le', N'na.jpg', 0, CAST(0x0000A8D700000000 AS DateTime))
SET IDENTITY_INSERT [dbo].[User] OFF
/****** Object:  Table [dbo].[Category]    Script Date: 11/17/2018 10:36:05 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
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
/****** Object:  Table [dbo].[Book]    Script Date: 11/17/2018 10:36:05 ******/
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
	[description] [nvarchar](max) NOT NULL,
	[status] [int] NOT NULL,
	[coverImg] [nvarchar](100) NOT NULL,
	[createdTime] [datetime] NOT NULL,
	[creatorID] [int] NOT NULL,
	[categoryID] [int] NOT NULL,
 CONSTRAINT [PK_Book] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Book] ON
INSERT [dbo].[Book] ([id], [title], [author], [ISBN], [language], [description], [status], [coverImg], [createdTime], [creatorID], [categoryID]) VALUES (2, N'How to Win Friends and Influence People', N'Dale Carnegie', N'561107', N'English', N'You can go after the job you want...and get it! You can take the job you have...and improve it! You can take any situation you''re in...and make it work for you!

Since its release in 1936, How to Win Friends and Influence People has sold more than 15 million copies. Dale Carnegie''s first book is a timeless bestseller, packed with rock-solid advice that has carried thousands of now famous people up the ladder of success in their business and personal lives.

As relevant as ever before, Dale Carnegie''s principles endure, and will help you achieve your maximum potential in the complex and competitive modern age.

Learn the six ways to make people like you, the twelve ways to win people to your way of thinking, and the nine ways to change people without arousing resentment.', 1, N'pic1.jpg', CAST(0x0000A96E01601CA0 AS DateTime), 1, 3)
INSERT [dbo].[Book] ([id], [title], [author], [ISBN], [language], [description], [status], [coverImg], [createdTime], [creatorID], [categoryID]) VALUES (6, N'Nhà Giả Kim', N'Paulo Coelho', N'123456', N'Vietnamese', N'Nhà Giả Kim là cuốn sách được in nhiều nhất chỉ sau Kinh Thánh. Cuốn sách của Paulo Coelho có sự hấp dẫn ra sao khiến độc giả không chỉ các xứ dùng ngôn ngữ Bồ Đào Nha mà các ngôn ngữ khác say mê như vậy?

Tất cả những trải nghiệm trong chuyến phiêu du theo đuổi vận mệnh của mình đã giúp Santiago thấu hiểu được ý nghĩa sâu xa nhất của hạnh phúc, hòa hợp với vũ trụ và con người.', 1, N'pic2.jpg', CAST(0x0000A931016D91F0 AS DateTime), 1, 25)
INSERT [dbo].[Book] ([id], [title], [author], [ISBN], [language], [description], [status], [coverImg], [createdTime], [creatorID], [categoryID]) VALUES (8, N'Cà Phê Cùng Tony', N'Tony Buổi Sáng', N'456789', N'Vietnamese', N'…Thật ra Tony hiểu vì sao các bác giáo sư tiến sĩ soạn sách đã phải đưa vào nhiều nội dung như vậy. Rất là tâm huyết và đáng trân trọng. Vì ngày xưa, kiến thức rất khó tìm. Nhiều điều hữu ích chỉ nằm trong sách, trong thư viện các thành phố lớn, các trường các viện đại học lớn và người ta phải nhớ mọi thứ, nên phải cộng điểm cho học sinh nông thôn vì ít cơ hội tiếp cận kiến thức.

Nhưng, bây giờ kiến thức nằm hết trên mạng, trong file máy tính, truy cập là ra ngay, nên các nước đã phải thay đổi chương trình học phổ thông sau khi máy tính và internet ra đời. Học sinh chỉ cần nhớ những gì cốt lõi, và PHƯƠNG PHÁP tìm kiếm tài liệu. Vì chữ nghĩa rồi cũng sẽ rụng rơi theo thời gian, kiến thức mới lại bổ sung liên tục, nên phương pháp tìm kiếm thông tin tốt sẽ giúp ích cho các bạn trong cuộc sống sau này. Làm ngành nghề gì cũng phải cập nhật cái mới…', 1, N'pic3.jpg', CAST(0x0000AA7E016D91F0 AS DateTime), 1, 25)
INSERT [dbo].[Book] ([id], [title], [author], [ISBN], [language], [description], [status], [coverImg], [createdTime], [creatorID], [categoryID]) VALUES (11, N'Tuổi Trẻ Đáng Giá Bao Nhiêu', N'Rosie Nguyễn', N'147258', N'Vietnamese', N'Khi về già, người ta sẽ hối tiếc vì những việc họ không làm hơn là những việc họ đã làm.

Tuổi trẻ ngắn ngủi lắm, đừng vùi chân ở một chốn nào đó mà bạn không thích, cặm cụi sáng đi tối về và lặp lại vòng luẩn quẩn bán tuổi trẻ lấy chút tiền. Suy cho cùng Tuổi Trẻ Đáng Giá Bao Nhiêu để bạn phải đánh đổi?', 1, N'pic4.jpg', CAST(0x0000A89A00C90CC0 AS DateTime), 1, 25)
INSERT [dbo].[Book] ([id], [title], [author], [ISBN], [language], [description], [status], [coverImg], [createdTime], [creatorID], [categoryID]) VALUES (12, N'White Fang', N'Jack London', N'9781505313109', N'English', N'White Fang is a novel by American author Jack London (1876–1916) — and the name of the book''s eponymous character, a wild wolfdog. First serialized in Outing magazine, it was published in 1906. The story takes place in Yukon Territory and the Northwest Territories, Canada, during the 1890s Klondike Gold Rush and details White Fang''s journey to domestication. It is a companion novel (and a thematic mirror) to London''s best-known work, The Call of the Wild, which is about a kidnapped, domesticated dog embracing his wild ancestry to survive and thrive in the wild.', 1, N'pic5.jpg', CAST(0x0000A89700000000 AS DateTime), 1, 16)
INSERT [dbo].[Book] ([id], [title], [author], [ISBN], [language], [description], [status], [coverImg], [createdTime], [creatorID], [categoryID]) VALUES (14, N'Steve Jobs', N'Walter Isaacson', N'1451648537', N'English', N'It is difficult to read the opening pages of Walter Isaacson’s Steve Jobs without feeling melancholic. Jobs retired at the end of August and died about six weeks later. Now, just weeks after his death, you can open the book that bears his name and read about his youth, his promise, and his relentless press to succeed. But the initial sadness in starting the book is soon replaced by something else, which is the intensity of the read--mirroring the intensity of Jobs’s focus and vision for his products. Few in history have transformed their time like Steve Jobs, and one could argue that he stands with the Fords, Edisons, and Gutenbergs of the world. This is a timely and complete portrait that pulls no punches and gives insight into a man whose contradictions were in many ways his greatest strength. ', 1, N'pic6.jpg', CAST(0x0000A8B500000000 AS DateTime), 1, 25)
INSERT [dbo].[Book] ([id], [title], [author], [ISBN], [language], [description], [status], [coverImg], [createdTime], [creatorID], [categoryID]) VALUES (16, N'Software Requirements (3rd Edition) ', N'Karl Wiegers & Joy Beatty', N'0735679665
', N'English', N'From the first edition in 1999 through each successive edition, the guidance that Software Requirements provides has been the foundation of my requirements consulting practice. To beginning and experienced practitioners alike, I cannot recommend this book highly enough.', 1, N'pic7.jpg', CAST(0x0000A85B00000000 AS DateTime), 2, 6)
INSERT [dbo].[Book] ([id], [title], [author], [ISBN], [language], [description], [status], [coverImg], [createdTime], [creatorID], [categoryID]) VALUES (19, N'Chapters of Horror: A collection of Horror stories', N'Rhonda Bilson ', N'34124512', N'English', N'A collection of horror short stories...
Two Goth teenage girls develop a popular Youtube channel where they talk about make-up... proving that the existence of vampires are real. But when they go to investigate an abandoned house where an unsolved "vampire" killing took place, they find out first hand how real vampires really are...', 1, N'pic8.jpg', CAST(0x0000A86300000000 AS DateTime), 2, 14)
SET IDENTITY_INSERT [dbo].[Book] OFF
/****** Object:  Table [dbo].[BookReview]    Script Date: 11/17/2018 10:36:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookReview](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[content] [nvarchar](max) NOT NULL,
	[createdTime] [datetime] NOT NULL,
	[userID] [int] NOT NULL,
	[bookID] [int] NOT NULL,
 CONSTRAINT [PK_BookReview] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BookRating]    Script Date: 11/17/2018 10:36:05 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Trading]    Script Date: 11/17/2018 10:36:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Trading](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[description] [nvarchar](max) NOT NULL,
	[tradingStatus] [int] NOT NULL,
	[completedTime] [datetime] NULL,
	[lenderRatePoint] [real] NULL,
	[borrowerRatePoint] [real] NULL,
	[bookID] [int] NOT NULL,
	[lenderID] [int] NOT NULL,
	[borrowerID] [int] NULL,
 CONSTRAINT [PK_Trading] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Trading] ON
INSERT [dbo].[Trading] ([id], [description], [tradingStatus], [completedTime], [lenderRatePoint], [borrowerRatePoint], [bookID], [lenderID], [borrowerID]) VALUES (4, N'Sách like new, mua tầm hơn năm, mép sau hơi quăn', 0, CAST(0x0000A89700000000 AS DateTime), NULL, NULL, 8, 1, NULL)
INSERT [dbo].[Trading] ([id], [description], [tradingStatus], [completedTime], [lenderRatePoint], [borrowerRatePoint], [bookID], [lenderID], [borrowerID]) VALUES (7, N'Sách khá cũ, nhưng giấy vẫn còn thơm', 0, CAST(0x0000A85B00000000 AS DateTime), NULL, NULL, 8, 2, NULL)
INSERT [dbo].[Trading] ([id], [description], [tradingStatus], [completedTime], [lenderRatePoint], [borrowerRatePoint], [bookID], [lenderID], [borrowerID]) VALUES (9, N'Sách mưa hôm qua, nhưng mà lười đọc quá nên bạn nào có nhu cầu mình cho mượn', 0, CAST(0x0000A99300000000 AS DateTime), NULL, NULL, 2, 3, NULL)
INSERT [dbo].[Trading] ([id], [description], [tradingStatus], [completedTime], [lenderRatePoint], [borrowerRatePoint], [bookID], [lenderID], [borrowerID]) VALUES (12, N'Sách bìa cứng, đã tưng bị đở nước vào', 0, CAST(0x0000A91800000000 AS DateTime), NULL, NULL, 2, 1, NULL)
INSERT [dbo].[Trading] ([id], [description], [tradingStatus], [completedTime], [lenderRatePoint], [borrowerRatePoint], [bookID], [lenderID], [borrowerID]) VALUES (14, N'Sách bìa cứng, đã tưng bị đở nước vào', 0, CAST(0x0000A8D700000000 AS DateTime), NULL, NULL, 6, 2, NULL)
INSERT [dbo].[Trading] ([id], [description], [tradingStatus], [completedTime], [lenderRatePoint], [borrowerRatePoint], [bookID], [lenderID], [borrowerID]) VALUES (16, N'Sách bìa cứng, đã tưng bị đở nước vào', 0, CAST(0x0000A89700000000 AS DateTime), NULL, NULL, 14, 3, NULL)
INSERT [dbo].[Trading] ([id], [description], [tradingStatus], [completedTime], [lenderRatePoint], [borrowerRatePoint], [bookID], [lenderID], [borrowerID]) VALUES (17, N'Sách bìa cứng, đã tưng bị đở nước vào', 0, CAST(0x0000A89600000000 AS DateTime), NULL, NULL, 11, 3, NULL)
INSERT [dbo].[Trading] ([id], [description], [tradingStatus], [completedTime], [lenderRatePoint], [borrowerRatePoint], [bookID], [lenderID], [borrowerID]) VALUES (18, N'Sách bìa cứng, đã tưng bị đở nước vào', 0, CAST(0x0000A8BB00000000 AS DateTime), NULL, NULL, 12, 1, NULL)
INSERT [dbo].[Trading] ([id], [description], [tradingStatus], [completedTime], [lenderRatePoint], [borrowerRatePoint], [bookID], [lenderID], [borrowerID]) VALUES (20, N'Sách bìa cứng, đã tưng bị đở nước vào', 0, CAST(0x0000A99600000000 AS DateTime), NULL, NULL, 19, 2, NULL)
INSERT [dbo].[Trading] ([id], [description], [tradingStatus], [completedTime], [lenderRatePoint], [borrowerRatePoint], [bookID], [lenderID], [borrowerID]) VALUES (22, N'Sách bìa cứng, đã tưng bị đở nước vào', 0, CAST(0x0000A91600000000 AS DateTime), NULL, NULL, 16, 2, NULL)
INSERT [dbo].[Trading] ([id], [description], [tradingStatus], [completedTime], [lenderRatePoint], [borrowerRatePoint], [bookID], [lenderID], [borrowerID]) VALUES (24, N'Sách còn rất mới, chỉ mới đọc vài lần', 0, CAST(0x0000A99B00AC518F AS DateTime), NULL, NULL, 6, 1, NULL)
INSERT [dbo].[Trading] ([id], [description], [tradingStatus], [completedTime], [lenderRatePoint], [borrowerRatePoint], [bookID], [lenderID], [borrowerID]) VALUES (25, N'Sách mình mới mua trên tiki, chưa đọc nhiều, vẫn còn nguyên tem', 0, CAST(0x0000A99B00AD9349 AS DateTime), NULL, NULL, 2, 2, NULL)
INSERT [dbo].[Trading] ([id], [description], [tradingStatus], [completedTime], [lenderRatePoint], [borrowerRatePoint], [bookID], [lenderID], [borrowerID]) VALUES (26, N'Phiên bản tiếng anh, không có nhu cầu sử dụng nữa nên muốn cho mượn', 0, CAST(0x0000A99B00AE3A73 AS DateTime), NULL, NULL, 6, 2, NULL)
SET IDENTITY_INSERT [dbo].[Trading] OFF
/****** Object:  Table [dbo].[TradedBookImage]    Script Date: 11/17/2018 10:36:05 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[TradedBookImage] ON
INSERT [dbo].[TradedBookImage] ([id], [image], [tradingID]) VALUES (3, N'24_131868988435729406_1.jpg', 24)
INSERT [dbo].[TradedBookImage] ([id], [image], [tradingID]) VALUES (4, N'24_131868988435827002_2.jpg', 24)
INSERT [dbo].[TradedBookImage] ([id], [image], [tradingID]) VALUES (5, N'24_131868988436159394_3.jpg', 24)
INSERT [dbo].[TradedBookImage] ([id], [image], [tradingID]) VALUES (6, N'24_131868988436237477_4.jpg', 24)
INSERT [dbo].[TradedBookImage] ([id], [image], [tradingID]) VALUES (7, N'24_131868988436322156_5.jpg', 24)
INSERT [dbo].[TradedBookImage] ([id], [image], [tradingID]) VALUES (8, N'25_131868991181110451_1.jpg', 25)
INSERT [dbo].[TradedBookImage] ([id], [image], [tradingID]) VALUES (9, N'25_131868991181178788_2.jpg', 25)
INSERT [dbo].[TradedBookImage] ([id], [image], [tradingID]) VALUES (10, N'25_131868991181257141_3.jpg', 25)
INSERT [dbo].[TradedBookImage] ([id], [image], [tradingID]) VALUES (11, N'25_131868991181325238_4.jpg', 25)
INSERT [dbo].[TradedBookImage] ([id], [image], [tradingID]) VALUES (12, N'26_131868992607604319_1.jpg', 26)
INSERT [dbo].[TradedBookImage] ([id], [image], [tradingID]) VALUES (13, N'26_131868992607711490_2.jpg', 26)
INSERT [dbo].[TradedBookImage] ([id], [image], [tradingID]) VALUES (14, N'26_131868992607818896_3.jpg', 26)
SET IDENTITY_INSERT [dbo].[TradedBookImage] OFF
/****** Object:  ForeignKey [FK_Book_Category]    Script Date: 11/17/2018 10:36:05 ******/
ALTER TABLE [dbo].[Book]  WITH CHECK ADD  CONSTRAINT [FK_Book_Category] FOREIGN KEY([categoryID])
REFERENCES [dbo].[Category] ([id])
GO
ALTER TABLE [dbo].[Book] CHECK CONSTRAINT [FK_Book_Category]
GO
/****** Object:  ForeignKey [FK_Book_User]    Script Date: 11/17/2018 10:36:05 ******/
ALTER TABLE [dbo].[Book]  WITH CHECK ADD  CONSTRAINT [FK_Book_User] FOREIGN KEY([creatorID])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[Book] CHECK CONSTRAINT [FK_Book_User]
GO
/****** Object:  ForeignKey [FK_BookReview_Book]    Script Date: 11/17/2018 10:36:05 ******/
ALTER TABLE [dbo].[BookReview]  WITH CHECK ADD  CONSTRAINT [FK_BookReview_Book] FOREIGN KEY([bookID])
REFERENCES [dbo].[Book] ([id])
GO
ALTER TABLE [dbo].[BookReview] CHECK CONSTRAINT [FK_BookReview_Book]
GO
/****** Object:  ForeignKey [FK_BookReview_User]    Script Date: 11/17/2018 10:36:05 ******/
ALTER TABLE [dbo].[BookReview]  WITH CHECK ADD  CONSTRAINT [FK_BookReview_User] FOREIGN KEY([userID])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[BookReview] CHECK CONSTRAINT [FK_BookReview_User]
GO
/****** Object:  ForeignKey [FK_BookRating_Book]    Script Date: 11/17/2018 10:36:05 ******/
ALTER TABLE [dbo].[BookRating]  WITH CHECK ADD  CONSTRAINT [FK_BookRating_Book] FOREIGN KEY([bookID])
REFERENCES [dbo].[Book] ([id])
GO
ALTER TABLE [dbo].[BookRating] CHECK CONSTRAINT [FK_BookRating_Book]
GO
/****** Object:  ForeignKey [FK_BookRating_User]    Script Date: 11/17/2018 10:36:05 ******/
ALTER TABLE [dbo].[BookRating]  WITH CHECK ADD  CONSTRAINT [FK_BookRating_User] FOREIGN KEY([userID])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[BookRating] CHECK CONSTRAINT [FK_BookRating_User]
GO
/****** Object:  ForeignKey [FK_Trading_Book]    Script Date: 11/17/2018 10:36:05 ******/
ALTER TABLE [dbo].[Trading]  WITH CHECK ADD  CONSTRAINT [FK_Trading_Book] FOREIGN KEY([bookID])
REFERENCES [dbo].[Book] ([id])
GO
ALTER TABLE [dbo].[Trading] CHECK CONSTRAINT [FK_Trading_Book]
GO
/****** Object:  ForeignKey [FK_Trading_User]    Script Date: 11/17/2018 10:36:05 ******/
ALTER TABLE [dbo].[Trading]  WITH CHECK ADD  CONSTRAINT [FK_Trading_User] FOREIGN KEY([lenderID])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[Trading] CHECK CONSTRAINT [FK_Trading_User]
GO
/****** Object:  ForeignKey [FK_Trading_User1]    Script Date: 11/17/2018 10:36:05 ******/
ALTER TABLE [dbo].[Trading]  WITH CHECK ADD  CONSTRAINT [FK_Trading_User1] FOREIGN KEY([borrowerID])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[Trading] CHECK CONSTRAINT [FK_Trading_User1]
GO
/****** Object:  ForeignKey [FK_TradedBookImage_Trading]    Script Date: 11/17/2018 10:36:05 ******/
ALTER TABLE [dbo].[TradedBookImage]  WITH CHECK ADD  CONSTRAINT [FK_TradedBookImage_Trading] FOREIGN KEY([tradingID])
REFERENCES [dbo].[Trading] ([id])
GO
ALTER TABLE [dbo].[TradedBookImage] CHECK CONSTRAINT [FK_TradedBookImage_Trading]
GO
