USE [master]
GO
/****** Object:  Database [T2CBee]    Script Date: 5/30/2024 12:18:37 PM ******/
CREATE DATABASE [T2CBee]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'java5', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.CONGHUAN\MSSQL\DATA\java5.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'java5_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.CONGHUAN\MSSQL\DATA\java5_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [T2CBee] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [T2CBee].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [T2CBee] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [T2CBee] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [T2CBee] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [T2CBee] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [T2CBee] SET ARITHABORT OFF 
GO
ALTER DATABASE [T2CBee] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [T2CBee] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [T2CBee] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [T2CBee] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [T2CBee] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [T2CBee] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [T2CBee] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [T2CBee] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [T2CBee] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [T2CBee] SET  DISABLE_BROKER 
GO
ALTER DATABASE [T2CBee] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [T2CBee] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [T2CBee] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [T2CBee] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [T2CBee] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [T2CBee] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [T2CBee] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [T2CBee] SET RECOVERY FULL 
GO
ALTER DATABASE [T2CBee] SET  MULTI_USER 
GO
ALTER DATABASE [T2CBee] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [T2CBee] SET DB_CHAINING OFF 
GO
ALTER DATABASE [T2CBee] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [T2CBee] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [T2CBee] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [T2CBee] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'T2CBee', N'ON'
GO
ALTER DATABASE [T2CBee] SET QUERY_STORE = ON
GO
ALTER DATABASE [T2CBee] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [T2CBee]
GO
/****** Object:  Table [dbo].[AnhSanPham]    Script Date: 5/30/2024 12:18:37 PM ******/
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
/****** Object:  Table [dbo].[BinhLuan]    Script Date: 5/30/2024 12:18:37 PM ******/
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
/****** Object:  Table [dbo].[ChiTietDanhMuc]    Script Date: 5/30/2024 12:18:37 PM ******/
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
/****** Object:  Table [dbo].[ChiTietGioHang]    Script Date: 5/30/2024 12:18:37 PM ******/
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
/****** Object:  Table [dbo].[ChiTietMaGiamGia]    Script Date: 5/30/2024 12:18:37 PM ******/
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
/****** Object:  Table [dbo].[DanhMuc]    Script Date: 5/30/2024 12:18:37 PM ******/
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
/****** Object:  Table [dbo].[GioHang]    Script Date: 5/30/2024 12:18:37 PM ******/
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
/****** Object:  Table [dbo].[KhachHang]    Script Date: 5/30/2024 12:18:37 PM ******/
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
/****** Object:  Table [dbo].[MaGiamGia]    Script Date: 5/30/2024 12:18:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaGiamGia](
	[ma_giam_gia] [char](20) NOT NULL,
	[discount] [char](10) NULL,
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
/****** Object:  Table [dbo].[NhaCungCap]    Script Date: 5/30/2024 12:18:37 PM ******/
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
/****** Object:  Table [dbo].[NhanVien]    Script Date: 5/30/2024 12:18:37 PM ******/
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
 CONSTRAINT [PK_NhanVien] PRIMARY KEY CLUSTERED 
