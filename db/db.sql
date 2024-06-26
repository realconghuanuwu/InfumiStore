USE [master]
GO
/****** Object:  Database [InfumiStore]    Script Date: 4/8/2024 6:52:01 AM ******/
CREATE DATABASE [InfumiStore]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'InfumiStore', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.CONGHUAN\MSSQL\DATA\InfumiStore.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'InfumiStore_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.CONGHUAN\MSSQL\DATA\InfumiStore_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [InfumiStore] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [InfumiStore].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [InfumiStore] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [InfumiStore] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [InfumiStore] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [InfumiStore] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [InfumiStore] SET ARITHABORT OFF 
GO
ALTER DATABASE [InfumiStore] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [InfumiStore] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [InfumiStore] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [InfumiStore] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [InfumiStore] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [InfumiStore] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [InfumiStore] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [InfumiStore] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [InfumiStore] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [InfumiStore] SET  DISABLE_BROKER 
GO
ALTER DATABASE [InfumiStore] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [InfumiStore] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [InfumiStore] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [InfumiStore] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [InfumiStore] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [InfumiStore] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [InfumiStore] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [InfumiStore] SET RECOVERY FULL 
GO
ALTER DATABASE [InfumiStore] SET  MULTI_USER 
GO
ALTER DATABASE [InfumiStore] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [InfumiStore] SET DB_CHAINING OFF 
GO
ALTER DATABASE [InfumiStore] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [InfumiStore] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [InfumiStore] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [InfumiStore] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'InfumiStore', N'ON'
GO
ALTER DATABASE [InfumiStore] SET QUERY_STORE = ON
GO
ALTER DATABASE [InfumiStore] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [InfumiStore]
GO
/****** Object:  Table [dbo].[AnhSanPham]    Script Date: 4/8/2024 6:52:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AnhSanPham](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ma_san_pham] [int] NOT NULL,
	[ten] [nvarchar](max) NULL,
 CONSTRAINT [PK_AnhSanPham] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietGioHang]    Script Date: 4/8/2024 6:52:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietGioHang](
	[ma_gio_hang] [int] NOT NULL,
	[ma_san_pham] [int] NOT NULL,
	[so_luong] [int] NOT NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_ChiTietGioHang_1] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietHoaDon]    Script Date: 4/8/2024 6:52:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietHoaDon](
	[ma_hoa_don] [int] NOT NULL,
	[ma_san_pham] [int] NOT NULL,
	[so_luong] [int] NOT NULL,
	[id] [int] NOT NULL,
 CONSTRAINT [PK_ChiTietHoaDon] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DanhGiaSanPham]    Script Date: 4/8/2024 6:52:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DanhGiaSanPham](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[like_numbers] [int] NULL,
	[review_date] [date] NULL,
	[comment] [nvarchar](200) NULL,
	[image] [nchar](10) NULL,
	[user_id] [int] NULL,
	[product_id] [int] NULL,
 CONSTRAINT [PK_Review] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GioHang]    Script Date: 4/8/2024 6:52:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GioHang](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ma_khach_hang] [int] NOT NULL,
	[ngay_tao] [date] NULL,
 CONSTRAINT [PK_GioHang] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 4/8/2024 6:52:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDon](
	[id] [int] NOT NULL,
	[ma_khach_hang] [int] NULL,
	[ngay_tao] [date] NULL,
	[trang_thai] [nvarchar](50) NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 4/8/2024 6:52:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ten] [nvarchar](50) NULL,
	[ho_va_ten_lot] [nvarchar](50) NULL,
	[password] [char](50) NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	[so_dien_thoai] [varchar](15) NULL,
	[gioi_tinh] [bit] NULL,
	[dia_chi] [nvarchar](150) NULL,
	[ngay_sinh] [date] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhaCungCap]    Script Date: 4/8/2024 6:52:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhaCungCap](
	[id] [nchar](10) NOT NULL,
	[full_name] [nvarchar](150) NULL,
	[short_name] [nvarchar](50) NULL,
	[email] [varchar](100) NULL,
	[so_dien_thoai] [varchar](15) NULL,
	[dia_chi] [nvarchar](200) NULL,
	[ma_so_thue] [varchar](50) NULL,
 CONSTRAINT [PK_Supplier] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 4/8/2024 6:52:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVien](
	[id] [varchar](50) NOT NULL,
	[ten] [nvarchar](50) NOT NULL,
	[ho_va_ten_lot] [nvarchar](70) NOT NULL,
	[mat_khau] [char](50) NOT NULL,
	[email] [varchar](50) NULL,
	[so_dien_thoai] [char](15) NULL,
	[vai_tro] [int] NOT NULL,
	[ngay_sinh] [date] NULL,
	[dia_chi] [nvarchar](150) NULL,
	[gioi_tinh] [bit] NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhaXuatBan]    Script Date: 4/8/2024 6:52:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhaXuatBan](
	[id] [nchar](10) NOT NULL,
	[ten] [nvarchar](150) NULL,
	[email] [varchar](100) NULL,
	[so_dien_thoai] [varchar](15) NULL,
	[dia_chi] [nvarchar](200) NULL,
	[ma_so_thue] [varchar](50) NULL,
 CONSTRAINT [PK_Publisher] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhanLoai]    Script Date: 4/8/2024 6:52:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhanLoai](
	[id] [char](10) NOT NULL,
	[ten_phan_loai] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_BookClass] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 4/8/2024 6:52:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tieu_de] [nvarchar](max) NOT NULL,
	[tac_gia] [int] NOT NULL,
	[don_gia] [money] NOT NULL,
	[nam_xuat_ban] [smallint] NULL,
	[mo_ta] [nvarchar](max) NULL,
	[kich_thuoc] [nvarchar](50) NULL,
	[so_trang] [int] NOT NULL,
	[giam_gia] [float] NULL,
	[ngon_ngu] [nvarchar](25) NULL,
	[kieu_bia] [nvarchar](25) NULL,
	[so_luong] [int] NULL,
	[do_tuoi] [int] NULL,
	[ngay_cap_nhat_moi_nhat] [date] NULL,
	[ngay_nhap] [date] NOT NULL,
	[nguoi_dich] [nvarchar](50) NULL,
	[can_nang] [float] NULL,
	[the_loai] [nchar](10) NULL,
	[nha_xuat_ban] [nchar](10) NULL,
	[phan_loai] [char](10) NULL,
	[nguoi_nhap] [varchar](50) NULL,
	[trang_thai] [bit] NULL,
	[nha_cung_cap] [nchar](10) NULL,
	[so_luot_ban] [int] NULL,
	[danh_gia] [smallint] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TacGia]    Script Date: 4/8/2024 6:52:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TacGia](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ho_ten] [nvarchar](50) NULL,
 CONSTRAINT [PK_Author] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TheLoai]    Script Date: 4/8/2024 6:52:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TheLoai](
	[id] [nchar](10) NOT NULL,
	[ten_the_loai] [nvarchar](50) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[AnhSanPham] ON 

INSERT [dbo].[AnhSanPham] ([id], [ma_san_pham], [ten]) VALUES (1, 1, N'arya_ban_ben_thinh_thoang_lai_treu_gheo_toi_bang_tieng_nga_tap_4-5_bia_ao_2_1.jpg')
INSERT [dbo].[AnhSanPham] ([id], [ma_san_pham], [ten]) VALUES (2, 1, N'arya_ban_ben_thinh_thoang_lai_treu_gheo_toi_bang_tieng_nga_tap_4-5_ban_boxset_2.jpg')
INSERT [dbo].[AnhSanPham] ([id], [ma_san_pham], [ten]) VALUES (3, 6, N'duoc_su_tu_su_tap_1_manga_bia_1.jpg')
INSERT [dbo].[AnhSanPham] ([id], [ma_san_pham], [ten]) VALUES (4, 6, N'600duoc-su-tu-su_tap-1-manga_qua-tang.jpg')
INSERT [dbo].[AnhSanPham] ([id], [ma_san_pham], [ten]) VALUES (7, 8, N'thien_su_nha_ben_tap_1_bia.jpg')
INSERT [dbo].[AnhSanPham] ([id], [ma_san_pham], [ten]) VALUES (8, 8, N'600thien-su-nha-ben_tap-1_ban-pho-thong.jpg')
INSERT [dbo].[AnhSanPham] ([id], [ma_san_pham], [ten]) VALUES (9, 13, N'thien_su_nha_ben_manga_vol_2.jpg')
INSERT [dbo].[AnhSanPham] ([id], [ma_san_pham], [ten]) VALUES (10, 13, N'thien_su_nha_ben_manga_vol_2_tang_bookmark_postcard.jpg')
INSERT [dbo].[AnhSanPham] ([id], [ma_san_pham], [ten]) VALUES (11, 14, N'thien_su_nha_ben_manga_tap_1_bia_2.jpg')
INSERT [dbo].[AnhSanPham] ([id], [ma_san_pham], [ten]) VALUES (12, 14, N'thien_su_nha_ben_manga_tap_1_tang_bookmark_postcard_2.jpg')
INSERT [dbo].[AnhSanPham] ([id], [ma_san_pham], [ten]) VALUES (13, 14, N'thien-su-nha-ben_manga_tap-1_qua-tang-them_1.jpg')
INSERT [dbo].[AnhSanPham] ([id], [ma_san_pham], [ten]) VALUES (14, 15, N'duoc_su_tu_su_-_tap_6.jpg')
INSERT [dbo].[AnhSanPham] ([id], [ma_san_pham], [ten]) VALUES (15, 15, N'duoc_su_tu_su_-_tap_6_-_tang_standee.jpg')
INSERT [dbo].[AnhSanPham] ([id], [ma_san_pham], [ten]) VALUES (16, 16, N'thien_su_nha_ben_-_tap_4_-_bia.jpg')
INSERT [dbo].[AnhSanPham] ([id], [ma_san_pham], [ten]) VALUES (17, 16, N'thien_su_nha_ben_-_tap_4_-_ban_pho_thong.jpg')
INSERT [dbo].[AnhSanPham] ([id], [ma_san_pham], [ten]) VALUES (18, 17, N'thien_su_nha_ben_-_tap_3_3.jpg')
INSERT [dbo].[AnhSanPham] ([id], [ma_san_pham], [ten]) VALUES (19, 18, N'thien_su_nha_ben_tap_2_bia.jpg')
INSERT [dbo].[AnhSanPham] ([id], [ma_san_pham], [ten]) VALUES (20, 18, N'600thien-su-nha-ben_tap-2_ban-pho-thong.jpg')
INSERT [dbo].[AnhSanPham] ([id], [ma_san_pham], [ten]) VALUES (21, 19, N'bocchi_the_rock_bia_tap_1.jpg')
INSERT [dbo].[AnhSanPham] ([id], [ma_san_pham], [ten]) VALUES (22, 19, N'bocchi_the_rock_postcard_tap_1.jpg')
INSERT [dbo].[AnhSanPham] ([id], [ma_san_pham], [ten]) VALUES (23, 19, N'bocchi-the-rock_bia_tap-1-1.jpg')
INSERT [dbo].[AnhSanPham] ([id], [ma_san_pham], [ten]) VALUES (24, 20, N'su_gia_bon_mua_vu_dieu_mua_xuan_quyen_1_bia.jpg')
INSERT [dbo].[AnhSanPham] ([id], [ma_san_pham], [ten]) VALUES (25, 20, N'su_gia_bon_mua_vu_dieu_mua_xuan_quyen_1_ban_pho_thong.jpg')
INSERT [dbo].[AnhSanPham] ([id], [ma_san_pham], [ten]) VALUES (26, 21, N'b_a_b_o_m_u_1_2_1.jpg')
INSERT [dbo].[AnhSanPham] ([id], [ma_san_pham], [ten]) VALUES (27, 21, N'poster_a3_-_bao_mau_bm_cua_tieu_thu_1.jpg')
INSERT [dbo].[AnhSanPham] ([id], [ma_san_pham], [ten]) VALUES (28, 22, N'thien_su_nha_ben_tap_8_bia_3.jpg')
INSERT [dbo].[AnhSanPham] ([id], [ma_san_pham], [ten]) VALUES (29, 22, N'thien_su_nha_ben_tap_8_ban_gioi_han.jpg')
INSERT [dbo].[AnhSanPham] ([id], [ma_san_pham], [ten]) VALUES (30, 23, N'clean_code_tai_ban_3_b1.jpg')
INSERT [dbo].[AnhSanPham] ([id], [ma_san_pham], [ten]) VALUES (31, 23, N'clean_code_tai_ban_3_b4.jpg')
SET IDENTITY_INSERT [dbo].[AnhSanPham] OFF
GO
INSERT [dbo].[ChiTietHoaDon] ([ma_hoa_don], [ma_san_pham], [so_luong], [id]) VALUES (4, 1, 1, 29)
INSERT [dbo].[ChiTietHoaDon] ([ma_hoa_don], [ma_san_pham], [so_luong], [id]) VALUES (4, 8, 2, 30)
INSERT [dbo].[ChiTietHoaDon] ([ma_hoa_don], [ma_san_pham], [so_luong], [id]) VALUES (5, 1, 1, 31)
INSERT [dbo].[ChiTietHoaDon] ([ma_hoa_don], [ma_san_pham], [so_luong], [id]) VALUES (1, 1, 1, 103)
INSERT [dbo].[ChiTietHoaDon] ([ma_hoa_don], [ma_san_pham], [so_luong], [id]) VALUES (9, 1, 1, 104)
INSERT [dbo].[ChiTietHoaDon] ([ma_hoa_don], [ma_san_pham], [so_luong], [id]) VALUES (10, 23, 1, 105)
INSERT [dbo].[ChiTietHoaDon] ([ma_hoa_don], [ma_san_pham], [so_luong], [id]) VALUES (10, 15, 1, 106)
INSERT [dbo].[ChiTietHoaDon] ([ma_hoa_don], [ma_san_pham], [so_luong], [id]) VALUES (2, 8, 1, 108)
INSERT [dbo].[ChiTietHoaDon] ([ma_hoa_don], [ma_san_pham], [so_luong], [id]) VALUES (11, 15, 1, 109)
INSERT [dbo].[ChiTietHoaDon] ([ma_hoa_don], [ma_san_pham], [so_luong], [id]) VALUES (12, 14, 1, 110)
INSERT [dbo].[ChiTietHoaDon] ([ma_hoa_don], [ma_san_pham], [so_luong], [id]) VALUES (13, 1, 1, 112)
INSERT [dbo].[ChiTietHoaDon] ([ma_hoa_don], [ma_san_pham], [so_luong], [id]) VALUES (14, 1, 3, 113)
INSERT [dbo].[ChiTietHoaDon] ([ma_hoa_don], [ma_san_pham], [so_luong], [id]) VALUES (8, 1, 1, 114)
INSERT [dbo].[ChiTietHoaDon] ([ma_hoa_don], [ma_san_pham], [so_luong], [id]) VALUES (15, 8, 1, 115)
INSERT [dbo].[ChiTietHoaDon] ([ma_hoa_don], [ma_san_pham], [so_luong], [id]) VALUES (16, 13, 1, 116)
INSERT [dbo].[ChiTietHoaDon] ([ma_hoa_don], [ma_san_pham], [so_luong], [id]) VALUES (16, 14, 1, 117)
INSERT [dbo].[ChiTietHoaDon] ([ma_hoa_don], [ma_san_pham], [so_luong], [id]) VALUES (17, 1, 2, 118)
INSERT [dbo].[ChiTietHoaDon] ([ma_hoa_don], [ma_san_pham], [so_luong], [id]) VALUES (18, 16, 3, 119)
INSERT [dbo].[ChiTietHoaDon] ([ma_hoa_don], [ma_san_pham], [so_luong], [id]) VALUES (19, 16, 1, 120)
INSERT [dbo].[ChiTietHoaDon] ([ma_hoa_don], [ma_san_pham], [so_luong], [id]) VALUES (20, 16, 1, 121)
INSERT [dbo].[ChiTietHoaDon] ([ma_hoa_don], [ma_san_pham], [so_luong], [id]) VALUES (14, 16, 1, 122)
INSERT [dbo].[ChiTietHoaDon] ([ma_hoa_don], [ma_san_pham], [so_luong], [id]) VALUES (21, 1, 1, 123)
INSERT [dbo].[ChiTietHoaDon] ([ma_hoa_don], [ma_san_pham], [so_luong], [id]) VALUES (22, 1, 2, 124)
INSERT [dbo].[ChiTietHoaDon] ([ma_hoa_don], [ma_san_pham], [so_luong], [id]) VALUES (22, 6, 2, 125)
INSERT [dbo].[ChiTietHoaDon] ([ma_hoa_don], [ma_san_pham], [so_luong], [id]) VALUES (23, 1, 1, 127)
INSERT [dbo].[ChiTietHoaDon] ([ma_hoa_don], [ma_san_pham], [so_luong], [id]) VALUES (24, 1, 1, 128)
INSERT [dbo].[ChiTietHoaDon] ([ma_hoa_don], [ma_san_pham], [so_luong], [id]) VALUES (24, 6, 1, 130)
INSERT [dbo].[ChiTietHoaDon] ([ma_hoa_don], [ma_san_pham], [so_luong], [id]) VALUES (25, 1, 1, 131)
INSERT [dbo].[ChiTietHoaDon] ([ma_hoa_don], [ma_san_pham], [so_luong], [id]) VALUES (25, 6, 1, 132)
INSERT [dbo].[ChiTietHoaDon] ([ma_hoa_don], [ma_san_pham], [so_luong], [id]) VALUES (26, 20, 2, 133)
INSERT [dbo].[ChiTietHoaDon] ([ma_hoa_don], [ma_san_pham], [so_luong], [id]) VALUES (27, 21, 1, 134)
INSERT [dbo].[ChiTietHoaDon] ([ma_hoa_don], [ma_san_pham], [so_luong], [id]) VALUES (28, 1, 1, 135)
INSERT [dbo].[ChiTietHoaDon] ([ma_hoa_don], [ma_san_pham], [so_luong], [id]) VALUES (28, 8, 1, 136)
INSERT [dbo].[ChiTietHoaDon] ([ma_hoa_don], [ma_san_pham], [so_luong], [id]) VALUES (28, 16, 1, 137)
INSERT [dbo].[ChiTietHoaDon] ([ma_hoa_don], [ma_san_pham], [so_luong], [id]) VALUES (28, 17, 1, 138)
INSERT [dbo].[ChiTietHoaDon] ([ma_hoa_don], [ma_san_pham], [so_luong], [id]) VALUES (28, 15, 1, 139)
INSERT [dbo].[ChiTietHoaDon] ([ma_hoa_don], [ma_san_pham], [so_luong], [id]) VALUES (28, 14, 1, 140)
INSERT [dbo].[ChiTietHoaDon] ([ma_hoa_don], [ma_san_pham], [so_luong], [id]) VALUES (28, 13, 1, 141)
INSERT [dbo].[ChiTietHoaDon] ([ma_hoa_don], [ma_san_pham], [so_luong], [id]) VALUES (28, 6, 1, 142)
INSERT [dbo].[ChiTietHoaDon] ([ma_hoa_don], [ma_san_pham], [so_luong], [id]) VALUES (28, 20, 1, 143)
INSERT [dbo].[ChiTietHoaDon] ([ma_hoa_don], [ma_san_pham], [so_luong], [id]) VALUES (28, 21, 1, 144)
INSERT [dbo].[ChiTietHoaDon] ([ma_hoa_don], [ma_san_pham], [so_luong], [id]) VALUES (28, 22, 1, 145)
INSERT [dbo].[ChiTietHoaDon] ([ma_hoa_don], [ma_san_pham], [so_luong], [id]) VALUES (29, 1, 1, 150)
INSERT [dbo].[ChiTietHoaDon] ([ma_hoa_don], [ma_san_pham], [so_luong], [id]) VALUES (30, 22, 1, 151)
INSERT [dbo].[ChiTietHoaDon] ([ma_hoa_don], [ma_san_pham], [so_luong], [id]) VALUES (30, 19, 1, 152)
GO
INSERT [dbo].[HoaDon] ([id], [ma_khach_hang], [ngay_tao], [trang_thai]) VALUES (1, 3, CAST(N'2024-04-07' AS Date), N'Đang xử lý')
INSERT [dbo].[HoaDon] ([id], [ma_khach_hang], [ngay_tao], [trang_thai]) VALUES (2, 2, CAST(N'2024-04-07' AS Date), N'Đang xử lý')
INSERT [dbo].[HoaDon] ([id], [ma_khach_hang], [ngay_tao], [trang_thai]) VALUES (4, 4, CAST(N'2024-04-05' AS Date), N'đang xử lý')
INSERT [dbo].[HoaDon] ([id], [ma_khach_hang], [ngay_tao], [trang_thai]) VALUES (5, 4, CAST(N'2024-02-02' AS Date), N'd')
INSERT [dbo].[HoaDon] ([id], [ma_khach_hang], [ngay_tao], [trang_thai]) VALUES (8, 4, CAST(N'2024-04-07' AS Date), N'Đang xử lý')
INSERT [dbo].[HoaDon] ([id], [ma_khach_hang], [ngay_tao], [trang_thai]) VALUES (9, 3, CAST(N'2024-04-07' AS Date), N'Đang xử lý')
INSERT [dbo].[HoaDon] ([id], [ma_khach_hang], [ngay_tao], [trang_thai]) VALUES (10, 3, CAST(N'2024-04-07' AS Date), N'Đang xử lý')
INSERT [dbo].[HoaDon] ([id], [ma_khach_hang], [ngay_tao], [trang_thai]) VALUES (11, 3, CAST(N'2024-04-07' AS Date), N'Đang xử lý')
INSERT [dbo].[HoaDon] ([id], [ma_khach_hang], [ngay_tao], [trang_thai]) VALUES (12, 3, CAST(N'2024-04-07' AS Date), N'Đang xử lý')
INSERT [dbo].[HoaDon] ([id], [ma_khach_hang], [ngay_tao], [trang_thai]) VALUES (13, 3, CAST(N'2024-04-07' AS Date), N'Đang xử lý')
INSERT [dbo].[HoaDon] ([id], [ma_khach_hang], [ngay_tao], [trang_thai]) VALUES (14, 3, CAST(N'2024-04-07' AS Date), N'Đang xử lý')
INSERT [dbo].[HoaDon] ([id], [ma_khach_hang], [ngay_tao], [trang_thai]) VALUES (15, 4, CAST(N'2024-04-07' AS Date), N'Đang xử lý')
INSERT [dbo].[HoaDon] ([id], [ma_khach_hang], [ngay_tao], [trang_thai]) VALUES (16, 4, CAST(N'2024-04-07' AS Date), N'Đang xử lý')
INSERT [dbo].[HoaDon] ([id], [ma_khach_hang], [ngay_tao], [trang_thai]) VALUES (17, 2, CAST(N'2024-04-07' AS Date), N'Đang xử lý')
INSERT [dbo].[HoaDon] ([id], [ma_khach_hang], [ngay_tao], [trang_thai]) VALUES (18, 2, CAST(N'2024-04-07' AS Date), N'Đang xử lý')
INSERT [dbo].[HoaDon] ([id], [ma_khach_hang], [ngay_tao], [trang_thai]) VALUES (19, 2, CAST(N'2024-04-07' AS Date), N'Đang xử lý')
INSERT [dbo].[HoaDon] ([id], [ma_khach_hang], [ngay_tao], [trang_thai]) VALUES (20, 2, CAST(N'2024-04-07' AS Date), N'Đang xử lý')
INSERT [dbo].[HoaDon] ([id], [ma_khach_hang], [ngay_tao], [trang_thai]) VALUES (21, 3, CAST(N'2024-04-07' AS Date), N'Đang xử lý')
INSERT [dbo].[HoaDon] ([id], [ma_khach_hang], [ngay_tao], [trang_thai]) VALUES (22, 3, CAST(N'2024-04-07' AS Date), N'Đang xử lý')
INSERT [dbo].[HoaDon] ([id], [ma_khach_hang], [ngay_tao], [trang_thai]) VALUES (23, 3, CAST(N'2024-04-07' AS Date), N'Đang xử lý')
INSERT [dbo].[HoaDon] ([id], [ma_khach_hang], [ngay_tao], [trang_thai]) VALUES (24, 3, CAST(N'2024-04-07' AS Date), N'Đang xử lý')
INSERT [dbo].[HoaDon] ([id], [ma_khach_hang], [ngay_tao], [trang_thai]) VALUES (25, 4, CAST(N'2024-04-07' AS Date), N'Đang xử lý')
INSERT [dbo].[HoaDon] ([id], [ma_khach_hang], [ngay_tao], [trang_thai]) VALUES (26, 3, CAST(N'2024-04-07' AS Date), N'Đang xử lý')
INSERT [dbo].[HoaDon] ([id], [ma_khach_hang], [ngay_tao], [trang_thai]) VALUES (27, 3, CAST(N'2024-04-07' AS Date), N'Đang xử lý')
INSERT [dbo].[HoaDon] ([id], [ma_khach_hang], [ngay_tao], [trang_thai]) VALUES (28, 3, CAST(N'2024-04-07' AS Date), N'Đang xử lý')
INSERT [dbo].[HoaDon] ([id], [ma_khach_hang], [ngay_tao], [trang_thai]) VALUES (29, 3, CAST(N'2024-04-07' AS Date), N'Đang xử lý')
INSERT [dbo].[HoaDon] ([id], [ma_khach_hang], [ngay_tao], [trang_thai]) VALUES (30, 3, CAST(N'2024-04-07' AS Date), N'Đang xử lý')
GO
SET IDENTITY_INSERT [dbo].[KhachHang] ON 

INSERT [dbo].[KhachHang] ([id], [ten], [ho_va_ten_lot], [password], [email], [so_dien_thoai], [gioi_tinh], [dia_chi], [ngay_sinh]) VALUES (2, N'Lâm', N'Trần Thế', N'2                                                 ', N'ti@sample.com', N'0932613765', 1, N'Bình Tân', CAST(N'1999-10-10' AS Date))
INSERT [dbo].[KhachHang] ([id], [ten], [ho_va_ten_lot], [password], [email], [so_dien_thoai], [gioi_tinh], [dia_chi], [ngay_sinh]) VALUES (3, N'Huấn', N'Lương Công', N'1                                                 ', N'huanluongcong@gmail.com', N'0915364692', 1, N'20 Đô Đốc Long', CAST(N'2003-01-03' AS Date))
INSERT [dbo].[KhachHang] ([id], [ten], [ho_va_ten_lot], [password], [email], [so_dien_thoai], [gioi_tinh], [dia_chi], [ngay_sinh]) VALUES (4, N'NV04', N'test', N'4                                                 ', N'nv04@sample.com', N'093213765', 0, N'Tân Phú', CAST(N'2002-01-01' AS Date))
SET IDENTITY_INSERT [dbo].[KhachHang] OFF
GO
INSERT [dbo].[NhaCungCap] ([id], [full_name], [short_name], [email], [so_dien_thoai], [dia_chi], [ma_so_thue]) VALUES (N'KD        ', N'	Nhà Xuất Bản Kim Đồng', N'Kim Đồng', N'kimdong@sample.com', N'0911232576', N'Hà Nội', N'123')
INSERT [dbo].[NhaCungCap] ([id], [full_name], [short_name], [email], [so_dien_thoai], [dia_chi], [ma_so_thue]) VALUES (N'TTVN      ', N'	CÔNG TY TNHH SÁCH & TRUYỀN THÔNG VIỆT NAM', N'Truyền Thông Việt Nam', N'vn@sample.com', N'123', N'TP. HCM', N'3211')
GO
INSERT [dbo].[NhanVien] ([id], [ten], [ho_va_ten_lot], [mat_khau], [email], [so_dien_thoai], [vai_tro], [ngay_sinh], [dia_chi], [gioi_tinh]) VALUES (N'NV01', N'Huấn', N'Lương Công', N'1                                                 ', N'huanluongcong@gmail.com', N'0915364692     ', 1, CAST(N'2004-12-07' AS Date), N'Đồng Nai', 1)
INSERT [dbo].[NhanVien] ([id], [ten], [ho_va_ten_lot], [mat_khau], [email], [so_dien_thoai], [vai_tro], [ngay_sinh], [dia_chi], [gioi_tinh]) VALUES (N'NV02', N'Lâm', N'Trần Thế', N'123                                               ', N'lam@sample.com', N'09326137543    ', 0, CAST(N'2024-04-02' AS Date), N'Tp.HCM', 0)
GO
INSERT [dbo].[NhaXuatBan] ([id], [ten], [email], [so_dien_thoai], [dia_chi], [ma_so_thue]) VALUES (N'DT        ', N'Dân Trí', N'dantri@sample.com', N'123', N'Hà Nội', N'321')
INSERT [dbo].[NhaXuatBan] ([id], [ten], [email], [so_dien_thoai], [dia_chi], [ma_so_thue]) VALUES (N'KD        ', N'Kim Đồng', N'kimdong@sample.com', N'0932613777', N'Hà Nội', N'123')
GO
INSERT [dbo].[PhanLoai] ([id], [ten_phan_loai]) VALUES (N'LN        ', N'Light Novel')
INSERT [dbo].[PhanLoai] ([id], [ten_phan_loai]) VALUES (N'MG        ', N'Manga')
INSERT [dbo].[PhanLoai] ([id], [ten_phan_loai]) VALUES (N'MH        ', N'Manghua')
INSERT [dbo].[PhanLoai] ([id], [ten_phan_loai]) VALUES (N'MW        ', N'Manhwa')
INSERT [dbo].[PhanLoai] ([id], [ten_phan_loai]) VALUES (N'SGK       ', N'Sách Giáo Khoa')
INSERT [dbo].[PhanLoai] ([id], [ten_phan_loai]) VALUES (N'STK       ', N'Sách Tham Khảo')
INSERT [dbo].[PhanLoai] ([id], [ten_phan_loai]) VALUES (N'TH        ', N'Tin Học')
INSERT [dbo].[PhanLoai] ([id], [ten_phan_loai]) VALUES (N'TN        ', N'Truyện Ngắn')
GO
SET IDENTITY_INSERT [dbo].[SanPham] ON 

INSERT [dbo].[SanPham] ([id], [tieu_de], [tac_gia], [don_gia], [nam_xuat_ban], [mo_ta], [kich_thuoc], [so_trang], [giam_gia], [ngon_ngu], [kieu_bia], [so_luong], [do_tuoi], [ngay_cap_nhat_moi_nhat], [ngay_nhap], [nguoi_dich], [can_nang], [the_loai], [nha_xuat_ban], [phan_loai], [nguoi_nhap], [trang_thai], [nha_cung_cap], [so_luot_ban], [danh_gia]) VALUES (1, N'Arya Bàn Bên Thỉnh Thoảng Lại Trêu Ghẹo Tôi Bằng Tiếng Nga - Tập 4.5 - Bản Boxset - Tặng Kèm Boxset + Postcard Ivory + Set 2 Thẻ Nhân Vật + Standee Bế Hình Có Chân Đế + Poster', 1, 130000.0000, 2024, N'“И наменятоже обрати внимание”

Chuyến tập huấn mùa hè báo hiệu cho sự khởi đầu của một tình yêu mới. Thế nhưng, mùa hè của nhóm Arya vẫn chưa kết thúc! Thuật thôi miên của Yuki đã biến Masachika trở thành một anh chàng đẹp trai rất cưng chiều người yêu? Màn “va chạm” bất ngờ khiến em gái và cô hầu cận suýt thì ngất xỉu! Ở quán ramen nơi Arya đang tu luyện để ăn món cực cay, có một nhân vật bất ngờ xuất hiện? Arya bị cuốn vào đam mê cho em gái mặc đồ bơi dễ thương của cô chị và trở thành búp bê thử đồ!? Ấn bản ngoại truyện xoay quanh mùa hè rực rỡ của các thành viênHội học sinh đã chính thức ra mắt!

[Liệu mình có thể gặp lại Saa được không...]

Và rồi, cảm xúc của cô gái đang chờ đợi chàng trai định mệnh tại nơi hẹn ước càng trở nên rõ ràng vào lúc này.

* Arya Bàn Bên Thỉnh Thoảng Lại Trêu Ghẹo Tôi Bằng Tiếng Nga là bộ Light Novel rất được yêu thích tại Nhật Bản, với thành tích bán ra hơn 500.000 bản khi mới chỉ phát hành đến Tập 4, nằm trong Top 10 bảng xếp hạng Kono Light Novel ga Sugoi năm 2021.

Mã hàng	abbttltgtbtn45gh-qt
Dự Kiến Có Hàng	05/04/2024
Ngày Dự Kiến Phát Hành	05/04/2024
Độ Tuổi	18+
Tên Nhà Cung Cấp	Nhà Xuất Bản Kim Đồng
Tác giả	Sunsunsun, Momoco
Người Dịch	Trân Trân
NXB	Kim Đồng
Năm XB	2024
Ngôn Ngữ	Tiếng Việt
Kích Thước Bao Bì	19 x 13 x 1.9 cm
Số trang	392
Hình thức	Bìa Mềm
Sản phẩm bán chạy nhất	Top 100 sản phẩm Light Novel bán chạy của tháng
Giá sản phẩm trên Fahasa.com đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như Phụ phí đóng gói, phí vận chuyển, phụ phí hàng cồng kềnh,...
Chính sách khuyến mãi trên Fahasa.com không áp dụng cho Hệ thống Nhà sách Fahasa trên toàn quốc
Arya Bàn Bên Thỉnh Thoảng Lại Trêu Ghẹo Tôi Bằng Tiếng Nga - Tập 4.5

“И наменятоже обрати внимание”

Chuyến tập huấn mùa hè báo hiệu cho sự khởi đầu của một tình yêu mới. Thế nhưng, mùa hè của nhóm Arya vẫn chưa kết thúc! Thuật thôi miên của Yuki đã biến Masachika trở thành một anh chàng đẹp trai rất cưng chiều người yêu? Màn “va chạm” bất ngờ khiến em gái và cô hầu cận suýt thì ngất xỉu! Ở quán ramen nơi Arya đang tu luyện để ăn món cực cay, có một nhân vật bất ngờ xuất hiện? Arya bị cuốn vào đam mê cho em gái mặc đồ bơi dễ thương của cô chị và trở thành búp bê thử đồ!? Ấn bản ngoại truyện xoay quanh mùa hè rực rỡ của các thành viênHội học sinh đã chính thức ra mắt!

[Liệu mình có thể gặp lại Saa được không...]

Và rồi, cảm xúc của cô gái đang chờ đợi chàng trai định mệnh tại nơi hẹn ước càng trở nên rõ ràng vào lúc này.

* Arya Bàn Bên Thỉnh Thoảng Lại Trêu Ghẹo Tôi Bằng Tiếng Nga là bộ Light Novel rất được yêu thích tại Nhật Bản, với thành tích bán ra hơn 500.000 bản khi mới chỉ phát hành đến Tập 4, nằm trong Top 10 bảng xếp hạng Kono Light Novel ga Sugoi năm 2021.', N'19 x 13 x 1.9', 392, 0, N'Tiếng Việt', N'Bìa Mềm', 208, 18, CAST(N'2024-01-04' AS Date), CAST(N'2024-01-04' AS Date), N'Trân Trân', NULL, N'rc        ', N'KD        ', N'LN        ', N'NV01', 1, N'KD        ', 0, 0)
INSERT [dbo].[SanPham] ([id], [tieu_de], [tac_gia], [don_gia], [nam_xuat_ban], [mo_ta], [kich_thuoc], [so_trang], [giam_gia], [ngon_ngu], [kieu_bia], [so_luong], [do_tuoi], [ngay_cap_nhat_moi_nhat], [ngay_nhap], [nguoi_dich], [can_nang], [the_loai], [nha_xuat_ban], [phan_loai], [nguoi_nhap], [trang_thai], [nha_cung_cap], [so_luot_ban], [danh_gia]) VALUES (6, N'[Manga] Dược Sư Tự Sự - Tập 1 - Tặng Kèm Obi + Standee Ivory', 5, 47000.0000, 2022, N'Dược Sư Tự Sự (Manga) - Tập 1

Miêu Miêu là một cô gái làm công việc hầu hạ trong cung đình thời phong kiến.

Câu chuyện của chúng ta bắt đầu với việc cô gái từng hành nghề dược sư ở phố hoa này nghe thấy người ta đồn thổi rằng: tất cả những đứa con của Hoàng đế đều đoản mệnh.

Bị thúc đẩy bởi niềm khát khao tri thức và tính hiếu kì cố hữu, Miêu Miêu bắt tay vào tìm hiểu nguyên nhân, xem đó như một cách giải khuây không hơn không kém.

* WINGS BOOKS - Thương hiệu sách trẻ của NXB Kim Đồng hân hạnh gửi đến các bạn độc giả phiên bản chuyển thể manga đặc sắc của bộ light-novel siêu ăn khách DƯỢC SƯ TỰ SỰ!

Series đã vượt mốc 13 triệu bản tại thị trường Nhật Bản, luôn thống trị bảng xếp hạng bán chạy mỗi khi ra tập mới!

Số tập: 9 (on-going)

---

Một ấn phẩm của WINGS BOOKS - Thương hiệu sách trẻ của NXB Kim Đồng.

Mã hàng	8935244867251
Độ Tuổi	18+
Tên Nhà Cung Cấp	Nhà Xuất Bản Kim Đồng
Tác giả	Natsu Hyuuga (Hero Bunko/Shufunotomosha), Touco Shino, Itsuki Nanao, Nekokurage
Người Dịch	Hide
NXB	NXB Kim Đồng
Năm XB	2022
Ngôn Ngữ	Tiếng Việt
Trọng lượng (gr)	200
Kích Thước Bao Bì	18 x 13 cm
Số trang	176
Hình thức	Bìa Mềm
Sản phẩm bán chạy nhất	Top 100 sản phẩm Manga Khác bán chạy của tháng
Giá sản phẩm trên Fahasa.com đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như Phụ phí đóng gói, phí vận chuyển, phụ phí hàng cồng kềnh,...
Chính sách khuyến mãi trên Fahasa.com không áp dụng cho Hệ thống Nhà sách Fahasa trên toàn quốc
Dược Sư Tự Sự (Manga) - Tập 1

Miêu Miêu là một cô gái làm công việc hầu hạ trong cung đình thời phong kiến.

Câu chuyện của chúng ta bắt đầu với việc cô gái từng hành nghề dược sư ở phố hoa này nghe thấy người ta đồn thổi rằng: tất cả những đứa con của Hoàng đế đều đoản mệnh.

Bị thúc đẩy bởi niềm khát khao tri thức và tính hiếu kì cố hữu, Miêu Miêu bắt tay vào tìm hiểu nguyên nhân, xem đó như một cách giải khuây không hơn không kém.

* WINGS BOOKS - Thương hiệu sách trẻ của NXB Kim Đồng hân hạnh gửi đến các bạn độc giả phiên bản chuyển thể manga đặc sắc của bộ light-novel siêu ăn khách DƯỢC SƯ TỰ SỰ!

Series đã vượt mốc 13 triệu bản tại thị trường Nhật Bản, luôn thống trị bảng xếp hạng bán chạy mỗi khi ra tập mới!

Số tập: 9 (on-going)

---

Một ấn phẩm của WINGS BOOKS - Thương hiệu sách trẻ của NXB Kim Đồng.', N'18 x 13', 176, 0.1, N'Tiếng Việt', N'Bìa Mềm', 39, 18, CAST(N'2024-01-04' AS Date), CAST(N'2024-01-04' AS Date), N'Hide', 200, N'rm        ', N'KD        ', N'MG        ', N'NV01', 0, N'KD        ', 0, 0)
INSERT [dbo].[SanPham] ([id], [tieu_de], [tac_gia], [don_gia], [nam_xuat_ban], [mo_ta], [kich_thuoc], [so_trang], [giam_gia], [ngon_ngu], [kieu_bia], [so_luong], [do_tuoi], [ngay_cap_nhat_moi_nhat], [ngay_nhap], [nguoi_dich], [can_nang], [the_loai], [nha_xuat_ban], [phan_loai], [nguoi_nhap], [trang_thai], [nha_cung_cap], [so_luot_ban], [danh_gia]) VALUES (8, N'Thiên Sứ Nhà Bên - Tập 1', 6, 95000.0000, 2021, N'Thiên Sứ Nhà Bên - Tập 1

Hàng xóm kế bên căn hộ của Fujimiya Amane chính là nữ sinh xinh đẹp nhất trường cậu, Shiina Mahiru.

Họ vốn chẳng có mối liên hệ nào cho đến một ngày mưa tầm tã, Amane tình nguyện đưa chiếc ô của mình cho cô bạn hàng xóm xinh đẹp tựa thiên thần, cả hai đã bắt đầu tương tác với nhau theo một cách kì quặc.

Chẳng thể chịu được lối sinh hoạt cẩu thả khi sống một mình của Amane, Mahiru đã quyết định sẽ chăm sóc cậu từ những điều nhỏ nhất.

Một Mahiru thiếu thốn sự gắn kết với gia đình đang dần mở lòng hơn, cùng một Amane hay tự ti đang ngày một đổi thay theo chiều hướng tích cực. Khoảng cách giữa hai con người không chút thành thật ấy đang từng bước thu hẹp lại...

Đây là câu chuyện tình ngọt ngào với cô gái nhà bên tuy lạnh lùng nhưng thật đáng yêu đã được ủng hộ nhiệt tình trên trang Shousetsuka ni Narou.

* THIÊN SỨ NHÀ BÊNđược xem là cú hit của dòng Light Novel rom-com tại thị trường Nhật Bản, với nội dung hài hước - lãng mạn rất được yêu thích. Tác phẩm nằm top 10 Kono Light novel ga Sugoi năm 2021, đã bán ra hơn 400.000 bản chỉ với 4 tập truyện riêng tại Nhật Bản.

Số tập: 5+ (on-going)

---

Một ấn phẩm của WINGS BOOKS - Thương hiệu sách trẻ của NXB Kim Đồng.

Mã hàng	8935244862126
Độ Tuổi	18+
Tên Nhà Cung Cấp	Nhà Xuất Bản Kim Đồng
Tác giả	Saekisan, Hanekoto
Người Dịch	Trân Trân
NXB	NXB Kim Đồng
Năm XB	2021
Ngôn Ngữ	Tiếng Việt
Trọng lượng (gr)	350
Kích Thước Bao Bì	19 x 13 cm
Số trang	320
Hình thức	Bìa Mềm
Sản phẩm bán chạy nhất	Top 100 sản phẩm Light Novel bán chạy của tháng
Giá sản phẩm trên Fahasa.com đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như Phụ phí đóng gói, phí vận chuyển, phụ phí hàng cồng kềnh,...
Chính sách khuyến mãi trên Fahasa.com không áp dụng cho Hệ thống Nhà sách Fahasa trên toàn quốc
Thiên Sứ Nhà Bên - Tập 1

Hàng xóm kế bên căn hộ của Fujimiya Amane chính là nữ sinh xinh đẹp nhất trường cậu, Shiina Mahiru.

Họ vốn chẳng có mối liên hệ nào cho đến một ngày mưa tầm tã, Amane tình nguyện đưa chiếc ô của mình cho cô bạn hàng xóm xinh đẹp tựa thiên thần, cả hai đã bắt đầu tương tác với nhau theo một cách kì quặc.

Chẳng thể chịu được lối sinh hoạt cẩu thả khi sống một mình của Amane, Mahiru đã quyết định sẽ chăm sóc cậu từ những điều nhỏ nhất.

Một Mahiru thiếu thốn sự gắn kết với gia đình đang dần mở lòng hơn, cùng một Amane hay tự ti đang ngày một đổi thay theo chiều hướng tích cực. Khoảng cách giữa hai con người không chút thành thật ấy đang từng bước thu hẹp lại...

Đây là câu chuyện tình ngọt ngào với cô gái nhà bên tuy lạnh lùng nhưng thật đáng yêu đã được ủng hộ nhiệt tình trên trang Shousetsuka ni Narou.

* THIÊN SỨ NHÀ BÊNđược xem là cú hit của dòng Light Novel rom-com tại thị trường Nhật Bản, với nội dung hài hước - lãng mạn rất được yêu thích. Tác phẩm nằm top 10 Kono Light novel ga Sugoi năm 2021, đã bán ra hơn 400.000 bản chỉ với 4 tập truyện riêng tại Nhật Bản.

Số tập: 5+ (on-going)

---

Một ấn phẩm của WINGS BOOKS - Thương hiệu sách trẻ của NXB Kim Đồng.', N'19 x 13', 320, 0.2, N'Tiếng Việt', N'Bìa Mềm', 431, 18, CAST(N'2024-01-04' AS Date), CAST(N'2024-01-04' AS Date), N'Trân Trân', 350, N'rc        ', N'KD        ', N'LN        ', N'NV01', 1, N'KD        ', 0, 0)
INSERT [dbo].[SanPham] ([id], [tieu_de], [tac_gia], [don_gia], [nam_xuat_ban], [mo_ta], [kich_thuoc], [so_trang], [giam_gia], [ngon_ngu], [kieu_bia], [so_luong], [do_tuoi], [ngay_cap_nhat_moi_nhat], [ngay_nhap], [nguoi_dich], [can_nang], [the_loai], [nha_xuat_ban], [phan_loai], [nguoi_nhap], [trang_thai], [nha_cung_cap], [so_luot_ban], [danh_gia]) VALUES (13, N'[Manga] Thiên Sứ Nhà Bên - Tập 2 - Tặng Kèm Bookmark Bế Hình + Postcard In Nhũ 2 Mặt', 6, 50000.0000, 2024, N'[Manga] Thiên Sứ Nhà Bên - Tập 2

TRUYỆN TRANH CHUYỂN THỂ TỪ BỘ LIGHT-NOVEL “THIÊN SỨ NHÀ BÊN” RẤT ĐƯỢC YÊU THÍCH!!

Amane là một nam sinh khá cẩu thả, còn Mahiru là nữ sinh xinh xắn nhất trường với biệt danh “thiên sứ”. Cả hai vốn chẳng có mối liên hệ nào với nhau, thế nhưng sau một dịp tình cờ, họ đã bắt đầu qua lại và ăn cơm chung một nhà.

Thời gian dần trôi, có “điều gì đó” đã nảy sinh nhưng Amane vẫn vờ như không nhận thấy. Từ món đồ Mahiru bỏ quên, Amane đã biết được “một chuyện”.

Đây là câu chuyện tình ngọt ngào với cô gái nhà bên tuy lạnh lùng nhưng thật đáng yêu…', N'18 x 13 x 0.9', 194, 0.05, N'Tiếng Việt', N'Bìa Mềm', 42, 18, CAST(N'2024-01-04' AS Date), CAST(N'2024-01-04' AS Date), N'Trân Trân', 220, N'rc        ', N'KD        ', N'MG        ', N'NV01', 1, N'KD        ', 0, 0)
INSERT [dbo].[SanPham] ([id], [tieu_de], [tac_gia], [don_gia], [nam_xuat_ban], [mo_ta], [kich_thuoc], [so_trang], [giam_gia], [ngon_ngu], [kieu_bia], [so_luong], [do_tuoi], [ngay_cap_nhat_moi_nhat], [ngay_nhap], [nguoi_dich], [can_nang], [the_loai], [nha_xuat_ban], [phan_loai], [nguoi_nhap], [trang_thai], [nha_cung_cap], [so_luot_ban], [danh_gia]) VALUES (14, N'[Manga] Thiên Sứ Nhà Bên - Tập 1 - Tặng Kèm Bookmark Bế Hình + Postcard In Nhũ 2 Mặt + Poster', 6, 50000.0000, 2024, N'[Manga] Thiên Sứ Nhà Bên - Tập 1

TRUYỆN TRANH CHUYỂN THỂ TỪ BỘ LIGHT-NOVEL “THIÊN SỨ NHÀ BÊN” RẤT ĐƯỢC YÊU THÍCH!!

Hàng xóm kế bên căn hộ của Fujimiya Amane chính là nữ sinh xinh đẹp nhất trường cậu, Shiina Mahiru. Hai người vốn chẳng có mối liên hệ nào cho đến một ngày mưa tầm tã, Amane tình nguyện đưa chiếc ô của mình cho cô bạn hàng xóm xinh đẹp tựa thiên thần. Kể từ đó, cả hai đã bắt đầu tương tác với nhau theo một cách kì quặc.

Chẳng thể chịu được lối sinh hoạt cẩu thả khi sống một mình của Amane, Mahiru đã quyết định sẽ chăm sóc cậu từ những điều nhỏ nhất.

Chuyện tình ngọt ngào với cô gái nhà bên tuy lạnh lùng nhưng thật đáng yêu chính thức ra mắt phiên bản truyện tranh! Tập 1 có thêm một phần ngoại truyện đặc biệt do chính tác giả nguyên tác Saekisan sáng tác!

Mã hàng	8935352604137-qt
Độ Tuổi	18+
Tên Nhà Cung Cấp	Nhà Xuất Bản Kim Đồng
Tác giả	Saekisan, Hanekoto, Wan Shibata, Suzu Yuki
Người Dịch	Trân Trân
NXB	Kim Đồng
Năm XB	2024
Ngôn Ngữ	Tiếng Việt
Kích Thước Bao Bì	18 x 13 x 0.9 cm
Số trang	194
Hình thức	Bìa Mềm
Sản phẩm bán chạy nhất	Top 100 sản phẩm Manga Khác bán chạy của tháng
Giá sản phẩm trên Fahasa.com đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như Phụ phí đóng gói, phí vận chuyển, phụ phí hàng cồng kềnh,...
Chính sách khuyến mãi trên Fahasa.com không áp dụng cho Hệ thống Nhà sách Fahasa trên toàn quốc
[Manga] Thiên Sứ Nhà Bên - Tập 1

TRUYỆN TRANH CHUYỂN THỂ TỪ BỘ LIGHT-NOVEL “THIÊN SỨ NHÀ BÊN” RẤT ĐƯỢC YÊU THÍCH!!

Hàng xóm kế bên căn hộ của Fujimiya Amane chính là nữ sinh xinh đẹp nhất trường cậu, Shiina Mahiru. Hai người vốn chẳng có mối liên hệ nào cho đến một ngày mưa tầm tã, Amane tình nguyện đưa chiếc ô của mình cho cô bạn hàng xóm xinh đẹp tựa thiên thần. Kể từ đó, cả hai đã bắt đầu tương tác với nhau theo một cách kì quặc.

Chẳng thể chịu được lối sinh hoạt cẩu thả khi sống một mình của Amane, Mahiru đã quyết định sẽ chăm sóc cậu từ những điều nhỏ nhất.

Chuyện tình ngọt ngào với cô gái nhà bên tuy lạnh lùng nhưng thật đáng yêu chính thức ra mắt phiên bản truyện tranh! Tập 1 có thêm một phần ngoại truyện đặc biệt do chính tác giả nguyên tác Saekisan sáng tác!', N'18 x 13 x 0.9', 194, 0.05, N'Tiếng Việt', N'Bìa Mềm', 253, 18, CAST(N'2024-01-04' AS Date), CAST(N'2024-01-04' AS Date), N'Trân Trân', NULL, N'rc        ', N'KD        ', N'MG        ', N'NV01', 1, N'KD        ', 0, 0)
INSERT [dbo].[SanPham] ([id], [tieu_de], [tac_gia], [don_gia], [nam_xuat_ban], [mo_ta], [kich_thuoc], [so_trang], [giam_gia], [ngon_ngu], [kieu_bia], [so_luong], [do_tuoi], [ngay_cap_nhat_moi_nhat], [ngay_nhap], [nguoi_dich], [can_nang], [the_loai], [nha_xuat_ban], [phan_loai], [nguoi_nhap], [trang_thai], [nha_cung_cap], [so_luot_ban], [danh_gia]) VALUES (15, N'[Manga] Dược Sư Tự Sự - Tập 6 - Tặng Standee Ivory', 5, 47000.0000, 2022, N'Miêu Miêu hiện nay làm việc với vai trò nô tì trực tiếp dưới trướng Nhâm Thị, không hiểu tại sao lại phải nhận nhiệm vụ trang điểm cho chủ nhân. Không những thế, Miêu Miêu cũng phải hoá trang và cả hai cùng nhau xuống phố…!? Chuyến đi hiếm hoi của riêng hai người rồi sẽ ra sao? Chuyện về cha mẹ của Miêu Miêu cũng lần đầu được hé lộ. Ngoài ra, tất cả những bí ẩn Miêu Miêu từng phá giải từ trước đến nay sẽ dẫn đến một sự kiện trong tập 6 này!

* WINGS BOOKS - Thương hiệu sách trẻ của NXB Kim Đồng hân hạnh gửi đến các bạn độc giả phiên bản chuyển thể manga đặc sắc của bộ light-novel siêu ăn khách DƯỢC SƯ TỰ SỰ!

Series đã vượt mốc 13 triệu bản tại thị trường Nhật Bản, luôn thống trị bảng xếp hạng bán chạy mỗi khi ra tập mới!

Số tập: 10 (on-going)

Dược Sư Tự Sự (Manga) – Tập 6: Tặng kèm 01 Standee ivory.

---

Một ấn phẩm của WINGS BOOKS - Thương hiệu sách trẻ của NXB Kim Đồng.

Mã hàng	8935244876239
Độ Tuổi	18+
Tên Nhà Cung Cấp	Nhà Xuất Bản Kim Đồng
Tác giả	Natsu Hyuuga (Hero Bunko/Shufunotomosha), Touco Shino, Itsuki Nanao, Nekokurage
Người Dịch	Thảo Aki
NXB	Kim Đồng
Năm XB	2022
Ngôn Ngữ	Tiếng Việt
Trọng lượng (gr)	200
Kích Thước Bao Bì	18 x 13 cm
Số trang	176
Hình thức	Bìa Mềm
Sản phẩm bán chạy nhất	Top 100 sản phẩm Manga Khác bán chạy của tháng
Giá sản phẩm trên Fahasa.com đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như Phụ phí đóng gói, phí vận chuyển, phụ phí hàng cồng kềnh,...
Chính sách khuyến mãi trên Fahasa.com không áp dụng cho Hệ thống Nhà sách Fahasa trên toàn quốc
Miêu Miêu hiện nay làm việc với vai trò nô tì trực tiếp dưới trướng Nhâm Thị, không hiểu tại sao lại phải nhận nhiệm vụ trang điểm cho chủ nhân. Không những thế, Miêu Miêu cũng phải hoá trang và cả hai cùng nhau xuống phố…!? Chuyến đi hiếm hoi của riêng hai người rồi sẽ ra sao? Chuyện về cha mẹ của Miêu Miêu cũng lần đầu được hé lộ. Ngoài ra, tất cả những bí ẩn Miêu Miêu từng phá giải từ trước đến nay sẽ dẫn đến một sự kiện trong tập 6 này!

* WINGS BOOKS - Thương hiệu sách trẻ của NXB Kim Đồng hân hạnh gửi đến các bạn độc giả phiên bản chuyển thể manga đặc sắc của bộ light-novel siêu ăn khách DƯỢC SƯ TỰ SỰ!

Series đã vượt mốc 13 triệu bản tại thị trường Nhật Bản, luôn thống trị bảng xếp hạng bán chạy mỗi khi ra tập mới!

Số tập: 10 (on-going)

Dược Sư Tự Sự (Manga) – Tập 6: Tặng kèm 01 Standee ivory.

---

Một ấn phẩm của WINGS BOOKS - Thương hiệu sách trẻ của NXB Kim Đồng.', N'	18 x 13', 176, 0.05, N'Tiếng Việt', N'Bìa Mềm', 24, 18, CAST(N'2024-03-04' AS Date), CAST(N'2024-03-04' AS Date), N'Thảo Aki', 200, N'rm        ', N'KD        ', N'MG        ', N'NV01', 1, N'KD        ', 0, 0)
INSERT [dbo].[SanPham] ([id], [tieu_de], [tac_gia], [don_gia], [nam_xuat_ban], [mo_ta], [kich_thuoc], [so_trang], [giam_gia], [ngon_ngu], [kieu_bia], [so_luong], [do_tuoi], [ngay_cap_nhat_moi_nhat], [ngay_nhap], [nguoi_dich], [can_nang], [the_loai], [nha_xuat_ban], [phan_loai], [nguoi_nhap], [trang_thai], [nha_cung_cap], [so_luot_ban], [danh_gia]) VALUES (16, N'Thiên Sứ Nhà Bên - Tập 4 - Tặng Kèm Bookmark', 6, 95000.0000, 2022, N'“Đối với tôi... cậu ấy là người quan trọng nhất.”

Trong khi cả lớp náo loạn vì phát ngôn gây sốc ấy của Mahiru thì Amane - người không thể đoán định được suy nghĩ của cô - đã quyết tâm trở thành chàng trai xứng đáng ở bên cạnh cô ấy.

Để theo kịp Mahiru, cô gái xinh đẹp, thông minh, hoàn hảo và luôn dành sự tin tưởng cho cậu, Amane đang rất phấn đấu trong cả chuyện học hành lẫn rèn luyện thể thao. Chẳng rõ Mahiru có hiểu cho tâm ý của Amane hay không, nhưng chính Mahiru cũng đang cố gắng tiến thêm một bước để xoay chuyển trạng thái mơ hồ trong mối quan hệ của hai người.

Đây là câu chuyện tình ngọt ngào với cô gái nhà bên tuy lạnh lùng nhưng thật đáng yêu đã được ủng hộ nhiệt tình trên trang Shousetsuka ni Narou.

* THIÊN SỨ NHÀ BÊN được xem là cú hit của dòng Light Novel rom-com tại thị trường Nhật Bản, với nội dung hài hước - lãng mạn rất được yêu thích. Tác phẩm nằm top 10 Kono Light novel ga Sugoi năm 2021, đã bán ra hơn 400.000 bản chỉ với 4 tập truyện riêng tại Nhật Bản.

Số tập: 7+ (on-going)

Thiên Sứ Nhà Bên – Tập 4 – Phiên bản tặng kèm 01 Bookmark

---

Một ấn phẩm của WINGS BOOKS - Thương hiệu sách trẻ của NXB Kim Đồng.

Mã hàng	8935244876970
Độ Tuổi	18+
Tên Nhà Cung Cấp	Nhà Xuất Bản Kim Đồng
Tác giả	Saekisan, Hanekoto
Người Dịch	Trân Trân
NXB	Kim Đồng
Năm XB	2022
Ngôn Ngữ	Tiếng Việt
Trọng lượng (gr)	350
Kích Thước Bao Bì	19 x 13 cm
Số trang	316
Hình thức	Bìa Mềm
Sản phẩm hiển thị trong	
Nhà Xuất Bản Kim Đồng
Sản phẩm bán chạy nhất	Top 100 sản phẩm Light Novel bán chạy của tháng
Giá sản phẩm trên Fahasa.com đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như Phụ phí đóng gói, phí vận chuyển, phụ phí hàng cồng kềnh,...
Chính sách khuyến mãi trên Fahasa.com không áp dụng cho Hệ thống Nhà sách Fahasa trên toàn quốc
“Đối với tôi... cậu ấy là người quan trọng nhất.”

Trong khi cả lớp náo loạn vì phát ngôn gây sốc ấy của Mahiru thì Amane - người không thể đoán định được suy nghĩ của cô - đã quyết tâm trở thành chàng trai xứng đáng ở bên cạnh cô ấy.

Để theo kịp Mahiru, cô gái xinh đẹp, thông minh, hoàn hảo và luôn dành sự tin tưởng cho cậu, Amane đang rất phấn đấu trong cả chuyện học hành lẫn rèn luyện thể thao. Chẳng rõ Mahiru có hiểu cho tâm ý của Amane hay không, nhưng chính Mahiru cũng đang cố gắng tiến thêm một bước để xoay chuyển trạng thái mơ hồ trong mối quan hệ của hai người.

Đây là câu chuyện tình ngọt ngào với cô gái nhà bên tuy lạnh lùng nhưng thật đáng yêu đã được ủng hộ nhiệt tình trên trang Shousetsuka ni Narou.

* THIÊN SỨ NHÀ BÊN được xem là cú hit của dòng Light Novel rom-com tại thị trường Nhật Bản, với nội dung hài hước - lãng mạn rất được yêu thích. Tác phẩm nằm top 10 Kono Light novel ga Sugoi năm 2021, đã bán ra hơn 400.000 bản chỉ với 4 tập truyện riêng tại Nhật Bản.

Số tập: 7+ (on-going)

Thiên Sứ Nhà Bên – Tập 4 – Phiên bản tặng kèm 01 Bookmark

---

Một ấn phẩm của WINGS BOOKS - Thương hiệu sách trẻ của NXB Kim Đồng.', N'19 x 13', 316, 0.1, N'Tiếng Việt', N'Bìa Mềm', 245, 18, CAST(N'2024-02-04' AS Date), CAST(N'2024-02-04' AS Date), N'Trân Trân', 350, N'rc        ', N'KD        ', N'LN        ', N'NV01', 1, N'KD        ', 0, 0)
INSERT [dbo].[SanPham] ([id], [tieu_de], [tac_gia], [don_gia], [nam_xuat_ban], [mo_ta], [kich_thuoc], [so_trang], [giam_gia], [ngon_ngu], [kieu_bia], [so_luong], [do_tuoi], [ngay_cap_nhat_moi_nhat], [ngay_nhap], [nguoi_dich], [can_nang], [the_loai], [nha_xuat_ban], [phan_loai], [nguoi_nhap], [trang_thai], [nha_cung_cap], [so_luot_ban], [danh_gia]) VALUES (17, N'Thiên Sứ Nhà Bên - Tập 3', 6, 95000.0000, 2022, N'“Mọi người đều thân thiết với Amane, chỉ có tôi như bị cho ra rìa vậy đó.”

Mahiru và Amane đã lên lớp 11, họ trở thành bạn cùng lớp với nhau! Trái với Mahiru luôn cố gắng thu hẹp khoảng cách kể cả khi ở trường, Amane vẫn giữ ý với “thiên sứ” và không tiến thêm một bước nào.

Nhờ có Chitose mà Mahiru dần xóa bỏ bức tường ngăn cách với các bạn cùng lớp, trong khi Amane lại nhớ đến vết thương cũ vừa lành trong tim...

Đây là câu chuyện tình ngọt ngào với cô gái nhà bên tuy lạnh lùng nhưng thật đáng yêu đã được ủng hộ nhiệt tình trên trang Shousetsuka ni Narou.

* THIÊN SỨ NHÀ BÊN được xem là cú hit của dòng Light Novel rom-com tại thị trường Nhật Bản, với nội dung hài hước - lãng mạn rất được yêu thích. Tác phẩm nằm top 10 Kono Light novel ga Sugoi năm 2021, đã bán ra hơn 400.000 bản chỉ với 4 tập truyện riêng tại Nhật Bản.

Số tập: 5+ (on-going)

---

Một ấn phẩm của WINGS BOOKS - Thương hiệu sách trẻ của NXB Kim Đồng.

Mã hàng	8935244872972
Độ Tuổi	18+
Tên Nhà Cung Cấp	Nhà Xuất Bản Kim Đồng
Tác giả	Saekisan, Hanekoto
Người Dịch	Trân Trân
NXB	NXB Kim Đồng
Năm XB	2022
Ngôn Ngữ	Tiếng Việt
Trọng lượng (gr)	350
Kích Thước Bao Bì	19 x 13 cm
Số trang	316
Hình thức	Bìa Mềm
Sản phẩm bán chạy nhất	Top 100 sản phẩm Light Novel bán chạy của tháng
Giá sản phẩm trên Fahasa.com đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như Phụ phí đóng gói, phí vận chuyển, phụ phí hàng cồng kềnh,...
Chính sách khuyến mãi trên Fahasa.com không áp dụng cho Hệ thống Nhà sách Fahasa trên toàn quốc
“Mọi người đều thân thiết với Amane, chỉ có tôi như bị cho ra rìa vậy đó.”

Mahiru và Amane đã lên lớp 11, họ trở thành bạn cùng lớp với nhau! Trái với Mahiru luôn cố gắng thu hẹp khoảng cách kể cả khi ở trường, Amane vẫn giữ ý với “thiên sứ” và không tiến thêm một bước nào.

Nhờ có Chitose mà Mahiru dần xóa bỏ bức tường ngăn cách với các bạn cùng lớp, trong khi Amane lại nhớ đến vết thương cũ vừa lành trong tim...

Đây là câu chuyện tình ngọt ngào với cô gái nhà bên tuy lạnh lùng nhưng thật đáng yêu đã được ủng hộ nhiệt tình trên trang Shousetsuka ni Narou.

* THIÊN SỨ NHÀ BÊN được xem là cú hit của dòng Light Novel rom-com tại thị trường Nhật Bản, với nội dung hài hước - lãng mạn rất được yêu thích. Tác phẩm nằm top 10 Kono Light novel ga Sugoi năm 2021, đã bán ra hơn 400.000 bản chỉ với 4 tập truyện riêng tại Nhật Bản.

Số tập: 5+ (on-going)

---

Một ấn phẩm của WINGS BOOKS - Thương hiệu sách trẻ của NXB Kim Đồng.', N'19 x 13', 316, 0.1, N'Tiếng Việt', N'Bìa Mềm', 226, 18, CAST(N'2024-02-04' AS Date), CAST(N'2024-02-04' AS Date), N'Trân Trân', 350, N'rc        ', N'KD        ', N'LN        ', N'NV02', 1, N'KD        ', 0, 0)
INSERT [dbo].[SanPham] ([id], [tieu_de], [tac_gia], [don_gia], [nam_xuat_ban], [mo_ta], [kich_thuoc], [so_trang], [giam_gia], [ngon_ngu], [kieu_bia], [so_luong], [do_tuoi], [ngay_cap_nhat_moi_nhat], [ngay_nhap], [nguoi_dich], [can_nang], [the_loai], [nha_xuat_ban], [phan_loai], [nguoi_nhap], [trang_thai], [nha_cung_cap], [so_luot_ban], [danh_gia]) VALUES (18, N'Thiên Sứ Nhà Bên - Tập 2', 6, 95000.0000, 2022, N'Thiên Sứ Nhà Bên - Tập 2

Amane là một nam sinh khá cẩu thả, còn Mahiru là nữ sinh xinh xắn nhất trường với biệt danh “thiên sứ”. Cả hai vốn chẳng có mối liên hệ nào với nhau, thế nhưng sau một dịp tình cờ, họ đã bắt đầu qua lại và ăn cơm chung một nhà.

Cùng nhau đón năm mới, đi chùa đầu năm, tránh khỏi những rắc rối của ngày Valentine... Nhờ những hành động tuy vụng về nhưng ấm áp của Amane, sự gặp gỡ với bố mẹ và bạn bè của Amane, trái tim băng giá của Mahiru dần tan chảy...

Đây là câu chuyện tình ngọt ngào với cô gái nhà bên tuy lạnh lùng nhưng thật đáng yêu đã được ủng hộ nhiệt tình trên trang Shousetsuka ni Narou.

*THIÊN SỨ NHÀ BÊN được xem là cú hit của dòng Light Novel rom-com tại thị trường Nhật Bản, với nội dung hài hước - lãng mạn rất được yêu thích. Tác phẩm nằm top 10 Kono Light novel ga Sugoi năm 2021, đã bán ra hơn 400.000 bản chỉ với 4 tập truyện riêng tại Nhật Bản.

Số tập: 5+ (on-going)

---

Một ấn phẩm của WINGS BOOKS - Thương hiệu sách trẻ của NXB Kim Đồng.

Mã hàng	8935244867312
Độ Tuổi	18+
Tên Nhà Cung Cấp	Nhà Xuất Bản Kim Đồng
Tác giả	Saekisan, Hanekoto
Người Dịch	Không Chán
NXB	NXB Kim Đồng
Năm XB	2021
Ngôn Ngữ	Tiếng Việt
Trọng lượng (gr)	350
Kích Thước Bao Bì	19 x 13 cm
Số trang	332
Hình thức	Bìa Mềm
Sản phẩm hiển thị trong	
Nhà Xuất Bản Kim Đồng
RƯỚC DEAL LINH ĐÌNH VUI ĐÓN TRUNG THU
Sản phẩm bán chạy nhất	Top 100 sản phẩm Light Novel bán chạy của tháng
Giá sản phẩm trên Fahasa.com đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như Phụ phí đóng gói, phí vận chuyển, phụ phí hàng cồng kềnh,...
Chính sách khuyến mãi trên Fahasa.com không áp dụng cho Hệ thống Nhà sách Fahasa trên toàn quốc
Thiên Sứ Nhà Bên - Tập 2

Amane là một nam sinh khá cẩu thả, còn Mahiru là nữ sinh xinh xắn nhất trường với biệt danh “thiên sứ”. Cả hai vốn chẳng có mối liên hệ nào với nhau, thế nhưng sau một dịp tình cờ, họ đã bắt đầu qua lại và ăn cơm chung một nhà.

Cùng nhau đón năm mới, đi chùa đầu năm, tránh khỏi những rắc rối của ngày Valentine... Nhờ những hành động tuy vụng về nhưng ấm áp của Amane, sự gặp gỡ với bố mẹ và bạn bè của Amane, trái tim băng giá của Mahiru dần tan chảy...

Đây là câu chuyện tình ngọt ngào với cô gái nhà bên tuy lạnh lùng nhưng thật đáng yêu đã được ủng hộ nhiệt tình trên trang Shousetsuka ni Narou.

*THIÊN SỨ NHÀ BÊN được xem là cú hit của dòng Light Novel rom-com tại thị trường Nhật Bản, với nội dung hài hước - lãng mạn rất được yêu thích. Tác phẩm nằm top 10 Kono Light novel ga Sugoi năm 2021, đã bán ra hơn 400.000 bản chỉ với 4 tập truyện riêng tại Nhật Bản.

Số tập: 5+ (on-going)

---

Một ấn phẩm của WINGS BOOKS - Thương hiệu sách trẻ của NXB Kim Đồng.', N'19 x 13', 332, 0.1, N'Tiếng Việt', N'Bìa Mềm', 55, 18, CAST(N'2024-01-01' AS Date), CAST(N'2024-01-01' AS Date), N'Trân Trân', 350, N'rc        ', N'KD        ', N'LN        ', N'NV02', 1, N'KD        ', 0, 0)
INSERT [dbo].[SanPham] ([id], [tieu_de], [tac_gia], [don_gia], [nam_xuat_ban], [mo_ta], [kich_thuoc], [so_trang], [giam_gia], [ngon_ngu], [kieu_bia], [so_luong], [do_tuoi], [ngay_cap_nhat_moi_nhat], [ngay_nhap], [nguoi_dich], [can_nang], [the_loai], [nha_xuat_ban], [phan_loai], [nguoi_nhap], [trang_thai], [nha_cung_cap], [so_luot_ban], [danh_gia]) VALUES (19, N'Bocchi The Rock! - Tập 1 - Tặng Kèm Bìa Áo Đặc Biệt + Bookmark', 7, 40000.0000, 2024, N'Bocchi The Rock! - Tập 1

Goto Hitori là một nữ sinh hướng nội. Giao tiếp kém, học cũng kém, tay chân lại vụng về, nên suốt thời cấp 2 chẳng thể kết bạn với ai, chỉ có cây guitar bầu bạn. Khi lên lớp 10, một ngày nọ, cô nàng tình cờ gia nhập Ban nhạc Đoàn Kết, lấy nghệ danh là Bocchi và trở thành một tay guitar khuấy đảo nền nhạc Rock nước Nhật!? Nhưng trước hết, Bocchi phải nhìn được vào mắt các thành viên trong ban nhạc đã!

Mã hàng	8935352604601
Độ Tuổi	15+
Tên Nhà Cung Cấp	Nhà Xuất Bản Kim Đồng
Tác giả	Aki Hamazi
Người Dịch	Tatsuhiro, Luc1
NXB	Kim Đồng
Năm XB	2024
Ngôn Ngữ	Tiếng Việt
Trọng lượng (gr)	200
Kích Thước Bao Bì	20.5 x 14 x 0.6 cm
Số trang	120
Hình thức	Bìa Mềm
Sản phẩm bán chạy nhất	Top 100 sản phẩm Manga Khác bán chạy của tháng
Giá sản phẩm trên Fahasa.com đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như Phụ phí đóng gói, phí vận chuyển, phụ phí hàng cồng kềnh,...
Chính sách khuyến mãi trên Fahasa.com không áp dụng cho Hệ thống Nhà sách Fahasa trên toàn quốc
Bocchi The Rock! - Tập 1

Goto Hitori là một nữ sinh hướng nội. Giao tiếp kém, học cũng kém, tay chân lại vụng về, nên suốt thời cấp 2 chẳng thể kết bạn với ai, chỉ có cây guitar bầu bạn. Khi lên lớp 10, một ngày nọ, cô nàng tình cờ gia nhập Ban nhạc Đoàn Kết, lấy nghệ danh là Bocchi và trở thành một tay guitar khuấy đảo nền nhạc Rock nước Nhật!? Nhưng trước hết, Bocchi phải nhìn được vào mắt các thành viên trong ban nhạc đã!', N'20.5 x 14 x 0.6', 120, 0.05, N'Tiếng Việt', N'Bìa Mềm', 51, 15, CAST(N'2024-01-01' AS Date), CAST(N'2024-01-01' AS Date), N'	Tatsuhiro, Luc1', 200, N'sc        ', N'KD        ', N'MG        ', N'NV02', 1, N'KD        ', 0, 0)
INSERT [dbo].[SanPham] ([id], [tieu_de], [tac_gia], [don_gia], [nam_xuat_ban], [mo_ta], [kich_thuoc], [so_trang], [giam_gia], [ngon_ngu], [kieu_bia], [so_luong], [do_tuoi], [ngay_cap_nhat_moi_nhat], [ngay_nhap], [nguoi_dich], [can_nang], [the_loai], [nha_xuat_ban], [phan_loai], [nguoi_nhap], [trang_thai], [nha_cung_cap], [so_luot_ban], [danh_gia]) VALUES (20, N'Sứ Giả Bốn Mùa - Vũ Điệu Mùa Xuân - Tập 1 - Tặng Kèm Postcard', 8, 125000.0000, 2024, N'Sứ Giả Bốn Mùa - Vũ Điệu Mùa Xuân - Tập 1

“Mùa xuân - ở đây, bình an, vô sự.”

Ban đầu, khắp thế gian chỉ có mùa đông. Không chịu nổi nỗi cô đơn ấy, mùa đông đã cắt gọt một phần sinh mệnh để tạo ra mùa xuân. Không lâu sau, theo nguyện vọng của đất mẹ, mùa hè và mùa thu cũng ra đời, để rồi từ đó, trời đất có bốn mùa hoàn chỉnh. Những đứa trẻ loài người được giao trọng trách luân chuyển bốn mùa trên dòng thời gian, những người đại diện đảm nhận nhiệm vụ đó được gọi là “sứ giả bốn mùa”.

Lúc này, một tiểu nữ thần ý thức rõ về sứ mệnh của bản thân, đang cố gắng đứng lên. Nàng được vị thần bốn mùa giao cho cai quản “mùa xuân”. Được mẹ đặt cho cái tên “Hinagiku”. Mùa xuân đã biến mất khỏi đất nước này mười năm trước. Vượt qua muôn vàn gian khổ, Hinagiku đã phục hồi tư cách thần linh mang thân xác con người. Hinagiku và nữ hộ vệ cùng nhau cất bước, để chiến đấu với những kẻ từng bắt cóc và làm mình phải chịu tủi nhục suốt quãng thời gian dài. Sâu thẳm nơi trái tim Hinagiku luôn có một nỗi niềm lưu luyến nhớ nhung dành cho mùa đông, tựa như trong thần thoại.

Tác giả Kana Akatsuki gửi đến các bạn tập đầu tiên trong thiên truyện kể về các vị thần có hiện thân là con người, lãnh nhiệm vụ làm cho bốn mùa hiện diện rõ nét ở chốn nhân gian.

*SỨ GIẢ BỐN MÙA là series Light Novel đặc sắc đến từ Kana Akatsuki – tác giả của Violet Evergarden. Bộ sách xếp Hạng 1 tác phẩm mới của Kono Light Novel ga Sugoi! 2022, đã được chuyển thể thành manga và bán được 500.000 bản toàn series.

Mã hàng	8935352605813
Dự Kiến Có Hàng	05/04/2024
Ngày Dự Kiến Phát Hành	05/04/2024
Độ Tuổi	15 - 18
Tên Nhà Cung Cấp	Nhà Xuất Bản Kim Đồng
Tác giả	Kana Akatsuki, Suoh
Người Dịch	Hương Giang
NXB	Kim Đồng
Năm XB	2024
Ngôn Ngữ	Tiếng Việt
Trọng lượng (gr)	520
Kích Thước Bao Bì	19 x 13 x 2.5 cm
Số trang	504
Hình thức	Bìa Mềm
Sản phẩm bán chạy nhất	Top 100 sản phẩm Light Novel bán chạy của tháng
Giá sản phẩm trên Fahasa.com đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như Phụ phí đóng gói, phí vận chuyển, phụ phí hàng cồng kềnh,...
Chính sách khuyến mãi trên Fahasa.com không áp dụng cho Hệ thống Nhà sách Fahasa trên toàn quốc
Sứ Giả Bốn Mùa - Vũ Điệu Mùa Xuân - Tập 1

“Mùa xuân - ở đây, bình an, vô sự.”

Ban đầu, khắp thế gian chỉ có mùa đông. Không chịu nổi nỗi cô đơn ấy, mùa đông đã cắt gọt một phần sinh mệnh để tạo ra mùa xuân. Không lâu sau, theo nguyện vọng của đất mẹ, mùa hè và mùa thu cũng ra đời, để rồi từ đó, trời đất có bốn mùa hoàn chỉnh. Những đứa trẻ loài người được giao trọng trách luân chuyển bốn mùa trên dòng thời gian, những người đại diện đảm nhận nhiệm vụ đó được gọi là “sứ giả bốn mùa”.

Lúc này, một tiểu nữ thần ý thức rõ về sứ mệnh của bản thân, đang cố gắng đứng lên. Nàng được vị thần bốn mùa giao cho cai quản “mùa xuân”. Được mẹ đặt cho cái tên “Hinagiku”. Mùa xuân đã biến mất khỏi đất nước này mười năm trước. Vượt qua muôn vàn gian khổ, Hinagiku đã phục hồi tư cách thần linh mang thân xác con người. Hinagiku và nữ hộ vệ cùng nhau cất bước, để chiến đấu với những kẻ từng bắt cóc và làm mình phải chịu tủi nhục suốt quãng thời gian dài. Sâu thẳm nơi trái tim Hinagiku luôn có một nỗi niềm lưu luyến nhớ nhung dành cho mùa đông, tựa như trong thần thoại.

Tác giả Kana Akatsuki gửi đến các bạn tập đầu tiên trong thiên truyện kể về các vị thần có hiện thân là con người, lãnh nhiệm vụ làm cho bốn mùa hiện diện rõ nét ở chốn nhân gian.

*SỨ GIẢ BỐN MÙA là series Light Novel đặc sắc đến từ Kana Akatsuki – tác giả của Violet Evergarden. Bộ sách xếp Hạng 1 tác phẩm mới của Kono Light Novel ga Sugoi! 2022, đã được chuyển thể thành manga và bán được 500.000 bản toàn series.', N'19 x 13 x 2.5', 504, 0.15, N'Tiếng Việt', N'Bìa Mềm', 17, 15, CAST(N'2024-01-01' AS Date), CAST(N'2024-01-01' AS Date), N'Hương Giang', 520, N'rm        ', N'KD        ', N'LN        ', N'NV01', 1, N'KD        ', 0, 0)
INSERT [dbo].[SanPham] ([id], [tieu_de], [tac_gia], [don_gia], [nam_xuat_ban], [mo_ta], [kich_thuoc], [so_trang], [giam_gia], [ngon_ngu], [kieu_bia], [so_luong], [do_tuoi], [ngay_cap_nhat_moi_nhat], [ngay_nhap], [nguoi_dich], [can_nang], [the_loai], [nha_xuat_ban], [phan_loai], [nguoi_nhap], [trang_thai], [nha_cung_cap], [so_luot_ban], [danh_gia]) VALUES (21, N'Bảo Mẫu Bí Mật Của Tiểu Thư - Tập 1 - Tặng Kèm Postcard + Poster A3', 9, 138000.0000, 2023, N'Bảo Mẫu Bí Mật Của Tiểu Thư - Tập 1

Cậu học sinh cấp 3, Tomonari Itsuki dính vào một vụ bắt cóc, kết cục lại phải chăm sóc thiên kim tiểu thư của tập đoàn tài chính lớn nhất Nhật Bản - Konohana Hinako. Nhìn bề ngoài thì Hinako là một thiếu nữ vừa xinh đẹp vừa tài năng, nhưng thân phận thực sự lại là một cô nàng lười chảy thây, rõ thiếu kỹ năng sống. Tuy nhiên, vì hoàn cảnh gia đình mà Hinako phải vào vai một “tiểu thư hoàn hảo” tại trường học của mình. Vì lí do bất khả kháng và cũng vì muốn bảo vệ Hinako, Itsuki đã nhận lời chăm sóc cô ấy thật chu đáo. Và thế là cô nàng bắt đầu bày đủ trò để được cậu nuông chiều…

“Bây giờ… không có Itsuki ở bên, còn khó chịu hơn.”

Mời các bạn dõi theo câu chuyện tình yêu vượt lên trên cả mối quan hệ chủ tớ~

Mã hàng	3300000037431-qt1
Tên Nhà Cung Cấp	XYZ
Tác giả	Yusaku Sakaishi, Sakura Miwabe
Người Dịch	Trang Kumi
NXB	Hà Nội
Năm XB	2023
Ngôn Ngữ	Tiếng Việt
Kích Thước Bao Bì	18 x 13 x 1.8 cm
Số trang	368
Hình thức	Bìa Mềm
Sản phẩm bán chạy nhất	Top 100 sản phẩm Light Novel bán chạy của tháng
Giá sản phẩm trên Fahasa.com đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như Phụ phí đóng gói, phí vận chuyển, phụ phí hàng cồng kềnh,...
Chính sách khuyến mãi trên Fahasa.com không áp dụng cho Hệ thống Nhà sách Fahasa trên toàn quốc
Bảo Mẫu Bí Mật Của Tiểu Thư - Tập 1

Cậu học sinh cấp 3, Tomonari Itsuki dính vào một vụ bắt cóc, kết cục lại phải chăm sóc thiên kim tiểu thư của tập đoàn tài chính lớn nhất Nhật Bản - Konohana Hinako. Nhìn bề ngoài thì Hinako là một thiếu nữ vừa xinh đẹp vừa tài năng, nhưng thân phận thực sự lại là một cô nàng lười chảy thây, rõ thiếu kỹ năng sống. Tuy nhiên, vì hoàn cảnh gia đình mà Hinako phải vào vai một “tiểu thư hoàn hảo” tại trường học của mình. Vì lí do bất khả kháng và cũng vì muốn bảo vệ Hinako, Itsuki đã nhận lời chăm sóc cô ấy thật chu đáo. Và thế là cô nàng bắt đầu bày đủ trò để được cậu nuông chiều…

“Bây giờ… không có Itsuki ở bên, còn khó chịu hơn.”

Mời các bạn dõi theo câu chuyện tình yêu vượt lên trên cả mối quan hệ chủ tớ~', N'18 x 13 x 1.8', 368, 0.27, N'Tiếng Việt', N'Bìa Mềm', 58, 18, CAST(N'2024-06-01' AS Date), CAST(N'2024-06-01' AS Date), N'Trang Kumi', 350, N'rc        ', N'KD        ', N'LN        ', N'NV01', 1, N'KD        ', 0, 0)
INSERT [dbo].[SanPham] ([id], [tieu_de], [tac_gia], [don_gia], [nam_xuat_ban], [mo_ta], [kich_thuoc], [so_trang], [giam_gia], [ngon_ngu], [kieu_bia], [so_luong], [do_tuoi], [ngay_cap_nhat_moi_nhat], [ngay_nhap], [nguoi_dich], [can_nang], [the_loai], [nha_xuat_ban], [phan_loai], [nguoi_nhap], [trang_thai], [nha_cung_cap], [so_luot_ban], [danh_gia]) VALUES (22, N'Thiên Sứ Nhà Bên - Tập 8 - Bản Giới Hạn - Tặng Kèm Bookmark + Set 2 Bao Lì Xì + Bìa Áo Đặc Biệt + Khánh Treo', 6, 95000.0000, 2024, N'Thiên Sứ Nhà Bên - Tập 8

“Hôm nay… mình không về… có được không…?”

Lễ hội trường nhộn nhịp đã trôi qua, mọi người lại quay về với cuộc sống thường nhật. Amane một lần nữa truyền đạt cảm xúc của cậu đến Mahiru bằng lời nói, đồng thời hứa hẹn về một tương lai bên nhau. Vì muốn tặng Mahiru một món quà bảo chứng cho lời hứa đó, Amane quyết định đi làm thêm. Mặt khác, Mahiru trong lúc cô đơn chờ đợi Amane đi làm về, đã bí mật làm một thứ để bày tỏ tình cảm của mình với cậu…

Đây là câu chuyện tình ngọt ngào với cô gái nhà bên tuy lạnh lùng nhưng thật đáng yêu đã được ủng hộ nhiệt tình trên trang Shousetsuka ni Narou.

Mã hàng	8935352602652
Độ Tuổi	18+
Tên Nhà Cung Cấp	Nhà Xuất Bản Kim Đồng
Tác giả	Saekisan, Hanekoto
Người Dịch	Trân Trân
NXB	Kim Đồng
Năm XB	2024
Ngôn Ngữ	Tiếng Việt
Trọng lượng (gr)	360
Kích Thước Bao Bì	19 x 13 x 1.2 cm
Số trang	348
Hình thức	Bìa Mềm
Sản phẩm bán chạy nhất	Top 100 sản phẩm Light Novel bán chạy của tháng
Giá sản phẩm trên Fahasa.com đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như Phụ phí đóng gói, phí vận chuyển, phụ phí hàng cồng kềnh,...
Chính sách khuyến mãi trên Fahasa.com không áp dụng cho Hệ thống Nhà sách Fahasa trên toàn quốc
Thiên Sứ Nhà Bên - Tập 8

“Hôm nay… mình không về… có được không…?”

Lễ hội trường nhộn nhịp đã trôi qua, mọi người lại quay về với cuộc sống thường nhật. Amane một lần nữa truyền đạt cảm xúc của cậu đến Mahiru bằng lời nói, đồng thời hứa hẹn về một tương lai bên nhau. Vì muốn tặng Mahiru một món quà bảo chứng cho lời hứa đó, Amane quyết định đi làm thêm. Mặt khác, Mahiru trong lúc cô đơn chờ đợi Amane đi làm về, đã bí mật làm một thứ để bày tỏ tình cảm của mình với cậu…

Đây là câu chuyện tình ngọt ngào với cô gái nhà bên tuy lạnh lùng nhưng thật đáng yêu đã được ủng hộ nhiệt tình trên trang Shousetsuka ni Narou.', N'	19 x 13 x 1.2', 348, 0, N'Tiếng Việt', N'Bìa Mềm', 88, 18, CAST(N'2024-01-01' AS Date), CAST(N'2024-01-01' AS Date), N'Trân Trân', 360, N'rc        ', N'KD        ', N'LN        ', N'NV01', 1, N'KD        ', 0, 0)
INSERT [dbo].[SanPham] ([id], [tieu_de], [tac_gia], [don_gia], [nam_xuat_ban], [mo_ta], [kich_thuoc], [so_trang], [giam_gia], [ngon_ngu], [kieu_bia], [so_luong], [do_tuoi], [ngay_cap_nhat_moi_nhat], [ngay_nhap], [nguoi_dich], [can_nang], [the_loai], [nha_xuat_ban], [phan_loai], [nguoi_nhap], [trang_thai], [nha_cung_cap], [so_luot_ban], [danh_gia]) VALUES (23, N'Clean Code - Mã Sạch Và Con Đường Trở Thành Lập Trình Viên Giỏi (Tái Bản 2024)', 10, 386000.0000, 2024, N'Clean Code - Mã Sạch Và Con Đường Trở Thành Lập Trình Viên Giỏi

Mã sạch và con đường trở thành lập trình viên giỏi

Hiện nay, lập trình viên là một trong những nghề nghiệp được nhiều người lựa chọn theo đuổi và gắn bó. Đây là công việc đòi hỏi sự tỉ mỉ, nhiều công sức nhưng mang lại giá trị cao và một tương lai công việc hứa hẹn. Là một trong số những chuyên gia giàu kinh nghiệm, điêu luyện và lành nghề trong ngành, tác giả đã đúc rút từ kinh nghiệm của mình, viết về những tình huống trong thực tế, đôi khi có thể trái ngược với lý thuyết để xây dựng nên cuốn cẩm nang này, nhằm hỗ trợ những người đang muốn trở thành một lập trình viên chuyên nghiệp.

Cuốn sách được nhiều lập trình viên đánh giá là quyển sách giá trị nhất mà họ từng đọc trong sự nghiệp của mình. Cuốn sách hướng dẫn cách để viết những đoạn mã có thể hoạt động tốt, cũng như truyền tải được ý định của người viết nên chúng.

Cuốn sách được chia thành ba phần lớn. Phần đầu tiên mô tả các nguyên tắc, mô hình và cách thực hành viết mã sạch. Phần thứ hai gồm nhiều tình huống điển hình với mức độ phức tạp gia tang không ngừng. Mỗi tình huống là một bài tập giúp làm sạch mã, chuyển đổi mã có nhiều vấn đề thành mã có ít vấn đề hơn. Và phần cuối là tuyển tập rất nhiều những dấu hiệu của mã có vấn đề, những tìm tòi, suy nghiệm từ thực tiễn được đúc rút qua cách tình huống điển hình.

Mã hàng	8936107813996
Dự Kiến Có Hàng	06/04/2024
Tên Nhà Cung Cấp	CÔNG TY TNHH SÁCH & TRUYỀN THÔNG VIỆT NAM
Tác giả	Robert Cecil Martin
Người Dịch	Mai Lựu
NXB	Dân Trí
Năm XB	2024
Ngôn Ngữ	Tiếng Việt
Trọng lượng (gr)	610
Kích Thước Bao Bì	24 x 16 x 2.9 cm
Số trang	596
Hình thức	Bìa Mềm
Sản phẩm bán chạy nhất	Top 100 sản phẩm Tin học bán chạy của tháng
Giá sản phẩm trên Fahasa.com đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như Phụ phí đóng gói, phí vận chuyển, phụ phí hàng cồng kềnh,...
Chính sách khuyến mãi trên Fahasa.com không áp dụng cho Hệ thống Nhà sách Fahasa trên toàn quốc
Clean Code - Mã Sạch Và Con Đường Trở Thành Lập Trình Viên Giỏi

Mã sạch và con đường trở thành lập trình viên giỏi

Hiện nay, lập trình viên là một trong những nghề nghiệp được nhiều người lựa chọn theo đuổi và gắn bó. Đây là công việc đòi hỏi sự tỉ mỉ, nhiều công sức nhưng mang lại giá trị cao và một tương lai công việc hứa hẹn. Là một trong số những chuyên gia giàu kinh nghiệm, điêu luyện và lành nghề trong ngành, tác giả đã đúc rút từ kinh nghiệm của mình, viết về những tình huống trong thực tế, đôi khi có thể trái ngược với lý thuyết để xây dựng nên cuốn cẩm nang này, nhằm hỗ trợ những người đang muốn trở thành một lập trình viên chuyên nghiệp.

Cuốn sách được nhiều lập trình viên đánh giá là quyển sách giá trị nhất mà họ từng đọc trong sự nghiệp của mình. Cuốn sách hướng dẫn cách để viết những đoạn mã có thể hoạt động tốt, cũng như truyền tải được ý định của người viết nên chúng.

Cuốn sách được chia thành ba phần lớn. Phần đầu tiên mô tả các nguyên tắc, mô hình và cách thực hành viết mã sạch. Phần thứ hai gồm nhiều tình huống điển hình với mức độ phức tạp gia tang không ngừng. Mỗi tình huống là một bài tập giúp làm sạch mã, chuyển đổi mã có nhiều vấn đề thành mã có ít vấn đề hơn. Và phần cuối là tuyển tập rất nhiều những dấu hiệu của mã có vấn đề, những tìm tòi, suy nghiệm từ thực tiễn được đúc rút qua cách tình huống điển hình.', N'24 x 16 x 2.9', 596, 0.1, N'Tiếng Việt ', N'Bìa Mềm', 414, 15, CAST(N'2024-01-01' AS Date), CAST(N'2024-01-01' AS Date), N'	Mai Lựu', 610, N'lt        ', N'DT        ', N'TH        ', N'NV01', 1, N'TTVN      ', 0, 0)
SET IDENTITY_INSERT [dbo].[SanPham] OFF
GO
SET IDENTITY_INSERT [dbo].[TacGia] ON 

INSERT [dbo].[TacGia] ([id], [ho_ten]) VALUES (1, N'Sunsunsun, Momoco')
INSERT [dbo].[TacGia] ([id], [ho_ten]) VALUES (5, N'Natsu Hyuuga')
INSERT [dbo].[TacGia] ([id], [ho_ten]) VALUES (6, N'Saekisan, Hanekoto')
INSERT [dbo].[TacGia] ([id], [ho_ten]) VALUES (7, N'Aki Hamazi')
INSERT [dbo].[TacGia] ([id], [ho_ten]) VALUES (8, N'Kana Akatsuki, Suoh')
INSERT [dbo].[TacGia] ([id], [ho_ten]) VALUES (9, N'Yusaku Sakaishi, Sakura Miwabe')
INSERT [dbo].[TacGia] ([id], [ho_ten]) VALUES (10, N'Robert Cecil Martin')
SET IDENTITY_INSERT [dbo].[TacGia] OFF
GO
INSERT [dbo].[TheLoai] ([id], [ten_the_loai]) VALUES (N'history   ', N'Lịch Sử')
INSERT [dbo].[TheLoai] ([id], [ten_the_loai]) VALUES (N'hr        ', N'Harem')
INSERT [dbo].[TheLoai] ([id], [ten_the_loai]) VALUES (N'khvt      ', N'Khoa Học Viễn Tưởng')
INSERT [dbo].[TheLoai] ([id], [ten_the_loai]) VALUES (N'lt        ', N'Lập Trình')
INSERT [dbo].[TheLoai] ([id], [ten_the_loai]) VALUES (N'rc        ', N'Romcom')
INSERT [dbo].[TheLoai] ([id], [ten_the_loai]) VALUES (N'rm        ', N'Lãng Mạn')
INSERT [dbo].[TheLoai] ([id], [ten_the_loai]) VALUES (N'sc        ', N'Học đường')
GO
/****** Object:  Index [UQ_ChiTietGioHang]    Script Date: 4/8/2024 6:52:02 AM ******/
ALTER TABLE [dbo].[ChiTietGioHang] ADD  CONSTRAINT [UQ_ChiTietGioHang] UNIQUE NONCLUSTERED 
(
	[ma_gio_hang] ASC,
	[ma_san_pham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ChiTietHoaDon]    Script Date: 4/8/2024 6:52:02 AM ******/
ALTER TABLE [dbo].[ChiTietHoaDon] ADD  CONSTRAINT [IX_ChiTietHoaDon] UNIQUE NONCLUSTERED 
(
	[ma_hoa_don] ASC,
	[ma_san_pham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_GioHang]    Script Date: 4/8/2024 6:52:02 AM ******/
ALTER TABLE [dbo].[GioHang] ADD  CONSTRAINT [IX_GioHang] UNIQUE NONCLUSTERED 
(
	[ma_khach_hang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AnhSanPham]  WITH CHECK ADD  CONSTRAINT [FK_AnhSanPham_SanPham] FOREIGN KEY([ma_san_pham])
REFERENCES [dbo].[SanPham] ([id])
GO
ALTER TABLE [dbo].[AnhSanPham] CHECK CONSTRAINT [FK_AnhSanPham_SanPham]
GO
ALTER TABLE [dbo].[ChiTietGioHang]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietGioHang_GioHang] FOREIGN KEY([ma_gio_hang])
REFERENCES [dbo].[GioHang] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ChiTietGioHang] CHECK CONSTRAINT [FK_ChiTietGioHang_GioHang]
GO
ALTER TABLE [dbo].[ChiTietGioHang]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietGioHang_SanPham1] FOREIGN KEY([ma_san_pham])
REFERENCES [dbo].[SanPham] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ChiTietGioHang] CHECK CONSTRAINT [FK_ChiTietGioHang_SanPham1]
GO
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Order] FOREIGN KEY([ma_hoa_don])
REFERENCES [dbo].[HoaDon] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ChiTietHoaDon] CHECK CONSTRAINT [FK_OrderDetail_Order]
GO
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Product] FOREIGN KEY([ma_san_pham])
REFERENCES [dbo].[SanPham] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ChiTietHoaDon] CHECK CONSTRAINT [FK_OrderDetail_Product]
GO
ALTER TABLE [dbo].[DanhGiaSanPham]  WITH CHECK ADD  CONSTRAINT [FK_Review_Customer] FOREIGN KEY([user_id])
REFERENCES [dbo].[KhachHang] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DanhGiaSanPham] CHECK CONSTRAINT [FK_Review_Customer]
GO
ALTER TABLE [dbo].[DanhGiaSanPham]  WITH CHECK ADD  CONSTRAINT [FK_Review_Product] FOREIGN KEY([product_id])
REFERENCES [dbo].[SanPham] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DanhGiaSanPham] CHECK CONSTRAINT [FK_Review_Product]
GO
ALTER TABLE [dbo].[GioHang]  WITH CHECK ADD  CONSTRAINT [FK_GioHang_KhachHang] FOREIGN KEY([ma_khach_hang])
REFERENCES [dbo].[KhachHang] ([id])
GO
ALTER TABLE [dbo].[GioHang] CHECK CONSTRAINT [FK_GioHang_KhachHang]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_Order_Customer] FOREIGN KEY([ma_khach_hang])
REFERENCES [dbo].[KhachHang] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_Order_Customer]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_Product_Author] FOREIGN KEY([tac_gia])
REFERENCES [dbo].[TacGia] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_Product_Author]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_Product_BookClass] FOREIGN KEY([phan_loai])
REFERENCES [dbo].[PhanLoai] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_Product_BookClass]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([the_loai])
REFERENCES [dbo].[TheLoai] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_Product_Category]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_Product_Employee] FOREIGN KEY([nguoi_nhap])
REFERENCES [dbo].[NhanVien] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_Product_Employee]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_Product_Publisher] FOREIGN KEY([nha_xuat_ban])
REFERENCES [dbo].[NhaXuatBan] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_Product_Publisher]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_Product_Supplier] FOREIGN KEY([nha_cung_cap])
REFERENCES [dbo].[NhaCungCap] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_Product_Supplier]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SanPham'
GO
USE [master]
GO
ALTER DATABASE [InfumiStore] SET  READ_WRITE 
GO
