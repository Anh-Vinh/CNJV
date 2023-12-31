USE [master]
GO
/****** Object:  User [duy]    Script Date: 12/7/2023 5:49:28 PM ******/
CREATE USER [duy] FOR LOGIN [duy] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [##MS_PolicyEventProcessingLogin##]    Script Date: 12/7/2023 5:49:28 PM ******/
CREATE USER [##MS_PolicyEventProcessingLogin##] FOR LOGIN [##MS_PolicyEventProcessingLogin##] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [##MS_AgentSigningCertificate##]    Script Date: 12/7/2023 5:49:28 PM ******/
CREATE USER [##MS_AgentSigningCertificate##] FOR LOGIN [##MS_AgentSigningCertificate##]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 12/7/2023 5:49:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[NameVN] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 12/7/2023 5:49:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[Id] [nvarchar](20) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Fullname] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Photo] [nvarchar](50) NOT NULL,
	[Activated] [bit] NOT NULL,
	[Admin] [bit] NOT NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 12/7/2023 5:49:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[UnitPrice] [float] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Discount] [float] NOT NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 12/7/2023 5:49:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [nvarchar](20) NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[Address] [nvarchar](60) NOT NULL,
	[Amount] [float] NOT NULL,
	[Description] [nvarchar](1000) NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 12/7/2023 5:49:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](60) NOT NULL,
	[Image] [nvarchar](50) NOT NULL,
	[UnitPrice] [float] NOT NULL,
	[Discount] [float] NOT NULL,
	[Quantity] [int] NOT NULL,
	[ProductDate] [date] NOT NULL,
	[Available] [bit] NOT NULL,
	[CategoryId] [int] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[ViewCount] [int] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Id], [Name], [NameVN]) VALUES (1000, N'ao', N'Áo')
INSERT [dbo].[Categories] ([Id], [Name], [NameVN]) VALUES (1001, N'quan', N'Quần')
INSERT [dbo].[Categories] ([Id], [Name], [NameVN]) VALUES (1002, N'vay', N'Váy')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
INSERT [dbo].[Customers] ([Id], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'caonguyenbinh', N'123456', N'Cao Nguyên Bình', N'caonguyenbinh12@gmail.com', N'user.png', 1, 0)
INSERT [dbo].[Customers] ([Id], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'cnb', N'123456', N'Bình', N'caonguyenbinh12@gmail.com', N'user.png', 0, 0)
INSERT [dbo].[Customers] ([Id], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'duy', N'123', N'Trần Bảo Duy', N'tranbaoduy176@gmail.com', N'user.png', 1, 1)
INSERT [dbo].[Customers] ([Id], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'duy1', N'123', N'Trần Bảo Duy', N'tranbaoduy176@gmail.com', N'user.png', 1, 0)
INSERT [dbo].[Customers] ([Id], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'ltqn', N'123456', N'Như', N'letranquynhnhu1692@gmail.com', N'user.png', 1, 0)
INSERT [dbo].[Customers] ([Id], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'minh', N'123', N'Nguyễn Cao Minh', N'caominh26032003@gmail.com', N'user.png', 1, 0)
INSERT [dbo].[Customers] ([Id], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'minh1', N'123', N'Cao Minh Nguyễn', N'nguyencaominh26032003@gmail.com', N'user.png', 1, 0)
GO
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 

INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (1, 8, 1016, 17.45, 1, 0)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (2, 9, 1044, 19.45, 1, 0)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (3, 9, 1003, 10, 1, 0)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (4, 10, 1043, 46, 1, 0)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (5, 10, 1076, 18, 1, 0)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (6, 10, 1069, 36, 1, 0)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (7, 10, 1071, 21.5, 1, 0)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (8, 11, 1072, 34.8, 1, 0)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (9, 11, 1043, 46, 1, 0)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (10, 11, 1067, 14, 1, 0)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (11, 12, 1001, 190, 1, 0)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (12, 12, 1019, 9.2, 1, 0)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (13, 12, 1021, 10, 1, 8)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (14, 13, 1024, 4.5, 3, 0)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (15, 14, 1016, 17.45, 2, 0)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (16, 15, 1059, 55, 1, 0)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (17, 15, 1027, 43.9, 1, 2)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (18, 16, 1015, 15.5, 1, 0)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (19, 17, 1044, 19.45, 10, 0)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (20, 18, 1081, 19, 1, 0)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (21, 19, 1061, 28.5, 1, 0)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (22, 19, 1034, 14, 1, 0)
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([Id], [CustomerId], [OrderDate], [Address], [Amount], [Description], [Status]) VALUES (10, N'letranquynhnhu1692', CAST(N'2023-02-26T00:00:00.000' AS DateTime), N'', 117.5, N'', 0)
INSERT [dbo].[Orders] ([Id], [CustomerId], [OrderDate], [Address], [Amount], [Description], [Status]) VALUES (11, N'quynhnhu', CAST(N'2023-02-27T00:00:00.000' AS DateTime), N'Giá Rai, Bạc Liêu', 91.8, N'<i><u style="background-color: rgb(51, 102, 153);"><font color="#6600ff">test</font></u></i>', 2)
INSERT [dbo].[Orders] ([Id], [CustomerId], [OrderDate], [Address], [Amount], [Description], [Status]) VALUES (12, N'quynhnhu', CAST(N'2023-03-03T00:00:00.000' AS DateTime), N'Giá Rai, Bạc Liêu', 214.2, N'<br>', 4)
INSERT [dbo].[Orders] ([Id], [CustomerId], [OrderDate], [Address], [Amount], [Description], [Status]) VALUES (13, N'ltqn', CAST(N'2023-03-08T00:00:00.000' AS DateTime), N'Bạc Liêu', 12.5, N'', 1)
INSERT [dbo].[Orders] ([Id], [CustomerId], [OrderDate], [Address], [Amount], [Description], [Status]) VALUES (14, N'ltqn', CAST(N'2023-03-08T00:00:00.000' AS DateTime), N'Bạc Liêu', 33.9, N'test', 0)
INSERT [dbo].[Orders] ([Id], [CustomerId], [OrderDate], [Address], [Amount], [Description], [Status]) VALUES (15, N'ltqn', CAST(N'2023-03-14T00:00:00.000' AS DateTime), N'Bạc Liêu', 98.9, N'', 1)
INSERT [dbo].[Orders] ([Id], [CustomerId], [OrderDate], [Address], [Amount], [Description], [Status]) VALUES (16, N'cnb', CAST(N'2023-04-02T00:00:00.000' AS DateTime), N'Phường 1, Bạc Liêu', 15.5, N'', 1)
INSERT [dbo].[Orders] ([Id], [CustomerId], [OrderDate], [Address], [Amount], [Description], [Status]) VALUES (17, N'caonguyenbinh', CAST(N'2023-04-02T00:00:00.000' AS DateTime), N'Phường 1, Bạc Liêu', 194.5, N'giao chủ nhật', 0)
INSERT [dbo].[Orders] ([Id], [CustomerId], [OrderDate], [Address], [Amount], [Description], [Status]) VALUES (18, N'caonguyenbinh', CAST(N'2023-04-02T00:00:00.000' AS DateTime), N'Phường 1, Bạc Liêu', 19, N'', 1)
INSERT [dbo].[Orders] ([Id], [CustomerId], [OrderDate], [Address], [Amount], [Description], [Status]) VALUES (19, N'duy', CAST(N'2023-12-07T00:00:00.000' AS DateTime), N'q7 hcm', 42.5, N'', 1)
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [Name], [Image], [UnitPrice], [Discount], [Quantity], [ProductDate], [Available], [CategoryId], [Description], [ViewCount]) VALUES (1001, N'Áo Sơ Mi Đũi Tay Ngắn Teelab', N'1001.jpg', 190, 0, 190, CAST(N'2022-03-29' AS Date), 1, 1000, N'<b><i><font color="#ff0000">EmEditor </font></i>uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, <font color="#999900">you can also troubleshoot your code easily</font>. For example, in JavaScript, you can use the following statement to troubleshoot err</b>ors<img src="/eStore040413/nicImages/anifire.gif">', 2)
INSERT [dbo].[Products] ([Id], [Name], [Image], [UnitPrice], [Discount], [Quantity], [ProductDate], [Available], [CategoryId], [Description], [ViewCount]) VALUES (1002, N'Áo Polo Graphic Famous', N'1002.jpg', 19, 0, 19, CAST(N'1982-12-18' AS Date), 1, 1000, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily.<b> <font color="#cc3399">For example</font></b>,<i> in JavaS</i><i>cript, you can use the following statement to troubleshoot errors&nbsp;&nbsp;</i><img src="https://i.imgur.com/9zayofL.gif" width="128">', 4)
INSERT [dbo].[Products] ([Id], [Name], [Image], [UnitPrice], [Discount], [Quantity], [ProductDate], [Available], [CategoryId], [Description], [ViewCount]) VALUES (1003, N'Quần Kaki Double Pocket', N'1003.jpg', 10, 0, 10, CAST(N'1973-06-14' AS Date), 1, 1001, N'Lấy cảm hứng từ giới trẻ, sáng tạo liên tục, bắt kịp xu hướng và phát triển đa dạng các dòng sản phẩm là cách mà chúng mình hoạt động để tạo nên phong cách sống hằng ngày của bạn. Mục tiêu của TEELAB là cung cấp các sản phẩm thời trang chất lượng cao với giá thành hợp lý', 5)
INSERT [dbo].[Products] ([Id], [Name], [Image], [UnitPrice], [Discount], [Quantity], [ProductDate], [Available], [CategoryId], [Description], [ViewCount]) VALUES (1004, N'Quần Short Painter', N'1004.jpg', 22, 0, 22, CAST(N'1976-03-10' AS Date), 1, 1001, N'Lấy cảm hứng từ giới trẻ, sáng tạo liên tục, bắt kịp xu hướng và phát triển đa dạng các dòng sản phẩm là cách mà chúng mình hoạt động để tạo nên phong cách sống hằng ngày của bạn. Mục tiêu của TEELAB là cung cấp các sản phẩm thời trang chất lượng cao với giá thành hợp lý.', 5)
INSERT [dbo].[Products] ([Id], [Name], [Image], [UnitPrice], [Discount], [Quantity], [ProductDate], [Available], [CategoryId], [Description], [ViewCount]) VALUES (1005, N'ĐẦM ÁNH NHŨ 2 DÂY RỚT VAI', N'1005.jpg', 21.35, 5, 21, CAST(N'1978-12-06' AS Date), 1, 1002, N'', 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [UnitPrice], [Discount], [Quantity], [ProductDate], [Available], [CategoryId], [Description], [ViewCount]) VALUES (1006, N'Quần Signature Sweat Pants', N'1006.jpg', 25, 0, 25, CAST(N'1981-09-03' AS Date), 1, 1001, N'<b style="color: rgb(153, 51, 153);">EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. </b><font size="3" style="" color="#660099"><b style="">For example</b></font><b style="color: rgb(153, 51, 153);">, in JavaScript, you can use the following statement to troubleshoot errors</b>', 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [UnitPrice], [Discount], [Quantity], [ProductDate], [Available], [CategoryId], [Description], [ViewCount]) VALUES (1008, N'Quần Special Collection Premium', N'1008.jpg', 40, 0, 40, CAST(N'1972-02-26' AS Date), 0, 1001, NULL, 5)
INSERT [dbo].[Products] ([Id], [Name], [Image], [UnitPrice], [Discount], [Quantity], [ProductDate], [Available], [CategoryId], [Description], [ViewCount]) VALUES (1011, N'Váy Đen Pha Bèo Tiểu Thư', N'1011.jpg', 21, 0, 21, CAST(N'1985-11-28' AS Date), 1, 1002, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [UnitPrice], [Discount], [Quantity], [ProductDate], [Available], [CategoryId], [Description], [ViewCount]) VALUES (1012, N'Váy Kaki Xoắn Cổ', N'1012.jpg', 38, 10, 38, CAST(N'1988-08-27' AS Date), 1, 1002, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', 11)
INSERT [dbo].[Products] ([Id], [Name], [Image], [UnitPrice], [Discount], [Quantity], [ProductDate], [Available], [CategoryId], [Description], [ViewCount]) VALUES (1015, N'Degrey.Madmonks Quần giả da', N'1015.jpg', 15.5, 0, 15, CAST(N'1991-05-04' AS Date), 1, 1001, NULL, 4)
INSERT [dbo].[Products] ([Id], [Name], [Image], [UnitPrice], [Discount], [Quantity], [ProductDate], [Available], [CategoryId], [Description], [ViewCount]) VALUES (1016, N'Set Dạ Viền Khuy Ngọc', N'1016.jpg', 17.45, 0, 17, CAST(N'1996-11-09' AS Date), 1, 1002, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', 5)
INSERT [dbo].[Products] ([Id], [Name], [Image], [UnitPrice], [Discount], [Quantity], [ProductDate], [Available], [CategoryId], [Description], [ViewCount]) VALUES (1019, N'Váy Thiết Kế Tay Voan Phồng', N'1019.jpg', 9.2, 0, 9, CAST(N'2005-02-02' AS Date), 1, 1002, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', 7)
INSERT [dbo].[Products] ([Id], [Name], [Image], [UnitPrice], [Discount], [Quantity], [ProductDate], [Available], [CategoryId], [Description], [ViewCount]) VALUES (1020, N'Váy Babydoll Kẻ Hồng', N'1020.jpg', 81, 0, 81, CAST(N'2007-11-01' AS Date), 1, 1002, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', 1)
INSERT [dbo].[Products] ([Id], [Name], [Image], [UnitPrice], [Discount], [Quantity], [ProductDate], [Available], [CategoryId], [Description], [ViewCount]) VALUES (1021, N'Váy Babydoll NƠ Ngực', N'1021.jpg', 10, 8, 10, CAST(N'2010-07-29' AS Date), 1, 1002, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [UnitPrice], [Discount], [Quantity], [ProductDate], [Available], [CategoryId], [Description], [ViewCount]) VALUES (1024, N'Áo Hoodie Painter', N'1024.jpg', 4.5, 0, 4, CAST(N'2008-03-13' AS Date), 0, 1000, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', 5)
INSERT [dbo].[Products] ([Id], [Name], [Image], [UnitPrice], [Discount], [Quantity], [ProductDate], [Available], [CategoryId], [Description], [ViewCount]) VALUES (1025, N'VÁY TRẮNG CÔNG CHÚA', N'1025.jpg', 14, 0, 14, CAST(N'2011-07-20' AS Date), 1, 1002, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', 1)
INSERT [dbo].[Products] ([Id], [Name], [Image], [UnitPrice], [Discount], [Quantity], [ProductDate], [Available], [CategoryId], [Description], [ViewCount]) VALUES (1026, N'SET ÁO BỐ DẠ CỔ', N'1026.jpg', 31.23, 0, 31, CAST(N'2009-04-17' AS Date), 1, 1002, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [UnitPrice], [Discount], [Quantity], [ProductDate], [Available], [CategoryId], [Description], [ViewCount]) VALUES (1027, N'Váy Thô Xoắn Eo', N'1027.jpg', 43.9, 2, 43, CAST(N'2007-01-14' AS Date), 1, 1002, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', 3)
INSERT [dbo].[Products] ([Id], [Name], [Image], [UnitPrice], [Discount], [Quantity], [ProductDate], [Available], [CategoryId], [Description], [ViewCount]) VALUES (1031, N'Váy Đũi Xước', N'1031.jpg', 12.5, 0, 12, CAST(N'2010-10-30' AS Date), 0, 1002, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', 5)
INSERT [dbo].[Products] ([Id], [Name], [Image], [UnitPrice], [Discount], [Quantity], [ProductDate], [Available], [CategoryId], [Description], [ViewCount]) VALUES (1032, N'Váy Kaki', N'1032.jpg', 32, 0, 32, CAST(N'2011-07-30' AS Date), 0, 1002, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', 3)
INSERT [dbo].[Products] ([Id], [Name], [Image], [UnitPrice], [Discount], [Quantity], [ProductDate], [Available], [CategoryId], [Description], [ViewCount]) VALUES (1033, N'Đầm váy nữ basic', N'1033.png', 2.5, 0, 2, CAST(N'2010-04-29' AS Date), 1, 1002, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', 2)
INSERT [dbo].[Products] ([Id], [Name], [Image], [UnitPrice], [Discount], [Quantity], [ProductDate], [Available], [CategoryId], [Description], [ViewCount]) VALUES (1034, N'Áo Polo Washed', N'1034.jpg', 14, 0, 14, CAST(N'2010-07-30' AS Date), 1, 1000, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [UnitPrice], [Discount], [Quantity], [ProductDate], [Available], [CategoryId], [Description], [ViewCount]) VALUES (1035, N'Áo Khoác Gió Sporty', N'1035.jpg', 18, 0, 18, CAST(N'2011-04-25' AS Date), 1, 1000, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', 1)
INSERT [dbo].[Products] ([Id], [Name], [Image], [UnitPrice], [Discount], [Quantity], [ProductDate], [Available], [CategoryId], [Description], [ViewCount]) VALUES (1038, N'Áo Thun Gambling Cats', N'1038.jpg', 263.5, 0, 263, CAST(N'1981-07-12' AS Date), 1, 1000, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', 4)
INSERT [dbo].[Products] ([Id], [Name], [Image], [UnitPrice], [Discount], [Quantity], [ProductDate], [Available], [CategoryId], [Description], [ViewCount]) VALUES (1039, N'Áo Thun Cyborg Rabbit', N'1039.jpg', 18, 0, 18, CAST(N'1984-04-08' AS Date), 1, 1000, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', 1)
INSERT [dbo].[Products] ([Id], [Name], [Image], [UnitPrice], [Discount], [Quantity], [ProductDate], [Available], [CategoryId], [Description], [ViewCount]) VALUES (1043, N'Áo Noah X-Ray Monogram', N'1043.jpg', 46, 0, 46, CAST(N'1980-03-20' AS Date), 1, 1000, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', 5)
INSERT [dbo].[Products] ([Id], [Name], [Image], [UnitPrice], [Discount], [Quantity], [ProductDate], [Available], [CategoryId], [Description], [ViewCount]) VALUES (1044, N'TSUN Slogan Terry Short', N'1044.jpg', 19.45, 0, 19, CAST(N'1970-10-25' AS Date), 1, 1001, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', 11)
INSERT [dbo].[Products] ([Id], [Name], [Image], [UnitPrice], [Discount], [Quantity], [ProductDate], [Available], [CategoryId], [Description], [ViewCount]) VALUES (1047, N'Váy đen tay dài', N'1047.jpg', 9.5, 0, 9, CAST(N'1981-11-25' AS Date), 1, 1002, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [UnitPrice], [Discount], [Quantity], [ProductDate], [Available], [CategoryId], [Description], [ViewCount]) VALUES (1048, N'VÁY CÔNG CHÚA ĐÍNH HOA ĐÁ', N'1048.jpg', 12.75, 0, 12, CAST(N'1984-08-24' AS Date), 0, 1002, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', 2)
INSERT [dbo].[Products] ([Id], [Name], [Image], [UnitPrice], [Discount], [Quantity], [ProductDate], [Available], [CategoryId], [Description], [ViewCount]) VALUES (1049, N'Váy Babydoll Tiểu Thư', N'1049.jpg', 20, 0, 20, CAST(N'1987-05-23' AS Date), 0, 1002, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', 2)
INSERT [dbo].[Products] ([Id], [Name], [Image], [UnitPrice], [Discount], [Quantity], [ProductDate], [Available], [CategoryId], [Description], [ViewCount]) VALUES (1050, N'VÁY TRỄ VAI TẦNG BÈO', N'1050.jpg', 16.25, 0, 16, CAST(N'1990-02-17' AS Date), 0, 1002, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', 1)
INSERT [dbo].[Products] ([Id], [Name], [Image], [UnitPrice], [Discount], [Quantity], [ProductDate], [Available], [CategoryId], [Description], [ViewCount]) VALUES (1058, N'ONTOP CORDUROY SHORT', N'1058.jpg', 20, 0, 19, CAST(N'1970-10-25' AS Date), 1, 1001, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', 11)
INSERT [dbo].[Products] ([Id], [Name], [Image], [UnitPrice], [Discount], [Quantity], [ProductDate], [Available], [CategoryId], [Description], [ViewCount]) VALUES (1059, N'Váy cổ yếm khoét vai', N'1059.jpg', 55, 0, 55, CAST(N'2007-09-22' AS Date), 1, 1002, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', 6)
INSERT [dbo].[Products] ([Id], [Name], [Image], [UnitPrice], [Discount], [Quantity], [ProductDate], [Available], [CategoryId], [Description], [ViewCount]) VALUES (1060, N'Váy Trễ Vai Voan', N'1060.jpg', 34, 0, 34, CAST(N'2010-06-20' AS Date), 1, 1002, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [UnitPrice], [Discount], [Quantity], [ProductDate], [Available], [CategoryId], [Description], [ViewCount]) VALUES (1061, N'ONTOP BASIC SHORT', N'1061.jpg', 28.5, 0, 28, CAST(N'2007-05-29' AS Date), 0, 1001, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [UnitPrice], [Discount], [Quantity], [ProductDate], [Available], [CategoryId], [Description], [ViewCount]) VALUES (1062, N'Váy trễ vai bèo phối lưới', N'1062.jpg', 49.3, 0, 49, CAST(N'2008-01-21' AS Date), 1, 1002, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [UnitPrice], [Discount], [Quantity], [ProductDate], [Available], [CategoryId], [Description], [ViewCount]) VALUES (1063, N'ONTOP BOLD TRACK SHORT', N'1063.jpg', 43.9, 0, 43, CAST(N'2007-11-21' AS Date), 1, 1001, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', 7)
INSERT [dbo].[Products] ([Id], [Name], [Image], [UnitPrice], [Discount], [Quantity], [ProductDate], [Available], [CategoryId], [Description], [ViewCount]) VALUES (1065, N'ONTOP SHORT FADE-BLACK', N'1065.jpg', 21.05, 0, 21, CAST(N'2008-05-15' AS Date), 1, 1001, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [UnitPrice], [Discount], [Quantity], [ProductDate], [Available], [CategoryId], [Description], [ViewCount]) VALUES (1066, N'ONTOP LINE DESTROYED JEANS', N'1066.jpg', 17, 0, 17, CAST(N'2011-02-10' AS Date), 1, 1001, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', 3)
INSERT [dbo].[Products] ([Id], [Name], [Image], [UnitPrice], [Discount], [Quantity], [ProductDate], [Available], [CategoryId], [Description], [ViewCount]) VALUES (1067, N'Áo Thun Space Program', N'1067.jpg', 14, 0, 14, CAST(N'2010-12-05' AS Date), 1, 1000, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', 3)
INSERT [dbo].[Products] ([Id], [Name], [Image], [UnitPrice], [Discount], [Quantity], [ProductDate], [Available], [CategoryId], [Description], [ViewCount]) VALUES (1068, N'Đầm tiểu thơ đính nơ', N'1068.jpg', 12.5, 0, 12, CAST(N'2009-07-08' AS Date), 0, 1002, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', 2)
INSERT [dbo].[Products] ([Id], [Name], [Image], [UnitPrice], [Discount], [Quantity], [ProductDate], [Available], [CategoryId], [Description], [ViewCount]) VALUES (1069, N'Áo yếm orala 4 màu', N'1069.jpg', 36, 0, 36, CAST(N'2011-03-09' AS Date), 0, 1002, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', 3)
INSERT [dbo].[Products] ([Id], [Name], [Image], [UnitPrice], [Discount], [Quantity], [ProductDate], [Available], [CategoryId], [Description], [ViewCount]) VALUES (1070, N'Áo Khoác Vintage Sport', N'1070.jpg', 15, 0, 15, CAST(N'2009-02-21' AS Date), 1, 1000, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', 1)
INSERT [dbo].[Products] ([Id], [Name], [Image], [UnitPrice], [Discount], [Quantity], [ProductDate], [Available], [CategoryId], [Description], [ViewCount]) VALUES (1071, N'Đầm váy hoa trễ vai tầng', N'1071.jpg', 21.5, 0, 21, CAST(N'1980-09-04' AS Date), 1, 1002, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [UnitPrice], [Discount], [Quantity], [ProductDate], [Available], [CategoryId], [Description], [ViewCount]) VALUES (1072, N'Babydoll vải gấm cổ vuông', N'1072.jpg', 34.8, 0, 34, CAST(N'1983-06-03' AS Date), 1, 1002, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', 18)
INSERT [dbo].[Products] ([Id], [Name], [Image], [UnitPrice], [Discount], [Quantity], [ProductDate], [Available], [CategoryId], [Description], [ViewCount]) VALUES (1075, N'Áo Thun Gambling Cats', N'1075.jpg', 7.75, 0, 7, CAST(N'1982-10-31' AS Date), 1, 1000, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', 1)
INSERT [dbo].[Products] ([Id], [Name], [Image], [UnitPrice], [Discount], [Quantity], [ProductDate], [Available], [CategoryId], [Description], [ViewCount]) VALUES (1076, N'Áo Polo Simpled Logo', N'1076.jpg', 18, 0, 18, CAST(N'1970-07-28' AS Date), 1, 1000, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', 2)
INSERT [dbo].[Products] ([Id], [Name], [Image], [UnitPrice], [Discount], [Quantity], [ProductDate], [Available], [CategoryId], [Description], [ViewCount]) VALUES (1077, N'ONTOP SHORT FADE-GREY', N'1077.gif', 13, 0, 13, CAST(N'1976-04-04' AS Date), 1, 1001, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', 2)
INSERT [dbo].[Products] ([Id], [Name], [Image], [UnitPrice], [Discount], [Quantity], [ProductDate], [Available], [CategoryId], [Description], [ViewCount]) VALUES (1081, N'Áo Khoác Denim Essetial', N'1081.jpg', 19, 0, 19, CAST(N'1984-04-04' AS Date), 1, 1000, N'TEELAB nơi bạn có thể thỏa sức thử nghiệm phong cách của mình. Được thành lập vào 2020 với rất nhiều những sự biến động của xã hội, TEELAB bắt đầu chặng đường viết lên câu chuyện của riêng mình. Khi văn hóa đường phố dần trở nên phổ biến hơn cũng là lúc nhu cầu được thỏa mãn đam mê về thời trang của những GenZ mãnh liệt hơn bao giờ hết. TEELAB, phòng thí nghiệm về thời trang và những thiết kế mang đậm tinh thần TEELAB của chúng tôi “Your body is your greatest canvas” hứa hẹn sẽ mang đến cho các bạn trẻ Việt Nam nhiều trải nghiệm thú vị và mới mẻ về thời trang đường phố. Đội ngũ Fashion Scientist của TEELAB luôn cố gắng hoàn thiện và phát triển sản phầm, để có thể mang tới cho khách hàng những sản phẩm có chất lượng tốt nhất, được nghiên cứu kỹ càng và đáp ứng những tiêu chuẩn điên rồ nhất từ phòng thí nghiệm của chúng tôi.', 5)
INSERT [dbo].[Products] ([Id], [Name], [Image], [UnitPrice], [Discount], [Quantity], [ProductDate], [Available], [CategoryId], [Description], [ViewCount]) VALUES (1086, N'Áo Khoác Gió Logo', N'1086.jpg', 100, 10, 10, CAST(N'2022-01-09' AS Date), 1, 1000, N'TEELAB nơi bạn có thể thỏa sức thử nghiệm phong cách của mình. Được thành lập vào 2020 với rất nhiều những sự biến động của xã hội, TEELAB bắt đầu chặng đường viết lên câu chuyện của riêng mình. Khi văn hóa đường phố dần trở nên phổ biến hơn cũng là lúc nhu cầu được thỏa mãn đam mê về thời trang của những GenZ mãnh liệt hơn bao giờ hết. TEELAB, phòng thí nghiệm về thời trang và những thiết kế mang đậm tinh thần TEELAB của chúng tôi “Your body is your greatest canvas” hứa hẹn sẽ mang đến cho các bạn trẻ Việt Nam nhiều trải nghiệm thú vị và mới mẻ về thời trang đường phố. Đội ngũ Fashion Scientist của TEELAB luôn cố gắng hoàn thiện và phát triển sản phầm, để có thể mang tới cho khách hàng những sản phẩm có chất lượng tốt nhất, được nghiên cứu kỹ càng và đáp ứng những tiêu chuẩn điên rồ nhất từ phòng thí nghiệm của chúng tôi.', 10)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
/****** Object:  StoredProcedure [dbo].[SP_getAllProduct]    Script Date: 12/7/2023 5:49:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROC [dbo].[SP_getAllProduct]
as
begin
SELECT * FROM Products

end


GO
/****** Object:  StoredProcedure [dbo].[sp_insertCategory]    Script Date: 12/7/2023 5:49:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_insertCategory]
(
@Na nvarchar(50),
@NaVN nvarchar(50)

 ) as
begin
INSERT INTO Categories(Name,NameVN) values(@Na ,@NaVN)
end

GO
/****** Object:  StoredProcedure [dbo].[SP_SearchProducts]    Script Date: 12/7/2023 5:49:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROC [dbo].[SP_SearchProducts]( @MaxPrice Float = 0,
@MinPrice float = 0)
as
begin
SELECT * FROM Products where UnitPrice between @MinPrice and @MaxPrice 

end

GO
