USE [master]
GO
/****** Object:  Database [KhoIntech22]    Script Date: 24/01/2022 15:55:48 ******/
CREATE DATABASE [KhoIntech22]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'KhoIntech22', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.INTECH\MSSQL\DATA\KhoIntech22.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'KhoIntech22_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.INTECH\MSSQL\DATA\KhoIntech22_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [KhoIntech22].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [KhoIntech22] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [KhoIntech22] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [KhoIntech22] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [KhoIntech22] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [KhoIntech22] SET ARITHABORT OFF 
GO
ALTER DATABASE [KhoIntech22] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [KhoIntech22] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [KhoIntech22] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [KhoIntech22] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [KhoIntech22] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [KhoIntech22] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [KhoIntech22] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [KhoIntech22] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [KhoIntech22] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [KhoIntech22] SET  ENABLE_BROKER 
GO
ALTER DATABASE [KhoIntech22] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [KhoIntech22] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [KhoIntech22] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [KhoIntech22] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [KhoIntech22] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [KhoIntech22] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [KhoIntech22] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [KhoIntech22] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [KhoIntech22] SET  MULTI_USER 
GO
ALTER DATABASE [KhoIntech22] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [KhoIntech22] SET DB_CHAINING OFF 
GO
ALTER DATABASE [KhoIntech22] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [KhoIntech22] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
USE [KhoIntech22]
GO
/****** Object:  User [sa4]    Script Date: 24/01/2022 15:55:48 ******/
CREATE USER [sa4] FOR LOGIN [sa4] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [sa3]    Script Date: 24/01/2022 15:55:48 ******/
CREATE USER [sa3] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [sa2]    Script Date: 24/01/2022 15:55:48 ******/
CREATE USER [sa2] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [sa11]    Script Date: 24/01/2022 15:55:48 ******/
CREATE USER [sa11] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [sa1]    Script Date: 24/01/2022 15:55:48 ******/
CREATE USER [sa1] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [sa4]
GO
ALTER ROLE [db_owner] ADD MEMBER [sa3]
GO
ALTER ROLE [db_owner] ADD MEMBER [sa2]
GO
/****** Object:  Table [dbo].[ACCOUNT]    Script Date: 24/01/2022 15:55:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ACCOUNT](
	[UserName] [char](20) NOT NULL,
	[Pass] [char](16) NOT NULL,
	[remember] [bit] NULL,
	[fullName] [nvarchar](100) NOT NULL,
	[position] [nvarchar](20) NOT NULL,
	[id] [int] NOT NULL,
	[sex] [nvarchar](5) NULL,
PRIMARY KEY CLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CAUHINHKHAY]    Script Date: 24/01/2022 15:55:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CAUHINHKHAY](
	[tenKhay] [char](10) NOT NULL,
	[ViTriO] [char](10) NOT NULL,
	[locationX] [int] NOT NULL,
	[locationy] [int] NOT NULL,
	[width] [int] NOT NULL,
	[height] [int] NOT NULL,
	[chieuCao] [int] NULL,
	[tinhTrangO] [int] NULL,
	[sttKhay] [int] NULL,
	[sttO] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ViTriO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DONVITINH]    Script Date: 24/01/2022 15:55:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DONVITINH](
	[STT] [int] IDENTITY(1,1) NOT NULL,
	[DonViTinh] [nvarchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DonViTinh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DsNhapHang]    Script Date: 24/01/2022 15:55:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DsNhapHang](
	[STT] [int] NOT NULL,
	[MaSp] [char](25) NOT NULL,
	[TenSp] [nvarchar](100) NOT NULL,
	[Maker] [nvarchar](50) NULL,
	[DonViTinh] [nvarchar](10) NOT NULL,
	[SoLuong] [int] NOT NULL,
	[ViTriO] [char](10) NOT NULL,
	[SoLuongMaxO] [int] NULL,
	[DienGiai] [ntext] NULL,
	[checkDay] [bit] NULL,
	[QuyDoi] [ntext] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DSSANPHAM]    Script Date: 24/01/2022 15:55:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DSSANPHAM](
	[MaSp] [char](25) NOT NULL,
	[TenSp] [nvarchar](100) NOT NULL,
	[NhomSp] [nvarchar](50) NULL,
	[Maker] [nvarchar](50) NULL,
	[DonViTinh] [nvarchar](10) NULL,
	[KhoiLuong] [float] NULL,
	[Cdai] [float] NULL,
	[cRong] [float] NULL,
	[cCao] [float] NULL,
	[DonGia] [float] NULL,
	[SoLuongTon] [int] NULL,
	[QuyDoi] [ntext] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaSp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DsXuatHang]    Script Date: 24/01/2022 15:55:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DsXuatHang](
	[STT] [int] NOT NULL,
	[MaSp] [char](25) NOT NULL,
	[TenSp] [nvarchar](100) NOT NULL,
	[Maker] [nvarchar](50) NULL,
	[DonViTinh] [nvarchar](10) NOT NULL,
	[SoLuongXuat] [int] NOT NULL,
	[ViTriO] [char](10) NOT NULL,
	[SoLuongTon] [int] NOT NULL,
	[DienGiai] [ntext] NULL,
	[QuyDoi] [ntext] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[History]    Script Date: 24/01/2022 15:55:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[History](
	[Ngay] [datetime] NOT NULL,
	[MaSp] [char](25) NOT NULL,
	[TenSp] [nvarchar](100) NOT NULL,
	[Maker] [nvarchar](50) NULL,
	[TacVu] [nvarchar](15) NOT NULL,
	[DonViTinh] [nvarchar](10) NOT NULL,
	[SoLuong] [int] NOT NULL,
	[ViTriO] [char](10) NOT NULL,
	[DienGiai] [ntext] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LISTKHAY]    Script Date: 24/01/2022 15:55:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LISTKHAY](
	[TenKhay] [char](10) NULL,
	[State] [int] NULL,
	[W_Min] [int] NULL,
	[H_Min] [int] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[listNhap]    Script Date: 24/01/2022 15:55:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[listNhap](
	[MaSp] [char](25) NOT NULL,
	[SoLuong] [int] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[listXuat]    Script Date: 24/01/2022 15:55:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[listXuat](
	[MaSp] [char](25) NOT NULL,
	[SoLuong] [int] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NHOMSP]    Script Date: 24/01/2022 15:55:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NHOMSP](
	[STT] [int] IDENTITY(1,1) NOT NULL,
	[NhomSp] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[NhomSp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TACVU]    Script Date: 24/01/2022 15:55:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TACVU](
	[STT] [int] IDENTITY(1,1) NOT NULL,
	[TacVu] [nvarchar](15) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TacVu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TASK]    Script Date: 24/01/2022 15:55:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TASK](
	[Time] [datetime] NULL,
	[task] [nvarchar](15) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbBackUp]    Script Date: 24/01/2022 15:55:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbBackUp](
	[STT] [int] IDENTITY(1,1) NOT NULL,
	[Ngay] [datetime] NULL,
	[TangDi] [char](10) NOT NULL,
	[TangDen] [char](10) NOT NULL,
	[TrangThai] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[STT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TonKho]    Script Date: 24/01/2022 15:55:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TonKho](
	[MaSp] [char](25) NOT NULL,
	[TenSp] [nvarchar](100) NOT NULL,
	[NhomSp] [nvarchar](50) NULL,
	[Maker] [nvarchar](50) NULL,
	[DonViTinh] [nvarchar](10) NOT NULL,
	[SoLuong] [int] NOT NULL,
	[ViTriO] [char](10) NOT NULL,
	[SoLuongMaxO] [int] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[ACCOUNT] ([UserName], [Pass], [remember], [fullName], [position], [id], [sex]) VALUES (N'admin               ', N'11111           ', 1, N'Vũ Minh Đức', N'NVKT', 528, N'Khác')
INSERT [dbo].[ACCOUNT] ([UserName], [Pass], [remember], [fullName], [position], [id], [sex]) VALUES (N'hauluong            ', N'11111           ', 0, N'Lương Thị Hậu', N'NVK', 678, N'Nữ')
GO
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'F14       ', N'F14-1     ', 3, 3, 46, 95, 1, 1, 14, 1)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'F14       ', N'F14-10    ', 444, 3, 46, 95, 1, 1, 14, 10)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'F14       ', N'F14-11    ', 493, 3, 46, 95, 1, 1, 14, 11)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'F14       ', N'F14-12    ', 542, 3, 46, 95, 1, 1, 14, 12)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'F14       ', N'F14-13    ', 3, 101, 46, 95, 1, 1, 14, 13)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'F14       ', N'F14-14    ', 52, 101, 46, 95, 1, 1, 14, 14)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'F14       ', N'F14-15    ', 101, 101, 46, 95, 1, 1, 14, 15)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'F14       ', N'F14-16    ', 150, 101, 46, 95, 1, 1, 14, 16)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'F14       ', N'F14-17    ', 199, 101, 46, 95, 1, 1, 14, 17)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'F14       ', N'F14-18    ', 248, 101, 46, 95, 1, 1, 14, 18)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'F14       ', N'F14-19    ', 297, 101, 46, 95, 1, 1, 14, 19)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'F14       ', N'F14-2     ', 52, 3, 46, 95, 1, 1, 14, 2)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'F14       ', N'F14-20    ', 346, 101, 46, 95, 1, 1, 14, 20)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'F14       ', N'F14-21    ', 395, 101, 46, 95, 1, 1, 14, 21)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'F14       ', N'F14-22    ', 444, 101, 46, 95, 1, 1, 14, 22)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'F14       ', N'F14-23    ', 493, 101, 46, 95, 1, 1, 14, 23)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'F14       ', N'F14-24    ', 542, 101, 46, 95, 1, 0, 14, 24)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'F14       ', N'F14-3     ', 101, 3, 46, 95, 1, 1, 14, 3)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'F14       ', N'F14-4     ', 150, 3, 46, 95, 1, 1, 14, 4)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'F14       ', N'F14-5     ', 199, 3, 46, 95, 1, 1, 14, 5)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'F14       ', N'F14-6     ', 248, 3, 46, 95, 1, 1, 14, 6)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'F14       ', N'F14-7     ', 297, 3, 46, 95, 1, 1, 14, 7)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'F14       ', N'F14-8     ', 346, 3, 46, 95, 1, 1, 14, 8)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'F14       ', N'F14-9     ', 395, 3, 46, 95, 1, 1, 14, 9)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'F16       ', N'F16-1     ', 3, 3, 46, 95, 1, 0, 16, 1)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'F16       ', N'F16-10    ', 444, 3, 46, 95, 1, 0, 16, 10)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'F16       ', N'F16-11    ', 493, 3, 46, 95, 1, 0, 16, 11)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'F16       ', N'F16-12    ', 542, 3, 46, 95, 1, 0, 16, 12)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'F16       ', N'F16-13    ', 3, 101, 46, 95, 1, 0, 16, 13)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'F16       ', N'F16-14    ', 52, 101, 46, 95, 1, 0, 16, 14)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'F16       ', N'F16-15    ', 101, 101, 46, 95, 1, 0, 16, 15)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'F16       ', N'F16-16    ', 150, 101, 46, 95, 1, 0, 16, 16)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'F16       ', N'F16-17    ', 199, 101, 46, 95, 1, 0, 16, 17)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'F16       ', N'F16-18    ', 248, 101, 46, 95, 1, 0, 16, 18)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'F16       ', N'F16-19    ', 297, 101, 46, 95, 1, 0, 16, 19)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'F16       ', N'F16-2     ', 52, 3, 46, 95, 1, 0, 16, 2)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'F16       ', N'F16-20    ', 346, 101, 242, 95, 1, 0, 16, 20)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'F16       ', N'F16-3     ', 101, 3, 46, 95, 1, 0, 16, 3)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'F16       ', N'F16-4     ', 150, 3, 46, 95, 1, 0, 16, 4)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'F16       ', N'F16-5     ', 199, 3, 46, 95, 1, 0, 16, 5)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'F16       ', N'F16-6     ', 248, 3, 46, 95, 1, 0, 16, 6)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'F16       ', N'F16-7     ', 297, 3, 46, 95, 1, 0, 16, 7)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'F16       ', N'F16-8     ', 346, 3, 46, 95, 1, 0, 16, 8)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'F16       ', N'F16-9     ', 395, 3, 46, 95, 1, 0, 16, 9)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'F18       ', N'F18-1     ', 3, 3, 69, 95, 1, 0, 18, 1)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'F18       ', N'F18-10    ', 3, 101, 45, 95, 1, 0, 18, 10)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'F18       ', N'F18-11    ', 51, 101, 45, 95, 1, 0, 18, 11)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'F18       ', N'F18-12    ', 99, 101, 45, 95, 1, 0, 18, 12)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'F18       ', N'F18-13    ', 147, 101, 45, 95, 1, 0, 18, 13)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'F18       ', N'F18-14    ', 195, 101, 45, 95, 1, 0, 18, 14)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'F18       ', N'F18-15    ', 243, 101, 45, 95, 1, 0, 18, 15)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'F18       ', N'F18-16    ', 291, 101, 45, 95, 1, 0, 18, 16)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'F18       ', N'F18-17    ', 339, 101, 45, 95, 1, 0, 18, 17)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'F18       ', N'F18-18    ', 387, 101, 45, 95, 1, 0, 18, 18)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'F18       ', N'F18-19    ', 435, 101, 45, 95, 1, 0, 18, 19)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'F18       ', N'F18-2     ', 75, 3, 69, 95, 1, 0, 18, 2)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'F18       ', N'F18-20    ', 483, 101, 45, 95, 1, 0, 18, 20)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'F18       ', N'F18-21    ', 531, 101, 45, 95, 1, 0, 18, 21)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'F18       ', N'F18-3     ', 147, 3, 69, 95, 1, 0, 18, 3)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'F18       ', N'F18-4     ', 219, 3, 69, 95, 1, 0, 18, 4)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'F18       ', N'F18-5     ', 291, 3, 69, 95, 1, 0, 18, 5)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'F18       ', N'F18-6     ', 363, 3, 69, 95, 1, 0, 18, 6)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'F18       ', N'F18-7     ', 435, 3, 69, 95, 1, 0, 18, 7)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'F18       ', N'F18-8     ', 507, 3, 45, 95, 1, 0, 18, 8)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'F18       ', N'F18-9     ', 555, 3, 21, 95, 1, 0, 18, 9)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'F20       ', N'F20-1     ', 3, 3, 69, 95, 1, 0, 20, 1)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'F20       ', N'F20-10    ', 3, 101, 45, 95, 1, 0, 20, 10)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'F20       ', N'F20-11    ', 51, 101, 45, 95, 1, 0, 20, 11)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'F20       ', N'F20-12    ', 99, 101, 45, 95, 1, 0, 20, 12)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'F20       ', N'F20-13    ', 147, 101, 45, 95, 1, 0, 20, 13)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'F20       ', N'F20-14    ', 195, 101, 45, 95, 1, 0, 20, 14)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'F20       ', N'F20-15    ', 243, 101, 45, 95, 1, 0, 20, 15)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'F20       ', N'F20-16    ', 291, 101, 45, 95, 1, 0, 20, 16)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'F20       ', N'F20-17    ', 339, 101, 45, 95, 1, 0, 20, 17)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'F20       ', N'F20-18    ', 387, 101, 45, 95, 1, 0, 20, 18)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'F20       ', N'F20-19    ', 435, 101, 45, 95, 1, 0, 20, 19)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'F20       ', N'F20-2     ', 75, 3, 69, 95, 1, 0, 20, 2)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'F20       ', N'F20-20    ', 483, 101, 45, 95, 1, 0, 20, 20)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'F20       ', N'F20-21    ', 531, 101, 45, 95, 1, 0, 20, 21)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'F20       ', N'F20-3     ', 147, 3, 69, 95, 1, 0, 20, 3)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'F20       ', N'F20-4     ', 219, 3, 69, 95, 1, 0, 20, 4)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'F20       ', N'F20-5     ', 291, 3, 69, 95, 1, 0, 20, 5)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'F20       ', N'F20-6     ', 363, 3, 69, 95, 1, 0, 20, 6)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'F20       ', N'F20-7     ', 435, 3, 69, 95, 1, 0, 20, 7)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'F20       ', N'F20-8     ', 507, 3, 45, 95, 1, 0, 20, 8)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'F20       ', N'F20-9     ', 555, 3, 21, 95, 1, 0, 20, 9)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'F22       ', N'F22-1     ', 3, 3, 46, 95, 1, 1, 22, 1)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'F22       ', N'F22-10    ', 444, 3, 46, 95, 1, 0, 22, 10)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'F22       ', N'F22-11    ', 493, 3, 46, 95, 1, 0, 22, 11)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'F22       ', N'F22-12    ', 542, 3, 46, 95, 1, 0, 22, 12)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'F22       ', N'F22-13    ', 3, 101, 46, 95, 1, 0, 22, 13)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'F22       ', N'F22-14    ', 52, 101, 46, 95, 1, 0, 22, 14)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'F22       ', N'F22-15    ', 101, 101, 46, 95, 1, 0, 22, 15)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'F22       ', N'F22-16    ', 150, 101, 46, 95, 1, 0, 22, 16)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'F22       ', N'F22-17    ', 199, 101, 46, 95, 1, 0, 22, 17)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'F22       ', N'F22-18    ', 248, 101, 46, 95, 1, 0, 22, 18)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'F22       ', N'F22-19    ', 297, 101, 46, 95, 1, 0, 22, 19)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'F22       ', N'F22-2     ', 52, 3, 46, 95, 1, 1, 22, 2)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'F22       ', N'F22-20    ', 346, 101, 46, 95, 1, 0, 22, 20)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'F22       ', N'F22-21    ', 395, 101, 46, 95, 1, 0, 22, 21)
GO
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'F22       ', N'F22-22    ', 444, 101, 46, 95, 1, 0, 22, 22)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'F22       ', N'F22-23    ', 493, 101, 46, 95, 1, 0, 22, 23)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'F22       ', N'F22-24    ', 542, 101, 46, 95, 1, 0, 22, 24)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'F22       ', N'F22-3     ', 101, 3, 46, 95, 1, 1, 22, 3)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'F22       ', N'F22-4     ', 150, 3, 46, 95, 1, 1, 22, 4)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'F22       ', N'F22-5     ', 199, 3, 46, 95, 1, 1, 22, 5)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'F22       ', N'F22-6     ', 248, 3, 46, 95, 1, 1, 22, 6)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'F22       ', N'F22-7     ', 297, 3, 46, 95, 1, 1, 22, 7)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'F22       ', N'F22-8     ', 346, 3, 46, 95, 1, 1, 22, 8)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'F22       ', N'F22-9     ', 395, 3, 46, 95, 1, 0, 22, 9)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'F24       ', N'F24-1     ', 3, 3, 69, 95, 1, 0, 24, 1)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'F24       ', N'F24-10    ', 3, 101, 45, 95, 1, 0, 24, 10)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'F24       ', N'F24-11    ', 51, 101, 45, 95, 1, 0, 24, 11)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'F24       ', N'F24-12    ', 99, 101, 45, 95, 1, 0, 24, 12)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'F24       ', N'F24-13    ', 147, 101, 45, 95, 1, 0, 24, 13)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'F24       ', N'F24-14    ', 195, 101, 45, 95, 1, 0, 24, 14)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'F24       ', N'F24-15    ', 243, 101, 45, 95, 1, 0, 24, 15)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'F24       ', N'F24-16    ', 291, 101, 45, 95, 1, 0, 24, 16)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'F24       ', N'F24-17    ', 339, 101, 45, 95, 1, 0, 24, 17)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'F24       ', N'F24-18    ', 387, 101, 45, 95, 1, 0, 24, 18)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'F24       ', N'F24-19    ', 435, 101, 45, 95, 1, 0, 24, 19)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'F24       ', N'F24-2     ', 75, 3, 69, 95, 1, 0, 24, 2)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'F24       ', N'F24-20    ', 483, 101, 45, 95, 1, 0, 24, 20)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'F24       ', N'F24-21    ', 531, 101, 45, 95, 1, 0, 24, 21)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'F24       ', N'F24-3     ', 147, 3, 69, 95, 1, 0, 24, 3)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'F24       ', N'F24-4     ', 219, 3, 69, 95, 1, 0, 24, 4)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'F24       ', N'F24-5     ', 291, 3, 69, 95, 1, 0, 24, 5)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'F24       ', N'F24-6     ', 363, 3, 69, 95, 1, 0, 24, 6)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'F24       ', N'F24-7     ', 435, 3, 69, 95, 1, 0, 24, 7)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'F24       ', N'F24-8     ', 507, 3, 45, 95, 1, 0, 24, 8)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'F24       ', N'F24-9     ', 555, 3, 21, 95, 1, 0, 24, 9)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R1        ', N'R1-1      ', 3, 3, 193, 95, 1, 1, 1, 1)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R1        ', N'R1-10     ', 150, 101, 46, 95, 1, 1, 1, 10)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R1        ', N'R1-11     ', 199, 101, 46, 95, 1, 1, 1, 11)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R1        ', N'R1-12     ', 248, 101, 46, 95, 1, 1, 1, 12)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R1        ', N'R1-13     ', 297, 101, 46, 95, 1, 1, 1, 13)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R1        ', N'R1-14     ', 346, 101, 46, 95, 1, 1, 1, 14)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R1        ', N'R1-15     ', 395, 101, 46, 95, 1, 1, 1, 15)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R1        ', N'R1-16     ', 444, 101, 144, 95, 1, 1, 1, 16)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R1        ', N'R1-2      ', 199, 3, 46, 95, 1, 1, 1, 2)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R1        ', N'R1-3      ', 248, 3, 46, 95, 1, 1, 1, 3)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R1        ', N'R1-4      ', 297, 3, 46, 95, 1, 1, 1, 4)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R1        ', N'R1-5      ', 346, 3, 193, 95, 1, 1, 1, 5)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R1        ', N'R1-6      ', 542, 3, 46, 95, 1, 1, 1, 6)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R1        ', N'R1-7      ', 3, 101, 46, 95, 1, 1, 1, 7)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R1        ', N'R1-8      ', 52, 101, 46, 95, 1, 1, 1, 8)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R1        ', N'R1-9      ', 101, 101, 46, 95, 1, 1, 1, 9)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R11       ', N'R11-1     ', 3, 3, 69, 95, 1, 1, 11, 1)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R11       ', N'R11-10    ', 3, 101, 45, 95, 1, 1, 11, 10)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R11       ', N'R11-11    ', 51, 101, 45, 95, 1, 1, 11, 11)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R11       ', N'R11-12    ', 99, 101, 45, 95, 1, 1, 11, 12)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R11       ', N'R11-13    ', 147, 101, 45, 95, 1, 1, 11, 13)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R11       ', N'R11-14    ', 195, 101, 45, 95, 1, 1, 11, 14)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R11       ', N'R11-15    ', 243, 101, 45, 95, 1, 1, 11, 15)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R11       ', N'R11-16    ', 291, 101, 45, 95, 1, 1, 11, 16)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R11       ', N'R11-17    ', 339, 101, 45, 95, 1, 1, 11, 17)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R11       ', N'R11-18    ', 387, 101, 45, 95, 1, 1, 11, 18)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R11       ', N'R11-19    ', 435, 101, 45, 95, 1, 1, 11, 19)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R11       ', N'R11-2     ', 75, 3, 69, 95, 1, 1, 11, 2)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R11       ', N'R11-20    ', 483, 101, 45, 95, 1, 1, 11, 20)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R11       ', N'R11-21    ', 531, 101, 45, 95, 1, 1, 11, 21)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R11       ', N'R11-3     ', 147, 3, 69, 95, 1, 1, 11, 3)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R11       ', N'R11-4     ', 219, 3, 69, 95, 1, 1, 11, 4)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R11       ', N'R11-5     ', 291, 3, 69, 95, 1, 1, 11, 5)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R11       ', N'R11-6     ', 363, 3, 69, 95, 1, 1, 11, 6)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R11       ', N'R11-7     ', 435, 3, 69, 95, 1, 1, 11, 7)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R11       ', N'R11-8     ', 507, 3, 45, 95, 1, 1, 11, 8)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R11       ', N'R11-9     ', 555, 3, 21, 95, 1, 1, 11, 9)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R13       ', N'R13-1     ', 3, 3, 141, 95, 1, 1, 13, 1)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R13       ', N'R13-10    ', 147, 101, 45, 95, 1, 1, 13, 10)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R13       ', N'R13-11    ', 195, 101, 45, 95, 1, 1, 13, 11)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R13       ', N'R13-12    ', 243, 101, 45, 95, 1, 1, 13, 12)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R13       ', N'R13-13    ', 291, 101, 45, 95, 1, 1, 13, 13)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R13       ', N'R13-14    ', 339, 101, 45, 95, 1, 1, 13, 14)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R13       ', N'R13-15    ', 387, 101, 45, 95, 1, 1, 13, 15)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R13       ', N'R13-16    ', 435, 101, 45, 95, 1, 1, 13, 16)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R13       ', N'R13-17    ', 483, 101, 45, 95, 1, 1, 13, 17)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R13       ', N'R13-18    ', 531, 101, 45, 95, 1, 1, 13, 18)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R13       ', N'R13-2     ', 147, 3, 141, 95, 1, 1, 13, 2)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R13       ', N'R13-3     ', 291, 3, 69, 95, 1, 1, 13, 3)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R13       ', N'R13-4     ', 363, 3, 69, 95, 1, 1, 13, 4)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R13       ', N'R13-5     ', 435, 3, 69, 95, 1, 1, 13, 5)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R13       ', N'R13-6     ', 507, 3, 69, 95, 1, 1, 13, 6)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R13       ', N'R13-7     ', 3, 101, 45, 95, 1, 1, 13, 7)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R13       ', N'R13-8     ', 51, 101, 45, 95, 1, 1, 13, 8)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R13       ', N'R13-9     ', 99, 101, 45, 95, 1, 1, 13, 9)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R15       ', N'R15-1     ', 3, 3, 69, 95, 1, 1, 15, 1)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R15       ', N'R15-10    ', 51, 101, 45, 95, 1, 1, 15, 10)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R15       ', N'R15-11    ', 99, 101, 45, 95, 1, 1, 15, 11)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R15       ', N'R15-12    ', 147, 101, 45, 95, 1, 1, 15, 12)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R15       ', N'R15-13    ', 195, 101, 45, 95, 1, 1, 15, 13)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R15       ', N'R15-14    ', 243, 101, 45, 95, 1, 1, 15, 14)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R15       ', N'R15-15    ', 291, 101, 45, 95, 1, 1, 15, 15)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R15       ', N'R15-16    ', 339, 101, 45, 95, 1, 1, 15, 16)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R15       ', N'R15-17    ', 387, 101, 45, 95, 1, 1, 15, 17)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R15       ', N'R15-18    ', 435, 101, 45, 95, 1, 1, 15, 18)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R15       ', N'R15-19    ', 483, 101, 45, 95, 1, 1, 15, 19)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R15       ', N'R15-2     ', 75, 3, 141, 95, 1, 1, 15, 2)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R15       ', N'R15-20    ', 531, 101, 45, 95, 1, 1, 15, 20)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R15       ', N'R15-3     ', 219, 3, 69, 95, 1, 1, 15, 3)
GO
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R15       ', N'R15-4     ', 291, 3, 69, 95, 1, 1, 15, 4)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R15       ', N'R15-5     ', 363, 3, 69, 95, 1, 1, 15, 5)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R15       ', N'R15-6     ', 435, 3, 69, 95, 1, 1, 15, 6)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R15       ', N'R15-7     ', 507, 3, 45, 95, 1, 1, 15, 7)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R15       ', N'R15-8     ', 555, 3, 21, 95, 1, 1, 15, 8)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R15       ', N'R15-9     ', 3, 101, 45, 95, 1, 1, 15, 9)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R17       ', N'R17-1     ', 3, 3, 141, 95, 1, 1, 17, 1)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R17       ', N'R17-10    ', 147, 101, 45, 95, 1, 1, 17, 10)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R17       ', N'R17-11    ', 195, 101, 45, 95, 1, 1, 17, 11)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R17       ', N'R17-12    ', 243, 101, 45, 95, 1, 1, 17, 12)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R17       ', N'R17-13    ', 291, 101, 45, 95, 1, 1, 17, 13)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R17       ', N'R17-14    ', 339, 101, 45, 95, 1, 1, 17, 14)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R17       ', N'R17-15    ', 387, 101, 45, 95, 1, 1, 17, 15)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R17       ', N'R17-16    ', 435, 101, 45, 95, 1, 1, 17, 16)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R17       ', N'R17-17    ', 483, 101, 45, 95, 1, 1, 17, 17)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R17       ', N'R17-18    ', 531, 101, 45, 95, 1, 1, 17, 18)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R17       ', N'R17-2     ', 147, 3, 141, 95, 1, 1, 17, 2)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R17       ', N'R17-3     ', 291, 3, 69, 95, 1, 1, 17, 3)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R17       ', N'R17-4     ', 363, 3, 141, 95, 1, 1, 17, 4)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R17       ', N'R17-5     ', 507, 3, 45, 95, 1, 1, 17, 5)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R17       ', N'R17-6     ', 555, 3, 21, 95, 1, 1, 17, 6)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R17       ', N'R17-7     ', 3, 101, 45, 95, 1, 1, 17, 7)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R17       ', N'R17-8     ', 51, 101, 45, 95, 1, 1, 17, 8)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R17       ', N'R17-9     ', 99, 101, 45, 95, 1, 1, 17, 9)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R19       ', N'R19-1     ', 3, 3, 46, 95, 1, 1, 19, 1)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R19       ', N'R19-10    ', 444, 3, 46, 95, 1, 1, 19, 10)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R19       ', N'R19-11    ', 493, 3, 46, 95, 1, 1, 19, 11)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R19       ', N'R19-12    ', 542, 3, 46, 95, 1, 1, 19, 12)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R19       ', N'R19-13    ', 3, 101, 46, 95, 1, 1, 19, 13)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R19       ', N'R19-14    ', 52, 101, 46, 95, 1, 1, 19, 14)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R19       ', N'R19-15    ', 101, 101, 46, 95, 1, 1, 19, 15)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R19       ', N'R19-16    ', 150, 101, 46, 95, 1, 1, 19, 16)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R19       ', N'R19-17    ', 199, 101, 46, 95, 1, 1, 19, 17)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R19       ', N'R19-18    ', 248, 101, 46, 95, 1, 1, 19, 18)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R19       ', N'R19-19    ', 297, 101, 46, 95, 1, 1, 19, 19)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R19       ', N'R19-2     ', 52, 3, 46, 95, 1, 1, 19, 2)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R19       ', N'R19-20    ', 346, 101, 46, 95, 1, 1, 19, 20)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R19       ', N'R19-21    ', 395, 101, 46, 95, 1, 1, 19, 21)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R19       ', N'R19-22    ', 444, 101, 46, 95, 1, 1, 19, 22)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R19       ', N'R19-23    ', 493, 101, 46, 95, 1, 1, 19, 23)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R19       ', N'R19-24    ', 542, 101, 46, 95, 1, 1, 19, 24)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R19       ', N'R19-3     ', 101, 3, 46, 95, 1, 1, 19, 3)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R19       ', N'R19-4     ', 150, 3, 46, 95, 1, 1, 19, 4)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R19       ', N'R19-5     ', 199, 3, 46, 95, 1, 1, 19, 5)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R19       ', N'R19-6     ', 248, 3, 46, 95, 1, 1, 19, 6)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R19       ', N'R19-7     ', 297, 3, 46, 95, 1, 1, 19, 7)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R19       ', N'R19-8     ', 346, 3, 46, 95, 1, 1, 19, 8)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R19       ', N'R19-9     ', 395, 3, 46, 95, 1, 1, 19, 9)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R21       ', N'R21-1     ', 3, 3, 46, 95, 1, 1, 21, 1)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R21       ', N'R21-10    ', 444, 3, 46, 95, 1, 1, 21, 10)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R21       ', N'R21-11    ', 493, 3, 46, 95, 1, 1, 21, 11)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R21       ', N'R21-12    ', 542, 3, 46, 95, 1, 1, 21, 12)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R21       ', N'R21-13    ', 3, 101, 46, 95, 1, 1, 21, 13)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R21       ', N'R21-14    ', 52, 101, 46, 95, 1, 1, 21, 14)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R21       ', N'R21-15    ', 101, 101, 46, 95, 1, 1, 21, 15)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R21       ', N'R21-16    ', 150, 101, 46, 95, 1, 1, 21, 16)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R21       ', N'R21-17    ', 199, 101, 46, 95, 1, 1, 21, 17)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R21       ', N'R21-18    ', 248, 101, 46, 95, 1, 1, 21, 18)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R21       ', N'R21-19    ', 297, 101, 46, 95, 1, 1, 21, 19)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R21       ', N'R21-2     ', 52, 3, 46, 95, 1, 1, 21, 2)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R21       ', N'R21-20    ', 346, 101, 46, 95, 1, 1, 21, 20)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R21       ', N'R21-21    ', 395, 101, 46, 95, 1, 1, 21, 21)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R21       ', N'R21-22    ', 444, 101, 46, 95, 1, 1, 21, 22)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R21       ', N'R21-23    ', 493, 101, 46, 95, 1, 1, 21, 23)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R21       ', N'R21-24    ', 542, 101, 46, 95, 1, 1, 21, 24)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R21       ', N'R21-3     ', 101, 3, 46, 95, 1, 1, 21, 3)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R21       ', N'R21-4     ', 150, 3, 46, 95, 1, 1, 21, 4)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R21       ', N'R21-5     ', 199, 3, 46, 95, 1, 1, 21, 5)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R21       ', N'R21-6     ', 248, 3, 46, 95, 1, 1, 21, 6)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R21       ', N'R21-7     ', 297, 3, 46, 95, 1, 1, 21, 7)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R21       ', N'R21-8     ', 346, 3, 46, 95, 1, 1, 21, 8)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R21       ', N'R21-9     ', 395, 3, 46, 95, 1, 1, 21, 9)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R23       ', N'R23-1     ', 3, 3, 69, 95, 1, 0, 23, 1)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R23       ', N'R23-10    ', 555, 3, 21, 95, 1, 0, 23, 10)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R23       ', N'R23-11    ', 3, 101, 45, 95, 1, 0, 23, 11)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R23       ', N'R23-12    ', 51, 101, 45, 95, 1, 0, 23, 12)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R23       ', N'R23-13    ', 99, 101, 45, 95, 1, 0, 23, 13)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R23       ', N'R23-14    ', 147, 101, 45, 95, 1, 0, 23, 14)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R23       ', N'R23-15    ', 195, 101, 45, 95, 1, 0, 23, 15)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R23       ', N'R23-16    ', 243, 101, 45, 95, 1, 0, 23, 16)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R23       ', N'R23-17    ', 291, 101, 45, 95, 1, 0, 23, 17)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R23       ', N'R23-18    ', 339, 101, 45, 95, 1, 0, 23, 18)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R23       ', N'R23-19    ', 387, 101, 45, 95, 1, 0, 23, 19)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R23       ', N'R23-2     ', 75, 3, 69, 95, 1, 0, 23, 2)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R23       ', N'R23-20    ', 435, 101, 45, 95, 1, 0, 23, 20)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R23       ', N'R23-21    ', 483, 101, 45, 95, 1, 0, 23, 21)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R23       ', N'R23-22    ', 531, 101, 45, 95, 1, 0, 23, 22)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R23       ', N'R23-3     ', 147, 3, 69, 95, 1, 0, 23, 3)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R23       ', N'R23-4     ', 219, 3, 69, 95, 1, 0, 23, 4)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R23       ', N'R23-5     ', 291, 3, 69, 95, 1, 0, 23, 5)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R23       ', N'R23-6     ', 363, 3, 45, 95, 1, 0, 23, 6)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R23       ', N'R23-7     ', 411, 3, 45, 95, 1, 0, 23, 7)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R23       ', N'R23-8     ', 459, 3, 45, 95, 1, 0, 23, 8)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R23       ', N'R23-9     ', 507, 3, 45, 95, 1, 0, 23, 9)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R25       ', N'R25-1     ', 3, 3, 46, 95, 1, 0, 25, 1)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R25       ', N'R25-10    ', 444, 3, 46, 95, 1, 0, 25, 10)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R25       ', N'R25-11    ', 493, 3, 46, 95, 1, 0, 25, 11)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R25       ', N'R25-12    ', 542, 3, 46, 95, 1, 0, 25, 12)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R25       ', N'R25-13    ', 3, 101, 46, 95, 1, 0, 25, 13)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R25       ', N'R25-14    ', 52, 101, 46, 95, 1, 0, 25, 14)
GO
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R25       ', N'R25-15    ', 101, 101, 46, 95, 1, 0, 25, 15)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R25       ', N'R25-16    ', 150, 101, 46, 95, 1, 0, 25, 16)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R25       ', N'R25-17    ', 199, 101, 46, 95, 1, 0, 25, 17)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R25       ', N'R25-18    ', 248, 101, 46, 95, 1, 0, 25, 18)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R25       ', N'R25-19    ', 297, 101, 46, 95, 1, 0, 25, 19)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R25       ', N'R25-2     ', 52, 3, 46, 95, 1, 0, 25, 2)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R25       ', N'R25-20    ', 346, 101, 46, 95, 1, 0, 25, 20)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R25       ', N'R25-21    ', 395, 101, 46, 95, 1, 0, 25, 21)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R25       ', N'R25-22    ', 444, 101, 46, 95, 1, 0, 25, 22)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R25       ', N'R25-23    ', 493, 101, 46, 95, 1, 0, 25, 23)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R25       ', N'R25-24    ', 542, 101, 46, 95, 1, 0, 25, 24)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R25       ', N'R25-3     ', 101, 3, 46, 95, 1, 0, 25, 3)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R25       ', N'R25-4     ', 150, 3, 46, 95, 1, 0, 25, 4)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R25       ', N'R25-5     ', 199, 3, 46, 95, 1, 0, 25, 5)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R25       ', N'R25-6     ', 248, 3, 46, 95, 1, 0, 25, 6)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R25       ', N'R25-7     ', 297, 3, 46, 95, 1, 0, 25, 7)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R25       ', N'R25-8     ', 346, 3, 46, 95, 1, 0, 25, 8)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R25       ', N'R25-9     ', 395, 3, 46, 95, 1, 0, 25, 9)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R3        ', N'R3-1      ', 3, 3, 174, 95, 1, 1, 3, 1)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R3        ', N'R3-10     ', 298, 101, 56, 95, 1, 1, 3, 10)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R3        ', N'R3-11     ', 357, 101, 56, 95, 1, 1, 3, 11)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R3        ', N'R3-2      ', 180, 3, 56, 95, 1, 1, 3, 2)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R3        ', N'R3-3      ', 239, 3, 174, 95, 1, 1, 3, 3)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R3        ', N'R3-4      ', 416, 3, 174, 193, 1, 1, 3, 4)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R3        ', N'R3-5      ', 3, 101, 56, 95, 1, 1, 3, 5)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R3        ', N'R3-6      ', 62, 101, 56, 95, 1, 1, 3, 6)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R3        ', N'R3-7      ', 121, 101, 56, 95, 1, 1, 3, 7)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R3        ', N'R3-8      ', 180, 101, 56, 95, 1, 1, 3, 8)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R3        ', N'R3-9      ', 239, 101, 56, 95, 1, 1, 3, 9)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R5        ', N'R5-1      ', 3, 3, 69, 95, 1, 1, 5, 1)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R5        ', N'R5-10     ', 99, 101, 45, 95, 1, 1, 5, 10)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R5        ', N'R5-11     ', 147, 101, 45, 95, 1, 1, 5, 11)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R5        ', N'R5-12     ', 195, 101, 45, 95, 1, 1, 5, 12)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R5        ', N'R5-13     ', 243, 101, 45, 95, 1, 1, 5, 13)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R5        ', N'R5-14     ', 291, 101, 45, 95, 1, 1, 5, 14)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R5        ', N'R5-15     ', 339, 101, 45, 95, 1, 1, 5, 15)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R5        ', N'R5-16     ', 387, 101, 45, 95, 1, 1, 5, 16)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R5        ', N'R5-17     ', 435, 101, 45, 95, 1, 1, 5, 17)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R5        ', N'R5-18     ', 483, 101, 45, 95, 1, 1, 5, 18)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R5        ', N'R5-19     ', 531, 101, 45, 95, 1, 1, 5, 19)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R5        ', N'R5-2      ', 75, 3, 69, 95, 1, 1, 5, 2)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R5        ', N'R5-3      ', 147, 3, 69, 95, 1, 1, 5, 3)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R5        ', N'R5-4      ', 219, 3, 69, 95, 1, 1, 5, 4)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R5        ', N'R5-5      ', 291, 3, 69, 95, 1, 1, 5, 5)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R5        ', N'R5-6      ', 363, 3, 141, 95, 1, 1, 5, 6)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R5        ', N'R5-7      ', 507, 3, 69, 95, 1, 1, 5, 7)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R5        ', N'R5-8      ', 3, 101, 45, 95, 1, 1, 5, 8)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R5        ', N'R5-9      ', 51, 101, 45, 95, 1, 1, 5, 9)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R7        ', N'R7-1      ', 3, 3, 69, 95, 1, 1, 7, 1)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R7        ', N'R7-10     ', 3, 101, 45, 95, 1, 1, 7, 10)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R7        ', N'R7-11     ', 51, 101, 93, 95, 1, 1, 7, 11)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R7        ', N'R7-12     ', 147, 101, 45, 95, 1, 1, 7, 12)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R7        ', N'R7-13     ', 195, 101, 45, 95, 1, 1, 7, 13)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R7        ', N'R7-14     ', 243, 101, 45, 95, 1, 1, 7, 14)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R7        ', N'R7-15     ', 291, 101, 45, 95, 1, 1, 7, 15)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R7        ', N'R7-16     ', 339, 101, 45, 95, 1, 1, 7, 16)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R7        ', N'R7-17     ', 387, 101, 45, 95, 1, 1, 7, 17)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R7        ', N'R7-18     ', 435, 101, 45, 95, 1, 1, 7, 18)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R7        ', N'R7-19     ', 483, 101, 45, 95, 1, 1, 7, 19)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R7        ', N'R7-2      ', 75, 3, 69, 95, 1, 1, 7, 2)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R7        ', N'R7-20     ', 531, 101, 45, 95, 1, 1, 7, 20)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R7        ', N'R7-3      ', 147, 3, 69, 95, 1, 1, 7, 3)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R7        ', N'R7-4      ', 219, 3, 69, 95, 1, 1, 7, 4)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R7        ', N'R7-5      ', 291, 3, 69, 95, 1, 1, 7, 5)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R7        ', N'R7-6      ', 363, 3, 69, 95, 1, 1, 7, 6)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R7        ', N'R7-7      ', 435, 3, 69, 95, 1, 1, 7, 7)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R7        ', N'R7-8      ', 507, 3, 45, 95, 1, 1, 7, 8)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R7        ', N'R7-9      ', 555, 3, 21, 95, 1, 1, 7, 9)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R9        ', N'R9-1      ', 3, 3, 46, 95, 1, 0, 9, 1)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R9        ', N'R9-10     ', 444, 3, 46, 95, 1, 0, 9, 10)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R9        ', N'R9-11     ', 493, 3, 46, 95, 1, 0, 9, 11)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R9        ', N'R9-12     ', 542, 3, 46, 95, 1, 0, 9, 12)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R9        ', N'R9-13     ', 3, 101, 46, 95, 1, 0, 9, 13)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R9        ', N'R9-14     ', 52, 101, 46, 95, 1, 0, 9, 14)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R9        ', N'R9-15     ', 101, 101, 46, 95, 1, 0, 9, 15)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R9        ', N'R9-16     ', 150, 101, 46, 95, 1, 0, 9, 16)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R9        ', N'R9-17     ', 199, 101, 46, 95, 1, 0, 9, 17)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R9        ', N'R9-18     ', 248, 101, 46, 95, 1, 0, 9, 18)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R9        ', N'R9-19     ', 297, 101, 46, 95, 1, 0, 9, 19)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R9        ', N'R9-2      ', 52, 3, 46, 95, 1, 0, 9, 2)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R9        ', N'R9-20     ', 346, 101, 46, 95, 1, 0, 9, 20)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R9        ', N'R9-21     ', 395, 101, 46, 95, 1, 0, 9, 21)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R9        ', N'R9-22     ', 444, 101, 46, 95, 1, 0, 9, 22)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R9        ', N'R9-23     ', 493, 101, 46, 95, 1, 0, 9, 23)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R9        ', N'R9-24     ', 542, 101, 46, 95, 1, 0, 9, 24)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R9        ', N'R9-3      ', 101, 3, 46, 95, 1, 0, 9, 3)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R9        ', N'R9-4      ', 150, 3, 46, 95, 1, 0, 9, 4)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R9        ', N'R9-5      ', 199, 3, 46, 95, 1, 0, 9, 5)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R9        ', N'R9-6      ', 248, 3, 46, 95, 1, 0, 9, 6)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R9        ', N'R9-7      ', 297, 3, 46, 95, 1, 0, 9, 7)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R9        ', N'R9-8      ', 346, 3, 46, 95, 1, 0, 9, 8)
INSERT [dbo].[CAUHINHKHAY] ([tenKhay], [ViTriO], [locationX], [locationy], [width], [height], [chieuCao], [tinhTrangO], [sttKhay], [sttO]) VALUES (N'R9        ', N'R9-9      ', 395, 3, 46, 95, 1, 0, 9, 9)
GO
SET IDENTITY_INSERT [dbo].[DONVITINH] ON 

INSERT [dbo].[DONVITINH] ([STT], [DonViTinh]) VALUES (5, N'Box')
INSERT [dbo].[DONVITINH] ([STT], [DonViTinh]) VALUES (1, N'Con')
INSERT [dbo].[DONVITINH] ([STT], [DonViTinh]) VALUES (4, N'Kg')
INSERT [dbo].[DONVITINH] ([STT], [DonViTinh]) VALUES (3, N'Mét')
INSERT [dbo].[DONVITINH] ([STT], [DonViTinh]) VALUES (2, N'Pcs')
SET IDENTITY_INSERT [dbo].[DONVITINH] OFF
GO
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'11111111                 ', N'Bulong M8x15 LGC trụ inox', N'Bulong', N'xXx', N'Con', 1.2000000476837158, 1.2000000476837158, 0.5, 1, 0, 0, N'Chưa cập nhật')
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'11111111111111111        ', N'Bulong M10x35 LGN inox', N'Bulong', N'xXx', N'Con', 1.2000000476837158, 1.2000000476837158, 0.5, 1, 0, 0, N'Chưa cập nhật')
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'2222222222               ', N'Bulong M6x50 LG cầu mạ', N'Bulong', N'xXx', N'Con', 1.2000000476837158, 1.2000000476837158, 0.5, 1, 0, 0, N'10con/lạng')
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-CA- M5X12-S1(C)      ', N'Bulong M5x12 inox cầu', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-CA-M10x12-M(C)       ', N'Bulong M10x12 LGC cầu mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-CA-M10x15-M(C)       ', N'Bulong M10x15 LGC cầu mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 40, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-CA-M10x20-M(C)       ', N'Bulong M10x20 LG cầu mạ', N'Bulong', N'xXx', N'Con', 1.2000000476837158, 1.2000000476837158, 0.5, 1, 0, 250, N'Chưa cập nhật')
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-CA-M10X20-S1(C)      ', N'Bulong M10x20 LG cầu inox', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 230, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-CA-M10X25-M(C)       ', N'Bulong M10x25 LG cầu mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-CA-M10x25-S1(C)      ', N'Bulong m10x25 LGC cầu inox', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 200, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-CA-M10x60-M(C)       ', N'Bulong M10x60 LGC cầu mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 90, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-CA-M12x25-M(C)       ', N'Bulong  M12x25 LGC cầu mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 230, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-CA-M12x25-S1(C)      ', N'Bulong M12x25, LGC inox đàu chỏm cầu', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 300, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-CA-M12x30-M          ', N'Bulong m12x30 LG cầu mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-CA-M12x30-S1         ', N'Bulong M12x30 LGC cầu Inox', N'Bulong', N'xXx', N'Con', 1.2000000476837158, 1.2000000476837158, 0.5, 1, 0, 120, N'30 C/Kg')
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-CA-M16x60-M(C)       ', N'Bulong M16x60 LGC cầu mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 50, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-CA-M4x25-S1(C)       ', N'Bulong M4x25 LGC inox', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-CA-M5X25-S1(C)       ', N'Bulong M5x25 LG cầu inox', N'Bulong', N'xXx', N'Con', 1.2000000476837158, 1.2000000476837158, 0.5, 1, 0, 110, N'Chưa cập nhật')
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-CA-M6x10-M(C)        ', N'Bulong M6x10 LG cầu mạ', N'Bulong', N'xXx', N'Con', 1.2000000476837158, 1.2000000476837158, 0.5, 1, 0, 30, N'Chưa cập nhật')
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-CA-M6x12-M(C)        ', N'Bulong M6x12 LG cầu mạ', N'Bulong', N'xXx', N'Con', 1.2000000476837158, 1.2000000476837158, 0.5, 1, 0, 3300, N'15con/lạng')
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-CA-M6X15-S1(C)       ', N'Bulong M6x15 LG cầu Inox', N'Bulong', N'xXx', N'Con', 1.2000000476837158, 1.2000000476837158, 0.5, 1, 0, 145, N'Chưa cập nhật')
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-CA-M6X20-S1          ', N'Bulong M6x20 LG cầu inox', N'Bulong', N'xXx', N'Con', 1.2000000476837158, 1.2000000476837158, 0.5, 1, 0, 950, N'Chưa cập nhật')
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-CA-M6X25-M(C)        ', N'Bulong M6x25 LG cầu mạ', N'Bulong', N'xXx', N'Con', 1.2000000476837158, 1.2000000476837158, 0.5, 1, 0, 20, N'Chưa cập nhật')
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-CA-M6X25-S1(C)       ', N'Bulong M6x25 LG cầu Inox', N'Bulong', N'xXx', N'Con', 1.2000000476837158, 1.2000000476837158, 0.5, 1, 0, 350, N'Chưa cập nhật')
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-CA-M6x30-M(C)        ', N'Bulong M6x30 LG cầu mạ', N'Bulong', N'xXx', N'Con', 1.2000000476837158, 1.2000000476837158, 0.5, 1, 0, 900, N'15con/lạng')
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-CA-M6x40-M(C)        ', N'Bulong M6x40 LG cầu mạ', N'Bulong', N'xXx', N'Con', 1.2000000476837158, 1.2000000476837158, 0.5, 1, 0, 980, N'Chưa cập nhật')
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-CA-M6x40-S1(C)       ', N'Bulong M6x40 LG cầu inox', N'Bulong', N'xXx', N'Con', 1.2000000476837158, 1.2000000476837158, 0.5, 1, 0, 90, N'Chưa cập nhật')
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-CA-M6x50-M(C)        ', N'Bulong M6x50 LG cầu mạ', N'Bulong', N'xXx', N'Con', 1.2000000476837158, 1.2000000476837158, 0.5, 1, 0, 700, N'10con/lạng')
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-CA-M8x12-M(C)        ', N'Bulong M8x12 LGC cầu mạ', N'Bulong', N'xXx', N'Con', 1.2000000476837158, 1.2000000476837158, 0.5, 1, 0, 1050, N'15con/lạng')
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-CA-M8X12-S1(C)       ', N'Bulong M8x12 LG cầu inox', N'Bulong', N'xXx', N'Con', 1.2000000476837158, 1.2000000476837158, 0.5, 1, 0, 130, N'15 C/L')
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-CA-M8x15-M(C)        ', N'Bulong M8x15 LGC cầu mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 720, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-CA-M8x15-S1          ', N'Bulong M8x15 LGC cầu inox', N'Bulong', N'xXx', N'Con', 1.2000000476837158, 1.2000000476837158, 0.5, 1, 0, 270, N'9con/lạng')
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-CA-M8x20-M(C)        ', N'Bulong M8x20 LGC cầu mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 120, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-CA-M8X20-S1(C)       ', N'Bulong M8x20 chìm cầu inox', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 150, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-CA-M8x25-M(C)        ', N'Bulong M8x25 LGC cầu mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-CA-M8x25-S1          ', N'Bulong M8x25 LGC cầu inox', N'Bulong', N'xXx', N'Con', 1.2000000476837158, 1.2000000476837158, 0.5, 1, 0, 30, N'')
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-CA-M8x25-S4(C)       ', N'bulong 8x25 đầu cầu inox 304', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-CA-M8x30-M(C)        ', N'Bulong M8x30 LGC cầu mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 80, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-CA-M8x40-M(C)        ', N'Bulong M8x40 LGC cầu mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 320, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-CA-M8x50-M(C)        ', N'Bulong M8x50 LGC cầu  mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 400, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-CA-M8x50-S1(C)       ', N'Bulong M8x50 LGC cầu inox', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-CA-M8x60-M(C)        ', N'Bulong M8x60 LGC cầu mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 750, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-CA-M8x60-S1(C)       ', N'Bulong M8x60 LGC cầu inox', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 250, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-CA-VIT-M4x25-M       ', N'Bulong M4x25 LGC cầu tô vít mạ', N'Bulong', N'xXx', N'Con', 1.2000000476837158, 1.2000000476837158, 0.5, 1, 0, 310, N'Chưa cập nhật')
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-CO- M6x50-S1         ', N'Bulong M6x50 LGC inox', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-CO-M12x30-S1         ', N'Bulong M12x30 LG cầu Inox', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-CO-M5X10-S1(C)       ', N'Bulong M5x10 chìm cầu inox', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-CO-M5X12-S1(C)       ', N'Bulong M5x12 LG côn inox', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 180, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-CO-M5X15-S1(C)       ', N'bulong m5x15 LG cầu inox', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 160, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-CO-M5X20-S1(C)       ', N'Bulong M5x20 LG côn  inox', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 50, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-Co-M5x20-S4          ', N'Bulong M5x20 LG Côn inox 304', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-CO-M6x10-M(C)        ', N'Bulong M6x10 LGC côn mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 1300, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-CO-M6X10-S1(C)       ', N'Bulong M6x10 côn inox', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 700, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-CO-M6x12-M(C)        ', N'Bulong M6x12 LGC côn mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 330, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-CO-M6x15-M           ', N'Bulong M6x15 LG Côn mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-CO-M6X15-S1(C)       ', N'Bulong M6x15 LG côn Inox', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 50, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-CO-M6x20-M(C)        ', N'Bulong M6X20 LGC côn mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 35, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-CO-M6x20-S1(C)       ', N'Bulong M6x20 LGC côn inox', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 250, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-CO-M6X25-M           ', N'bulong m6x25 lg côn mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 1000, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-CO-M6X25-S1(C)       ', N'Bulong M6x25 LG côn Inox', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 80, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-CO-M6X30 -S1(C)      ', N'Bulong M6x30 LGC côn inox', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-CO-M6x40-S1(C)       ', N'Bulong M6x40 LGC côn inox', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 25, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-CO-M8x10-M(C)        ', N'Bulong M8x10 LGC côn mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-CO-M8x12-M(C)        ', N'Bulong M8x12 LGC côn mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-CO-M8x15-M(C)        ', N'Bulong M8x15 LGC côn mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 505, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-CO-M8x20-M(C)        ', N'Bulong M8x20 LGC côn mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 980, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-CO-M8x20-S1(C)       ', N'Bulong M8x20 LGC côn inox', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-CO-M8x25-M(C)        ', N'Bulong M8x25 LGC côn mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 280, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-CO-M8x25-S1(C)       ', N'Bulong M8x25 LGC côn inox', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 45, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-CO-M8x30-M(C)        ', N'Bulong M8x30 LGC côn mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 590, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-CO-M8x35-M(C)        ', N'Bulong M8x35 côn mạ', N'Bulong', N'xXx', N'Con', 1.2000000476837158, 1.2000000476837158, 0.5, 1, 0, 320, N'8con/lạng')
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-CO-M8x35-S1          ', N'Bulong M8x12 LGC cầu inox', N'Bulong', N'xXx', N'Con', 1.2000000476837158, 1.2000000476837158, 0.5, 1, 0, 19, N'6con/lạng')
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-CO-M8x40-M(C)        ', N'Bulong M8x40 LGC côn mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 360, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-CO-M8x45-M(C)        ', N'Bulong M8X45 LGC côn mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-CO-M8X50-M           ', N'Bulong M8x35 LG côn mạ', N'Bulong', N'xXx', N'Con', 1.2000000476837158, 1.2000000476837158, 0.5, 1, 0, 150, N'5con/lạng')
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-CO-M8x55-M(C)        ', N'Bulong M8x55 LGC côn mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-LGN- M8x15-S1(C)     ', N'Bulong M8x15 LGN inox', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 80, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-LGN-M10x100-M(C)     ', N'Bulong M10x100 LGN mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 50, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-LGN-M10X100-S1       ', N'Bulong M10x100 LGN inox', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-LGN-M10X110-M(C)     ', N'Bulong M10x110 LGN mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 90, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-LGN-M10x120-M(C)     ', N'Bulong M10x120 LGN mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 450, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-LGN-M10X15-M(C)      ', N'Bulong M10x15 LGN mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 115, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-LGN-M10x150-M(C)     ', N'Bulong M10x150 LGN mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-LGN-M10X20-M(C)      ', N'Bulong m10x20 LGN mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 350, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-LGN-M10x20-S1(C)     ', N'Bulong M10x20 LGN inox', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 200, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-LGN-M10X20-Ð(C)      ', N'Bulong m10x20 LGN đen', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-LGN-M10x25-M(C)      ', N'Bulong M10x25 LGN mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 800, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-LGN-M10x25-S1(C)     ', N'Bulong m10x25 LGN inox 201', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 30, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-LGN-M10x25-S4(C)     ', N'Bulong M10x25 LGN inox 304', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-LGN-M10x25-Ð(C)      ', N'Bulong M10x25 LGN thép đen', N'Bulong', N'xXx', N'Con', 1.2000000476837158, 1.2000000476837158, 0.5, 1, 0, 50, N'Chưa cập nhật')
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-LGN-M10X30-M(C)      ', N'Bulong M10x30 LGN mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 30, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-LGN-M10x30-S1(C)     ', N'BL M10x30 LGN inox', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 15, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-LGN-M10x30-S4(C)     ', N'Bulong M10x30 LGN inox 304', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-LGN-M10x35-M(C)      ', N'Bulong M10x35 LGN mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-LGN-M10x35-S1(C)     ', N'Bulong M10x35 LGN inox', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 20, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-LGN-M10x40-M(C)      ', N'Bulong M10x40 LGN mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-LGN-M10x40-S1(C)     ', N'Bulong M10x40 LGN inox 201', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-LGN-M10x50-M(C)      ', N'Bulong M10x50 LGN mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 55, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-LGN-M10x60-M(C)      ', N'Bulong M10x60 LGN mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-LGN-M10x70-M(C)      ', N'Bulong M10x70 LGN mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
GO
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-LGN-M10x80-S1(C)     ', N'Bulong M10x80 LGN inox', N'Bulong', N'xXx', N'Con', 1.2000000476837158, 1.2000000476837158, 0.5, 1, 0, 8, N'Chưa cập nhật')
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-LGN-M10x90-M(C)      ', N'Bulong M10x90 LGN mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 14, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-LGN-M12x100-M(C)     ', N'Bulong M12x100 LGN mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 300, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-LGN-M12x100-S4(C)    ', N'Bulong M12x100 LGN inox 304', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 75, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-LGN-M12X120-M        ', N'Bulong M12x120 LGN mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-LGN-M12x150-M(C)     ', N'Bulong M12x150 LGN mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-LGN-M12x20-M(C)      ', N'Bulong M12x20 LGN mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-LGN-M12x20-S1(C)     ', N'Bulong M12x20 LGN inox', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 35, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-LGN-M12x25-M(C)      ', N'Bulong 12x25 LGN mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-LGN-M12x30-M(C)      ', N'Bulong M12x30 LGN mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 25, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-LGN-M12x35-M(C)      ', N'Bulong M12x35 mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-LGN-M12x40-M(C)      ', N'Bulong m12x40 LGN mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 70, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-LGN-M12x40-S1(C)     ', N'Bulong M12x40 LGN Inox', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-LGN-M12X45-M( C)     ', N'Bulong m12x45 LGN mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 20, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-LGN-M12X50-M(C)      ', N'Bulong M12x50 LGN mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 180, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-LGN-M12X60-M(C)      ', N'Bulong M12x60 LGN mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 140, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-LGN-M12x70-M(C)      ', N'Bulong M12x70 LGN mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-LGN-M12X80 -S1(C)    ', N'Bulong M12x80 LGN inox', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 10, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-LGN-M12X80-M(C)      ', N'Bulong M12x80 LGN mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 238, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-LGN-M14x30-M(C)      ', N'Bulong M14x30 LGN mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 230, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-LGN-M14X40-M(C)      ', N'Bulong M14x40 LGN mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-LGN-M14x50-M(C)      ', N'bulong M14x50 LGN mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 69, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-LGN-M14X60-M         ', N'Bulong M14x60 LGN mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 120, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-LGN-M14x80-M(C)      ', N'Bulong M14x80 LGN mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 18, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-LGN-M15x100-M(C)     ', N'Bulong M15x100 LGN mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-LGN-M16x10-M(C)      ', N'Bulong  M16x40 LGN mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-LGN-M16x100-M(C)     ', N'Bulong M16x100 LGN mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 240, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-LGN-M16x100-S1(C)    ', N'Bulong M16x100 LGN inox', N'Bulong', N'xXx', N'Con', 1.2000000476837158, 1.2000000476837158, 0.5, 1, 0, 15, N'Chưa cập nhật')
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-LGN-M16x100-S4(C)    ', N'Bulong M16x100 LGN inox 304', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-LGN-M16x120-M(C)     ', N'Bulong M16x120 LGN mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 40, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-LGN-M16x150-M(C)     ', N'Bulong M16x150 LGN mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 72, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-LGN-M16x150-S4       ', N'Bulong M16x150 LGN inox 304', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 7, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-LGN-M16X20-M(C)      ', N'Bulong M16x30 LGN mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 500, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-LGN-M16x50-M(C)      ', N'Bulong M16x50 LGN mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 40, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-LGN-M16x60-M(C)      ', N'Bulong M16x60 LGN mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-LGN-M16X70-M(C)      ', N'Bulong M16x70 LGN mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 130, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-LGN-M16X80-M(C)      ', N'bulong m16x80 LGN mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 35, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-LGN-M18x150-M(C)     ', N'Bulong M18x150 LGN mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 7, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-LGN-M20X120-M(C)     ', N'Bulong M20x120 LGN mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-LGN-M20x60-M(C)      ', N'Bulong M20x60 LGN mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 10, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-LGN-M4X10- S1        ', N'Bulong m4x10 LGN Inox 201', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 1200, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-LGN-M5x10-M(C)       ', N'Bulong M5x10 LGN mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-LGN-M5x12-M(C)       ', N'Bulong M5x12 LGC côn  mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-LGN-M5x15-M(C)       ', N'Bulong M5x15 LGN mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 420, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-LGN-M5X25-M(C)       ', N'Bulong M5x25 LGN mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 450, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-LGN-M5x30-M(C)       ', N'Bulong M5x30 LGN mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 250, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-LGN-M5x40-M          ', N'Bulong M5x40 LGN mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-LGN-M5x50-S1         ', N'Bulong M5x50 LGN Inox', N'Bulong', N'xXx', N'Con', 1.2000000476837158, 1.2000000476837158, 0.5, 1, 0, 30, N'Chưa cập nhật')
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'bul-LGN-M5x50-S4         ', N'Bulong M5x50 LGN Inox 304', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-LGN-M6X10-M          ', N'Bulong m6x10 LGN mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 500, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-LGN-M6x10-S1(C)      ', N'Bulong M6x10 LGN inox', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-LGN-M6x10-S4         ', N'Bulong M6x10 LGN inox 304', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-LGN-M6X100-M         ', N'Bulong m6x100 LGN mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-LGN-M6x12-M(C)       ', N'Bulong M6x12 LGN mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-LGN-M6x15-M(C)       ', N'Bulong M6x15 LGN mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 400, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-LGN-M6X15-S1         ', N'Bulong M6x15 LGN inox', N'Bulong', N'xXx', N'Con', 1.2000000476837158, 1.2000000476837158, 0.5, 1, 0, 30, N'Chưa cập nhật')
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-LGN-M6X20-M          ', N'Bulong M6x20 LGN mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 500, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-LGN-M6X20-S1         ', N'Bulong M6x20 LGN inox 304', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-LGN-M6x25-M(C)       ', N'Bulong M6x25 LGN mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 750, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-LGN-M6x25-S1(C)      ', N'Bulong M6x25 LGN inox', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 1350, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-LGN-M6x30-M(C)       ', N'Bulong M6x30 LGN mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 45, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-LGN-M6X30-S1         ', N'Bulong M6x20 LGN inox', N'Bulong', N'xXx', N'Con', 1.2000000476837158, 1.2000000476837158, 0.5, 1, 0, 50, N'Chưa cập nhật')
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'Bul-LGN-M6x30-S4         ', N'Bulong M6x30 LGN Inox 304', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-LGN-M6x40-M(C)       ', N'Bulong M6x40 LGN mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 2800, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-LGN-M6X50-M          ', N'Bulong m6x50 LGN mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 100, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-LGN-M6X60-M(C)       ', N'Bulong M6x60 LGN mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 45, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-LGN-M6x60-S1(C)      ', N'Bulong M6x60 LGN inox', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-LGN-M6x70-M(C)       ', N'Bulong M6x70 LGN mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 100, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-LGN-M6X80-M(C)       ', N'Bulong M6x80 LGN mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-LGN-M6X80-S1         ', N'BULONG M6X80 LGN Inox 304', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-LGN-M8x10-M          ', N'Bulong M8x10 LGN mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-LGN-M8x10-M(C)       ', N'Bulong M8x10 LGN mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 840, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-LGN-M8x100-M(C)      ', N'Bulong M8x100 LGN mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 60, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-LGN-M8x12-M(C)       ', N'Bulong m8x12 LGN mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 410, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-LGN-M8X12-S1         ', N'bulong M8x12 lgn inox', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 270, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-LGN-M8x12-S4(C)      ', N'Bulong M8x12 LGN inox 304', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-LGN-M8x120-M(C)      ', N'Bulong M8x120 LGN mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-LGN-M8x15-M(C)       ', N'Bulong M8x15 LGN mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 1200, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-LGN-M8x15-S1(C)      ', N'Bulong M8x15 LGN inox', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-LGN-M8x20-M(C)       ', N'Bulong M8x20 LGN mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-LGN-M8x20-S1(C)      ', N'Bulong M8x20 LGN inox', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-LGN-M8X25-M(C)       ', N'Bulong M8x25 LGN mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-LGN-M8x25-S1         ', N'Bulong M8x25 LGN inox', N'Bulong', N'xXx', N'Con', 1.2000000476837158, 1.2000000476837158, 0.5, 1, 0, 80, N'8con/lạng')
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'Bul-LGN-M8x25-S4         ', N'Bulong M8x25 LGN Inox 304', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-LGN-M8x25-S4(C)      ', N'Bulong M8x25 LGN inox 304 - bộ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-LGN-M8x30-M(C)       ', N'Bulong M8x30 LGN mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 140, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-LGN-M8x30-S1(C)      ', N'Bulong M8x30 LGN inox', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 84, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-LGN-M8X35-M          ', N'Bulong M8x35 LGN mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 150, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-LGN-M8x35-S1(C)      ', N'Bulong M8x35 LGN inox', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-LGN-M8x40-M(C)       ', N'Bulong M8x40 LGN mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-LGN-M8x40-S1(C)      ', N'Bulong m8x40 LGN inox', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 150, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-LGN-M8X45-M          ', N'Bulong m8x45 LGN mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 250, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-LGN-M8x45-S1(C)      ', N'Bulong M8x45 LGN inox', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 28, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-LGN-M8x50-M(C)       ', N'Bulong M8x50 LGN mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-LGN-M8X50-S1         ', N'Bulong M8x50 LGN inox', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-LGN-M8x60-M(C)       ', N'Bulong M8x60 LGN mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 65, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-LGN-M8x60-S4(C)      ', N'Bulong M8x60 LGN inox 304 - bộ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-LGN-M8x70-M(C)       ', N'Bulong M8x70-LGN mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-LGN-M8x80-M(C)       ', N'Bulong M8x80 LGN mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-LGN-M8x80-S1(C)      ', N'Bulong M8x80 LGN inox', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
GO
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-RL-TR-M10x60-M       ', N'Bulong M10x60 LG Trụ mạ ren lửng', N'Bulong', N'xXx', N'Con', 1.2000000476837158, 1.2000000476837158, 0.5, 1, 0, 18, N'Chưa cập nhật')
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-RL-TR-M8x45-M        ', N'Bulong M8x45 LGC Trụ mạ ren lửng', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-TH-M8X30-S4          ', N'Bulong tai hồng  M8x30 Inox', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-TR- M6X20-M(C)       ', N'Bulong M6x20 LGT trụ mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 6400, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-TR-M10x15-Ð(C)       ', N'Bulong M10x15 LG trụ đen', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 300, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-TR-M10X25-M          ', N'Bulong M10x25 LG trụ mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 96, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-TR-M10X25-S1(C)      ', N'Bulong M10x25 LG trụ inox', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 120, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-TR-M10x35-S1(C)      ', N'Bulong M10x35 LGC trụ inox', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-TR-M10X50-M          ', N'Bulong m10x50 LG trụ mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-TR-M10X50-S1(C)      ', N'Bulong m10x50 LG trụ inox', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 27, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-TR-M12x100-S1        ', N'Bulong M12x100 LG trụ inox', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 28, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-TR-M12x20-M(C)       ', N'Bulong M12x20 LG trụ mạ', N'Bulong', N'xXx', N'Con', 1.2000000476837158, 1.2000000476837158, 0.5, 1, 0, 39, N'Chưa cập nhật')
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-TR-M12x50-M(C)       ', N'Bulong M12x50 LGC trụ mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 280, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-TR-M12X60-M(C)       ', N'Bulong M12x60 LG trụ mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 90, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-TR-M12x60-S1(C)      ', N'Bulong M12x60 LGC trụ Inox', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 33, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-TR-M14x12-M(C)       ', N'BulongM14x12 LGC trụ mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-TR-M14X20-M(C)       ', N'Bulong M14x20 LG trụ mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-TR-M16x30-M          ', N'Bulong M16x30 LGC trụ mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 13, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-TR-M16x60-M(C)       ', N'Bulong M16x60 LG trụ mạ', N'Bulong', N'xXx', N'Con', 1.2000000476837158, 1.2000000476837158, 0.5, 1, 0, 50, N'Chưa cập nhật')
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-TR-M18x60-M(C)       ', N'Bulong M18x60 LG trụ mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-TR-M20x50-M(C)       ', N'Bulong M20x50 LG Trụ mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 13, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-TR-M4X40-S1          ', N'Bulong M4x40 LG trụ inox', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 50, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-TR-M5X10- M          ', N'Bulong M5x10 LG trụ mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-TR-M5x15-S1          ', N'Bulong M5x15 LGC trụ inox', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-TR-M5X15-S1(C)       ', N'Bulong M5x15 LG trụ Inox', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 120, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-TR-M5X20-S1(C)       ', N'bulong m5x20 LG Trụ inox', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 60, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-TR-M5X25-S1(C)       ', N'Bulong M5x25 LG trụ inox', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 220, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-TR-M5x40-S1(C)       ', N'Bulong M5x40 LGC trụ inox', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 110, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-TR-M5x55-S1          ', N'Bulong M5x55 LGC trụ inox', N'Bulong', N'xXx', N'Con', 1.2000000476837158, 1.2000000476837158, 0.5, 1, 0, 70, N'Chưa cập nhật')
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-TR-M6x10- S1         ', N'Bulong m6x10 LG Trụ inox 201', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-TR-M6x12-M(C)        ', N'Bulong M6x12 LGC trụ mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-TR-M6X12-S1          ', N'Bulong M6x12 LG Trụ inox', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 90, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-TR-M6x15-M(C)        ', N'Bulong m6x15 LGC trụ Mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-TR-M6X15-S1          ', N'bulong m6x15 LG trụ inox', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-TR-M6X20-S1(C)       ', N'Bulong M6x20 LG trụ inox', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 2000, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-TR-M6x25-M(C)        ', N'Bulong M6x25 LGC trụ mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 40, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-TR-M6x30-M(C)        ', N'Bulong M6x30 LGC trụ mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 3000, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-TR-M6x30-S1(C)       ', N'Bulong M6x30 LGC trụ inox', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-TR-M6x35-M(C)        ', N'Bulong M6x35 LGC trụ mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 2200, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-TR-M6x35-S1(C)       ', N'Bulong M6x35 LGC trụ inox 201', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 70, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-TR-M6x40-M(C)        ', N'Bulong M6x40 LGC trụ mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-TR-M6x40-S1(C)       ', N'Bulong M6x40 LGC trụ inox 201', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-TR-M6x45-M(C)        ', N'Bulong M6x45 LGC trụ mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-TR-M6x50-M(C)        ', N'Bulong M6x50 LGC trụ mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-TR-M6x50-S1(C)       ', N'Bulong M6x50 LG trụ inox', N'Bulong', N'xXx', N'Con', 1.2000000476837158, 1.2000000476837158, 0.5, 1, 0, 20, N'Chưa cập nhật')
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-TR-M6x60-M(C)        ', N'Bulong M6x60 LGC trụ mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 240, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-TR-M6x70-M(C)        ', N'Bulong M6x70 LGC trụ mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-TR-M8x100-M(C)       ', N'Bulong  M8x100 LGC trụ mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 842, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-TR-M8x12-M(C)        ', N'bulong M8x12 LGC trụ mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-TR-M8x12-S1(C)       ', N'Bulong M8x12 LGC trụ inox', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 220, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-TR-M8x15-S1          ', N'Bulong M8x15 trụ inox', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 600, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-TR-M8x20-M(C)        ', N'Bulong M8x20 LGC trụ mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-TR-M8X20-S           ', N'Bulong M8x20 LG trụ  inox', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 600, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-TR-M8x25-M(C)        ', N'Bulomg M8x25 LGC trụ mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-TR-M8x25-S1(C)       ', N'Bulong M8x25 LGC trụ inox', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-TR-M8x30-M(C)        ', N'Bulong M8x30 LGC trụ mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-TR-M8x30-S1          ', N'Bulong M8x30 LGC trụ inox', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 70, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-TR-M8x35-M(C)        ', N'Bulong M8x35 LGC trụ mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 470, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'Bul-TR-M8x35-S4          ', N'Bulong M8x35 LG Trụ Inox 304', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-TR-M8x40-M(C)        ', N'Bulong M8x40 LGC trụ mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 850, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-TR-M8X40-S1          ', N'Bulong M8x40 LG trụ inox', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 70, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-TR-M8x45-M(C)        ', N'Bulong M8x45 LGC trụ mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-TR-M8x45-S1          ', N'Bulong M8x45 LGC trụ Inox', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 60, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-TR-M8x50-M(C)        ', N'Bulong M8x50 LGC trụ mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 420, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-TR-M8x50-S1(C)       ', N'Bulong M8x50 LGC trụ inox', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 300, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-TR-M8x60-M(C)        ', N'Bulong M8x60 LGC mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-TR-M8X60-S1          ', N'Bulong M8x60 LG Trụ inox', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 280, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-TR-M8X70-S1(C)       ', N'Bulong m8x70 LG trụ inox', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 35, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUL-TR-RL-M16x80-S1      ', N'Bulong M16x80 trụ inox ren lửng', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BULONGINOX 168           ', N'Bulong M6x15 đầu bằng inox', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BULONGINOX 182           ', N'Bulong M10x25 LGC inox 304 - bộ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BULONGINOX 186           ', N'Bulong M4x40 LG cầu  inox 201', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BULONGINOX 198           ', N'Bulong M5x10 chìm cầu inox', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BULONGINOX 211           ', N'bulong 10x25 lgn inox 201', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BULONGINOX 215           ', N'bulong 12x50 lgc inox', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BULONGINOX 22            ', N'Bulong M4x8 LGC inox', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BULONGINOX 221           ', N'Bulong M4x8 LGC inox', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BULONGINOX 26            ', N'Bulong M6x30 chìm cầu inox', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BULONGINOX 28            ', N'Bulong M6x50 LGN inox 304', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BULONGINOX 29            ', N'Bulong M4x10 chỏm cầu inox', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BULONGINOX 300           ', N'bulong m12x60 lgc inox', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BULONGINOX 321           ', N'bulong 10x40 lgn inox 201', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BULONGINOX 321l          ', N'bulong 10x40 lgn inox 201', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BULONGINOX 323           ', N'Bulong M10x50 LGC inox 201 - bộ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BULONGINOX 325           ', N'Bulong M10x20 LGC inox 201 - bộ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BULONGINOX 329           ', N'bulong m6x10 đầu mo inox 304', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BULONGINOX 330           ', N'Bulong M10x150', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BULONGINOX 332           ', N'Bulong lục giác chìm M4x20', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BULONGINOX 336           ', N'BULONG M3X12 LGC INOX - BỘ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BULONGINOX 338           ', N'Bulong M4x20 LGN inox - bộ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BULONGINOX 339           ', N'bulong m4x25 lgc inox - bộ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BULONGINOX 340           ', N'Bulong M3x15 inox LGC - bộ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BULONGINOX 342           ', N'Bulong M2.5x15 LGC inox', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BULONGINOX 343           ', N'Bulong m3x8 LGC inox đầu bẳng (côn)', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BULONGINOX 344           ', N'Bulong M6x40 LGC inox', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BULONGINOX 345           ', N'Bulong LGC inox 304 M4x16', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BULONGINOX 346           ', N'Bulong M6x40 LGTrụ inox 201', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BULONGINOX 36            ', N'Bulong M4x20 LGN inox', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BULONGINOX 37            ', N'Bulong M5x40 LGC inox', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BULONGINOX 38            ', N'Bulong M6x25 LGC inox', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
GO
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BULONGINOX 39            ', N'Bulong M6x10 LGC inox', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BULONGINOX 41            ', N'Bulong 8x80 LGC inox', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BULONGINOX 44            ', N'Bulong M10x60 LGC inox', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BULONGINOX 53            ', N'Bulong M3x10 LGC inox', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BULONGINOX 54            ', N'Bulong M4x10 LGC inox', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BULONGINOX 56            ', N'Bulong M12x100LGN inox 304', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BULONGINOX 58            ', N'Bulong M10x80 LGN inox 304- bộ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BULONGINOX 59            ', N'Bulong M12x25 LGN inox 304- bộ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BULONGINOX 60            ', N'Bulong M6x50 inox chỏm cầu', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BULONGINOX 62            ', N'Bulong M4x30 LGC inox 201- bộ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BULONGINOX 65            ', N'M12x120 LGN inox 304', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BULONGINOX 66            ', N'Bulong M10x50 LGN inox', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BULONGINOX 69            ', N'Bulong M4x15 LGC inox', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BULONGINOX 70            ', N'Bulong M6x12 inox côn', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BULONGINOX 72            ', N'Bulong M6x30 inox côn', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BULONGINOX 74            ', N'Bulong M8x20 LGC inox', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BULONGINOX 75            ', N'Bulong M12x30 LGC inox', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BULONGINOX 76            ', N'Bulong M5x15 LGN inox 304 - bộ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BULONGINOX 77            ', N'M6x12 cầu inox', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BULONGINOX 79            ', N'M12x30 LGN inox', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BULONGINOX 80            ', N'Bulong M6x60 LGN inox 304- bộ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BULONGINOX 84            ', N'Bulong M6x35 LGN inox 304 - bộ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BULONGINOX 85            ', N'Bulong M6x70 LGN inox', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BULONGINOX 86            ', N'Bulong M5x60 LGN inox 304 - bộ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BULONGINOX 88            ', N'Bulong M8x12 LGC inox', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BULONGINOX 89            ', N'Bulong M4x10 LGN inox 304- bộ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BULONGINOX 90            ', N'Bulong M3x25 LGC inox', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BULONGINOX 91            ', N'Bulong M8x20 LGN inox 304 (bộ)', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BULONGINOX 92            ', N'Bulong M10x20 LGN inox 304 bộ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BULONGINOX 93            ', N'Bulong M10x50 LGN inox 304- bộ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BULONGINOX 95            ', N'Bulong M8x15 LGN inox 304', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BULONGINOX 97            ', N'Bulong M8x100 LGN inox 304', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BULONGINOX002            ', N'Bulong M5x60 LGC inox', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BULONGINOX003            ', N'Bulong LGC mo M5x20', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BULONGINOX005            ', N'Bulong M4x12 LGC inox', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BULONGINOX006            ', N'Bulong M5x8 cầu inox', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BULONGINOX008            ', N'Bulong M10x25 LGN inox 304', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BULONGINOX009            ', N'Bulong M10x80 LGN inox 304', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BULONGINOX10             ', N'Bulong m3x8 LGC inox', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BULONGINOX102            ', N'Bulong m3x8 LGC inox', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BULONGINOX103            ', N'Bulong m3x8 LGC inox', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BULONGINOX104            ', N'Bulong m3x8 LGC inox', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BULONGINOX105            ', N'Bulong m3x8 LGC inox', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BULONGINOX107            ', N'Bulong m3x8 LGC inox', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BULONGINOX108            ', N'Bulong m3x8 LGC inox', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BULONGINOX109            ', N'Bulong M6x60 LGC inox 304 - bộ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BULONGINOX112            ', N'Bulong M10x40 LGC 201', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BULONGINOX115            ', N'Bulong M12x20 LGN inox 304', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BULONGINOX117            ', N'Bulong M6x100 LGN inox 304', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BULONGINOX119            ', N'Bulong M3x6 LGC cầu inox', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BULONGINOX120            ', N'Bulong M3x6 LGC inox', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BULONGINOX121            ', N'Bulong M8x80 LGC inox 304', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BULONGINOX122            ', N'Bulong m8x10 LGN inox 304', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BULONGINOX127            ', N'Bulong M12x90 LGC inox 304', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BULONGINOX128            ', N'Bulong M12x40 LGC inox 304', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BULONGINOX129            ', N'Bulong M8x25 LGC inox 304', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BULONGINOX132            ', N'Bulong M10x50 LGN inox 304', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BULONGINOX133            ', N'Bulong M6x40 LGN inox 304', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BULONGINOX153            ', N'BULONG M3X12 LGC INOX', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BULONGINOX160            ', N'Bulong M8x30 LGC inox 304', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BULONGINOX162            ', N'Bulong M12x30 LGN inox 304', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BULONGINOX164            ', N'Bulong 5x12 LGN inox 201', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BULONGINOX165            ', N'Bulong M5x25 LGN inox', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BULONGINOX166            ', N'Bulong M6x100 inox 201 ren lửng', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BULONGINOX169            ', N'Bulong M8x12 bằng LGC inox 304', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BULONGINOX171            ', N'Bulong M4x12 LGN inox', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BULONGINOX172            ', N'Bulong M4x10 LGN inox', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BULONGINOX173            ', N'Bulong inox M2x8 lgc', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BULONGINOX174            ', N'Bulong M3x15 inox LGC', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BULONGINOX175            ', N'Bulong M6x25 LGN inox', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BULONGINOX185            ', N'Bulong M8x90 LGN inox', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BULONGINOX187            ', N'Bulong M6x12 LGN inox', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BULONGINOX188            ', N'Bulong M10x80 LGN inox', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BULONGINOX189            ', N'Bulong M8x50 LGN inox 304', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BULONGINOX190            ', N'Bulong M4x30 LGN inox', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BULONGINOX191            ', N'Bulong M5x20 LGN inox', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BULONGINOX193            ', N'bulong m4x15 lgn inox 201', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BULONGINOX199            ', N'bulong m8x30 đầu mo inox 304', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BULONGINOX203            ', N'bulong 8x25 đầu côn inox 304', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BULONGINOX210            ', N'bulong m10x70 lgn inox', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BULONGINOX211            ', N'Bulong M5x20 LGC inox 304', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BULONGINOX212            ', N'Bulong M10x20 mo inox 304', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BULONGINOX213            ', N'Bulong 14x30 LGN inox 304', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BULONGINOX217            ', N'Bulong M12x100LGN  inox 304 bộ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BULONGINOX219            ', N'Bulong M4x30 LGC inox 201', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BULONGINOX221            ', N'Bulong M10x15 mo inox 304', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BULONGINOX222            ', N'Bulong M5x15 mo inox 304', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BULONGINOX223            ', N'Bulong M5x15 LGC chỏm cầu', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BULONGINOX226            ', N'Bulong M6x20 mo inox 304', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BULONGINOX238            ', N'Bulong M4x30 inox đầu mo', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BULONGINOX328            ', N'Bulong M6x70 LGC', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BULONGINOX334            ', N'Bulong LGC đầu chỏm cầu M10x60', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BULONGINOX335            ', N'Bulong M10x25 LGC inox đầu côn (bằng)', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BULRL-TR-M8x80-S1(C)     ', N'Bulong M8x80 LGC trụ inox ren lửng', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BULY 06                  ', N'Buly 260', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BULY 07                  ', N'Buly D50', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUSING 01                ', N'Busing to', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUSING 02                ', N'Busing nhỏ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUT-IDE-YW1B-V4E01R      ', N'Nút ấn EMG M22-1NC(Idec)', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUT-IDE-YW1E- M1E10G     ', N'Mút ấn nhả không đèn màu xanh M1E10G', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
GO
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUT-IDE-YW1L-MF2E10Q4G   ', N'Nút ấn nhả có đèn màu xanh MF2E10QM3G', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUT-IDE-YW1L-MF2E10Q4Y   ', N'nút ấn có đèn màu vàng P22 24V YW1L-MF2E10Q4Y', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUT-IDE-YW1L-MF2E10QM3G  ', N'Nút ấn có đèn màu xanh MF2E01Q4R', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUT-IDE-YW1L-MF2E11Q4R   ', N'Nút ấn đỏ có đèn 24V, M22-1NC', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUT-IDE-YW1L-MF2E11QM3R  ', N'Nút ấn màu đỏ có đèn MF2E11QM3R', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUT-SCH-A2EA31           ', N'Nút ấn màu xanh M22-1NO( Schneider)', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUT-SCH-XA2EA31          ', N'Nút ấn màu xanh XA2EA31', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUT-SCH-XA2EA42          ', N'Nút ấn màu đỏ M22-1NC( Schneider)', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUT-SCH-XA2ES542         ', N'Nút ấn EMG M22-1NC(Schneider)', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUT-SCH-XA2EW33B1        ', N'Nút ấn màu xanh XA2EW33B1(Schneider)', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUT-SCH-XA2EW34B1        ', N'Nút ấn màu đỏ XA2EW34B1(chneider)', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUT-SCH-XA2EW34B2        ', N'Nút nhấn có đèn màu đỏ( Schneider)', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'BUT-SCH-XA2EW35B1        ', N'Nút ấn màu vàng XA2EW35B1( Schneider)', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'CC001                    ', N'Càng cua phi 16', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'CC002                    ', N'Càng cua phi 20', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'CCDCVP 14                ', N'Danh thiếp', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'CCH-B-M6-S1              ', N'Con chạy bi M6 inox', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'CCH-B-M8                 ', N'con chạy bi lá M8 inox', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'CCH-B-M8-S1              ', N'Con chạy bi M8 inox', N'Bulong', N'xXx', N'Con', 1.2000000476837158, 1.2000000476837158, 0.5, 1, 0, 1, N'Chưa cập nhật')
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'CCH-L-M5-M               ', N'Con chạy lá M5 mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 1350, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'CCH-L-M6-M               ', N'Con chạy lá M6 mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 6000, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'CCH-V-M5-M               ', N'Con Chạy Vuông M8', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'CCH-V-M6-M               ', N'Con chạy vuông M6', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 50, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'CCH-V-M6-S1              ', N'Con chạy vuông M6 inox', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'CCH-V-M8-M               ', N'Con Chạy Vuông M8', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 1200, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'CHECH001                 ', N'Chếch 110', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'CHOI 01                  ', N'Chổi', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'CHOI 03                  ', N'Chổi tẩy inox', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'CHOI 05                  ', N'chổi quyét sơn 4 inch', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'CHOI 06                  ', N'Chổi đánh rỉ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'CHOIQUETSON0001          ', N'chổi quét sơn nhỏ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'CHOT 01                  ', N'Chốt chuột của', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'CHOT 02                  ', N'chốt inox', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'CHOT 03                  ', N'Chốt định vị - CUM6-15', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'CHOT 04                  ', N'Chốt định vị bằng thép MS4-8', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'CHOT 05                  ', N'Chốt ddingj vị bằng thép MS10-20', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'CHOTCHE 01               ', N'Chốt chẻ 2', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'CHOTCHE 04               ', N'Chốt chẻ phi 3', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'CHOTCHE 05               ', N'Chốt chẻ P4', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'CHOTCHE 06               ', N'Chốt chẻ d2.5', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'CHOTCHE 07               ', N'Chốt chẻ 5', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'COCBI 01                 ', N'Cốc bi nhựa ngoài D38', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'COCBI 02                 ', N'Cốc bi nhựa P38x12', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'COCBI 03                 ', N'Cốc bi nhựa P50x12', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'COCBI 04                 ', N'Cốc bi nhựa P60x12', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'COCBI 06                 ', N'Cốc bi nhựa trong D38/12', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'COCBI 07                 ', N'Cốc bi sắt D60x15 VN', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'COCBI 08                 ', N'Cốc bi sắt P38x12', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'COCBI 09                 ', N'Cốc bi sắt P60x12 - VN', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'COCBI 11                 ', N'Cốc bi sắt P50x12', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'COCBI 13                 ', N'Cốc bi thép D25x8', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'COCBI 15                 ', N'Cốc bi sắt D42x12', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'COCBI 17                 ', N'Cốc bi nhựa D50', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'COCBI 18                 ', N'Cốc bi nhưa ngoài D60', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'COG280518001             ', N'Đầu đọc mã vạch gắn cố định DM 474', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'COG280518002             ', N'Cáp Ethernet (5 mét)', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'COG280518003             ', N'Cáp năng lượng và tín hiệu Vào/Ra (5 mét)', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'COG280518004             ', N'Thiết bị tăng vùng nhìn của đầu đọc', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'COG280518005             ', N'Đồ gá của thiết bị tăng vùng nhìn', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'COG280518006             ', N'Cơ cấu kéo dài đầu đọc mã vạch', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'COIEP001                 ', N'Cối ép cốc bi 1', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'COIEP002                 ', N'Cối ép cốc bi 2', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'COIEP003                 ', N'Cối ép cốc bi 3', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'COIEP004                 ', N'Cối ép cốc bi 4', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'COIEP006                 ', N'Cối ép cốc bi', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'CONTRUOT 01              ', N'Con trượt tròn LMK20LUUS', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'CONTRUOT 02              ', N'Con trượt tròn LMF20LUUS', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'COSO 01                  ', N'Cơ sở chín: Base Q35B', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'COSO 02                  ', N'Bass + sensor', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'COT 01                   ', N'Cốt chụp P6', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'COT 02                   ', N'Cốt chụp P2', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'COT 03                   ', N'Cốt bọc 2-3 đỏ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'COT 04                   ', N'Cốt Y3.5-5 bọc', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'COT 05                   ', N'Cốt trần 5.5', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'COT 07                   ', N'Cốt bọc 2-4', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'COT 10                   ', N'Cốc bọc đỏ 2-3', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'COT 11                   ', N'Cốc bọc vàng 2-3', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'COT 12                   ', N'Cốt kim rỗng 1.5 - 1508', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'COT 13                   ', N'Cốt kim rỗng 2.5 - 2508', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'COT 14                   ', N'Cốt kim rỗng 4 - 4009', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'COT 15                   ', N'Cốt kim rỗng 6 - 6012', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'COT 16                   ', N'Cốt T6x150', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'COT 17                   ', N'Cốt 3x75', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'COT 21                   ', N'cốt trần 2.5', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'COT 22                   ', N'Cốt chụp P3', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'COT 23                   ', N'Cốt P10-8', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'COT 31                   ', N'Cốt dẹt 5-14', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'COT 32                   ', N'Cốt tròn RNB 2-4', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'COT 36                   ', N'Cốt trần tròn 2-4', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'COT 43                   ', N'Cốt tròn trần 2-3', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'COT 44                   ', N'Cốt Y trần 2-3', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'COT 45                   ', N'Cốt Y trần 2-4', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'COT 46                   ', N'Cốt tròn trần 5.5-5', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'COTC 01                  ', N'Cột chấn bằng Inox', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'COTC 02                  ', N'Cột 3000', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'COVER 24                 ', N'Cover 2', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'COVER 25                 ', N'Cover 1', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'CPU 01                   ', N'CPU - Q06UDEHCPU', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'CUT 07                   ', N'Cút cong 27', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'CUT 29                   ', N'cút cong 32 inox', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
GO
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'CUT 32                   ', N'cút nhựa nối ren trong d42', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'CUT 33                   ', N'Cút siết áp PG16', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'CUT 36                   ', N'Cút siết áp PG19', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'CUT 37                   ', N'Cút 160', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'CUT 38                   ', N'Cút nhựa 200', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'CUT 39                   ', N'Cút xiết PG nhựa P25', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'CUT 40                   ', N'Cút xiết PG nhựa P16', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'CUT 41                   ', N'Cút xiết PG nhựa 19', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'CUTCONGINOX              ', N'Cút cong inox 304 d 27', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'CUTINOX 02               ', N'Cút inox P32', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'CUTNOI 01                ', N'Cút nối KQ2L12-02AS', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'CUTNOI 02                ', N'Cút nối KQ2T12-00A', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'CUTNOI 03                ', N'Cút nối KQ2L12-03AS', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'CUTTKEM 01               ', N'Cút T 27 kẽm', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'CUTTKEM 02               ', N'Cút ren MK 27', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'DEDINH 01                ', N'Đinh 4', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'DEN 03                   ', N'Bóng halogen L800 + đầu sứ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'DEN 04                   ', N'Bóng Haloge L10006 đầu sứ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'DENOI                    ', N'Đế nổi', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'DEROLE 01                ', N'Đế role', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'DEROLE 02                ', N'Đế role 8 chân CZF', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'DEROLE 03                ', N'Đế role 14 chân dẹt', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'DEROLE 04                ', N'Đế role PYFA-N BY OMZ, hãng OMROM', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'DEROLE 05                ', N'Rowle trung gian 24v + đế- Schneider', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'DEROLE 08                ', N'Rơ le 1083276', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'DEROLE 09                ', N'đế role 8 chân', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'DETHEP 04                ', N'Chân đế thép P60', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'DIENTRO 01               ', N'Điện trở L=1000', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'DIENTRO 02               ', N'Điện trở xả BR1000W50RJ-EM', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'DINH 01                  ', N'Đinh 4', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'DINHGIM 01               ', N'Đinh ghim bông 6.5cm', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'DINHRUT 02               ', N'Đinh rút 4', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'DIOT 01                  ', N'Đi ốt nắm 100', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'DIR-D2-M                 ', N'Đinh rút 2', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'DIR-D3-M                 ', N'đinh rút 3', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'DKM001                   ', N'Bộ thay đổi tốc độ cho động cơ FX1000A', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'DONGCO 01                ', N'Động cơ 6IK180RGU-CF/6GU30K', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'DONGCO 02                ', N'Động cơ điện xoay chiều 3 pha 0.37KW/3pha/380V/50H', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'DONGCO 03                ', N'Đông cơ PL32-0750-30S3', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'DONGCO 04                ', N'Động cơ WFAB67-25.13-3Kw+Brake, công suất 3kw                                                       ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'DONGCO 109               ', N'Động cơ wansin 0.2KW GV22/200,i=40<2', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'DONGCO 11                ', N'Động cơ 5CS75K DPG 51K 120 RGUCF', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'DONGCO 19                ', N'Động cơ liền hộp giảm tốc 9SDGE-180F2P/9PBK180BH', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'DONGCO 20                ', N'Đông cơ + hộp giảm tốc 6IK200RGU-CF6GU30k', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'DONGCO 51                ', N'Động cơ liền hộp giảm tốc 6IK180RGU40RC', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'DONGCO 52                ', N'Động cơ 6IK180RGU40RC + bộ điều khiển hiển thị số', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'DONGCO 54                ', N'Động cơ 5IK120RGU-CF/5GU40K+ bộ điều khiển hiển thị số', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'DONGCO 55                ', N'Động cơ liền hộp giảm tốc 4IK25GRNC54GN40RC1', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'DONGCO 61                ', N'Động cơ 180-50 trục âm', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'DONGCO 62                ', N'Động cơ 3GVA072002-CSC abb', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'DONGCO 66                ', N'Động cơ 5IK60RGU-30CF', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'DONGCO 67                ', N'động cơ liền hộp giảm tốc 6IK200RGU-CF-20RC', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'DONGCO 68                ', N'Động cơ liền hộp giảm tốc 6IK200RGU-CF-200RC', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'DONGCO 70                ', N'Động cơ AC Servo MHMF042L1U2M', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'DONGCO 71                ', N'Động cơ AC Servo Motor 0.85KW', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'DONGCO 72                ', N'Động cơ hộp số xoay chiều 3 pha G3FM-22-10-T040A 0', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'DONGCO 73                ', N'Động cơ hộp số xoay chiều 3 pha G3FM-28-30-T04A 0.', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'DONGCO 75                ', N'bộ động cơ ac servo công suất 400w ASD-B2-0421-B', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'DONGCO 89                ', N'Động cơ liền hộp giảm tốc 6IK180RGU/6GU30K', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'DONGHO 10                ', N'đồng hồ áp suất G36-10-01', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'DONGHO 16                ', N'Đồng hồ đo đa năng MT4W-DV-4N', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'DUNGDINH02               ', N'dung dịch axit loãng', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'DUYHUNG 001              ', N'khối chân đế Q38B', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'DUYHUNG 002              ', N'khối cấp nguồn Q62P', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'DUYHUNG 003              ', N'mô đun mạng QJ61BT11N', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'DUYHUNG 004              ', N'bộ ngõ vào ra AJ65SBTB1-16DT', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'ECU- M4-S1               ', N'Ecu 4 inox', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'ECU-K_M6                 ', N'Ecu M6 keo tán nhựa', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'ECU-M10-M                ', N'Ecu 10 mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 4280, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'ECU-M10-S1               ', N'Ecu  M10 inox', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 950, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'ECU-M10-S4               ', N'Ecu 10 inox 304', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'ECU-M12-M                ', N'Ecu 12 mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 1500, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'ECU-M12-S1               ', N'Ecu 12 inox', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 200, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'ECU-M14-M                ', N'Ecu 14 mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 4200, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'ECU-M16-M                ', N'Ecu M16 mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 1620, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'ECU-M16-S1               ', N'Ecu M16 inox', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 250, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'ECU-M16-S4               ', N'Ecu 16 inox 304', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'ECU-M18-M                ', N'ECU M18 Mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'ECU-M20-M                ', N'Ecu M20 mạ', N'Bulong', N'xXx', N'Con', 1.2000000476837158, 1.2000000476837158, 0.5, 0.5, 0, 190, N'Chưa cập nhật')
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'ECU-M24-M                ', N'Ecu M24 mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'ECU-M4-M                 ', N'Ecu 4 mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 700, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'ECU-M4-S1                ', N'Ecu 4 inox', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 220, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'ECU-M5-M                 ', N'Ecu 5 mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 750, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'ECU-M5-S1                ', N'Ecu 5 inox', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 250, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'ECU-M6-M                 ', N'Ecu 6 mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 6600, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'ECU-M6-S1                ', N'Ecu 6 inox', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 90, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'ECU-M8-M                 ', N'Ecu 8 mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 7700, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'ECU-M8-S1                ', N'Ecu 8 inox', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 1100, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'ECU-M8-S4                ', N'ECU M8 Inox 304', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 80, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'ECUH-M10- M              ', N'Ecu Tự Hãm M10', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'ECUH-M6- M               ', N'Ecu M6 tự hãm mạ', N'Bulong', N'xXx', N'Con', 1.2000000476837158, 1.2000000476837158, 0.5, 0.5, 0, 150, N'50con/lạng')
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'ECUH-M6-M                ', N'Ecu 6 đen tán vuông', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'ECUH-M8-M                ', N'Ecu M8 keo tán nhựa', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 200, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'EZ9F34306                ', N'Aptomat MCB 3P-6Av(Schneider)', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'GEN 01                   ', N'Gen co nhiệt P2', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'GEN 02                   ', N'Gen co nhiệt P4', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'GEN 03                   ', N'Gen co nhiệt P8', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'GEN 04                   ', N'Gen 40x80', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'GEN 11                   ', N'Gen chịu nhiệt phi 10', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'GEN 17                   ', N'GEN CHỊU NHIỆT P6', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
GO
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'GEN 18                   ', N'GEN CHỊU NHIỆT P8', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'GEN 19                   ', N'gen in p3.5', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'GEN 28                   ', N'Gen co P60', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'GEN 31                   ', N'Gen chịu nhiệt P12', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'GEN 32                   ', N'Gen in 1.5', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'GEN 33                   ', N'Gen in 2.5', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'GEN 34                   ', N'Gen răng cưa 25x45', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'GEN 35                   ', N'Gen răng cưa 40x60', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'GEN 36                   ', N'Gen 20x40', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'GEN 37                   ', N'Gen ống 16', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'GHEN 01                  ', N'Gen hộp 60x100', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'Go-MDF-18                ', N'Gỗ MDF 18cm 800x800', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'GOIBI014                 ', N'UCT 207', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'GOTL.ASAHI.UCF206        ', N'Gối tự lựa Asahi UCF206', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'GOTL.ASAHI.UCF209        ', N'Gối tự lựa Asahi UCF209', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'GOTL.ASAHI.UCFL204       ', N'Gối tự lựa UCFL204 Asahi', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'GOTL.NSK.KFL005          ', N'Gối tự lựa KFL005 NSK', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'GOTL.NSK.UCFB204         ', N'Gối tự lựa UCFB204 NSK Inox', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'GOTL.NSK.UCFB207         ', N'Gối tự lựa UCFB207 NSK', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'GOTL.SKF.2209            ', N'Gối tự lựa SKF2209', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'GOTL.SKF.KFL003          ', N'Gối tự lựa KFL003 SKF', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'GOTL.VN.UCF204           ', N'Gối tự lựa UCF204', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'GOTL.VN.UCF205           ', N'Gối tự lựa UCF205', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'GOTL.VN.UCF206           ', N'Gối tự lựa UCF206', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'GOTL.VN.UCF207           ', N'Gối tự lựa UCF 207', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'GOTL.VN.UCF209           ', N'Gối tự lựa UCF209', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'GOTL.VN.UCF212           ', N'Gối tự lựa UCF212', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'GOTL.VN.UCF306           ', N'Gối tự lựa UCF306', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'GOTL.VN.UCFB205          ', N'Gối tự lựa UCFB205', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'GOTL.VN.UCFB206          ', N'Gối tự lựa UCFB206', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'GOTL.VN.UCFB207          ', N'Gối UCFB 207', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'GOTL.VN.UCFL004          ', N'gối UCFL004', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'GOTL.VN.UCFL005          ', N'Gối tự lựa UCFL005', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'GOTL.VN.UCFL203          ', N'Gối tự lựa UCFL203', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'GOTL.VN.UCFL204          ', N'Gối tự lựa UCFL 204', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'GOTL.VN.UCFL205          ', N'Gối UCFL205', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'GOTL.VN.UCFL206          ', N'Gối tự lựa UCFL206', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'GOTL.VN.UCFL207          ', N'Gối tự lựa UCFL207', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'GOTL.VN.UCFL208          ', N'Gối tự lựa UCFL208', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'GOTL.VN.UCT206           ', N'Gối tự lựa UCT206', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'GUONG 02                 ', N'Gương P250', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'HETHONGDOC 001           ', N'Hệ thống đọc mã vạch (code scaner)', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'HETHONGTHUYLUC001        ', N'Hệ thống thủy lực BT', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'HOPSO 01                 ', N'Hộp số không tên', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'HOPSO 02                 ', N'Hộp số 9PBK 30BH', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'HOPSO 03                 ', N'Hộp số NMRV50-1/30', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'HOPSO 04                 ', N'Hộp số NMRV 63 1/25', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'HOPSO 08                 ', N'Hộp số NMRV 63 1/20', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'IT-B.01-07I2             ', N'Gá driver', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'IT-B.01-07T              ', N'gá driver', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'IT-BTC.01-01N            ', N'Bích tăng chỉnh đầu 1', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'IT-BTC.01-02N            ', N'Bích tăng chỉnh đầu 2', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'IT-BTC.01-03N            ', N'Bích tăng chỉnh đầu 3', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'IT-BTC.01-03T            ', N'Bích tăng chỉnh đầu 3', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'IT-BTC.01-04T            ', N'Bích tăng chỉnh đầu 4', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'IT-CKD.01-02T            ', N'Bích kéo đầu', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'IT-CKD.01-03T            ', N'Cover quả lô', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'IT-CKD.01-04T            ', N'Cover cụm kéo đầu', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'IT-CKD.01.120.01T        ', N'Bích kéo đầu 120W', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'IT-CKD.01.180-01T        ', N'Bích kéo đầu 180W', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'IT-CKG.01-02T            ', N'Bích bị động', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'IT-CKG.01-03N            ', N'Thanh nhôm tăng chỉnh', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'IT-CKG.01-04T            ', N'Cover cụm kéo gầm', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'IT-CKG.01-04T1           ', N'Cover cụm kéo gầm', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'IT-CKG.01-05.114T        ', N'Bích hàn lô D114', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'IT-CKG.01-05.60T         ', N'Bích hàn lô D60', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'IT-CKG.01-05.76T         ', N'Bích hàn lô D76', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'IT-CKG.01-05.89T         ', N'Bích hàn lô D89', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'IT-CKG.01.120-01T        ', N'Bích chủ động 120W', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'IT-CKG.01.120-01T1       ', N'Bích chủ động 120W', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'IT-CKG.01.180-01T        ', N'Bích chủ động 180W', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'IT-CKG0.1-02T1           ', N'Bích chủ động SUS304', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'IT-CTC-01T               ', N'Chân tăng chỉnh M12xD60', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'IT-CTC-02T               ', N'Chân tăng chỉnh M16xD80', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'IT-CTC-03T               ', N'Chân tăng chỉnh M20xD80', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'IT-PK-01T                ', N'Con sâu', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'JIG0001                  ', N'Jig kiểm tra 1', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'JIG0002                  ', N'Jig kiểm tra 2', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'KEDUC 01                 ', N'Ke đúc 30x60', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'KEDUC 02                 ', N'Ke đúc 40x40', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'KEDUC 03                 ', N'Ke đúc 60x60', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'KEDUC 04                 ', N'Ke đúc 30x30', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'KEDUC 05                 ', N'Ke đúc 20x20', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'KEDUNGCU 001             ', N'Kệ dụng cụ trung màu xanh dương', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'KEGO 01                  ', N'Ke gỗ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'KEGOC002                 ', N'Ke góc 45x45', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'KENHOM 02                ', N'Ke nhôm 20x20', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'KEO 01                   ', N'Keo titebond', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'KEO 02                   ', N'Keo Silicol', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'KEO 05                   ', N'Keo 502', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'KEO 06                   ', N'Keo con chó', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'KEO 14                   ', N'Keo PVC', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'KEP 01                   ', N'Kép 1/4-3/4', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'KEP 13                   ', N'Kép 1/2', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'KEPONG01                 ', N'Kẹp ống P16', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'KHI 01                   ', N'Khí CO2', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'KHI 02                   ', N'Khí Ar to', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'KHI 03                   ', N'Khí AR loại bình nhỏ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'KHI 04                   ', N'Khí trộn', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'KHOI 02                  ', N'Khởi 85', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
GO
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'KHOI 03                  ', N'Khởi 40', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'KHOI 04                  ', N'Khởi 9 A', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'KHOI 05                  ', N'Khởi 12A', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'KHOI 07                  ', N'Khởi 25A', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'KHOI 08                  ', N'Khới 9A- LS', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'KHOI 17                  ', N'khởi động từ MC-9B AC220', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'KHOIM 01                 ', N'Khối mở rộng FX2N-48ER-ES/UL', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'KHOIM 02                 ', N'Khối mở rông FX2N-16EX-ES/UL', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'KHOIM03                  ', N'Khối mở rộng FX2N-8EX-ES/UL', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'KHOP 01                  ', N'Khớp đen H1', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'KHOP 02                  ', N'Khớp đen H2', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'KHOP 03                  ', N'Khớp đen H3', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'KHOP 04                  ', N'Khớp đen H4', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'KHOP 05                  ', N'Khớp đen H7', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'KHOP 06                  ', N'Khớp đen HJ10', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'KHOP 07                  ', N'Khớp mạ H1', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'KHOP 08                  ', N'Khớp mạ H2', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'KHOP 09                  ', N'Khớp mạ H3', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'KHOP 10                  ', N'Khớp mạ H4', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'KHOP 11                  ', N'Khớp mạ H7', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'KHOP 13                  ', N'Khớp đen HJ13', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'KHOP 16                  ', N'Khớp đen H14 mỏ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'KHOP 22                  ', N'Khớp HJ4 mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'KHOP 23                  ', N'Khớp HJ1 mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'KHOP 24                  ', N'Khớp HJ2 mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'KHOP 28                  ', N'Khớp HJ7 đen', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'KHOP 29                  ', N'Khớp HJ6 đen', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'KHOP 31                  ', N'khớp HJ13 mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'KHOP 32                  ', N'Khớp nối FJCF18', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'KHOPNHOM01               ', N'Khớp nhôm AH1', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'KHOPNHOM02               ', N'Khớp nhôm AH2', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'KHOPNHOM03               ', N'Khớp nhôm AH 5', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'KHOPNOI 007              ', N'Khớp nối Bowex 32', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'KHOPNOI 008              ', N'Khớp nối Bowex 42', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'KHOPNOI 01               ', N'Khớp Couplings-CPDT25-6-8', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'KHOPNOI 02               ', N'Khớp bóng ( khung đầu que) F-M08125U', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'LOC 01                   ', N'Lọc AC 2010-02', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'LODONG01                 ', N'Lô 21/10 nhiệt', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'LODONG02                 ', N'Lơ đồng 1/4 -27', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'LODONG03                 ', N'Lơ đồng 1/2', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'LOXO 01                  ', N'Lò xo T12x35', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'LOXO 02                  ', N'Lò xo p15x40', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'LOXO 03                  ', N'Lò xo kéo', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'LOXO 09                  ', N'Lò xo P8', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'LOXO 10                  ', N'lò xo 12x50', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'LOXO 12                  ', N'Lò xo nén P12x40mm', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'LOXO 15                  ', N'lò xo cứng 10x300mm', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'LOXO 16                  ', N'lò xo trục 15x35', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'LOXO 18                  ', N'Lò xo p25x300', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'LOXO 20                  ', N'Lò xo P25x200x2', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'LOXO 21                  ', N'Loxo 10x200 inox', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'LOXO 22                  ', N'Loxo nén p20x70', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'LOXO 23                  ', N'Lò xo P30', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'LOXO 24                  ', N'Lò xo p16x300', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'LOXO 25                  ', N'Lò xo bằng thép UF3 -10', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'LOXO04                   ', N'Lò xo P12x35', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'LUOI 01                  ', N'Lưới tháp hàn -md', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'LUOILOC003               ', N'Lọc quạt điện RSHN-2006, lọc nhiễu', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'LUOILOC004               ', N'Lưới lọc FB9803 Leipole', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'LUOIVUONG 001            ', N'Lưới vuông 40x40', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'MBLN25BE                 ', N'Bộ Điều Khiển MBLN25BE 200V', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'MH010320001              ', N'Bản vẽ số 12', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'MISUMI021018001          ', N'Bạc lót JBA8-8', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'MISUMI021018002          ', N'Then 6-25 KEG6-25', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'MISUMI091018001          ', N'Tun240L075 belt JPN', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'MISUMI230418001          ', N'High torque timing Pullye HTPT24S5M250-A-N20', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'MISUMI230418002          ', N'High torque timing Pullye HTPT48S5M250-A-N22', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'MNT010318001             ', N'Cốc bi 38x35x12 - YHB3812-1.5', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'MNT010318002             ', N'Cốc bi 42x39x12 - YHB4212-1.5', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'MNT010318003             ', N'Cốc bi 50x46x12 - YHB5012-2.0', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'MNT300418001             ', N'Cốc bi 50x47x12-YHB5012-1.5', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'MNT300418002             ', N'Cốc bi 60x57x12 - YHB6012-1.5', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'MNT300418003             ', N'Cốc bi 60x56x15 - YHB6015-2.0', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'MOBO 01                  ', N'Mỡ bò', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'MOBO 02                  ', N'Mỡ chịu nhiệt NO3', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'MOCTREO 01               ', N'Móc treo', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'MODUM 01                 ', N'Mô đum 16 ngõ vào QX40', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'MODUM 02                 ', N'Mô đum 1/0 - QY40P', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'MODUN006                 ', N'Mô đun định vị QD75P2N', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'MOTOR001                 ', N'Motor 3 pha Y2 1/2HP 4PMB', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'msm1                     ', N'sản phẩm mới', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'MUCIN 03                 ', N'Mực in LM-IR300B', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'MUCIN 07                 ', N'ống lồng LM-TU332N (ống lồng 3.2)', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'MUCIN01                  ', N'Hộp mực Canon NPG-59 BK', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'MUDULE 01                ', N'Module S7 -1200 Digital I/0DI 16/DQ 16*24CDC', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'NEPGO                    ', N'Nẹp gỗ trắng', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'NEPGO 01                 ', N'Nẹp gỗ trắng', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'NEPPVC 01                ', N'Nẹp nhựa đen có 2 sọc xanh', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'NGUON 13                 ', N'Nguồn 24V-3A', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'NGUON 15                 ', N'nguồn camera chuyên dụng 12v-2a dùng cho camera', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'NGUON 16                 ', N'Nguồn 24v-5A', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'NHONG 01                 ', N'Nhông B35-16', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'NHONG 02                 ', N'Nhông B35-18', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'NHONG 03                 ', N'Nhông B35-20', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'NHONG 04                 ', N'Nhông B35-22', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'NHONG 05                 ', N'Nhông B35-30', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'NHONG 06                 ', N'Nhông B50-20', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'NHONG 07                 ', N'Nhông B40-28', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'NHONG 08                 ', N'Nhông B35-14', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'NHONG 09                 ', N'Nhông xích xe máy:WDD', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
GO
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'NHONG 10                 ', N'Nhông B40-20', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'NHONG 100                ', N'Nhông B40-20', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'NHONG 101                ', N'Nhông B40-20', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'NHONG 102                ', N'Nhông B40-20', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'NHONG 103                ', N'Nhông B40-20', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'NHONG 104                ', N'Nhông B40-20', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'NHONG 105                ', N'Nhông B40-20', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'NHONG 106                ', N'Nhông B40-20', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'NHONG 107                ', N'Nhông B40-20', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'NHONG 108                ', N'Nhông B40-20', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'NHONG 12                 ', N'Nhông B40-30', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'NHONG 120                ', N'Nhông B40-30', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'NHONG 121                ', N'Nhông B40-30', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'NHONG 122                ', N'Nhông B40-30', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'NHONG 13                 ', N'Nhông B35-12', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'NHONG 14                 ', N'Nhông B35-24', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'NHONG 15                 ', N'Nhông B60-23', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'NHONG 150                ', N'Nhông B60-23', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'NHONG 16                 ', N'Nhông B35-15', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'NHONG 17                 ', N'Nhông B60-25', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'NHONG 18                 ', N'Nhông B35-36', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'NHONG 19                 ', N'Nhông đôi B40-Z14', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'NHONG 20                 ', N'Nhông B40-11', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'NHONG 21                 ', N'Nhông B40-22', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'NHONG 22                 ', N'Nhông B40-12', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'NHONG 23                 ', N'Nhông B40-14', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'NHONG 24                 ', N'Nhông B40-19', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'NHONG 26                 ', N'Nhông đôi B40-12', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'NHONG 27                 ', N'Nhông B60-18', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'NHONG 28                 ', N'Nhông B50-23', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'NHONG 29                 ', N'Nhông B50-15', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'NHONG 30                 ', N'Nhông B40-26', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'NHONG 31                 ', N'Nhông B50-18', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'NHONG 33                 ', N'Nhông B40-24', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'NHONG 34                 ', N'Nhông B50-12', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'NHONG 35                 ', N'Nhông B40-16', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'NHONG 36                 ', N'Nhông B35-10', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'NHONG 37                 ', N'Nhông B35-28', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'NHONG 40                 ', N'nhông chủ động b25-20r', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'NHONG 43                 ', N'Nhông B60-17', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'NHONG 44                 ', N'Nhông B60-22', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'NHONG 45                 ', N'nhông B40-15', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'NHONG 46                 ', N'nhông B40-17', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'NHONG 48                 ', N'Nhông B35-17', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'NHONG 49                 ', N'Nhông B50-17', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'NHONG 51                 ', N'NHông B35-19', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'NHONG 52                 ', N'Nhông công nghiệp C2052-11TB', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'NHONG 57                 ', N'Nhông B80-17', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'NHONG 58                 ', N'Nhông B60-15', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'NHONG 60                 ', N'Nhông cho xích 1 tai C2080H', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'NHONG 64                 ', N'Nhông B35-11', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'NHONG 65                 ', N'Nhông B35-23', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'NHONG 67                 ', N'Nhông B35-21', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'NHONG 70                 ', N'Nhông B40-21', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'NHONG 71                 ', N'Nhông B60-19', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'NHONG 72                 ', N'Nhông B60-21', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'NHONG 77                 ', N'Nhông B40-15 inox 304', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'NHONG 78                 ', N'Nhông B40-17 inox 304', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'NHONG 81                 ', N'Nhông B40-25', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'NHONG 83                 ', N'Nhông B35 -13 răng', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'NHONG 85                 ', N'Nhông B50-11', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'NHONG 87                 ', N'Nhông B40-19', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'NHONG 90                 ', N'Nhông B60-27', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'NHONG 92                 ', N'Nhông B40-34', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'NHONG 95                 ', N'Nhông B35-27', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'NHONG 99                 ', N'nhông inox 50 có gù 1 bên 11 răng', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'NHONG001                 ', N'Nhông công nghiệp 50-2-15TB', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'NHONG102                 ', N'Nhông đôi 60-15r', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'NHONG103                 ', N'Nhông đôi 60-19r', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'NHONG106                 ', N'Nhông 50-19 răng', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'NHONG108                 ', N'Nhông B40-21', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'NILONGBOC 05             ', N'Nilong bọc 3kg', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'NILONGBOC 07             ', N'Nilong bọc 2.4kg', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'NODINH01                 ', N'Nở đinh M10 x80', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'NODINH02                 ', N'Nở đinh M 12 x 100', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'NODONG001                ', N'Nở đóng M10 EG', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'NOIONG 01                ', N'Nối ống p21', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'NUM 01                   ', N'Núm chiết áp', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'OP001                    ', N'Ốp bảo vệ H300', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'P0M09                    ', N'Pom Nhựa trắng phi 70', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'PHA-M10-M                ', N'phẳng 10 mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 3600, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'PHA-M10-S1               ', N'phẳng 10 inox', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 3000, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'PHA-M10-S4               ', N'Phẳng M10 Inox 304', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 2500, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'PHA-M12-M                ', N'phẳng 12 mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 5400, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'PHA-M12-S1               ', N'Phẳng 12 inox', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'PHA-M14-M                ', N'phẳng 14 mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 1600, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'PHA-M16-M                ', N'phẳng 16 mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 2800, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'PHA-M20-M                ', N'Phẳng 20 mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'PHA-M4-M                 ', N'Phẳng 4 mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 3300, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'PHA-M5-M                 ', N'Phẳng M5 mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 3800, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'PHA-M5-S1                ', N'Phẳng 5 inox', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'PHA-M6-M                 ', N'Phẳng 6 mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 7200, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'PHA-M6-S1                ', N'phẳng 6 inox', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 2000, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'PHA-M8-M                 ', N'phẳng 8 mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 2400, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'PHA-M8-S1                ', N'phẳng 8 inox', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 275, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'PHICH 05                 ', N'Phích CN đực + cái', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'PHIPGO 01                ', N'Phíp gỗ D25', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'PHOI06                   ', N'phôi các loại', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'PHOI07                   ', N'phôi sắt kt 20x24x185mm', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'PHOI08                   ', N'Phôi thép 80x20', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
GO
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'PHOI09                   ', N'Phôi thép 80x24', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'PHOI10                   ', N'Phôi nhôm 30x83x63', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'PHOI11                   ', N'Phôi sắt 60x16', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'PHOT 01                  ', N'Phơt lò xo chắn bụi 20/42/10', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'PINDIEUKHIEN 04          ', N'Pin 9v', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'PLC 004                  ', N'FP7CPS31ES', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'PLC 005                  ', N'Bộ lập trình FX3G-24MR/ES', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'PLC 006                  ', N'Bộ phần mềm PLC', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'POW-IDE-YW1P-1EQM3R      ', N'Đèn báo màu đỏ 1 EQM3R', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'POW-SCH-XA2EVM3LC        ', N'Đèn báo màu xanh 220VAC, M22(Schneider)', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'POW-SCH-XA2EVM4LC        ', N'Đèn báo màu đỏ 220VAC, M22( Schneider)', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'POW-SCH-XA2EVM5LC        ', N'Đèn báo màu vàng 220VAC, M22(Schneider)', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'PULY 01                  ', N'Puly AT10-Z48', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'PULY 02                  ', N'Puly nhôm 14R', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'PULY 03                  ', N'Puly nhôm 28R', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'PULY 04                  ', N'Puly đai răng -HTPA22S5M150-A-N12', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'PULY 05                  ', N'Puly đai răng HTPA22S5M150-A-N16', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'PULY 06                  ', N'Puly D50 + nắp', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'PULY 07                  ', N'Puly răng S5M rộng 20-25 răng', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'PULY 08                  ', N'Khối Puly truyền động TTPA20T5250-A-N15', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'PULY 09                  ', N'Khối Puly truyền động AHTFW20-T5250-8', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'PULY 20                  ', N'Puly TAAL-18-075-N21', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'PULY 21                  ', N'Puly đai răng TSAS5M-44-250-N24', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'PULY 22                  ', N'Puly đai răng TSAS5M-50-250-N32', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'PULY 23                  ', N'Puly 76.2', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'PULY 24                  ', N'Puly 152.2', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'PUTIL 001                ', N'chất tẩy mối hàn putil tốt', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'QP240417001              ', N'TX-302 đế đỡ chân', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'QP240417002              ', N'TX-605 chân kích cao su to +nhỏ (98nhỏ/41to)', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'QP240417003              ', N'TX-102 thanh dẫn hướng thành chắn', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'QP240417004              ', N'W23  thanh đỡ xích w54mm', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'QP240417005              ', N'W30 thanh đỡ xích w25mm', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'QP240417006              ', N'812 bánh 21r 1 rãnh', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'QP240417008              ', N'820 bánh 21r 2 rãnh', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'QP240417009              ', N'820-K750 xích nhựa 190.5', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'QP240417011              ', N'G14 thành chắn', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'QP240417012              ', N'G16A thành chắn', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'ROLE 01                  ', N'Rơ le thời gian DH48S-S 24VDC', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'ROLE 02                  ', N'Role trung gian RJ2S-CL-A24+ đế SJ2S-05B', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'ROLE 03                  ', N'Role không có đế', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'ROLE 04                  ', N'Role 24VDC 14 chân dẹt', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'ROLE 05                  ', N'Rowle trung gian 24v + đế- Schneider', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'ROLE 06                  ', N'Role trung gian Idee 220v', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'ROLE 07                  ', N'Rơ le nhiệt 9-13A', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'ROLE 08                  ', N'Rơ le 1083276', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'ROLE 09                  ', N'Role HSR -2D402', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'ROLE 10                  ', N'role trung gian MY4N-GS DC24BY OMZ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'ROLE 11                  ', N'Rơ le trung gian 14VDC', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'ROLE 14                  ', N'Role RY4S-UL-DC24', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'ROLE 15                  ', N'Role 5V-5 chân', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'ROLE 16                  ', N'Role 12VDC 8 chân + đế', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'ROLE 18                  ', N'role trung gian MY2N-DC24 BY OMZ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'ROLE 19                  ', N'role 8 chân 220v', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'ROLE 20                  ', N'role trung gian MY4N 24VDC +Đế omron', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'ROLE 29                  ', N'Role 8 chân-24v, Idec+đế', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'ROLE 30                  ', N'Rơ le nhiệt NR2-25G-9A', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'ROLE 31                  ', N'Rơ le nhiệt MT32(4-6A)', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'ROLE 32                  ', N'Rơ le nhiệt 7-10A (NXR-25-10)', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'ROLE 33                  ', N'Rơ le trung gian my2n-gsac220/240 BY OMZ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'ROLE 34                  ', N'Rơ le trung gian RXM4LB2P7', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'ROLE 35                  ', N'Đế rơ le RXZE1M4C', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'RULER 01                 ', N'Ruler trắng', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'RULER 02                 ', N'Ruler đen', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'RULO 01                  ', N'Rulo D271x900', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'SCX-33NO                 ', N'Cái này là cái gì đó chưa biết', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'SMC 007                  ', N'Bộ lọc AF30-03C-A', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'SMC 012                  ', N'van định hướng SY5220-5LZD-C8', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'SMC250118009             ', N'Đầu nối khi KQ2T1210A', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'SMC250118024             ', N'Bộ giảm thanh AN10-01', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'SMC250118032             ', N'xylanh khí CDM2B32-300Z', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'SOI001                   ', N'Sỏi đá', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'SOLUTION010818001        ', N'bích nhôm tăng chỉnh', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'SON 01                   ', N'Sơn A242', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'SON 02                   ', N'Sơn A226 ( mầu cam)', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'SON 03                   ', N'Sơn xịt A213', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'SON 04                   ', N'Sơn mạ kẽm lạnh 400(4L)', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'SON 06                   ', N'Sơn A217', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'SON 07                   ', N'Sơn A300', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'SON 15                   ', N'Sơn đen A210', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'SON 20                   ', N'Sơn A200', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'SON 22                   ', N'sơn A203', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'SON 23                   ', N'Sơn 241', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'SON 24                   ', N'Sơn bột', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'SON 25                   ', N'Sơn xịt A218', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'SONCHONGGI               ', N'Sơn đại bàng', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'SONXIT06                 ', N'Sơn xịt A 400', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'SV004IG5A-2              ', N'Biến Tân SV004IG5A-2', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'TE 01                    ', N'Tê 16', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'TE 03                    ', N'Tê 20', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'TE 22                    ', N'Tê 32RT', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'TE 25                    ', N'Tê thu 110/90 tp', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'TE 27                    ', N'Tê nhựa 110', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'TE 28                    ', N'Tê+Thu 160/90', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'TE 29                    ', N'Tê thu 200/90', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'TE 30                    ', N'Tê thu 90/75 (côn thu)', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'THEN 01                  ', N'Then 5', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'THEN 02                  ', N'Then 6', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'THEN 03                  ', N'Then 8', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'THEN 04                  ', N'Then 10', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'THEN 06                  ', N'THEN 14X11', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
GO
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'THEN 07                  ', N'Then 4', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'THEN 08                  ', N'then 12', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'THEPGC01                 ', N'Thép F70x101', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'THEPGC02                 ', N'Thép F90x145', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'THEPGC03                 ', N'Thép F155/71x36', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'THEPGC04                 ', N'Thép F155/51x45', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'THEPGIO01                ', N'Thép gió tròn D8x200', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'THUYLUC 01               ', N'Bộ nguồn thủy lực 1.5kw', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'TP1876                   ', N'Dẫn hướng', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'TRI 01                   ', N'Trí 8x25', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'TRI 03                   ', N'Trí 5', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'TRI 05                   ', N'Trí 6 inox', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'TRI 08                   ', N'trí đen 8x10', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'TRI 09                   ', N'trí đen 8x15', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'TRI 10                   ', N'Trí 6x10', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'TRI 11                   ', N'Trí 6x15', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'TRI 12                   ', N'Trí 10x10', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'TRUOTBI003               ', N'Trượt bi 40M8', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'TRUYENCL003              ', N'Thanh truyền con lăn 40 màu trắng', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'TRUYENCL004              ', N'Thanh truyền con lăn 60 màu đen', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'TRUYENCL005              ', N'Thanh truyền con lăn 60 màu trắng', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'TRUYENCL006              ', N'Thanh truyền con lăn màu trắng', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'TT090520001              ', N'Chi tiết 1 - Khung vai: 1000x3280x120mm', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'TT090520002              ', N'Chi tiết 4 - Vai : 1000x3280x120mm', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'TTC001                   ', N'Thép tăng chỉnh', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'TUIBONG 02               ', N'túi bóng kính 7', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'TUIBONG 03               ', N'Túi bóng kinh số 12', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'TUIBONG 04               ', N'Túi bóng kính 8', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'TUIBONG 05               ', N'Túi bóng kính số 3', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'TUIBONG 06               ', N'Túi bóng kính số 4', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'UDUC 02                  ', N'U đúc 65x3.5', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'UDUC 03                  ', N'U đúc 100x50x4.5', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'VCTECH230318001          ', N'Thanh tăng chỉnh', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'VE-M8-S1                 ', N'Vênh inox M8', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'VEH-M10                  ', N'vênh 10', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'VEH-M10-M                ', N'Vênh M10 mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 1700, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'VEH-M10-S1               ', N'vênh 10 inox', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 2200, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'VEH-M10-S4               ', N'Vênh M10 Inox 304', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'VEH-M12                  ', N'vênh 12', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'VEH-M12-M                ', N'Vênh 12 mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 1700, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'VEH-M12-S1               ', N'vênh 12 inox', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 180, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'VEH-M14-M                ', N'Vênh M14 mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 1400, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'VEH-M16-M                ', N'Vênh M16 mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 2100, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'VEH-M4-M                 ', N'Vênh 4 mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 3500, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'VEH-M5-M                 ', N'Vênh M5 mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 6000, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'VEH-M5-S1                ', N'vênh 5 inox', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 3000, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'VEH-M6-M                 ', N'Vênh M6 mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 2400, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'VEH-M6-S1                ', N'Vênh inox M6', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 5700, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'VEH-M6-S4                ', N'Vênh 6 inox 304', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 5000, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'VEH-M8-M                 ', N'Vênh M8 mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 2000, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'VEH-M8-S1                ', N'Vênh 8 inox', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 3000, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'VEH-M8-S4                ', N'Vênh 8 inox 304', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'VEN-M10-M                ', N'vênh 10 mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'VEN-M12-S1               ', N'vênh 12 INOX', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'VEN-M14-M                ', N'Vênh 14 mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'VEN-M16-M                ', N'vênh 16 mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'VEN-M6-M                 ', N'Vênh 6 mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'VEN-M8-M                 ', N'vênh 8 mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'VEN-M8-S1                ', N'Vênh inox M8', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'VIINOX 06                ', N'Vỉ caro', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'VIT-DB-15-M              ', N'Vít tự khoan 15mm đầu bằng mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'VIT-DB-25-S1             ', N'Vít tự khoan 25mm đầu bằng inox', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'VIT-DB-M1,5-M            ', N'Vít tự khoan đầu bằng M1,5 mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'VIT-DB-M20-M             ', N'Vít tự khoan đầu bằng 20 mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'VIT-DB-M3x15-M           ', N'Viits tự khoan M3x15 đầu bằng mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'VIT-DB-M4x40-M           ', N'Vít khoan M4x40 mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'VIT-DC-1-M               ', N'Vít tự khoan 1mm đầu cầu mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'VIT-DC-40-M              ', N'Vít tự khoan đầu cầu 40mm mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'VIT-DC-M3x20-M           ', N'Vít tự khoan đầu cầu M3x20 mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'VIT-DD-25-S1             ', N'Vít tự khoan đầu dù 25 inox', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
INSERT [dbo].[DSSANPHAM] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [KhoiLuong], [Cdai], [cRong], [cCao], [DonGia], [SoLuongTon], [QuyDoi]) VALUES (N'VITC-M4x60-M             ', N'Vít cầu M4x60 mạ', N'Bulong', N'xXx', N'Con', 1.2, 1, 0.5, 0.5, 200, 0, NULL)
GO
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-22T13:03:35.880' AS DateTime), N'ECU-M16-M                ', N'Ecu M16 mạ', N'xXx', N'Nhập Hàng', N'Con', 1620, N'R3-1      ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-22T13:03:35.887' AS DateTime), N'VEH-M16-M                ', N'Vênh M16 mạ', N'xXx', N'Nhập Hàng', N'Con', 2100, N'R3-2      ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-22T13:03:35.890' AS DateTime), N'PHA-M16-M                ', N'phẳng 16 mạ', N'xXx', N'Nhập Hàng', N'Con', 2800, N'R3-3      ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-22T13:03:35.893' AS DateTime), N'ECU-M14-M                ', N'Ecu 14 mạ', N'xXx', N'Nhập Hàng', N'Con', 4200, N'R3-4      ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-22T13:03:35.897' AS DateTime), N'ECU-M16-S1               ', N'Ecu M16 inox', N'xXx', N'Nhập Hàng', N'Con', 250, N'R3-5      ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-22T13:03:35.900' AS DateTime), N'ECU-M12-S1               ', N'Ecu 12 inox', N'xXx', N'Nhập Hàng', N'Con', 200, N'R3-6      ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-22T13:03:35.900' AS DateTime), N'VEH-M12-S1               ', N'vênh 12 inox', N'xXx', N'Nhập Hàng', N'Con', 180, N'R3-7      ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-22T13:03:35.903' AS DateTime), N'VEH-M14-M                ', N'Vênh M14 mạ', N'xXx', N'Nhập Hàng', N'Con', 1400, N'R3-8      ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-22T13:03:35.907' AS DateTime), N'VEH-M12-M                ', N'Vênh 12 mạ', N'xXx', N'Nhập Hàng', N'Con', 1700, N'R3-9      ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-22T13:03:35.910' AS DateTime), N'PHA-M12-M                ', N'phẳng 12 mạ', N'xXx', N'Nhập Hàng', N'Con', 5400, N'R3-10     ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-22T13:03:35.913' AS DateTime), N'ECU-M12-M                ', N'Ecu 12 mạ', N'xXx', N'Nhập Hàng', N'Con', 1500, N'R3-11     ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-22T14:36:26.070' AS DateTime), N'PHA-M14-M                ', N'phẳng 14 mạ', N'xXx', N'Nhập Hàng', N'Con', 1600, N'R5-1      ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-22T14:36:26.080' AS DateTime), N'ECU-M20-M                ', N'Ecu M20 mạ', N'xXx', N'Nhập Hàng', N'Con', 190, N'R5-2      ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-22T14:36:26.080' AS DateTime), N'CCH-L-M6-M               ', N'Con chạy lá M6 mạ', N'xXx', N'Nhập Hàng', N'Con', 6000, N'R5-3      ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-22T14:36:26.083' AS DateTime), N'ECU-M6-M                 ', N'Ecu 6 mạ', N'xXx', N'Nhập Hàng', N'Con', 6600, N'R5-4      ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-22T14:36:26.087' AS DateTime), N'PHA-M6-M                 ', N'Phẳng 6 mạ', N'xXx', N'Nhập Hàng', N'Con', 7200, N'R5-5      ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-22T14:36:26.090' AS DateTime), N'BUL-TR- M6X20-M(C)       ', N'Bulong M6x20 LGT trụ mạ', N'xXx', N'Nhập Hàng', N'Con', 6400, N'R5-6      ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-22T14:36:26.093' AS DateTime), N'BUL-TR-M6X20-S1(C)       ', N'Bulong M6x20 LG trụ inox', N'xXx', N'Nhập Hàng', N'Con', 2000, N'R5-7      ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-22T14:36:26.097' AS DateTime), N'VEH-M6-S4                ', N'Vênh 6 inox 304', N'xXx', N'Nhập Hàng', N'Con', 5000, N'R5-8      ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-22T14:36:26.100' AS DateTime), N'VEH-M6-M                 ', N'Vênh M6 mạ', N'xXx', N'Nhập Hàng', N'Con', 2400, N'R5-9      ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-22T14:36:26.100' AS DateTime), N'VEH-M6-S1                ', N'Vênh inox M6', N'xXx', N'Nhập Hàng', N'Con', 5700, N'R5-10     ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-22T14:36:26.103' AS DateTime), N'VEH-M4-M                 ', N'Vênh 4 mạ', N'xXx', N'Nhập Hàng', N'Con', 3500, N'R5-11     ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-22T14:36:26.107' AS DateTime), N'VEH-M5-M                 ', N'Vênh M5 mạ', N'xXx', N'Nhập Hàng', N'Con', 6000, N'R5-12     ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-22T14:36:26.110' AS DateTime), N'VEH-M5-S1                ', N'vênh 5 inox', N'xXx', N'Nhập Hàng', N'Con', 3000, N'R5-13     ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-22T14:36:26.110' AS DateTime), N'PHA-M6-S1                ', N'phẳng 6 inox', N'xXx', N'Nhập Hàng', N'Con', 2000, N'R5-14     ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-22T14:36:26.113' AS DateTime), N'PHA-M5-M                 ', N'Phẳng M5 mạ', N'xXx', N'Nhập Hàng', N'Con', 3800, N'R5-15     ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-22T14:36:26.117' AS DateTime), N'PHA-M4-M                 ', N'Phẳng 4 mạ', N'xXx', N'Nhập Hàng', N'Con', 3300, N'R5-16     ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-22T14:36:26.120' AS DateTime), N'ECU-M5-M                 ', N'Ecu 5 mạ', N'xXx', N'Nhập Hàng', N'Con', 250, N'R5-17     ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-22T14:36:26.123' AS DateTime), N'ECUH-M6- M               ', N'Ecu M6 tự hãm mạ', N'xXx', N'Nhập Hàng', N'Con', 150, N'R5-18     ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-22T14:36:26.123' AS DateTime), N'ECU-M6-S1                ', N'Ecu 6 inox', N'xXx', N'Nhập Hàng', N'Con', 90, N'R5-19     ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-22T15:25:36.023' AS DateTime), N'BUL-CA-M8x60-M(C)        ', N'Bulong M8x60 LGC cầu mạ', N'xXx', N'Nhập Hàng', N'Con', 750, N'R7-1      ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-22T15:25:36.030' AS DateTime), N'BUL-CO-M8x40-M(C)        ', N'Bulong M8x40 LGC côn mạ', N'xXx', N'Nhập Hàng', N'Con', 360, N'R7-2      ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-22T15:25:36.030' AS DateTime), N'BUL-CO-M8x30-M(C)        ', N'Bulong M8x30 LGC côn mạ', N'xXx', N'Nhập Hàng', N'Con', 590, N'R7-3      ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-22T15:25:36.033' AS DateTime), N'BUL-CA-M8x15-M(C)        ', N'Bulong M8x15 LGC cầu mạ', N'xXx', N'Nhập Hàng', N'Con', 720, N'R7-4      ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-22T15:25:36.037' AS DateTime), N'BUL-TR-M8x40-M(C)        ', N'Bulong M8x40 LGC trụ mạ', N'xXx', N'Nhập Hàng', N'Con', 850, N'R7-5      ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-22T15:25:36.040' AS DateTime), N'BUL-TR-M8X60-S1          ', N'Bulong M8x60 LG Trụ inox', N'xXx', N'Nhập Hàng', N'Con', 280, N'R7-6      ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-22T15:25:36.040' AS DateTime), N'BUL-LGN-M8x10-M(C)       ', N'Bulong M8x10 LGN mạ', N'xXx', N'Nhập Hàng', N'Con', 840, N'R7-7      ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-22T15:25:36.043' AS DateTime), N'BUL-TR-M8x15-S1          ', N'Bulong M8x15 trụ inox', N'xXx', N'Nhập Hàng', N'Con', 600, N'R7-8      ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-22T15:25:36.047' AS DateTime), N'BUL-CO-M8x25-S1(C)       ', N'Bulong M8x25 LGC côn inox', N'xXx', N'Nhập Hàng', N'Con', 45, N'R7-9      ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-22T15:25:36.050' AS DateTime), N'BUL-CO-M8x35-M(C)        ', N'Bulong M8x35 côn mạ', N'xXx', N'Nhập Hàng', N'Con', 320, N'R7-10     ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-22T15:25:36.050' AS DateTime), N'BUL-CO-M8x20-M(C)        ', N'Bulong M8x20 LGC côn mạ', N'xXx', N'Nhập Hàng', N'Con', 980, N'R7-11     ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-22T15:25:36.053' AS DateTime), N'BUL-CA-M8x30-M(C)        ', N'Bulong M8x30 LGC cầu mạ', N'xXx', N'Nhập Hàng', N'Con', 80, N'R7-12     ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-22T15:25:36.057' AS DateTime), N'BUL-CA-M8x20-M(C)        ', N'Bulong M8x20 LGC cầu mạ', N'xXx', N'Nhập Hàng', N'Con', 120, N'R7-13     ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-22T15:25:36.060' AS DateTime), N'BUL-TR-M8X20-S           ', N'Bulong M8x20 LG trụ  inox', N'xXx', N'Nhập Hàng', N'Con', 600, N'R7-14     ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-22T15:25:36.060' AS DateTime), N'BUL-TR-M8x50-S1(C)       ', N'Bulong M8x50 LGC trụ inox', N'xXx', N'Nhập Hàng', N'Con', 300, N'R7-15     ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-22T15:25:36.063' AS DateTime), N'BUL-LGN-M8x25-S1         ', N'Bulong M8x25 LGN inox', N'xXx', N'Nhập Hàng', N'Con', 80, N'R7-16     ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-22T15:25:36.067' AS DateTime), N'BUL-CA-M8x60-S1(C)       ', N'Bulong M8x60 LGC cầu inox', N'xXx', N'Nhập Hàng', N'Con', 250, N'R7-17     ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-22T15:25:36.070' AS DateTime), N'BUL-LGN- M8x15-S1(C)     ', N'Bulong M8x15 LGN inox', N'xXx', N'Nhập Hàng', N'Con', 80, N'R7-18     ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-22T15:25:36.073' AS DateTime), N'BUL-LGN-M8x30-S1(C)      ', N'Bulong M8x30 LGN inox', N'xXx', N'Nhập Hàng', N'Con', 84, N'R7-19     ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-22T15:25:36.073' AS DateTime), N'BUL-CA-M8x40-M(C)        ', N'Bulong M8x40 LGC cầu mạ', N'xXx', N'Nhập Hàng', N'Con', 320, N'R7-20     ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-22T16:20:18.713' AS DateTime), N'BUL-TR-M8x100-M(C)       ', N'Bulong  M8x100 LGC trụ mạ', N'xXx', N'Nhập Hàng', N'Con', 810, N'R11-1     ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-22T16:20:18.720' AS DateTime), N'BUL-LGN-M10X110-M(C)     ', N'Bulong M10x110 LGN mạ', N'xXx', N'Nhập Hàng', N'Con', 90, N'R11-2     ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-22T10:51:22.950' AS DateTime), N'PHA-M10-S4               ', N'Phẳng M10 Inox 304', N'xXx', N'Nhập Hàng', N'Con', 2500, N'R1-7      ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-22T10:51:22.957' AS DateTime), N'VEH-M10-S1               ', N'vênh 10 inox', N'xXx', N'Nhập Hàng', N'Con', 2200, N'R1-8      ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-22T10:51:22.960' AS DateTime), N'PHA-M10-S1               ', N'phẳng 10 inox', N'xXx', N'Nhập Hàng', N'Con', 3000, N'R1-9      ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-22T10:51:22.963' AS DateTime), N'VEH-M8-S1                ', N'Vênh 8 inox', N'xXx', N'Nhập Hàng', N'Con', 3000, N'R1-10     ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-22T10:51:22.967' AS DateTime), N'ECU-M8-S1                ', N'Ecu 8 inox', N'xXx', N'Nhập Hàng', N'Con', 1100, N'R1-11     ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-22T10:51:22.970' AS DateTime), N'PHA-M8-S1                ', N'phẳng 8 inox', N'xXx', N'Nhập Hàng', N'Con', 275, N'R1-12     ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-22T10:51:22.970' AS DateTime), N'ECU-M8-S4                ', N'ECU M8 Inox 304', N'xXx', N'Nhập Hàng', N'Con', 80, N'R1-13     ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-22T10:51:22.973' AS DateTime), N'CCH-V-M8-M               ', N'Con Chạy Vuông M8', N'xXx', N'Nhập Hàng', N'Con', 1200, N'R1-14     ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-22T10:51:22.977' AS DateTime), N'ECUH-M8-M                ', N'Ecu M8 keo tán nhựa', N'xXx', N'Nhập Hàng', N'Con', 200, N'R1-15     ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-22T10:51:22.980' AS DateTime), N'VEH-M8-M                 ', N'Vênh M8 mạ', N'xXx', N'Nhập Hàng', N'Con', 2000, N'R1-16     ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-22T16:20:18.723' AS DateTime), N'BUL-LGN-M8x30-M(C)       ', N'Bulong M8x30 LGN mạ', N'xXx', N'Nhập Hàng', N'Con', 140, N'R11-3     ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-22T16:20:18.727' AS DateTime), N'BUL-TR-M8x35-M(C)        ', N'Bulong M8x35 LGC trụ mạ', N'xXx', N'Nhập Hàng', N'Con', 470, N'R11-4     ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-22T16:20:18.733' AS DateTime), N'BUL-TR-M8x50-M(C)        ', N'Bulong M8x50 LGC trụ mạ', N'xXx', N'Nhập Hàng', N'Con', 420, N'R11-6     ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-22T16:20:18.737' AS DateTime), N'BUL-LGN-M10x25-M(C)      ', N'Bulong M10x25 LGN mạ', N'xXx', N'Nhập Hàng', N'Con', 800, N'R11-7     ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-22T16:20:18.737' AS DateTime), N'BUL-LGN-M8x15-M(C)       ', N'Bulong M8x15 LGN mạ', N'xXx', N'Nhập Hàng', N'Con', 1200, N'R11-8     ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-22T16:20:18.740' AS DateTime), N'BUL-TR-M8x45-S1          ', N'Bulong M8x45 LGC trụ Inox', N'xXx', N'Nhập Hàng', N'Con', 60, N'R11-9     ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-22T16:20:18.743' AS DateTime), N'BUL-CO-M8x25-M(C)        ', N'Bulong M8x25 LGC côn mạ', N'xXx', N'Nhập Hàng', N'Con', 280, N'R11-10    ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-22T16:20:18.747' AS DateTime), N'BUL-LGN-M8x100-M(C)      ', N'Bulong M8x100 LGN mạ', N'xXx', N'Nhập Hàng', N'Con', 60, N'R11-11    ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-22T16:20:18.750' AS DateTime), N'BUL-LGN-M8X12-S1         ', N'bulong M8x12 lgn inox', N'xXx', N'Nhập Hàng', N'Con', 220, N'R11-12    ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-22T16:20:18.753' AS DateTime), N'BUL-CO-M8x15-M(C)        ', N'Bulong M8x15 LGC côn mạ', N'xXx', N'Nhập Hàng', N'Con', 480, N'R11-13    ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-22T16:20:18.753' AS DateTime), N'BUL-CA-M8x12-M(C)        ', N'Bulong M8x12 LGC cầu mạ', N'xXx', N'Nhập Hàng', N'Con', 1050, N'R11-14    ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-22T16:20:18.757' AS DateTime), N'BUL-CO-M8x35-S1          ', N'Bulong M8x12 LGC cầu inox', N'xXx', N'Nhập Hàng', N'Con', 19, N'R11-15    ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-22T16:20:18.760' AS DateTime), N'BUL-LGN-M8x40-S1(C)      ', N'Bulong m8x40 LGN inox', N'xXx', N'Nhập Hàng', N'Con', 150, N'R11-16    ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-22T16:20:18.763' AS DateTime), N'BUL-CA-M8x15-S1          ', N'Bulong M8x15 LGC cầu inox', N'xXx', N'Nhập Hàng', N'Con', 270, N'R11-17    ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-22T16:20:18.767' AS DateTime), N'BUL-TR-M8x30-S1          ', N'Bulong M8x30 LGC trụ inox', N'xXx', N'Nhập Hàng', N'Con', 70, N'R11-18    ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-22T16:20:18.770' AS DateTime), N'BUL-TR-M8X40-S1          ', N'Bulong M8x40 LG trụ inox', N'xXx', N'Nhập Hàng', N'Con', 70, N'R11-19    ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-22T16:20:18.770' AS DateTime), N'BUL-LGN-M8X35-M          ', N'Bulong M8x35 LGN mạ', N'xXx', N'Nhập Hàng', N'Con', 150, N'R11-20    ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-22T16:20:18.773' AS DateTime), N'BUL-CO-M8X50-M           ', N'Bulong M8x35 LG côn mạ', N'xXx', N'Nhập Hàng', N'Con', 150, N'R11-21    ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-22T16:45:15.447' AS DateTime), N'BUL-TR-M6x30-M(C)        ', N'Bulong M6x30 LGC trụ mạ', N'xXx', N'Nhập Hàng', N'Con', 3000, N'R13-1     ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-22T16:45:15.450' AS DateTime), N'BUL-TR-M6x35-M(C)        ', N'Bulong M6x35 LGC trụ mạ', N'xXx', N'Nhập Hàng', N'Con', 2200, N'R13-2     ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-22T16:45:15.453' AS DateTime), N'BUL-LGN-M6x25-S1(C)      ', N'Bulong M6x25 LGN inox', N'xXx', N'Nhập Hàng', N'Con', 1350, N'R13-3     ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-22T16:45:15.457' AS DateTime), N'BUL-CA-M6x12-M(C)        ', N'Bulong M6x12 LG cầu mạ', N'xXx', N'Nhập Hàng', N'Con', 3300, N'R13-4     ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-22T16:45:15.460' AS DateTime), N'BUL-CA-M6x50-M(C)        ', N'Bulong M6x50 LG cầu mạ', N'xXx', N'Nhập Hàng', N'Con', 700, N'R13-5     ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-22T16:45:15.467' AS DateTime), N'BUL-CO-M6X25-M           ', N'bulong m6x25 lg côn mạ', N'xXx', N'Nhập Hàng', N'Con', 1000, N'R13-7     ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-22T16:45:15.470' AS DateTime), N'BUL-LGN-M6X10-M          ', N'Bulong m6x10 LGN mạ', N'xXx', N'Nhập Hàng', N'Con', 500, N'R13-8     ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-22T16:45:15.473' AS DateTime), N'BUL-LGN-M8X45-M          ', N'Bulong m8x45 LGN mạ', N'xXx', N'Nhập Hàng', N'Con', 250, N'R13-9     ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-22T16:45:15.477' AS DateTime), N'BUL-LGN-M8x12-M(C)       ', N'Bulong m8x12 LGN mạ', N'xXx', N'Nhập Hàng', N'Con', 410, N'R13-10    ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-22T16:45:15.480' AS DateTime), N'BUL-TR-M8x100-M(C)       ', N'Bulong  M8x100 LGC trụ mạ', N'xXx', N'Nhập Hàng', N'Con', 32, N'R13-11    ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-22T16:45:15.483' AS DateTime), N'BUL-TR-M8X70-S1(C)       ', N'Bulong m8x70 LG trụ inox', N'xXx', N'Nhập Hàng', N'Con', 35, N'R13-12    ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-22T16:45:15.487' AS DateTime), N'BUL-LGN-M8x60-M(C)       ', N'Bulong M8x60 LGN mạ', N'xXx', N'Nhập Hàng', N'Con', 65, N'R13-13    ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-22T16:45:15.490' AS DateTime), N'BUL-TR-M8x12-S1(C)       ', N'Bulong M8x12 LGC trụ inox', N'xXx', N'Nhập Hàng', N'Con', 220, N'R13-14    ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-22T16:45:15.493' AS DateTime), N'BUL-CA-M8X20-S1(C)       ', N'Bulong M8x20 chìm cầu inox', N'xXx', N'Nhập Hàng', N'Con', 150, N'R13-15    ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-22T16:45:15.497' AS DateTime), N'BUL-CA-M8X12-S1(C)       ', N'Bulong M8x12 LG cầu inox', N'xXx', N'Nhập Hàng', N'Con', 130, N'R13-16    ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-22T16:45:15.497' AS DateTime), N'BUL-LGN-M10X20-M(C)      ', N'Bulong m10x20 LGN mạ', N'xXx', N'Nhập Hàng', N'Con', 350, N'R13-18    ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-22T16:45:15.500' AS DateTime), N'BUL-TR-M12x50-M(C)       ', N'Bulong M12x50 LGC trụ mạ', N'xXx', N'Nhập Hàng', N'Con', 280, N'R13-6     ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-22T16:45:15.503' AS DateTime), N'BUL-LGN-M8x45-S1(C)      ', N'Bulong M8x45 LGN inox', N'xXx', N'Nhập Hàng', N'Con', 28, N'R13-17    ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T09:57:51.223' AS DateTime), N'BUL-LGN-M12X50-M(C)      ', N'Bulong M12x50 LGN mạ', N'xXx', N'Nhập Hàng', N'Con', 180, N'R15-1     ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T09:57:51.230' AS DateTime), N'BUL-LGN-M12x20-M(C)      ', N'Bulong M12x20 LGN mạ', N'xXx', N'Nhập Hàng', N'Con', 300, N'R15-2     ', N'')
GO
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T09:57:51.233' AS DateTime), N'BUL-CA-M12x25-S1(C)      ', N'Bulong M12x25, LGC inox đàu chỏm cầu', N'xXx', N'Nhập Hàng', N'Con', 450, N'R15-3     ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-22T16:20:18.730' AS DateTime), N'BUL-CA-M8x50-M(C)        ', N'Bulong M8x50 LGC cầu  mạ', N'xXx', N'Nhập Hàng', N'Con', 400, N'R11-5     ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T09:57:51.233' AS DateTime), N'BUL-LGN-M12X80-M(C)      ', N'Bulong M12x80 LGN mạ', N'xXx', N'Nhập Hàng', N'Con', 300, N'R15-4     ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T09:57:51.240' AS DateTime), N'BUL-CA-M12x25-M(C)       ', N'Bulong  M12x25 LGC cầu mạ', N'xXx', N'Nhập Hàng', N'Con', 160, N'R15-5     ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T09:57:51.240' AS DateTime), N'BUL-LGN-M14x50-M(C)      ', N'bulong M14x50 LGN mạ', N'xXx', N'Nhập Hàng', N'Con', 230, N'R15-6     ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T09:57:51.243' AS DateTime), N'BUL-TR-M12x60-S1(C)      ', N'Bulong M12x60 LGC trụ Inox', N'xXx', N'Nhập Hàng', N'Con', 49, N'R15-7     ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T09:57:51.247' AS DateTime), N'BUL-TR-M12x100-S1        ', N'Bulong M12x100 LG trụ inox', N'xXx', N'Nhập Hàng', N'Con', 33, N'R15-8     ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T09:57:51.250' AS DateTime), N'BUL-CA-M12x30-S1         ', N'Bulong M12x30 LGC cầu Inox', N'xXx', N'Nhập Hàng', N'Con', 28, N'R15-9     ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T09:57:51.253' AS DateTime), N'BUL-LGN-M12X80 -S1(C)    ', N'Bulong M12x80 LGN inox', N'xXx', N'Nhập Hàng', N'Con', 120, N'R15-10    ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T09:57:51.257' AS DateTime), N'BUL-LGN-M12X60-M(C)      ', N'Bulong M12x60 LGN mạ', N'xXx', N'Nhập Hàng', N'Con', 10, N'R15-11    ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T09:57:51.260' AS DateTime), N'BUL-LGN-M12x40-M(C)      ', N'Bulong m12x40 LGN mạ', N'xXx', N'Nhập Hàng', N'Con', 140, N'R15-12    ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T09:57:51.260' AS DateTime), N'BUL-TR-M12x20-M(C)       ', N'Bulong M12x20 LG trụ mạ', N'xXx', N'Nhập Hàng', N'Con', 70, N'R15-13    ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T09:57:51.263' AS DateTime), N'BUL-LGN-M12x20-S1(C)     ', N'Bulong M12x20 LGN inox', N'xXx', N'Nhập Hàng', N'Con', 39, N'R15-14    ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T09:57:51.267' AS DateTime), N'BUL-LGN-M12x30-M(C)      ', N'Bulong M12x30 LGN mạ', N'xXx', N'Nhập Hàng', N'Con', 35, N'R15-15    ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T09:57:51.270' AS DateTime), N'BUL-LGN-M12x100-S4(C)    ', N'Bulong M12x100 LGN inox 304', N'xXx', N'Nhập Hàng', N'Con', 22, N'R15-16    ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T09:57:51.273' AS DateTime), N'BUL-TR-M12X60-M(C)       ', N'Bulong M12x60 LG trụ mạ', N'xXx', N'Nhập Hàng', N'Con', 75, N'R15-17    ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T09:57:51.273' AS DateTime), N'BUL-LGN-M12X45-M( C)     ', N'Bulong m12x45 LGN mạ', N'xXx', N'Nhập Hàng', N'Con', 90, N'R15-18    ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T09:57:51.277' AS DateTime), N'BUL-LGN-M12x100-M(C)     ', N'Bulong M12x100 LGN mạ', N'xXx', N'Nhập Hàng', N'Con', 40, N'R15-20    ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T09:58:25.900' AS DateTime), N'BUL-LGN-M12X80-M(C)      ', N'Bulong M12x80 LGN mạ', N'xXx', N'Nhập Hàng', N'Con', 78, N'R15-19    ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T13:06:35.237' AS DateTime), N'BUL-CA-M6X25-M(C)        ', N'Bulong M6x25 LG cầu mạ', N'xXx', N'Nhập Hàng', N'Con', 20, N'R21-1     ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T13:06:35.243' AS DateTime), N'BUL-LGN-M6X20-M          ', N'Bulong M6x20 LGN mạ', N'xXx', N'Nhập Hàng', N'Con', 500, N'R21-2     ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T13:06:35.247' AS DateTime), N'BUL-CO-M6x20-M(C)        ', N'Bulong M6X20 LGC côn mạ', N'xXx', N'Nhập Hàng', N'Con', 35, N'R21-3     ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T13:06:35.250' AS DateTime), N'BUL-CO-M6X25-S1(C)       ', N'Bulong M6x25 LG côn Inox', N'xXx', N'Nhập Hàng', N'Con', 80, N'R21-4     ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T13:06:35.253' AS DateTime), N'BUL-TR-M6x25-M(C)        ', N'Bulong M6x25 LGC trụ mạ', N'xXx', N'Nhập Hàng', N'Con', 40, N'R21-5     ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T13:06:35.257' AS DateTime), N'CCH-V-M6-M               ', N'Con chạy vuông M6', N'xXx', N'Nhập Hàng', N'Con', 50, N'R21-6     ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T13:06:35.260' AS DateTime), N'CCH-L-M5-M               ', N'Con chạy lá M5 mạ', N'xXx', N'Nhập Hàng', N'Con', 1350, N'R21-7     ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T13:06:35.260' AS DateTime), N'ECU-M5-M                 ', N'Ecu 5 mạ', N'xXx', N'Nhập Hàng', N'Con', 750, N'R21-8     ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T13:06:35.263' AS DateTime), N'ECU-M4-S1                ', N'Ecu 4 inox', N'xXx', N'Nhập Hàng', N'Con', 220, N'R21-9     ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T13:06:35.267' AS DateTime), N'ECU-M4-M                 ', N'Ecu 4 mạ', N'xXx', N'Nhập Hàng', N'Con', 700, N'R21-10    ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T13:06:35.270' AS DateTime), N'BUL-TR-M5x40-S1(C)       ', N'Bulong M5x40 LGC trụ inox', N'xXx', N'Nhập Hàng', N'Con', 110, N'R21-11    ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T13:06:35.273' AS DateTime), N'BUL-CO-M5X15-S1(C)       ', N'bulong m5x15 LG cầu inox', N'xXx', N'Nhập Hàng', N'Con', 160, N'R21-12    ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T13:06:35.277' AS DateTime), N'BUL-LGN-M5x30-M(C)       ', N'Bulong M5x30 LGN mạ', N'xXx', N'Nhập Hàng', N'Con', 250, N'R21-13    ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T13:06:35.280' AS DateTime), N'BUL-CA-M5X25-S1(C)       ', N'Bulong M5x25 LG cầu inox', N'xXx', N'Nhập Hàng', N'Con', 110, N'R21-14    ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T13:06:35.280' AS DateTime), N'BUL-TR-M5X20-S1(C)       ', N'bulong m5x20 LG Trụ inox', N'xXx', N'Nhập Hàng', N'Con', 60, N'R21-15    ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T13:06:35.287' AS DateTime), N'BUL-LGN-M5X25-M(C)       ', N'Bulong M5x25 LGN mạ', N'xXx', N'Nhập Hàng', N'Con', 450, N'R21-16    ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T13:06:35.290' AS DateTime), N'BUL-TR-M5X15-S1(C)       ', N'Bulong M5x15 LG trụ Inox', N'xXx', N'Nhập Hàng', N'Con', 120, N'R21-17    ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T13:06:35.293' AS DateTime), N'BUL-TR-M5X25-S1(C)       ', N'Bulong M5x25 LG trụ inox', N'xXx', N'Nhập Hàng', N'Con', 220, N'R21-18    ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T13:06:35.293' AS DateTime), N'BUL-CO-M5X12-S1(C)       ', N'Bulong M5x12 LG côn inox', N'xXx', N'Nhập Hàng', N'Con', 180, N'R21-19    ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T13:06:35.297' AS DateTime), N'BUL-LGN-M5x15-M(C)       ', N'Bulong M5x15 LGN mạ', N'xXx', N'Nhập Hàng', N'Con', 420, N'R21-20    ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T13:06:35.300' AS DateTime), N'BUL-LGN-M4X10- S1        ', N'Bulong m4x10 LGN Inox 201', N'xXx', N'Nhập Hàng', N'Con', 1200, N'R21-21    ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T13:06:35.303' AS DateTime), N'BUL-TR-M4X40-S1          ', N'Bulong M4x40 LG trụ inox', N'xXx', N'Nhập Hàng', N'Con', 50, N'R21-22    ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T13:06:35.307' AS DateTime), N'BUL-LGN-M5x50-S1         ', N'Bulong M5x50 LGN Inox', N'xXx', N'Nhập Hàng', N'Con', 30, N'R21-24    ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T13:06:53.690' AS DateTime), N'ECU-M5-M                 ', N'Ecu 5 mạ', N'xXx', N'Xuất Hàng', N'Con', 250, N'R5-17     ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T13:07:13.670' AS DateTime), N'ECU-M5-S1                ', N'Ecu 5 inox', N'xXx', N'Nhập Hàng', N'Con', 250, N'R5-17     ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T13:23:03.780' AS DateTime), N'BUL-LGN-M14x30-M(C)      ', N'Bulong M14x30 LGN mạ', N'xXx', N'Nhập Hàng', N'Con', 200, N'F14-1     ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T13:23:03.783' AS DateTime), N'BUL-LGN-M10x20-S1(C)     ', N'Bulong M10x20 LGN inox', N'xXx', N'Nhập Hàng', N'Con', 200, N'F14-2     ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T13:23:03.787' AS DateTime), N'BUL-LGN-M10x35-S1(C)     ', N'Bulong M10x35 LGN inox', N'xXx', N'Nhập Hàng', N'Con', 20, N'F14-3     ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T13:23:03.790' AS DateTime), N'BUL-CA-M10x25-S1(C)      ', N'Bulong m10x25 LGC cầu inox', N'xXx', N'Nhập Hàng', N'Con', 200, N'F14-4     ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T13:23:03.793' AS DateTime), N'BUL-TR-M10X25-S1(C)      ', N'Bulong M10x25 LG trụ inox', N'xXx', N'Nhập Hàng', N'Con', 120, N'F14-5     ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T13:23:03.793' AS DateTime), N'BUL-LGN-M10x80-S1(C)     ', N'Bulong M10x80 LGN inox', N'xXx', N'Nhập Hàng', N'Con', 8, N'F14-6     ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T10:22:23.560' AS DateTime), N'BUL-LGN-M12x20-M(C)      ', N'Bulong M12x20 LGN mạ', N'xXx', N'Xuất Hàng', N'Con', 300, N'R15-2     ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T10:22:23.563' AS DateTime), N'BUL-CA-M12x25-S1(C)      ', N'Bulong M12x25, LGC inox đàu chỏm cầu', N'xXx', N'Xuất Hàng', N'Con', 450, N'R15-3     ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T10:22:23.567' AS DateTime), N'BUL-LGN-M12X80-M(C)      ', N'Bulong M12x80 LGN mạ', N'xXx', N'Xuất Hàng', N'Con', 300, N'R15-4     ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T10:22:23.570' AS DateTime), N'BUL-LGN-M12X80-M(C)      ', N'Bulong M12x80 LGN mạ', N'xXx', N'Xuất Hàng', N'Con', 78, N'R15-19    ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T10:22:23.573' AS DateTime), N'BUL-CA-M12x25-M(C)       ', N'Bulong  M12x25 LGC cầu mạ', N'xXx', N'Xuất Hàng', N'Con', 160, N'R15-5     ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T10:22:23.573' AS DateTime), N'BUL-LGN-M14x50-M(C)      ', N'bulong M14x50 LGN mạ', N'xXx', N'Xuất Hàng', N'Con', 230, N'R15-6     ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T10:22:23.577' AS DateTime), N'BUL-TR-M12x60-S1(C)      ', N'Bulong M12x60 LGC trụ Inox', N'xXx', N'Xuất Hàng', N'Con', 49, N'R15-7     ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T10:22:23.580' AS DateTime), N'BUL-TR-M12x100-S1        ', N'Bulong M12x100 LG trụ inox', N'xXx', N'Xuất Hàng', N'Con', 33, N'R15-8     ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T10:22:23.583' AS DateTime), N'BUL-CA-M12x30-S1         ', N'Bulong M12x30 LGC cầu Inox', N'xXx', N'Xuất Hàng', N'Con', 28, N'R15-9     ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T10:22:23.583' AS DateTime), N'BUL-LGN-M12X60-M(C)      ', N'Bulong M12x60 LGN mạ', N'xXx', N'Xuất Hàng', N'Con', 10, N'R15-11    ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T10:22:23.587' AS DateTime), N'BUL-LGN-M12x40-M(C)      ', N'Bulong m12x40 LGN mạ', N'xXx', N'Xuất Hàng', N'Con', 140, N'R15-12    ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T10:22:23.590' AS DateTime), N'BUL-TR-M12x20-M(C)       ', N'Bulong M12x20 LG trụ mạ', N'xXx', N'Xuất Hàng', N'Con', 70, N'R15-13    ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T10:22:23.593' AS DateTime), N'BUL-LGN-M12x20-S1(C)     ', N'Bulong M12x20 LGN inox', N'xXx', N'Xuất Hàng', N'Con', 39, N'R15-14    ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T10:22:23.593' AS DateTime), N'BUL-LGN-M12x30-M(C)      ', N'Bulong M12x30 LGN mạ', N'xXx', N'Xuất Hàng', N'Con', 35, N'R15-15    ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T10:22:23.597' AS DateTime), N'BUL-LGN-M12x100-S4(C)    ', N'Bulong M12x100 LGN inox 304', N'xXx', N'Xuất Hàng', N'Con', 22, N'R15-16    ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T10:22:23.600' AS DateTime), N'BUL-TR-M12X60-M(C)       ', N'Bulong M12x60 LG trụ mạ', N'xXx', N'Xuất Hàng', N'Con', 75, N'R15-17    ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T10:22:23.600' AS DateTime), N'BUL-LGN-M12X45-M( C)     ', N'Bulong m12x45 LGN mạ', N'xXx', N'Xuất Hàng', N'Con', 90, N'R15-18    ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T10:22:23.603' AS DateTime), N'BUL-LGN-M12x100-M(C)     ', N'Bulong M12x100 LGN mạ', N'xXx', N'Xuất Hàng', N'Con', 40, N'R15-20    ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T10:24:17.413' AS DateTime), N'BUL-LGN-M12X80 -S1(C)    ', N'Bulong M12x80 LGN inox', N'xXx', N'Xuất Hàng', N'Con', 120, N'R15-10    ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T10:31:41.037' AS DateTime), N'BUL-LGN-M12X80-M(C)      ', N'Bulong M12x80 LGN mạ', N'xXx', N'Xuất Hàng', N'Con', 222, N'R15-19    ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T10:49:10.170' AS DateTime), N'BUL-LGN-M12x100-M(C)     ', N'Bulong M12x100 LGN mạ', N'xXx', N'Nhập Hàng', N'Con', 300, N'R15-2     ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T10:49:10.173' AS DateTime), N'BUL-LGN-M10x120-M(C)     ', N'Bulong M10x120 LGN mạ', N'xXx', N'Nhập Hàng', N'Con', 450, N'R15-3     ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T10:49:10.177' AS DateTime), N'BUL-CA-M12x25-S1(C)      ', N'Bulong M12x25, LGC inox đàu chỏm cầu', N'xXx', N'Nhập Hàng', N'Con', 300, N'R15-4     ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T10:49:10.180' AS DateTime), N'BUL-LGN-M12X80-M(C)      ', N'Bulong M12x80 LGN mạ', N'xXx', N'Nhập Hàng', N'Con', 160, N'R15-5     ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T10:49:10.183' AS DateTime), N'BUL-CA-M12x25-M(C)       ', N'Bulong  M12x25 LGC cầu mạ', N'xXx', N'Nhập Hàng', N'Con', 230, N'R15-6     ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T10:49:10.187' AS DateTime), N'BUL-LGN-M14x50-M(C)      ', N'bulong M14x50 LGN mạ', N'xXx', N'Nhập Hàng', N'Con', 49, N'R15-7     ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T10:49:10.190' AS DateTime), N'BUL-TR-M12x60-S1(C)      ', N'Bulong M12x60 LGC trụ Inox', N'xXx', N'Nhập Hàng', N'Con', 33, N'R15-8     ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T10:49:10.190' AS DateTime), N'BUL-TR-M12x100-S1        ', N'Bulong M12x100 LG trụ inox', N'xXx', N'Nhập Hàng', N'Con', 28, N'R15-9     ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T10:49:10.193' AS DateTime), N'BUL-CA-M12x30-S1         ', N'Bulong M12x30 LGC cầu Inox', N'xXx', N'Nhập Hàng', N'Con', 120, N'R15-10    ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T10:49:10.200' AS DateTime), N'BUL-LGN-M12X80 -S1(C)    ', N'Bulong M12x80 LGN inox', N'xXx', N'Nhập Hàng', N'Con', 10, N'R15-11    ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T10:49:10.200' AS DateTime), N'BUL-LGN-M12X60-M(C)      ', N'Bulong M12x60 LGN mạ', N'xXx', N'Nhập Hàng', N'Con', 140, N'R15-12    ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T10:49:10.203' AS DateTime), N'BUL-LGN-M12x40-M(C)      ', N'Bulong m12x40 LGN mạ', N'xXx', N'Nhập Hàng', N'Con', 70, N'R15-13    ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T10:49:10.207' AS DateTime), N'BUL-TR-M12x20-M(C)       ', N'Bulong M12x20 LG trụ mạ', N'xXx', N'Nhập Hàng', N'Con', 39, N'R15-14    ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T10:49:10.210' AS DateTime), N'BUL-LGN-M12x20-S1(C)     ', N'Bulong M12x20 LGN inox', N'xXx', N'Nhập Hàng', N'Con', 35, N'R15-15    ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T10:49:10.210' AS DateTime), N'BUL-LGN-M12x30-M(C)      ', N'Bulong M12x30 LGN mạ', N'xXx', N'Nhập Hàng', N'Con', 25, N'R15-16    ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T10:49:10.213' AS DateTime), N'BUL-LGN-M12x100-S4(C)    ', N'Bulong M12x100 LGN inox 304', N'xXx', N'Nhập Hàng', N'Con', 75, N'R15-17    ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T10:49:10.217' AS DateTime), N'BUL-TR-M12X60-M(C)       ', N'Bulong M12x60 LG trụ mạ', N'xXx', N'Nhập Hàng', N'Con', 90, N'R15-18    ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T10:49:10.220' AS DateTime), N'BUL-LGN-M12X45-M( C)     ', N'Bulong m12x45 LGN mạ', N'xXx', N'Nhập Hàng', N'Con', 40, N'R15-19    ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T10:50:40.913' AS DateTime), N'BUL-LGN-M12X45-M( C)     ', N'Bulong m12x45 LGN mạ', N'xXx', N'Xuất Hàng', N'Con', 40, N'R15-19    ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T10:51:27.287' AS DateTime), N'BUL-LGN-M12X80-M(C)      ', N'Bulong M12x80 LGN mạ', N'xXx', N'Nhập Hàng', N'Con', 78, N'R15-19    ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T10:51:27.293' AS DateTime), N'BUL-LGN-M12X45-M( C)     ', N'Bulong m12x45 LGN mạ', N'xXx', N'Nhập Hàng', N'Con', 20, N'R15-20    ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T11:00:40.743' AS DateTime), N'BUL-LGN-M6x40-M(C)       ', N'Bulong M6x40 LGN mạ', N'xXx', N'Nhập Hàng', N'Con', 2800, N'R17-1     ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T11:00:40.750' AS DateTime), N'BUL-LGN-M16X20-M(C)      ', N'Bulong M16x30 LGN mạ', N'xXx', N'Nhập Hàng', N'Con', 500, N'R17-2     ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T11:00:40.750' AS DateTime), N'BUL-LGN-M14X60-M         ', N'Bulong M14x60 LGN mạ', N'xXx', N'Nhập Hàng', N'Con', 120, N'R17-3     ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T11:00:40.757' AS DateTime), N'BUL-LGN-M16x100-M(C)     ', N'Bulong M16x100 LGN mạ', N'xXx', N'Nhập Hàng', N'Con', 240, N'R17-4     ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T11:00:40.757' AS DateTime), N'BUL-LGN-M16x150-M(C)     ', N'Bulong M16x150 LGN mạ', N'xXx', N'Nhập Hàng', N'Con', 72, N'R17-5     ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T11:00:40.760' AS DateTime), N'BUL-LGN-M16x120-M(C)     ', N'Bulong M16x120 LGN mạ', N'xXx', N'Nhập Hàng', N'Con', 40, N'R17-6     ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T11:00:40.763' AS DateTime), N'BUL-LGN-M16X70-M(C)      ', N'Bulong M16x70 LGN mạ', N'xXx', N'Nhập Hàng', N'Con', 130, N'R17-7     ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T11:00:40.763' AS DateTime), N'BUL-LGN-M16x50-M(C)      ', N'Bulong M16x50 LGN mạ', N'xXx', N'Nhập Hàng', N'Con', 40, N'R17-8     ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T11:00:40.767' AS DateTime), N'CCH-B-M8-S1              ', N'Con chạy bi M8 inox', N'xXx', N'Nhập Hàng', N'Con', 1, N'R17-9     ', N'')
GO
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T11:00:40.770' AS DateTime), N'BUL-LGN-M16x100-S1(C)    ', N'Bulong M16x100 LGN inox', N'xXx', N'Nhập Hàng', N'Con', 15, N'R17-10    ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T11:00:40.773' AS DateTime), N'BUL-LGN-M14x80-M(C)      ', N'Bulong M14x80 LGN mạ', N'xXx', N'Nhập Hàng', N'Con', 18, N'R17-11    ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T11:00:40.777' AS DateTime), N'BUL-LGN-M16X80-M(C)      ', N'bulong m16x80 LGN mạ', N'xXx', N'Nhập Hàng', N'Con', 35, N'R17-12    ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T11:00:40.780' AS DateTime), N'BUL-LGN-M16x150-S4       ', N'Bulong M16x150 LGN inox 304', N'xXx', N'Nhập Hàng', N'Con', 7, N'R17-13    ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T11:00:40.780' AS DateTime), N'BUL-TR-M16x60-M(C)       ', N'Bulong M16x60 LG trụ mạ', N'xXx', N'Nhập Hàng', N'Con', 50, N'R17-14    ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T11:00:40.783' AS DateTime), N'BUL-TR-M16x30-M          ', N'Bulong M16x30 LGC trụ mạ', N'xXx', N'Nhập Hàng', N'Con', 13, N'R17-15    ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T11:00:40.787' AS DateTime), N'BUL-CA-M16x60-M(C)       ', N'Bulong M16x60 LGC cầu mạ', N'xXx', N'Nhập Hàng', N'Con', 50, N'R17-16    ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T11:00:40.790' AS DateTime), N'BUL-LGN-M14x30-M(C)      ', N'Bulong M14x30 LGN mạ', N'xXx', N'Nhập Hàng', N'Con', 30, N'R17-17    ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T11:00:40.790' AS DateTime), N'BUL-LGN-M14x50-M(C)      ', N'bulong M14x50 LGN mạ', N'xXx', N'Nhập Hàng', N'Con', 20, N'R17-18    ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T11:25:41.267' AS DateTime), N'BUL-TR-M6x35-S1(C)       ', N'Bulong M6x35 LGC trụ inox 201', N'xXx', N'Nhập Hàng', N'Con', 70, N'R19-1     ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T11:25:41.270' AS DateTime), N'BUL-LGN-M6x25-M(C)       ', N'Bulong M6x25 LGN mạ', N'xXx', N'Nhập Hàng', N'Con', 750, N'R19-2     ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T11:25:41.273' AS DateTime), N'BUL-CA-M6X25-S1(C)       ', N'Bulong M6x25 LG cầu Inox', N'xXx', N'Nhập Hàng', N'Con', 350, N'R19-3     ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T11:25:41.277' AS DateTime), N'BUL-CA-M6X15-S1(C)       ', N'Bulong M6x15 LG cầu Inox', N'xXx', N'Nhập Hàng', N'Con', 145, N'R19-4     ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T11:25:41.280' AS DateTime), N'BUL-CA-M6x10-M(C)        ', N'Bulong M6x10 LG cầu mạ', N'xXx', N'Nhập Hàng', N'Con', 30, N'R19-5     ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T11:25:41.280' AS DateTime), N'BUL-CA-M6X20-S1          ', N'Bulong M6x20 LG cầu inox', N'xXx', N'Nhập Hàng', N'Con', 950, N'R19-6     ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T11:25:41.283' AS DateTime), N'BUL-CO-M6x10-M(C)        ', N'Bulong M6x10 LGC côn mạ', N'xXx', N'Nhập Hàng', N'Con', 1300, N'R19-7     ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T11:25:41.287' AS DateTime), N'BUL-CO-M6x20-S1(C)       ', N'Bulong M6x20 LGC côn inox', N'xXx', N'Nhập Hàng', N'Con', 250, N'R19-8     ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T11:25:41.290' AS DateTime), N'BUL-LGN-M6x15-M(C)       ', N'Bulong M6x15 LGN mạ', N'xXx', N'Nhập Hàng', N'Con', 400, N'R19-9     ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T11:25:41.293' AS DateTime), N'BUL-CA-M6x40-M(C)        ', N'Bulong M6x40 LG cầu mạ', N'xXx', N'Nhập Hàng', N'Con', 980, N'R19-10    ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T11:25:41.300' AS DateTime), N'BUL-LGN-M6X50-M          ', N'Bulong m6x50 LGN mạ', N'xXx', N'Nhập Hàng', N'Con', 100, N'R19-11    ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T11:25:41.303' AS DateTime), N'BUL-TR-M6x60-M(C)        ', N'Bulong M6x60 LGC trụ mạ', N'xXx', N'Nhập Hàng', N'Con', 240, N'R19-12    ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T11:25:41.307' AS DateTime), N'BUL-LGN-M6x70-M(C)       ', N'Bulong M6x70 LGN mạ', N'xXx', N'Nhập Hàng', N'Con', 100, N'R19-13    ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T11:25:41.310' AS DateTime), N'BUL-LGN-M6X60-M(C)       ', N'Bulong M6x60 LGN mạ', N'xXx', N'Nhập Hàng', N'Con', 45, N'R19-14    ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T11:25:41.313' AS DateTime), N'BUL-CA-M6x40-S1(C)       ', N'Bulong M6x40 LG cầu inox', N'xXx', N'Nhập Hàng', N'Con', 90, N'R19-15    ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T11:25:41.317' AS DateTime), N'BUL-LGN-M6X30-S1         ', N'Bulong M6x20 LGN inox', N'xXx', N'Nhập Hàng', N'Con', 50, N'R19-16    ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T11:25:41.317' AS DateTime), N'BUL-LGN-M6x30-M(C)       ', N'Bulong M6x30 LGN mạ', N'xXx', N'Nhập Hàng', N'Con', 45, N'R19-17    ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T11:25:41.320' AS DateTime), N'BUL-CO-M6x40-S1(C)       ', N'Bulong M6x40 LGC côn inox', N'xXx', N'Nhập Hàng', N'Con', 25, N'R19-18    ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T11:25:41.323' AS DateTime), N'BUL-CO-M6X10-S1(C)       ', N'Bulong M6x10 côn inox', N'xXx', N'Nhập Hàng', N'Con', 700, N'R19-19    ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T11:25:41.327' AS DateTime), N'BUL-CO-M6X15-S1(C)       ', N'Bulong M6x15 LG côn Inox', N'xXx', N'Nhập Hàng', N'Con', 50, N'R19-20    ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T11:25:41.330' AS DateTime), N'BUL-TR-M6X12-S1          ', N'Bulong M6x12 LG Trụ inox', N'xXx', N'Nhập Hàng', N'Con', 90, N'R19-21    ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T11:25:41.330' AS DateTime), N'BUL-LGN-M6X15-S1         ', N'Bulong M6x15 LGN inox', N'xXx', N'Nhập Hàng', N'Con', 30, N'R19-22    ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T11:25:41.333' AS DateTime), N'BUL-CA-M6x30-M(C)        ', N'Bulong M6x30 LG cầu mạ', N'xXx', N'Nhập Hàng', N'Con', 900, N'R19-23    ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T11:25:41.337' AS DateTime), N'BUL-CO-M6x12-M(C)        ', N'Bulong M6x12 LGC côn mạ', N'xXx', N'Nhập Hàng', N'Con', 330, N'R19-24    ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T13:23:03.797' AS DateTime), N'BUL-CA-M10x60-M(C)       ', N'Bulong M10x60 LGC cầu mạ', N'xXx', N'Nhập Hàng', N'Con', 90, N'F14-7     ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T13:23:03.800' AS DateTime), N'BUL-LGN-M10x50-M(C)      ', N'Bulong M10x50 LGN mạ', N'xXx', N'Nhập Hàng', N'Con', 55, N'F14-8     ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T13:23:03.800' AS DateTime), N'BUL-TR-M10X25-M          ', N'Bulong M10x25 LG trụ mạ', N'xXx', N'Nhập Hàng', N'Con', 96, N'F14-9     ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T13:23:03.803' AS DateTime), N'BUL-TR-M10X50-S1(C)      ', N'Bulong m10x50 LG trụ inox', N'xXx', N'Nhập Hàng', N'Con', 27, N'F14-10    ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T13:23:03.807' AS DateTime), N'BUL-LGN-M10x100-M(C)     ', N'Bulong M10x100 LGN mạ', N'xXx', N'Nhập Hàng', N'Con', 50, N'F14-11    ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T13:23:03.810' AS DateTime), N'BUL-LGN-M10X15-M(C)      ', N'Bulong M10x15 LGN mạ', N'xXx', N'Nhập Hàng', N'Con', 115, N'F14-12    ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T13:23:03.813' AS DateTime), N'BUL-LGN-M10x25-S1(C)     ', N'Bulong m10x25 LGN inox 201', N'xXx', N'Nhập Hàng', N'Con', 30, N'F14-13    ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T13:23:03.817' AS DateTime), N'BUL-CA-M10X20-S1(C)      ', N'Bulong M10x20 LG cầu inox', N'xXx', N'Nhập Hàng', N'Con', 230, N'F14-14    ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T13:23:03.820' AS DateTime), N'BUL-CA-M10x15-M(C)       ', N'Bulong M10x15 LGC cầu mạ', N'xXx', N'Nhập Hàng', N'Con', 40, N'F14-15    ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T13:23:03.820' AS DateTime), N'BUL-CA-M10x20-M(C)       ', N'Bulong M10x20 LG cầu mạ', N'xXx', N'Nhập Hàng', N'Con', 250, N'F14-16    ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T13:23:03.823' AS DateTime), N'BUL-LGN-M10x90-M(C)      ', N'Bulong M10x90 LGN mạ', N'xXx', N'Nhập Hàng', N'Con', 14, N'F14-17    ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T13:23:03.830' AS DateTime), N'BUL-LGN-M10x30-S1(C)     ', N'BL M10x30 LGN inox', N'xXx', N'Nhập Hàng', N'Con', 15, N'F14-18    ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T13:25:02.413' AS DateTime), N'BUL-TR-M20x50-M(C)       ', N'Bulong M20x50 LG Trụ mạ', N'xXx', N'Nhập Hàng', N'Con', 13, N'F14-21    ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T13:25:02.417' AS DateTime), N'BUL-LGN-M20x60-M(C)      ', N'Bulong M20x60 LGN mạ', N'xXx', N'Nhập Hàng', N'Con', 10, N'F14-22    ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T13:25:02.420' AS DateTime), N'BUL-LGN-M18x150-M(C)     ', N'Bulong M18x150 LGN mạ', N'xXx', N'Nhập Hàng', N'Con', 7, N'F14-23    ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T13:25:02.423' AS DateTime), N'BUL-LGN-M14x50-M(C)      ', N'bulong M14x50 LGN mạ', N'xXx', N'Nhập Hàng', N'Con', 12, N'F14-24    ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T13:28:43.633' AS DateTime), N'BUL-TR-M10x15-Ð(C)       ', N'Bulong M10x15 LG trụ đen', N'xXx', N'Nhập Hàng', N'Con', 300, N'F14-20    ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T13:28:43.637' AS DateTime), N'BUL-LGN-M10x25-Ð(C)      ', N'Bulong M10x25 LGN thép đen', N'xXx', N'Nhập Hàng', N'Con', 50, N'F14-19    ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T13:37:45.790' AS DateTime), N'BUL-CA-M8x25-S1          ', N'Bulong M8x25 LGC cầu inox', N'xXx', N'Nhập Hàng', N'Con', 30, N'F22-1     ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T13:37:45.793' AS DateTime), N'BUL-CO-M8x15-M(C)        ', N'Bulong M8x15 LGC côn mạ', N'xXx', N'Nhập Hàng', N'Con', 25, N'F22-2     ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T13:37:45.797' AS DateTime), N'BUL-LGN-M10X30-M(C)      ', N'Bulong M10x30 LGN mạ', N'xXx', N'Nhập Hàng', N'Con', 30, N'F22-3     ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T13:37:45.797' AS DateTime), N'BUL-TR-M6x50-S1(C)       ', N'Bulong M6x50 LG trụ inox', N'xXx', N'Nhập Hàng', N'Con', 20, N'F22-4     ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T13:37:45.800' AS DateTime), N'BUL-RL-TR-M10x60-M       ', N'Bulong M10x60 LG Trụ mạ ren lửng', N'xXx', N'Nhập Hàng', N'Con', 18, N'F22-5     ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T13:37:45.803' AS DateTime), N'BUL-LGN-M8X12-S1         ', N'bulong M8x12 lgn inox', N'xXx', N'Nhập Hàng', N'Con', 50, N'F22-6     ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T13:37:45.807' AS DateTime), N'BUL-TR-M5x55-S1          ', N'Bulong M5x55 LGC trụ inox', N'xXx', N'Nhập Hàng', N'Con', 70, N'F22-7     ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T13:37:45.810' AS DateTime), N'BUL-CO-M5X20-S1(C)       ', N'Bulong M5x20 LG côn  inox', N'xXx', N'Nhập Hàng', N'Con', 50, N'F22-8     ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T13:49:29.797' AS DateTime), N'BUL-CA-VIT-M4x25-M       ', N'Bulong M4x25 LGC cầu tô vít mạ', N'xXx', N'Nhập Hàng', N'Con', 310, N'R21-23    ', N'')
INSERT [dbo].[History] ([Ngay], [MaSp], [TenSp], [Maker], [TacVu], [DonViTinh], [SoLuong], [ViTriO], [DienGiai]) VALUES (CAST(N'2022-01-24T14:35:36.527' AS DateTime), N'BUL-LGN-M14x50-M(C)      ', N'bulong M14x50 LGN mạ', N'xXx', N'Xuất Hàng', N'Con', 12, N'F14-24    ', N'')
GO
INSERT [dbo].[LISTKHAY] ([TenKhay], [State], [W_Min], [H_Min]) VALUES (N'R1        ', 2, 46, 95)
INSERT [dbo].[LISTKHAY] ([TenKhay], [State], [W_Min], [H_Min]) VALUES (N'R2        ', 1, 0, 0)
INSERT [dbo].[LISTKHAY] ([TenKhay], [State], [W_Min], [H_Min]) VALUES (N'R3        ', 2, 56, 95)
INSERT [dbo].[LISTKHAY] ([TenKhay], [State], [W_Min], [H_Min]) VALUES (N'R4        ', 1, 0, 0)
INSERT [dbo].[LISTKHAY] ([TenKhay], [State], [W_Min], [H_Min]) VALUES (N'R5        ', 2, 21, 95)
INSERT [dbo].[LISTKHAY] ([TenKhay], [State], [W_Min], [H_Min]) VALUES (N'R6        ', 1, 0, 0)
INSERT [dbo].[LISTKHAY] ([TenKhay], [State], [W_Min], [H_Min]) VALUES (N'R7        ', 2, 21, 95)
INSERT [dbo].[LISTKHAY] ([TenKhay], [State], [W_Min], [H_Min]) VALUES (N'R8        ', 1, 0, 0)
INSERT [dbo].[LISTKHAY] ([TenKhay], [State], [W_Min], [H_Min]) VALUES (N'R9        ', 2, 46, 95)
INSERT [dbo].[LISTKHAY] ([TenKhay], [State], [W_Min], [H_Min]) VALUES (N'R10       ', 1, 0, 0)
INSERT [dbo].[LISTKHAY] ([TenKhay], [State], [W_Min], [H_Min]) VALUES (N'R11       ', 2, 21, 95)
INSERT [dbo].[LISTKHAY] ([TenKhay], [State], [W_Min], [H_Min]) VALUES (N'R12       ', 1, 0, 0)
INSERT [dbo].[LISTKHAY] ([TenKhay], [State], [W_Min], [H_Min]) VALUES (N'R13       ', 2, 21, 95)
INSERT [dbo].[LISTKHAY] ([TenKhay], [State], [W_Min], [H_Min]) VALUES (N'R14       ', 1, 0, 0)
INSERT [dbo].[LISTKHAY] ([TenKhay], [State], [W_Min], [H_Min]) VALUES (N'R15       ', 2, 21, 95)
INSERT [dbo].[LISTKHAY] ([TenKhay], [State], [W_Min], [H_Min]) VALUES (N'R16       ', 1, 0, 0)
INSERT [dbo].[LISTKHAY] ([TenKhay], [State], [W_Min], [H_Min]) VALUES (N'R17       ', 2, 21, 95)
INSERT [dbo].[LISTKHAY] ([TenKhay], [State], [W_Min], [H_Min]) VALUES (N'R18       ', 1, 0, 0)
INSERT [dbo].[LISTKHAY] ([TenKhay], [State], [W_Min], [H_Min]) VALUES (N'R19       ', 2, 46, 95)
INSERT [dbo].[LISTKHAY] ([TenKhay], [State], [W_Min], [H_Min]) VALUES (N'R20       ', 1, 0, 0)
INSERT [dbo].[LISTKHAY] ([TenKhay], [State], [W_Min], [H_Min]) VALUES (N'R21       ', 2, 46, 95)
INSERT [dbo].[LISTKHAY] ([TenKhay], [State], [W_Min], [H_Min]) VALUES (N'R22       ', 1, 0, 0)
INSERT [dbo].[LISTKHAY] ([TenKhay], [State], [W_Min], [H_Min]) VALUES (N'R23       ', 2, 21, 95)
INSERT [dbo].[LISTKHAY] ([TenKhay], [State], [W_Min], [H_Min]) VALUES (N'R24       ', 1, 0, 0)
INSERT [dbo].[LISTKHAY] ([TenKhay], [State], [W_Min], [H_Min]) VALUES (N'R25       ', 2, 46, 95)
INSERT [dbo].[LISTKHAY] ([TenKhay], [State], [W_Min], [H_Min]) VALUES (N'R26       ', 1, 0, 0)
INSERT [dbo].[LISTKHAY] ([TenKhay], [State], [W_Min], [H_Min]) VALUES (N'F14       ', 2, 46, 95)
INSERT [dbo].[LISTKHAY] ([TenKhay], [State], [W_Min], [H_Min]) VALUES (N'F15       ', 1, 0, 0)
INSERT [dbo].[LISTKHAY] ([TenKhay], [State], [W_Min], [H_Min]) VALUES (N'F16       ', 2, 46, 95)
INSERT [dbo].[LISTKHAY] ([TenKhay], [State], [W_Min], [H_Min]) VALUES (N'F17       ', 1, 0, 0)
INSERT [dbo].[LISTKHAY] ([TenKhay], [State], [W_Min], [H_Min]) VALUES (N'F18       ', 2, 21, 95)
INSERT [dbo].[LISTKHAY] ([TenKhay], [State], [W_Min], [H_Min]) VALUES (N'F19       ', 1, 0, 0)
INSERT [dbo].[LISTKHAY] ([TenKhay], [State], [W_Min], [H_Min]) VALUES (N'F20       ', 2, 21, 95)
INSERT [dbo].[LISTKHAY] ([TenKhay], [State], [W_Min], [H_Min]) VALUES (N'F21       ', 1, 0, 0)
INSERT [dbo].[LISTKHAY] ([TenKhay], [State], [W_Min], [H_Min]) VALUES (N'F22       ', 2, 46, 95)
INSERT [dbo].[LISTKHAY] ([TenKhay], [State], [W_Min], [H_Min]) VALUES (N'F23       ', 1, 0, 0)
INSERT [dbo].[LISTKHAY] ([TenKhay], [State], [W_Min], [H_Min]) VALUES (N'F24       ', 2, 21, 95)
INSERT [dbo].[LISTKHAY] ([TenKhay], [State], [W_Min], [H_Min]) VALUES (N'F25       ', 1, 0, 0)
INSERT [dbo].[LISTKHAY] ([TenKhay], [State], [W_Min], [H_Min]) VALUES (N'F26       ', 0, 0, 0)
GO
SET IDENTITY_INSERT [dbo].[NHOMSP] ON 

INSERT [dbo].[NHOMSP] ([STT], [NhomSp]) VALUES (1, N'Bulong')
INSERT [dbo].[NHOMSP] ([STT], [NhomSp]) VALUES (2, N'Gối bi')
INSERT [dbo].[NHOMSP] ([STT], [NhomSp]) VALUES (3, N'Thiết bị điện')
SET IDENTITY_INSERT [dbo].[NHOMSP] OFF
GO
SET IDENTITY_INSERT [dbo].[TACVU] ON 

INSERT [dbo].[TACVU] ([STT], [TacVu]) VALUES (5, N'Cấu hình khay')
INSERT [dbo].[TACVU] ([STT], [TacVu]) VALUES (1, N'Nhập Hàng')
INSERT [dbo].[TACVU] ([STT], [TacVu]) VALUES (3, N'Thêm Khay')
INSERT [dbo].[TACVU] ([STT], [TacVu]) VALUES (6, N'Trống')
INSERT [dbo].[TACVU] ([STT], [TacVu]) VALUES (4, N'Xóa Khay')
INSERT [dbo].[TACVU] ([STT], [TacVu]) VALUES (2, N'Xuất Hàng')
SET IDENTITY_INSERT [dbo].[TACVU] OFF
GO
INSERT [dbo].[TASK] ([Time], [task]) VALUES (CAST(N'2022-01-04T13:12:15.613' AS DateTime), N'Trống')
GO
SET IDENTITY_INSERT [dbo].[tbBackUp] ON 

INSERT [dbo].[tbBackUp] ([STT], [Ngay], [TangDi], [TangDen], [TrangThai]) VALUES (190, CAST(N'2022-01-15T15:33:51.030' AS DateTime), N'R1        ', N'F27       ', 1)
INSERT [dbo].[tbBackUp] ([STT], [Ngay], [TangDi], [TangDen], [TrangThai]) VALUES (191, CAST(N'2022-01-15T15:34:40.983' AS DateTime), N'F27       ', N'R1        ', 1)
INSERT [dbo].[tbBackUp] ([STT], [Ngay], [TangDi], [TangDen], [TrangThai]) VALUES (192, CAST(N'2022-01-15T15:35:12.260' AS DateTime), N'F22       ', N'F27       ', 1)
INSERT [dbo].[tbBackUp] ([STT], [Ngay], [TangDi], [TangDen], [TrangThai]) VALUES (193, CAST(N'2022-01-15T15:36:10.640' AS DateTime), N'F27       ', N'F22       ', 1)
INSERT [dbo].[tbBackUp] ([STT], [Ngay], [TangDi], [TangDen], [TrangThai]) VALUES (194, CAST(N'2022-01-15T16:28:28.553' AS DateTime), N'R1        ', N'F27       ', 1)
INSERT [dbo].[tbBackUp] ([STT], [Ngay], [TangDi], [TangDen], [TrangThai]) VALUES (195, CAST(N'2022-01-15T16:29:18.867' AS DateTime), N'F27       ', N'R1        ', 1)
INSERT [dbo].[tbBackUp] ([STT], [Ngay], [TangDi], [TangDen], [TrangThai]) VALUES (196, CAST(N'2022-01-15T16:30:17.423' AS DateTime), N'R23       ', N'F27       ', 1)
INSERT [dbo].[tbBackUp] ([STT], [Ngay], [TangDi], [TangDen], [TrangThai]) VALUES (197, CAST(N'2022-01-15T16:31:18.720' AS DateTime), N'F27       ', N'R23       ', 1)
INSERT [dbo].[tbBackUp] ([STT], [Ngay], [TangDi], [TangDen], [TrangThai]) VALUES (198, CAST(N'2022-01-15T16:33:50.110' AS DateTime), N'F22       ', N'F27       ', 1)
INSERT [dbo].[tbBackUp] ([STT], [Ngay], [TangDi], [TangDen], [TrangThai]) VALUES (199, CAST(N'2022-01-15T16:34:49.970' AS DateTime), N'F27       ', N'F22       ', 1)
INSERT [dbo].[tbBackUp] ([STT], [Ngay], [TangDi], [TangDen], [TrangThai]) VALUES (200, CAST(N'2022-01-15T16:37:08.713' AS DateTime), N'R1        ', N'F27       ', 1)
INSERT [dbo].[tbBackUp] ([STT], [Ngay], [TangDi], [TangDen], [TrangThai]) VALUES (201, CAST(N'2022-01-15T16:38:03.330' AS DateTime), N'F27       ', N'R1        ', 1)
INSERT [dbo].[tbBackUp] ([STT], [Ngay], [TangDi], [TangDen], [TrangThai]) VALUES (202, CAST(N'2022-01-15T16:39:11.873' AS DateTime), N'F20       ', N'F27       ', 1)
INSERT [dbo].[tbBackUp] ([STT], [Ngay], [TangDi], [TangDen], [TrangThai]) VALUES (203, CAST(N'2022-01-15T16:40:10.537' AS DateTime), N'F27       ', N'F20       ', 1)
INSERT [dbo].[tbBackUp] ([STT], [Ngay], [TangDi], [TangDen], [TrangThai]) VALUES (204, CAST(N'2022-01-15T16:44:38.173' AS DateTime), N'R25       ', N'F27       ', 1)
INSERT [dbo].[tbBackUp] ([STT], [Ngay], [TangDi], [TangDen], [TrangThai]) VALUES (205, CAST(N'2022-01-15T16:46:50.450' AS DateTime), N'F27       ', N'R25       ', 1)
INSERT [dbo].[tbBackUp] ([STT], [Ngay], [TangDi], [TangDen], [TrangThai]) VALUES (206, CAST(N'2022-01-17T14:20:03.983' AS DateTime), N'F27       ', N'F27       ', 1)
INSERT [dbo].[tbBackUp] ([STT], [Ngay], [TangDi], [TangDen], [TrangThai]) VALUES (207, CAST(N'2022-01-17T14:24:16.107' AS DateTime), N'R3        ', N'F27       ', 0)
INSERT [dbo].[tbBackUp] ([STT], [Ngay], [TangDi], [TangDen], [TrangThai]) VALUES (208, CAST(N'2022-01-17T14:25:07.220' AS DateTime), N'F27       ', N'F27       ', 1)
INSERT [dbo].[tbBackUp] ([STT], [Ngay], [TangDi], [TangDen], [TrangThai]) VALUES (209, CAST(N'2022-01-17T14:34:29.820' AS DateTime), N'R3        ', N'F27       ', 0)
INSERT [dbo].[tbBackUp] ([STT], [Ngay], [TangDi], [TangDen], [TrangThai]) VALUES (210, CAST(N'2022-01-17T14:35:41.223' AS DateTime), N'F27       ', N'R3        ', 0)
INSERT [dbo].[tbBackUp] ([STT], [Ngay], [TangDi], [TangDen], [TrangThai]) VALUES (211, CAST(N'2022-01-17T14:35:51.880' AS DateTime), N'F27       ', N'F27       ', 1)
INSERT [dbo].[tbBackUp] ([STT], [Ngay], [TangDi], [TangDen], [TrangThai]) VALUES (212, CAST(N'2022-01-17T14:40:03.190' AS DateTime), N'R15       ', N'F27       ', 1)
INSERT [dbo].[tbBackUp] ([STT], [Ngay], [TangDi], [TangDen], [TrangThai]) VALUES (213, CAST(N'2022-01-17T14:48:14.420' AS DateTime), N'F27       ', N'R15       ', 1)
INSERT [dbo].[tbBackUp] ([STT], [Ngay], [TangDi], [TangDen], [TrangThai]) VALUES (214, CAST(N'2022-01-17T14:48:33.743' AS DateTime), N'R13       ', N'F27       ', 1)
INSERT [dbo].[tbBackUp] ([STT], [Ngay], [TangDi], [TangDen], [TrangThai]) VALUES (215, CAST(N'2022-01-17T14:50:20.513' AS DateTime), N'F27       ', N'R13       ', 1)
INSERT [dbo].[tbBackUp] ([STT], [Ngay], [TangDi], [TangDen], [TrangThai]) VALUES (216, CAST(N'2022-01-17T15:05:51.653' AS DateTime), N'R1        ', N'F27       ', 1)
INSERT [dbo].[tbBackUp] ([STT], [Ngay], [TangDi], [TangDen], [TrangThai]) VALUES (217, CAST(N'2022-01-17T15:06:42.693' AS DateTime), N'F27       ', N'R1        ', 1)
INSERT [dbo].[tbBackUp] ([STT], [Ngay], [TangDi], [TangDen], [TrangThai]) VALUES (218, CAST(N'2022-01-17T15:08:25.393' AS DateTime), N'R25       ', N'F27       ', 1)
INSERT [dbo].[tbBackUp] ([STT], [Ngay], [TangDi], [TangDen], [TrangThai]) VALUES (219, CAST(N'2022-01-17T15:09:23.787' AS DateTime), N'F27       ', N'R25       ', 1)
INSERT [dbo].[tbBackUp] ([STT], [Ngay], [TangDi], [TangDen], [TrangThai]) VALUES (220, CAST(N'2022-01-22T09:29:08.353' AS DateTime), N'R1        ', N'F27       ', 1)
INSERT [dbo].[tbBackUp] ([STT], [Ngay], [TangDi], [TangDen], [TrangThai]) VALUES (221, CAST(N'2022-01-22T09:32:12.830' AS DateTime), N'R1        ', N'F27       ', 1)
INSERT [dbo].[tbBackUp] ([STT], [Ngay], [TangDi], [TangDen], [TrangThai]) VALUES (222, CAST(N'2022-01-22T09:32:43.773' AS DateTime), N'R1        ', N'F27       ', 1)
INSERT [dbo].[tbBackUp] ([STT], [Ngay], [TangDi], [TangDen], [TrangThai]) VALUES (223, CAST(N'2022-01-22T09:33:00.690' AS DateTime), N'R1        ', N'F27       ', 1)
INSERT [dbo].[tbBackUp] ([STT], [Ngay], [TangDi], [TangDen], [TrangThai]) VALUES (224, CAST(N'2022-01-22T09:53:07.473' AS DateTime), N'R1        ', N'F27       ', 1)
INSERT [dbo].[tbBackUp] ([STT], [Ngay], [TangDi], [TangDen], [TrangThai]) VALUES (225, CAST(N'2022-01-22T10:50:43.213' AS DateTime), N'R1        ', N'F27       ', 1)
INSERT [dbo].[tbBackUp] ([STT], [Ngay], [TangDi], [TangDen], [TrangThai]) VALUES (226, CAST(N'2022-01-22T13:03:32.097' AS DateTime), N'R3        ', N'F27       ', 1)
INSERT [dbo].[tbBackUp] ([STT], [Ngay], [TangDi], [TangDen], [TrangThai]) VALUES (227, CAST(N'2022-01-22T14:36:23.070' AS DateTime), N'R5        ', N'F27       ', 1)
INSERT [dbo].[tbBackUp] ([STT], [Ngay], [TangDi], [TangDen], [TrangThai]) VALUES (228, CAST(N'2022-01-22T15:25:31.800' AS DateTime), N'R7        ', N'F27       ', 1)
INSERT [dbo].[tbBackUp] ([STT], [Ngay], [TangDi], [TangDen], [TrangThai]) VALUES (229, CAST(N'2022-01-22T16:20:15.560' AS DateTime), N'R11       ', N'F27       ', 1)
INSERT [dbo].[tbBackUp] ([STT], [Ngay], [TangDi], [TangDen], [TrangThai]) VALUES (230, CAST(N'2022-01-22T16:45:13.070' AS DateTime), N'R13       ', N'F27       ', 1)
INSERT [dbo].[tbBackUp] ([STT], [Ngay], [TangDi], [TangDen], [TrangThai]) VALUES (231, CAST(N'2022-01-24T09:57:46.197' AS DateTime), N'R15       ', N'F27       ', 1)
INSERT [dbo].[tbBackUp] ([STT], [Ngay], [TangDi], [TangDen], [TrangThai]) VALUES (232, CAST(N'2022-01-24T09:58:23.730' AS DateTime), N'R15       ', N'F27       ', 1)
INSERT [dbo].[tbBackUp] ([STT], [Ngay], [TangDi], [TangDen], [TrangThai]) VALUES (233, CAST(N'2022-01-24T10:22:02.530' AS DateTime), N'R15       ', N'F27       ', 1)
INSERT [dbo].[tbBackUp] ([STT], [Ngay], [TangDi], [TangDen], [TrangThai]) VALUES (234, CAST(N'2022-01-24T10:24:14.863' AS DateTime), N'R15       ', N'F27       ', 1)
INSERT [dbo].[tbBackUp] ([STT], [Ngay], [TangDi], [TangDen], [TrangThai]) VALUES (235, CAST(N'2022-01-24T10:31:37.343' AS DateTime), N'R15       ', N'F27       ', 1)
INSERT [dbo].[tbBackUp] ([STT], [Ngay], [TangDi], [TangDen], [TrangThai]) VALUES (236, CAST(N'2022-01-24T10:49:07.207' AS DateTime), N'R15       ', N'F27       ', 1)
INSERT [dbo].[tbBackUp] ([STT], [Ngay], [TangDi], [TangDen], [TrangThai]) VALUES (237, CAST(N'2022-01-24T10:50:38.753' AS DateTime), N'R15       ', N'F27       ', 1)
INSERT [dbo].[tbBackUp] ([STT], [Ngay], [TangDi], [TangDen], [TrangThai]) VALUES (238, CAST(N'2022-01-24T10:51:24.700' AS DateTime), N'R15       ', N'F27       ', 1)
INSERT [dbo].[tbBackUp] ([STT], [Ngay], [TangDi], [TangDen], [TrangThai]) VALUES (239, CAST(N'2022-01-24T11:00:37.453' AS DateTime), N'R17       ', N'F27       ', 1)
INSERT [dbo].[tbBackUp] ([STT], [Ngay], [TangDi], [TangDen], [TrangThai]) VALUES (240, CAST(N'2022-01-24T11:25:38.880' AS DateTime), N'R19       ', N'F27       ', 1)
INSERT [dbo].[tbBackUp] ([STT], [Ngay], [TangDi], [TangDen], [TrangThai]) VALUES (241, CAST(N'2022-01-24T13:06:32.190' AS DateTime), N'R21       ', N'F27       ', 1)
INSERT [dbo].[tbBackUp] ([STT], [Ngay], [TangDi], [TangDen], [TrangThai]) VALUES (242, CAST(N'2022-01-24T13:06:51.337' AS DateTime), N'R5        ', N'F27       ', 1)
INSERT [dbo].[tbBackUp] ([STT], [Ngay], [TangDi], [TangDen], [TrangThai]) VALUES (243, CAST(N'2022-01-24T13:07:10.380' AS DateTime), N'R5        ', N'F27       ', 1)
INSERT [dbo].[tbBackUp] ([STT], [Ngay], [TangDi], [TangDen], [TrangThai]) VALUES (244, CAST(N'2022-01-24T13:23:00.900' AS DateTime), N'F14       ', N'F27       ', 1)
INSERT [dbo].[tbBackUp] ([STT], [Ngay], [TangDi], [TangDen], [TrangThai]) VALUES (245, CAST(N'2022-01-24T13:25:00.167' AS DateTime), N'F14       ', N'F27       ', 1)
INSERT [dbo].[tbBackUp] ([STT], [Ngay], [TangDi], [TangDen], [TrangThai]) VALUES (246, CAST(N'2022-01-24T13:28:40.177' AS DateTime), N'F14       ', N'F27       ', 1)
INSERT [dbo].[tbBackUp] ([STT], [Ngay], [TangDi], [TangDen], [TrangThai]) VALUES (247, CAST(N'2022-01-24T13:37:43.260' AS DateTime), N'F22       ', N'F27       ', 1)
INSERT [dbo].[tbBackUp] ([STT], [Ngay], [TangDi], [TangDen], [TrangThai]) VALUES (248, CAST(N'2022-01-24T13:49:27.823' AS DateTime), N'R21       ', N'F27       ', 1)
INSERT [dbo].[tbBackUp] ([STT], [Ngay], [TangDi], [TangDen], [TrangThai]) VALUES (249, CAST(N'2022-01-24T14:35:34.267' AS DateTime), N'F14       ', N'F27       ', 1)
SET IDENTITY_INSERT [dbo].[tbBackUp] OFF
GO
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'ECU-M10-M                ', N'Ecu 10 mạ', N'Bulong', N'xXx', N'Con', 4280, N'R1-1      ', 16501)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'PHA-M10-M                ', N'phẳng 10 mạ', N'Bulong', N'xXx', N'Con', 3600, N'R1-4      ', 3933)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'ECU-M8-M                 ', N'Ecu 8 mạ', N'Bulong', N'xXx', N'Con', 7700, N'R1-5      ', 16501)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'PHA-M8-M                 ', N'phẳng 8 mạ', N'Bulong', N'xXx', N'Con', 2400, N'R1-6      ', 3933)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'ECU-M16-M                ', N'Ecu M16 mạ', N'Bulong', N'xXx', N'Con', 1620, N'R3-1      ', 14877)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'ECU-M10-S1               ', N'Ecu  M10 inox', N'Bulong', N'xXx', N'Con', 950, N'R1-2      ', 3933)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'VEH-M16-M                ', N'Vênh M16 mạ', N'Bulong', N'xXx', N'Con', 2100, N'R3-2      ', 4788)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'PHA-M16-M                ', N'phẳng 16 mạ', N'Bulong', N'xXx', N'Con', 2800, N'R3-3      ', 14877)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'ECU-M14-M                ', N'Ecu 14 mạ', N'Bulong', N'xXx', N'Con', 4200, N'R3-4      ', 30223)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'ECU-M16-S1               ', N'Ecu M16 inox', N'Bulong', N'xXx', N'Con', 250, N'R3-5      ', 4788)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'ECU-M12-S1               ', N'Ecu 12 inox', N'Bulong', N'xXx', N'Con', 200, N'R3-6      ', 4788)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'VEH-M12-S1               ', N'vênh 12 inox', N'Bulong', N'xXx', N'Con', 180, N'R3-7      ', 4788)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'VEH-M14-M                ', N'Vênh M14 mạ', N'Bulong', N'xXx', N'Con', 1400, N'R3-8      ', 4788)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'VEH-M12-M                ', N'Vênh 12 mạ', N'Bulong', N'xXx', N'Con', 1700, N'R3-9      ', 4788)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'PHA-M12-M                ', N'phẳng 12 mạ', N'Bulong', N'xXx', N'Con', 5400, N'R3-10     ', 19152)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'ECU-M12-M                ', N'Ecu 12 mạ', N'Bulong', N'xXx', N'Con', 1500, N'R3-11     ', 4788)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'PHA-M14-M                ', N'phẳng 14 mạ', N'Bulong', N'xXx', N'Con', 1600, N'R5-1      ', 23598)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'ECU-M20-M                ', N'Ecu M20 mạ', N'Bulong', N'xXx', N'Con', 190, N'R5-2      ', 19664)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'CCH-L-M6-M               ', N'Con chạy lá M6 mạ', N'Bulong', N'xXx', N'Con', 6000, N'R5-3      ', 23598)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'ECU-M6-M                 ', N'Ecu 6 mạ', N'Bulong', N'xXx', N'Con', 6600, N'R5-4      ', 23598)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'PHA-M6-M                 ', N'Phẳng 6 mạ', N'Bulong', N'xXx', N'Con', 7200, N'R5-5      ', 23598)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-TR- M6X20-M(C)       ', N'Bulong M6x20 LGT trụ mạ', N'Bulong', N'xXx', N'Con', 6400, N'R5-6      ', 48222)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-TR-M6X20-S1(C)       ', N'Bulong M6x20 LG trụ inox', N'Bulong', N'xXx', N'Con', 2000, N'R5-7      ', 23598)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'VEH-M6-S4                ', N'Vênh 6 inox 304', N'Bulong', N'xXx', N'Con', 5000, N'R5-8      ', 15390)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'VEH-M6-M                 ', N'Vênh M6 mạ', N'Bulong', N'xXx', N'Con', 2400, N'R5-9      ', 15390)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'VEH-M6-S1                ', N'Vênh inox M6', N'Bulong', N'xXx', N'Con', 5700, N'R5-10     ', 15390)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'VEH-M4-M                 ', N'Vênh 4 mạ', N'Bulong', N'xXx', N'Con', 3500, N'R5-11     ', 15390)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'VEH-M5-M                 ', N'Vênh M5 mạ', N'Bulong', N'xXx', N'Con', 6000, N'R5-12     ', 15390)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'VEH-M5-S1                ', N'vênh 5 inox', N'Bulong', N'xXx', N'Con', 3000, N'R5-13     ', 15390)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'PHA-M6-S1                ', N'phẳng 6 inox', N'Bulong', N'xXx', N'Con', 2000, N'R5-14     ', 15390)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'PHA-M5-M                 ', N'Phẳng M5 mạ', N'Bulong', N'xXx', N'Con', 3800, N'R5-15     ', 15390)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'PHA-M4-M                 ', N'Phẳng 4 mạ', N'Bulong', N'xXx', N'Con', 3300, N'R5-16     ', 15390)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'ECU-M5-S1                ', N'Ecu 5 inox', N'Bulong', N'xXx', N'Con', 250, N'R5-17     ', 15390)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'ECUH-M6- M               ', N'Ecu M6 tự hãm mạ', N'Bulong', N'xXx', N'Con', 150, N'R5-18     ', 12824)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'ECU-M6-S1                ', N'Ecu 6 inox', N'Bulong', N'xXx', N'Con', 90, N'R5-19     ', 15390)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-CA-M8x60-M(C)        ', N'Bulong M8x60 LGC cầu mạ', N'Bulong', N'xXx', N'Con', 750, N'R7-1      ', 23598)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-CO-M8x40-M(C)        ', N'Bulong M8x40 LGC côn mạ', N'Bulong', N'xXx', N'Con', 360, N'R7-2      ', 23598)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-CO-M8x30-M(C)        ', N'Bulong M8x30 LGC côn mạ', N'Bulong', N'xXx', N'Con', 590, N'R7-3      ', 23598)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-CA-M8x15-M(C)        ', N'Bulong M8x15 LGC cầu mạ', N'Bulong', N'xXx', N'Con', 720, N'R7-4      ', 23598)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-TR-M8x40-M(C)        ', N'Bulong M8x40 LGC trụ mạ', N'Bulong', N'xXx', N'Con', 850, N'R7-5      ', 23598)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-TR-M8X60-S1          ', N'Bulong M8x60 LG Trụ inox', N'Bulong', N'xXx', N'Con', 280, N'R7-6      ', 23598)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-LGN-M8x10-M(C)       ', N'Bulong M8x10 LGN mạ', N'Bulong', N'xXx', N'Con', 840, N'R7-7      ', 23598)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-TR-M8x15-S1          ', N'Bulong M8x15 trụ inox', N'Bulong', N'xXx', N'Con', 600, N'R7-8      ', 15390)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-CO-M8x25-S1(C)       ', N'Bulong M8x25 LGC côn inox', N'Bulong', N'xXx', N'Con', 45, N'R7-9      ', 7182)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-CO-M8x35-M(C)        ', N'Bulong M8x35 côn mạ', N'Bulong', N'xXx', N'Con', 320, N'R7-10     ', 6412)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-CO-M8x20-M(C)        ', N'Bulong M8x20 LGC côn mạ', N'Bulong', N'xXx', N'Con', 980, N'R7-11     ', 31806)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-CA-M8x30-M(C)        ', N'Bulong M8x30 LGC cầu mạ', N'Bulong', N'xXx', N'Con', 80, N'R7-12     ', 15390)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-CA-M8x20-M(C)        ', N'Bulong M8x20 LGC cầu mạ', N'Bulong', N'xXx', N'Con', 120, N'R7-13     ', 15390)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-TR-M8X20-S           ', N'Bulong M8x20 LG trụ  inox', N'Bulong', N'xXx', N'Con', 600, N'R7-14     ', 15390)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-TR-M8x50-S1(C)       ', N'Bulong M8x50 LGC trụ inox', N'Bulong', N'xXx', N'Con', 300, N'R7-15     ', 15390)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-LGN-M8x25-S1         ', N'Bulong M8x25 LGN inox', N'Bulong', N'xXx', N'Con', 80, N'R7-16     ', 6412)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-CA-M8x60-S1(C)       ', N'Bulong M8x60 LGC cầu inox', N'Bulong', N'xXx', N'Con', 250, N'R7-17     ', 15390)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-LGN- M8x15-S1(C)     ', N'Bulong M8x15 LGN inox', N'Bulong', N'xXx', N'Con', 80, N'R7-18     ', 15390)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-LGN-M8x30-S1(C)      ', N'Bulong M8x30 LGN inox', N'Bulong', N'xXx', N'Con', 84, N'R7-19     ', 15390)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-CA-M8x40-M(C)        ', N'Bulong M8x40 LGC cầu mạ', N'Bulong', N'xXx', N'Con', 320, N'R7-20     ', 15390)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-TR-M8x100-M(C)       ', N'Bulong  M8x100 LGC trụ mạ', N'Bulong', N'xXx', N'Con', 810, N'R11-1     ', 23598)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-LGN-M10X110-M(C)     ', N'Bulong M10x110 LGN mạ', N'Bulong', N'xXx', N'Con', 90, N'R11-2     ', 23598)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-LGN-M8x30-M(C)       ', N'Bulong M8x30 LGN mạ', N'Bulong', N'xXx', N'Con', 140, N'R11-3     ', 23598)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-TR-M8x35-M(C)        ', N'Bulong M8x35 LGC trụ mạ', N'Bulong', N'xXx', N'Con', 470, N'R11-4     ', 23598)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-CA-M8x50-M(C)        ', N'Bulong M8x50 LGC cầu  mạ', N'Bulong', N'xXx', N'Con', 400, N'R11-5     ', 23598)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-TR-M8x50-M(C)        ', N'Bulong M8x50 LGC trụ mạ', N'Bulong', N'xXx', N'Con', 420, N'R11-6     ', 23598)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-LGN-M10x25-M(C)      ', N'Bulong M10x25 LGN mạ', N'Bulong', N'xXx', N'Con', 800, N'R11-7     ', 23598)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-LGN-M8x15-M(C)       ', N'Bulong M8x15 LGN mạ', N'Bulong', N'xXx', N'Con', 1200, N'R11-8     ', 15390)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-TR-M8x45-S1          ', N'Bulong M8x45 LGC trụ Inox', N'Bulong', N'xXx', N'Con', 60, N'R11-9     ', 7182)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-CO-M8x25-M(C)        ', N'Bulong M8x25 LGC côn mạ', N'Bulong', N'xXx', N'Con', 280, N'R11-10    ', 15390)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'VEH-M10-M                ', N'Vênh M10 mạ', N'Bulong', N'xXx', N'Con', 1700, N'R1-3      ', 3933)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'PHA-M10-S4               ', N'Phẳng M10 Inox 304', N'Bulong', N'xXx', N'Con', 2500, N'R1-7      ', 3933)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'VEH-M10-S1               ', N'vênh 10 inox', N'Bulong', N'xXx', N'Con', 2200, N'R1-8      ', 3933)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'PHA-M10-S1               ', N'phẳng 10 inox', N'Bulong', N'xXx', N'Con', 3000, N'R1-9      ', 3933)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'VEH-M8-S1                ', N'Vênh 8 inox', N'Bulong', N'xXx', N'Con', 3000, N'R1-10     ', 3933)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'ECU-M8-S1                ', N'Ecu 8 inox', N'Bulong', N'xXx', N'Con', 1100, N'R1-11     ', 3933)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'PHA-M8-S1                ', N'phẳng 8 inox', N'Bulong', N'xXx', N'Con', 275, N'R1-12     ', 3933)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'ECU-M8-S4                ', N'ECU M8 Inox 304', N'Bulong', N'xXx', N'Con', 80, N'R1-13     ', 3933)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'CCH-V-M8-M               ', N'Con Chạy Vuông M8', N'Bulong', N'xXx', N'Con', 1200, N'R1-14     ', 3933)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'ECUH-M8-M                ', N'Ecu M8 keo tán nhựa', N'Bulong', N'xXx', N'Con', 200, N'R1-15     ', 3933)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'VEH-M8-M                 ', N'Vênh M8 mạ', N'Bulong', N'xXx', N'Con', 2000, N'R1-16     ', 12312)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-LGN-M8x100-M(C)      ', N'Bulong M8x100 LGN mạ', N'Bulong', N'xXx', N'Con', 60, N'R11-11    ', 15390)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-LGN-M8X12-S1         ', N'bulong M8x12 lgn inox', N'Bulong', N'xXx', N'Con', 220, N'R11-12    ', 15390)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-CA-M8x12-M(C)        ', N'Bulong M8x12 LGC cầu mạ', N'Bulong', N'xXx', N'Con', 1050, N'R11-14    ', 6412)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-CO-M8x35-S1          ', N'Bulong M8x12 LGC cầu inox', N'Bulong', N'xXx', N'Con', 19, N'R11-15    ', 6412)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-LGN-M8x40-S1(C)      ', N'Bulong m8x40 LGN inox', N'Bulong', N'xXx', N'Con', 150, N'R11-16    ', 15390)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-CA-M8x15-S1          ', N'Bulong M8x15 LGC cầu inox', N'Bulong', N'xXx', N'Con', 270, N'R11-17    ', 6412)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-TR-M8x30-S1          ', N'Bulong M8x30 LGC trụ inox', N'Bulong', N'xXx', N'Con', 70, N'R11-18    ', 15390)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-TR-M8X40-S1          ', N'Bulong M8x40 LG trụ inox', N'Bulong', N'xXx', N'Con', 70, N'R11-19    ', 15390)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-LGN-M8X35-M          ', N'Bulong M8x35 LGN mạ', N'Bulong', N'xXx', N'Con', 150, N'R11-20    ', 15390)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-CO-M8X50-M           ', N'Bulong M8x35 LG côn mạ', N'Bulong', N'xXx', N'Con', 150, N'R11-21    ', 6412)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-TR-M6x30-M(C)        ', N'Bulong M6x30 LGC trụ mạ', N'Bulong', N'xXx', N'Con', 3000, N'R13-1     ', 48222)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-TR-M6x35-M(C)        ', N'Bulong M6x35 LGC trụ mạ', N'Bulong', N'xXx', N'Con', 2200, N'R13-2     ', 23598)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-LGN-M6x25-S1(C)      ', N'Bulong M6x25 LGN inox', N'Bulong', N'xXx', N'Con', 1350, N'R13-3     ', 23598)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-CA-M6x12-M(C)        ', N'Bulong M6x12 LG cầu mạ', N'Bulong', N'xXx', N'Con', 3300, N'R13-4     ', 9832)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-CA-M6x50-M(C)        ', N'Bulong M6x50 LG cầu mạ', N'Bulong', N'xXx', N'Con', 700, N'R13-5     ', 9832)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-CO-M6X25-M           ', N'bulong m6x25 lg côn mạ', N'Bulong', N'xXx', N'Con', 1000, N'R13-7     ', 23598)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-LGN-M6X10-M          ', N'Bulong m6x10 LGN mạ', N'Bulong', N'xXx', N'Con', 500, N'R13-8     ', 23598)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-LGN-M8X45-M          ', N'Bulong m8x45 LGN mạ', N'Bulong', N'xXx', N'Con', 250, N'R13-9     ', 15390)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-LGN-M8x12-M(C)       ', N'Bulong m8x12 LGN mạ', N'Bulong', N'xXx', N'Con', 410, N'R13-10    ', 15390)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-TR-M8x100-M(C)       ', N'Bulong  M8x100 LGC trụ mạ', N'Bulong', N'xXx', N'Con', 32, N'R13-11    ', 23598)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-TR-M8X70-S1(C)       ', N'Bulong m8x70 LG trụ inox', N'Bulong', N'xXx', N'Con', 35, N'R13-12    ', 15390)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-LGN-M8x60-M(C)       ', N'Bulong M8x60 LGN mạ', N'Bulong', N'xXx', N'Con', 65, N'R13-13    ', 15390)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-TR-M8x12-S1(C)       ', N'Bulong M8x12 LGC trụ inox', N'Bulong', N'xXx', N'Con', 220, N'R13-14    ', 15390)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-CA-M8X20-S1(C)       ', N'Bulong M8x20 chìm cầu inox', N'Bulong', N'xXx', N'Con', 150, N'R13-15    ', 15390)
GO
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-CA-M8X12-S1(C)       ', N'Bulong M8x12 LG cầu inox', N'Bulong', N'xXx', N'Con', 130, N'R13-16    ', 6412)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-LGN-M10X20-M(C)      ', N'Bulong m10x20 LGN mạ', N'Bulong', N'xXx', N'Con', 350, N'R13-18    ', 15390)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-TR-M12x50-M(C)       ', N'Bulong M12x50 LGC trụ mạ', N'Bulong', N'xXx', N'Con', 280, N'R13-6     ', 15390)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-LGN-M8x45-S1(C)      ', N'Bulong M8x45 LGN inox', N'Bulong', N'xXx', N'Con', 28, N'R13-17    ', 15390)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-LGN-M12X50-M(C)      ', N'Bulong M12x50 LGN mạ', N'Bulong', N'xXx', N'Con', 180, N'R15-1     ', 23598)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-LGN-M12x100-M(C)     ', N'Bulong M12x100 LGN mạ', N'Bulong', N'xXx', N'Con', 300, N'R15-2     ', 48222)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-CA-M6X25-M(C)        ', N'Bulong M6x25 LG cầu mạ', N'Bulong', N'xXx', N'Con', 20, N'R21-1     ', 6554)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-LGN-M6X20-M          ', N'Bulong M6x20 LGN mạ', N'Bulong', N'xXx', N'Con', 500, N'R21-2     ', 15732)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-CO-M6x20-M(C)        ', N'Bulong M6X20 LGC côn mạ', N'Bulong', N'xXx', N'Con', 35, N'R21-3     ', 15732)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-CO-M6X25-S1(C)       ', N'Bulong M6x25 LG côn Inox', N'Bulong', N'xXx', N'Con', 80, N'R21-4     ', 15732)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-TR-M6x25-M(C)        ', N'Bulong M6x25 LGC trụ mạ', N'Bulong', N'xXx', N'Con', 40, N'R21-5     ', 15732)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'CCH-V-M6-M               ', N'Con chạy vuông M6', N'Bulong', N'xXx', N'Con', 50, N'R21-6     ', 15732)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'CCH-L-M5-M               ', N'Con chạy lá M5 mạ', N'Bulong', N'xXx', N'Con', 1350, N'R21-7     ', 15732)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'ECU-M5-M                 ', N'Ecu 5 mạ', N'Bulong', N'xXx', N'Con', 750, N'R21-8     ', 15390)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'ECU-M4-S1                ', N'Ecu 4 inox', N'Bulong', N'xXx', N'Con', 220, N'R21-9     ', 15732)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'ECU-M4-M                 ', N'Ecu 4 mạ', N'Bulong', N'xXx', N'Con', 700, N'R21-10    ', 15732)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-TR-M5x40-S1(C)       ', N'Bulong M5x40 LGC trụ inox', N'Bulong', N'xXx', N'Con', 110, N'R21-11    ', 15732)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-CO-M5X15-S1(C)       ', N'bulong m5x15 LG cầu inox', N'Bulong', N'xXx', N'Con', 160, N'R21-12    ', 15732)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-LGN-M5x30-M(C)       ', N'Bulong M5x30 LGN mạ', N'Bulong', N'xXx', N'Con', 250, N'R21-13    ', 15732)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-CA-M5X25-S1(C)       ', N'Bulong M5x25 LG cầu inox', N'Bulong', N'xXx', N'Con', 110, N'R21-14    ', 6554)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-TR-M5X20-S1(C)       ', N'bulong m5x20 LG Trụ inox', N'Bulong', N'xXx', N'Con', 60, N'R21-15    ', 15732)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-LGN-M5X25-M(C)       ', N'Bulong M5x25 LGN mạ', N'Bulong', N'xXx', N'Con', 450, N'R21-16    ', 15732)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-TR-M5X15-S1(C)       ', N'Bulong M5x15 LG trụ Inox', N'Bulong', N'xXx', N'Con', 120, N'R21-17    ', 15732)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-TR-M5X25-S1(C)       ', N'Bulong M5x25 LG trụ inox', N'Bulong', N'xXx', N'Con', 220, N'R21-18    ', 15732)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-CO-M5X12-S1(C)       ', N'Bulong M5x12 LG côn inox', N'Bulong', N'xXx', N'Con', 180, N'R21-19    ', 15732)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-LGN-M5x15-M(C)       ', N'Bulong M5x15 LGN mạ', N'Bulong', N'xXx', N'Con', 420, N'R21-20    ', 15732)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-LGN-M4X10- S1        ', N'Bulong m4x10 LGN Inox 201', N'Bulong', N'xXx', N'Con', 1200, N'R21-21    ', 15732)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-CO-M8x15-M(C)        ', N'Bulong M8x15 LGC côn mạ', N'Bulong', N'xXx', N'Con', 480, N'R11-13    ', 15390)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-LGN-M10x120-M(C)     ', N'Bulong M10x120 LGN mạ', N'Bulong', N'xXx', N'Con', 450, N'R15-3     ', 23598)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-TR-M4X40-S1          ', N'Bulong M4x40 LG trụ inox', N'Bulong', N'xXx', N'Con', 50, N'R21-22    ', 15732)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-LGN-M5x50-S1         ', N'Bulong M5x50 LGN Inox', N'Bulong', N'xXx', N'Con', 30, N'R21-24    ', 6554)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-LGN-M14x30-M(C)      ', N'Bulong M14x30 LGN mạ', N'Bulong', N'xXx', N'Con', 200, N'F14-1     ', 15390)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-LGN-M10x20-S1(C)     ', N'Bulong M10x20 LGN inox', N'Bulong', N'xXx', N'Con', 200, N'F14-2     ', 15732)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-LGN-M10x35-S1(C)     ', N'Bulong M10x35 LGN inox', N'Bulong', N'xXx', N'Con', 20, N'F14-3     ', 15732)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-CA-M10x25-S1(C)      ', N'Bulong m10x25 LGC cầu inox', N'Bulong', N'xXx', N'Con', 200, N'F14-4     ', 15732)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-TR-M10X25-S1(C)      ', N'Bulong M10x25 LG trụ inox', N'Bulong', N'xXx', N'Con', 120, N'F14-5     ', 15732)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-LGN-M10x80-S1(C)     ', N'Bulong M10x80 LGN inox', N'Bulong', N'xXx', N'Con', 8, N'F14-6     ', 6554)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-CA-M10x60-M(C)       ', N'Bulong M10x60 LGC cầu mạ', N'Bulong', N'xXx', N'Con', 90, N'F14-7     ', 15732)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-LGN-M10x50-M(C)      ', N'Bulong M10x50 LGN mạ', N'Bulong', N'xXx', N'Con', 55, N'F14-8     ', 15732)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-TR-M10X25-M          ', N'Bulong M10x25 LG trụ mạ', N'Bulong', N'xXx', N'Con', 96, N'F14-9     ', 15732)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-TR-M10X50-S1(C)      ', N'Bulong m10x50 LG trụ inox', N'Bulong', N'xXx', N'Con', 27, N'F14-10    ', 15732)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-LGN-M10x100-M(C)     ', N'Bulong M10x100 LGN mạ', N'Bulong', N'xXx', N'Con', 50, N'F14-11    ', 15732)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-LGN-M10X15-M(C)      ', N'Bulong M10x15 LGN mạ', N'Bulong', N'xXx', N'Con', 115, N'F14-12    ', 15732)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-LGN-M10x25-S1(C)     ', N'Bulong m10x25 LGN inox 201', N'Bulong', N'xXx', N'Con', 30, N'F14-13    ', 15732)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-CA-M10X20-S1(C)      ', N'Bulong M10x20 LG cầu inox', N'Bulong', N'xXx', N'Con', 230, N'F14-14    ', 15732)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-CA-M10x15-M(C)       ', N'Bulong M10x15 LGC cầu mạ', N'Bulong', N'xXx', N'Con', 40, N'F14-15    ', 15732)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-CA-M10x20-M(C)       ', N'Bulong M10x20 LG cầu mạ', N'Bulong', N'xXx', N'Con', 250, N'F14-16    ', 6554)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-LGN-M10x90-M(C)      ', N'Bulong M10x90 LGN mạ', N'Bulong', N'xXx', N'Con', 14, N'F14-17    ', 15732)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-LGN-M10x30-S1(C)     ', N'BL M10x30 LGN inox', N'Bulong', N'xXx', N'Con', 15, N'F14-18    ', 15732)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-TR-M20x50-M(C)       ', N'Bulong M20x50 LG Trụ mạ', N'Bulong', N'xXx', N'Con', 13, N'F14-21    ', 15732)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-LGN-M20x60-M(C)      ', N'Bulong M20x60 LGN mạ', N'Bulong', N'xXx', N'Con', 10, N'F14-22    ', 15732)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-LGN-M18x150-M(C)     ', N'Bulong M18x150 LGN mạ', N'Bulong', N'xXx', N'Con', 7, N'F14-23    ', 15732)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-TR-M10x15-Ð(C)       ', N'Bulong M10x15 LG trụ đen', N'Bulong', N'xXx', N'Con', 300, N'F14-20    ', 15732)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-LGN-M10x25-Ð(C)      ', N'Bulong M10x25 LGN thép đen', N'Bulong', N'xXx', N'Con', 50, N'F14-19    ', 6554)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-CA-M8x25-S1          ', N'Bulong M8x25 LGC cầu inox', N'Bulong', N'xXx', N'Con', 30, N'F22-1     ', 6554)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-CO-M8x15-M(C)        ', N'Bulong M8x15 LGC côn mạ', N'Bulong', N'xXx', N'Con', 25, N'F22-2     ', 15390)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-LGN-M10X30-M(C)      ', N'Bulong M10x30 LGN mạ', N'Bulong', N'xXx', N'Con', 30, N'F22-3     ', 15732)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-TR-M6x50-S1(C)       ', N'Bulong M6x50 LG trụ inox', N'Bulong', N'xXx', N'Con', 20, N'F22-4     ', 6554)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-RL-TR-M10x60-M       ', N'Bulong M10x60 LG Trụ mạ ren lửng', N'Bulong', N'xXx', N'Con', 18, N'F22-5     ', 6554)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-LGN-M8X12-S1         ', N'bulong M8x12 lgn inox', N'Bulong', N'xXx', N'Con', 50, N'F22-6     ', 15390)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-TR-M5x55-S1          ', N'Bulong M5x55 LGC trụ inox', N'Bulong', N'xXx', N'Con', 70, N'F22-7     ', 6554)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-CO-M5X20-S1(C)       ', N'Bulong M5x20 LG côn  inox', N'Bulong', N'xXx', N'Con', 50, N'F22-8     ', 15732)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-CA-VIT-M4x25-M       ', N'Bulong M4x25 LGC cầu tô vít mạ', N'Bulong', N'xXx', N'Con', 310, N'R21-23    ', 6554)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-CA-M12x25-S1(C)      ', N'Bulong M12x25, LGC inox đàu chỏm cầu', N'Bulong', N'xXx', N'Con', 300, N'R15-4     ', 23598)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-LGN-M12X80-M(C)      ', N'Bulong M12x80 LGN mạ', N'Bulong', N'xXx', N'Con', 160, N'R15-5     ', 23598)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-CA-M12x25-M(C)       ', N'Bulong  M12x25 LGC cầu mạ', N'Bulong', N'xXx', N'Con', 230, N'R15-6     ', 23598)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-LGN-M14x50-M(C)      ', N'bulong M14x50 LGN mạ', N'Bulong', N'xXx', N'Con', 49, N'R15-7     ', 15390)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-TR-M12x60-S1(C)      ', N'Bulong M12x60 LGC trụ Inox', N'Bulong', N'xXx', N'Con', 33, N'R15-8     ', 7182)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-TR-M12x100-S1        ', N'Bulong M12x100 LG trụ inox', N'Bulong', N'xXx', N'Con', 28, N'R15-9     ', 15390)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-CA-M12x30-S1         ', N'Bulong M12x30 LGC cầu Inox', N'Bulong', N'xXx', N'Con', 120, N'R15-10    ', 6412)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-LGN-M12X80 -S1(C)    ', N'Bulong M12x80 LGN inox', N'Bulong', N'xXx', N'Con', 10, N'R15-11    ', 15390)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-LGN-M12X60-M(C)      ', N'Bulong M12x60 LGN mạ', N'Bulong', N'xXx', N'Con', 140, N'R15-12    ', 15390)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-LGN-M12x40-M(C)      ', N'Bulong m12x40 LGN mạ', N'Bulong', N'xXx', N'Con', 70, N'R15-13    ', 15390)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-TR-M12x20-M(C)       ', N'Bulong M12x20 LG trụ mạ', N'Bulong', N'xXx', N'Con', 39, N'R15-14    ', 6412)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-LGN-M12x20-S1(C)     ', N'Bulong M12x20 LGN inox', N'Bulong', N'xXx', N'Con', 35, N'R15-15    ', 15390)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-LGN-M12x30-M(C)      ', N'Bulong M12x30 LGN mạ', N'Bulong', N'xXx', N'Con', 25, N'R15-16    ', 15390)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-LGN-M12x100-S4(C)    ', N'Bulong M12x100 LGN inox 304', N'Bulong', N'xXx', N'Con', 75, N'R15-17    ', 15390)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-TR-M12X60-M(C)       ', N'Bulong M12x60 LG trụ mạ', N'Bulong', N'xXx', N'Con', 90, N'R15-18    ', 15390)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-LGN-M12X80-M(C)      ', N'Bulong M12x80 LGN mạ', N'Bulong', N'xXx', N'Con', 78, N'R15-19    ', 23598)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-LGN-M12X45-M( C)     ', N'Bulong m12x45 LGN mạ', N'Bulong', N'xXx', N'Con', 20, N'R15-20    ', 15390)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-LGN-M6x40-M(C)       ', N'Bulong M6x40 LGN mạ', N'Bulong', N'xXx', N'Con', 2800, N'R17-1     ', 48222)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-LGN-M16X20-M(C)      ', N'Bulong M16x30 LGN mạ', N'Bulong', N'xXx', N'Con', 500, N'R17-2     ', 48222)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-LGN-M14X60-M         ', N'Bulong M14x60 LGN mạ', N'Bulong', N'xXx', N'Con', 120, N'R17-3     ', 23598)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-LGN-M16x100-M(C)     ', N'Bulong M16x100 LGN mạ', N'Bulong', N'xXx', N'Con', 240, N'R17-4     ', 48222)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-LGN-M16x150-M(C)     ', N'Bulong M16x150 LGN mạ', N'Bulong', N'xXx', N'Con', 72, N'R17-5     ', 15390)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-LGN-M16x120-M(C)     ', N'Bulong M16x120 LGN mạ', N'Bulong', N'xXx', N'Con', 40, N'R17-6     ', 7182)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-LGN-M16X70-M(C)      ', N'Bulong M16x70 LGN mạ', N'Bulong', N'xXx', N'Con', 130, N'R17-7     ', 15390)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-LGN-M16x50-M(C)      ', N'Bulong M16x50 LGN mạ', N'Bulong', N'xXx', N'Con', 40, N'R17-8     ', 15390)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'CCH-B-M8-S1              ', N'Con chạy bi M8 inox', N'Bulong', N'xXx', N'Con', 1, N'R17-9     ', 6412)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-LGN-M16x100-S1(C)    ', N'Bulong M16x100 LGN inox', N'Bulong', N'xXx', N'Con', 15, N'R17-10    ', 6412)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-LGN-M14x80-M(C)      ', N'Bulong M14x80 LGN mạ', N'Bulong', N'xXx', N'Con', 18, N'R17-11    ', 15390)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-LGN-M16X80-M(C)      ', N'bulong m16x80 LGN mạ', N'Bulong', N'xXx', N'Con', 35, N'R17-12    ', 15390)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-LGN-M16x150-S4       ', N'Bulong M16x150 LGN inox 304', N'Bulong', N'xXx', N'Con', 7, N'R17-13    ', 15390)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-TR-M16x60-M(C)       ', N'Bulong M16x60 LG trụ mạ', N'Bulong', N'xXx', N'Con', 50, N'R17-14    ', 6412)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-TR-M16x30-M          ', N'Bulong M16x30 LGC trụ mạ', N'Bulong', N'xXx', N'Con', 13, N'R17-15    ', 15390)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-CA-M16x60-M(C)       ', N'Bulong M16x60 LGC cầu mạ', N'Bulong', N'xXx', N'Con', 50, N'R17-16    ', 15390)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-LGN-M14x30-M(C)      ', N'Bulong M14x30 LGN mạ', N'Bulong', N'xXx', N'Con', 30, N'R17-17    ', 15390)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-LGN-M14x50-M(C)      ', N'bulong M14x50 LGN mạ', N'Bulong', N'xXx', N'Con', 20, N'R17-18    ', 15390)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-TR-M6x35-S1(C)       ', N'Bulong M6x35 LGC trụ inox 201', N'Bulong', N'xXx', N'Con', 70, N'R19-1     ', 15732)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-LGN-M6x25-M(C)       ', N'Bulong M6x25 LGN mạ', N'Bulong', N'xXx', N'Con', 750, N'R19-2     ', 15732)
GO
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-CA-M6X25-S1(C)       ', N'Bulong M6x25 LG cầu Inox', N'Bulong', N'xXx', N'Con', 350, N'R19-3     ', 6554)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-CA-M6X15-S1(C)       ', N'Bulong M6x15 LG cầu Inox', N'Bulong', N'xXx', N'Con', 145, N'R19-4     ', 6554)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-CA-M6x10-M(C)        ', N'Bulong M6x10 LG cầu mạ', N'Bulong', N'xXx', N'Con', 30, N'R19-5     ', 6554)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-CA-M6X20-S1          ', N'Bulong M6x20 LG cầu inox', N'Bulong', N'xXx', N'Con', 950, N'R19-6     ', 6554)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-CO-M6x10-M(C)        ', N'Bulong M6x10 LGC côn mạ', N'Bulong', N'xXx', N'Con', 1300, N'R19-7     ', 15732)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-CO-M6x20-S1(C)       ', N'Bulong M6x20 LGC côn inox', N'Bulong', N'xXx', N'Con', 250, N'R19-8     ', 15732)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-LGN-M6x15-M(C)       ', N'Bulong M6x15 LGN mạ', N'Bulong', N'xXx', N'Con', 400, N'R19-9     ', 15732)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-CA-M6x40-M(C)        ', N'Bulong M6x40 LG cầu mạ', N'Bulong', N'xXx', N'Con', 980, N'R19-10    ', 6554)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-LGN-M6X50-M          ', N'Bulong m6x50 LGN mạ', N'Bulong', N'xXx', N'Con', 100, N'R19-11    ', 15732)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-TR-M6x60-M(C)        ', N'Bulong M6x60 LGC trụ mạ', N'Bulong', N'xXx', N'Con', 240, N'R19-12    ', 15732)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-LGN-M6x70-M(C)       ', N'Bulong M6x70 LGN mạ', N'Bulong', N'xXx', N'Con', 100, N'R19-13    ', 15732)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-LGN-M6X60-M(C)       ', N'Bulong M6x60 LGN mạ', N'Bulong', N'xXx', N'Con', 45, N'R19-14    ', 15732)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-CA-M6x40-S1(C)       ', N'Bulong M6x40 LG cầu inox', N'Bulong', N'xXx', N'Con', 90, N'R19-15    ', 6554)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-LGN-M6X30-S1         ', N'Bulong M6x20 LGN inox', N'Bulong', N'xXx', N'Con', 50, N'R19-16    ', 6554)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-LGN-M6x30-M(C)       ', N'Bulong M6x30 LGN mạ', N'Bulong', N'xXx', N'Con', 45, N'R19-17    ', 15732)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-CO-M6x40-S1(C)       ', N'Bulong M6x40 LGC côn inox', N'Bulong', N'xXx', N'Con', 25, N'R19-18    ', 15732)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-CO-M6X10-S1(C)       ', N'Bulong M6x10 côn inox', N'Bulong', N'xXx', N'Con', 700, N'R19-19    ', 15732)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-CO-M6X15-S1(C)       ', N'Bulong M6x15 LG côn Inox', N'Bulong', N'xXx', N'Con', 50, N'R19-20    ', 15732)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-TR-M6X12-S1          ', N'Bulong M6x12 LG Trụ inox', N'Bulong', N'xXx', N'Con', 90, N'R19-21    ', 15732)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-LGN-M6X15-S1         ', N'Bulong M6x15 LGN inox', N'Bulong', N'xXx', N'Con', 30, N'R19-22    ', 6554)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-CA-M6x30-M(C)        ', N'Bulong M6x30 LG cầu mạ', N'Bulong', N'xXx', N'Con', 900, N'R19-23    ', 6554)
INSERT [dbo].[TonKho] ([MaSp], [TenSp], [NhomSp], [Maker], [DonViTinh], [SoLuong], [ViTriO], [SoLuongMaxO]) VALUES (N'BUL-CO-M6x12-M(C)        ', N'Bulong M6x12 LGC côn mạ', N'Bulong', N'xXx', N'Con', 330, N'R19-24    ', 15732)
GO
ALTER TABLE [dbo].[DsNhapHang]  WITH CHECK ADD FOREIGN KEY([ViTriO])
REFERENCES [dbo].[CAUHINHKHAY] ([ViTriO])
GO
ALTER TABLE [dbo].[DSSANPHAM]  WITH CHECK ADD FOREIGN KEY([DonViTinh])
REFERENCES [dbo].[DONVITINH] ([DonViTinh])
GO
ALTER TABLE [dbo].[DSSANPHAM]  WITH CHECK ADD FOREIGN KEY([NhomSp])
REFERENCES [dbo].[NHOMSP] ([NhomSp])
GO
ALTER TABLE [dbo].[DsXuatHang]  WITH CHECK ADD FOREIGN KEY([MaSp])
REFERENCES [dbo].[DSSANPHAM] ([MaSp])
GO
ALTER TABLE [dbo].[DsXuatHang]  WITH CHECK ADD FOREIGN KEY([ViTriO])
REFERENCES [dbo].[CAUHINHKHAY] ([ViTriO])
GO
ALTER TABLE [dbo].[History]  WITH CHECK ADD FOREIGN KEY([MaSp])
REFERENCES [dbo].[DSSANPHAM] ([MaSp])
GO
ALTER TABLE [dbo].[History]  WITH CHECK ADD FOREIGN KEY([DonViTinh])
REFERENCES [dbo].[DONVITINH] ([DonViTinh])
GO
ALTER TABLE [dbo].[History]  WITH CHECK ADD FOREIGN KEY([TacVu])
REFERENCES [dbo].[TACVU] ([TacVu])
GO
ALTER TABLE [dbo].[TASK]  WITH CHECK ADD FOREIGN KEY([task])
REFERENCES [dbo].[TACVU] ([TacVu])
GO
ALTER TABLE [dbo].[TonKho]  WITH CHECK ADD FOREIGN KEY([DonViTinh])
REFERENCES [dbo].[DONVITINH] ([DonViTinh])
GO
ALTER TABLE [dbo].[TonKho]  WITH CHECK ADD FOREIGN KEY([NhomSp])
REFERENCES [dbo].[NHOMSP] ([NhomSp])
GO
ALTER TABLE [dbo].[TonKho]  WITH CHECK ADD FOREIGN KEY([MaSp])
REFERENCES [dbo].[DSSANPHAM] ([MaSp])
GO
/****** Object:  StoredProcedure [dbo].[prCheckInsertDonViTinh]    Script Date: 24/01/2022 15:55:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[prCheckInsertDonViTinh]
@DonViTinh NVARCHAR(10)
AS
BEGIN
	SELECT * FROM dbo.DONVITINH WHERE DonViTinh = @DonViTinh
END
GO
/****** Object:  StoredProcedure [dbo].[prCheckInsertDsSanPham]    Script Date: 24/01/2022 15:55:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[prCheckInsertDsSanPham]
@MaSp char(25)
AS
BEGIN

	SELECT * FROM dbo.DSSANPHAM WHERE MaSp = @MaSp;
	
END
GO
/****** Object:  StoredProcedure [dbo].[prCheckSpNhap]    Script Date: 24/01/2022 15:55:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[prCheckSpNhap]
@MaSp  char(25)
AS
BEGIN
	SELECT * FROM dbo.listNhap  WHERE MaSp = @MaSp 
END
GO
/****** Object:  StoredProcedure [dbo].[prCheckSpTonKho]    Script Date: 24/01/2022 15:55:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[prCheckSpTonKho]
@MaSp  char(25)
AS
BEGIN
	SELECT * FROM dbo.TonKho  WHERE MaSp = @MaSp 
END
GO
/****** Object:  StoredProcedure [dbo].[prCheckSpXuat]    Script Date: 24/01/2022 15:55:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[prCheckSpXuat]
@MaSp  char(25)
AS
BEGIN
	SELECT * FROM dbo.listXuat  WHERE MaSp = @MaSp 
END
GO
/****** Object:  StoredProcedure [dbo].[prCheckTonKho]    Script Date: 24/01/2022 15:55:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[prCheckTonKho]
@MaSp  char(25),
@ViTriO char(10)
AS
BEGIN
	SELECT *  FROM dbo.TonKho WHERE MaSp = @MaSp AND ViTriO = @ViTriO
END
GO
/****** Object:  StoredProcedure [dbo].[prcheckViTri]    Script Date: 24/01/2022 15:55:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[prcheckViTri]
@ViTriO  char(10)
AS
BEGIN
	SELECT * FROM  dbo.CAUHINHKHAY WHERE ViTriO = @ViTriO
END
GO
/****** Object:  StoredProcedure [dbo].[prChieuCaoKhay]    Script Date: 24/01/2022 15:55:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[prChieuCaoKhay]
@Khay char(10)
AS
BEGIN
	SELECT* FROM dbo.CAUHINHKHAY WHERE tenKhay = @Khay
END
GO
/****** Object:  StoredProcedure [dbo].[prdeleteDsNhapHang]    Script Date: 24/01/2022 15:55:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[prdeleteDsNhapHang]
@Stt INT,
@ViTriO  char(10)
AS
BEGIN
	DELETE dbo.DsNhapHang WHERE STT = @Stt and ViTriO = @ViTriO
END
GO
/****** Object:  StoredProcedure [dbo].[prdeleteDsXuatHang]    Script Date: 24/01/2022 15:55:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[prdeleteDsXuatHang]
@Stt INT,
@ViTriO  char(10)
AS
BEGIN
	DELETE dbo.DsXuatHang WHERE STT = @Stt and ViTriO = @ViTriO
END
GO
/****** Object:  StoredProcedure [dbo].[prDeleteTonKho]    Script Date: 24/01/2022 15:55:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[prDeleteTonKho]
@MaSp  char(25),
@ViTriO  char(10)
AS
BEGIN
	DELETE  dbo.TonKho WHERE MaSp =@MaSp AND ViTriO = @ViTriO
END
GO
/****** Object:  StoredProcedure [dbo].[prInsertCAUHINHKHAY]    Script Date: 24/01/2022 15:55:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[prInsertCAUHINHKHAY]
@tenKhay CHAR(10), @ViTriO CHAR(10), @locationX INT, @locationY INT, @width INT, @height INT, @chieuCao INT, @tinhTrangO int, @sttKhay INT, @sttO INT
AS
BEGIN
	INSERT INTO dbo.CAUHINHKHAY(tenKhay,ViTriO,locationX,locationY,width,height,chieuCao,tinhTrangO,sttKhay,sttO)
	VALUES
	(   @tenKhay, -- tenKhay - char(10)
	    @ViTriO, -- viTriO - char(10)
	    @locationX,  -- locationX - int
	    @locationY,  -- locationY - int
	    @width,  -- width - int
	    @height,  -- height - int
	    @chieuCao,  -- length - int
	    @tinhTrangO,  -- tinhTrangO - int
	    @sttKhay,  -- STTKhay - int
	    @sttO   -- STTVitri - int
	    )
END
GO
/****** Object:  StoredProcedure [dbo].[prInsertCauHinhKhay1]    Script Date: 24/01/2022 15:55:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROC [dbo].[prInsertCauHinhKhay1]
		@tenKhay  CHAR(10),
	    @ViTriO  CHAR(10),
	    @locationX  INT,
	    @locationy  INT,
	    @width  INT,
	    @height  INT,
		@sttKhay INT,
		@sttO INT
As
BEGIN
	INSERT dbo.CAUHINHKHAY
	(
	    tenKhay,
	    ViTriO,
	    locationX,
	    locationy,
	    width,
	    height,
	    chieuCao,
	    tinhTrangO,
	    sttKhay,
	    sttO
	)
	VALUES
	(   @tenKhay, -- tenKhay - char(10)
	    @ViTriO, -- ViTriO - char(10)
	    @locationX,  -- locationX - int
	    @locationy,  -- locationy - int
	    @width,  -- width - int
	    @height,  -- height - int
	    1,  -- chieuCao - int
	    0,  -- tinhTrangO - int
	    @sttKhay,  -- sttKhay - int
	    @sttO   -- sttO - int
	    )
	   
END
GO
/****** Object:  StoredProcedure [dbo].[prInsertDsNhapHang]    Script Date: 24/01/2022 15:55:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[prInsertDsNhapHang]
		@STT  int,
	    @MaSp  char(25),
	    @TenSp  nvarchar(100),
	    @Maker nvarchar(50),
	    @DonViTinh nvarchar(10),
	    @SoLuong  int,
	    @ViTriO char(10),
	    @SoLuongMaxO  int,
	    @DienGiai ntext,
	    @checkDay  bit
AS
BEGIN
	INSERT INTO dbo.DsNhapHang
	(
	    STT,
	    MaSp,
	    TenSp,
	    Maker,
	    DonViTinh,
	    SoLuong,
	    ViTriO,
	    SoLuongMaxO,
	    DienGiai,
	    checkDay
	)
	VALUES
	(  
		@STT,   -- STT - int
	    @MaSp,  -- MaSp - char(25)
	    @TenSp, -- TenSp - nvarchar(100)
	    @Maker, -- Maker - nvarchar(50)
	    @DonViTinh, -- DonViTinh - nvarchar(10)
	    @SoLuong,   -- SoLuong - int
	    @ViTriO,  -- ViTriO - char(10)
	    @SoLuongMaxO,   -- SoLuongMaxO - int
	    @DienGiai, -- DienGiai - ntext
	    @checkDay -- checkDay - bit
	    )
END
GO
/****** Object:  StoredProcedure [dbo].[prInsertDsSanPham]    Script Date: 24/01/2022 15:55:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[prInsertDsSanPham]
@MaSp char(25),
@TenSp nvarchar(100),
@NhomSp nvarchar(50),
@Maker nvarchar(50),
@DonViTinh nvarchar(10),
@KhoiLuong float,
@Cdai float,
@cRong float,
@cCao float,
@DonGia float,
@SoLuongTon INT,
@QuyDoi NTEXT
AS
BEGIN

	INSERT dbo.DSSANPHAM
	(
		MaSp,
		TenSp,
		NhomSp,
		Maker,
		DonViTinh,
		KhoiLuong,
		Cdai,
		cRong,
		cCao,
		DonGia,
		SoLuongTon,
		QuyDoi
	)
	VALUES
	(   
		@MaSp,  -- MaSp - char(25)
		@TenSp, -- TenSp - nvarchar(100)
		@NhomSp, -- NhomSp - nvarchar(50)
		@Maker, -- Maker - nvarchar(50)
		@DonViTinh, -- DonViTinh - nvarchar(10)
		@KhoiLuong, -- KhoiLuong - float
		@Cdai, -- Cdai - float
		@cRong, -- cRong - float
		@cCao, -- cCao - float
		@DonGia, -- DonGia - float
		@SoLuongTon,    -- SoLuongTon - int
		@QuyDoi
	)
	END
GO
/****** Object:  StoredProcedure [dbo].[prInsertDsSp]    Script Date: 24/01/2022 15:55:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[prInsertDsSp]
@MaSp  CHAR(25),
@TenSp  NVARCHAR(100)
AS
BEGIN
	INSERT dbo.DSSANPHAM
	(
	    MaSp,
	    TenSp,
	    NhomSp,
	    Maker,
	    DonViTinh,
	    KhoiLuong,
	    Cdai,
	    cRong,
	    cCao,
	    DonGia
	)
	VALUES
	(   @MaSp,  -- MaSp - char(25)
	    @TenSp, -- TenSp - nvarchar(100)
	    N'Bulong', -- NhomSp - nvarchar(50)
	    N'xXx', -- Maker - nvarchar(50)
	    N'Con', -- DonViTinh - nvarchar(10)
	    1.2, -- KhoiLuong - float
	    1, -- Cdai - float
	    0.5, -- cRong - float
	    0.5, -- cCao - float
	    200  -- DonGia - float
	    )
END
GO
/****** Object:  StoredProcedure [dbo].[prInsertDsXuatHang]    Script Date: 24/01/2022 15:55:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[prInsertDsXuatHang]
@STT  INT,
@MaSp  char(25),
@TenSp nvarchar(100),
@Maker  nvarchar(50),
@DonViTinh  nvarchar(10),
@SoLuongXuat  INT,
@ViTriO  char(10),
@SoLuongTon  INT,
@DienGiai  ntext
AS
BEGIN
	INSERT dbo.DsXuatHang
	(
	    STT,
	    MaSp,
	    TenSp,
	    Maker,
	    DonViTinh,
	    SoLuongXuat,
	    ViTriO,
	    SoLuongTon,
	    DienGiai
	)
	VALUES
	(   @STT,   -- STT - int
	    @MaSp,  -- MaSp - char(25)
	    @TenSp, -- TenSp - nvarchar(100)
	    @Maker, -- Maker - nvarchar(50)
	    @DonViTinh, -- DonViTinh - nvarchar(10)
	    @SoLuongXuat,   -- SoLuongXuat - int
	    @ViTriO,  -- ViTriO - char(10)
	    @SoLuongTon,   -- SoLuongTon - int
	    @DienGiai  -- DienGiai - ntext
	    )
END
GO
/****** Object:  StoredProcedure [dbo].[prINSERTLichSu]    Script Date: 24/01/2022 15:55:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[prINSERTLichSu]
@MaSp  char(25),
@TenSp  nvarchar(100),
@Maker  nvarchar(50),
@TacVu  nvarchar(15),
@DonViTinh  nvarchar(10),
@SoLuong  int,
@ViTriO  char(10),
@DienGiai  ntext
AS
BEGIN
	INSERT dbo.History
	(
	    Ngay,
	    MaSp,
	    TenSp,
	    Maker,
	    TacVu,
	    DonViTinh,
	    SoLuong,
	    ViTriO,
	    DienGiai
	)
	VALUES
	(   GETDATE(), -- Ngay - date
	    @MaSp,        -- MaSp - char(25)
	    @TenSp,       -- TenSp - nvarchar(100)
	    @Maker,       -- Maker - nvarchar(50)
	    @TacVu,       -- TacVu - nvarchar(15)
	    @DonViTinh,       -- DonViTinh - nvarchar(10)
	    @SoLuong,         -- SoLuong - int
	    @ViTriO,        -- ViTriO - char(10)
	    @DienGiai        -- DienGiai - ntext
	    )
END
GO
/****** Object:  StoredProcedure [dbo].[prInsertlistNhap]    Script Date: 24/01/2022 15:55:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[prInsertlistNhap]
@maSp  char(25)
AS
BEGIN
	INSERT dbo.listNhap
	(
	    MaSp,
	    SoLuong
	)
	VALUES
	(  
		@maSp, -- MaSp - char(25)
	    0   -- SoLuong - int
	)
END
GO
/****** Object:  StoredProcedure [dbo].[prInsertlistXuat]    Script Date: 24/01/2022 15:55:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[prInsertlistXuat]
@maSp  char(25)
AS
BEGIN
	INSERT dbo.listXuat
	(
	    MaSp,
	    SoLuong
	)
	VALUES
	(   @maSp, -- MaSp - char(25)
	    0   -- SoLuong - int
	    )
	
END
GO
/****** Object:  StoredProcedure [dbo].[prINSERTTASK]    Script Date: 24/01/2022 15:55:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[prINSERTTASK]
@task  nvarchar(15)
AS
BEGIN
INSERT dbo.TASK
(
    Time,
    task
)
VALUES
(   GETDATE(), -- Time - datetime
    @task        -- task - nvarchar(15)
    )
END
GO
/****** Object:  StoredProcedure [dbo].[prInsertTbBackup]    Script Date: 24/01/2022 15:55:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[prInsertTbBackup]
@TangDi  char(10),
@TangDen  char(10)
AS
BEGIN
	INSERT dbo.tbBackUp
	(
	    Ngay,
	    TangDi,
	    TangDen,
	    TrangThai
	)
	VALUES
	(   GETDATE(), -- Ngay - datetime
	    @TangDi,        -- TangDi - char(10)
	    @TangDen,        -- TangDen - char(10)
	    0       -- TrangThai - bit
	    )
END
GO
/****** Object:  StoredProcedure [dbo].[prINSERTTonKho]    Script Date: 24/01/2022 15:55:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[prINSERTTonKho]
@MaSp char(25),
@TenSp nvarchar(100),
@NhomSp nvarchar(50),
@Maker nvarchar(50),
@DonViTinh nvarchar(10),
@SoLuong int,
@ViTriO char(10),
@SoLuongMaxO  int
AS
BEGIN
	INSERT dbo.TonKho
	(
	    MaSp,
	    TenSp,
	    NhomSp,
	    Maker,
	    DonViTinh,
	    SoLuong,
	    ViTriO,
	    SoLuongMaxO
	)
	VALUES
	(   
		@MaSp,  -- MaSp - char(25)
	    @TenSp, -- TenSp - nvarchar(100)
	    @NhomSp, -- NhomSp - nvarchar(50)
	    @Maker, -- Maker - nvarchar(50)
	    @DonViTinh, -- DonViTinh - nvarchar(10)
	    @SoLuong,   -- SoLuong - int
	    @ViTriO,  -- ViTriO - char(10)
	    @SoLuongMaxO    -- SoLuongMaxO - int
	  )
END
GO
/****** Object:  StoredProcedure [dbo].[prKtSp]    Script Date: 24/01/2022 15:55:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[prKtSp]
@maSp  char(25)
AS
BEGIN
SELECT Cdai, cRong , cCao FROM dbo.DSSANPHAM  WHERE MaSp = @maSp 
END
GO
/****** Object:  StoredProcedure [dbo].[prLogin]    Script Date: 24/01/2022 15:55:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[prLogin]
	@UserName char(20),
	@Pass char(16)
AS
BEGIN
	SELECT * FROM dbo.ACCOUNT WHERE UserName =@UserName COLLATE SQL_Latin1_General_CP1_CS_AS AND Pass = @Pass COLLATE SQL_Latin1_General_CP1_CS_AS
END
GO
/****** Object:  StoredProcedure [dbo].[prMaker]    Script Date: 24/01/2022 15:55:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[prMaker]
@MaSp  char(25),
@TenSp  nvarchar(100)
AS
BEGIN
SELECT Maker, DonViTinh , SoLuongTon , DonGia , Cdai, cRong , KhoiLuong, QuyDoi FROM dbo.DSSANPHAM  WHERE MaSp = @MaSp AND TenSp = @TenSp
END
GO
/****** Object:  StoredProcedure [dbo].[prOchuaSp]    Script Date: 24/01/2022 15:55:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[prOchuaSp]
@MaSp  char(25)
AS
BEGIN
	SELECT ViTriO , SoLuong , SoLuongMaxNhap = SoLuongMaxO -SoLuong , SoLuongMaxO FROM  dbo.TonKho WHERE MaSp = @MaSp and SoLuong < SoLuongMaxO
END
GO
/****** Object:  StoredProcedure [dbo].[prOtrongCungTang]    Script Date: 24/01/2022 15:55:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[prOtrongCungTang]
@Tang  char(25)
AS
BEGIN
	SELECT * FROM  dbo.CAUHINHKHAY WHERE tenKhay = @Tang AND tinhTrangO = 0 ORDER BY sttKhay ASC , sttO ASC 
END
GO
/****** Object:  StoredProcedure [dbo].[prSoLuongTonKho]    Script Date: 24/01/2022 15:55:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[prSoLuongTonKho]
@MaSp  char(25)
AS
BEGIN
	SELECT * FROM dbo.DSSANPHAM  WHERE MaSp = @MaSp AND SoLuongTon > 0
END
GO
/****** Object:  StoredProcedure [dbo].[prTangChuaSp]    Script Date: 24/01/2022 15:55:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[prTangChuaSp]
@MaSp  char(25)
AS
BEGIN
	SELECT ViTriO FROM  dbo.TonKho WHERE MaSp = @MaSp
END
GO
/****** Object:  StoredProcedure [dbo].[prTTo]    Script Date: 24/01/2022 15:55:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[prTTo]
@ViTriO  char(10)
AS
BEGIN
	SELECT * FROM  dbo.TonKho WHERE ViTriO = @ViTriO
END
GO
/****** Object:  StoredProcedure [dbo].[prTtSanPham]    Script Date: 24/01/2022 15:55:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[prTtSanPham]
@MaSp  char(25)
AS
BEGIN
	SELECT * FROM  dbo.DSSANPHAM WHERE MaSp = @MaSp
END
GO
/****** Object:  StoredProcedure [dbo].[prUpdateBackUp]    Script Date: 24/01/2022 15:55:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[prUpdateBackUp]
@STT int
AS
BEGIN
	UPDATE dbo.tbBackUp SET TrangThai = 1 WHERE STT = @STT
END
GO
/****** Object:  StoredProcedure [dbo].[prUpdateDsSanPhamSlNhap]    Script Date: 24/01/2022 15:55:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[prUpdateDsSanPhamSlNhap]
@MaSp  char(25),
@SoLuongNhap INT
AS
BEGIN
	UPDATE dbo.DSSANPHAM SET SoLuongTon = SoLuongTon + @SoLuongNhap WHERE  MaSp = @MaSp
END
GO
/****** Object:  StoredProcedure [dbo].[prUpdateLISTKHAY]    Script Date: 24/01/2022 15:55:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[prUpdateLISTKHAY]
@TenKhay CHAR(10), @State INT, @W_Min  INT, @H_Min INT
AS
BEGIN
	UPDATE dbo.LISTKHAY SET State = @State, W_Min = @W_Min, H_Min = @H_Min WHERE TenKhay = @TenKhay
END
GO
/****** Object:  StoredProcedure [dbo].[prUpdateListNhap]    Script Date: 24/01/2022 15:55:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[prUpdateListNhap]
@MaSp  char(25),
@Soluong INT
AS
BEGIN
	UPDATE dbo.listNhap SET SoLuong = @Soluong WHERE MaSp =@MaSp
END
GO
/****** Object:  StoredProcedure [dbo].[prUpdateListXuat]    Script Date: 24/01/2022 15:55:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[prUpdateListXuat]
@MaSp  char(25),
@Soluong INT
AS
BEGIN
	UPDATE dbo.listXuat SET SoLuong = @Soluong WHERE MaSp = @MaSp
END
GO
/****** Object:  StoredProcedure [dbo].[prUpdateRemember]    Script Date: 24/01/2022 15:55:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[prUpdateRemember]
	@UserName char(20),
	@Pass char(16)
AS
BEGIN
	UPDATE dbo.ACCOUNT SET remember = 0
	UPDATE dbo.ACCOUNT SET remember = 1 WHERE UserName = @UserName AND Pass = @Pass
END
GO
/****** Object:  StoredProcedure [dbo].[prUpdateSlTonKho]    Script Date: 24/01/2022 15:55:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[prUpdateSlTonKho]
@MaSp  char(25),
@ViTriO char(10),
@SoLuongNhap INT
AS
BEGIN
	UPDATE dbo.TonKho SET SoLuong = SoLuong + @SoLuongNhap WHERE  MaSp = @MaSp  AND ViTriO = @ViTriO
END
GO
/****** Object:  StoredProcedure [dbo].[prUpdateSlTonKhoNhap]    Script Date: 24/01/2022 15:55:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[prUpdateSlTonKhoNhap]
@MaSp  char(25),
@ViTriO char(10),
@SoLuongNhap INT
AS
BEGIN
	UPDATE dbo.TonKho SET SoLuong = SoLuong + @SoLuongNhap WHERE MaSp = @MaSp AND ViTriO = @ViTriO
END
GO
/****** Object:  StoredProcedure [dbo].[prUpdateSlTonKhoXuat]    Script Date: 24/01/2022 15:55:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[prUpdateSlTonKhoXuat]
@MaSp  char(25),
@ViTriO char(10),
@SoLuongXuat INT
AS
BEGIN
	UPDATE dbo.TonKho SET SoLuong = @SoLuongXuat WHERE MaSp = @MaSp AND ViTriO = @ViTriO
END
GO
/****** Object:  StoredProcedure [dbo].[prUPDATETASK]    Script Date: 24/01/2022 15:55:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[prUPDATETASK]
@task  nvarchar(15)
AS
BEGIN
	UPDATE dbo.TASK SET task = @task
END
GO
/****** Object:  StoredProcedure [dbo].[prUpdateTONKHO]    Script Date: 24/01/2022 15:55:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[prUpdateTONKHO]
@ViTri_Old CHAR(10), @ViTri_New CHAR(10)
AS
BEGIN
	UPDATE dbo.TONKHO SET ViTriO = @ViTri_New WHERE ViTriO = @ViTri_Old
END
GO
/****** Object:  StoredProcedure [dbo].[prUpdateTtViTriChk]    Script Date: 24/01/2022 15:55:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[prUpdateTtViTriChk]
@ViTriO char(10),
@TrangThai INT
AS
BEGIN
	UPDATE dbo.CAUHINHKHAY SET tinhTrangO = @TrangThai WHERE  ViTriO = @ViTriO
END
GO
/****** Object:  StoredProcedure [dbo].[prUserLogin]    Script Date: 24/01/2022 15:55:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[prUserLogin]
	@UserName char(20),
	@Pass char(16)
AS
BEGIN
	SELECT fullName FROM dbo.ACCOUNT WHERE UserName = @UserName COLLATE SQL_Latin1_General_CP1_CS_AS AND Pass = @Pass COLLATE SQL_Latin1_General_CP1_CS_AS
END
GO
/****** Object:  StoredProcedure [dbo].[prVitriHangTon]    Script Date: 24/01/2022 15:55:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[prVitriHangTon]
@MaSp  char(25)
AS
BEGIN
	SELECT * FROM dbo.TonKho  WHERE MaSp = @MaSp 
END
GO
USE [master]
GO
ALTER DATABASE [KhoIntech22] SET  READ_WRITE 
GO
