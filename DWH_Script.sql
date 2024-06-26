USE [master]
GO
/****** Object:  Database [tradexpress-dwh]    Script Date: 4/3/2024 10:18:33 PM ******/
CREATE DATABASE [tradexpress-dwh]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'dwh', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MU3\MSSQL\DATA\dwh.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'dwh_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MU3\MSSQL\DATA\dwh_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [tradexpress-dwh] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [tradexpress-dwh].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [tradexpress-dwh] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [tradexpress-dwh] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [tradexpress-dwh] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [tradexpress-dwh] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [tradexpress-dwh] SET ARITHABORT OFF 
GO
ALTER DATABASE [tradexpress-dwh] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [tradexpress-dwh] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [tradexpress-dwh] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [tradexpress-dwh] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [tradexpress-dwh] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [tradexpress-dwh] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [tradexpress-dwh] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [tradexpress-dwh] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [tradexpress-dwh] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [tradexpress-dwh] SET  DISABLE_BROKER 
GO
ALTER DATABASE [tradexpress-dwh] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [tradexpress-dwh] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [tradexpress-dwh] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [tradexpress-dwh] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [tradexpress-dwh] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [tradexpress-dwh] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [tradexpress-dwh] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [tradexpress-dwh] SET RECOVERY FULL 
GO
ALTER DATABASE [tradexpress-dwh] SET  MULTI_USER 
GO
ALTER DATABASE [tradexpress-dwh] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [tradexpress-dwh] SET DB_CHAINING OFF 
GO
ALTER DATABASE [tradexpress-dwh] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [tradexpress-dwh] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [tradexpress-dwh] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'tradexpress-dwh', N'ON'
GO
ALTER DATABASE [tradexpress-dwh] SET QUERY_STORE = OFF
GO
USE [tradexpress-dwh]
GO
/****** Object:  Table [dbo].[DimCustomer]    Script Date: 4/3/2024 10:18:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimCustomer](
	[customerID] [nvarchar](255) NOT NULL,
	[companyName] [nvarchar](255) NULL,
	[contactTitle] [nvarchar](255) NULL,
	[contactName] [nvarchar](255) NULL,
	[city] [nvarchar](255) NULL,
	[country] [nvarchar](255) NULL,
 CONSTRAINT [PK_DimCustomer] PRIMARY KEY CLUSTERED 
(
	[customerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimDate]    Script Date: 4/3/2024 10:18:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimDate](
	[Date] [date] NOT NULL,
	[Day] [tinyint] NULL,
	[WeekDayName] [varchar](10) NULL,
	[Month] [tinyint] NULL,
	[MonthName] [varchar](10) NULL,
	[Quarter] [tinyint] NULL,
	[Year] [int] NULL,
 CONSTRAINT [PK_DimDate] PRIMARY KEY CLUSTERED 
(
	[Date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimEmployee]    Script Date: 4/3/2024 10:18:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimEmployee](
	[employeeID] [float] NOT NULL,
	[employeeName] [nvarchar](255) NULL,
	[title] [nvarchar](255) NULL,
	[city] [nvarchar](255) NULL,
	[country] [nvarchar](255) NULL,
	[reportsTo] [float] NULL,
 CONSTRAINT [PK_DimEmployee] PRIMARY KEY CLUSTERED 
(
	[employeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimProduct]    Script Date: 4/3/2024 10:18:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimProduct](
	[productID] [float] NOT NULL,
	[Category] [nvarchar](255) NULL,
	[SubCategory] [nvarchar](255) NULL,
	[productName] [nvarchar](255) NULL,
	[unitPrice] [float] NULL,
	[discount] [float] NULL,
 CONSTRAINT [PK_DimProduct] PRIMARY KEY CLUSTERED 
(
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimSalesMGR]    Script Date: 4/3/2024 10:18:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimSalesMGR](
	[SalesManagerId] [float] NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_DimSalesMGR] PRIMARY KEY CLUSTERED 
(
	[SalesManagerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimShipper]    Script Date: 4/3/2024 10:18:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimShipper](
	[shipperID] [float] NOT NULL,
	[CompanyName] [nvarchar](255) NULL,
 CONSTRAINT [PK_DimShipper] PRIMARY KEY CLUSTERED 
(
	[shipperID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FactOrders]    Script Date: 4/3/2024 10:18:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FactOrders](
	[OrderDetailID] [int] NOT NULL,
	[orderID] [int] NULL,
	[customerID] [nvarchar](255) NULL,
	[employeeID] [float] NULL,
	[orderDate] [date] NULL,
	[requiredDate] [date] NULL,
	[shippedDate] [date] NULL,
	[shipperID] [float] NULL,
	[productID] [float] NULL,
	[unitPrice] [float] NULL,
	[quantity] [float] NULL,
	[discount] [float] NULL,
	[freight] [float] NULL,
 CONSTRAINT [PK_FactOrders] PRIMARY KEY CLUSTERED 
(
	[OrderDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DimSalesMGR]  WITH CHECK ADD  CONSTRAINT [FK_DimSalesMGR_DimEmployee] FOREIGN KEY([SalesManagerId])
REFERENCES [dbo].[DimEmployee] ([employeeID])
GO
ALTER TABLE [dbo].[DimSalesMGR] CHECK CONSTRAINT [FK_DimSalesMGR_DimEmployee]
GO
ALTER TABLE [dbo].[FactOrders]  WITH CHECK ADD  CONSTRAINT [FK_FactOrders_DimCustomer] FOREIGN KEY([customerID])
REFERENCES [dbo].[DimCustomer] ([customerID])
GO
ALTER TABLE [dbo].[FactOrders] CHECK CONSTRAINT [FK_FactOrders_DimCustomer]
GO
ALTER TABLE [dbo].[FactOrders]  WITH CHECK ADD  CONSTRAINT [FK_FactOrders_DimDate] FOREIGN KEY([orderDate])
REFERENCES [dbo].[DimDate] ([Date])
GO
ALTER TABLE [dbo].[FactOrders] CHECK CONSTRAINT [FK_FactOrders_DimDate]
GO
ALTER TABLE [dbo].[FactOrders]  WITH CHECK ADD  CONSTRAINT [FK_FactOrders_DimDate1] FOREIGN KEY([requiredDate])
REFERENCES [dbo].[DimDate] ([Date])
GO
ALTER TABLE [dbo].[FactOrders] CHECK CONSTRAINT [FK_FactOrders_DimDate1]
GO
ALTER TABLE [dbo].[FactOrders]  WITH CHECK ADD  CONSTRAINT [FK_FactOrders_DimDate2] FOREIGN KEY([shippedDate])
REFERENCES [dbo].[DimDate] ([Date])
GO
ALTER TABLE [dbo].[FactOrders] CHECK CONSTRAINT [FK_FactOrders_DimDate2]
GO
ALTER TABLE [dbo].[FactOrders]  WITH CHECK ADD  CONSTRAINT [FK_FactOrders_DimEmployee] FOREIGN KEY([employeeID])
REFERENCES [dbo].[DimEmployee] ([employeeID])
GO
ALTER TABLE [dbo].[FactOrders] CHECK CONSTRAINT [FK_FactOrders_DimEmployee]
GO
ALTER TABLE [dbo].[FactOrders]  WITH CHECK ADD  CONSTRAINT [FK_FactOrders_DimProduct] FOREIGN KEY([productID])
REFERENCES [dbo].[DimProduct] ([productID])
GO
ALTER TABLE [dbo].[FactOrders] CHECK CONSTRAINT [FK_FactOrders_DimProduct]
GO
ALTER TABLE [dbo].[FactOrders]  WITH CHECK ADD  CONSTRAINT [FK_FactOrders_DimShipper] FOREIGN KEY([shipperID])
REFERENCES [dbo].[DimShipper] ([shipperID])
GO
ALTER TABLE [dbo].[FactOrders] CHECK CONSTRAINT [FK_FactOrders_DimShipper]
GO
USE [master]
GO
ALTER DATABASE [tradexpress-dwh] SET  READ_WRITE 
GO
