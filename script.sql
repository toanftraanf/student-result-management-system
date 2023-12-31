USE [master]
GO
/****** Object:  Database [SRMSDB]    Script Date: 7/29/2023 5:37:09 PM ******/
CREATE DATABASE [SRMSDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SRMSDB', FILENAME = N'D:\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\SRMSDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SRMSDB_log', FILENAME = N'D:\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\SRMSDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [SRMSDB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SRMSDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SRMSDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SRMSDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SRMSDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SRMSDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SRMSDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [SRMSDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [SRMSDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SRMSDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SRMSDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SRMSDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SRMSDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SRMSDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SRMSDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SRMSDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SRMSDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SRMSDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SRMSDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SRMSDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SRMSDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SRMSDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SRMSDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SRMSDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SRMSDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SRMSDB] SET  MULTI_USER 
GO
ALTER DATABASE [SRMSDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SRMSDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SRMSDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SRMSDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SRMSDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SRMSDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [SRMSDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [SRMSDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [SRMSDB]
GO
/****** Object:  Table [dbo].[accounts]    Script Date: 7/29/2023 5:37:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[accounts](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[role] [bit] NOT NULL,
	[teacherId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[classes]    Script Date: 7/29/2023 5:37:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[classes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[courses]    Script Date: 7/29/2023 5:37:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[courses](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[rollId] [varchar](10) NOT NULL,
	[name] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[results]    Script Date: 7/29/2023 5:37:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[results](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[result1] [float] NULL,
	[result2] [float] NULL,
	[result3] [float] NULL,
	[result4] [float] NULL,
	[studentId] [int] NULL,
	[courseid] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[students]    Script Date: 7/29/2023 5:37:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[students](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[rollId] [varchar](10) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[dob] [date] NOT NULL,
	[sex] [bit] NOT NULL,
	[address] [nvarchar](255) NOT NULL,
	[classId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[teachers]    Script Date: 7/29/2023 5:37:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[teachers](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[teaching]    Script Date: 7/29/2023 5:37:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[teaching](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[teacherId] [int] NULL,
	[courseId] [int] NULL,
	[classId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[accounts] ON 

INSERT [dbo].[accounts] ([id], [username], [password], [role], [teacherId]) VALUES (1, N'toantran11', N'123456', 0, 1)
INSERT [dbo].[accounts] ([id], [username], [password], [role], [teacherId]) VALUES (2, N'cuongdo123', N'123456', 0, 2)
INSERT [dbo].[accounts] ([id], [username], [password], [role], [teacherId]) VALUES (3, N'haiminh', N'123456', 0, 3)
INSERT [dbo].[accounts] ([id], [username], [password], [role], [teacherId]) VALUES (4, N'admin', N'admin', 1, NULL)
SET IDENTITY_INSERT [dbo].[accounts] OFF
GO
SET IDENTITY_INSERT [dbo].[classes] ON 

INSERT [dbo].[classes] ([id], [name]) VALUES (1, N'SE1742')
INSERT [dbo].[classes] ([id], [name]) VALUES (2, N'SE1743')
INSERT [dbo].[classes] ([id], [name]) VALUES (3, N'SE1745')
SET IDENTITY_INSERT [dbo].[classes] OFF
GO
SET IDENTITY_INSERT [dbo].[courses] ON 

INSERT [dbo].[courses] ([id], [rollId], [name]) VALUES (1, N'MAS291', N'Statistics and Probability')
INSERT [dbo].[courses] ([id], [rollId], [name]) VALUES (2, N'PRJ301', N'Java Web Application Development')
INSERT [dbo].[courses] ([id], [rollId], [name]) VALUES (3, N'IOT102', N'Internet of Things')
SET IDENTITY_INSERT [dbo].[courses] OFF
GO
SET IDENTITY_INSERT [dbo].[results] ON 

INSERT [dbo].[results] ([id], [result1], [result2], [result3], [result4], [studentId], [courseid]) VALUES (1, 1.7999999523162842, 7, 6, 5.5, 1, 1)
INSERT [dbo].[results] ([id], [result1], [result2], [result3], [result4], [studentId], [courseid]) VALUES (2, NULL, NULL, NULL, NULL, 1, 2)
INSERT [dbo].[results] ([id], [result1], [result2], [result3], [result4], [studentId], [courseid]) VALUES (3, NULL, NULL, NULL, NULL, 1, 3)
INSERT [dbo].[results] ([id], [result1], [result2], [result3], [result4], [studentId], [courseid]) VALUES (4, 7, NULL, 9, NULL, 2, 1)
INSERT [dbo].[results] ([id], [result1], [result2], [result3], [result4], [studentId], [courseid]) VALUES (5, NULL, NULL, NULL, NULL, 2, 2)
INSERT [dbo].[results] ([id], [result1], [result2], [result3], [result4], [studentId], [courseid]) VALUES (6, NULL, NULL, NULL, NULL, 2, 3)
INSERT [dbo].[results] ([id], [result1], [result2], [result3], [result4], [studentId], [courseid]) VALUES (7, 4.5999999046325684, 7.9000000953674316, 8.8000001907348633, NULL, 3, 1)
INSERT [dbo].[results] ([id], [result1], [result2], [result3], [result4], [studentId], [courseid]) VALUES (8, NULL, NULL, NULL, NULL, 3, 2)
INSERT [dbo].[results] ([id], [result1], [result2], [result3], [result4], [studentId], [courseid]) VALUES (9, NULL, NULL, NULL, NULL, 3, 3)
INSERT [dbo].[results] ([id], [result1], [result2], [result3], [result4], [studentId], [courseid]) VALUES (10, NULL, NULL, NULL, NULL, 4, 1)
INSERT [dbo].[results] ([id], [result1], [result2], [result3], [result4], [studentId], [courseid]) VALUES (11, NULL, NULL, NULL, NULL, 4, 2)
INSERT [dbo].[results] ([id], [result1], [result2], [result3], [result4], [studentId], [courseid]) VALUES (12, NULL, NULL, NULL, NULL, 4, 3)
INSERT [dbo].[results] ([id], [result1], [result2], [result3], [result4], [studentId], [courseid]) VALUES (13, NULL, NULL, NULL, NULL, 5, 1)
INSERT [dbo].[results] ([id], [result1], [result2], [result3], [result4], [studentId], [courseid]) VALUES (14, NULL, NULL, NULL, NULL, 5, 2)
INSERT [dbo].[results] ([id], [result1], [result2], [result3], [result4], [studentId], [courseid]) VALUES (15, NULL, NULL, NULL, NULL, 5, 3)
INSERT [dbo].[results] ([id], [result1], [result2], [result3], [result4], [studentId], [courseid]) VALUES (16, NULL, NULL, NULL, NULL, 6, 1)
INSERT [dbo].[results] ([id], [result1], [result2], [result3], [result4], [studentId], [courseid]) VALUES (17, NULL, NULL, NULL, NULL, 6, 2)
INSERT [dbo].[results] ([id], [result1], [result2], [result3], [result4], [studentId], [courseid]) VALUES (18, NULL, NULL, NULL, NULL, 6, 3)
INSERT [dbo].[results] ([id], [result1], [result2], [result3], [result4], [studentId], [courseid]) VALUES (19, 8, 7.5, 6, 6, 7, 1)
INSERT [dbo].[results] ([id], [result1], [result2], [result3], [result4], [studentId], [courseid]) VALUES (20, 1, 1, 1, 1, 8, 1)
INSERT [dbo].[results] ([id], [result1], [result2], [result3], [result4], [studentId], [courseid]) VALUES (21, NULL, NULL, NULL, NULL, 9, 1)
INSERT [dbo].[results] ([id], [result1], [result2], [result3], [result4], [studentId], [courseid]) VALUES (22, NULL, NULL, NULL, NULL, 10, 1)
INSERT [dbo].[results] ([id], [result1], [result2], [result3], [result4], [studentId], [courseid]) VALUES (23, NULL, NULL, NULL, NULL, 11, 1)
SET IDENTITY_INSERT [dbo].[results] OFF
GO
SET IDENTITY_INSERT [dbo].[students] ON 

INSERT [dbo].[students] ([id], [rollId], [name], [dob], [sex], [address], [classId]) VALUES (1, N'HE170909', N'Trần Thế Toàn', CAST(N'2003-11-03' AS Date), 1, N'Bắc Ninh', 1)
INSERT [dbo].[students] ([id], [rollId], [name], [dob], [sex], [address], [classId]) VALUES (2, N'HE170910', N'Đỗ Văn Cương', CAST(N'2003-10-10' AS Date), 1, N'Bắc Ninh', 2)
INSERT [dbo].[students] ([id], [rollId], [name], [dob], [sex], [address], [classId]) VALUES (3, N'HE170911', N'Nguyễn Thị Minh', CAST(N'2003-11-20' AS Date), 0, N'Trâu Quỳ', 1)
INSERT [dbo].[students] ([id], [rollId], [name], [dob], [sex], [address], [classId]) VALUES (4, N'HE170912', N'Mai Quốc Hanh', CAST(N'2003-02-11' AS Date), 1, N'Bắc Ninh', 3)
INSERT [dbo].[students] ([id], [rollId], [name], [dob], [sex], [address], [classId]) VALUES (5, N'HE170913', N'Bùi Thị Hậu', CAST(N'2003-01-21' AS Date), 0, N'Lào Cai', 2)
INSERT [dbo].[students] ([id], [rollId], [name], [dob], [sex], [address], [classId]) VALUES (6, N'HE170914', N'Trần Danh Phú', CAST(N'2003-11-16' AS Date), 1, N'Bắc Ninh', 3)
INSERT [dbo].[students] ([id], [rollId], [name], [dob], [sex], [address], [classId]) VALUES (7, N'HE170912', N'Nguyễn Hữu Huy', CAST(N'2003-11-20' AS Date), 1, N'Phuong Canh', 1)
INSERT [dbo].[students] ([id], [rollId], [name], [dob], [sex], [address], [classId]) VALUES (8, N'HE170913', N'Đỗ Minh Tú', CAST(N'2003-12-12' AS Date), 1, N'Phuong Canh', 1)
INSERT [dbo].[students] ([id], [rollId], [name], [dob], [sex], [address], [classId]) VALUES (9, N'HE170914', N'Nguyễn Hữu Quang', CAST(N'2003-11-20' AS Date), 1, N'Phuong Canh', 1)
INSERT [dbo].[students] ([id], [rollId], [name], [dob], [sex], [address], [classId]) VALUES (10, N'HE170915', N'Nguyễn Minh Quang', CAST(N'2003-11-30' AS Date), 0, N'Phú Th?', 1)
INSERT [dbo].[students] ([id], [rollId], [name], [dob], [sex], [address], [classId]) VALUES (11, N'HE170916', N'Trần Thị Thành', CAST(N'2003-11-20' AS Date), 0, N'Ninh Bình', 1)
SET IDENTITY_INSERT [dbo].[students] OFF
GO
SET IDENTITY_INSERT [dbo].[teachers] ON 

INSERT [dbo].[teachers] ([id], [name]) VALUES (1, N'KhaiNN7')
INSERT [dbo].[teachers] ([id], [name]) VALUES (2, N'Nguyễn Xuân Anh')
INSERT [dbo].[teachers] ([id], [name]) VALUES (3, N'Trần Quang Đạt')
SET IDENTITY_INSERT [dbo].[teachers] OFF
GO
SET IDENTITY_INSERT [dbo].[teaching] ON 

INSERT [dbo].[teaching] ([id], [teacherId], [courseId], [classId]) VALUES (1, 1, 1, 1)
INSERT [dbo].[teaching] ([id], [teacherId], [courseId], [classId]) VALUES (2, 1, 1, 2)
INSERT [dbo].[teaching] ([id], [teacherId], [courseId], [classId]) VALUES (3, 1, 3, 1)
INSERT [dbo].[teaching] ([id], [teacherId], [courseId], [classId]) VALUES (4, 2, 2, 3)
INSERT [dbo].[teaching] ([id], [teacherId], [courseId], [classId]) VALUES (5, 2, 3, 3)
INSERT [dbo].[teaching] ([id], [teacherId], [courseId], [classId]) VALUES (6, 3, 1, 3)
INSERT [dbo].[teaching] ([id], [teacherId], [courseId], [classId]) VALUES (7, 3, 2, 2)
INSERT [dbo].[teaching] ([id], [teacherId], [courseId], [classId]) VALUES (8, 3, 2, 1)
INSERT [dbo].[teaching] ([id], [teacherId], [courseId], [classId]) VALUES (9, 1, 2, 1)
SET IDENTITY_INSERT [dbo].[teaching] OFF
GO
ALTER TABLE [dbo].[accounts]  WITH CHECK ADD FOREIGN KEY([teacherId])
REFERENCES [dbo].[teachers] ([id])
GO
ALTER TABLE [dbo].[results]  WITH CHECK ADD FOREIGN KEY([courseid])
REFERENCES [dbo].[courses] ([id])
GO
ALTER TABLE [dbo].[results]  WITH CHECK ADD FOREIGN KEY([studentId])
REFERENCES [dbo].[students] ([id])
GO
ALTER TABLE [dbo].[students]  WITH CHECK ADD FOREIGN KEY([classId])
REFERENCES [dbo].[classes] ([id])
GO
ALTER TABLE [dbo].[teaching]  WITH CHECK ADD FOREIGN KEY([classId])
REFERENCES [dbo].[classes] ([id])
GO
ALTER TABLE [dbo].[teaching]  WITH CHECK ADD FOREIGN KEY([courseId])
REFERENCES [dbo].[courses] ([id])
GO
ALTER TABLE [dbo].[teaching]  WITH CHECK ADD FOREIGN KEY([teacherId])
REFERENCES [dbo].[teachers] ([id])
GO
USE [master]
GO
ALTER DATABASE [SRMSDB] SET  READ_WRITE 
GO
