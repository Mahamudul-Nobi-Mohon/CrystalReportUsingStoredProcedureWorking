USE [master]
GO
/****** Object:  Database [Customers]    Script Date: 6/8/2017 3:32:28 PM ******/
CREATE DATABASE [Customers]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Customers', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Customers.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Customers_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Customers_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Customers] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Customers].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Customers] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Customers] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Customers] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Customers] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Customers] SET ARITHABORT OFF 
GO
ALTER DATABASE [Customers] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Customers] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Customers] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Customers] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Customers] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Customers] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Customers] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Customers] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Customers] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Customers] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Customers] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Customers] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Customers] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Customers] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Customers] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Customers] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Customers] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Customers] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Customers] SET  MULTI_USER 
GO
ALTER DATABASE [Customers] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Customers] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Customers] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Customers] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Customers] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Customers]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 6/8/2017 3:32:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[CustomerId] [int] NOT NULL,
	[ContactName] [nvarchar](50) NULL,
	[City] [nvarchar](50) NULL,
	[Country] [nvarchar](50) NULL,
	[EntryDate] [datetime] NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[salary]    Script Date: 6/8/2017 3:32:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[salary](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[customer_id] [int] NULL,
	[salary] [decimal](18, 0) NULL,
 CONSTRAINT [PK_salary] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[Customers] ([CustomerId], [ContactName], [City], [Country], [EntryDate]) VALUES (1, N'mohon', N'dhaka', N'bangladesh', CAST(N'2017-01-01 00:00:00.000' AS DateTime))
INSERT [dbo].[Customers] ([CustomerId], [ContactName], [City], [Country], [EntryDate]) VALUES (2, N'mizan', N'comilla', N'bangladesh', CAST(N'2017-01-02 00:00:00.000' AS DateTime))
INSERT [dbo].[Customers] ([CustomerId], [ContactName], [City], [Country], [EntryDate]) VALUES (3, N'shojib', N'shiliguri', N'india', CAST(N'2017-01-02 00:00:00.000' AS DateTime))
INSERT [dbo].[Customers] ([CustomerId], [ContactName], [City], [Country], [EntryDate]) VALUES (4, N'muzammel', N'indon', N'indoneshia', CAST(N'2017-01-04 00:00:00.000' AS DateTime))
INSERT [dbo].[Customers] ([CustomerId], [ContactName], [City], [Country], [EntryDate]) VALUES (5, N'Shobuj', N'Dhaka', N'Bangladesh', CAST(N'2017-02-03 00:00:00.000' AS DateTime))
INSERT [dbo].[Customers] ([CustomerId], [ContactName], [City], [Country], [EntryDate]) VALUES (6, N'Ronjon', N'Khulna', N'Bangladesh', CAST(N'2017-02-02 00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[salary] ON 

INSERT [dbo].[salary] ([Id], [customer_id], [salary]) VALUES (1, 3, CAST(3000 AS Decimal(18, 0)))
INSERT [dbo].[salary] ([Id], [customer_id], [salary]) VALUES (2, 2, CAST(2000 AS Decimal(18, 0)))
INSERT [dbo].[salary] ([Id], [customer_id], [salary]) VALUES (3, 4, CAST(4000 AS Decimal(18, 0)))
INSERT [dbo].[salary] ([Id], [customer_id], [salary]) VALUES (4, 1, CAST(1000 AS Decimal(18, 0)))
INSERT [dbo].[salary] ([Id], [customer_id], [salary]) VALUES (5, 5, CAST(5000 AS Decimal(18, 0)))
INSERT [dbo].[salary] ([Id], [customer_id], [salary]) VALUES (6, 6, CAST(6000 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[salary] OFF
/****** Object:  StoredProcedure [dbo].[getCustomersWithSalary]    Script Date: 6/8/2017 3:32:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getCustomersWithSalary]
@startDate varchar(50),
@endDate varchar(50)
AS
BEGIN
 select Customers.ContactName,Customers.City,Customers.Country,salary.salary from customers
  inner join salary on Customers.CustomerId = salary.customer_id where Customers.EntryDate between 
  @startDate and @endDate
END


GO
USE [master]
GO
ALTER DATABASE [Customers] SET  READ_WRITE 
GO
