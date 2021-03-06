USE [master]
GO
/****** Object:  Database [DBBookShare]    Script Date: 11/19/2018 12:33:29 PM ******/
CREATE DATABASE [DBBookShare]
GO
USE [DBBookShare]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 11/19/2018 12:33:30 PM ******/
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
/****** Object:  Table [dbo].[Book]    Script Date: 11/19/2018 12:33:30 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BookRating]    Script Date: 11/19/2018 12:33:30 PM ******/
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
/****** Object:  Table [dbo].[BookReview]    Script Date: 11/19/2018 12:33:30 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 11/19/2018 12:33:30 PM ******/
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
/****** Object:  Table [dbo].[TradedBookImage]    Script Date: 11/19/2018 12:33:30 PM ******/
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
/****** Object:  Table [dbo].[Trading]    Script Date: 11/19/2018 12:33:30 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 11/19/2018 12:33:30 PM ******/
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
	[status] [int] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[Admin] ([id], [username], [password]) VALUES (1, N'nam', N'123')
INSERT [dbo].[Admin] ([id], [username], [password]) VALUES (2, N'minh', N'123')
SET IDENTITY_INSERT [dbo].[Book] ON 

INSERT [dbo].[Book] ([id], [title], [author], [ISBN], [language], [description], [status], [coverImg], [createdTime], [creatorID], [categoryID]) VALUES (2, N'How to Win Friends and Influence People', N'Dale Carnegie', N'561107', N'English', N'You can go after the job you want...and get it! You can take the job you have...and improve it! You can take any situation you''re in...and make it work for you!

Since its release in 1936, How to Win Friends and Influence People has sold more than 15 million copies. Dale Carnegie''s first book is a timeless bestseller, packed with rock-solid advice that has carried thousands of now famous people up the ladder of success in their business and personal lives.

As relevant as ever before, Dale Carnegie''s principles endure, and will help you achieve your maximum potential in the complex and competitive modern age.

Learn the six ways to make people like you, the twelve ways to win people to your way of thinking, and the nine ways to change people without arousing resentment.', 1, N'pic1.jpg', CAST(N'2018-10-03T21:22:00.000' AS DateTime), 1, 3)
INSERT [dbo].[Book] ([id], [title], [author], [ISBN], [language], [description], [status], [coverImg], [createdTime], [creatorID], [categoryID]) VALUES (6, N'Nhà Giả Kim', N'Paulo Coelho', N'123456', N'Vietnamese', N'Nhà Giả Kim là cuốn sách được in nhiều nhất chỉ sau Kinh Thánh. Cuốn sách của Paulo Coelho có sự hấp dẫn ra sao khiến độc giả không chỉ các xứ dùng ngôn ngữ Bồ Đào Nha mà các ngôn ngữ khác say mê như vậy?

Tất cả những trải nghiệm trong chuyến phiêu du theo đuổi vận mệnh của mình đã giúp Santiago thấu hiểu được ý nghĩa sâu xa nhất của hạnh phúc, hòa hợp với vũ trụ và con người.', 1, N'pic2.jpg', CAST(N'2018-08-03T22:11:00.000' AS DateTime), 1, 25)
INSERT [dbo].[Book] ([id], [title], [author], [ISBN], [language], [description], [status], [coverImg], [createdTime], [creatorID], [categoryID]) VALUES (8, N'Cà Phê Cùng Tony', N'Tony Buổi Sáng', N'456789', N'Vietnamese', N'…Thật ra Tony hiểu vì sao các bác giáo sư tiến sĩ soạn sách đã phải đưa vào nhiều nội dung như vậy. Rất là tâm huyết và đáng trân trọng. Vì ngày xưa, kiến thức rất khó tìm. Nhiều điều hữu ích chỉ nằm trong sách, trong thư viện các thành phố lớn, các trường các viện đại học lớn và người ta phải nhớ mọi thứ, nên phải cộng điểm cho học sinh nông thôn vì ít cơ hội tiếp cận kiến thức.

Nhưng, bây giờ kiến thức nằm hết trên mạng, trong file máy tính, truy cập là ra ngay, nên các nước đã phải thay đổi chương trình học phổ thông sau khi máy tính và internet ra đời. Học sinh chỉ cần nhớ những gì cốt lõi, và PHƯƠNG PHÁP tìm kiếm tài liệu. Vì chữ nghĩa rồi cũng sẽ rụng rơi theo thời gian, kiến thức mới lại bổ sung liên tục, nên phương pháp tìm kiếm thông tin tốt sẽ giúp ích cho các bạn trong cuộc sống sau này. Làm ngành nghề gì cũng phải cập nhật cái mới…', 1, N'pic3.jpg', CAST(N'2019-07-02T22:11:00.000' AS DateTime), 1, 25)
INSERT [dbo].[Book] ([id], [title], [author], [ISBN], [language], [description], [status], [coverImg], [createdTime], [creatorID], [categoryID]) VALUES (11, N'Tuổi Trẻ Đáng Giá Bao Nhiêu', N'Rosie Nguyễn', N'147258', N'Vietnamese', N'Khi về già, người ta sẽ hối tiếc vì những việc họ không làm hơn là những việc họ đã làm.

Tuổi trẻ ngắn ngủi lắm, đừng vùi chân ở một chốn nào đó mà bạn không thích, cặm cụi sáng đi tối về và lặp lại vòng luẩn quẩn bán tuổi trẻ lấy chút tiền. Suy cho cùng Tuổi Trẻ Đáng Giá Bao Nhiêu để bạn phải đánh đổi?', 1, N'pic4.jpg', CAST(N'2018-03-05T12:12:00.000' AS DateTime), 1, 25)
INSERT [dbo].[Book] ([id], [title], [author], [ISBN], [language], [description], [status], [coverImg], [createdTime], [creatorID], [categoryID]) VALUES (12, N'White Fang', N'Jack London', N'9781505313109', N'English', N'White Fang is a novel by American author Jack London (1876–1916) — and the name of the book''s eponymous character, a wild wolfdog. First serialized in Outing magazine, it was published in 1906. The story takes place in Yukon Territory and the Northwest Territories, Canada, during the 1890s Klondike Gold Rush and details White Fang''s journey to domestication. It is a companion novel (and a thematic mirror) to London''s best-known work, The Call of the Wild, which is about a kidnapped, domesticated dog embracing his wild ancestry to survive and thrive in the wild.', 1, N'pic5.jpg', CAST(N'2018-03-02T00:00:00.000' AS DateTime), 1, 16)
INSERT [dbo].[Book] ([id], [title], [author], [ISBN], [language], [description], [status], [coverImg], [createdTime], [creatorID], [categoryID]) VALUES (14, N'Steve Jobs', N'Walter Isaacson', N'1451648537', N'English', N'It is difficult to read the opening pages of Walter Isaacson’s Steve Jobs without feeling melancholic. Jobs retired at the end of August and died about six weeks later. Now, just weeks after his death, you can open the book that bears his name and read about his youth, his promise, and his relentless press to succeed. But the initial sadness in starting the book is soon replaced by something else, which is the intensity of the read--mirroring the intensity of Jobs’s focus and vision for his products. Few in history have transformed their time like Steve Jobs, and one could argue that he stands with the Fords, Edisons, and Gutenbergs of the world. This is a timely and complete portrait that pulls no punches and gives insight into a man whose contradictions were in many ways his greatest strength. ', 1, N'pic6.jpg', CAST(N'2018-04-01T00:00:00.000' AS DateTime), 1, 25)
INSERT [dbo].[Book] ([id], [title], [author], [ISBN], [language], [description], [status], [coverImg], [createdTime], [creatorID], [categoryID]) VALUES (16, N'Software Requirements (3rd Edition) ', N'Karl Wiegers & Joy Beatty', N'0735679665', N'English', N'From the first edition in 1999 through each successive edition, the guidance that Software Requirements provides has been the foundation of my requirements consulting practice. To beginning and experienced practitioners alike, I cannot recommend this book highly enough.', 1, N'pic7.jpg', CAST(N'2018-01-01T00:00:00.000' AS DateTime), 2, 6)
INSERT [dbo].[Book] ([id], [title], [author], [ISBN], [language], [description], [status], [coverImg], [createdTime], [creatorID], [categoryID]) VALUES (19, N'Chapters of Horror: A collection of Horror stories', N'Rhonda Bilson ', N'34124512', N'English', N'A collection of horror short stories...
Two Goth teenage girls develop a popular Youtube channel where they talk about make-up... proving that the existence of vampires are real. But when they go to investigate an abandoned house where an unsolved "vampire" killing took place, they find out first hand how real vampires really are...', 1, N'pic8.jpg', CAST(N'2018-01-09T00:00:00.000' AS DateTime), 2, 14)
INSERT [dbo].[Book] ([id], [title], [author], [ISBN], [language], [description], [status], [coverImg], [createdTime], [creatorID], [categoryID]) VALUES (20, N'Fifty shades of grey', N'E L James', N'41212829', N'English', N'MORE THAN 100 MILLION COPIES SOLD WORLDWIDE NOW A MAJOR MOTION PICTURE When literature student Anastasia Steele goes to interview young entrepreneur Christian Grey, she encounters a man who is beautiful, brilliant, and intimidating. The unworldly, innocent Ana is startled to realize she wants this man and, despite his enigmatic reserve, finds she is desperate to get close to him. Unable to resist Ana''s quiet beauty, wit, and independent spirit, Grey admits he wants her, too--but on his own terms. Shocked yet thrilled by Grey''s singular erotic tastes, Ana hesitates. For all the trappings of success--his multinational businesses, his vast wealth, his loving family--Grey is a man tormented by demons and consumed by the need to control. When the couple embarks on a daring, passionately physical affair, Ana discovers Christian Grey''s secrets and explores her own dark desires. This book is intended for mature audiences.', 0, N'pic9.jpg', CAST(N'2018-03-11T00:00:00.000' AS DateTime), 3, 22)
INSERT [dbo].[Book] ([id], [title], [author], [ISBN], [language], [description], [status], [coverImg], [createdTime], [creatorID], [categoryID]) VALUES (22, N'Daughters of the Night Sky ', N'Aimie K. Runyan ', N'154204586', N'English', N'Russia, 1941. Katya Ivanova is a young pilot in a far-flung military academy in the Ural Mountains. From childhood, she’s dreamed of taking to the skies to escape her bleak mountain life. With the Nazis on the march across Europe, she is called on to use her wings to serve her country in its darkest hour. Not even the entreaties of her new husband—a sensitive artist who fears for her safety—can dissuade her from doing her part as a proud daughter of Russia.', 0, N'pic10.jpg', CAST(N'2018-11-09T00:00:00.000' AS DateTime), 3, 16)
INSERT [dbo].[Book] ([id], [title], [author], [ISBN], [language], [description], [status], [coverImg], [createdTime], [creatorID], [categoryID]) VALUES (23, N'Presidents of War', N'Michael Beschloss', N'9780307409607', N'English', N'Ten years in the research and writing, Presidents of War is a fresh, magisterial, intimate look at a procession of American leaders as they took the nation into conflict and mobilized their country for victory. It brings us into the room as they make the most difficult decisions that face any President, at times sending hundreds of thousands of American men and women to their deaths. ', 0, N'pic11.jpg', CAST(N'2017-11-03T00:00:00.000' AS DateTime), 3, 12)
INSERT [dbo].[Book] ([id], [title], [author], [ISBN], [language], [description], [status], [coverImg], [createdTime], [creatorID], [categoryID]) VALUES (25, N'Fantastic Beasts and Where to Find Them: The Original Screenplay', N'J.K Rowling', N'1338109065', N'English', N'J.K. Rowling''s screenwriting debut is captured in this exciting hardcover edition of the Fantastic Beasts and Where to Find Them screenplay.

When Magizoologist Newt Scamander arrives in New York, he intends his stay to be just a brief stopover. However, when his magical case is misplaced and some of Newt''s fantastic beasts escape, it spells trouble for everyone…

Fantastic Beasts and Where to Find Them marks the screenwriting debut of J.K. Rowling, author of the beloved and internationally bestselling Harry Potter books. Featuring a cast of remarkable characters, this is epic, adventure-packed storytelling at its very best.', 0, N'pic12.jpg', CAST(N'2018-10-22T00:00:00.000' AS DateTime), 2, 24)
INSERT [dbo].[Book] ([id], [title], [author], [ISBN], [language], [description], [status], [coverImg], [createdTime], [creatorID], [categoryID]) VALUES (26, N'Harry Potter and the Prisoner of Azkaban', N'J.K Rowling', N'0545791340', N'English', N'For twelve long years, the dread fortress of Azkaban held an infamous prisoner named Sirius Black. Convicted of killing thirteen people with a single curse, he was said to be the heir apparent to the Dark Lord, Voldemort.

Now he has escaped, leaving only two clues as to where he might be headed: Harry Potter''s defeat of You-Know-Who was Black''s downfall as well. And the Azkaban guards heard Black muttering in his sleep, "He''s at Hogwarts . . . he''s at Hogwarts."

Harry Potter isn''t safe, not even within the walls of his magical school, surrounded by his friends. Because on top of it all, there may well be a traitor in their midst.', 0, N'pic13.jpg', CAST(N'2018-06-06T00:00:00.000' AS DateTime), 1, 24)
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
INSERT [dbo].[TradedBookImage] ([id], [image], [tradingID]) VALUES (15, N'27_131871297914863387_1.jpg', 27)
INSERT [dbo].[TradedBookImage] ([id], [image], [tradingID]) VALUES (16, N'27_131871297915259326_2.jpg', 27)
INSERT [dbo].[TradedBookImage] ([id], [image], [tradingID]) VALUES (17, N'28_131871298915093214_1.jpg', 28)
INSERT [dbo].[TradedBookImage] ([id], [image], [tradingID]) VALUES (18, N'28_131871298915166202_2.jpg', 28)
INSERT [dbo].[TradedBookImage] ([id], [image], [tradingID]) VALUES (19, N'29_131871299449692259_1.jpg', 29)
INSERT [dbo].[TradedBookImage] ([id], [image], [tradingID]) VALUES (20, N'29_131871299449824229_2.jpg', 29)
INSERT [dbo].[TradedBookImage] ([id], [image], [tradingID]) VALUES (21, N'29_131871299449961829_3.jpg', 29)
INSERT [dbo].[TradedBookImage] ([id], [image], [tradingID]) VALUES (22, N'30_131871300138811225_1.jpg', 30)
INSERT [dbo].[TradedBookImage] ([id], [image], [tradingID]) VALUES (23, N'30_131871300138939537_2.jpg', 30)
INSERT [dbo].[TradedBookImage] ([id], [image], [tradingID]) VALUES (24, N'30_131871300139036801_3.jpg', 30)
INSERT [dbo].[TradedBookImage] ([id], [image], [tradingID]) VALUES (25, N'31_131871304405202061_1.jpg', 31)
INSERT [dbo].[TradedBookImage] ([id], [image], [tradingID]) VALUES (26, N'31_131871304405350209_2.jpg', 31)
INSERT [dbo].[TradedBookImage] ([id], [image], [tradingID]) VALUES (27, N'31_131871304405446964_3.jpg', 31)
INSERT [dbo].[TradedBookImage] ([id], [image], [tradingID]) VALUES (28, N'32_131871305156317185_1.jpg', 32)
INSERT [dbo].[TradedBookImage] ([id], [image], [tradingID]) VALUES (29, N'32_131871305156547106_2.jpg', 32)
INSERT [dbo].[TradedBookImage] ([id], [image], [tradingID]) VALUES (30, N'33_131871305802451725_1.jpg', 33)
INSERT [dbo].[TradedBookImage] ([id], [image], [tradingID]) VALUES (31, N'33_131871305802496742_2.jpg', 33)
INSERT [dbo].[TradedBookImage] ([id], [image], [tradingID]) VALUES (32, N'33_131871305802626500_3.jpg', 33)
INSERT [dbo].[TradedBookImage] ([id], [image], [tradingID]) VALUES (33, N'34_131871306768109628_1.jpg', 34)
INSERT [dbo].[TradedBookImage] ([id], [image], [tradingID]) VALUES (34, N'34_131871306768239066_2.jpg', 34)
INSERT [dbo].[TradedBookImage] ([id], [image], [tradingID]) VALUES (35, N'34_131871306768319785_3.jpg', 34)
INSERT [dbo].[TradedBookImage] ([id], [image], [tradingID]) VALUES (36, N'35_131871307520538503_1.jpg', 35)
INSERT [dbo].[TradedBookImage] ([id], [image], [tradingID]) VALUES (37, N'35_131871307520634073_2.jpg', 35)
INSERT [dbo].[TradedBookImage] ([id], [image], [tradingID]) VALUES (38, N'35_131871307520673993_3.jpg', 35)
INSERT [dbo].[TradedBookImage] ([id], [image], [tradingID]) VALUES (39, N'36_131871307943669647_1.jpg', 36)
INSERT [dbo].[TradedBookImage] ([id], [image], [tradingID]) VALUES (40, N'36_131871307943711417_2.jpg', 36)
INSERT [dbo].[TradedBookImage] ([id], [image], [tradingID]) VALUES (41, N'37_131871309604059715_1.jpg', 37)
INSERT [dbo].[TradedBookImage] ([id], [image], [tradingID]) VALUES (42, N'37_131871309604221227_2.jpg', 37)
INSERT [dbo].[TradedBookImage] ([id], [image], [tradingID]) VALUES (43, N'38_131871310113970703_1.jpg', 38)
INSERT [dbo].[TradedBookImage] ([id], [image], [tradingID]) VALUES (44, N'38_131871310114031962_2.jpg', 38)
INSERT [dbo].[TradedBookImage] ([id], [image], [tradingID]) VALUES (45, N'39_131871310883456634_1.jpg', 39)
INSERT [dbo].[TradedBookImage] ([id], [image], [tradingID]) VALUES (46, N'39_131871310883583188_2.jpg', 39)
INSERT [dbo].[TradedBookImage] ([id], [image], [tradingID]) VALUES (47, N'39_131871310883709287_3.jpg', 39)
SET IDENTITY_INSERT [dbo].[TradedBookImage] OFF
SET IDENTITY_INSERT [dbo].[Trading] ON 

INSERT [dbo].[Trading] ([id], [description], [tradingStatus], [completedTime], [lenderRatePoint], [borrowerRatePoint], [bookID], [lenderID], [borrowerID]) VALUES (24, N'Sách còn rất mới, chỉ mới đọc vài lần', 0, CAST(N'2018-11-17T10:27:23.570' AS DateTime), NULL, NULL, 6, 1, NULL)
INSERT [dbo].[Trading] ([id], [description], [tradingStatus], [completedTime], [lenderRatePoint], [borrowerRatePoint], [bookID], [lenderID], [borrowerID]) VALUES (25, N'Sách mình mới mua trên tiki, chưa đọc nhiều, vẫn còn nguyên tem', 0, CAST(N'2018-11-17T10:31:58.110' AS DateTime), NULL, NULL, 2, 2, NULL)
INSERT [dbo].[Trading] ([id], [description], [tradingStatus], [completedTime], [lenderRatePoint], [borrowerRatePoint], [bookID], [lenderID], [borrowerID]) VALUES (26, N'Phiên bản tiếng anh, không có nhu cầu sử dụng nữa nên muốn cho mượn', 0, CAST(N'2018-11-17T10:34:20.757' AS DateTime), NULL, NULL, 6, 2, NULL)
INSERT [dbo].[Trading] ([id], [description], [tradingStatus], [completedTime], [lenderRatePoint], [borrowerRatePoint], [bookID], [lenderID], [borrowerID]) VALUES (27, N'Một cuốn sách rất hay với những mẩu chuyện thú vị và rất thực tế', 0, CAST(N'2018-11-19T11:36:31.440' AS DateTime), NULL, NULL, 8, 3, NULL)
INSERT [dbo].[Trading] ([id], [description], [tradingStatus], [completedTime], [lenderRatePoint], [borrowerRatePoint], [bookID], [lenderID], [borrowerID]) VALUES (28, N'Những câu chuyện đáng giá về định hướng và sống hết mình với tuổi trẻ', 0, CAST(N'2018-11-19T11:38:11.507' AS DateTime), NULL, NULL, 11, 3, NULL)
INSERT [dbo].[Trading] ([id], [description], [tradingStatus], [completedTime], [lenderRatePoint], [borrowerRatePoint], [bookID], [lenderID], [borrowerID]) VALUES (29, N'Một trong những tấc phẩm kinh điển của JackLondon', 0, CAST(N'2018-11-19T11:39:04.963' AS DateTime), NULL, NULL, 12, 3, NULL)
INSERT [dbo].[Trading] ([id], [description], [tradingStatus], [completedTime], [lenderRatePoint], [borrowerRatePoint], [bookID], [lenderID], [borrowerID]) VALUES (30, N'Cuộc đời và sự nghiệp của thiên tài Steve Jobs', 0, CAST(N'2018-11-19T11:40:13.877' AS DateTime), NULL, NULL, 14, 3, NULL)
INSERT [dbo].[Trading] ([id], [description], [tradingStatus], [completedTime], [lenderRatePoint], [borrowerRatePoint], [bookID], [lenderID], [borrowerID]) VALUES (31, N'Sách chuyên ngành SE', 0, CAST(N'2018-11-19T11:47:20.517' AS DateTime), NULL, NULL, 16, 3, NULL)
INSERT [dbo].[Trading] ([id], [description], [tradingStatus], [completedTime], [lenderRatePoint], [borrowerRatePoint], [bookID], [lenderID], [borrowerID]) VALUES (32, N'Một cuốn sách hay để bắt đầu ngày mới', 0, CAST(N'2018-11-19T11:48:35.627' AS DateTime), NULL, NULL, 8, 1, NULL)
INSERT [dbo].[Trading] ([id], [description], [tradingStatus], [completedTime], [lenderRatePoint], [borrowerRatePoint], [bookID], [lenderID], [borrowerID]) VALUES (33, N'Có bao giờ bạn tự hỏi, tuổi trẻ thực sự đáng giá bao nhiêu', 0, CAST(N'2018-11-19T11:49:40.237' AS DateTime), NULL, NULL, 11, 1, NULL)
INSERT [dbo].[Trading] ([id], [description], [tradingStatus], [completedTime], [lenderRatePoint], [borrowerRatePoint], [bookID], [lenderID], [borrowerID]) VALUES (34, N'Nanh Trắng, một cuốn sách ngoài mong đợi. Hãy đọc và cảm nhận !', 0, CAST(N'2018-11-19T11:51:16.803' AS DateTime), NULL, NULL, 12, 1, NULL)
INSERT [dbo].[Trading] ([id], [description], [tradingStatus], [completedTime], [lenderRatePoint], [borrowerRatePoint], [bookID], [lenderID], [borrowerID]) VALUES (35, N'Nếu bạn là một fan cứng của trái táo sứt, hãy đọc cuốn sách để biết thêm về cha để của nó nhé !!!
Sách còn rất mới và đẹp', 0, CAST(N'2018-11-19T11:52:31.993' AS DateTime), NULL, NULL, 14, 1, NULL)
INSERT [dbo].[Trading] ([id], [description], [tradingStatus], [completedTime], [lenderRatePoint], [borrowerRatePoint], [bookID], [lenderID], [borrowerID]) VALUES (36, N'Sách chuyên ngành SE', 0, CAST(N'2018-11-19T11:53:14.360' AS DateTime), NULL, NULL, 16, 1, NULL)
INSERT [dbo].[Trading] ([id], [description], [tradingStatus], [completedTime], [lenderRatePoint], [borrowerRatePoint], [bookID], [lenderID], [borrowerID]) VALUES (37, N'Sách mới hơi bị xịn', 0, CAST(N'2018-11-19T11:56:00.403' AS DateTime), NULL, NULL, 8, 7, NULL)
INSERT [dbo].[Trading] ([id], [description], [tradingStatus], [completedTime], [lenderRatePoint], [borrowerRatePoint], [bookID], [lenderID], [borrowerID]) VALUES (38, N'Hãy đọc cuốn sách này để biết cách sống hết mình với tuổi trẻ', 0, CAST(N'2018-11-19T11:56:51.393' AS DateTime), NULL, NULL, 11, 7, NULL)
INSERT [dbo].[Trading] ([id], [description], [tradingStatus], [completedTime], [lenderRatePoint], [borrowerRatePoint], [bookID], [lenderID], [borrowerID]) VALUES (39, N'Một cuốn sách hay về loài sói dũng mãnh', 0, CAST(N'2018-11-19T11:58:08.343' AS DateTime), NULL, NULL, 12, 7, NULL)
SET IDENTITY_INSERT [dbo].[Trading] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([id], [fullName], [dob], [username], [password], [email], [address], [phoneNum], [linkFacebook], [avatar], [userPoint], [createdTime], [status]) VALUES (1, N'nam nguyen the', CAST(N'1998-10-06' AS Date), N'nam', N'123', N'namnguyen61031@gmail.com', N'Co Nhue, Ha Noi', N'012345678', N'https://www.facebook.com/profile.php?id=100005250157129', N'nam.jpg', 0, CAST(N'2018-10-06T22:11:00.000' AS DateTime), 1)
INSERT [dbo].[User] ([id], [fullName], [dob], [username], [password], [email], [address], [phoneNum], [linkFacebook], [avatar], [userPoint], [createdTime], [status]) VALUES (2, N'tuan dao thien', CAST(N'1998-10-12' AS Date), N'tuan', N'123', N'tuandao@gmail.com', N'Dich Vong, Ha Noi', N'012345678', N'https://www.facebook.com/search/top/?q=%C4%91%C3%A0o%20thi%E1%BB%87n%20tu%E1%BA%A5n', N'tuan.jpg', 0, CAST(N'2018-03-03T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[User] ([id], [fullName], [dob], [username], [password], [email], [address], [phoneNum], [linkFacebook], [avatar], [userPoint], [createdTime], [status]) VALUES (3, N'nam anh', CAST(N'1998-01-22' AS Date), N'namanh', N'123', N'namanh@gmail.com', N'Cau Dien, Ha Noi', N'012345678', N'https://www.facebook.com/profile.php?id=100003931914710', N'na.jpg', 0, CAST(N'2018-05-05T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[User] ([id], [fullName], [dob], [username], [password], [email], [address], [phoneNum], [linkFacebook], [avatar], [userPoint], [createdTime], [status]) VALUES (7, N'vu minh', CAST(N'1998-01-21' AS Date), N'minh', N'123', N'nguyenvuminh@gmail.com', N'Quang Ngai Pho Bien', N'012345678', N'https://www.facebook.com/vuminh.nguyen.520', N'minh.jpg', 0, CAST(N'2018-11-03T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[User] ([id], [fullName], [dob], [username], [password], [email], [address], [phoneNum], [linkFacebook], [avatar], [userPoint], [createdTime], [status]) VALUES (9, N'huyen mai', CAST(N'1996-10-10' AS Date), N'mai', N'123', N'huyenmai@gmail.com', N'Dia chi o dau the', N'012345678', N'https://www.facebook.com/huyen.mai.3010', N'mai.jpg', 0, CAST(N'2018-03-03T00:00:00.000' AS DateTime), 1)
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
