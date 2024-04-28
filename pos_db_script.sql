USE [master]
GO
/****** Object:  Database [Pos]    Script Date: 4/28/2024 9:13:15 PM ******/
CREATE DATABASE [Pos] ON  PRIMARY 
( NAME = N'Pos', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Pos.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Pos_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Pos_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Pos].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Pos] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Pos] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Pos] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Pos] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Pos] SET ARITHABORT OFF 
GO
ALTER DATABASE [Pos] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Pos] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Pos] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Pos] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Pos] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Pos] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Pos] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Pos] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Pos] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Pos] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Pos] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Pos] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Pos] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Pos] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Pos] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Pos] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Pos] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Pos] SET RECOVERY FULL 
GO
ALTER DATABASE [Pos] SET  MULTI_USER 
GO
ALTER DATABASE [Pos] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Pos] SET DB_CHAINING OFF 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Pos', N'ON'
GO
USE [Pos]
GO
/****** Object:  Table [dbo].[Tbl_Product]    Script Date: 4/28/2024 9:13:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Product](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[ProductCode] [nvarchar](50) NOT NULL,
	[ProductCategoryCode] [nvarchar](50) NOT NULL,
	[ProductName] [nvarchar](50) NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_Tbl_Product] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_ProductCategory]    Script Date: 4/28/2024 9:13:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_ProductCategory](
	[ProductCategoryId] [int] IDENTITY(1,1) NOT NULL,
	[ProductCategoryCode] [varchar](50) NOT NULL,
	[ProductCategoryName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ProductCategory] PRIMARY KEY CLUSTERED 
(
	[ProductCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_SaleInvoice]    Script Date: 4/28/2024 9:13:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_SaleInvoice](
	[SaleInvoiceId] [int] IDENTITY(1,1) NOT NULL,
	[SaleInvoiceDateTime] [datetime] NOT NULL,
	[VoucherNo] [nvarchar](20) NOT NULL,
	[TotalAmount] [decimal](18, 2) NOT NULL,
	[Discount] [decimal](18, 2) NOT NULL,
	[StaffCode] [nvarchar](50) NOT NULL,
	[Tax] [decimal](18, 2) NOT NULL,
	[PaymentType] [nvarchar](10) NULL,
	[CustomerAccountNo] [nvarchar](20) NULL,
	[PaymentAmount] [decimal](18, 2) NULL,
	[ReceiveAmount] [decimal](18, 2) NULL,
	[Change] [decimal](18, 2) NULL,
	[CustomerCode] [nvarchar](50) NULL,
 CONSTRAINT [PK_Tbl_SaleInvoice] PRIMARY KEY CLUSTERED 
(
	[SaleInvoiceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_SaleInvoiceDetail]    Script Date: 4/28/2024 9:13:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_SaleInvoiceDetail](
	[SaleInvoiceDetailId] [int] IDENTITY(1,1) NOT NULL,
	[VoucherNo] [nvarchar](20) NOT NULL,
	[ProductCode] [nvarchar](50) NOT NULL,
	[Quantity] [int] NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[Amount] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_Tbl_SaleInvoiceDetail] PRIMARY KEY CLUSTERED 
(
	[SaleInvoiceDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Sequence]    Script Date: 4/28/2024 9:13:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Sequence](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Field] [nvarchar](50) NOT NULL,
	[Code] [nvarchar](50) NOT NULL,
	[Length] [int] NOT NULL,
	[Sequence] [int] NOT NULL,
 CONSTRAINT [PK_Tbl_Sequence] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Shop]    Script Date: 4/28/2024 9:13:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Shop](
	[ShopId] [int] IDENTITY(1,1) NOT NULL,
	[ShopCode] [varchar](50) NOT NULL,
	[ShopName] [varchar](50) NOT NULL,
	[MobileNo] [varchar](50) NOT NULL,
	[Address] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Shop] PRIMARY KEY CLUSTERED 
(
	[ShopId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Staff]    Script Date: 4/28/2024 9:13:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Staff](
	[StaffId] [int] IDENTITY(1,1) NOT NULL,
	[StaffCode] [varchar](50) NOT NULL,
	[StaffName] [varchar](50) NOT NULL,
	[DateOfBirth] [datetime] NOT NULL,
	[MobileNo] [varchar](50) NOT NULL,
	[Address] [varchar](50) NOT NULL,
	[Gender] [varchar](50) NOT NULL,
	[Position] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Staff] PRIMARY KEY CLUSTERED 
(
	[StaffId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[Sp_GenerateSaleInvoiceNo]    Script Date: 4/28/2024 9:13:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[Sp_GenerateSaleInvoiceNo]
as
begin

	declare @Seq int, @Code varchar(50), @Length int
	select @Seq = Sequence + 1, @Code = Code, @Length = Length from Tbl_Sequence 
	where Field = 'SaleInvoice'

	print(@Seq)
	print(@Code)
	print(@Length)

	update Tbl_Sequence
	set Sequence = @Seq
	where Field = 'SaleInvoice'

	select @Code + CONCAT(REPLICATE('0', @Length - LEN(@Seq)), @Seq)
end
GO
USE [master]
GO
ALTER DATABASE [Pos] SET  READ_WRITE 
GO