(
	[ma_nhan_vien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhieuNhapHang]    Script Date: 5/30/2024 12:18:37 PM ******/
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
/****** Object:  Table [dbo].[SanPham]    Script Date: 5/30/2024 12:18:37 PM ******/
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
/****** Object:  Table [dbo].[SanPhamYeuThich]    Script Date: 5/30/2024 12:18:37 PM ******/
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
/****** Object:  Table [dbo].[ThuongHieu]    Script Date: 5/30/2024 12:18:37 PM ******/
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
INSERT [dbo].[AnhSanPham] ([id], [ma_san_pham], [url]) VALUES (8, 7, N'https:\/\/i.ibb.co\/42v5SGb\/0665768f2f6f.jpg')
INSERT [dbo].[AnhSanPham] ([id], [ma_san_pham], [url]) VALUES (9, 8, N'https:\/\/i.ibb.co\/42v5SGb\/0665768f2f6f.jpg')
INSERT [dbo].[AnhSanPham] ([id], [ma_san_pham], [url]) VALUES (10, 8, N'https:\/\/i.ibb.co\/sqSpZJs\/607f1dbc2890.jpg')
INSERT [dbo].[AnhSanPham] ([id], [ma_san_pham], [url]) VALUES (11, 8, N'https:\/\/i.ibb.co\/bbMz7Tm\/1823187d6ce8.jpg')
SET IDENTITY_INSERT [dbo].[AnhSanPham] OFF
GO
SET IDENTITY_INSERT [dbo].[BinhLuan] ON 

INSERT [dbo].[BinhLuan] ([id], [binh_luan], [ngay_binh_luan], [nguoi_binh_luan], [san_pham], [danh_gia], [bao_cao_sai_pham]) VALUES (1, N'Sản phẩm ok', CAST(N'2024-05-05' AS Date), 1, 1, 5, 0)
INSERT [dbo].[BinhLuan] ([id], [binh_luan], [ngay_binh_luan], [nguoi_binh_luan], [san_pham], [danh_gia], [bao_cao_sai_pham]) VALUES (2, N'sản phẩm như cứt', CAST(N'2024-01-01' AS Date), 1, 1, 1, 0)
SET IDENTITY_INSERT [dbo].[BinhLuan] OFF
GO
SET IDENTITY_INSERT [dbo].[ChiTietDanhMuc] ON 

INSERT [dbo].[ChiTietDanhMuc] ([id], [ma_san_pham], [ma_danh_muc]) VALUES (7, 2, 2)
INSERT [dbo].[ChiTietDanhMuc] ([id], [ma_san_pham], [ma_danh_muc]) VALUES (19, 3, 2)
INSERT [dbo].[ChiTietDanhMuc] ([id], [ma_san_pham], [ma_danh_muc]) VALUES (20, 3, 6)
INSERT [dbo].[ChiTietDanhMuc] ([id], [ma_san_pham], [ma_danh_muc]) VALUES (22, 7, 1)
INSERT [dbo].[ChiTietDanhMuc] ([id], [ma_san_pham], [ma_danh_muc]) VALUES (23, 8, 1)
INSERT [dbo].[ChiTietDanhMuc] ([id], [ma_san_pham], [ma_danh_muc]) VALUES (24, 8, 6)
INSERT [dbo].[ChiTietDanhMuc] ([id], [ma_san_pham], [ma_danh_muc]) VALUES (25, 8, 4)
INSERT [dbo].[ChiTietDanhMuc] ([id], [ma_san_pham], [ma_danh_muc]) VALUES (26, 2, 1)
INSERT [dbo].[ChiTietDanhMuc] ([id], [ma_san_pham], [ma_danh_muc]) VALUES (27, 2, 4)
INSERT [dbo].[ChiTietDanhMuc] ([id], [ma_san_pham], [ma_danh_muc]) VALUES (28, 7, 4)
INSERT [dbo].[ChiTietDanhMuc] ([id], [ma_san_pham], [ma_danh_muc]) VALUES (32, 2, 5)
INSERT [dbo].[ChiTietDanhMuc] ([id], [ma_san_pham], [ma_danh_muc]) VALUES (33, 2, 6)
INSERT [dbo].[ChiTietDanhMuc] ([id], [ma_san_pham], [ma_danh_muc]) VALUES (34, 2, 7)
INSERT [dbo].[ChiTietDanhMuc] ([id], [ma_san_pham], [ma_danh_muc]) VALUES (36, 1, 9)
SET IDENTITY_INSERT [dbo].[ChiTietDanhMuc] OFF
GO
SET IDENTITY_INSERT [dbo].[ChiTietGioHang] ON 

INSERT [dbo].[ChiTietGioHang] ([id], [ma_gio_hang], [ma_san_pham], [so_luong], [ma_giam_gia]) VALUES (1, 1, 1, 15, N'NOITHAT10           ')
INSERT [dbo].[ChiTietGioHang] ([id], [ma_gio_hang], [ma_san_pham], [so_luong], [ma_giam_gia]) VALUES (2, 1, 2, 22, NULL)
INSERT [dbo].[ChiTietGioHang] ([id], [ma_gio_hang], [ma_san_pham], [so_luong], [ma_giam_gia]) VALUES (3, 1, 3, 5, NULL)
SET IDENTITY_INSERT [dbo].[ChiTietGioHang] OFF
GO
SET IDENTITY_INSERT [dbo].[ChiTietMaGiamGia] ON 

INSERT [dbo].[ChiTietMaGiamGia] ([ma_san_pham], [ma_giam_gia], [id]) VALUES (1, N'NOITHAT10           ', 1)
INSERT [dbo].[ChiTietMaGiamGia] ([ma_san_pham], [ma_giam_gia], [id]) VALUES (2, N'NOITHAT10           ', 2)
INSERT [dbo].[ChiTietMaGiamGia] ([ma_san_pham], [ma_giam_gia], [id]) VALUES (1, N'TEST                ', 6)
INSERT [dbo].[ChiTietMaGiamGia] ([ma_san_pham], [ma_giam_gia], [id]) VALUES (2, N'TEST                ', 7)
INSERT [dbo].[ChiTietMaGiamGia] ([ma_san_pham], [ma_giam_gia], [id]) VALUES (3, N'TEST                ', 8)
INSERT [dbo].[ChiTietMaGiamGia] ([ma_san_pham], [ma_giam_gia], [id]) VALUES (2, N'TYEST               ', 14)
INSERT [dbo].[ChiTietMaGiamGia] ([ma_san_pham], [ma_giam_gia], [id]) VALUES (3, N'TYEST               ', 15)
INSERT [dbo].[ChiTietMaGiamGia] ([ma_san_pham], [ma_giam_gia], [id]) VALUES (3, N'GIAMGIA100          ', 24)
INSERT [dbo].[ChiTietMaGiamGia] ([ma_san_pham], [ma_giam_gia], [id]) VALUES (1, N'FLASHSALE11         ', 25)
INSERT [dbo].[ChiTietMaGiamGia] ([ma_san_pham], [ma_giam_gia], [id]) VALUES (2, N'FLASHSALE11         ', 26)
INSERT [dbo].[ChiTietMaGiamGia] ([ma_san_pham], [ma_giam_gia], [id]) VALUES (3, N'FLASHSALE11         ', 27)
INSERT [dbo].[ChiTietMaGiamGia] ([ma_san_pham], [ma_giam_gia], [id]) VALUES (8, N'TEST100             ', 28)
INSERT [dbo].[ChiTietMaGiamGia] ([ma_san_pham], [ma_giam_gia], [id]) VALUES (2, N'TEST100             ', 29)
SET IDENTITY_INSERT [dbo].[ChiTietMaGiamGia] OFF
GO
SET IDENTITY_INSERT [dbo].[DanhMuc] ON 

INSERT [dbo].[DanhMuc] ([ma_danh_muc], [ten_danh_muc], [ngay_them], [ngay_xoa], [ngay_cap_nhat], [nguoi_them]) VALUES (1, N'Nội Thất', CAST(N'2024-05-26' AS Date), NULL, CAST(N'2024-05-27' AS Date), N'NV01      ')
INSERT [dbo].[DanhMuc] ([ma_danh_muc], [ten_danh_muc], [ngay_them], [ngay_xoa], [ngay_cap_nhat], [nguoi_them]) VALUES (2, N'Trang Trí', CAST(N'2024-05-26' AS Date), NULL, CAST(N'2024-05-26' AS Date), N'NV01      ')
INSERT [dbo].[DanhMuc] ([ma_danh_muc], [ten_danh_muc], [ngay_them], [ngay_xoa], [ngay_cap_nhat], [nguoi_them]) VALUES (4, N'Chiếu Sáng', CAST(N'2024-05-27' AS Date), NULL, CAST(N'2024-05-27' AS Date), N'NV01      ')
INSERT [dbo].[DanhMuc] ([ma_danh_muc], [ten_danh_muc], [ngay_them], [ngay_xoa], [ngay_cap_nhat], [nguoi_them]) VALUES (5, N'Ngoài Trời', CAST(N'2024-05-27' AS Date), NULL, CAST(N'2024-05-27' AS Date), N'NV01      ')
INSERT [dbo].[DanhMuc] ([ma_danh_muc], [ten_danh_muc], [ngay_them], [ngay_xoa], [ngay_cap_nhat], [nguoi_them]) VALUES (6, N'Sân Vườn', CAST(N'2024-05-27' AS Date), NULL, CAST(N'2024-05-27' AS Date), N'NV01      ')
INSERT [dbo].[DanhMuc] ([ma_danh_muc], [ten_danh_muc], [ngay_them], [ngay_xoa], [ngay_cap_nhat], [nguoi_them]) VALUES (7, N'Phụ Kiện', CAST(N'2024-05-27' AS Date), NULL, CAST(N'2024-05-27' AS Date), N'NV01      ')
INSERT [dbo].[DanhMuc] ([ma_danh_muc], [ten_danh_muc], [ngay_them], [ngay_xoa], [ngay_cap_nhat], [nguoi_them]) VALUES (9, N'TEST', CAST(N'2024-05-30' AS Date), NULL, CAST(N'2024-05-30' AS Date), N'NV01      ')
SET IDENTITY_INSERT [dbo].[DanhMuc] OFF
GO
SET IDENTITY_INSERT [dbo].[GioHang] ON 

INSERT [dbo].[GioHang] ([id], [ma_khach_hang], [ngay_tao], [trang_thai]) VALUES (1, 1, CAST(N'2024-01-01' AS Date), N'DANG_GIAO_HANG           ')
INSERT [dbo].[GioHang] ([id], [ma_khach_hang], [ngay_tao], [trang_thai]) VALUES (2, 2, CAST(N'2024-01-01' AS Date), N'DANG_CHO                 ')
SET IDENTITY_INSERT [dbo].[GioHang] OFF
GO
SET IDENTITY_INSERT [dbo].[KhachHang] ON 

INSERT [dbo].[KhachHang] ([ma_khach_hang], [ho_va_ten], [password], [email], [so_dien_thoai], [gioi_tinh], [dia_chi], [ngay_sinh], [ngay_tao], [ngay_cap_nhat]) VALUES (1, N'Trần Thế Lâm', N'123', N'lam@sample.com', N'0987654321    ', 0, N'HCM', CAST(N'2024-01-25' AS Date), CAST(N'2024-05-27' AS Date), CAST(N'2024-05-29' AS Date))
INSERT [dbo].[KhachHang] ([ma_khach_hang], [ho_va_ten], [password], [email], [so_dien_thoai], [gioi_tinh], [dia_chi], [ngay_sinh], [ngay_tao], [ngay_cap_nhat]) VALUES (2, N'Khấu Tuấn Kha', N'321', N'kha@sample.com', N'0987654321    ', 1, N'', CAST(N'2024-10-26' AS Date), CAST(N'2024-05-27' AS Date), CAST(N'2024-05-28' AS Date))
INSERT [dbo].[KhachHang] ([ma_khach_hang], [ho_va_ten], [password], [email], [so_dien_thoai], [gioi_tinh], [dia_chi], [ngay_sinh], [ngay_tao], [ngay_cap_nhat]) VALUES (4, N'tét', N'1', N'1', N'1             ', 1, N'1', CAST(N'2024-05-22' AS Date), CAST(N'2024-05-28' AS Date), CAST(N'2024-05-28' AS Date))
INSERT [dbo].[KhachHang] ([ma_khach_hang], [ho_va_ten], [password], [email], [so_dien_thoai], [gioi_tinh], [dia_chi], [ngay_sinh], [ngay_tao], [ngay_cap_nhat]) VALUES (5, N't', N't', N't', N't             ', 0, N'HCM', CAST(N'2024-05-09' AS Date), CAST(N'2024-05-28' AS Date), CAST(N'2024-05-28' AS Date))
INSERT [dbo].[KhachHang] ([ma_khach_hang], [ho_va_ten], [password], [email], [so_dien_thoai], [gioi_tinh], [dia_chi], [ngay_sinh], [ngay_tao], [ngay_cap_nhat]) VALUES (6, N't', N't', N't', N't             ', 0, N't', CAST(N'2024-05-01' AS Date), CAST(N'2024-05-28' AS Date), CAST(N'2024-05-30' AS Date))
INSERT [dbo].[KhachHang] ([ma_khach_hang], [ho_va_ten], [password], [email], [so_dien_thoai], [gioi_tinh], [dia_chi], [ngay_sinh], [ngay_tao], [ngay_cap_nhat]) VALUES (7, N'1', N'', N'', N'              ', 0, N'', CAST(N'2024-05-30' AS Date), CAST(N'2024-05-28' AS Date), CAST(N'2024-05-28' AS Date))
SET IDENTITY_INSERT [dbo].[KhachHang] OFF
GO
INSERT [dbo].[MaGiamGia] ([ma_giam_gia], [discount], [ngay_bat_dau], [ngay_ket_thuc], [so_luong], [nguoi_them], [ngay_tao], [ngay_cap_nhat]) VALUES (N'FLASHSALE11         ', N'0.5       ', CAST(N'2024-05-01' AS Date), CAST(N'2024-05-01' AS Date), 100, N'NV01      ', CAST(N'2024-01-01' AS Date), CAST(N'2024-05-30' AS Date))
INSERT [dbo].[MaGiamGia] ([ma_giam_gia], [discount], [ngay_bat_dau], [ngay_ket_thuc], [so_luong], [nguoi_them], [ngay_tao], [ngay_cap_nhat]) VALUES (N'GIAMGIA100          ', N'1         ', NULL, NULL, 100, N'NV01      ', CAST(N'2024-05-29' AS Date), CAST(N'2024-05-29' AS Date))
INSERT [dbo].[MaGiamGia] ([ma_giam_gia], [discount], [ngay_bat_dau], [ngay_ket_thuc], [so_luong], [nguoi_them], [ngay_tao], [ngay_cap_nhat]) VALUES (N'NOITHAT10           ', N'0.1       ', CAST(N'2024-01-01' AS Date), CAST(N'2025-01-01' AS Date), 100, N'NV01      ', CAST(N'2024-01-01' AS Date), CAST(N'2024-01-01' AS Date))
INSERT [dbo].[MaGiamGia] ([ma_giam_gia], [discount], [ngay_bat_dau], [ngay_ket_thuc], [so_luong], [nguoi_them], [ngay_tao], [ngay_cap_nhat]) VALUES (N'TEST                ', N'0.5       ', NULL, NULL, 222, N'NV01      ', CAST(N'2024-05-29' AS Date), CAST(N'2024-05-29' AS Date))
INSERT [dbo].[MaGiamGia] ([ma_giam_gia], [discount], [ngay_bat_dau], [ngay_ket_thuc], [so_luong], [nguoi_them], [ngay_tao], [ngay_cap_nhat]) VALUES (N'TEST100             ', N'1         ', CAST(N'2024-05-01' AS Date), CAST(N'2024-05-01' AS Date), 1, N'NV01      ', CAST(N'2024-05-30' AS Date), CAST(N'2024-05-30' AS Date))
INSERT [dbo].[MaGiamGia] ([ma_giam_gia], [discount], [ngay_bat_dau], [ngay_ket_thuc], [so_luong], [nguoi_them], [ngay_tao], [ngay_cap_nhat]) VALUES (N'TYEST               ', N'33        ', NULL, NULL, 2, N'NV01      ', CAST(N'2024-05-29' AS Date), CAST(N'2024-05-29' AS Date))
GO
INSERT [dbo].[NhaCungCap] ([ma_nha_cung_cap], [ten_nha_cung_cap], [ma_so_thue], [so_dien_thoai], [dia_chi], [nguoi_them], [ngay_them], [ngay_cap_nhat]) VALUES (N'AConcept  ', N'AConcept', N'999       ', N'0987654321    ', N'HCM', N'NV01      ', CAST(N'2024-05-26' AS Date), CAST(N'2024-05-26' AS Date))
INSERT [dbo].[NhaCungCap] ([ma_nha_cung_cap], [ten_nha_cung_cap], [ma_so_thue], [so_dien_thoai], [dia_chi], [nguoi_them], [ngay_them], [ngay_cap_nhat]) VALUES (N'Baya      ', N'Baya', N'786       ', N'0987654321    ', N'Hà Nội', N'NV01      ', CAST(N'2024-05-26' AS Date), CAST(N'2024-05-26' AS Date))
INSERT [dbo].[NhaCungCap] ([ma_nha_cung_cap], [ten_nha_cung_cap], [ma_so_thue], [so_dien_thoai], [dia_chi], [nguoi_them], [ngay_them], [ngay_cap_nhat]) VALUES (N'Eames     ', N'Eames', N'675       ', N'0987654321    ', N'Đồng Nai', N'NV01      ', CAST(N'2024-05-26' AS Date), CAST(N'2024-05-26' AS Date))
INSERT [dbo].[NhaCungCap] ([ma_nha_cung_cap], [ten_nha_cung_cap], [ma_so_thue], [so_dien_thoai], [dia_chi], [nguoi_them], [ngay_them], [ngay_cap_nhat]) VALUES (N'Hiroshima ', N'Hiroshima', N'5555      ', N'0987654321    ', N'HCM', N'NV01      ', CAST(N'2024-05-26' AS Date), CAST(N'2024-05-26' AS Date))
INSERT [dbo].[NhaCungCap] ([ma_nha_cung_cap], [ten_nha_cung_cap], [ma_so_thue], [so_dien_thoai], [dia_chi], [nguoi_them], [ngay_them], [ngay_cap_nhat]) VALUES (N'Kimdang   ', N'Kim Đang', N'525253    ', N'0987654321    ', N'HCM', N'NV01      ', CAST(N'2024-05-26' AS Date), CAST(N'2024-05-26' AS Date))
INSERT [dbo].[NhaCungCap] ([ma_nha_cung_cap], [ten_nha_cung_cap], [ma_so_thue], [so_dien_thoai], [dia_chi], [nguoi_them], [ngay_them], [ngay_cap_nhat]) VALUES (N'Louis     ', N'Louis', N'34213     ', N'0987654321    ', N'Mỹ', N'NV01      ', CAST(N'2024-05-26' AS Date), CAST(N'2024-05-26' AS Date))
INSERT [dbo].[NhaCungCap] ([ma_nha_cung_cap], [ten_nha_cung_cap], [ma_so_thue], [so_dien_thoai], [dia_chi], [nguoi_them], [ngay_them], [ngay_cap_nhat]) VALUES (N'THAICONG  ', N'Thái Công', N'123       ', N'0987654321    ', N'HCM', N'NV01      ', CAST(N'2024-05-05' AS Date), CAST(N'2024-05-05' AS Date))
GO
INSERT [dbo].[NhanVien] ([ma_nhan_vien], [ho_ten], [chuc_vu], [dia_chi], [email], [gioi_tinh], [so_dien_thoai], [ngay_vao], [ngay_cap_nhat]) VALUES (N'NV01      ', N'Lương Công Huấn', 1, N'Đồng Nai', N'huanluongcong@gmail.com', 1, N'0987654321    ', CAST(N'2024-03-27' AS Date), CAST(N'2024-03-27' AS Date))
INSERT [dbo].[NhanVien] ([ma_nhan_vien], [ho_ten], [chuc_vu], [dia_chi], [email], [gioi_tinh], [so_dien_thoai], [ngay_vao], [ngay_cap_nhat]) VALUES (N'NV02      ', N'Nguyễn Quang Hoài Nam', 0, N'HCM', N'nam@sample.com', 1, N'0987654321    ', CAST(N'2024-03-27' AS Date), CAST(N'2024-03-27' AS Date))
INSERT [dbo].[NhanVien] ([ma_nhan_vien], [ho_ten], [chuc_vu], [dia_chi], [email], [gioi_tinh], [so_dien_thoai], [ngay_vao], [ngay_cap_nhat]) VALUES (N'NV03      ', N'Mai Thị Mỹ Linh', 0, N'HCM', N'linh@sample.com', 0, N'0987654321    ', CAST(N'2024-03-27' AS Date), CAST(N'2024-03-27' AS Date))
INSERT [dbo].[NhanVien] ([ma_nhan_vien], [ho_ten], [chuc_vu], [dia_chi], [email], [gioi_tinh], [so_dien_thoai], [ngay_vao], [ngay_cap_nhat]) VALUES (N'NV04      ', N'Tính bca', 0, N'HCM', N'tinh@sample.com.vn', 1, N'0987654321    ', CAST(N'2024-05-27' AS Date), CAST(N'2024-05-27' AS Date))
INSERT [dbo].[NhanVien] ([ma_nhan_vien], [ho_ten], [chuc_vu], [dia_chi], [email], [gioi_tinh], [so_dien_thoai], [ngay_vao], [ngay_cap_nhat]) VALUES (N'NV05      ', N'phát', 1, N'HCM', N'phat@sample.com', 1, N'0987654321    ', CAST(N'2024-05-27' AS Date), CAST(N'2024-05-27' AS Date))
INSERT [dbo].[NhanVien] ([ma_nhan_vien], [ho_ten], [chuc_vu], [dia_chi], [email], [gioi_tinh], [so_dien_thoai], [ngay_vao], [ngay_cap_nhat]) VALUES (N'qly       ', N'2', 1, N'2', N'2', 0, N'2             ', CAST(N'2024-05-27' AS Date), CAST(N'2024-05-27' AS Date))
GO
INSERT [dbo].[PhieuNhapHang] ([ma_phieu_nhap], [nha_cung_cap], [trang_thai], [nguoi_nhap], [ngay_nhap], [ngay_cap_nhat]) VALUES (N'abc       ', N'AConcept  ', N'DANG_HOAN_THANH', N'NV01      ', CAST(N'2024-05-27' AS Date), CAST(N'2024-05-27' AS Date))
INSERT [dbo].[PhieuNhapHang] ([ma_phieu_nhap], [nha_cung_cap], [trang_thai], [nguoi_nhap], [ngay_nhap], [ngay_cap_nhat]) VALUES (N'test      ', N'Baya      ', N'DANG_HOAN_THANH', N'NV01      ', CAST(N'2024-05-27' AS Date), CAST(N'2024-05-27' AS Date))
GO
SET IDENTITY_INSERT [dbo].[SanPham] ON 

INSERT [dbo].[SanPham] ([ma_san_pham], [ten_san_pham], [group_id], [gia_ban], [so_luong], [mo_ta], [thuong_hieu], [trong_luong], [kich_thuoc], [nguoi_them], [hien_thi], [phieu_nhap], [ngay_tao], [ngay_cap_nhat], [phan_loai], [trang_thai]) VALUES (1, N'Bàn học siêu bền', N'g1        ', 122, 1, N'1', N't         ', 0, N'1', N'NV01      ', 1, N'abc       ', NULL, N'2024-05-30', N'Đen', NULL)
INSERT [dbo].[SanPham] ([ma_san_pham], [ten_san_pham], [group_id], [gia_ban], [so_luong], [mo_ta], [thuong_hieu], [trong_luong], [kich_thuoc], [nguoi_them], [hien_thi], [phieu_nhap], [ngay_tao], [ngay_cap_nhat], [phan_loai], [trang_thai]) VALUES (2, N'Bàn học siêu bền', N'g1        ', 225, 23, N'1', N't         ', 0, N'2', N'NV01      ', 1, N'abc       ', NULL, N'2024-05-28', N'Hồng', NULL)
INSERT [dbo].[SanPham] ([ma_san_pham], [ten_san_pham], [group_id], [gia_ban], [so_luong], [mo_ta], [thuong_hieu], [trong_luong], [kich_thuoc], [nguoi_them], [hien_thi], [phieu_nhap], [ngay_tao], [ngay_cap_nhat], [phan_loai], [trang_thai]) VALUES (3, N'Bàn học siêu bền', N'g1        ', 340, 1, N'1', N't         ', 0, N'2', N'NV01      ', 1, N'abc       ', NULL, N'2024-05-28', N'Trắng', NULL)
INSERT [dbo].[SanPham] ([ma_san_pham], [ten_san_pham], [group_id], [gia_ban], [so_luong], [mo_ta], [thuong_hieu], [trong_luong], [kich_thuoc], [nguoi_them], [hien_thi], [phieu_nhap], [ngay_tao], [ngay_cap_nhat], [phan_loai], [trang_thai]) VALUES (7, N'Miu', N'miudoll   ', 20000000, 21, N'hàng mới về ae ơi!!!', N'wwww      ', 50, N'1000', NULL, 1, N'abc       ', CAST(N'2024-05-28' AS Date), N'2024-05-28', N'mới nguyên seal', NULL)
INSERT [dbo].[SanPham] ([ma_san_pham], [ten_san_pham], [group_id], [gia_ban], [so_luong], [mo_ta], [thuong_hieu], [trong_luong], [kich_thuoc], [nguoi_them], [hien_thi], [phieu_nhap], [ngay_tao], [ngay_cap_nhat], [phan_loai], [trang_thai]) VALUES (8, N'Miu', N'miudoll   ', 22222222222222, 24, N'hàng cũ nhưng mới ', N't         ', 50, N'223131', NULL, 1, N'abc       ', CAST(N'2024-05-28' AS Date), N'2024-05-28', N'99%', NULL)
SET IDENTITY_INSERT [dbo].[SanPham] OFF
GO
INSERT [dbo].[ThuongHieu] ([ma_thuong_hieu], [ten_thuong_hieu], [ngay_them], [ngay_cap_nhat], [nguoi_them]) VALUES (N't         ', N'TEST', CAST(N'2024-01-01' AS Date), CAST(N'2024-05-28' AS Date), N'NV01      ')
INSERT [dbo].[ThuongHieu] ([ma_thuong_hieu], [ten_thuong_hieu], [ngay_them], [ngay_cap_nhat], [nguoi_them]) VALUES (N'wwww      ', N'TEST', CAST(N'2024-05-27' AS Date), CAST(N'2024-05-27' AS Date), N'NV01      ')
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
GO
ALTER TABLE [dbo].[ChiTietGioHang] CHECK CONSTRAINT [FK_ChiTietGioHang_SanPham1]
GO
ALTER TABLE [dbo].[ChiTietMaGiamGia]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietMaGiamGia_SanPham] FOREIGN KEY([ma_san_pham])
REFERENCES [dbo].[SanPham] ([ma_san_pham])
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
ALTER DATABASE [T2CBee] SET  READ_WRITE 
GO
