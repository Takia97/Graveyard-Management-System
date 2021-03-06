USE [master]
GO
/****** Object:  Database [Graveyard]    Script Date: 9/24/2020 2:42:37 PM ******/
CREATE DATABASE [Graveyard]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Graveyard', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQL\MSSQL\DATA\Graveyard.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Graveyard_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQL\MSSQL\DATA\Graveyard_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Graveyard] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Graveyard].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Graveyard] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Graveyard] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Graveyard] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Graveyard] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Graveyard] SET ARITHABORT OFF 
GO
ALTER DATABASE [Graveyard] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Graveyard] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Graveyard] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Graveyard] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Graveyard] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Graveyard] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Graveyard] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Graveyard] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Graveyard] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Graveyard] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Graveyard] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Graveyard] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Graveyard] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Graveyard] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Graveyard] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Graveyard] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Graveyard] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Graveyard] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Graveyard] SET  MULTI_USER 
GO
ALTER DATABASE [Graveyard] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Graveyard] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Graveyard] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Graveyard] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Graveyard] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Graveyard]
GO
/****** Object:  Table [dbo].[GeneralGrave1]    Script Date: 9/24/2020 2:42:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GeneralGrave1](
	[generalGraveId] [int] NOT NULL,
	[generalGraveSize] [varchar](50) NOT NULL,
	[generalCorpseId] [int] IDENTITY(1,1) NOT NULL,
	[corpseType] [varchar](100) NOT NULL,
	[corpseName] [varchar](100) NULL,
	[corpseGender] [varchar](100) NOT NULL,
	[corpseFatherName] [varchar](100) NULL,
	[corpseMotherName] [varchar](100) NULL,
	[corpseDateOfBirth] [date] NULL,
	[corpseDateOfDeath] [date] NULL,
	[corpseTimeOfDeath] [varchar](50) NULL,
	[corpseCauseOfDeath] [varchar](500) NULL,
	[guardianContactNo] [varchar](11) NULL,
	[guardianRelation] [varchar](100) NULL,
	[guardianAddress] [varchar](500) NULL,
	[guardianName] [varchar](200) NULL,
	[corpseNidNo] [varchar](17) NULL,
	[corpseBirthCertificateNo] [varchar](12) NULL,
	[burriedDate] [date] NOT NULL,
	[RecycleDate] [date] NOT NULL,
	[fee] [int] NULL DEFAULT ('0'),
PRIMARY KEY CLUSTERED 
(
	[generalCorpseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[login]    Script Date: 9/24/2020 2:42:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[login](
	[sno] [int] IDENTITY(1,1) NOT NULL,
	[fullname] [varchar](100) NULL,
	[username] [varchar](100) NOT NULL,
	[password1] [varchar](100) NOT NULL,
	[email] [varchar](100) NOT NULL,
	[contactno] [varchar](11) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[sno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OwnerInfo]    Script Date: 9/24/2020 2:42:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OwnerInfo](
	[serialNo] [int] IDENTITY(1,1) NOT NULL,
	[ownerId] [int] NOT NULL,
	[ownerName] [varchar](100) NOT NULL,
	[ownerPhoneNumber] [int] NOT NULL,
	[ownerNidOrBirthCertificate] [varchar](200) NOT NULL,
	[ownerAddress] [varchar](500) NOT NULL,
	[SellingStatus] [varchar](50) NULL DEFAULT ('Available'),
	[generalGraveId] [int] NULL,
	[availablility] [varchar](50) NULL DEFAULT ('empty'),
PRIMARY KEY CLUSTERED 
(
	[serialNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[paymentInfo]    Script Date: 9/24/2020 2:42:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[paymentInfo](
	[paymentid] [int] IDENTITY(1,1) NOT NULL,
	[serialNo] [int] NOT NULL,
	[ownerId] [int] NOT NULL,
	[generalGraveId] [int] NULL,
	[fee] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[paymentid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Permanent_CorpseInfo]    Script Date: 9/24/2020 2:42:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Permanent_CorpseInfo](
	[permanentGraveId] [int] NOT NULL,
	[permanentGraveSize] [varchar](50) NOT NULL,
	[serialNo] [int] NOT NULL,
	[ownerId] [int] NOT NULL,
	[RelationWithOwner] [varchar](200) NULL,
	[availablility] [varchar](50) NOT NULL,
	[permanentCorpseId] [int] IDENTITY(2001,1) NOT NULL,
	[corpseType] [varchar](100) NULL DEFAULT ('Identified'),
	[corpseName] [varchar](100) NOT NULL,
	[corpseGender] [varchar](100) NOT NULL,
	[corpseFatherName] [varchar](100) NOT NULL,
	[corpseMotherName] [varchar](100) NOT NULL,
	[corpseDateOfBirth] [date] NOT NULL,
	[corpseDateOfDeath] [date] NOT NULL,
	[corpseTimeOfDeath] [varchar](22) NOT NULL,
	[corpseCauseOfDeath] [varchar](500) NOT NULL,
	[corpseNidOrBirthCertificate] [varchar](17) NOT NULL,
	[burriedDate] [date] NOT NULL,
	[RecycleDate] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[permanentCorpseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[paymentInfo]  WITH CHECK ADD FOREIGN KEY([serialNo])
REFERENCES [dbo].[OwnerInfo] ([serialNo])
GO
ALTER TABLE [dbo].[Permanent_CorpseInfo]  WITH CHECK ADD FOREIGN KEY([serialNo])
REFERENCES [dbo].[OwnerInfo] ([serialNo])
GO
ALTER TABLE [dbo].[GeneralGrave1]  WITH CHECK ADD CHECK  (([generalGraveId]<(2000)))
GO
ALTER TABLE [dbo].[OwnerInfo]  WITH CHECK ADD CHECK  (([generalGraveId]>(2000)))
GO
ALTER TABLE [dbo].[paymentInfo]  WITH CHECK ADD CHECK  (([generalGraveId]>(2000)))
GO
ALTER TABLE [dbo].[Permanent_CorpseInfo]  WITH CHECK ADD CHECK  (([permanentGraveId]>(2000)))
GO
USE [master]
GO
ALTER DATABASE [Graveyard] SET  READ_WRITE 
GO
