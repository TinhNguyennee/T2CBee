USE [master]
GO
/****** Object:  Database [T2CBee2]    Script Date: 6/6/2024 3:07:54 PM ******/
CREATE DATABASE [T2CBee2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'T2CBee2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.CONGHUAN\MSSQL\DATA\T2CBee2.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'T2CBee2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.CONGHUAN\MSSQL\DATA\T2CBee2_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [T2CBee2] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [T2CBee2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [T2CBee2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [T2CBee2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [T2CBee2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [T2CBee2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [T2CBee2] SET ARITHABORT OFF 
GO
ALTER DATABASE [T2CBee2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [T2CBee2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [T2CBee2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [T2CBee2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [T2CBee2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [T2CBee2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [T2CBee2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [T2CBee2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [T2CBee2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [T2CBee2] SET  DISABLE_BROKER 
GO
ALTER DATABASE [T2CBee2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [T2CBee2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [T2CBee2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [T2CBee2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [T2CBee2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [T2CBee2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [T2CBee2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [T2CBee2] SET RECOVERY FULL 
GO
ALTER DATABASE [T2CBee2] SET  MULTI_USER 
GO
ALTER DATABASE [T2CBee2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [T2CBee2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [T2CBee2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [T2CBee2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [T2CBee2] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [T2CBee2] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'T2CBee2', N'ON'
GO
ALTER DATABASE [T2CBee2] SET QUERY_STORE = ON
GO
ALTER DATABASE [T2CBee2] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [T2CBee2]
GO
/****** Object:  Table [dbo].[AnhSanPham]    Script Date: 6/6/2024 3:07:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AnhSanPham](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ma_san_pham] [int] NULL,
	[url] [nvarchar](150) NULL,
 CONSTRAINT [PK_AnhSanPham] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BinhLuan]    Script Date: 6/6/2024 3:07:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BinhLuan](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[binh_luan] [nvarchar](255) NULL,
	[ngay_binh_luan] [date] NULL,
	[nguoi_binh_luan] [int] NULL,
	[san_pham] [int] NULL,
	[danh_gia] [smallint] NULL,
	[bao_cao_sai_pham] [bit] NULL,
 CONSTRAINT [PK_BinhLuan] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietDanhMuc]    Script Date: 6/6/2024 3:07:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietDanhMuc](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ma_san_pham] [int] NULL,
	[ma_danh_muc] [int] NULL,
 CONSTRAINT [PK_ChiTietDanhMuc] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietGioHang]    Script Date: 6/6/2024 3:07:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietGioHang](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ma_gio_hang] [int] NULL,
	[ma_san_pham] [int] NULL,
	[so_luong] [int] NULL,
	[ma_giam_gia] [char](20) NULL,
 CONSTRAINT [PK_ChiTietGioHang] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietMaGiamGia]    Script Date: 6/6/2024 3:07:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietMaGiamGia](
	[ma_san_pham] [int] NOT NULL,
	[ma_giam_gia] [char](20) NOT NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_ChiTietMaGiamGia] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DanhMuc]    Script Date: 6/6/2024 3:07:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DanhMuc](
	[ma_danh_muc] [int] IDENTITY(1,1) NOT NULL,
	[ten_danh_muc] [nvarchar](100) NULL,
	[ngay_them] [date] NULL,
	[ngay_xoa] [date] NULL,
	[ngay_cap_nhat] [date] NULL,
	[nguoi_them] [nchar](10) NULL,
 CONSTRAINT [PK_NhomSanPham] PRIMARY KEY CLUSTERED 
(
	[ma_danh_muc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GioHang]    Script Date: 6/6/2024 3:07:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GioHang](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ma_khach_hang] [int] NULL,
	[ngay_tao] [date] NULL,
	[trang_thai] [char](25) NULL,
 CONSTRAINT [PK_GioHang] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 6/6/2024 3:07:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[ma_khach_hang] [int] IDENTITY(1,1) NOT NULL,
	[ho_va_ten] [nvarchar](100) NULL,
	[password] [varchar](50) NULL,
	[email] [nvarchar](50) NULL,
	[so_dien_thoai] [char](14) NULL,
	[gioi_tinh] [bit] NULL,
	[dia_chi] [nvarchar](150) NULL,
	[ngay_sinh] [date] NULL,
	[ngay_tao] [date] NULL,
	[ngay_cap_nhat] [date] NULL,
 CONSTRAINT [PK_KhachHang] PRIMARY KEY CLUSTERED 
(
	[ma_khach_hang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MaGiamGia]    Script Date: 6/6/2024 3:07:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaGiamGia](
	[ma_giam_gia] [char](20) NOT NULL,
	[discount] [float] NULL,
	[ngay_bat_dau] [date] NULL,
	[ngay_ket_thuc] [date] NULL,
	[so_luong] [int] NULL,
	[nguoi_them] [nchar](10) NULL,
	[ngay_tao] [date] NULL,
	[ngay_cap_nhat] [date] NULL,
 CONSTRAINT [PK_Voucher] PRIMARY KEY CLUSTERED 
(
	[ma_giam_gia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhaCungCap]    Script Date: 6/6/2024 3:07:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhaCungCap](
	[ma_nha_cung_cap] [nchar](10) NOT NULL,
	[ten_nha_cung_cap] [nvarchar](150) NOT NULL,
	[ma_so_thue] [char](10) NULL,
	[so_dien_thoai] [char](14) NULL,
	[dia_chi] [nvarchar](50) NULL,
	[nguoi_them] [nchar](10) NULL,
	[ngay_them] [date] NULL,
	[ngay_cap_nhat] [date] NULL,
 CONSTRAINT [PK_NhaCungCap] PRIMARY KEY CLUSTERED 
(
	[ma_nha_cung_cap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 6/6/2024 3:07:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVien](
	[ma_nhan_vien] [nchar](10) NOT NULL,
	[ho_ten] [nvarchar](70) NULL,
	[chuc_vu] [bit] NULL,
	[dia_chi] [nvarchar](150) NULL,
	[email] [varchar](100) NULL,
	[gioi_tinh] [bit] NULL,
	[so_dien_thoai] [char](14) NULL,
	[ngay_vao] [date] NULL,
	[ngay_cap_nhat] [date] NULL,
	[mat_khau] [varchar](255) NULL,
 CONSTRAINT [PK_NhanVien] PRIMARY KEY CLUSTERED 
(
	[ma_nhan_vien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhieuNhapHang]    Script Date: 6/6/2024 3:07:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhieuNhapHang](
	[ma_phieu_nhap] [char](10) NOT NULL,
	[nha_cung_cap] [nchar](10) NULL,
	[trang_thai] [nvarchar](20) NULL,
	[nguoi_nhap] [nchar](10) NULL,
	[ngay_nhap] [date] NULL,
	[ngay_cap_nhat] [date] NULL,
 CONSTRAINT [PK_PhieuNhapHang] PRIMARY KEY CLUSTERED 
(
	[ma_phieu_nhap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 6/6/2024 3:07:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[ma_san_pham] [int] IDENTITY(1,1) NOT NULL,
	[ten_san_pham] [nvarchar](150) NULL,
	[group_id] [nchar](10) NULL,
	[gia_ban] [float] NULL,
	[so_luong] [int] NULL,
	[mo_ta] [nvarchar](max) NULL,
	[thuong_hieu] [nchar](10) NULL,
	[trong_luong] [float] NULL,
	[kich_thuoc] [varchar](20) NULL,
	[nguoi_them] [nchar](10) NULL,
	[hien_thi] [bit] NULL,
	[phieu_nhap] [char](10) NULL,
	[ngay_tao] [date] NULL,
	[ngay_cap_nhat] [nchar](10) NULL,
	[phan_loai] [nvarchar](50) NULL,
	[trang_thai] [nchar](10) NULL,
 CONSTRAINT [PK_SanPham] PRIMARY KEY CLUSTERED 
(
	[ma_san_pham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SanPhamYeuThich]    Script Date: 6/6/2024 3:07:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPhamYeuThich](
	[ma_khach_hang] [int] NULL,
	[ma_san_pham] [int] NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_SanPhamYeuThich] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ThuongHieu]    Script Date: 6/6/2024 3:07:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThuongHieu](
	[ma_thuong_hieu] [nchar](10) NOT NULL,
	[ten_thuong_hieu] [nvarchar](50) NULL,
	[ngay_them] [date] NULL,
	[ngay_cap_nhat] [date] NULL,
	[nguoi_them] [nchar](10) NULL,
 CONSTRAINT [PK_ThuongHieu] PRIMARY KEY CLUSTERED 
(
	[ma_thuong_hieu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[AnhSanPham] ON 

INSERT [dbo].[AnhSanPham] ([id], [ma_san_pham], [url]) VALUES (6, 1, N'https:\/\/i.ibb.co\/8PrF3Q2\/18fa48fdb577.webp')
INSERT [dbo].[AnhSanPham] ([id], [ma_san_pham], [url]) VALUES (7, 1, N'https:\/\/i.ibb.co\/VJq4ST9\/b098968d8fa8.png')
INSERT [dbo].[AnhSanPham] ([id], [ma_san_pham], [url]) VALUES (12, 1, N'http://ginza.mallthemes.com/wp-content/uploads/2019/01/product15.jpg')
INSERT [dbo].[AnhSanPham] ([id], [ma_san_pham], [url]) VALUES (14, 3, N'http://ginza.mallthemes.com/wp-content/uploads/2019/01/product02-300x400.jpg')
INSERT [dbo].[AnhSanPham] ([id], [ma_san_pham], [url]) VALUES (17, 3, N'http://ginza.mallthemes.com/wp-content/uploads/2019/01/product01.jpg')
INSERT [dbo].[AnhSanPham] ([id], [ma_san_pham], [url]) VALUES (18, 8, N'https:\/\/i.ibb.co\/LC87t6n\/b97678bb48de.jpg')
INSERT [dbo].[AnhSanPham] ([id], [ma_san_pham], [url]) VALUES (19, 8, N'https:\/\/i.ibb.co\/VL3HLpG\/7d5e3fbb6d18.jpg')
INSERT [dbo].[AnhSanPham] ([id], [ma_san_pham], [url]) VALUES (20, 8, N'https:\/\/i.ibb.co\/gDbjSCj\/382b6ab9e6fd.jpg')
INSERT [dbo].[AnhSanPham] ([id], [ma_san_pham], [url]) VALUES (21, 8, N'https:\/\/i.ibb.co\/jhrDjJD\/7eae263cc1c9.jpg')
INSERT [dbo].[AnhSanPham] ([id], [ma_san_pham], [url]) VALUES (24, 10, N'https:\/\/i.ibb.co\/VggQdD8\/27ebb72b709d.jpg')
INSERT [dbo].[AnhSanPham] ([id], [ma_san_pham], [url]) VALUES (25, 10, N'https:\/\/i.ibb.co\/t2m8B08\/e836dcadfab5.jpg')
INSERT [dbo].[AnhSanPham] ([id], [ma_san_pham], [url]) VALUES (26, 11, N'https:\/\/i.ibb.co\/0MpybB9\/09e5a2924786.jpg')
INSERT [dbo].[AnhSanPham] ([id], [ma_san_pham], [url]) VALUES (27, 11, N'https:\/\/i.ibb.co\/PzLmPhF\/b4a5d42a499c.jpg')
INSERT [dbo].[AnhSanPham] ([id], [ma_san_pham], [url]) VALUES (28, 12, N'https:\/\/i.ibb.co\/MNt1vwG\/a7b626faa291.jpg')
INSERT [dbo].[AnhSanPham] ([id], [ma_san_pham], [url]) VALUES (29, 12, N'https:\/\/i.ibb.co\/HnDz4h9\/25598fdb3bbc.jpg')
INSERT [dbo].[AnhSanPham] ([id], [ma_san_pham], [url]) VALUES (30, 13, N'https:\/\/i.ibb.co\/hH9D2sD\/f214ad1d970e.jpg')
INSERT [dbo].[AnhSanPham] ([id], [ma_san_pham], [url]) VALUES (31, 13, N'https:\/\/i.ibb.co\/DK4GBhp\/363a5fc9b79d.jpg')
INSERT [dbo].[AnhSanPham] ([id], [ma_san_pham], [url]) VALUES (32, 13, N'https:\/\/i.ibb.co\/znVTy4b\/1db90edcbd0e.jpg')
INSERT [dbo].[AnhSanPham] ([id], [ma_san_pham], [url]) VALUES (33, 13, N'https:\/\/i.ibb.co\/g4HBkjP\/8566e883c518.jpg')
INSERT [dbo].[AnhSanPham] ([id], [ma_san_pham], [url]) VALUES (34, 14, N'https:\/\/i.ibb.co\/711d7Mw\/0fa65d81118c.jpg')
INSERT [dbo].[AnhSanPham] ([id], [ma_san_pham], [url]) VALUES (35, 14, N'https:\/\/i.ibb.co\/TR2t1ft\/7ac02e9be680.jpg')
INSERT [dbo].[AnhSanPham] ([id], [ma_san_pham], [url]) VALUES (36, 15, N'https:\/\/i.ibb.co\/rfhfRD9\/8a7bf157cfb9.jpg')
INSERT [dbo].[AnhSanPham] ([id], [ma_san_pham], [url]) VALUES (37, 15, N'https:\/\/i.ibb.co\/TMHK5M8\/1ee965c8e4ab.jpg')
INSERT [dbo].[AnhSanPham] ([id], [ma_san_pham], [url]) VALUES (38, 15, N'https:\/\/i.ibb.co\/9n70XJW\/1711e5a539bd.jpg')
INSERT [dbo].[AnhSanPham] ([id], [ma_san_pham], [url]) VALUES (39, 15, N'https:\/\/i.ibb.co\/KNN686d\/5d027ae6bc4b.jpg')
INSERT [dbo].[AnhSanPham] ([id], [ma_san_pham], [url]) VALUES (40, 15, N'https:\/\/i.ibb.co\/vP0kpz1\/c58e38503ff9.jpg')
INSERT [dbo].[AnhSanPham] ([id], [ma_san_pham], [url]) VALUES (41, 16, N'https:\/\/i.ibb.co\/XF6Q5ks\/65e1369c5186.jpg')
INSERT [dbo].[AnhSanPham] ([id], [ma_san_pham], [url]) VALUES (42, 16, N'https:\/\/i.ibb.co\/2SgLbtx\/8efe45350e89.jpg')
INSERT [dbo].[AnhSanPham] ([id], [ma_san_pham], [url]) VALUES (43, 17, N'https:\/\/i.ibb.co\/McKYkpK\/c34dc11a2bc4.jpg')
INSERT [dbo].[AnhSanPham] ([id], [ma_san_pham], [url]) VALUES (44, 18, N'https:\/\/i.ibb.co\/XXP6sGY\/4318501cadd2.jpg')
INSERT [dbo].[AnhSanPham] ([id], [ma_san_pham], [url]) VALUES (45, 18, N'https:\/\/i.ibb.co\/tHGhhW2\/32901ec59b85.jpg')
INSERT [dbo].[AnhSanPham] ([id], [ma_san_pham], [url]) VALUES (46, 18, N'https:\/\/i.ibb.co\/9tmVrgb\/60a307930e6c.jpg')
INSERT [dbo].[AnhSanPham] ([id], [ma_san_pham], [url]) VALUES (47, 18, N'https:\/\/i.ibb.co\/71ZhttX\/cf23d6e0299a.jpg')
INSERT [dbo].[AnhSanPham] ([id], [ma_san_pham], [url]) VALUES (48, 19, N'https:\/\/i.ibb.co\/D9DqfZd\/22e6bf5f919f.jpg')
INSERT [dbo].[AnhSanPham] ([id], [ma_san_pham], [url]) VALUES (49, 19, N'https:\/\/i.ibb.co\/x82P7Mh\/6e4f864b7cad.jpg')
INSERT [dbo].[AnhSanPham] ([id], [ma_san_pham], [url]) VALUES (50, 19, N'https:\/\/i.ibb.co\/Ltj6vTQ\/0e578ff35e2f.jpg')
INSERT [dbo].[AnhSanPham] ([id], [ma_san_pham], [url]) VALUES (51, 20, N'https:\/\/i.ibb.co\/C9XQg3G\/f851f054bac9.jpg')
INSERT [dbo].[AnhSanPham] ([id], [ma_san_pham], [url]) VALUES (52, 20, N'https:\/\/i.ibb.co\/SVhs7Vg\/7ee5c73ca4d0.jpg')
INSERT [dbo].[AnhSanPham] ([id], [ma_san_pham], [url]) VALUES (53, 21, N'https:\/\/i.ibb.co\/RPdnfhK\/d7a7a145b15f.jpg')
INSERT [dbo].[AnhSanPham] ([id], [ma_san_pham], [url]) VALUES (54, 21, N'https:\/\/i.ibb.co\/vxJY32W\/493511039003.jpg')
INSERT [dbo].[AnhSanPham] ([id], [ma_san_pham], [url]) VALUES (55, 21, N'https:\/\/i.ibb.co\/cFKhL11\/5b257d5790c2.jpg')
INSERT [dbo].[AnhSanPham] ([id], [ma_san_pham], [url]) VALUES (56, 22, N'https:\/\/i.ibb.co\/7X2wnJS\/6ab5ad8e753a.jpg')
INSERT [dbo].[AnhSanPham] ([id], [ma_san_pham], [url]) VALUES (57, 22, N'https:\/\/i.ibb.co\/Sdh6Ynn\/5a8cda081024.jpg')
INSERT [dbo].[AnhSanPham] ([id], [ma_san_pham], [url]) VALUES (58, 23, N'https:\/\/i.ibb.co\/Nncpm3Q\/8a0e99088dfc.jpg')
INSERT [dbo].[AnhSanPham] ([id], [ma_san_pham], [url]) VALUES (59, 23, N'https:\/\/i.ibb.co\/NnVhDBd\/2e41967678c1.jpg')
INSERT [dbo].[AnhSanPham] ([id], [ma_san_pham], [url]) VALUES (60, 23, N'https:\/\/i.ibb.co\/yBCT7yz\/deb69972dbbe.jpg')
INSERT [dbo].[AnhSanPham] ([id], [ma_san_pham], [url]) VALUES (61, 24, N'https:\/\/i.ibb.co\/2Yf9qTt\/612be19c9ec9.jpg')
INSERT [dbo].[AnhSanPham] ([id], [ma_san_pham], [url]) VALUES (62, 25, N'https:\/\/i.ibb.co\/wp2F5Nq\/6050d41d3377.jpg')
INSERT [dbo].[AnhSanPham] ([id], [ma_san_pham], [url]) VALUES (63, 26, N'https:\/\/i.ibb.co\/MkC3F3S\/eef54236c47c.jpg')
INSERT [dbo].[AnhSanPham] ([id], [ma_san_pham], [url]) VALUES (64, 26, N'https:\/\/i.ibb.co\/zh6H4yf\/2aecb4c28809.jpg')
INSERT [dbo].[AnhSanPham] ([id], [ma_san_pham], [url]) VALUES (65, 26, N'https:\/\/i.ibb.co\/98Y92nt\/b3c4899c1e14.jpg')
INSERT [dbo].[AnhSanPham] ([id], [ma_san_pham], [url]) VALUES (66, 26, N'https:\/\/i.ibb.co\/XFh5H5f\/e28bd5b3f779.jpg')
INSERT [dbo].[AnhSanPham] ([id], [ma_san_pham], [url]) VALUES (67, 27, N'https:\/\/i.ibb.co\/KL0H41p\/faaff5a84d4c.jpg')
INSERT [dbo].[AnhSanPham] ([id], [ma_san_pham], [url]) VALUES (68, 27, N'https:\/\/i.ibb.co\/d4yCb1x\/de51bba4a3a7.jpg')
INSERT [dbo].[AnhSanPham] ([id], [ma_san_pham], [url]) VALUES (69, 28, N'https:\/\/i.ibb.co\/wwRYnND\/ccea9a2b3766.jpg')
INSERT [dbo].[AnhSanPham] ([id], [ma_san_pham], [url]) VALUES (70, 28, N'https:\/\/i.ibb.co\/0GmVcZs\/ebe525e5d033.jpg')
INSERT [dbo].[AnhSanPham] ([id], [ma_san_pham], [url]) VALUES (71, 28, N'https:\/\/i.ibb.co\/LCr19rv\/9a3aedc290d2.jpg')
INSERT [dbo].[AnhSanPham] ([id], [ma_san_pham], [url]) VALUES (72, 28, N'https:\/\/i.ibb.co\/LCr19rv\/9a3aedc290d2.jpg')
INSERT [dbo].[AnhSanPham] ([id], [ma_san_pham], [url]) VALUES (73, 29, N'https:\/\/i.ibb.co\/Dt4hpKj\/3720ec02c3fd.jpg')
INSERT [dbo].[AnhSanPham] ([id], [ma_san_pham], [url]) VALUES (74, 29, N'https:\/\/i.ibb.co\/k3xnxkK\/295280a3a439.jpg')
INSERT [dbo].[AnhSanPham] ([id], [ma_san_pham], [url]) VALUES (75, 29, N'https:\/\/i.ibb.co\/QYtxjLd\/9fe4a9b9a9c8.jpg')
INSERT [dbo].[AnhSanPham] ([id], [ma_san_pham], [url]) VALUES (76, 30, N'https:\/\/i.ibb.co\/KX8FTqw\/2983767e3f3e.jpg')
INSERT [dbo].[AnhSanPham] ([id], [ma_san_pham], [url]) VALUES (77, 30, N'https:\/\/i.ibb.co\/MkBmYPW\/5bb7d3c814c6.jpg')
INSERT [dbo].[AnhSanPham] ([id], [ma_san_pham], [url]) VALUES (78, 30, N'https:\/\/i.ibb.co\/yB22pG2\/b7f2820c3600.jpg')
INSERT [dbo].[AnhSanPham] ([id], [ma_san_pham], [url]) VALUES (79, 30, N'https:\/\/i.ibb.co\/YRCmvn3\/88dfd62cf567.jpg')
INSERT [dbo].[AnhSanPham] ([id], [ma_san_pham], [url]) VALUES (80, 30, N'https:\/\/i.ibb.co\/fq6wS5c\/b96b25f8df1f.jpg')
INSERT [dbo].[AnhSanPham] ([id], [ma_san_pham], [url]) VALUES (81, 31, N'https:\/\/i.ibb.co\/X29PZ5v\/2aacaca75597.jpg')
INSERT [dbo].[AnhSanPham] ([id], [ma_san_pham], [url]) VALUES (82, 31, N'https:\/\/i.ibb.co\/GFc2RRN\/040e83212e99.jpg')
INSERT [dbo].[AnhSanPham] ([id], [ma_san_pham], [url]) VALUES (83, 32, N'https:\/\/i.ibb.co\/j3Sg7S2\/1f05bbed8397.jpg')
INSERT [dbo].[AnhSanPham] ([id], [ma_san_pham], [url]) VALUES (84, 33, N'https:\/\/i.ibb.co\/cDMfH86\/056cc7559af6.jpg')
INSERT [dbo].[AnhSanPham] ([id], [ma_san_pham], [url]) VALUES (85, 33, N'https:\/\/i.ibb.co\/6rqM6Rv\/8c707cdd2004.jpg')
INSERT [dbo].[AnhSanPham] ([id], [ma_san_pham], [url]) VALUES (86, 34, N'https:\/\/i.ibb.co\/7pZ7kHF\/bbdc70d2bb28.jpg')
INSERT [dbo].[AnhSanPham] ([id], [ma_san_pham], [url]) VALUES (87, 34, N'https:\/\/i.ibb.co\/PN4tjry\/b24e12c17137.jpg')
INSERT [dbo].[AnhSanPham] ([id], [ma_san_pham], [url]) VALUES (88, 35, N'https:\/\/i.ibb.co\/0F5zSHs\/33b3bec9a2e0.jpg')
INSERT [dbo].[AnhSanPham] ([id], [ma_san_pham], [url]) VALUES (89, 35, N'https:\/\/i.ibb.co\/cvqMwgL\/d58c3ba5eb48.jpg')
SET IDENTITY_INSERT [dbo].[AnhSanPham] OFF
GO
SET IDENTITY_INSERT [dbo].[BinhLuan] ON 

INSERT [dbo].[BinhLuan] ([id], [binh_luan], [ngay_binh_luan], [nguoi_binh_luan], [san_pham], [danh_gia], [bao_cao_sai_pham]) VALUES (1, N'Sản phẩm ok', CAST(N'2024-05-05' AS Date), 1, 1, 5, 0)
INSERT [dbo].[BinhLuan] ([id], [binh_luan], [ngay_binh_luan], [nguoi_binh_luan], [san_pham], [danh_gia], [bao_cao_sai_pham]) VALUES (2, N'sản phẩm như cứt', CAST(N'2024-01-01' AS Date), 1, 1, 1, 0)
INSERT [dbo].[BinhLuan] ([id], [binh_luan], [ngay_binh_luan], [nguoi_binh_luan], [san_pham], [danh_gia], [bao_cao_sai_pham]) VALUES (4, N'Cũng tạm', CAST(N'2024-06-06' AS Date), 7, 30, 4, 0)
INSERT [dbo].[BinhLuan] ([id], [binh_luan], [ngay_binh_luan], [nguoi_binh_luan], [san_pham], [danh_gia], [bao_cao_sai_pham]) VALUES (5, N'Đèn đẹp cao', CAST(N'2024-06-01' AS Date), 9, 28, 5, 0)
INSERT [dbo].[BinhLuan] ([id], [binh_luan], [ngay_binh_luan], [nguoi_binh_luan], [san_pham], [danh_gia], [bao_cao_sai_pham]) VALUES (6, N'Đèn dùng tốt', CAST(N'2024-06-06' AS Date), 2, 28, 5, 0)
INSERT [dbo].[BinhLuan] ([id], [binh_luan], [ngay_binh_luan], [nguoi_binh_luan], [san_pham], [danh_gia], [bao_cao_sai_pham]) VALUES (7, N'Để trong nhà gất sang nha mọi người', CAST(N'2024-06-09' AS Date), 9, 31, 5, 0)
INSERT [dbo].[BinhLuan] ([id], [binh_luan], [ngay_binh_luan], [nguoi_binh_luan], [san_pham], [danh_gia], [bao_cao_sai_pham]) VALUES (8, N'Ghế ngồi êm', CAST(N'2024-06-10' AS Date), 6, 25, 5, 0)
INSERT [dbo].[BinhLuan] ([id], [binh_luan], [ngay_binh_luan], [nguoi_binh_luan], [san_pham], [danh_gia], [bao_cao_sai_pham]) VALUES (9, N'Bàn đẹp mà hơi ít màu', CAST(N'2024-05-08' AS Date), 5, 13, 4, 0)
SET IDENTITY_INSERT [dbo].[BinhLuan] OFF
GO
SET IDENTITY_INSERT [dbo].[ChiTietDanhMuc] ON 

INSERT [dbo].[ChiTietDanhMuc] ([id], [ma_san_pham], [ma_danh_muc]) VALUES (38, 11, 1)
INSERT [dbo].[ChiTietDanhMuc] ([id], [ma_san_pham], [ma_danh_muc]) VALUES (40, 10, 1)
INSERT [dbo].[ChiTietDanhMuc] ([id], [ma_san_pham], [ma_danh_muc]) VALUES (41, 12, 1)
INSERT [dbo].[ChiTietDanhMuc] ([id], [ma_san_pham], [ma_danh_muc]) VALUES (42, 13, 1)
INSERT [dbo].[ChiTietDanhMuc] ([id], [ma_san_pham], [ma_danh_muc]) VALUES (43, 14, 2)
INSERT [dbo].[ChiTietDanhMuc] ([id], [ma_san_pham], [ma_danh_muc]) VALUES (44, 14, 6)
INSERT [dbo].[ChiTietDanhMuc] ([id], [ma_san_pham], [ma_danh_muc]) VALUES (45, 15, 2)
INSERT [dbo].[ChiTietDanhMuc] ([id], [ma_san_pham], [ma_danh_muc]) VALUES (46, 15, 6)
INSERT [dbo].[ChiTietDanhMuc] ([id], [ma_san_pham], [ma_danh_muc]) VALUES (47, 16, 2)
INSERT [dbo].[ChiTietDanhMuc] ([id], [ma_san_pham], [ma_danh_muc]) VALUES (48, 17, 2)
INSERT [dbo].[ChiTietDanhMuc] ([id], [ma_san_pham], [ma_danh_muc]) VALUES (49, 18, 2)
INSERT [dbo].[ChiTietDanhMuc] ([id], [ma_san_pham], [ma_danh_muc]) VALUES (50, 19, 2)
INSERT [dbo].[ChiTietDanhMuc] ([id], [ma_san_pham], [ma_danh_muc]) VALUES (51, 20, 2)
INSERT [dbo].[ChiTietDanhMuc] ([id], [ma_san_pham], [ma_danh_muc]) VALUES (52, 21, 2)
INSERT [dbo].[ChiTietDanhMuc] ([id], [ma_san_pham], [ma_danh_muc]) VALUES (53, 22, 2)
INSERT [dbo].[ChiTietDanhMuc] ([id], [ma_san_pham], [ma_danh_muc]) VALUES (54, 23, 2)
INSERT [dbo].[ChiTietDanhMuc] ([id], [ma_san_pham], [ma_danh_muc]) VALUES (55, 24, 1)
INSERT [dbo].[ChiTietDanhMuc] ([id], [ma_san_pham], [ma_danh_muc]) VALUES (56, 25, 1)
INSERT [dbo].[ChiTietDanhMuc] ([id], [ma_san_pham], [ma_danh_muc]) VALUES (57, 26, 1)
INSERT [dbo].[ChiTietDanhMuc] ([id], [ma_san_pham], [ma_danh_muc]) VALUES (58, 27, 2)
INSERT [dbo].[ChiTietDanhMuc] ([id], [ma_san_pham], [ma_danh_muc]) VALUES (59, 27, 4)
INSERT [dbo].[ChiTietDanhMuc] ([id], [ma_san_pham], [ma_danh_muc]) VALUES (60, 28, 2)
INSERT [dbo].[ChiTietDanhMuc] ([id], [ma_san_pham], [ma_danh_muc]) VALUES (61, 28, 4)
INSERT [dbo].[ChiTietDanhMuc] ([id], [ma_san_pham], [ma_danh_muc]) VALUES (62, 29, 2)
INSERT [dbo].[ChiTietDanhMuc] ([id], [ma_san_pham], [ma_danh_muc]) VALUES (63, 29, 4)
INSERT [dbo].[ChiTietDanhMuc] ([id], [ma_san_pham], [ma_danh_muc]) VALUES (64, 29, 5)
INSERT [dbo].[ChiTietDanhMuc] ([id], [ma_san_pham], [ma_danh_muc]) VALUES (65, 30, 2)
INSERT [dbo].[ChiTietDanhMuc] ([id], [ma_san_pham], [ma_danh_muc]) VALUES (66, 30, 4)
INSERT [dbo].[ChiTietDanhMuc] ([id], [ma_san_pham], [ma_danh_muc]) VALUES (67, 30, 5)
INSERT [dbo].[ChiTietDanhMuc] ([id], [ma_san_pham], [ma_danh_muc]) VALUES (68, 31, 2)
INSERT [dbo].[ChiTietDanhMuc] ([id], [ma_san_pham], [ma_danh_muc]) VALUES (69, 31, 4)
INSERT [dbo].[ChiTietDanhMuc] ([id], [ma_san_pham], [ma_danh_muc]) VALUES (70, 32, 2)
INSERT [dbo].[ChiTietDanhMuc] ([id], [ma_san_pham], [ma_danh_muc]) VALUES (71, 32, 4)
INSERT [dbo].[ChiTietDanhMuc] ([id], [ma_san_pham], [ma_danh_muc]) VALUES (74, 8, 1)
INSERT [dbo].[ChiTietDanhMuc] ([id], [ma_san_pham], [ma_danh_muc]) VALUES (75, 3, 1)
INSERT [dbo].[ChiTietDanhMuc] ([id], [ma_san_pham], [ma_danh_muc]) VALUES (76, 33, 5)
INSERT [dbo].[ChiTietDanhMuc] ([id], [ma_san_pham], [ma_danh_muc]) VALUES (77, 33, 6)
INSERT [dbo].[ChiTietDanhMuc] ([id], [ma_san_pham], [ma_danh_muc]) VALUES (78, 34, 5)
INSERT [dbo].[ChiTietDanhMuc] ([id], [ma_san_pham], [ma_danh_muc]) VALUES (79, 34, 6)
INSERT [dbo].[ChiTietDanhMuc] ([id], [ma_san_pham], [ma_danh_muc]) VALUES (80, 35, 4)
INSERT [dbo].[ChiTietDanhMuc] ([id], [ma_san_pham], [ma_danh_muc]) VALUES (81, 35, 5)
INSERT [dbo].[ChiTietDanhMuc] ([id], [ma_san_pham], [ma_danh_muc]) VALUES (82, 35, 6)
INSERT [dbo].[ChiTietDanhMuc] ([id], [ma_san_pham], [ma_danh_muc]) VALUES (83, 36, 4)
INSERT [dbo].[ChiTietDanhMuc] ([id], [ma_san_pham], [ma_danh_muc]) VALUES (84, 36, 5)
INSERT [dbo].[ChiTietDanhMuc] ([id], [ma_san_pham], [ma_danh_muc]) VALUES (85, 36, 6)
INSERT [dbo].[ChiTietDanhMuc] ([id], [ma_san_pham], [ma_danh_muc]) VALUES (88, 1, 4)
INSERT [dbo].[ChiTietDanhMuc] ([id], [ma_san_pham], [ma_danh_muc]) VALUES (89, 37, 1)
SET IDENTITY_INSERT [dbo].[ChiTietDanhMuc] OFF
GO
SET IDENTITY_INSERT [dbo].[ChiTietGioHang] ON 

INSERT [dbo].[ChiTietGioHang] ([id], [ma_gio_hang], [ma_san_pham], [so_luong], [ma_giam_gia]) VALUES (1, 1, 1, 15, N'NOITHAT10           ')
INSERT [dbo].[ChiTietGioHang] ([id], [ma_gio_hang], [ma_san_pham], [so_luong], [ma_giam_gia]) VALUES (3, 1, 3, 5, NULL)
INSERT [dbo].[ChiTietGioHang] ([id], [ma_gio_hang], [ma_san_pham], [so_luong], [ma_giam_gia]) VALUES (4, 3, 13, 1, NULL)
INSERT [dbo].[ChiTietGioHang] ([id], [ma_gio_hang], [ma_san_pham], [so_luong], [ma_giam_gia]) VALUES (5, 4, 25, 1, NULL)
INSERT [dbo].[ChiTietGioHang] ([id], [ma_gio_hang], [ma_san_pham], [so_luong], [ma_giam_gia]) VALUES (6, 5, 31, 10, NULL)
INSERT [dbo].[ChiTietGioHang] ([id], [ma_gio_hang], [ma_san_pham], [so_luong], [ma_giam_gia]) VALUES (7, 6, 30, 2, NULL)
INSERT [dbo].[ChiTietGioHang] ([id], [ma_gio_hang], [ma_san_pham], [so_luong], [ma_giam_gia]) VALUES (8, 7, 28, 2, NULL)
INSERT [dbo].[ChiTietGioHang] ([id], [ma_gio_hang], [ma_san_pham], [so_luong], [ma_giam_gia]) VALUES (9, 9, 28, 3, NULL)
INSERT [dbo].[ChiTietGioHang] ([id], [ma_gio_hang], [ma_san_pham], [so_luong], [ma_giam_gia]) VALUES (10, 10, 31, 19, NULL)
INSERT [dbo].[ChiTietGioHang] ([id], [ma_gio_hang], [ma_san_pham], [so_luong], [ma_giam_gia]) VALUES (11, 8, 18, 1, NULL)
SET IDENTITY_INSERT [dbo].[ChiTietGioHang] OFF
GO
SET IDENTITY_INSERT [dbo].[ChiTietMaGiamGia] ON 

INSERT [dbo].[ChiTietMaGiamGia] ([ma_san_pham], [ma_giam_gia], [id]) VALUES (1, N'NOITHAT10           ', 1)
INSERT [dbo].[ChiTietMaGiamGia] ([ma_san_pham], [ma_giam_gia], [id]) VALUES (1, N'TEST                ', 6)
INSERT [dbo].[ChiTietMaGiamGia] ([ma_san_pham], [ma_giam_gia], [id]) VALUES (3, N'TEST                ', 8)
INSERT [dbo].[ChiTietMaGiamGia] ([ma_san_pham], [ma_giam_gia], [id]) VALUES (3, N'TYEST               ', 15)
INSERT [dbo].[ChiTietMaGiamGia] ([ma_san_pham], [ma_giam_gia], [id]) VALUES (3, N'GIAMGIA100          ', 24)
INSERT [dbo].[ChiTietMaGiamGia] ([ma_san_pham], [ma_giam_gia], [id]) VALUES (1, N'FLASHSALE11         ', 25)
INSERT [dbo].[ChiTietMaGiamGia] ([ma_san_pham], [ma_giam_gia], [id]) VALUES (3, N'FLASHSALE11         ', 27)
INSERT [dbo].[ChiTietMaGiamGia] ([ma_san_pham], [ma_giam_gia], [id]) VALUES (8, N'TEST100             ', 28)
INSERT [dbo].[ChiTietMaGiamGia] ([ma_san_pham], [ma_giam_gia], [id]) VALUES (16, N'FLASHSALE1          ', 30)
INSERT [dbo].[ChiTietMaGiamGia] ([ma_san_pham], [ma_giam_gia], [id]) VALUES (17, N'FLASHSALE1          ', 31)
INSERT [dbo].[ChiTietMaGiamGia] ([ma_san_pham], [ma_giam_gia], [id]) VALUES (18, N'FLASHSALE1          ', 32)
INSERT [dbo].[ChiTietMaGiamGia] ([ma_san_pham], [ma_giam_gia], [id]) VALUES (19, N'FLASHSALE1          ', 33)
INSERT [dbo].[ChiTietMaGiamGia] ([ma_san_pham], [ma_giam_gia], [id]) VALUES (20, N'FLASHSALE002        ', 34)
INSERT [dbo].[ChiTietMaGiamGia] ([ma_san_pham], [ma_giam_gia], [id]) VALUES (21, N'FLASHSALE002        ', 35)
INSERT [dbo].[ChiTietMaGiamGia] ([ma_san_pham], [ma_giam_gia], [id]) VALUES (22, N'FLASHSALE002        ', 36)
INSERT [dbo].[ChiTietMaGiamGia] ([ma_san_pham], [ma_giam_gia], [id]) VALUES (23, N'FLASHSALE002        ', 37)
INSERT [dbo].[ChiTietMaGiamGia] ([ma_san_pham], [ma_giam_gia], [id]) VALUES (27, N'FLASHSALE003        ', 38)
INSERT [dbo].[ChiTietMaGiamGia] ([ma_san_pham], [ma_giam_gia], [id]) VALUES (28, N'FLASHSALE003        ', 39)
INSERT [dbo].[ChiTietMaGiamGia] ([ma_san_pham], [ma_giam_gia], [id]) VALUES (29, N'FLASHSALE003        ', 40)
INSERT [dbo].[ChiTietMaGiamGia] ([ma_san_pham], [ma_giam_gia], [id]) VALUES (30, N'FLASHSALE003        ', 41)
SET IDENTITY_INSERT [dbo].[ChiTietMaGiamGia] OFF
GO
SET IDENTITY_INSERT [dbo].[DanhMuc] ON 

INSERT [dbo].[DanhMuc] ([ma_danh_muc], [ten_danh_muc], [ngay_them], [ngay_xoa], [ngay_cap_nhat], [nguoi_them]) VALUES (1, N'Nội Thất', CAST(N'2024-05-26' AS Date), NULL, CAST(N'2024-05-27' AS Date), N'NV01      ')
INSERT [dbo].[DanhMuc] ([ma_danh_muc], [ten_danh_muc], [ngay_them], [ngay_xoa], [ngay_cap_nhat], [nguoi_them]) VALUES (2, N'Trang Trí', CAST(N'2024-05-26' AS Date), NULL, CAST(N'2024-05-26' AS Date), N'NV01      ')
INSERT [dbo].[DanhMuc] ([ma_danh_muc], [ten_danh_muc], [ngay_them], [ngay_xoa], [ngay_cap_nhat], [nguoi_them]) VALUES (4, N'Chiếu Sáng', CAST(N'2024-05-27' AS Date), NULL, CAST(N'2024-05-27' AS Date), N'NV01      ')
INSERT [dbo].[DanhMuc] ([ma_danh_muc], [ten_danh_muc], [ngay_them], [ngay_xoa], [ngay_cap_nhat], [nguoi_them]) VALUES (5, N'Ngoài Trời', CAST(N'2024-05-27' AS Date), NULL, CAST(N'2024-05-27' AS Date), N'NV01      ')
INSERT [dbo].[DanhMuc] ([ma_danh_muc], [ten_danh_muc], [ngay_them], [ngay_xoa], [ngay_cap_nhat], [nguoi_them]) VALUES (6, N'Sân Vườn', CAST(N'2024-05-27' AS Date), NULL, CAST(N'2024-05-27' AS Date), N'NV01      ')
SET IDENTITY_INSERT [dbo].[DanhMuc] OFF
GO
SET IDENTITY_INSERT [dbo].[GioHang] ON 

INSERT [dbo].[GioHang] ([id], [ma_khach_hang], [ngay_tao], [trang_thai]) VALUES (1, 1, CAST(N'2024-01-01' AS Date), N'HOAN_THANH               ')
INSERT [dbo].[GioHang] ([id], [ma_khach_hang], [ngay_tao], [trang_thai]) VALUES (2, 2, CAST(N'2024-01-01' AS Date), N'HOAN_THANH               ')
INSERT [dbo].[GioHang] ([id], [ma_khach_hang], [ngay_tao], [trang_thai]) VALUES (3, 5, CAST(N'2024-01-02' AS Date), N'HOAN_THANH               ')
INSERT [dbo].[GioHang] ([id], [ma_khach_hang], [ngay_tao], [trang_thai]) VALUES (4, 6, CAST(N'2024-01-15' AS Date), N'HOAN_THANH               ')
INSERT [dbo].[GioHang] ([id], [ma_khach_hang], [ngay_tao], [trang_thai]) VALUES (5, 9, CAST(N'2024-01-12' AS Date), N'HOAN_THANH               ')
INSERT [dbo].[GioHang] ([id], [ma_khach_hang], [ngay_tao], [trang_thai]) VALUES (6, 7, CAST(N'2024-01-10' AS Date), N'HOAN_THANH               ')
INSERT [dbo].[GioHang] ([id], [ma_khach_hang], [ngay_tao], [trang_thai]) VALUES (7, 2, CAST(N'2024-01-05' AS Date), N'HOAN_THANH               ')
INSERT [dbo].[GioHang] ([id], [ma_khach_hang], [ngay_tao], [trang_thai]) VALUES (8, 9, CAST(N'2024-06-06' AS Date), N'CHO_XU_LY                ')
INSERT [dbo].[GioHang] ([id], [ma_khach_hang], [ngay_tao], [trang_thai]) VALUES (9, 9, CAST(N'2024-06-06' AS Date), N'HUY                      ')
INSERT [dbo].[GioHang] ([id], [ma_khach_hang], [ngay_tao], [trang_thai]) VALUES (10, 9, CAST(N'2024-06-06' AS Date), N'DANG_GIAO_HANG           ')
SET IDENTITY_INSERT [dbo].[GioHang] OFF
GO
SET IDENTITY_INSERT [dbo].[KhachHang] ON 

INSERT [dbo].[KhachHang] ([ma_khach_hang], [ho_va_ten], [password], [email], [so_dien_thoai], [gioi_tinh], [dia_chi], [ngay_sinh], [ngay_tao], [ngay_cap_nhat]) VALUES (1, N'Trần Thế Lâm', N'123', N'lam@sample.com', N'0987654321    ', 0, N'HCM', CAST(N'2024-01-25' AS Date), CAST(N'2024-05-27' AS Date), CAST(N'2024-05-29' AS Date))
INSERT [dbo].[KhachHang] ([ma_khach_hang], [ho_va_ten], [password], [email], [so_dien_thoai], [gioi_tinh], [dia_chi], [ngay_sinh], [ngay_tao], [ngay_cap_nhat]) VALUES (2, N'Khấu Tuấn Kha', N'321', N'kha@sample.com', N'0987654321    ', 1, N'LA', CAST(N'2024-10-26' AS Date), CAST(N'2024-05-27' AS Date), CAST(N'2024-05-28' AS Date))
INSERT [dbo].[KhachHang] ([ma_khach_hang], [ho_va_ten], [password], [email], [so_dien_thoai], [gioi_tinh], [dia_chi], [ngay_sinh], [ngay_tao], [ngay_cap_nhat]) VALUES (4, N'Bùi Huyên Anh', N'1', N'1', N'1             ', 1, N'1', CAST(N'2024-05-22' AS Date), CAST(N'2024-05-28' AS Date), CAST(N'2024-05-28' AS Date))
INSERT [dbo].[KhachHang] ([ma_khach_hang], [ho_va_ten], [password], [email], [so_dien_thoai], [gioi_tinh], [dia_chi], [ngay_sinh], [ngay_tao], [ngay_cap_nhat]) VALUES (5, N'Dư Trọng Nhân', N't', N't', N't             ', 0, N'HCM', CAST(N'2024-05-09' AS Date), CAST(N'2024-05-28' AS Date), CAST(N'2024-05-28' AS Date))
INSERT [dbo].[KhachHang] ([ma_khach_hang], [ho_va_ten], [password], [email], [so_dien_thoai], [gioi_tinh], [dia_chi], [ngay_sinh], [ngay_tao], [ngay_cap_nhat]) VALUES (6, N'Nguyễn Thành Liêm', N't', N't', N't             ', 0, N't', CAST(N'2024-05-01' AS Date), CAST(N'2024-05-28' AS Date), CAST(N'2024-05-30' AS Date))
INSERT [dbo].[KhachHang] ([ma_khach_hang], [ho_va_ten], [password], [email], [so_dien_thoai], [gioi_tinh], [dia_chi], [ngay_sinh], [ngay_tao], [ngay_cap_nhat]) VALUES (7, N'Inuyasha', N'1', N'', N'              ', 0, N'LA', CAST(N'2024-05-30' AS Date), CAST(N'2024-05-28' AS Date), CAST(N'2024-05-28' AS Date))
INSERT [dbo].[KhachHang] ([ma_khach_hang], [ho_va_ten], [password], [email], [so_dien_thoai], [gioi_tinh], [dia_chi], [ngay_sinh], [ngay_tao], [ngay_cap_nhat]) VALUES (8, N'Kagome', N'linh', NULL, N'0889456201    ', 0, N'LA', NULL, CAST(N'2024-06-04' AS Date), CAST(N'2024-06-04' AS Date))
INSERT [dbo].[KhachHang] ([ma_khach_hang], [ho_va_ten], [password], [email], [so_dien_thoai], [gioi_tinh], [dia_chi], [ngay_sinh], [ngay_tao], [ngay_cap_nhat]) VALUES (9, N'Monkey D Lufy', N'linh', NULL, N'0889456201    ', 0, N'LA', NULL, CAST(N'2024-06-04' AS Date), CAST(N'2024-06-04' AS Date))
SET IDENTITY_INSERT [dbo].[KhachHang] OFF
GO
INSERT [dbo].[MaGiamGia] ([ma_giam_gia], [discount], [ngay_bat_dau], [ngay_ket_thuc], [so_luong], [nguoi_them], [ngay_tao], [ngay_cap_nhat]) VALUES (N'FLASHSALE002        ', 0.25, CAST(N'2023-02-09' AS Date), CAST(N'2023-04-11' AS Date), 100, N'NV03      ', CAST(N'2024-06-06' AS Date), CAST(N'2024-06-06' AS Date))
INSERT [dbo].[MaGiamGia] ([ma_giam_gia], [discount], [ngay_bat_dau], [ngay_ket_thuc], [so_luong], [nguoi_them], [ngay_tao], [ngay_cap_nhat]) VALUES (N'FLASHSALE003        ', 0.30000001192092896, NULL, NULL, 0, N'NV03      ', CAST(N'2024-06-06' AS Date), CAST(N'2024-06-06' AS Date))
INSERT [dbo].[MaGiamGia] ([ma_giam_gia], [discount], [ngay_bat_dau], [ngay_ket_thuc], [so_luong], [nguoi_them], [ngay_tao], [ngay_cap_nhat]) VALUES (N'FLASHSALE1          ', 0.15000000596046448, CAST(N'2024-06-06' AS Date), CAST(N'2024-07-06' AS Date), 30, N'NV03      ', CAST(N'2024-06-06' AS Date), CAST(N'2024-06-06' AS Date))
INSERT [dbo].[MaGiamGia] ([ma_giam_gia], [discount], [ngay_bat_dau], [ngay_ket_thuc], [so_luong], [nguoi_them], [ngay_tao], [ngay_cap_nhat]) VALUES (N'FLASHSALE11         ', 0.5, CAST(N'2024-05-01' AS Date), CAST(N'2024-05-01' AS Date), 100, N'NV01      ', CAST(N'2024-01-01' AS Date), CAST(N'2024-05-30' AS Date))
INSERT [dbo].[MaGiamGia] ([ma_giam_gia], [discount], [ngay_bat_dau], [ngay_ket_thuc], [so_luong], [nguoi_them], [ngay_tao], [ngay_cap_nhat]) VALUES (N'GIAMGIA100          ', 1, NULL, NULL, 100, N'NV01      ', CAST(N'2024-05-29' AS Date), CAST(N'2024-05-29' AS Date))
INSERT [dbo].[MaGiamGia] ([ma_giam_gia], [discount], [ngay_bat_dau], [ngay_ket_thuc], [so_luong], [nguoi_them], [ngay_tao], [ngay_cap_nhat]) VALUES (N'NOITHAT10           ', 0.1, CAST(N'2024-01-01' AS Date), CAST(N'2025-01-01' AS Date), 100, N'NV01      ', CAST(N'2024-01-01' AS Date), CAST(N'2024-01-01' AS Date))
INSERT [dbo].[MaGiamGia] ([ma_giam_gia], [discount], [ngay_bat_dau], [ngay_ket_thuc], [so_luong], [nguoi_them], [ngay_tao], [ngay_cap_nhat]) VALUES (N'TEST                ', 0.5, NULL, NULL, 222, N'NV01      ', CAST(N'2024-05-29' AS Date), CAST(N'2024-05-29' AS Date))
INSERT [dbo].[MaGiamGia] ([ma_giam_gia], [discount], [ngay_bat_dau], [ngay_ket_thuc], [so_luong], [nguoi_them], [ngay_tao], [ngay_cap_nhat]) VALUES (N'TEST100             ', 1, CAST(N'2024-05-01' AS Date), CAST(N'2024-05-01' AS Date), 1, N'NV01      ', CAST(N'2024-05-30' AS Date), CAST(N'2024-05-30' AS Date))
INSERT [dbo].[MaGiamGia] ([ma_giam_gia], [discount], [ngay_bat_dau], [ngay_ket_thuc], [so_luong], [nguoi_them], [ngay_tao], [ngay_cap_nhat]) VALUES (N'TYEST               ', 33, NULL, NULL, 2, N'NV01      ', CAST(N'2024-05-29' AS Date), CAST(N'2024-05-29' AS Date))
GO
INSERT [dbo].[NhaCungCap] ([ma_nha_cung_cap], [ten_nha_cung_cap], [ma_so_thue], [so_dien_thoai], [dia_chi], [nguoi_them], [ngay_them], [ngay_cap_nhat]) VALUES (N'AConcept  ', N'AConcept', N'999       ', N'0987654321    ', N'HCM', N'NV01      ', CAST(N'2024-05-26' AS Date), CAST(N'2024-05-26' AS Date))
INSERT [dbo].[NhaCungCap] ([ma_nha_cung_cap], [ten_nha_cung_cap], [ma_so_thue], [so_dien_thoai], [dia_chi], [nguoi_them], [ngay_them], [ngay_cap_nhat]) VALUES (N'Baya      ', N'Baya', N'786       ', N'0987654321    ', N'Hà Nội', N'NV01      ', CAST(N'2024-05-26' AS Date), CAST(N'2024-05-26' AS Date))
INSERT [dbo].[NhaCungCap] ([ma_nha_cung_cap], [ten_nha_cung_cap], [ma_so_thue], [so_dien_thoai], [dia_chi], [nguoi_them], [ngay_them], [ngay_cap_nhat]) VALUES (N'Eames     ', N'Eames', N'675       ', N'0987654321    ', N'Đồng Nai', N'NV01      ', CAST(N'2024-05-26' AS Date), CAST(N'2024-05-26' AS Date))
INSERT [dbo].[NhaCungCap] ([ma_nha_cung_cap], [ten_nha_cung_cap], [ma_so_thue], [so_dien_thoai], [dia_chi], [nguoi_them], [ngay_them], [ngay_cap_nhat]) VALUES (N'Hiroshima ', N'Hiroshima', N'5555      ', N'0987654321    ', N'HCM', N'NV01      ', CAST(N'2024-05-26' AS Date), CAST(N'2024-05-26' AS Date))
INSERT [dbo].[NhaCungCap] ([ma_nha_cung_cap], [ten_nha_cung_cap], [ma_so_thue], [so_dien_thoai], [dia_chi], [nguoi_them], [ngay_them], [ngay_cap_nhat]) VALUES (N'Kimdang   ', N'Kim Đang', N'525253    ', N'0987654321    ', N'HCM', N'NV01      ', CAST(N'2024-05-26' AS Date), CAST(N'2024-05-26' AS Date))
INSERT [dbo].[NhaCungCap] ([ma_nha_cung_cap], [ten_nha_cung_cap], [ma_so_thue], [so_dien_thoai], [dia_chi], [nguoi_them], [ngay_them], [ngay_cap_nhat]) VALUES (N'Louis     ', N'Louis', N'34213     ', N'0987654321    ', N'Mỹ', N'NV01      ', CAST(N'2024-05-26' AS Date), CAST(N'2024-05-26' AS Date))
INSERT [dbo].[NhaCungCap] ([ma_nha_cung_cap], [ten_nha_cung_cap], [ma_so_thue], [so_dien_thoai], [dia_chi], [nguoi_them], [ngay_them], [ngay_cap_nhat]) VALUES (N'THAICONG  ', N'Thái Công', N'123       ', N'0987654321    ', N'HCM', N'NV01      ', CAST(N'2024-05-05' AS Date), CAST(N'2024-05-05' AS Date))
GO
INSERT [dbo].[NhanVien] ([ma_nhan_vien], [ho_ten], [chuc_vu], [dia_chi], [email], [gioi_tinh], [so_dien_thoai], [ngay_vao], [ngay_cap_nhat], [mat_khau]) VALUES (N'NV01      ', N'Lương Công Huấn', 1, N'Đồng Nai', N'huanluongcong@gmail.com', 1, N'0987654321    ', CAST(N'2024-03-27' AS Date), CAST(N'2024-03-27' AS Date), N'123')
INSERT [dbo].[NhanVien] ([ma_nhan_vien], [ho_ten], [chuc_vu], [dia_chi], [email], [gioi_tinh], [so_dien_thoai], [ngay_vao], [ngay_cap_nhat], [mat_khau]) VALUES (N'NV02      ', N'Nguyễn Quang Hoài Nam', 0, N'Nghệ An ', N'nam@sample.com', 1, N'0987654321    ', CAST(N'2024-03-27' AS Date), CAST(N'2024-03-27' AS Date), N'123')
INSERT [dbo].[NhanVien] ([ma_nhan_vien], [ho_ten], [chuc_vu], [dia_chi], [email], [gioi_tinh], [so_dien_thoai], [ngay_vao], [ngay_cap_nhat], [mat_khau]) VALUES (N'NV03      ', N'Mai Thị Mỹ Linh', 1, N'Long An ', N'linh@sample.com', 0, N'0987654321    ', CAST(N'2024-03-27' AS Date), CAST(N'2024-03-27' AS Date), N'123')
INSERT [dbo].[NhanVien] ([ma_nhan_vien], [ho_ten], [chuc_vu], [dia_chi], [email], [gioi_tinh], [so_dien_thoai], [ngay_vao], [ngay_cap_nhat], [mat_khau]) VALUES (N'NV04      ', N'Nguyễn Thanh Tính', 0, N'Đồng Tháp', N'tinh@sample.com.vn', 1, N'0987654321    ', CAST(N'2024-05-27' AS Date), CAST(N'2024-05-27' AS Date), N'123')
INSERT [dbo].[NhanVien] ([ma_nhan_vien], [ho_ten], [chuc_vu], [dia_chi], [email], [gioi_tinh], [so_dien_thoai], [ngay_vao], [ngay_cap_nhat], [mat_khau]) VALUES (N'NV05      ', N'Hồ Tấn Phát', 1, N'Tiền Giang', N'phat@sample.com', 1, N'0987654321    ', CAST(N'2024-05-27' AS Date), CAST(N'2024-05-27' AS Date), N'123')
GO
INSERT [dbo].[PhieuNhapHang] ([ma_phieu_nhap], [nha_cung_cap], [trang_thai], [nguoi_nhap], [ngay_nhap], [ngay_cap_nhat]) VALUES (N'abc       ', N'AConcept  ', N'DANG_HOAN_THANH', N'NV01      ', CAST(N'2024-05-27' AS Date), CAST(N'2024-05-27' AS Date))
INSERT [dbo].[PhieuNhapHang] ([ma_phieu_nhap], [nha_cung_cap], [trang_thai], [nguoi_nhap], [ngay_nhap], [ngay_cap_nhat]) VALUES (N'PN06Y2024 ', N'THAICONG  ', N'HOAN_THANH', N'NV03      ', CAST(N'2024-06-06' AS Date), CAST(N'2024-06-06' AS Date))
INSERT [dbo].[PhieuNhapHang] ([ma_phieu_nhap], [nha_cung_cap], [trang_thai], [nguoi_nhap], [ngay_nhap], [ngay_cap_nhat]) VALUES (N'PN07Y2024 ', N'Hiroshima ', N'DANG_HOAN_THANH', N'NV03      ', CAST(N'2024-06-06' AS Date), CAST(N'2024-06-06' AS Date))
INSERT [dbo].[PhieuNhapHang] ([ma_phieu_nhap], [nha_cung_cap], [trang_thai], [nguoi_nhap], [ngay_nhap], [ngay_cap_nhat]) VALUES (N'test      ', N'Baya      ', N'DANG_HOAN_THANH', N'NV01      ', CAST(N'2024-05-27' AS Date), CAST(N'2024-05-27' AS Date))
GO
SET IDENTITY_INSERT [dbo].[SanPham] ON 

INSERT [dbo].[SanPham] ([ma_san_pham], [ten_san_pham], [group_id], [gia_ban], [so_luong], [mo_ta], [thuong_hieu], [trong_luong], [kich_thuoc], [nguoi_them], [hien_thi], [phieu_nhap], [ngay_tao], [ngay_cap_nhat], [phan_loai], [trang_thai]) VALUES (1, N'Bàn học siêu bền', N'g1        ', 122, 321321, N'Bàn gia đình thường là trung tâm của không gian bếp hoặc phòng ăn, và thường được lựa chọn dựa trên sở thích cá nhân và phong cách thiết kế của gia đình. Nó không chỉ là nơi để thưởng thức bữa ăn mà còn là điểm tập trung của các hoạt động gia đình như làm việc học tập, chơi game hoặc tổ chức các buổi tiệc nhỏ.', N't         ', 2, N'1', N'NV01      ', 0, N'abc       ', NULL, N'2024-06-06', N'Đen', NULL)
INSERT [dbo].[SanPham] ([ma_san_pham], [ten_san_pham], [group_id], [gia_ban], [so_luong], [mo_ta], [thuong_hieu], [trong_luong], [kich_thuoc], [nguoi_them], [hien_thi], [phieu_nhap], [ngay_tao], [ngay_cap_nhat], [phan_loai], [trang_thai]) VALUES (3, N'Bàn học siêu bền', N'g1        ', 340, 1, N'Bàn gia đình thường là trung tâm của không gian bếp hoặc phòng ăn, và thường được lựa chọn dựa trên sở thích cá nhân và phong cách thiết kế của gia đình. Nó không chỉ là nơi để thưởng thức bữa ăn mà còn là điểm tập trung của các hoạt động gia đình như làm việc học tập, chơi game hoặc tổ chức các buổi tiệc nhỏ.', N't         ', 0, N'2', N'NV03      ', 0, N'abc       ', NULL, N'2024-06-06', N'Trắng', NULL)
INSERT [dbo].[SanPham] ([ma_san_pham], [ten_san_pham], [group_id], [gia_ban], [so_luong], [mo_ta], [thuong_hieu], [trong_luong], [kich_thuoc], [nguoi_them], [hien_thi], [phieu_nhap], [ngay_tao], [ngay_cap_nhat], [phan_loai], [trang_thai]) VALUES (8, N'Miu', N'Ghế Lười  ', 17000, 24, N'hàng cũ nhưng mới ', N't         ', 50, N'223131', N'NV03      ', 0, N'abc       ', CAST(N'2024-05-28' AS Date), N'2024-06-06', N'10 phần trăm', NULL)
INSERT [dbo].[SanPham] ([ma_san_pham], [ten_san_pham], [group_id], [gia_ban], [so_luong], [mo_ta], [thuong_hieu], [trong_luong], [kich_thuoc], [nguoi_them], [hien_thi], [phieu_nhap], [ngay_tao], [ngay_cap_nhat], [phan_loai], [trang_thai]) VALUES (10, N'Ghế lười ', N'001       ', 170000, 30, N'Ghế lười bông, một đối tượng không thể thiếu trong không gian nghỉ ngơi của nhiều gia đình hiện đại, là biểu tượng của sự thoải mái và thư giãn. Với thiết kế ôm sát và êm ái, ghế lười bông tạo ra một không gian lý tưởng để thư giãn sau những giờ làm việc căng thẳng. Bên cạnh việc mang lại sự thoải mái, ghế lười bông còn là điểm nhấn trang trí độc đáo trong phòng khách, phòng ngủ hoặc không gian làm việc. Sự đa dạng về kiểu dáng và chất liệu của ghế lười bông cũng làm cho nó trở thành một lựa chọn phổ biến và phù hợp với mọi phong cách trang trí nội thất. Ghế lười bông không chỉ là nơi để ngồi, mà còn là nơi để "lười biếng" một cách thỏa thích và thư giãn tối đa.', N'LN        ', 10, N'70', N'NV03      ', 1, N'abc       ', CAST(N'2024-06-05' AS Date), N'2024-06-05', N'Cỡ to', NULL)
INSERT [dbo].[SanPham] ([ma_san_pham], [ten_san_pham], [group_id], [gia_ban], [so_luong], [mo_ta], [thuong_hieu], [trong_luong], [kich_thuoc], [nguoi_them], [hien_thi], [phieu_nhap], [ngay_tao], [ngay_cap_nhat], [phan_loai], [trang_thai]) VALUES (11, N'Ghế lười ', N'001       ', 170000, 30, N'', N'LN        ', 5, N'40', N'NV03      ', 1, N'abc       ', CAST(N'2024-06-05' AS Date), N'2024-06-05', N'Cỡ nhỏ', NULL)
INSERT [dbo].[SanPham] ([ma_san_pham], [ten_san_pham], [group_id], [gia_ban], [so_luong], [mo_ta], [thuong_hieu], [trong_luong], [kich_thuoc], [nguoi_them], [hien_thi], [phieu_nhap], [ngay_tao], [ngay_cap_nhat], [phan_loai], [trang_thai]) VALUES (12, N'Bàn đá hoa cương', N'002       ', 1200000, 30, N'Bàn đá hoa cương là một món nội thất sang trọng, được chế tác từ đá granite, nổi tiếng với độ bền cao và vẻ đẹp tự nhiên. Đặc điểm nổi bật của bàn đá hoa cương là các vân đá độc đáo, đa dạng về màu sắc từ trắng, xám, đen đến các tông màu ấm như nâu và vàng, tạo nên sự tinh tế và đẳng cấp cho không gian sống. Loại bàn này thường được sử dụng trong phòng khách, phòng ăn, và nhà bếp, mang lại cảm giác lịch lãm và hiện đại.', N'wwww      ', 20, N'250', N'NV03      ', 1, N'test      ', CAST(N'2024-06-05' AS Date), N'2024-06-05', N'6 ghế (Xám)', NULL)
INSERT [dbo].[SanPham] ([ma_san_pham], [ten_san_pham], [group_id], [gia_ban], [so_luong], [mo_ta], [thuong_hieu], [trong_luong], [kich_thuoc], [nguoi_them], [hien_thi], [phieu_nhap], [ngay_tao], [ngay_cap_nhat], [phan_loai], [trang_thai]) VALUES (13, N'Bàn đá hoa cương', N'002       ', 1200000, 30, N'Bàn đá hoa cương là một món nội thất sang trọng, được chế tác từ đá granite, nổi tiếng với độ bền cao và vẻ đẹp tự nhiên. Đặc điểm nổi bật của bàn đá hoa cương là các vân đá độc đáo, đa dạng về màu sắc từ trắng, xám, đen đến các tông màu ấm như nâu và vàng, tạo nên sự tinh tế và đẳng cấp cho không gian sống. Loại bàn này thường được sử dụng trong phòng khách, phòng ăn, và nhà bếp, mang lại cảm giác lịch lãm và hiện đại.', N'wwww      ', 20, N'250', N'NV03      ', 1, N'test      ', CAST(N'2024-06-05' AS Date), N'2024-06-05', N'6 ghế (Trắng)', NULL)
INSERT [dbo].[SanPham] ([ma_san_pham], [ten_san_pham], [group_id], [gia_ban], [so_luong], [mo_ta], [thuong_hieu], [trong_luong], [kich_thuoc], [nguoi_them], [hien_thi], [phieu_nhap], [ngay_tao], [ngay_cap_nhat], [phan_loai], [trang_thai]) VALUES (14, N'Bình đá cắm hoa', N'003       ', 500000, 30, N'Bình cắm hoa bằng đá là một sản phẩm nội thất độc đáo, mang đến vẻ đẹp tự nhiên và sự sang trọng cho không gian sống. Được chế tác từ các loại đá tự nhiên như đá granite, đá cẩm thạch, hay đá vôi, bình cắm hoa bằng đá có vẻ ngoài mộc mạc nhưng tinh tế, với các vân đá và màu sắc tự nhiên tạo nên nét riêng biệt và độc đáo cho mỗi chiếc bình.', N't         ', 5, N'50', N'NV03      ', 1, N'test      ', CAST(N'2024-06-05' AS Date), N'2024-06-05', N'Đá A', NULL)
INSERT [dbo].[SanPham] ([ma_san_pham], [ten_san_pham], [group_id], [gia_ban], [so_luong], [mo_ta], [thuong_hieu], [trong_luong], [kich_thuoc], [nguoi_them], [hien_thi], [phieu_nhap], [ngay_tao], [ngay_cap_nhat], [phan_loai], [trang_thai]) VALUES (15, N'Bình đá cắm hoa', N'003       ', 700000, 30, N'Bình cắm hoa bằng đá là một sản phẩm nội thất độc đáo, mang đến vẻ đẹp tự nhiên và sự sang trọng cho không gian sống. Được chế tác từ các loại đá tự nhiên như đá granite, đá cẩm thạch, hay đá vôi, bình cắm hoa bằng đá có vẻ ngoài mộc mạc nhưng tinh tế, với các vân đá và màu sắc tự nhiên tạo nên nét riêng biệt và độc đáo cho mỗi chiếc bình.', N'LN        ', 5, N'50', N'NV03      ', 1, N'abc       ', CAST(N'2024-06-05' AS Date), N'2024-06-05', N'Đá B', NULL)
INSERT [dbo].[SanPham] ([ma_san_pham], [ten_san_pham], [group_id], [gia_ban], [so_luong], [mo_ta], [thuong_hieu], [trong_luong], [kich_thuoc], [nguoi_them], [hien_thi], [phieu_nhap], [ngay_tao], [ngay_cap_nhat], [phan_loai], [trang_thai]) VALUES (16, N'Bình hoa thủy tinh nhiều màu', N'004       ', 300000, 30, N'Bình hoa thủy tinh là một vật trang trí nội thất tinh tế và thanh lịch, mang đến sự trong suốt và nhẹ nhàng cho không gian sống. Được chế tác từ chất liệu thủy tinh cao cấp, bình hoa thủy tinh thường có thiết kế đa dạng từ những hình dáng cổ điển như tròn, bầu dục, hay hình trụ đến những thiết kế hiện đại và phá cách với các đường cong mềm mại và kiểu dáng độc đáo.', N't         ', 2, N'0.5', N'NV03      ', 1, N'abc       ', CAST(N'2024-06-05' AS Date), N'2024-06-05', N'Màu xanh lam', NULL)
INSERT [dbo].[SanPham] ([ma_san_pham], [ten_san_pham], [group_id], [gia_ban], [so_luong], [mo_ta], [thuong_hieu], [trong_luong], [kich_thuoc], [nguoi_them], [hien_thi], [phieu_nhap], [ngay_tao], [ngay_cap_nhat], [phan_loai], [trang_thai]) VALUES (17, N'Bình hoa thủy tinh nhiều màu', N'004       ', 300000, 30, N'Bình hoa thủy tinh là một vật trang trí nội thất tinh tế và thanh lịch, mang đến sự trong suốt và nhẹ nhàng cho không gian sống. Được chế tác từ chất liệu thủy tinh cao cấp, bình hoa thủy tinh thường có thiết kế đa dạng từ những hình dáng cổ điển như tròn, bầu dục, hay hình trụ đến những thiết kế hiện đại và phá cách với các đường cong mềm mại và kiểu dáng độc đáo.', N't         ', 2, N'0.5', N'NV03      ', 1, N'abc       ', CAST(N'2024-06-05' AS Date), N'2024-06-05', N'Màu xanh đỏ', NULL)
INSERT [dbo].[SanPham] ([ma_san_pham], [ten_san_pham], [group_id], [gia_ban], [so_luong], [mo_ta], [thuong_hieu], [trong_luong], [kich_thuoc], [nguoi_them], [hien_thi], [phieu_nhap], [ngay_tao], [ngay_cap_nhat], [phan_loai], [trang_thai]) VALUES (18, N'Lọ cắm hoa thủy tinh cao cấp', N'005       ', 500000, 30, N'Lọ hoa thủy tinh cao cấp là sản phẩm trang trí nội thất đẳng cấp, kết hợp giữa vẻ đẹp tinh tế và chất lượng vượt trội. Được làm từ chất liệu thủy tinh trong suốt và tinh khiết, lọ hoa thủy tinh cao cấp thường có độ dày đồng đều, bề mặt mịn màng và không tì vết. Các nghệ nhân tài ba chế tác lọ hoa này với sự tỉ mỉ và chính xác, tạo nên những hình dáng tinh xảo và sang trọng, từ kiểu dáng cổ điển như trụ, bầu dục, hay hình nón đến những thiết kế hiện đại, độc đáo với các đường nét uốn lượn tinh tế.', N't         ', 2, N'0.5', N'NV03      ', 1, N'abc       ', CAST(N'2024-06-05' AS Date), N'2024-06-05', N'Trắng trong suốt', NULL)
INSERT [dbo].[SanPham] ([ma_san_pham], [ten_san_pham], [group_id], [gia_ban], [so_luong], [mo_ta], [thuong_hieu], [trong_luong], [kich_thuoc], [nguoi_them], [hien_thi], [phieu_nhap], [ngay_tao], [ngay_cap_nhat], [phan_loai], [trang_thai]) VALUES (19, N'Lọ cắm hoa thủy tinh cao cấp', N'005       ', 500000, 30, N'Lọ hoa thủy tinh cao cấp là sản phẩm trang trí nội thất đẳng cấp, kết hợp giữa vẻ đẹp tinh tế và chất lượng vượt trội. Được làm từ chất liệu thủy tinh trong suốt và tinh khiết, lọ hoa thủy tinh cao cấp thường có độ dày đồng đều, bề mặt mịn màng và không tì vết. Các nghệ nhân tài ba chế tác lọ hoa này với sự tỉ mỉ và chính xác, tạo nên những hình dáng tinh xảo và sang trọng, từ kiểu dáng cổ điển như trụ, bầu dục, hay hình nón đến những thiết kế hiện đại, độc đáo với các đường nét uốn lượn tinh tế.', N't         ', 2, N'0.5', N'NV03      ', 1, N'abc       ', CAST(N'2024-06-05' AS Date), N'2024-06-05', N'Xanh trong suốt', NULL)
INSERT [dbo].[SanPham] ([ma_san_pham], [ten_san_pham], [group_id], [gia_ban], [so_luong], [mo_ta], [thuong_hieu], [trong_luong], [kich_thuoc], [nguoi_them], [hien_thi], [phieu_nhap], [ngay_tao], [ngay_cap_nhat], [phan_loai], [trang_thai]) VALUES (20, N'Đồng hồ tròn dán tường ', N'006       ', 100000, 25, N'Đồng hồ dán tường mỏng nhẹ có kiểu dáng đa dạng, từ các thiết kế tối giản với mặt số và kim đơn giản đến các mẫu sáng tạo với hình dạng độc đáo và màu sắc tươi sáng. Một số mẫu còn tích hợp các chi tiết trang trí như hoa văn, hình ảnh 3D, hoặc các họa tiết nghệ thuật, làm tăng thêm vẻ đẹp và sự sinh động cho không gian.', N'wwww      ', 0.1, N'0.5', N'NV03      ', 1, N'abc       ', CAST(N'2024-06-05' AS Date), N'2024-06-05', N'Màu đen', NULL)
INSERT [dbo].[SanPham] ([ma_san_pham], [ten_san_pham], [group_id], [gia_ban], [so_luong], [mo_ta], [thuong_hieu], [trong_luong], [kich_thuoc], [nguoi_them], [hien_thi], [phieu_nhap], [ngay_tao], [ngay_cap_nhat], [phan_loai], [trang_thai]) VALUES (21, N'Đồng hồ tròn dán tường ', N'006       ', 100000, 25, N'Đồng hồ dán tường mỏng nhẹ có kiểu dáng đa dạng, từ các thiết kế tối giản với mặt số và kim đơn giản đến các mẫu sáng tạo với hình dạng độc đáo và màu sắc tươi sáng. Một số mẫu còn tích hợp các chi tiết trang trí như hoa văn, hình ảnh 3D, hoặc các họa tiết nghệ thuật, làm tăng thêm vẻ đẹp và sự sinh động cho không gian.', N'wwww      ', 0.1, N'0.5', N'NV03      ', 1, N'abc       ', CAST(N'2024-06-05' AS Date), N'2024-06-05', N'Màu xanh dạ quang', NULL)
INSERT [dbo].[SanPham] ([ma_san_pham], [ten_san_pham], [group_id], [gia_ban], [so_luong], [mo_ta], [thuong_hieu], [trong_luong], [kich_thuoc], [nguoi_them], [hien_thi], [phieu_nhap], [ngay_tao], [ngay_cap_nhat], [phan_loai], [trang_thai]) VALUES (22, N'Giá trang trí treo tường', N'007       ', 130000, 25, N'Giá trang trí treo tường là một món đồ nội thất thông minh và thẩm mỹ, giúp tối ưu hóa không gian sống và tạo điểm nhấn trang trí cho căn phòng. Được thiết kế với nhiều kiểu dáng và chất liệu khác nhau như gỗ, kim loại, hay kính, giá trang trí treo tường mang lại sự linh hoạt và tiện dụng trong việc lưu trữ và trưng bày các vật dụng cá nhân, sách vở, cây cảnh nhỏ, hoặc các phụ kiện trang trí.', N'wwww      ', 0.1, N'0.5', N'NV03      ', 1, N'abc       ', CAST(N'2024-06-05' AS Date), N'2024-06-05', N'Hình tổ ong lục giác ', NULL)
INSERT [dbo].[SanPham] ([ma_san_pham], [ten_san_pham], [group_id], [gia_ban], [so_luong], [mo_ta], [thuong_hieu], [trong_luong], [kich_thuoc], [nguoi_them], [hien_thi], [phieu_nhap], [ngay_tao], [ngay_cap_nhat], [phan_loai], [trang_thai]) VALUES (23, N'Giá trang trí treo tường', N'007       ', 110000, 25, N'Giá trang trí treo tường là một món đồ nội thất thông minh và thẩm mỹ, giúp tối ưu hóa không gian sống và tạo điểm nhấn trang trí cho căn phòng. Được thiết kế với nhiều kiểu dáng và chất liệu khác nhau như gỗ, kim loại, hay kính, giá trang trí treo tường mang lại sự linh hoạt và tiện dụng trong việc lưu trữ và trưng bày các vật dụng cá nhân, sách vở, cây cảnh nhỏ, hoặc các phụ kiện trang trí.', N'LN        ', 0.1, N'0.3', N'NV03      ', 1, N'abc       ', CAST(N'2024-06-05' AS Date), N'2024-06-05', N'Hình tròn', NULL)
INSERT [dbo].[SanPham] ([ma_san_pham], [ten_san_pham], [group_id], [gia_ban], [so_luong], [mo_ta], [thuong_hieu], [trong_luong], [kich_thuoc], [nguoi_them], [hien_thi], [phieu_nhap], [ngay_tao], [ngay_cap_nhat], [phan_loai], [trang_thai]) VALUES (24, N'Ghế xoay có bánh xe', N'008       ', 155000, 26, N'Sản phẩm trong hình là một chiếc ghế xoay có bánh xe, thường được sử dụng trong các văn phòng, phòng làm việc hoặc các môi trường cần sự di chuyển linh hoạt. Ghế có đệm ngồi tròn, bọc da hoặc giả da màu đen, với khả năng điều chỉnh độ cao bằng cần gạt nằm bên dưới đệm ngồi. Chân ghế được thiết kế với năm chân tỏa ra, mỗi chân đều có bánh xe để dễ dàng di chuyển. Thiết kế này mang lại sự tiện lợi và thoải mái cho người sử dụng, giúp dễ dàng di chuyển và điều chỉnh vị trí ngồi theo ý muốn.', N'LN        ', 2, N'0.5', N'NV03      ', 1, N'abc       ', CAST(N'2024-06-05' AS Date), N'2024-06-05', N'Màu đen', NULL)
INSERT [dbo].[SanPham] ([ma_san_pham], [ten_san_pham], [group_id], [gia_ban], [so_luong], [mo_ta], [thuong_hieu], [trong_luong], [kich_thuoc], [nguoi_them], [hien_thi], [phieu_nhap], [ngay_tao], [ngay_cap_nhat], [phan_loai], [trang_thai]) VALUES (25, N'Ghế xoay có bánh xe', N'008       ', 155000, 26, N'Sản phẩm trong hình là một chiếc ghế xoay có bánh xe, thường được sử dụng trong các văn phòng, phòng làm việc hoặc các môi trường cần sự di chuyển linh hoạt. Ghế có đệm ngồi tròn, bọc da hoặc giả da màu đen, với khả năng điều chỉnh độ cao bằng cần gạt nằm bên dưới đệm ngồi. Chân ghế được thiết kế với năm chân tỏa ra, mỗi chân đều có bánh xe để dễ dàng di chuyển. Thiết kế này mang lại sự tiện lợi và thoải mái cho người sử dụng, giúp dễ dàng di chuyển và điều chỉnh vị trí ngồi theo ý muốn.', N'LN        ', 2, N'0.5', N'NV03      ', 1, N'abc       ', CAST(N'2024-06-05' AS Date), N'2024-06-05', N'Màu hồng', NULL)
INSERT [dbo].[SanPham] ([ma_san_pham], [ten_san_pham], [group_id], [gia_ban], [so_luong], [mo_ta], [thuong_hieu], [trong_luong], [kich_thuoc], [nguoi_them], [hien_thi], [phieu_nhap], [ngay_tao], [ngay_cap_nhat], [phan_loai], [trang_thai]) VALUES (26, N'Ghế xoay có bánh xe', N'008       ', 155000, 90, N'Sản phẩm trong hình là một chiếc ghế xoay có bánh xe, thường được sử dụng trong các văn phòng, phòng làm việc hoặc các môi trường cần sự di chuyển linh hoạt. Ghế có đệm ngồi tròn, bọc da hoặc giả da màu đen, với khả năng điều chỉnh độ cao bằng cần gạt nằm bên dưới đệm ngồi. Chân ghế được thiết kế với năm chân tỏa ra, mỗi chân đều có bánh xe để dễ dàng di chuyển. Thiết kế này mang lại sự tiện lợi và thoải mái cho người sử dụng, giúp dễ dàng di chuyển và điều chỉnh vị trí ngồi theo ý muốn.', N'LN        ', 2, N'0.5', N'NV03      ', 1, N'abc       ', CAST(N'2024-06-05' AS Date), N'2024-06-05', N'Màu trắng', NULL)
INSERT [dbo].[SanPham] ([ma_san_pham], [ten_san_pham], [group_id], [gia_ban], [so_luong], [mo_ta], [thuong_hieu], [trong_luong], [kich_thuoc], [nguoi_them], [hien_thi], [phieu_nhap], [ngay_tao], [ngay_cap_nhat], [phan_loai], [trang_thai]) VALUES (27, N'Đèn sàn (đèn đứng)', N'009       ', 275000, 80, N'Chiếc đèn sàn này không chỉ cung cấp ánh sáng cần thiết mà còn đóng vai trò như một món đồ trang trí, góp phần tạo nên không gian sống ấm cúng và phong cách.', N't         ', 3, N'190', N'NV03      ', 1, N'abc       ', CAST(N'2024-06-06' AS Date), N'2024-06-06', N'Màu đen', NULL)
INSERT [dbo].[SanPham] ([ma_san_pham], [ten_san_pham], [group_id], [gia_ban], [so_luong], [mo_ta], [thuong_hieu], [trong_luong], [kich_thuoc], [nguoi_them], [hien_thi], [phieu_nhap], [ngay_tao], [ngay_cap_nhat], [phan_loai], [trang_thai]) VALUES (28, N'Đèn sàn (đèn đứng)', N'009       ', 275000, 80, N'Chiếc đèn sàn này không chỉ cung cấp ánh sáng cần thiết mà còn đóng vai trò như một món đồ trang trí, góp phần tạo nên không gian sống ấm cúng và phong cách.', N't         ', 3, N'190', N'NV03      ', 1, N'abc       ', CAST(N'2024-06-06' AS Date), N'2024-06-06', N'Màu trắng', NULL)
INSERT [dbo].[SanPham] ([ma_san_pham], [ten_san_pham], [group_id], [gia_ban], [so_luong], [mo_ta], [thuong_hieu], [trong_luong], [kich_thuoc], [nguoi_them], [hien_thi], [phieu_nhap], [ngay_tao], [ngay_cap_nhat], [phan_loai], [trang_thai]) VALUES (29, N'Đèn LED dây trang trí ', N'010       ', 50000, 300, N'Đèn được sử dụng để trang trí cho một quán cà phê hoặc nhà hàng, ngoài vườn, tạo nên không gian ấm cúng và hấp dẫn cho khách hàng. Ngoài ra, trong phần góc nhỏ, đèn còn được sử dụng để trang trí phòng ngủ hoặc phòng khách, tạo nên không gian lãng mạn và ấm áp', N't         ', 0.1, N'0.5', N'NV03      ', 1, N'abc       ', CAST(N'2024-06-06' AS Date), N'2024-06-06', N'Đèn dây 1 màu (1 dây)', NULL)
INSERT [dbo].[SanPham] ([ma_san_pham], [ten_san_pham], [group_id], [gia_ban], [so_luong], [mo_ta], [thuong_hieu], [trong_luong], [kich_thuoc], [nguoi_them], [hien_thi], [phieu_nhap], [ngay_tao], [ngay_cap_nhat], [phan_loai], [trang_thai]) VALUES (30, N'Đèn LED dây trang trí ', N'010       ', 40000, 300, N'èn được sử dụng để trang trí cho một quán cà phê hoặc nhà hàng, ngoài vườn, tạo nên không gian ấm cúng và hấp dẫn cho khách hàng. Ngoài ra, trong phần góc nhỏ, đèn còn được sử dụng để trang trí phòng ngủ hoặc phòng khách, tạo nên không gian lãng mạn và ấm áp', N't         ', 0.1, N'0.5', N'NV03      ', 1, N'abc       ', CAST(N'2024-06-06' AS Date), N'2024-06-06', N'Hình tròn (1 cuộn)', NULL)
INSERT [dbo].[SanPham] ([ma_san_pham], [ten_san_pham], [group_id], [gia_ban], [so_luong], [mo_ta], [thuong_hieu], [trong_luong], [kich_thuoc], [nguoi_them], [hien_thi], [phieu_nhap], [ngay_tao], [ngay_cap_nhat], [phan_loai], [trang_thai]) VALUES (31, N'Tranh treo tường có đèn ', N'011       ', 10000000, 100, N'Tranh treo tường thường có hình ảnh nghệ thuật, có thể là phong cảnh, hoa lá, chân dung, hoặc các họa tiết trừu tượng. Chất liệu của tranh có thể là canvas, gỗ, hoặc các chất liệu khác phù hợp với việc gắn đèn LED', N't         ', 5, N'300', N'NV03      ', 1, N'abc       ', CAST(N'2024-06-06' AS Date), N'2024-06-06', N'Tranh 1', NULL)
INSERT [dbo].[SanPham] ([ma_san_pham], [ten_san_pham], [group_id], [gia_ban], [so_luong], [mo_ta], [thuong_hieu], [trong_luong], [kich_thuoc], [nguoi_them], [hien_thi], [phieu_nhap], [ngay_tao], [ngay_cap_nhat], [phan_loai], [trang_thai]) VALUES (32, N'Tranh treo tường có đèn ', N'011       ', 15000000, 100, N'Tranh treo tường thường có hình ảnh nghệ thuật, có thể là phong cảnh, hoa lá, chân dung, hoặc các họa tiết trừu tượng. Chất liệu của tranh có thể là canvas, gỗ, hoặc các chất liệu khác phù hợp với việc gắn đèn LED', N't         ', 5, N'300', N'NV03      ', 1, N'abc       ', CAST(N'2024-06-06' AS Date), N'2024-06-06', N'Tranh 2', NULL)
INSERT [dbo].[SanPham] ([ma_san_pham], [ten_san_pham], [group_id], [gia_ban], [so_luong], [mo_ta], [thuong_hieu], [trong_luong], [kich_thuoc], [nguoi_them], [hien_thi], [phieu_nhap], [ngay_tao], [ngay_cap_nhat], [phan_loai], [trang_thai]) VALUES (33, N'Rêu giả, rêu nhân tạo trang trí vườn', N'012       ', 80000, 1220, N'Rêu giả trang trí tiểu cảnh sân vườn, chậu cây, decor mô hình, sự kiện', N'Ideal     ', 0.03, N'30', N'NV03      ', 1, N'abc       ', CAST(N'2024-06-06' AS Date), N'2024-06-06', N'30 g', NULL)
INSERT [dbo].[SanPham] ([ma_san_pham], [ten_san_pham], [group_id], [gia_ban], [so_luong], [mo_ta], [thuong_hieu], [trong_luong], [kich_thuoc], [nguoi_them], [hien_thi], [phieu_nhap], [ngay_tao], [ngay_cap_nhat], [phan_loai], [trang_thai]) VALUES (34, N'Rêu giả, rêu nhân tạo trang trí vườn', N'012       ', 80000, 1220, N'Rêu giả trang trí tiểu cảnh sân vườn, chậu cây, decor mô hình, sự kiện', N'Ideal     ', 0.1, N'100', N'NV03      ', 1, N'abc       ', CAST(N'2024-06-06' AS Date), N'2024-06-06', N'100g', NULL)
INSERT [dbo].[SanPham] ([ma_san_pham], [ten_san_pham], [group_id], [gia_ban], [so_luong], [mo_ta], [thuong_hieu], [trong_luong], [kich_thuoc], [nguoi_them], [hien_thi], [phieu_nhap], [ngay_tao], [ngay_cap_nhat], [phan_loai], [trang_thai]) VALUES (35, N'Đèn tường năng lượng mặt trời ngoài trời 8LED ', N'013       ', 120000, 100, N'Nguồn điện: Năng lượng mặt trời
Nguồn sáng: 2 / 4 / 6 / 8 / 10 LED
Màu ánh sáng: Ánh sáng trắng / Ánh sáng ấm
Bảng điều khiển năng lượng mặt trời: Bảng điều khiển năng lượng mặt trời 2V / 200mA (6 LED)', N'CASE      ', 1, N'1', N'NV03      ', 1, N'PN06Y2024 ', CAST(N'2024-06-06' AS Date), N'2024-06-06', N'Đèn ấm áp', NULL)
INSERT [dbo].[SanPham] ([ma_san_pham], [ten_san_pham], [group_id], [gia_ban], [so_luong], [mo_ta], [thuong_hieu], [trong_luong], [kich_thuoc], [nguoi_them], [hien_thi], [phieu_nhap], [ngay_tao], [ngay_cap_nhat], [phan_loai], [trang_thai]) VALUES (36, N'Đèn tường năng lượng mặt trời ngoài trời 8LED ', N'013       ', 120000, 100, N'Nguồn điện: Năng lượng mặt trời
Nguồn sáng: 2 / 4 / 6 / 8 / 10 LED
Màu ánh sáng: Ánh sáng trắng / Ánh sáng ấm
Bảng điều khiển năng lượng mặt trời: Bảng điều khiển năng lượng mặt trời 2V / 200mA (6 LED)', N'CASE      ', 1, N'1', N'NV03      ', 1, N'PN06Y2024 ', CAST(N'2024-06-06' AS Date), N'2024-06-06', N'Đèn trắng', NULL)
INSERT [dbo].[SanPham] ([ma_san_pham], [ten_san_pham], [group_id], [gia_ban], [so_luong], [mo_ta], [thuong_hieu], [trong_luong], [kich_thuoc], [nguoi_them], [hien_thi], [phieu_nhap], [ngay_tao], [ngay_cap_nhat], [phan_loai], [trang_thai]) VALUES (37, N'T', N'T         ', 222, 1, N'TT', N'CASE      ', 2321, N'T', N'NV01      ', 1, N'abc       ', CAST(N'2024-06-06' AS Date), N'2024-06-06', N'T', NULL)
SET IDENTITY_INSERT [dbo].[SanPham] OFF
GO
INSERT [dbo].[ThuongHieu] ([ma_thuong_hieu], [ten_thuong_hieu], [ngay_them], [ngay_cap_nhat], [nguoi_them]) VALUES (N'CASE      ', N'Steelcase', CAST(N'2024-06-06' AS Date), CAST(N'2024-06-06' AS Date), N'NV03      ')
INSERT [dbo].[ThuongHieu] ([ma_thuong_hieu], [ten_thuong_hieu], [ngay_them], [ngay_cap_nhat], [nguoi_them]) VALUES (N'FH        ', N'French Heritage', CAST(N'2024-06-06' AS Date), CAST(N'2024-06-06' AS Date), N'NV03      ')
INSERT [dbo].[ThuongHieu] ([ma_thuong_hieu], [ten_thuong_hieu], [ngay_them], [ngay_cap_nhat], [nguoi_them]) VALUES (N'HN        ', N'Harvey Norman', CAST(N'2024-06-06' AS Date), CAST(N'2024-06-06' AS Date), N'NV03      ')
INSERT [dbo].[ThuongHieu] ([ma_thuong_hieu], [ten_thuong_hieu], [ngay_them], [ngay_cap_nhat], [nguoi_them]) VALUES (N'Ideal     ', N'Forma Ideale', CAST(N'2024-06-06' AS Date), CAST(N'2024-06-06' AS Date), N'NV03      ')
INSERT [dbo].[ThuongHieu] ([ma_thuong_hieu], [ten_thuong_hieu], [ngay_them], [ngay_cap_nhat], [nguoi_them]) VALUES (N'LN        ', N'Ashley Furniture', CAST(N'2024-06-05' AS Date), CAST(N'2024-06-06' AS Date), N'NV03      ')
INSERT [dbo].[ThuongHieu] ([ma_thuong_hieu], [ten_thuong_hieu], [ngay_them], [ngay_cap_nhat], [nguoi_them]) VALUES (N't         ', N'Aaron', CAST(N'2024-01-01' AS Date), CAST(N'2024-06-06' AS Date), N'NV03      ')
INSERT [dbo].[ThuongHieu] ([ma_thuong_hieu], [ten_thuong_hieu], [ngay_them], [ngay_cap_nhat], [nguoi_them]) VALUES (N'TC        ', N'THÁI CÔNG INTERIOR DESIGN ', CAST(N'2024-06-06' AS Date), CAST(N'2024-06-06' AS Date), N'NV03      ')
INSERT [dbo].[ThuongHieu] ([ma_thuong_hieu], [ten_thuong_hieu], [ngay_them], [ngay_cap_nhat], [nguoi_them]) VALUES (N'TS        ', N'Nội thất Dietiker', CAST(N'2024-06-06' AS Date), CAST(N'2024-06-06' AS Date), N'NV03      ')
INSERT [dbo].[ThuongHieu] ([ma_thuong_hieu], [ten_thuong_hieu], [ngay_them], [ngay_cap_nhat], [nguoi_them]) VALUES (N'wwww      ', N' Dunelm Group', CAST(N'2024-05-27' AS Date), CAST(N'2024-06-06' AS Date), N'NV03      ')
GO
ALTER TABLE [dbo].[NhaCungCap] ADD  CONSTRAINT [DF_ngay_them]  DEFAULT (getdate()) FOR [ngay_them]
GO
ALTER TABLE [dbo].[NhaCungCap] ADD  CONSTRAINT [DF_ngay_cap_nhat]  DEFAULT (getdate()) FOR [ngay_cap_nhat]
GO
ALTER TABLE [dbo].[AnhSanPham]  WITH CHECK ADD  CONSTRAINT [FK_AnhSanPham_SanPham] FOREIGN KEY([ma_san_pham])
REFERENCES [dbo].[SanPham] ([ma_san_pham])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AnhSanPham] CHECK CONSTRAINT [FK_AnhSanPham_SanPham]
GO
ALTER TABLE [dbo].[BinhLuan]  WITH CHECK ADD  CONSTRAINT [FK_BinhLuan_KhachHang] FOREIGN KEY([nguoi_binh_luan])
REFERENCES [dbo].[KhachHang] ([ma_khach_hang])
GO
ALTER TABLE [dbo].[BinhLuan] CHECK CONSTRAINT [FK_BinhLuan_KhachHang]
GO
ALTER TABLE [dbo].[BinhLuan]  WITH CHECK ADD  CONSTRAINT [FK_BinhLuan_SanPham] FOREIGN KEY([san_pham])
REFERENCES [dbo].[SanPham] ([ma_san_pham])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BinhLuan] CHECK CONSTRAINT [FK_BinhLuan_SanPham]
GO
ALTER TABLE [dbo].[ChiTietDanhMuc]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietDanhMuc_ChiTietDanhMuc] FOREIGN KEY([ma_san_pham])
REFERENCES [dbo].[SanPham] ([ma_san_pham])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ChiTietDanhMuc] CHECK CONSTRAINT [FK_ChiTietDanhMuc_ChiTietDanhMuc]
GO
ALTER TABLE [dbo].[ChiTietDanhMuc]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietDanhMuc_ChiTietDanhMuc1] FOREIGN KEY([ma_danh_muc])
REFERENCES [dbo].[DanhMuc] ([ma_danh_muc])
GO
ALTER TABLE [dbo].[ChiTietDanhMuc] CHECK CONSTRAINT [FK_ChiTietDanhMuc_ChiTietDanhMuc1]
GO
ALTER TABLE [dbo].[ChiTietGioHang]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietGioHang_MaGiamGia] FOREIGN KEY([ma_giam_gia])
REFERENCES [dbo].[MaGiamGia] ([ma_giam_gia])
GO
ALTER TABLE [dbo].[ChiTietGioHang] CHECK CONSTRAINT [FK_ChiTietGioHang_MaGiamGia]
GO
ALTER TABLE [dbo].[ChiTietGioHang]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietGioHang_SanPham] FOREIGN KEY([ma_gio_hang])
REFERENCES [dbo].[GioHang] ([id])
GO
ALTER TABLE [dbo].[ChiTietGioHang] CHECK CONSTRAINT [FK_ChiTietGioHang_SanPham]
GO
ALTER TABLE [dbo].[ChiTietGioHang]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietGioHang_SanPham1] FOREIGN KEY([ma_san_pham])
REFERENCES [dbo].[SanPham] ([ma_san_pham])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ChiTietGioHang] CHECK CONSTRAINT [FK_ChiTietGioHang_SanPham1]
GO
ALTER TABLE [dbo].[ChiTietMaGiamGia]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietMaGiamGia_SanPham] FOREIGN KEY([ma_san_pham])
REFERENCES [dbo].[SanPham] ([ma_san_pham])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ChiTietMaGiamGia] CHECK CONSTRAINT [FK_ChiTietMaGiamGia_SanPham]
GO
ALTER TABLE [dbo].[ChiTietMaGiamGia]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietMaGiamGia_Voucher] FOREIGN KEY([ma_giam_gia])
REFERENCES [dbo].[MaGiamGia] ([ma_giam_gia])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ChiTietMaGiamGia] CHECK CONSTRAINT [FK_ChiTietMaGiamGia_Voucher]
GO
ALTER TABLE [dbo].[DanhMuc]  WITH CHECK ADD  CONSTRAINT [FK_DanhMuc_NhanVien] FOREIGN KEY([nguoi_them])
REFERENCES [dbo].[NhanVien] ([ma_nhan_vien])
GO
ALTER TABLE [dbo].[DanhMuc] CHECK CONSTRAINT [FK_DanhMuc_NhanVien]
GO
ALTER TABLE [dbo].[GioHang]  WITH CHECK ADD  CONSTRAINT [FK_GioHang_GioHang] FOREIGN KEY([ma_khach_hang])
REFERENCES [dbo].[KhachHang] ([ma_khach_hang])
GO
ALTER TABLE [dbo].[GioHang] CHECK CONSTRAINT [FK_GioHang_GioHang]
GO
ALTER TABLE [dbo].[MaGiamGia]  WITH CHECK ADD  CONSTRAINT [FK_MaGiamGia_NhanVien] FOREIGN KEY([nguoi_them])
REFERENCES [dbo].[NhanVien] ([ma_nhan_vien])
GO
ALTER TABLE [dbo].[MaGiamGia] CHECK CONSTRAINT [FK_MaGiamGia_NhanVien]
GO
ALTER TABLE [dbo].[NhaCungCap]  WITH CHECK ADD  CONSTRAINT [FK_NhaCungCap_NhanVien] FOREIGN KEY([nguoi_them])
REFERENCES [dbo].[NhanVien] ([ma_nhan_vien])
GO
ALTER TABLE [dbo].[NhaCungCap] CHECK CONSTRAINT [FK_NhaCungCap_NhanVien]
GO
ALTER TABLE [dbo].[PhieuNhapHang]  WITH CHECK ADD  CONSTRAINT [FK_PhieuNhapHang_NhaCungCap] FOREIGN KEY([nha_cung_cap])
REFERENCES [dbo].[NhaCungCap] ([ma_nha_cung_cap])
GO
ALTER TABLE [dbo].[PhieuNhapHang] CHECK CONSTRAINT [FK_PhieuNhapHang_NhaCungCap]
GO
ALTER TABLE [dbo].[PhieuNhapHang]  WITH CHECK ADD  CONSTRAINT [FK_PhieuNhapHang_NhanVien] FOREIGN KEY([nguoi_nhap])
REFERENCES [dbo].[NhanVien] ([ma_nhan_vien])
GO
ALTER TABLE [dbo].[PhieuNhapHang] CHECK CONSTRAINT [FK_PhieuNhapHang_NhanVien]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_NhanVien] FOREIGN KEY([nguoi_them])
REFERENCES [dbo].[NhanVien] ([ma_nhan_vien])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_NhanVien]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_PhieuNhapHang] FOREIGN KEY([phieu_nhap])
REFERENCES [dbo].[PhieuNhapHang] ([ma_phieu_nhap])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_PhieuNhapHang]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_ThuongHieu] FOREIGN KEY([thuong_hieu])
REFERENCES [dbo].[ThuongHieu] ([ma_thuong_hieu])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_ThuongHieu]
GO
ALTER TABLE [dbo].[SanPhamYeuThich]  WITH CHECK ADD  CONSTRAINT [FK_SanPhamYeuThich_KhachHang] FOREIGN KEY([ma_khach_hang])
REFERENCES [dbo].[KhachHang] ([ma_khach_hang])
GO
ALTER TABLE [dbo].[SanPhamYeuThich] CHECK CONSTRAINT [FK_SanPhamYeuThich_KhachHang]
GO
ALTER TABLE [dbo].[SanPhamYeuThich]  WITH CHECK ADD  CONSTRAINT [FK_SanPhamYeuThich_SanPham] FOREIGN KEY([ma_san_pham])
REFERENCES [dbo].[SanPham] ([ma_san_pham])
GO
ALTER TABLE [dbo].[SanPhamYeuThich] CHECK CONSTRAINT [FK_SanPhamYeuThich_SanPham]
GO
ALTER TABLE [dbo].[ThuongHieu]  WITH CHECK ADD  CONSTRAINT [FK_ThuongHieu_NhanVien] FOREIGN KEY([nguoi_them])
REFERENCES [dbo].[NhanVien] ([ma_nhan_vien])
GO
ALTER TABLE [dbo].[ThuongHieu] CHECK CONSTRAINT [FK_ThuongHieu_NhanVien]
GO
USE [master]
GO
ALTER DATABASE [T2CBee2] SET  READ_WRITE 
GO
