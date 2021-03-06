USE [Learning]
GO
/****** Object:  Table [dbo].[EmployeeAddressDetails]    Script Date: 25-06-2018 17:10:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeAddressDetails](
	[Id] [int] NOT NULL,
	[House_Number] [varchar](50) NULL,
	[Street] [varchar](200) NULL,
	[City] [varchar](200) NULL,
	[State] [varchar](200) NULL,
	[Pin] [int] NULL,
	[EmployeeId] [int] NOT NULL,
 CONSTRAINT [PK_EmployeeAddressDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Employees]    Script Date: 25-06-2018 17:10:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[DateOfJoining] [datetime] NULL,
	[EmployeeNumber] [int] NOT NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Invoice]    Script Date: 25-06-2018 17:10:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invoice](
	[Customer_ID] [int] IDENTITY(1,1) NOT NULL,
	[Fill_Amount] [float] NOT NULL,
 CONSTRAINT [PK_Invoice] PRIMARY KEY CLUSTERED 
(
	[Customer_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PaymentDetail]    Script Date: 25-06-2018 17:10:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentDetail](
	[PaymentId] [int] IDENTITY(1,1) NOT NULL,
	[Customer_ID] [int] NOT NULL,
	[Payment] [float] NOT NULL,
 CONSTRAINT [PK_PaymentDetail] PRIMARY KEY CLUSTERED 
(
	[PaymentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 25-06-2018 17:10:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[EmailId] [varchar](250) NOT NULL,
	[DateOfBrith] [datetime] NULL,
	[Password] [nvarchar](max) NOT NULL,
	[IsEmailVerified] [bit] NOT NULL,
	[ActivationCode] [uniqueidentifier] NOT NULL,
	[CreatedDate] [datetime] NULL,
	[IsSupervisor] [bit] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Invoice] ON 

INSERT [dbo].[Invoice] ([Customer_ID], [Fill_Amount]) VALUES (1, 13000)
INSERT [dbo].[Invoice] ([Customer_ID], [Fill_Amount]) VALUES (2, 10000)
INSERT [dbo].[Invoice] ([Customer_ID], [Fill_Amount]) VALUES (3, 18000)
INSERT [dbo].[Invoice] ([Customer_ID], [Fill_Amount]) VALUES (4, 15000)
INSERT [dbo].[Invoice] ([Customer_ID], [Fill_Amount]) VALUES (5, 20000)
SET IDENTITY_INSERT [dbo].[Invoice] OFF
SET IDENTITY_INSERT [dbo].[PaymentDetail] ON 

INSERT [dbo].[PaymentDetail] ([PaymentId], [Customer_ID], [Payment]) VALUES (1, 1, 600)
INSERT [dbo].[PaymentDetail] ([PaymentId], [Customer_ID], [Payment]) VALUES (2, 1, 1000)
INSERT [dbo].[PaymentDetail] ([PaymentId], [Customer_ID], [Payment]) VALUES (3, 1, 2000)
INSERT [dbo].[PaymentDetail] ([PaymentId], [Customer_ID], [Payment]) VALUES (4, 1, 4000)
INSERT [dbo].[PaymentDetail] ([PaymentId], [Customer_ID], [Payment]) VALUES (5, 2, 1200)
INSERT [dbo].[PaymentDetail] ([PaymentId], [Customer_ID], [Payment]) VALUES (6, 2, 1000)
INSERT [dbo].[PaymentDetail] ([PaymentId], [Customer_ID], [Payment]) VALUES (7, 3, 1800)
INSERT [dbo].[PaymentDetail] ([PaymentId], [Customer_ID], [Payment]) VALUES (8, 3, 1500)
INSERT [dbo].[PaymentDetail] ([PaymentId], [Customer_ID], [Payment]) VALUES (9, 3, 2000)
INSERT [dbo].[PaymentDetail] ([PaymentId], [Customer_ID], [Payment]) VALUES (10, 3, 2500)
INSERT [dbo].[PaymentDetail] ([PaymentId], [Customer_ID], [Payment]) VALUES (11, 4, 800)
INSERT [dbo].[PaymentDetail] ([PaymentId], [Customer_ID], [Payment]) VALUES (12, 4, 2000)
INSERT [dbo].[PaymentDetail] ([PaymentId], [Customer_ID], [Payment]) VALUES (13, 4, 1000)
INSERT [dbo].[PaymentDetail] ([PaymentId], [Customer_ID], [Payment]) VALUES (14, 5, 1800)
INSERT [dbo].[PaymentDetail] ([PaymentId], [Customer_ID], [Payment]) VALUES (15, 5, 1500)
SET IDENTITY_INSERT [dbo].[PaymentDetail] OFF
ALTER TABLE [dbo].[Users] ADD  DEFAULT ((0)) FOR [IsSupervisor]
GO
ALTER TABLE [dbo].[EmployeeAddressDetails]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeAddressDetails_Employees] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employees] ([Id])
GO
ALTER TABLE [dbo].[EmployeeAddressDetails] CHECK CONSTRAINT [FK_EmployeeAddressDetails_Employees]
GO
