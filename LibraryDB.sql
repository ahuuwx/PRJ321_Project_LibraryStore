USE [master]
GO
/****** Object:  Database [BookManagement]    Script Date: 7/15/2020 1:21:44 PM ******/
CREATE DATABASE [BookManagement]
GO

USE [BookManagement]
GO
/****** Object:  User [thehuu]    Script Date: 7/15/2020 1:21:44 PM ******/

/****** Object:  Table [dbo].[tblBooks]    Script Date: 7/15/2020 1:21:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblBooks](
	[bookID] [varchar](50) NOT NULL,
	[bookName] [nvarchar](50) NOT NULL,
	[quantity] [int] NOT NULL,
	[price] [decimal](15, 2) NOT NULL,
	[bookType] [nvarchar](50) NOT NULL,
	[author] [nvarchar](50) NOT NULL,
	[statusID] [int] NOT NULL,
	[image] [text] NULL,
 CONSTRAINT [PK_tblBooks] PRIMARY KEY CLUSTERED 
(
	[bookID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblOrderDetail]    Script Date: 7/15/2020 1:21:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblOrderDetail](
	[idOrderDetail] [int] IDENTITY(1,1) NOT NULL,
	[orderID] [varchar](50) NOT NULL,
	[bookID] [varchar](50) NOT NULL,
	[amout] [decimal](15, 2) NOT NULL,
 CONSTRAINT [PK_tblOrderDetail] PRIMARY KEY CLUSTERED 
(
	[idOrderDetail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblOrders]    Script Date: 7/15/2020 1:21:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblOrders](
	[orderID] [varchar](50) NOT NULL,
	[date] [date] NOT NULL,
	[userID] [varchar](50) NOT NULL,
	[total] [int] NOT NULL,
 CONSTRAINT [PK_tblOrders] PRIMARY KEY CLUSTERED 
(
	[orderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblRoles]    Script Date: 7/15/2020 1:21:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblRoles](
	[roleID] [int] NOT NULL,
	[roleName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tblRoles] PRIMARY KEY CLUSTERED 
(
	[roleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblStatus]    Script Date: 7/15/2020 1:21:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblStatus](
	[statusID] [int] NOT NULL,
	[statusName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tblStatus] PRIMARY KEY CLUSTERED 
(
	[statusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblUser]    Script Date: 7/15/2020 1:21:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblUser](
	[userID] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[fullName] [nvarchar](50) NOT NULL,
	[roleID] [int] NOT NULL,
	[phoneNumber] [varchar](50) NOT NULL,
	[address] [nvarchar](50) NOT NULL,
	[statusID] [int] NOT NULL,
 CONSTRAINT [PK__tblUser__CB9A1CDFEDDE1D30] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[tblBooks] ([bookID], [bookName], [quantity], [price], [bookType], [author], [statusID], [image]) VALUES (N'B01', N'Harry Potter 1', 1, CAST(10000.22 AS Decimal(15, 2)), N'Kinh Di', N'Huu The', 1, N'images/home/harrypotter_stone.jpg')
INSERT [dbo].[tblBooks] ([bookID], [bookName], [quantity], [price], [bookType], [author], [statusID], [image]) VALUES (N'B02', N'Harry Potter 2', 2, CAST(200000.00 AS Decimal(15, 2)), N'Thieu Nhi', N'Huu Nguyen', 1, N'images/home/harrypotter_chamber.jpg')
INSERT [dbo].[tblBooks] ([bookID], [bookName], [quantity], [price], [bookType], [author], [statusID], [image]) VALUES (N'B03', N'Harry Potter 3', 3, CAST(300000.00 AS Decimal(15, 2)), N'Thieu Nhi', N'Huu Nguyen', 1, N'images/home/harrypotter_azakaban.jpg')
INSERT [dbo].[tblBooks] ([bookID], [bookName], [quantity], [price], [bookType], [author], [statusID], [image]) VALUES (N'B04', N'Harry Potter 4', 1, CAST(200000.00 AS Decimal(15, 2)), N'Giat Gan', N'Huu Nguyen', 1, N'images/home/harrypotter_goblet.jpg ')
INSERT [dbo].[tblBooks] ([bookID], [bookName], [quantity], [price], [bookType], [author], [statusID], [image]) VALUES (N'B05', N'Harry Potter 5', 5, CAST(500000.00 AS Decimal(15, 2)), N'Nguoi lon', N'Huu Nguyen', 1, N'images/home/harrypotter_halfbold.jpg')
INSERT [dbo].[tblBooks] ([bookID], [bookName], [quantity], [price], [bookType], [author], [statusID], [image]) VALUES (N'B06', N'Harry Potter 6', 6, CAST(600000.00 AS Decimal(15, 2)), N'Nguoi lon', N'Huu Nguyen', 1, N'images/home/harrypotter_pheonix.jpg')
INSERT [dbo].[tblBooks] ([bookID], [bookName], [quantity], [price], [bookType], [author], [statusID], [image]) VALUES (N'B07', N'Harry Potter 7', 1, CAST(100000.00 AS Decimal(15, 2)), N'Giat Gan', N'Huu Nguyen', 1, N' images/home/harrypotter_deathly.jpg  ')
INSERT [dbo].[tblRoles] ([roleID], [roleName]) VALUES (1, N'Admin')
INSERT [dbo].[tblRoles] ([roleID], [roleName]) VALUES (2, N'User')
INSERT [dbo].[tblStatus] ([statusID], [statusName]) VALUES (1, N'Available')
INSERT [dbo].[tblStatus] ([statusID], [statusName]) VALUES (2, N'Delete')
INSERT [dbo].[tblUser] ([userID], [password], [fullName], [roleID], [phoneNumber], [address], [statusID]) VALUES (N'admin', N'1', N'The Huu', 1, N'0965464096', N'Quan 1', 1)
INSERT [dbo].[tblUser] ([userID], [password], [fullName], [roleID], [phoneNumber], [address], [statusID]) VALUES (N'user', N'1', N'Mai', 2, N'0336412547', N'Quan 2', 1)
ALTER TABLE [dbo].[tblBooks]  WITH CHECK ADD  CONSTRAINT [FK_tblBooks_tblStatus] FOREIGN KEY([statusID])
REFERENCES [dbo].[tblStatus] ([statusID])
GO
ALTER TABLE [dbo].[tblBooks] CHECK CONSTRAINT [FK_tblBooks_tblStatus]
GO
ALTER TABLE [dbo].[tblOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_tblOrderDetail_tblBooks] FOREIGN KEY([bookID])
REFERENCES [dbo].[tblBooks] ([bookID])
GO
ALTER TABLE [dbo].[tblOrderDetail] CHECK CONSTRAINT [FK_tblOrderDetail_tblBooks]
GO
ALTER TABLE [dbo].[tblOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_tblOrderDetail_tblOrders] FOREIGN KEY([orderID])
REFERENCES [dbo].[tblOrders] ([orderID])
GO
ALTER TABLE [dbo].[tblOrderDetail] CHECK CONSTRAINT [FK_tblOrderDetail_tblOrders]
GO
ALTER TABLE [dbo].[tblOrders]  WITH CHECK ADD  CONSTRAINT [FK_tblOrders_tblUser] FOREIGN KEY([userID])
REFERENCES [dbo].[tblUser] ([userID])
GO
ALTER TABLE [dbo].[tblOrders] CHECK CONSTRAINT [FK_tblOrders_tblUser]
GO
ALTER TABLE [dbo].[tblUser]  WITH CHECK ADD  CONSTRAINT [FK__tblUser__roleID__49C3F6B7] FOREIGN KEY([roleID])
REFERENCES [dbo].[tblRoles] ([roleID])
GO
ALTER TABLE [dbo].[tblUser] CHECK CONSTRAINT [FK__tblUser__roleID__49C3F6B7]
GO
ALTER TABLE [dbo].[tblUser]  WITH CHECK ADD  CONSTRAINT [FK_tblUser_tblStatus] FOREIGN KEY([statusID])
REFERENCES [dbo].[tblStatus] ([statusID])
GO
ALTER TABLE [dbo].[tblUser] CHECK CONSTRAINT [FK_tblUser_tblStatus]
GO
USE [master]
GO
ALTER DATABASE [BookManagement] SET  READ_WRITE 
GO
