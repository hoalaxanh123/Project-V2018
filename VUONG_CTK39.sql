USE [Vuong_CTK39]
GO
/****** Object:  Table [dbo].[CauHinhWeb]    Script Date: 8/14/2018 3:05:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CauHinhWeb](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Ten] [nvarchar](400) NULL,
	[Loai] [nvarchar](400) NULL,
	[GiaTri] [nvarchar](400) NULL,
	[TrangThai] [bit] NULL,
 CONSTRAINT [PK_CauHinhWeb] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChinhSua]    Script Date: 8/14/2018 3:05:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChinhSua](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NgaySua] [datetime] NULL,
	[NguoiSua] [nchar](50) NULL,
 CONSTRAINT [PK_ThayDoi] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietHoaDon]    Script Date: 8/14/2018 3:05:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietHoaDon](
	[MaCTHD] [int] IDENTITY(1,1) NOT NULL,
	[MaHD] [int] NOT NULL,
	[TenSanPham] [ntext] NOT NULL,
	[SoLuong] [int] NOT NULL,
	[GiaThanh] [money] NOT NULL,
	[ThanhTien] [money] NOT NULL,
	[DaXoa] [bit] NOT NULL,
 CONSTRAINT [PK_ChiTietHoaDon] PRIMARY KEY CLUSTERED 
(
	[MaCTHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CuaHang]    Script Date: 8/14/2018 3:05:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CuaHang](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TenCuaHang] [ntext] NOT NULL,
	[SDT] [ntext] NOT NULL,
	[DiaChi] [ntext] NOT NULL,
	[MoTa] [ntext] NOT NULL,
	[Logo] [ntext] NOT NULL,
	[HotLine] [ntext] NOT NULL,
	[Fax] [ntext] NOT NULL,
	[Email] [nvarchar](150) NULL,
	[LinkMap] [ntext] NOT NULL,
	[Website] [nvarchar](150) NULL,
 CONSTRAINT [PK_CuaHang] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FeedBack]    Script Date: 8/14/2018 3:05:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FeedBack](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Ten] [nvarchar](500) NULL,
	[SDT] [nchar](20) NULL,
	[Email] [nvarchar](200) NULL,
	[DiaChi] [nvarchar](500) NULL,
	[TieuDe] [nvarchar](500) NULL,
	[NoiDung] [ntext] NULL,
 CONSTRAINT [PK_FeedBack] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GioHang]    Script Date: 8/14/2018 3:05:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GioHang](
	[MaGioHang] [int] IDENTITY(1,1) NOT NULL,
	[maSanPham] [int] NOT NULL,
	[tenSanPham] [ntext] NOT NULL,
	[HinhAnh] [ntext] NOT NULL,
	[DonGia] [money] NOT NULL,
	[SoLuong] [int] NOT NULL,
	[ThanhTien] [money] NOT NULL,
	[TenDangNhap] [nchar](50) NOT NULL,
 CONSTRAINT [PK_GioHang] PRIMARY KEY CLUSTERED 
(
	[MaGioHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 8/14/2018 3:05:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDon](
	[MaHD] [int] IDENTITY(1,1) NOT NULL,
	[NgayTao] [datetime] NOT NULL,
	[TrangThai] [int] NOT NULL,
	[NguoiTao] [nvarchar](40) NOT NULL,
	[DiaChi] [ntext] NOT NULL,
	[SDT] [nchar](50) NOT NULL,
	[Email] [ntext] NULL,
	[GhiChu] [ntext] NULL,
	[DaXoa] [bit] NOT NULL,
	[TenDangNhap] [nchar](50) NULL,
	[PhuongThucThanhToan] [int] NULL,
	[TongTien] [money] NULL,
 CONSTRAINT [PK_HoaDon] PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiHang]    Script Date: 8/14/2018 3:05:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiHang](
	[MaLoai] [bigint] IDENTITY(1,1) NOT NULL,
	[TenLoai] [nvarchar](400) NULL,
	[MoTa] [ntext] NOT NULL,
	[HinhAnh] [nvarchar](400) NOT NULL,
	[NoiBat] [bit] NOT NULL,
	[TieuDeMeta] [nvarchar](400) NULL,
	[IDMenuCha] [nvarchar](400) NULL,
	[TieuDeSeo] [nvarchar](400) NULL,
	[NgayTao] [datetime] NULL,
	[NguoiTao] [nvarchar](400) NULL,
	[TrangThai] [bit] NULL,
	[HienThiTrenTrangChu] [bit] NULL,
	[MetaKeyWord] [nvarchar](400) NULL,
	[MeTaDescription] [nvarchar](400) NULL,
 CONSTRAINT [PK_LoaiHang] PRIMARY KEY CLUSTERED 
(
	[MaLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiMenu]    Script Date: 8/14/2018 3:05:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiMenu](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TenLoai] [nchar](200) NULL,
 CONSTRAINT [PK_LoaiMenu] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiSlide]    Script Date: 8/14/2018 3:05:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiSlide](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Ten] [nvarchar](500) NULL,
 CONSTRAINT [PK_LoaiSlide] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiTinTuc]    Script Date: 8/14/2018 3:05:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiTinTuc](
	[MoTa] [ntext] NOT NULL,
	[HinhAnh] [nvarchar](400) NOT NULL,
	[NoiBat] [bit] NOT NULL,
	[TieuDeMeta] [nvarchar](400) NULL,
	[IDMenuCha] [nvarchar](400) NULL,
	[TieuDeSeo] [nvarchar](400) NULL,
	[NgayTao] [datetime] NULL,
	[NguoiTao] [nvarchar](400) NULL,
	[TrangThai] [bit] NULL,
	[HienThiTrenTrangChu] [bit] NULL,
	[MetaKeyWord] [nvarchar](400) NULL,
	[MeTaDescription] [nvarchar](400) NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_LoaiTinTuc] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Log]    Script Date: 8/14/2018 3:05:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Log](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TieuDe] [nvarchar](500) NULL,
	[NoiDung] [ntext] NULL,
 CONSTRAINT [PK_Log] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 8/14/2018 3:05:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[ID] [int] NOT NULL,
	[Text] [nvarchar](500) NULL,
	[Link] [nvarchar](4000) NULL,
	[ThuTu] [int] NULL,
	[Target] [nvarchar](4000) NULL,
	[Status] [bit] NULL,
	[LoaiMenu] [int] NULL,
 CONSTRAINT [PK_Menu] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NguoiDung]    Script Date: 8/14/2018 3:05:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NguoiDung](
	[TenDangNhap] [nchar](50) NOT NULL,
	[MatKhau] [nvarchar](500) NOT NULL,
	[TenThat] [nvarchar](100) NOT NULL,
	[GioiTinh] [bit] NOT NULL,
	[DiaChi] [nvarchar](200) NOT NULL,
	[Email] [nchar](100) NOT NULL,
	[SoDienThoai] [nchar](30) NOT NULL,
	[NgaySinh] [datetime] NOT NULL,
	[DaXoa] [bit] NOT NULL,
	[TrangThai] [bit] NOT NULL,
	[NgayTao] [datetime] NULL,
	[PhanQuyen] [int] NOT NULL,
	[SaltString] [nvarchar](200) NULL,
 CONSTRAINT [PK_NguoiDung] PRIMARY KEY CLUSTERED 
(
	[TenDangNhap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhienDangNhap]    Script Date: 8/14/2018 3:05:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhienDangNhap](
	[Token] [nvarchar](550) NOT NULL,
	[TenDangNhap] [nchar](50) NOT NULL,
	[ThoiGian] [datetime] NOT NULL,
	[DiaChiIP] [nvarchar](150) NOT NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_PhienDangNhap] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 8/14/2018 3:05:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[MaSP] [bigint] IDENTITY(1,1) NOT NULL,
	[MaLoai] [bigint] NOT NULL,
	[TenSP] [ntext] NOT NULL,
	[Mota] [ntext] NULL,
	[Gia] [money] NULL,
	[GiaGiam] [money] NULL,
	[HinhAnh] [ntext] NULL,
	[HinhAnhThem] [xml] NULL,
	[TrangThai] [bit] NULL,
	[TonKho] [int] NULL,
	[BanChay] [bit] NULL,
	[Moi] [bit] NULL,
	[Hot] [bit] NULL,
	[KhuyenMai] [bit] NULL,
	[ChiTietSanPham] [ntext] NULL,
	[BaoHanh] [int] NULL,
	[TopHot] [datetime] NULL,
	[DaCoVAT] [bit] NULL,
	[TieuDeMeta] [nvarchar](400) NULL,
	[IDMenuCha] [nvarchar](400) NULL,
	[TieuDeSeo] [nvarchar](400) NULL,
	[NgayTao] [datetime] NULL,
	[NguoiTao] [nvarchar](400) NULL,
	[HienThiTrenTrangChu] [bit] NULL,
	[MetaKeyWord] [nvarchar](400) NULL,
	[MeTaDescription] [nvarchar](400) NULL,
	[SoLuotXem] [int] NULL,
 CONSTRAINT [PK_SanPham] PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Slider]    Script Date: 8/14/2018 3:05:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Slider](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[HinhAnh] [nvarchar](500) NULL,
	[ThuTu] [int] NULL,
	[Link] [nvarchar](4000) NULL,
	[MoTa] [nvarchar](4000) NULL,
	[NgayTao] [datetime] NULL,
	[NguoiTao] [nchar](50) NULL,
 CONSTRAINT [PK_Slider] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TagContent]    Script Date: 8/14/2018 3:05:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TagContent](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MaTinTuc] [int] NOT NULL,
 CONSTRAINT [PK_TagContent] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[MaTinTuc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tags]    Script Date: 8/14/2018 3:05:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tags](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](250) NULL,
 CONSTRAINT [PK_Tags] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaiKhanMXH]    Script Date: 8/14/2018 3:05:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiKhanMXH](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Ten] [nvarchar](500) NULL,
	[NoiDung] [nvarchar](500) NULL,
	[IconLink] [nvarchar](500) NULL,
 CONSTRAINT [PK_TaiKhanMXH] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaiKhoanNganHang]    Script Date: 8/14/2018 3:05:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiKhoanNganHang](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NganHang] [nvarchar](200) NOT NULL,
	[ChuTaiKhoan] [nvarchar](200) NOT NULL,
	[SoTaiKhoan] [nchar](100) NOT NULL,
	[ChiNhanh] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_TaiKhoanNganHang] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TinTuc]    Script Date: 8/14/2018 3:05:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TinTuc](
	[ID] [bigint] NOT NULL,
	[MaLoaiTinTuC] [bigint] NOT NULL,
	[TieuDe] [ntext] NOT NULL,
	[Mota] [ntext] NULL,
	[HinhAnh] [ntext] NULL,
	[TrangThai] [bit] NULL,
	[Hot] [bit] NULL,
	[KhuyenMai] [bit] NULL,
	[NoiDung] [ntext] NULL,
	[TopHot] [datetime] NULL,
	[TieuDeMeta] [nvarchar](400) NULL,
	[IDMenuCha] [nvarchar](400) NULL,
	[TieuDeSeo] [nvarchar](400) NULL,
	[NgayTao] [datetime] NULL,
	[NguoiTao] [nvarchar](400) NULL,
	[HienThiTrenTrangChu] [bit] NULL,
	[MetaKeyWord] [nvarchar](400) NULL,
	[MeTaDescription] [nvarchar](400) NULL,
	[SoLuotXem] [int] NULL,
	[Tags] [nvarchar](500) NULL,
 CONSTRAINT [PK_TinTuc] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ChiTietHoaDon] ON 

INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [TenSanPham], [SoLuong], [GiaThanh], [ThanhTien], [DaXoa]) VALUES (1, 1, N'Mật ong nguyên chất 2', 9, 110000.0000, 990000.0000, 0)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [TenSanPham], [SoLuong], [GiaThanh], [ThanhTien], [DaXoa]) VALUES (2, 1, N'Mật ong nguyên chất 5', 2, 110000.0000, 220000.0000, 0)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [TenSanPham], [SoLuong], [GiaThanh], [ThanhTien], [DaXoa]) VALUES (3, 1, N'Mật ong nguyên chất 5', 1, 110000.0000, 110000.0000, 0)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [TenSanPham], [SoLuong], [GiaThanh], [ThanhTien], [DaXoa]) VALUES (4, 2, N'Mật ong nguyên chất 4', 20, 110000.0000, 2200000.0000, 0)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [TenSanPham], [SoLuong], [GiaThanh], [ThanhTien], [DaXoa]) VALUES (5, 2, N'Mật ong nguyên chất 6', 30, 110000.0000, 3300000.0000, 0)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [TenSanPham], [SoLuong], [GiaThanh], [ThanhTien], [DaXoa]) VALUES (6, 3, N'Mật ong nguyên chất 5', 1, 110000.0000, 110000.0000, 0)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [TenSanPham], [SoLuong], [GiaThanh], [ThanhTien], [DaXoa]) VALUES (7, 4, N'Mật ong nguyên chất 5', 20, 110000.0000, 2200000.0000, 0)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [TenSanPham], [SoLuong], [GiaThanh], [ThanhTien], [DaXoa]) VALUES (8, 5, N'Mật ong nguyên chất 2', 1, 110000.0000, 110000.0000, 0)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [TenSanPham], [SoLuong], [GiaThanh], [ThanhTien], [DaXoa]) VALUES (9, 6, N'Mật ong nguyên chất 5', 1, 110000.0000, 110000.0000, 0)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [TenSanPham], [SoLuong], [GiaThanh], [ThanhTien], [DaXoa]) VALUES (10, 7, N'Mật ong nguyên chất 4', 1, 110000.0000, 110000.0000, 0)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [TenSanPham], [SoLuong], [GiaThanh], [ThanhTien], [DaXoa]) VALUES (11, 8, N'Mật ong nguyên chất 6', 1, 110000.0000, 110000.0000, 0)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [TenSanPham], [SoLuong], [GiaThanh], [ThanhTien], [DaXoa]) VALUES (12, 9, N'Mật ong nguyên chất 3', 1, 110000.0000, 110000.0000, 0)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [TenSanPham], [SoLuong], [GiaThanh], [ThanhTien], [DaXoa]) VALUES (13, 10, N'Mật ong nguyên chất 3', 1, 110000.0000, 110000.0000, 0)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [TenSanPham], [SoLuong], [GiaThanh], [ThanhTien], [DaXoa]) VALUES (14, 11, N'Mật ong nguyên chất 5', 1, 110000.0000, 110000.0000, 0)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [TenSanPham], [SoLuong], [GiaThanh], [ThanhTien], [DaXoa]) VALUES (15, 12, N'Mật ong nguyên chất 1', 1, 110000.0000, 110000.0000, 0)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [TenSanPham], [SoLuong], [GiaThanh], [ThanhTien], [DaXoa]) VALUES (16, 13, N'Mật ong nguyên chất 4', 1, 110000.0000, 110000.0000, 0)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [TenSanPham], [SoLuong], [GiaThanh], [ThanhTien], [DaXoa]) VALUES (17, 14, N'Mật ong nguyên chất 3', 22, 110000.0000, 2420000.0000, 0)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [TenSanPham], [SoLuong], [GiaThanh], [ThanhTien], [DaXoa]) VALUES (18, 15, N'Mật ong nguyên chất 4', 2, 110000.0000, 220000.0000, 0)
INSERT [dbo].[ChiTietHoaDon] ([MaCTHD], [MaHD], [TenSanPham], [SoLuong], [GiaThanh], [ThanhTien], [DaXoa]) VALUES (19, 16, N'Mật ong nguyên chất 9', 47, 110000.0000, 5170000.0000, 0)
SET IDENTITY_INSERT [dbo].[ChiTietHoaDon] OFF
SET IDENTITY_INSERT [dbo].[CuaHang] ON 

INSERT [dbo].[CuaHang] ([ID], [TenCuaHang], [SDT], [DiaChi], [MoTa], [Logo], [HotLine], [Fax], [Email], [LinkMap], [Website]) VALUES (1, N'Công ty TNHH Tâm Phát', N'0166.835.1266', N'Tổ 24, Đinh Tiên Hoàng, Thị Trấn Liên Nghĩa, Huyện Đức Trọng, Tỉnh Lâm Đồng, Liên Nghĩa, Đức Trọng, Lâm Đồng', N'
<div class="about-block">
        <h1 class=" title  panel-heading">Về chúng tôi</h1><div class="content panel-body">
            <div>
	Công ty trách nhiệm hữu hạn - Tâm Phát là một doanh nghiệp tư vấn đầu tư và xây dựng, hoạt động và phát triển lĩnh vực ngành ong trong vi cả nước, hợp tác kinh doanh hiệu quả với nhiều Công ty và tập đoàn kinh tế lớn trên thế giới.</div>
<div>
	&nbsp;</div>
<div>
	Với triết lý "Uy tín là sức mạnh", chúng tôi luôn hướng tới mục tiêu phát triển bền vững cho chính Công ty và cho khách hàng của mình.</div>
<div>
	&nbsp;</div>
<div>
	Từ ngày thành lập 16 tháng 4 năm 2001 đến nay, trải qua nhiều năm xây dựng và trưởng thành, tập thể lãnh đạo, cán bộ công nhân viên Công ty đã nỗ lực không ngừng xây dựng và phát triển. Tâm Phát đã được Đảng và Nhà nước ghi nhận thành tích và tặng thưởng nhiều danh hiệu cao quý, góp phần tạo dựng thương hiệu Tâm Phát là một trong những Công ty hàng đầu Việt Nam.</div>
<div>
	&nbsp;</div>
<div>
	Tâm Phát cũng được các Chủ đầu tư và khách hàng đánh giá là một thương hiệu Tư vấn Xây dựng phát triển ngành ong lớn có uy tín, tin cậy, có thể độc lập đảm đương thực hiện công tác tư vấn cho các dự án quy mô lớn, phức tạp về công nghệ, kỹ thuật.</div>
<div>
	&nbsp;</div>
<div>
	Hiện nay, với mô hình hoạt động mới là một Công ty đại chúng, sau khi thực hiện thành công và hiệu quả mô hình Nhượng quyền thương mại cho các Công ty thành viên, cùng với sự quan tâm, giúp đỡ và chỉ đạo kịp thời của Lãnh đạo các cấp, các ngành, sự tin cậy của Quý khách hàng, thương hiệu Tâm Phát ngày càng phát triển và lớn mạnh.</div>
<div>
	&nbsp;</div>
<div>
	Bằng việc kiên trì thực hiện Hệ thống quản lý chất lượng phù hợp với tiêu chuẩn Quốc tế ISO 9001: 2008, Tâm Phát đảm bảo cung cấp các dịch vụ và sản phẩm tốt nhất để làm hài lòng Quý vị khách hàng, hy vọng mang lại được nhiều lợi ích cho cộng đồng góp phần vào sự nghiệp xây dựng phát triển đất nước.</div>

        </div>
        <div class="social-group">
        </div>
    </div>
', N'/Content/Images/01668351266.png', N'01668351266', N'không', N'herodotkich@gmail.com', N'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d62498.362774007444!2d108.27749296313239!3d11.754645497585383!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x317146c557969e15%3A0x2dd4661649274aa3!2zRG9hbmggTmdoaeG7h3AgVMawIE5ow6JuIE3huq10IE9uZyBDYW8gTmd1ecOqbiBUw6JtIFBow6F0!5e0!3m2!1svi!2s!4v1532334858424', N'http://localhost:4327/')
SET IDENTITY_INSERT [dbo].[CuaHang] OFF
SET IDENTITY_INSERT [dbo].[HoaDon] ON 

INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TrangThai], [NguoiTao], [DiaChi], [SDT], [Email], [GhiChu], [DaXoa], [TenDangNhap], [PhuongThucThanhToan], [TongTien]) VALUES (1, CAST(N'2018-08-10T23:43:14.870' AS DateTime), 1, N'Vương', N'Đà Lạt', N'01675528766                                       ', N'Mail@gmail.com', N'', 0, N'admin                                             ', 0, 1320000.0000)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TrangThai], [NguoiTao], [DiaChi], [SDT], [Email], [GhiChu], [DaXoa], [TenDangNhap], [PhuongThucThanhToan], [TongTien]) VALUES (2, CAST(N'2018-08-11T00:18:29.733' AS DateTime), 1, N'Nguyễn Văn Vương', N'Nguyễn Công Trứ- P8- Đà Lạt', N'01675528766                                       ', N'nguyenvanvuong975@gmail.com', N'Vui lòng gửi trước ngày 28/12 , tôi phải đi Hà Nội sau ngày này', 0, N'hoalaxanh123                                      ', 0, 5500000.0000)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TrangThai], [NguoiTao], [DiaChi], [SDT], [Email], [GhiChu], [DaXoa], [TenDangNhap], [PhuongThucThanhToan], [TongTien]) VALUES (3, CAST(N'2018-08-11T00:21:26.960' AS DateTime), 1, N'Vương', N'Nguyễn Công Trứ- P8- Đà Lạt', N'01675528766                                       ', N'nguyenvanvuong975@gmail.com', N'', 0, N'hoalaxanh123                                      ', 0, 110000.0000)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TrangThai], [NguoiTao], [DiaChi], [SDT], [Email], [GhiChu], [DaXoa], [TenDangNhap], [PhuongThucThanhToan], [TongTien]) VALUES (4, CAST(N'2018-08-11T00:23:58.983' AS DateTime), 1, N'Nguyễn Vương', N'Nguyễn Công Trứ- P8- Đà Lạt', N'01675528766                                       ', N'nguyenvanvuong975@gmail.com', N'Vui lòng gửi trước 22/12', 0, N'hoalaxanh123                                      ', 0, 2200000.0000)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TrangThai], [NguoiTao], [DiaChi], [SDT], [Email], [GhiChu], [DaXoa], [TenDangNhap], [PhuongThucThanhToan], [TongTien]) VALUES (5, CAST(N'2018-08-11T00:58:47.580' AS DateTime), 1, N'Vương', N'Đà Lạt', N'01675528766                                       ', N'Mail@gmail.com', N'', 0, N'admin                                             ', 0, 110000.0000)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TrangThai], [NguoiTao], [DiaChi], [SDT], [Email], [GhiChu], [DaXoa], [TenDangNhap], [PhuongThucThanhToan], [TongTien]) VALUES (6, CAST(N'2018-08-11T01:01:26.110' AS DateTime), 1, N'Vương', N'Đà Lạt', N'01675528766                                       ', N'Mail@gmail.com', N'', 0, N'admin                                             ', 0, 110000.0000)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TrangThai], [NguoiTao], [DiaChi], [SDT], [Email], [GhiChu], [DaXoa], [TenDangNhap], [PhuongThucThanhToan], [TongTien]) VALUES (7, CAST(N'2018-08-11T01:02:44.047' AS DateTime), 0, N'Vương', N'Đà Lạt', N'01675528766                                       ', N'Mail@gmail.com', N'', 0, N'admin                                             ', 0, 110000.0000)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TrangThai], [NguoiTao], [DiaChi], [SDT], [Email], [GhiChu], [DaXoa], [TenDangNhap], [PhuongThucThanhToan], [TongTien]) VALUES (8, CAST(N'2018-08-11T01:05:21.727' AS DateTime), 0, N'Vương', N'Đà Lạt', N'01675528766                                       ', N'Mail@gmail.com', N'', 0, N'admin                                             ', 0, 110000.0000)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TrangThai], [NguoiTao], [DiaChi], [SDT], [Email], [GhiChu], [DaXoa], [TenDangNhap], [PhuongThucThanhToan], [TongTien]) VALUES (9, CAST(N'2018-08-11T01:06:39.097' AS DateTime), 0, N'Vương', N'Đà Lạt', N'01675528766                                       ', N'Mail@gmail.com', N'', 0, N'admin                                             ', 0, 110000.0000)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TrangThai], [NguoiTao], [DiaChi], [SDT], [Email], [GhiChu], [DaXoa], [TenDangNhap], [PhuongThucThanhToan], [TongTien]) VALUES (10, CAST(N'2018-08-11T01:07:59.057' AS DateTime), 0, N'Vương', N'Đà Lạt', N'01675528766                                       ', N'Mail@gmail.com', N'', 0, N'admin                                             ', 0, 110000.0000)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TrangThai], [NguoiTao], [DiaChi], [SDT], [Email], [GhiChu], [DaXoa], [TenDangNhap], [PhuongThucThanhToan], [TongTien]) VALUES (11, CAST(N'2018-08-11T01:08:57.497' AS DateTime), 0, N'Vương', N'Đà Lạt', N'01675528766                                       ', N'Mail@gmail.com', N'', 0, N'admin                                             ', 0, 110000.0000)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TrangThai], [NguoiTao], [DiaChi], [SDT], [Email], [GhiChu], [DaXoa], [TenDangNhap], [PhuongThucThanhToan], [TongTien]) VALUES (12, CAST(N'2018-08-11T01:09:47.817' AS DateTime), 0, N'Vương', N'Đà Lạt', N'01675528766                                       ', N'Mail@gmail.com', N'', 0, N'admin                                             ', 0, 110000.0000)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TrangThai], [NguoiTao], [DiaChi], [SDT], [Email], [GhiChu], [DaXoa], [TenDangNhap], [PhuongThucThanhToan], [TongTien]) VALUES (13, CAST(N'2018-08-11T01:11:15.080' AS DateTime), 0, N'Vương', N'Đà Lạt', N'01675528766                                       ', N'Mail@gmail.com', N'', 0, N'admin                                             ', 0, 110000.0000)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TrangThai], [NguoiTao], [DiaChi], [SDT], [Email], [GhiChu], [DaXoa], [TenDangNhap], [PhuongThucThanhToan], [TongTien]) VALUES (14, CAST(N'2018-08-11T02:08:17.680' AS DateTime), 0, N'Vương', N'Đà Lạt', N'01675528766                                       ', N'nguyenvanvuong972@gmail.com', N'Vui lòng gửi trước thứ 6/13', 0, N'admin                                             ', 1, 2420000.0000)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TrangThai], [NguoiTao], [DiaChi], [SDT], [Email], [GhiChu], [DaXoa], [TenDangNhap], [PhuongThucThanhToan], [TongTien]) VALUES (15, CAST(N'2018-08-13T23:37:17.467' AS DateTime), 1, N'Nguyễn Vương', N'Đà Lạt', N'01675528766                                       ', N'nguyenvanvuong972@gmail.com', N'', 0, N'admin                                             ', 1, 220000.0000)
INSERT [dbo].[HoaDon] ([MaHD], [NgayTao], [TrangThai], [NguoiTao], [DiaChi], [SDT], [Email], [GhiChu], [DaXoa], [TenDangNhap], [PhuongThucThanhToan], [TongTien]) VALUES (16, CAST(N'2018-08-14T02:15:06.243' AS DateTime), 1, N'Vương', N'Nguyễn Công Trứ- P8- Đà Lạt', N'01675528766                                       ', N'nguyenvanvuong975@gmail.com', N'', 0, N'hoalaxanh123                                      ', 1, 5170000.0000)
SET IDENTITY_INSERT [dbo].[HoaDon] OFF
SET IDENTITY_INSERT [dbo].[LoaiHang] ON 

INSERT [dbo].[LoaiHang] ([MaLoai], [TenLoai], [MoTa], [HinhAnh], [NoiBat], [TieuDeMeta], [IDMenuCha], [TieuDeSeo], [NgayTao], [NguoiTao], [TrangThai], [HienThiTrenTrangChu], [MetaKeyWord], [MeTaDescription]) VALUES (2, N'Mật ong', N'Mật ong thơm ngon nguyên chất chính hãng chất lượng cao', N'aaa', 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[LoaiHang] ([MaLoai], [TenLoai], [MoTa], [HinhAnh], [NoiBat], [TieuDeMeta], [IDMenuCha], [TieuDeSeo], [NgayTao], [NguoiTao], [TrangThai], [HienThiTrenTrangChu], [MetaKeyWord], [MeTaDescription]) VALUES (5, N'Phấn hoa', N'Phấn hoa thơm ngon nguyên chất chính hãng chất lượng cao', N'aaa', 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[LoaiHang] ([MaLoai], [TenLoai], [MoTa], [HinhAnh], [NoiBat], [TieuDeMeta], [IDMenuCha], [TieuDeSeo], [NgayTao], [NguoiTao], [TrangThai], [HienThiTrenTrangChu], [MetaKeyWord], [MeTaDescription]) VALUES (6, N'Sữa ong chúa', N'Sữa ong chúa thơm ngon nguyên chất chính hãng chất lượng cao', N'aaa', 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[LoaiHang] ([MaLoai], [TenLoai], [MoTa], [HinhAnh], [NoiBat], [TieuDeMeta], [IDMenuCha], [TieuDeSeo], [NgayTao], [NguoiTao], [TrangThai], [HienThiTrenTrangChu], [MetaKeyWord], [MeTaDescription]) VALUES (7, N'Nghệ đen', N'Nghệ đen thơm ngon nguyên chất chính hãng chất lượng cao', N'aaa', 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[LoaiHang] ([MaLoai], [TenLoai], [MoTa], [HinhAnh], [NoiBat], [TieuDeMeta], [IDMenuCha], [TieuDeSeo], [NgayTao], [NguoiTao], [TrangThai], [HienThiTrenTrangChu], [MetaKeyWord], [MeTaDescription]) VALUES (8, N'Dụng cụ làm ong', N'Tổng hợp các dụng cụ cho  người làm ong', N'aaa', 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[LoaiHang] ([MaLoai], [TenLoai], [MoTa], [HinhAnh], [NoiBat], [TieuDeMeta], [IDMenuCha], [TieuDeSeo], [NgayTao], [NguoiTao], [TrangThai], [HienThiTrenTrangChu], [MetaKeyWord], [MeTaDescription]) VALUES (9, N'Các sản phẩm ngành ong', N'Các sản phẩm khác thuộc ngành ong', N'aaa', 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[LoaiHang] OFF
INSERT [dbo].[NguoiDung] ([TenDangNhap], [MatKhau], [TenThat], [GioiTinh], [DiaChi], [Email], [SoDienThoai], [NgaySinh], [DaXoa], [TrangThai], [NgayTao], [PhanQuyen], [SaltString]) VALUES (N'abcdef000000                                      ', N'yRhjYWtmMvyMirYcYaE5Wg==', N'abcdef000000', 1, N'abcdef000000', N'abcdef000000@gmail.com                                                                              ', N'1234567890                    ', CAST(N'2018-01-01T00:00:00.000' AS DateTime), 0, 1, NULL, 1, NULL)
INSERT [dbo].[NguoiDung] ([TenDangNhap], [MatKhau], [TenThat], [GioiTinh], [DiaChi], [Email], [SoDienThoai], [NgaySinh], [DaXoa], [TrangThai], [NgayTao], [PhanQuyen], [SaltString]) VALUES (N'abcdèg                                            ', N'3HhxGocas55cs8Bct+/O3Q==', N'abc', 1, N'abc', N'abc@gmail.com                                                                                       ', N'1234567890                    ', CAST(N'2018-08-11T00:00:00.000' AS DateTime), 0, 1, NULL, 1, NULL)
INSERT [dbo].[NguoiDung] ([TenDangNhap], [MatKhau], [TenThat], [GioiTinh], [DiaChi], [Email], [SoDienThoai], [NgaySinh], [DaXoa], [TrangThai], [NgayTao], [PhanQuyen], [SaltString]) VALUES (N'admin                                             ', N'$2a$12$Dw/MWah5jBDD8o4tOLpoZeW1.UNPgC1x2YM0gZqakLOLWzHcevE/O', N'Nguyễn Vương', 1, N'Đà Lạt', N'nguyenvanvuong972@gmail.com                                                                         ', N'01675528766                   ', CAST(N'1997-12-12T00:00:00.000' AS DateTime), 0, 1, NULL, 0, N'$2a$12$P0rzgVBgvOp268iycRb6ye')
INSERT [dbo].[NguoiDung] ([TenDangNhap], [MatKhau], [TenThat], [GioiTinh], [DiaChi], [Email], [SoDienThoai], [NgaySinh], [DaXoa], [TrangThai], [NgayTao], [PhanQuyen], [SaltString]) VALUES (N'hoalaxanh123                                      ', N'$2a$12$Dw5o6OTFTD55sSsPUvZyNul.SCNSM/AcnLJkZ/Y.1y1kTGUEUdPam', N'Vương', 1, N'Nguyễn Công Trứ- P8- Đà Lạt', N'nguyenvanvuong975@gmail.com                                                                         ', N'01675528766                   ', CAST(N'2012-12-12T00:00:00.000' AS DateTime), 0, 1, NULL, 0, N'$2a$12$Dw5o6OTFTD55sSsPUvZyNu')
INSERT [dbo].[NguoiDung] ([TenDangNhap], [MatKhau], [TenThat], [GioiTinh], [DiaChi], [Email], [SoDienThoai], [NgaySinh], [DaXoa], [TrangThai], [NgayTao], [PhanQuyen], [SaltString]) VALUES (N'hoalaxanh1234                                     ', N'$2a$12$zimCSCIbf8g.xcz2.Ekisu/IkI3Osn/cXyvD1o9fcfYh/tQGVWWlW', N'Nguyễn Vương', 1, N'Lâm Hà', N'mail@gmail.com                                                                                      ', N'01675528766                   ', CAST(N'2012-12-12T00:00:00.000' AS DateTime), 0, 1, NULL, 1, N'$2a$12$zimCSCIbf8g.xcz2.Ekisu4')
SET IDENTITY_INSERT [dbo].[PhienDangNhap] ON 

INSERT [dbo].[PhienDangNhap] ([Token], [TenDangNhap], [ThoiGian], [DiaChiIP], [ID]) VALUES (N'$2a$12$IoZKcwQeBdZ7LqV7gCDciedZRfz28VaRRZEnkx9DP2EMW3l8Lh1Bu', N'hoalaxanh123                                      ', CAST(N'2018-08-11T00:17:48.110' AS DateTime), N'fe80::50f8:bfaa:27d2:28a5%21', 4)
INSERT [dbo].[PhienDangNhap] ([Token], [TenDangNhap], [ThoiGian], [DiaChiIP], [ID]) VALUES (N'xrGCD2U=1021ayvgZh7o704pEov/gpfXg==3021FZRWXVlHico=4043', N'abcdèg                                            ', CAST(N'2018-08-10T21:38:47.903' AS DateTime), N'fe80::c09:2016:39da:8be2%5', 26)
INSERT [dbo].[PhienDangNhap] ([Token], [TenDangNhap], [ThoiGian], [DiaChiIP], [ID]) VALUES (N'PKMSRa8=1838Rmrjrf0l867DX+z0W8YJA==38389nM7O2u6ZLY=5677', N'abcdef000000                                      ', CAST(N'2018-08-10T22:03:12.550' AS DateTime), N'fe80::c09:2016:39da:8be2%5', 27)
INSERT [dbo].[PhienDangNhap] ([Token], [TenDangNhap], [ThoiGian], [DiaChiIP], [ID]) VALUES (N'$2a$12$fIJpQus.o52FLj.tT6wEGuB3xUZWbc9VZ5UTHrnmpq9YhyJQGz1Eu', N'admin                                             ', CAST(N'2018-08-13T23:54:55.220' AS DateTime), N'192.168.1.7', 29)
INSERT [dbo].[PhienDangNhap] ([Token], [TenDangNhap], [ThoiGian], [DiaChiIP], [ID]) VALUES (N'$2a$12$FOGcidrWgKDCl0lCsdxxIeN3NNBgtKU0N2YgO7VICFuOTG0Idc/uC', N'hoalaxanh123                                      ', CAST(N'2018-08-14T00:24:27.450' AS DateTime), N'192.168.1.7', 30)
INSERT [dbo].[PhienDangNhap] ([Token], [TenDangNhap], [ThoiGian], [DiaChiIP], [ID]) VALUES (N'$2a$12$vbSqfiokDyn8q/yC50l/5eyBj8NBBqlFe7LsZ7VoKBOI4CBVypngq', N'hoalaxanh123                                      ', CAST(N'2018-08-14T00:24:40.343' AS DateTime), N'192.168.1.7', 31)
INSERT [dbo].[PhienDangNhap] ([Token], [TenDangNhap], [ThoiGian], [DiaChiIP], [ID]) VALUES (N'$2a$12$Gs4ySOxEwcmU3hbrWlLId.lUSsAFpGXHx5TmT3D/UdATNs9lFIqkW', N'hoalaxanh123                                      ', CAST(N'2018-08-14T00:31:40.793' AS DateTime), N'192.168.1.7', 32)
INSERT [dbo].[PhienDangNhap] ([Token], [TenDangNhap], [ThoiGian], [DiaChiIP], [ID]) VALUES (N'$2a$12$lFH.NbejYDprtdS7vpX/Xu/avcQ8lJK87hlntAqrGItOdR2eXeAs.', N'hoalaxanh123                                      ', CAST(N'2018-08-14T00:32:21.533' AS DateTime), N'192.168.1.7', 33)
INSERT [dbo].[PhienDangNhap] ([Token], [TenDangNhap], [ThoiGian], [DiaChiIP], [ID]) VALUES (N'$2a$12$W3zY.hllp8PWVuiwHUu/DOKEIc6srRnf1uhaToEIImtwOtzXS36DG', N'hoalaxanh123                                      ', CAST(N'2018-08-14T00:36:02.547' AS DateTime), N'192.168.1.7', 34)
INSERT [dbo].[PhienDangNhap] ([Token], [TenDangNhap], [ThoiGian], [DiaChiIP], [ID]) VALUES (N'$2a$12$dKQjqQ2JXhObAB2.GcRRoeKr/BWxIltIvvXyI3SGlSqTZekwZz7x.', N'hoalaxanh123                                      ', CAST(N'2018-08-14T00:50:04.320' AS DateTime), N'192.168.1.7', 35)
INSERT [dbo].[PhienDangNhap] ([Token], [TenDangNhap], [ThoiGian], [DiaChiIP], [ID]) VALUES (N'$2a$12$4FyTwJU7saN158wp2og0QuVi5ch3Bc1Jw4V6zYn5NNk/xkr71uj52', N'hoalaxanh123                                      ', CAST(N'2018-08-14T00:51:20.223' AS DateTime), N'192.168.1.7', 36)
INSERT [dbo].[PhienDangNhap] ([Token], [TenDangNhap], [ThoiGian], [DiaChiIP], [ID]) VALUES (N'$2a$12$PNqbRf5usJ2Lin4VGz551ei.5vDPSPq8MwCQUHGeC4EXp/Jr2Tynm', N'hoalaxanh1234                                     ', CAST(N'2018-08-14T01:01:05.840' AS DateTime), N'192.168.1.7', 37)
INSERT [dbo].[PhienDangNhap] ([Token], [TenDangNhap], [ThoiGian], [DiaChiIP], [ID]) VALUES (N'$2a$12$htGkfEHQixQND2r/GQR3u.jIapVrWgjXe.SJ9w9lT4iCxxhdqYHsm', N'hoalaxanh123                                      ', CAST(N'2018-08-14T01:57:01.063' AS DateTime), N'192.168.1.7', 38)
INSERT [dbo].[PhienDangNhap] ([Token], [TenDangNhap], [ThoiGian], [DiaChiIP], [ID]) VALUES (N'$2a$12$kvqb6I.MMCvJgYs7m7wmSu5X.fJWrEhjEeNUlir2Ettd3VO7vmQZ6', N'hoalaxanh123                                      ', CAST(N'2018-08-14T02:02:07.023' AS DateTime), N'192.168.1.7', 39)
INSERT [dbo].[PhienDangNhap] ([Token], [TenDangNhap], [ThoiGian], [DiaChiIP], [ID]) VALUES (N'$2a$12$An75ughXRrafO/6FB1dSh..NHovcV1Oxx7ruvUFNj.cI4UCKUrw9u', N'hoalaxanh123                                      ', CAST(N'2018-08-14T02:08:29.203' AS DateTime), N'192.168.1.7', 40)
INSERT [dbo].[PhienDangNhap] ([Token], [TenDangNhap], [ThoiGian], [DiaChiIP], [ID]) VALUES (N'$2a$12$TaRj8zO1T8UyOC/V4Uw6S.gHB6nxlq6JX6qtlSfgaPxh3fz7Vc35.', N'hoalaxanh123                                      ', CAST(N'2018-08-14T02:13:38.503' AS DateTime), N'192.168.1.7', 41)
SET IDENTITY_INSERT [dbo].[PhienDangNhap] OFF
SET IDENTITY_INSERT [dbo].[SanPham] ON 

INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [TenSP], [Mota], [Gia], [GiaGiam], [HinhAnh], [HinhAnhThem], [TrangThai], [TonKho], [BanChay], [Moi], [Hot], [KhuyenMai], [ChiTietSanPham], [BaoHanh], [TopHot], [DaCoVAT], [TieuDeMeta], [IDMenuCha], [TieuDeSeo], [NgayTao], [NguoiTao], [HienThiTrenTrangChu], [MetaKeyWord], [MeTaDescription], [SoLuotXem]) VALUES (1, 2, N'Mật ong nguyên chất 1', N'
Mật ong là một thứ nguyên liệu dễ kiếm và dễ sử dụng. Đồng thời, nó cũng có rất nhiều lợi ích đối với sức khỏe con người .
', 120000.0000, 110000.0000, N'/Content/Upload/SanPham/MatOng/1.jpg', NULL, 1, 100, 1, 1, 1, 1, N'

    <p>
       <b>Mật ong</b>
        là một thứ nguyên liệu dễ kiếm và dễ sử dụng. Đồng thời, nó cũng có rất
        nhiều lợi ích đối với sức khỏe con người. Dưới đây là những lợi của mật
        ong đối với sức khỏe và các phương pháp để có thể tận dụng được triệt
        để lợi ích của mật ong:
    </p><p><b>1. Làm đẹp da</b></p><div><img src="http://sohanews.sohacdn.com/2018/2/10/photo-1-15182342543041378086659.jpg"></div><p>
        Mật
        ong là một chất chống oxy hoá tuyệt vời, giúp thanh lọc cơ thể, loại bỏ
        nhiều chất độc khác nhau. Ngoài ra, do tính kháng khuẩn mạnh mẽ nên nó
        sẽ giúp cải thiện đáng kể tình trạng da, giúp da tươi sáng, căng tràn
        sức sống và luôn khỏe mạnh.
    </p><p><b>2. Hỗ trợ giảm cân</b></p><p>
        Nếu
        đang trong chế độ giảm cân, bạn nên loại bỏ tất cả các loại đồ ngọt có
        đường, trừ mật ong. Vì lượng đường có trong mật ong chứa thành phần khác
        với chất tạo ngọt thường.
    </p><p>
        Ít ai biết rằng khoảng 70% lượng đường
        của mật ong là đường tự nhiên, và chưa tới 5% còn lại là loại đường
        giống với đường chúng ta vẫn ăn hằng ngày.
    </p><img src="http://sohanews.sohacdn.com/2018/2/10/photo-1-1518234255097789679822.jpg" />
        <p>
            Do
            đó, mật ong vẫn giải quyết được các nhu cầu thèm ngọt hàng ngày nhưng
            vẫn đảm bảo được lượng calo hấp thụ chỉ bằng 64% so với các loại nước
            ngọt có gas. Đồng thời còn giúp tăng cường sự trao đổi chất, điều này
            rất cần thiết cho việc giảm cân.
        </p>
   <p><b>3. Giảm cholesterol</b></p><p>
        Mật
        ong không có cholesterol. Ngược lại thành phần cấu tạo và vitamin của
        mật ong góp phần làm  giảm mức cholesterol. Tiêu thụ mật ong hàng ngày
        rất có lợi cho việc tăng các hợp chất chống oxy hoá trong cơ thể và có
        thể chống lại lượng cholesterol dư thừa.
    </p><img src="http://sohanews.sohacdn.com/2018/2/10/photo-2-15182342550991575497251-15182348641831341350506.png" />
        <p>
            Vitamin
            C, E và Pinocembrin là 2 chất chống oxy hóa tự nhiên tuyệt vời có trong
            mật ong. Những chất này có tác dụng rất tốt trong việc ngăn chặn và
            giảm nguy cơ mắc bệnh tim ở người.
        </p>
    <p>
        Các nghiên cứu đã cho thấy rằng
        các chất chống oxy hoá có trong mật ong có thể ngăn ngừa chứng hẹp động
        mạch gây suy tim, suy giảm trí nhớ, hoặc nhức đầu. Vì vậy, uống một ly
        nước với vài muỗng mật ong mỗi ngày sẽ là một biện pháp tốt để ngăn ngừa
        nguy cơ mắc các bệnh về tim mạch.
    </p><p><b>5. Cải thiện trí nhớ</b></p><p>
        Các
        nghiên cứu khác đã cho thấy khả năng chống lại stress của mật ong, khôi
        phục lại hệ thống phòng chống oxy hóa của tế bào, và kết quả là cải
        thiện trí nhớ . Ngoài ra, canxi chứa trong mật ong dễ dàng được não hấp
        thụ, đem lại lợi ích cho các quá trình hoạt động, chuyển hóa của não bộ.
    </p><p><b>6. Tăng chất lượng giấc ngủ</b></p><p>
        Đường
        chứa trong mật ong làm tăng lượng insulin trong máu, giúp giải phóng
        serotonin. Serotonin được chuyển hóa thành melatonin, một loại hooc-môn
        giúp thúc đẩy giấc ngủ ngon hơn.
    </p><img src="http://sohanews.sohacdn.com/2018/2/10/photo-4-15182342551031753229726.jpg" /><p>
        Mật
        ong là một chất khử trùng mạnh, do đó bạn nên ăn một thìa mật ong mỗi
        sáng khi dạ dày còn rỗng. Phương pháp đơn giản này sẽ giúp bạn ngăn ngừa
        được các bệnh khác nhau liên quan đến đường tiêu hóa. Bên cạnh đó, khi
        mật ong đi qua dạ dày, nó sẽ giúp tiêu diệt vi trùng và chữa lành các
        vết thương nhỏ trong niêm mạc.
    </p><p><b>8. Làm giảm căng thẳng, mệt mỏi, stress</b></p><p>
        Điều
        này nghe có vẻ kỳ quặc, nhưng thực tế đúng là vậy. Mật ong giúp làm dịu
        các dây thần kinh và giảm bớt mệt mỏi . Glucose chứa trong mật ong rất
        cần thiết cho hoạt động của các nơ-ron thần kinh. Nó được hấp thụ nhanh
        chóng vào trong máu, làm cho việc thư giãn và giảm các rối loạn tâm lý
        trở nên hiệu quả hơn.
    </p><p>
        Khi kết hợp với một loại thuốc tự nhiên khác
        có tính chất khử trùng và chữa bệnh mạnh mẽ như tỏi, sức mạnh của mật
        ong sẽ tăng lên gấp 10 lần. Hỗn hợp mật ong và tỏi sẽ giúp tăng cường hệ
        thống miễn dịch của cơ thể và giúp cơ thể luôn trong tình trạng khỏe
        mạnh.
    </p><p>Dưới đây là một số công thức kết hợp giữa mật ong và tỏi để có thể mang lại lợi ích tốt nhất.</p>
    <img src="http://sohanews.sohacdn.com/2018/2/10/photo-6-15182342551081594171965-15182348575251696427355.png" /><p>
        Tách
        các nhánh tỏi và loại bỏ lớp vỏ ngoài của chúng. Đặt chúng vào trong
        bình, rồi đổ mật ong lên. Bỏ bớt bong bóng nếu cần. Đậy nắp và đợi trong
        vài ngày. Uống 1 thìa hỗn hợp mỗi ngày khi dạ dày còn rỗng, bạn sẽ cảm
        thấy cơ thể tràn đầy sức sống và khỏe mạnh hơn bao giờ hết.
    </p>
    <div id="admzone480455"><div id="ads_zone480455"><div id="ads_zone480455_slot1"><div id="ads_zone480455_banner554187" class="banner0" style="display: none;"><div id="sspbid_3308"><iframe id="ads-place-3308" style="border: 0px none; margin: 0px; padding: 0px;" src="javascript:void(0)" width="0" height="0"></iframe></div></div></div> </div></div><p><b>Công thức 2:</b></p><p><b><i>Thành phần</i></b></p><p>- 4 nắm tay tỏi cắt nhỏ</p><p>- 1 củ hành tây cắt nhỏ</p><p>- 2 quả ớt đỏ cắt nhỏ</p><p>- 1 muỗng canh gừng xắt nhỏ</p><p>- 1 quả chanh</p><p>- 1 thìa cà phê dấm táo</p><p>- 1 bình 500ml.</p><p><b><i>Cách làm</i></b></p><p>
        Cho
        hành tây cắt nhỏ vào dưới cùng của bình. Sau đó thêm tỏi và ớt. Tiếp
        theo cho gừng xắt nhỏ và từ từ đổ nước chanh vào bình. Ở trên cùng, thêm
        một thìa cà phê dấm táo và đóng bình thật chặt. Để thừa một khoảng
        không gian để hỗn hợp có thể lên men. Cất giữ bình ở nơi tối, thoáng mát
        và sử dụng thường xuyên hoặc cho đến khi tất cả các triệu chứng của bạn
        đã biến mất.
    </p><p style="text-align: right;"><i>*Theo Life Advencer, Brightside</i></p>

', NULL, NULL, NULL, N'', N'-1', N'', CAST(N'2018-08-05T13:40:24.783' AS DateTime), N'', 1, N'', N'', NULL)
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [TenSP], [Mota], [Gia], [GiaGiam], [HinhAnh], [HinhAnhThem], [TrangThai], [TonKho], [BanChay], [Moi], [Hot], [KhuyenMai], [ChiTietSanPham], [BaoHanh], [TopHot], [DaCoVAT], [TieuDeMeta], [IDMenuCha], [TieuDeSeo], [NgayTao], [NguoiTao], [HienThiTrenTrangChu], [MetaKeyWord], [MeTaDescription], [SoLuotXem]) VALUES (2, 2, N'Mật ong nguyên chất 2', N'
Mật ong là một thứ nguyên liệu dễ kiếm và dễ sử dụng. Đồng thời, nó cũng có rất nhiều lợi ích đối với sức khỏe con người .
', 120000.0000, 110000.0000, N'/Content/Upload/SanPham/MatOng/2.jpg', NULL, 1, 100, 1, 1, 1, 1, N'

    <p>
       <b>Mật ong</b>
        là một thứ nguyên liệu dễ kiếm và dễ sử dụng. Đồng thời, nó cũng có rất
        nhiều lợi ích đối với sức khỏe con người. Dưới đây là những lợi của mật
        ong đối với sức khỏe và các phương pháp để có thể tận dụng được triệt
        để lợi ích của mật ong:
    </p><p><b>1. Làm đẹp da</b></p><div><img src="http://sohanews.sohacdn.com/2018/2/10/photo-1-15182342543041378086659.jpg"></div><p>
        Mật
        ong là một chất chống oxy hoá tuyệt vời, giúp thanh lọc cơ thể, loại bỏ
        nhiều chất độc khác nhau. Ngoài ra, do tính kháng khuẩn mạnh mẽ nên nó
        sẽ giúp cải thiện đáng kể tình trạng da, giúp da tươi sáng, căng tràn
        sức sống và luôn khỏe mạnh.
    </p><p><b>2. Hỗ trợ giảm cân</b></p><p>
        Nếu
        đang trong chế độ giảm cân, bạn nên loại bỏ tất cả các loại đồ ngọt có
        đường, trừ mật ong. Vì lượng đường có trong mật ong chứa thành phần khác
        với chất tạo ngọt thường.
    </p><p>
        Ít ai biết rằng khoảng 70% lượng đường
        của mật ong là đường tự nhiên, và chưa tới 5% còn lại là loại đường
        giống với đường chúng ta vẫn ăn hằng ngày.
    </p><img src="http://sohanews.sohacdn.com/2018/2/10/photo-1-1518234255097789679822.jpg" />
        <p>
            Do
            đó, mật ong vẫn giải quyết được các nhu cầu thèm ngọt hàng ngày nhưng
            vẫn đảm bảo được lượng calo hấp thụ chỉ bằng 64% so với các loại nước
            ngọt có gas. Đồng thời còn giúp tăng cường sự trao đổi chất, điều này
            rất cần thiết cho việc giảm cân.
        </p>
   <p><b>3. Giảm cholesterol</b></p><p>
        Mật
        ong không có cholesterol. Ngược lại thành phần cấu tạo và vitamin của
        mật ong góp phần làm  giảm mức cholesterol. Tiêu thụ mật ong hàng ngày
        rất có lợi cho việc tăng các hợp chất chống oxy hoá trong cơ thể và có
        thể chống lại lượng cholesterol dư thừa.
    </p><img src="http://sohanews.sohacdn.com/2018/2/10/photo-2-15182342550991575497251-15182348641831341350506.png" />
        <p>
            Vitamin
            C, E và Pinocembrin là 2 chất chống oxy hóa tự nhiên tuyệt vời có trong
            mật ong. Những chất này có tác dụng rất tốt trong việc ngăn chặn và
            giảm nguy cơ mắc bệnh tim ở người.
        </p>
    <p>
        Các nghiên cứu đã cho thấy rằng
        các chất chống oxy hoá có trong mật ong có thể ngăn ngừa chứng hẹp động
        mạch gây suy tim, suy giảm trí nhớ, hoặc nhức đầu. Vì vậy, uống một ly
        nước với vài muỗng mật ong mỗi ngày sẽ là một biện pháp tốt để ngăn ngừa
        nguy cơ mắc các bệnh về tim mạch.
    </p><p><b>5. Cải thiện trí nhớ</b></p><p>
        Các
        nghiên cứu khác đã cho thấy khả năng chống lại stress của mật ong, khôi
        phục lại hệ thống phòng chống oxy hóa của tế bào, và kết quả là cải
        thiện trí nhớ . Ngoài ra, canxi chứa trong mật ong dễ dàng được não hấp
        thụ, đem lại lợi ích cho các quá trình hoạt động, chuyển hóa của não bộ.
    </p><p><b>6. Tăng chất lượng giấc ngủ</b></p><p>
        Đường
        chứa trong mật ong làm tăng lượng insulin trong máu, giúp giải phóng
        serotonin. Serotonin được chuyển hóa thành melatonin, một loại hooc-môn
        giúp thúc đẩy giấc ngủ ngon hơn.
    </p><img src="http://sohanews.sohacdn.com/2018/2/10/photo-4-15182342551031753229726.jpg" /><p>
        Mật
        ong là một chất khử trùng mạnh, do đó bạn nên ăn một thìa mật ong mỗi
        sáng khi dạ dày còn rỗng. Phương pháp đơn giản này sẽ giúp bạn ngăn ngừa
        được các bệnh khác nhau liên quan đến đường tiêu hóa. Bên cạnh đó, khi
        mật ong đi qua dạ dày, nó sẽ giúp tiêu diệt vi trùng và chữa lành các
        vết thương nhỏ trong niêm mạc.
    </p><p><b>8. Làm giảm căng thẳng, mệt mỏi, stress</b></p><p>
        Điều
        này nghe có vẻ kỳ quặc, nhưng thực tế đúng là vậy. Mật ong giúp làm dịu
        các dây thần kinh và giảm bớt mệt mỏi . Glucose chứa trong mật ong rất
        cần thiết cho hoạt động của các nơ-ron thần kinh. Nó được hấp thụ nhanh
        chóng vào trong máu, làm cho việc thư giãn và giảm các rối loạn tâm lý
        trở nên hiệu quả hơn.
    </p><p>
        Khi kết hợp với một loại thuốc tự nhiên khác
        có tính chất khử trùng và chữa bệnh mạnh mẽ như tỏi, sức mạnh của mật
        ong sẽ tăng lên gấp 10 lần. Hỗn hợp mật ong và tỏi sẽ giúp tăng cường hệ
        thống miễn dịch của cơ thể và giúp cơ thể luôn trong tình trạng khỏe
        mạnh.
    </p><p>Dưới đây là một số công thức kết hợp giữa mật ong và tỏi để có thể mang lại lợi ích tốt nhất.</p>
    <img src="http://sohanews.sohacdn.com/2018/2/10/photo-6-15182342551081594171965-15182348575251696427355.png" /><p>
        Tách
        các nhánh tỏi và loại bỏ lớp vỏ ngoài của chúng. Đặt chúng vào trong
        bình, rồi đổ mật ong lên. Bỏ bớt bong bóng nếu cần. Đậy nắp và đợi trong
        vài ngày. Uống 1 thìa hỗn hợp mỗi ngày khi dạ dày còn rỗng, bạn sẽ cảm
        thấy cơ thể tràn đầy sức sống và khỏe mạnh hơn bao giờ hết.
    </p>
    <div id="admzone480455"><div id="ads_zone480455"><div id="ads_zone480455_slot1"><div id="ads_zone480455_banner554187" class="banner0" style="display: none;"><div id="sspbid_3308"><iframe id="ads-place-3308" style="border: 0px none; margin: 0px; padding: 0px;" src="javascript:void(0)" width="0" height="0"></iframe></div></div></div> </div></div><p><b>Công thức 2:</b></p><p><b><i>Thành phần</i></b></p><p>- 4 nắm tay tỏi cắt nhỏ</p><p>- 1 củ hành tây cắt nhỏ</p><p>- 2 quả ớt đỏ cắt nhỏ</p><p>- 1 muỗng canh gừng xắt nhỏ</p><p>- 1 quả chanh</p><p>- 1 thìa cà phê dấm táo</p><p>- 1 bình 500ml.</p><p><b><i>Cách làm</i></b></p><p>
        Cho
        hành tây cắt nhỏ vào dưới cùng của bình. Sau đó thêm tỏi và ớt. Tiếp
        theo cho gừng xắt nhỏ và từ từ đổ nước chanh vào bình. Ở trên cùng, thêm
        một thìa cà phê dấm táo và đóng bình thật chặt. Để thừa một khoảng
        không gian để hỗn hợp có thể lên men. Cất giữ bình ở nơi tối, thoáng mát
        và sử dụng thường xuyên hoặc cho đến khi tất cả các triệu chứng của bạn
        đã biến mất.
    </p><p style="text-align: right;"><i>*Theo Life Advencer, Brightside</i></p>

', NULL, NULL, NULL, N'', N'-1', N'', CAST(N'2018-08-05T13:40:24.783' AS DateTime), N'', 1, N'', N'', NULL)
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [TenSP], [Mota], [Gia], [GiaGiam], [HinhAnh], [HinhAnhThem], [TrangThai], [TonKho], [BanChay], [Moi], [Hot], [KhuyenMai], [ChiTietSanPham], [BaoHanh], [TopHot], [DaCoVAT], [TieuDeMeta], [IDMenuCha], [TieuDeSeo], [NgayTao], [NguoiTao], [HienThiTrenTrangChu], [MetaKeyWord], [MeTaDescription], [SoLuotXem]) VALUES (3, 2, N'Mật ong nguyên chất 3', N'
Mật ong là một thứ nguyên liệu dễ kiếm và dễ sử dụng. Đồng thời, nó cũng có rất nhiều lợi ích đối với sức khỏe con người .
', 120000.0000, 110000.0000, N'/Content/Upload/SanPham/MatOng/3.jpg', NULL, 1, 100, 1, 1, 1, 1, N'

    <p>
       <b>Mật ong</b>
        là một thứ nguyên liệu dễ kiếm và dễ sử dụng. Đồng thời, nó cũng có rất
        nhiều lợi ích đối với sức khỏe con người. Dưới đây là những lợi của mật
        ong đối với sức khỏe và các phương pháp để có thể tận dụng được triệt
        để lợi ích của mật ong:
    </p><p><b>1. Làm đẹp da</b></p><div><img src="http://sohanews.sohacdn.com/2018/2/10/photo-1-15182342543041378086659.jpg"></div><p>
        Mật
        ong là một chất chống oxy hoá tuyệt vời, giúp thanh lọc cơ thể, loại bỏ
        nhiều chất độc khác nhau. Ngoài ra, do tính kháng khuẩn mạnh mẽ nên nó
        sẽ giúp cải thiện đáng kể tình trạng da, giúp da tươi sáng, căng tràn
        sức sống và luôn khỏe mạnh.
    </p><p><b>2. Hỗ trợ giảm cân</b></p><p>
        Nếu
        đang trong chế độ giảm cân, bạn nên loại bỏ tất cả các loại đồ ngọt có
        đường, trừ mật ong. Vì lượng đường có trong mật ong chứa thành phần khác
        với chất tạo ngọt thường.
    </p><p>
        Ít ai biết rằng khoảng 70% lượng đường
        của mật ong là đường tự nhiên, và chưa tới 5% còn lại là loại đường
        giống với đường chúng ta vẫn ăn hằng ngày.
    </p><img src="http://sohanews.sohacdn.com/2018/2/10/photo-1-1518234255097789679822.jpg" />
        <p>
            Do
            đó, mật ong vẫn giải quyết được các nhu cầu thèm ngọt hàng ngày nhưng
            vẫn đảm bảo được lượng calo hấp thụ chỉ bằng 64% so với các loại nước
            ngọt có gas. Đồng thời còn giúp tăng cường sự trao đổi chất, điều này
            rất cần thiết cho việc giảm cân.
        </p>
   <p><b>3. Giảm cholesterol</b></p><p>
        Mật
        ong không có cholesterol. Ngược lại thành phần cấu tạo và vitamin của
        mật ong góp phần làm  giảm mức cholesterol. Tiêu thụ mật ong hàng ngày
        rất có lợi cho việc tăng các hợp chất chống oxy hoá trong cơ thể và có
        thể chống lại lượng cholesterol dư thừa.
    </p><img src="http://sohanews.sohacdn.com/2018/2/10/photo-2-15182342550991575497251-15182348641831341350506.png" />
        <p>
            Vitamin
            C, E và Pinocembrin là 2 chất chống oxy hóa tự nhiên tuyệt vời có trong
            mật ong. Những chất này có tác dụng rất tốt trong việc ngăn chặn và
            giảm nguy cơ mắc bệnh tim ở người.
        </p>
    <p>
        Các nghiên cứu đã cho thấy rằng
        các chất chống oxy hoá có trong mật ong có thể ngăn ngừa chứng hẹp động
        mạch gây suy tim, suy giảm trí nhớ, hoặc nhức đầu. Vì vậy, uống một ly
        nước với vài muỗng mật ong mỗi ngày sẽ là một biện pháp tốt để ngăn ngừa
        nguy cơ mắc các bệnh về tim mạch.
    </p><p><b>5. Cải thiện trí nhớ</b></p><p>
        Các
        nghiên cứu khác đã cho thấy khả năng chống lại stress của mật ong, khôi
        phục lại hệ thống phòng chống oxy hóa của tế bào, và kết quả là cải
        thiện trí nhớ . Ngoài ra, canxi chứa trong mật ong dễ dàng được não hấp
        thụ, đem lại lợi ích cho các quá trình hoạt động, chuyển hóa của não bộ.
    </p><p><b>6. Tăng chất lượng giấc ngủ</b></p><p>
        Đường
        chứa trong mật ong làm tăng lượng insulin trong máu, giúp giải phóng
        serotonin. Serotonin được chuyển hóa thành melatonin, một loại hooc-môn
        giúp thúc đẩy giấc ngủ ngon hơn.
    </p><img src="http://sohanews.sohacdn.com/2018/2/10/photo-4-15182342551031753229726.jpg" /><p>
        Mật
        ong là một chất khử trùng mạnh, do đó bạn nên ăn một thìa mật ong mỗi
        sáng khi dạ dày còn rỗng. Phương pháp đơn giản này sẽ giúp bạn ngăn ngừa
        được các bệnh khác nhau liên quan đến đường tiêu hóa. Bên cạnh đó, khi
        mật ong đi qua dạ dày, nó sẽ giúp tiêu diệt vi trùng và chữa lành các
        vết thương nhỏ trong niêm mạc.
    </p><p><b>8. Làm giảm căng thẳng, mệt mỏi, stress</b></p><p>
        Điều
        này nghe có vẻ kỳ quặc, nhưng thực tế đúng là vậy. Mật ong giúp làm dịu
        các dây thần kinh và giảm bớt mệt mỏi . Glucose chứa trong mật ong rất
        cần thiết cho hoạt động của các nơ-ron thần kinh. Nó được hấp thụ nhanh
        chóng vào trong máu, làm cho việc thư giãn và giảm các rối loạn tâm lý
        trở nên hiệu quả hơn.
    </p><p>
        Khi kết hợp với một loại thuốc tự nhiên khác
        có tính chất khử trùng và chữa bệnh mạnh mẽ như tỏi, sức mạnh của mật
        ong sẽ tăng lên gấp 10 lần. Hỗn hợp mật ong và tỏi sẽ giúp tăng cường hệ
        thống miễn dịch của cơ thể và giúp cơ thể luôn trong tình trạng khỏe
        mạnh.
    </p><p>Dưới đây là một số công thức kết hợp giữa mật ong và tỏi để có thể mang lại lợi ích tốt nhất.</p>
    <img src="http://sohanews.sohacdn.com/2018/2/10/photo-6-15182342551081594171965-15182348575251696427355.png" /><p>
        Tách
        các nhánh tỏi và loại bỏ lớp vỏ ngoài của chúng. Đặt chúng vào trong
        bình, rồi đổ mật ong lên. Bỏ bớt bong bóng nếu cần. Đậy nắp và đợi trong
        vài ngày. Uống 1 thìa hỗn hợp mỗi ngày khi dạ dày còn rỗng, bạn sẽ cảm
        thấy cơ thể tràn đầy sức sống và khỏe mạnh hơn bao giờ hết.
    </p>
    <div id="admzone480455"><div id="ads_zone480455"><div id="ads_zone480455_slot1"><div id="ads_zone480455_banner554187" class="banner0" style="display: none;"><div id="sspbid_3308"><iframe id="ads-place-3308" style="border: 0px none; margin: 0px; padding: 0px;" src="javascript:void(0)" width="0" height="0"></iframe></div></div></div> </div></div><p><b>Công thức 2:</b></p><p><b><i>Thành phần</i></b></p><p>- 4 nắm tay tỏi cắt nhỏ</p><p>- 1 củ hành tây cắt nhỏ</p><p>- 2 quả ớt đỏ cắt nhỏ</p><p>- 1 muỗng canh gừng xắt nhỏ</p><p>- 1 quả chanh</p><p>- 1 thìa cà phê dấm táo</p><p>- 1 bình 500ml.</p><p><b><i>Cách làm</i></b></p><p>
        Cho
        hành tây cắt nhỏ vào dưới cùng của bình. Sau đó thêm tỏi và ớt. Tiếp
        theo cho gừng xắt nhỏ và từ từ đổ nước chanh vào bình. Ở trên cùng, thêm
        một thìa cà phê dấm táo và đóng bình thật chặt. Để thừa một khoảng
        không gian để hỗn hợp có thể lên men. Cất giữ bình ở nơi tối, thoáng mát
        và sử dụng thường xuyên hoặc cho đến khi tất cả các triệu chứng của bạn
        đã biến mất.
    </p><p style="text-align: right;"><i>*Theo Life Advencer, Brightside</i></p>

', NULL, NULL, NULL, N'', N'-1', N'', CAST(N'2018-08-05T13:40:24.783' AS DateTime), N'', 1, N'', N'', NULL)
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [TenSP], [Mota], [Gia], [GiaGiam], [HinhAnh], [HinhAnhThem], [TrangThai], [TonKho], [BanChay], [Moi], [Hot], [KhuyenMai], [ChiTietSanPham], [BaoHanh], [TopHot], [DaCoVAT], [TieuDeMeta], [IDMenuCha], [TieuDeSeo], [NgayTao], [NguoiTao], [HienThiTrenTrangChu], [MetaKeyWord], [MeTaDescription], [SoLuotXem]) VALUES (4, 2, N'Mật ong nguyên chất 4', N'
Mật ong là một thứ nguyên liệu dễ kiếm và dễ sử dụng. Đồng thời, nó cũng có rất nhiều lợi ích đối với sức khỏe con người .
', 120000.0000, 110000.0000, N'/Content/Upload/SanPham/MatOng/4.jpg', NULL, 1, 100, 1, 1, 1, 1, N'

    <p>
       <b>Mật ong</b>
        là một thứ nguyên liệu dễ kiếm và dễ sử dụng. Đồng thời, nó cũng có rất
        nhiều lợi ích đối với sức khỏe con người. Dưới đây là những lợi của mật
        ong đối với sức khỏe và các phương pháp để có thể tận dụng được triệt
        để lợi ích của mật ong:
    </p><p><b>1. Làm đẹp da</b></p><div><img src="http://sohanews.sohacdn.com/2018/2/10/photo-1-15182342543041378086659.jpg"></div><p>
        Mật
        ong là một chất chống oxy hoá tuyệt vời, giúp thanh lọc cơ thể, loại bỏ
        nhiều chất độc khác nhau. Ngoài ra, do tính kháng khuẩn mạnh mẽ nên nó
        sẽ giúp cải thiện đáng kể tình trạng da, giúp da tươi sáng, căng tràn
        sức sống và luôn khỏe mạnh.
    </p><p><b>2. Hỗ trợ giảm cân</b></p><p>
        Nếu
        đang trong chế độ giảm cân, bạn nên loại bỏ tất cả các loại đồ ngọt có
        đường, trừ mật ong. Vì lượng đường có trong mật ong chứa thành phần khác
        với chất tạo ngọt thường.
    </p><p>
        Ít ai biết rằng khoảng 70% lượng đường
        của mật ong là đường tự nhiên, và chưa tới 5% còn lại là loại đường
        giống với đường chúng ta vẫn ăn hằng ngày.
    </p><img src="http://sohanews.sohacdn.com/2018/2/10/photo-1-1518234255097789679822.jpg" />
        <p>
            Do
            đó, mật ong vẫn giải quyết được các nhu cầu thèm ngọt hàng ngày nhưng
            vẫn đảm bảo được lượng calo hấp thụ chỉ bằng 64% so với các loại nước
            ngọt có gas. Đồng thời còn giúp tăng cường sự trao đổi chất, điều này
            rất cần thiết cho việc giảm cân.
        </p>
   <p><b>3. Giảm cholesterol</b></p><p>
        Mật
        ong không có cholesterol. Ngược lại thành phần cấu tạo và vitamin của
        mật ong góp phần làm  giảm mức cholesterol. Tiêu thụ mật ong hàng ngày
        rất có lợi cho việc tăng các hợp chất chống oxy hoá trong cơ thể và có
        thể chống lại lượng cholesterol dư thừa.
    </p><img src="http://sohanews.sohacdn.com/2018/2/10/photo-2-15182342550991575497251-15182348641831341350506.png" />
        <p>
            Vitamin
            C, E và Pinocembrin là 2 chất chống oxy hóa tự nhiên tuyệt vời có trong
            mật ong. Những chất này có tác dụng rất tốt trong việc ngăn chặn và
            giảm nguy cơ mắc bệnh tim ở người.
        </p>
    <p>
        Các nghiên cứu đã cho thấy rằng
        các chất chống oxy hoá có trong mật ong có thể ngăn ngừa chứng hẹp động
        mạch gây suy tim, suy giảm trí nhớ, hoặc nhức đầu. Vì vậy, uống một ly
        nước với vài muỗng mật ong mỗi ngày sẽ là một biện pháp tốt để ngăn ngừa
        nguy cơ mắc các bệnh về tim mạch.
    </p><p><b>5. Cải thiện trí nhớ</b></p><p>
        Các
        nghiên cứu khác đã cho thấy khả năng chống lại stress của mật ong, khôi
        phục lại hệ thống phòng chống oxy hóa của tế bào, và kết quả là cải
        thiện trí nhớ . Ngoài ra, canxi chứa trong mật ong dễ dàng được não hấp
        thụ, đem lại lợi ích cho các quá trình hoạt động, chuyển hóa của não bộ.
    </p><p><b>6. Tăng chất lượng giấc ngủ</b></p><p>
        Đường
        chứa trong mật ong làm tăng lượng insulin trong máu, giúp giải phóng
        serotonin. Serotonin được chuyển hóa thành melatonin, một loại hooc-môn
        giúp thúc đẩy giấc ngủ ngon hơn.
    </p><img src="http://sohanews.sohacdn.com/2018/2/10/photo-4-15182342551031753229726.jpg" /><p>
        Mật
        ong là một chất khử trùng mạnh, do đó bạn nên ăn một thìa mật ong mỗi
        sáng khi dạ dày còn rỗng. Phương pháp đơn giản này sẽ giúp bạn ngăn ngừa
        được các bệnh khác nhau liên quan đến đường tiêu hóa. Bên cạnh đó, khi
        mật ong đi qua dạ dày, nó sẽ giúp tiêu diệt vi trùng và chữa lành các
        vết thương nhỏ trong niêm mạc.
    </p><p><b>8. Làm giảm căng thẳng, mệt mỏi, stress</b></p><p>
        Điều
        này nghe có vẻ kỳ quặc, nhưng thực tế đúng là vậy. Mật ong giúp làm dịu
        các dây thần kinh và giảm bớt mệt mỏi . Glucose chứa trong mật ong rất
        cần thiết cho hoạt động của các nơ-ron thần kinh. Nó được hấp thụ nhanh
        chóng vào trong máu, làm cho việc thư giãn và giảm các rối loạn tâm lý
        trở nên hiệu quả hơn.
    </p><p>
        Khi kết hợp với một loại thuốc tự nhiên khác
        có tính chất khử trùng và chữa bệnh mạnh mẽ như tỏi, sức mạnh của mật
        ong sẽ tăng lên gấp 10 lần. Hỗn hợp mật ong và tỏi sẽ giúp tăng cường hệ
        thống miễn dịch của cơ thể và giúp cơ thể luôn trong tình trạng khỏe
        mạnh.
    </p><p>Dưới đây là một số công thức kết hợp giữa mật ong và tỏi để có thể mang lại lợi ích tốt nhất.</p>
    <img src="http://sohanews.sohacdn.com/2018/2/10/photo-6-15182342551081594171965-15182348575251696427355.png" /><p>
        Tách
        các nhánh tỏi và loại bỏ lớp vỏ ngoài của chúng. Đặt chúng vào trong
        bình, rồi đổ mật ong lên. Bỏ bớt bong bóng nếu cần. Đậy nắp và đợi trong
        vài ngày. Uống 1 thìa hỗn hợp mỗi ngày khi dạ dày còn rỗng, bạn sẽ cảm
        thấy cơ thể tràn đầy sức sống và khỏe mạnh hơn bao giờ hết.
    </p>
    <div id="admzone480455"><div id="ads_zone480455"><div id="ads_zone480455_slot1"><div id="ads_zone480455_banner554187" class="banner0" style="display: none;"><div id="sspbid_3308"><iframe id="ads-place-3308" style="border: 0px none; margin: 0px; padding: 0px;" src="javascript:void(0)" width="0" height="0"></iframe></div></div></div> </div></div><p><b>Công thức 2:</b></p><p><b><i>Thành phần</i></b></p><p>- 4 nắm tay tỏi cắt nhỏ</p><p>- 1 củ hành tây cắt nhỏ</p><p>- 2 quả ớt đỏ cắt nhỏ</p><p>- 1 muỗng canh gừng xắt nhỏ</p><p>- 1 quả chanh</p><p>- 1 thìa cà phê dấm táo</p><p>- 1 bình 500ml.</p><p><b><i>Cách làm</i></b></p><p>
        Cho
        hành tây cắt nhỏ vào dưới cùng của bình. Sau đó thêm tỏi và ớt. Tiếp
        theo cho gừng xắt nhỏ và từ từ đổ nước chanh vào bình. Ở trên cùng, thêm
        một thìa cà phê dấm táo và đóng bình thật chặt. Để thừa một khoảng
        không gian để hỗn hợp có thể lên men. Cất giữ bình ở nơi tối, thoáng mát
        và sử dụng thường xuyên hoặc cho đến khi tất cả các triệu chứng của bạn
        đã biến mất.
    </p><p style="text-align: right;"><i>*Theo Life Advencer, Brightside</i></p>

', NULL, NULL, NULL, N'', N'-1', N'', CAST(N'2018-08-05T13:40:24.783' AS DateTime), N'', 1, N'', N'', NULL)
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [TenSP], [Mota], [Gia], [GiaGiam], [HinhAnh], [HinhAnhThem], [TrangThai], [TonKho], [BanChay], [Moi], [Hot], [KhuyenMai], [ChiTietSanPham], [BaoHanh], [TopHot], [DaCoVAT], [TieuDeMeta], [IDMenuCha], [TieuDeSeo], [NgayTao], [NguoiTao], [HienThiTrenTrangChu], [MetaKeyWord], [MeTaDescription], [SoLuotXem]) VALUES (5, 2, N'Mật ong nguyên chất 5', N'
Mật ong là một thứ nguyên liệu dễ kiếm và dễ sử dụng. Đồng thời, nó cũng có rất nhiều lợi ích đối với sức khỏe con người .
', 120000.0000, 110000.0000, N'/Content/Upload/SanPham/MatOng/5.jpg', NULL, 1, 100, 1, 1, 1, 1, N'

    <p>
       <b>Mật ong</b>
        là một thứ nguyên liệu dễ kiếm và dễ sử dụng. Đồng thời, nó cũng có rất
        nhiều lợi ích đối với sức khỏe con người. Dưới đây là những lợi của mật
        ong đối với sức khỏe và các phương pháp để có thể tận dụng được triệt
        để lợi ích của mật ong:
    </p><p><b>1. Làm đẹp da</b></p><div><img src="http://sohanews.sohacdn.com/2018/2/10/photo-1-15182342543041378086659.jpg"></div><p>
        Mật
        ong là một chất chống oxy hoá tuyệt vời, giúp thanh lọc cơ thể, loại bỏ
        nhiều chất độc khác nhau. Ngoài ra, do tính kháng khuẩn mạnh mẽ nên nó
        sẽ giúp cải thiện đáng kể tình trạng da, giúp da tươi sáng, căng tràn
        sức sống và luôn khỏe mạnh.
    </p><p><b>2. Hỗ trợ giảm cân</b></p><p>
        Nếu
        đang trong chế độ giảm cân, bạn nên loại bỏ tất cả các loại đồ ngọt có
        đường, trừ mật ong. Vì lượng đường có trong mật ong chứa thành phần khác
        với chất tạo ngọt thường.
    </p><p>
        Ít ai biết rằng khoảng 70% lượng đường
        của mật ong là đường tự nhiên, và chưa tới 5% còn lại là loại đường
        giống với đường chúng ta vẫn ăn hằng ngày.
    </p><img src="http://sohanews.sohacdn.com/2018/2/10/photo-1-1518234255097789679822.jpg" />
        <p>
            Do
            đó, mật ong vẫn giải quyết được các nhu cầu thèm ngọt hàng ngày nhưng
            vẫn đảm bảo được lượng calo hấp thụ chỉ bằng 64% so với các loại nước
            ngọt có gas. Đồng thời còn giúp tăng cường sự trao đổi chất, điều này
            rất cần thiết cho việc giảm cân.
        </p>
   <p><b>3. Giảm cholesterol</b></p><p>
        Mật
        ong không có cholesterol. Ngược lại thành phần cấu tạo và vitamin của
        mật ong góp phần làm  giảm mức cholesterol. Tiêu thụ mật ong hàng ngày
        rất có lợi cho việc tăng các hợp chất chống oxy hoá trong cơ thể và có
        thể chống lại lượng cholesterol dư thừa.
    </p><img src="http://sohanews.sohacdn.com/2018/2/10/photo-2-15182342550991575497251-15182348641831341350506.png" />
        <p>
            Vitamin
            C, E và Pinocembrin là 2 chất chống oxy hóa tự nhiên tuyệt vời có trong
            mật ong. Những chất này có tác dụng rất tốt trong việc ngăn chặn và
            giảm nguy cơ mắc bệnh tim ở người.
        </p>
    <p>
        Các nghiên cứu đã cho thấy rằng
        các chất chống oxy hoá có trong mật ong có thể ngăn ngừa chứng hẹp động
        mạch gây suy tim, suy giảm trí nhớ, hoặc nhức đầu. Vì vậy, uống một ly
        nước với vài muỗng mật ong mỗi ngày sẽ là một biện pháp tốt để ngăn ngừa
        nguy cơ mắc các bệnh về tim mạch.
    </p><p><b>5. Cải thiện trí nhớ</b></p><p>
        Các
        nghiên cứu khác đã cho thấy khả năng chống lại stress của mật ong, khôi
        phục lại hệ thống phòng chống oxy hóa của tế bào, và kết quả là cải
        thiện trí nhớ . Ngoài ra, canxi chứa trong mật ong dễ dàng được não hấp
        thụ, đem lại lợi ích cho các quá trình hoạt động, chuyển hóa của não bộ.
    </p><p><b>6. Tăng chất lượng giấc ngủ</b></p><p>
        Đường
        chứa trong mật ong làm tăng lượng insulin trong máu, giúp giải phóng
        serotonin. Serotonin được chuyển hóa thành melatonin, một loại hooc-môn
        giúp thúc đẩy giấc ngủ ngon hơn.
    </p><img src="http://sohanews.sohacdn.com/2018/2/10/photo-4-15182342551031753229726.jpg" /><p>
        Mật
        ong là một chất khử trùng mạnh, do đó bạn nên ăn một thìa mật ong mỗi
        sáng khi dạ dày còn rỗng. Phương pháp đơn giản này sẽ giúp bạn ngăn ngừa
        được các bệnh khác nhau liên quan đến đường tiêu hóa. Bên cạnh đó, khi
        mật ong đi qua dạ dày, nó sẽ giúp tiêu diệt vi trùng và chữa lành các
        vết thương nhỏ trong niêm mạc.
    </p><p><b>8. Làm giảm căng thẳng, mệt mỏi, stress</b></p><p>
        Điều
        này nghe có vẻ kỳ quặc, nhưng thực tế đúng là vậy. Mật ong giúp làm dịu
        các dây thần kinh và giảm bớt mệt mỏi . Glucose chứa trong mật ong rất
        cần thiết cho hoạt động của các nơ-ron thần kinh. Nó được hấp thụ nhanh
        chóng vào trong máu, làm cho việc thư giãn và giảm các rối loạn tâm lý
        trở nên hiệu quả hơn.
    </p><p>
        Khi kết hợp với một loại thuốc tự nhiên khác
        có tính chất khử trùng và chữa bệnh mạnh mẽ như tỏi, sức mạnh của mật
        ong sẽ tăng lên gấp 10 lần. Hỗn hợp mật ong và tỏi sẽ giúp tăng cường hệ
        thống miễn dịch của cơ thể và giúp cơ thể luôn trong tình trạng khỏe
        mạnh.
    </p><p>Dưới đây là một số công thức kết hợp giữa mật ong và tỏi để có thể mang lại lợi ích tốt nhất.</p>
    <img src="http://sohanews.sohacdn.com/2018/2/10/photo-6-15182342551081594171965-15182348575251696427355.png" /><p>
        Tách
        các nhánh tỏi và loại bỏ lớp vỏ ngoài của chúng. Đặt chúng vào trong
        bình, rồi đổ mật ong lên. Bỏ bớt bong bóng nếu cần. Đậy nắp và đợi trong
        vài ngày. Uống 1 thìa hỗn hợp mỗi ngày khi dạ dày còn rỗng, bạn sẽ cảm
        thấy cơ thể tràn đầy sức sống và khỏe mạnh hơn bao giờ hết.
    </p>
    <div id="admzone480455"><div id="ads_zone480455"><div id="ads_zone480455_slot1"><div id="ads_zone480455_banner554187" class="banner0" style="display: none;"><div id="sspbid_3308"><iframe id="ads-place-3308" style="border: 0px none; margin: 0px; padding: 0px;" src="javascript:void(0)" width="0" height="0"></iframe></div></div></div> </div></div><p><b>Công thức 2:</b></p><p><b><i>Thành phần</i></b></p><p>- 4 nắm tay tỏi cắt nhỏ</p><p>- 1 củ hành tây cắt nhỏ</p><p>- 2 quả ớt đỏ cắt nhỏ</p><p>- 1 muỗng canh gừng xắt nhỏ</p><p>- 1 quả chanh</p><p>- 1 thìa cà phê dấm táo</p><p>- 1 bình 500ml.</p><p><b><i>Cách làm</i></b></p><p>
        Cho
        hành tây cắt nhỏ vào dưới cùng của bình. Sau đó thêm tỏi và ớt. Tiếp
        theo cho gừng xắt nhỏ và từ từ đổ nước chanh vào bình. Ở trên cùng, thêm
        một thìa cà phê dấm táo và đóng bình thật chặt. Để thừa một khoảng
        không gian để hỗn hợp có thể lên men. Cất giữ bình ở nơi tối, thoáng mát
        và sử dụng thường xuyên hoặc cho đến khi tất cả các triệu chứng của bạn
        đã biến mất.
    </p><p style="text-align: right;"><i>*Theo Life Advencer, Brightside</i></p>

', NULL, NULL, NULL, N'', N'-1', N'', CAST(N'2018-08-05T13:40:24.783' AS DateTime), N'', 1, N'', N'', NULL)
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [TenSP], [Mota], [Gia], [GiaGiam], [HinhAnh], [HinhAnhThem], [TrangThai], [TonKho], [BanChay], [Moi], [Hot], [KhuyenMai], [ChiTietSanPham], [BaoHanh], [TopHot], [DaCoVAT], [TieuDeMeta], [IDMenuCha], [TieuDeSeo], [NgayTao], [NguoiTao], [HienThiTrenTrangChu], [MetaKeyWord], [MeTaDescription], [SoLuotXem]) VALUES (6, 2, N'Mật ong nguyên chất 6', N'
Mật ong là một thứ nguyên liệu dễ kiếm và dễ sử dụng. Đồng thời, nó cũng có rất nhiều lợi ích đối với sức khỏe con người .
', 120000.0000, 110000.0000, N'/Content/Upload/SanPham/MatOng/6.jpg', NULL, 1, 100, 1, 1, 1, 1, N'

    <p>
       <b>Mật ong</b>
        là một thứ nguyên liệu dễ kiếm và dễ sử dụng. Đồng thời, nó cũng có rất
        nhiều lợi ích đối với sức khỏe con người. Dưới đây là những lợi của mật
        ong đối với sức khỏe và các phương pháp để có thể tận dụng được triệt
        để lợi ích của mật ong:
    </p><p><b>1. Làm đẹp da</b></p><div><img src="http://sohanews.sohacdn.com/2018/2/10/photo-1-15182342543041378086659.jpg"></div><p>
        Mật
        ong là một chất chống oxy hoá tuyệt vời, giúp thanh lọc cơ thể, loại bỏ
        nhiều chất độc khác nhau. Ngoài ra, do tính kháng khuẩn mạnh mẽ nên nó
        sẽ giúp cải thiện đáng kể tình trạng da, giúp da tươi sáng, căng tràn
        sức sống và luôn khỏe mạnh.
    </p><p><b>2. Hỗ trợ giảm cân</b></p><p>
        Nếu
        đang trong chế độ giảm cân, bạn nên loại bỏ tất cả các loại đồ ngọt có
        đường, trừ mật ong. Vì lượng đường có trong mật ong chứa thành phần khác
        với chất tạo ngọt thường.
    </p><p>
        Ít ai biết rằng khoảng 70% lượng đường
        của mật ong là đường tự nhiên, và chưa tới 5% còn lại là loại đường
        giống với đường chúng ta vẫn ăn hằng ngày.
    </p><img src="http://sohanews.sohacdn.com/2018/2/10/photo-1-1518234255097789679822.jpg" />
        <p>
            Do
            đó, mật ong vẫn giải quyết được các nhu cầu thèm ngọt hàng ngày nhưng
            vẫn đảm bảo được lượng calo hấp thụ chỉ bằng 64% so với các loại nước
            ngọt có gas. Đồng thời còn giúp tăng cường sự trao đổi chất, điều này
            rất cần thiết cho việc giảm cân.
        </p>
   <p><b>3. Giảm cholesterol</b></p><p>
        Mật
        ong không có cholesterol. Ngược lại thành phần cấu tạo và vitamin của
        mật ong góp phần làm  giảm mức cholesterol. Tiêu thụ mật ong hàng ngày
        rất có lợi cho việc tăng các hợp chất chống oxy hoá trong cơ thể và có
        thể chống lại lượng cholesterol dư thừa.
    </p><img src="http://sohanews.sohacdn.com/2018/2/10/photo-2-15182342550991575497251-15182348641831341350506.png" />
        <p>
            Vitamin
            C, E và Pinocembrin là 2 chất chống oxy hóa tự nhiên tuyệt vời có trong
            mật ong. Những chất này có tác dụng rất tốt trong việc ngăn chặn và
            giảm nguy cơ mắc bệnh tim ở người.
        </p>
    <p>
        Các nghiên cứu đã cho thấy rằng
        các chất chống oxy hoá có trong mật ong có thể ngăn ngừa chứng hẹp động
        mạch gây suy tim, suy giảm trí nhớ, hoặc nhức đầu. Vì vậy, uống một ly
        nước với vài muỗng mật ong mỗi ngày sẽ là một biện pháp tốt để ngăn ngừa
        nguy cơ mắc các bệnh về tim mạch.
    </p><p><b>5. Cải thiện trí nhớ</b></p><p>
        Các
        nghiên cứu khác đã cho thấy khả năng chống lại stress của mật ong, khôi
        phục lại hệ thống phòng chống oxy hóa của tế bào, và kết quả là cải
        thiện trí nhớ . Ngoài ra, canxi chứa trong mật ong dễ dàng được não hấp
        thụ, đem lại lợi ích cho các quá trình hoạt động, chuyển hóa của não bộ.
    </p><p><b>6. Tăng chất lượng giấc ngủ</b></p><p>
        Đường
        chứa trong mật ong làm tăng lượng insulin trong máu, giúp giải phóng
        serotonin. Serotonin được chuyển hóa thành melatonin, một loại hooc-môn
        giúp thúc đẩy giấc ngủ ngon hơn.
    </p><img src="http://sohanews.sohacdn.com/2018/2/10/photo-4-15182342551031753229726.jpg" /><p>
        Mật
        ong là một chất khử trùng mạnh, do đó bạn nên ăn một thìa mật ong mỗi
        sáng khi dạ dày còn rỗng. Phương pháp đơn giản này sẽ giúp bạn ngăn ngừa
        được các bệnh khác nhau liên quan đến đường tiêu hóa. Bên cạnh đó, khi
        mật ong đi qua dạ dày, nó sẽ giúp tiêu diệt vi trùng và chữa lành các
        vết thương nhỏ trong niêm mạc.
    </p><p><b>8. Làm giảm căng thẳng, mệt mỏi, stress</b></p><p>
        Điều
        này nghe có vẻ kỳ quặc, nhưng thực tế đúng là vậy. Mật ong giúp làm dịu
        các dây thần kinh và giảm bớt mệt mỏi . Glucose chứa trong mật ong rất
        cần thiết cho hoạt động của các nơ-ron thần kinh. Nó được hấp thụ nhanh
        chóng vào trong máu, làm cho việc thư giãn và giảm các rối loạn tâm lý
        trở nên hiệu quả hơn.
    </p><p>
        Khi kết hợp với một loại thuốc tự nhiên khác
        có tính chất khử trùng và chữa bệnh mạnh mẽ như tỏi, sức mạnh của mật
        ong sẽ tăng lên gấp 10 lần. Hỗn hợp mật ong và tỏi sẽ giúp tăng cường hệ
        thống miễn dịch của cơ thể và giúp cơ thể luôn trong tình trạng khỏe
        mạnh.
    </p><p>Dưới đây là một số công thức kết hợp giữa mật ong và tỏi để có thể mang lại lợi ích tốt nhất.</p>
    <img src="http://sohanews.sohacdn.com/2018/2/10/photo-6-15182342551081594171965-15182348575251696427355.png" /><p>
        Tách
        các nhánh tỏi và loại bỏ lớp vỏ ngoài của chúng. Đặt chúng vào trong
        bình, rồi đổ mật ong lên. Bỏ bớt bong bóng nếu cần. Đậy nắp và đợi trong
        vài ngày. Uống 1 thìa hỗn hợp mỗi ngày khi dạ dày còn rỗng, bạn sẽ cảm
        thấy cơ thể tràn đầy sức sống và khỏe mạnh hơn bao giờ hết.
    </p>
    <div id="admzone480455"><div id="ads_zone480455"><div id="ads_zone480455_slot1"><div id="ads_zone480455_banner554187" class="banner0" style="display: none;"><div id="sspbid_3308"><iframe id="ads-place-3308" style="border: 0px none; margin: 0px; padding: 0px;" src="javascript:void(0)" width="0" height="0"></iframe></div></div></div> </div></div><p><b>Công thức 2:</b></p><p><b><i>Thành phần</i></b></p><p>- 4 nắm tay tỏi cắt nhỏ</p><p>- 1 củ hành tây cắt nhỏ</p><p>- 2 quả ớt đỏ cắt nhỏ</p><p>- 1 muỗng canh gừng xắt nhỏ</p><p>- 1 quả chanh</p><p>- 1 thìa cà phê dấm táo</p><p>- 1 bình 500ml.</p><p><b><i>Cách làm</i></b></p><p>
        Cho
        hành tây cắt nhỏ vào dưới cùng của bình. Sau đó thêm tỏi và ớt. Tiếp
        theo cho gừng xắt nhỏ và từ từ đổ nước chanh vào bình. Ở trên cùng, thêm
        một thìa cà phê dấm táo và đóng bình thật chặt. Để thừa một khoảng
        không gian để hỗn hợp có thể lên men. Cất giữ bình ở nơi tối, thoáng mát
        và sử dụng thường xuyên hoặc cho đến khi tất cả các triệu chứng của bạn
        đã biến mất.
    </p><p style="text-align: right;"><i>*Theo Life Advencer, Brightside</i></p>

', NULL, NULL, NULL, N'', N'-1', N'', CAST(N'2018-08-05T13:40:24.783' AS DateTime), N'', 1, N'', N'', NULL)
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [TenSP], [Mota], [Gia], [GiaGiam], [HinhAnh], [HinhAnhThem], [TrangThai], [TonKho], [BanChay], [Moi], [Hot], [KhuyenMai], [ChiTietSanPham], [BaoHanh], [TopHot], [DaCoVAT], [TieuDeMeta], [IDMenuCha], [TieuDeSeo], [NgayTao], [NguoiTao], [HienThiTrenTrangChu], [MetaKeyWord], [MeTaDescription], [SoLuotXem]) VALUES (7, 2, N'Mật ong nguyên chất 7', N'
Mật ong là một thứ nguyên liệu dễ kiếm và dễ sử dụng. Đồng thời, nó cũng có rất nhiều lợi ích đối với sức khỏe con người .
', 120000.0000, 110000.0000, N'/Content/Upload/SanPham/MatOng/7.jpg', NULL, 1, 100, 1, 1, 1, 1, N'

    <p>
       <b>Mật ong</b>
        là một thứ nguyên liệu dễ kiếm và dễ sử dụng. Đồng thời, nó cũng có rất
        nhiều lợi ích đối với sức khỏe con người. Dưới đây là những lợi của mật
        ong đối với sức khỏe và các phương pháp để có thể tận dụng được triệt
        để lợi ích của mật ong:
    </p><p><b>1. Làm đẹp da</b></p><div><img src="http://sohanews.sohacdn.com/2018/2/10/photo-1-15182342543041378086659.jpg"></div><p>
        Mật
        ong là một chất chống oxy hoá tuyệt vời, giúp thanh lọc cơ thể, loại bỏ
        nhiều chất độc khác nhau. Ngoài ra, do tính kháng khuẩn mạnh mẽ nên nó
        sẽ giúp cải thiện đáng kể tình trạng da, giúp da tươi sáng, căng tràn
        sức sống và luôn khỏe mạnh.
    </p><p><b>2. Hỗ trợ giảm cân</b></p><p>
        Nếu
        đang trong chế độ giảm cân, bạn nên loại bỏ tất cả các loại đồ ngọt có
        đường, trừ mật ong. Vì lượng đường có trong mật ong chứa thành phần khác
        với chất tạo ngọt thường.
    </p><p>
        Ít ai biết rằng khoảng 70% lượng đường
        của mật ong là đường tự nhiên, và chưa tới 5% còn lại là loại đường
        giống với đường chúng ta vẫn ăn hằng ngày.
    </p><img src="http://sohanews.sohacdn.com/2018/2/10/photo-1-1518234255097789679822.jpg" />
        <p>
            Do
            đó, mật ong vẫn giải quyết được các nhu cầu thèm ngọt hàng ngày nhưng
            vẫn đảm bảo được lượng calo hấp thụ chỉ bằng 64% so với các loại nước
            ngọt có gas. Đồng thời còn giúp tăng cường sự trao đổi chất, điều này
            rất cần thiết cho việc giảm cân.
        </p>
   <p><b>3. Giảm cholesterol</b></p><p>
        Mật
        ong không có cholesterol. Ngược lại thành phần cấu tạo và vitamin của
        mật ong góp phần làm  giảm mức cholesterol. Tiêu thụ mật ong hàng ngày
        rất có lợi cho việc tăng các hợp chất chống oxy hoá trong cơ thể và có
        thể chống lại lượng cholesterol dư thừa.
    </p><img src="http://sohanews.sohacdn.com/2018/2/10/photo-2-15182342550991575497251-15182348641831341350506.png" />
        <p>
            Vitamin
            C, E và Pinocembrin là 2 chất chống oxy hóa tự nhiên tuyệt vời có trong
            mật ong. Những chất này có tác dụng rất tốt trong việc ngăn chặn và
            giảm nguy cơ mắc bệnh tim ở người.
        </p>
    <p>
        Các nghiên cứu đã cho thấy rằng
        các chất chống oxy hoá có trong mật ong có thể ngăn ngừa chứng hẹp động
        mạch gây suy tim, suy giảm trí nhớ, hoặc nhức đầu. Vì vậy, uống một ly
        nước với vài muỗng mật ong mỗi ngày sẽ là một biện pháp tốt để ngăn ngừa
        nguy cơ mắc các bệnh về tim mạch.
    </p><p><b>5. Cải thiện trí nhớ</b></p><p>
        Các
        nghiên cứu khác đã cho thấy khả năng chống lại stress của mật ong, khôi
        phục lại hệ thống phòng chống oxy hóa của tế bào, và kết quả là cải
        thiện trí nhớ . Ngoài ra, canxi chứa trong mật ong dễ dàng được não hấp
        thụ, đem lại lợi ích cho các quá trình hoạt động, chuyển hóa của não bộ.
    </p><p><b>6. Tăng chất lượng giấc ngủ</b></p><p>
        Đường
        chứa trong mật ong làm tăng lượng insulin trong máu, giúp giải phóng
        serotonin. Serotonin được chuyển hóa thành melatonin, một loại hooc-môn
        giúp thúc đẩy giấc ngủ ngon hơn.
    </p><img src="http://sohanews.sohacdn.com/2018/2/10/photo-4-15182342551031753229726.jpg" /><p>
        Mật
        ong là một chất khử trùng mạnh, do đó bạn nên ăn một thìa mật ong mỗi
        sáng khi dạ dày còn rỗng. Phương pháp đơn giản này sẽ giúp bạn ngăn ngừa
        được các bệnh khác nhau liên quan đến đường tiêu hóa. Bên cạnh đó, khi
        mật ong đi qua dạ dày, nó sẽ giúp tiêu diệt vi trùng và chữa lành các
        vết thương nhỏ trong niêm mạc.
    </p><p><b>8. Làm giảm căng thẳng, mệt mỏi, stress</b></p><p>
        Điều
        này nghe có vẻ kỳ quặc, nhưng thực tế đúng là vậy. Mật ong giúp làm dịu
        các dây thần kinh và giảm bớt mệt mỏi . Glucose chứa trong mật ong rất
        cần thiết cho hoạt động của các nơ-ron thần kinh. Nó được hấp thụ nhanh
        chóng vào trong máu, làm cho việc thư giãn và giảm các rối loạn tâm lý
        trở nên hiệu quả hơn.
    </p><p>
        Khi kết hợp với một loại thuốc tự nhiên khác
        có tính chất khử trùng và chữa bệnh mạnh mẽ như tỏi, sức mạnh của mật
        ong sẽ tăng lên gấp 10 lần. Hỗn hợp mật ong và tỏi sẽ giúp tăng cường hệ
        thống miễn dịch của cơ thể và giúp cơ thể luôn trong tình trạng khỏe
        mạnh.
    </p><p>Dưới đây là một số công thức kết hợp giữa mật ong và tỏi để có thể mang lại lợi ích tốt nhất.</p>
    <img src="http://sohanews.sohacdn.com/2018/2/10/photo-6-15182342551081594171965-15182348575251696427355.png" /><p>
        Tách
        các nhánh tỏi và loại bỏ lớp vỏ ngoài của chúng. Đặt chúng vào trong
        bình, rồi đổ mật ong lên. Bỏ bớt bong bóng nếu cần. Đậy nắp và đợi trong
        vài ngày. Uống 1 thìa hỗn hợp mỗi ngày khi dạ dày còn rỗng, bạn sẽ cảm
        thấy cơ thể tràn đầy sức sống và khỏe mạnh hơn bao giờ hết.
    </p>
    <div id="admzone480455"><div id="ads_zone480455"><div id="ads_zone480455_slot1"><div id="ads_zone480455_banner554187" class="banner0" style="display: none;"><div id="sspbid_3308"><iframe id="ads-place-3308" style="border: 0px none; margin: 0px; padding: 0px;" src="javascript:void(0)" width="0" height="0"></iframe></div></div></div> </div></div><p><b>Công thức 2:</b></p><p><b><i>Thành phần</i></b></p><p>- 4 nắm tay tỏi cắt nhỏ</p><p>- 1 củ hành tây cắt nhỏ</p><p>- 2 quả ớt đỏ cắt nhỏ</p><p>- 1 muỗng canh gừng xắt nhỏ</p><p>- 1 quả chanh</p><p>- 1 thìa cà phê dấm táo</p><p>- 1 bình 500ml.</p><p><b><i>Cách làm</i></b></p><p>
        Cho
        hành tây cắt nhỏ vào dưới cùng của bình. Sau đó thêm tỏi và ớt. Tiếp
        theo cho gừng xắt nhỏ và từ từ đổ nước chanh vào bình. Ở trên cùng, thêm
        một thìa cà phê dấm táo và đóng bình thật chặt. Để thừa một khoảng
        không gian để hỗn hợp có thể lên men. Cất giữ bình ở nơi tối, thoáng mát
        và sử dụng thường xuyên hoặc cho đến khi tất cả các triệu chứng của bạn
        đã biến mất.
    </p><p style="text-align: right;"><i>*Theo Life Advencer, Brightside</i></p>

', NULL, NULL, NULL, N'', N'-1', N'', CAST(N'2018-08-05T13:40:24.783' AS DateTime), N'', 1, N'', N'', NULL)
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [TenSP], [Mota], [Gia], [GiaGiam], [HinhAnh], [HinhAnhThem], [TrangThai], [TonKho], [BanChay], [Moi], [Hot], [KhuyenMai], [ChiTietSanPham], [BaoHanh], [TopHot], [DaCoVAT], [TieuDeMeta], [IDMenuCha], [TieuDeSeo], [NgayTao], [NguoiTao], [HienThiTrenTrangChu], [MetaKeyWord], [MeTaDescription], [SoLuotXem]) VALUES (8, 2, N'Mật ong nguyên chất 8', N'
Mật ong là một thứ nguyên liệu dễ kiếm và dễ sử dụng. Đồng thời, nó cũng có rất nhiều lợi ích đối với sức khỏe con người .
', 120000.0000, 110000.0000, N'/Content/Upload/SanPham/MatOng/8.jpg', NULL, 1, 100, 1, 1, 1, 1, N'

    <p>
       <b>Mật ong</b>
        là một thứ nguyên liệu dễ kiếm và dễ sử dụng. Đồng thời, nó cũng có rất
        nhiều lợi ích đối với sức khỏe con người. Dưới đây là những lợi của mật
        ong đối với sức khỏe và các phương pháp để có thể tận dụng được triệt
        để lợi ích của mật ong:
    </p><p><b>1. Làm đẹp da</b></p><div><img src="http://sohanews.sohacdn.com/2018/2/10/photo-1-15182342543041378086659.jpg"></div><p>
        Mật
        ong là một chất chống oxy hoá tuyệt vời, giúp thanh lọc cơ thể, loại bỏ
        nhiều chất độc khác nhau. Ngoài ra, do tính kháng khuẩn mạnh mẽ nên nó
        sẽ giúp cải thiện đáng kể tình trạng da, giúp da tươi sáng, căng tràn
        sức sống và luôn khỏe mạnh.
    </p><p><b>2. Hỗ trợ giảm cân</b></p><p>
        Nếu
        đang trong chế độ giảm cân, bạn nên loại bỏ tất cả các loại đồ ngọt có
        đường, trừ mật ong. Vì lượng đường có trong mật ong chứa thành phần khác
        với chất tạo ngọt thường.
    </p><p>
        Ít ai biết rằng khoảng 70% lượng đường
        của mật ong là đường tự nhiên, và chưa tới 5% còn lại là loại đường
        giống với đường chúng ta vẫn ăn hằng ngày.
    </p><img src="http://sohanews.sohacdn.com/2018/2/10/photo-1-1518234255097789679822.jpg" />
        <p>
            Do
            đó, mật ong vẫn giải quyết được các nhu cầu thèm ngọt hàng ngày nhưng
            vẫn đảm bảo được lượng calo hấp thụ chỉ bằng 64% so với các loại nước
            ngọt có gas. Đồng thời còn giúp tăng cường sự trao đổi chất, điều này
            rất cần thiết cho việc giảm cân.
        </p>
   <p><b>3. Giảm cholesterol</b></p><p>
        Mật
        ong không có cholesterol. Ngược lại thành phần cấu tạo và vitamin của
        mật ong góp phần làm  giảm mức cholesterol. Tiêu thụ mật ong hàng ngày
        rất có lợi cho việc tăng các hợp chất chống oxy hoá trong cơ thể và có
        thể chống lại lượng cholesterol dư thừa.
    </p><img src="http://sohanews.sohacdn.com/2018/2/10/photo-2-15182342550991575497251-15182348641831341350506.png" />
        <p>
            Vitamin
            C, E và Pinocembrin là 2 chất chống oxy hóa tự nhiên tuyệt vời có trong
            mật ong. Những chất này có tác dụng rất tốt trong việc ngăn chặn và
            giảm nguy cơ mắc bệnh tim ở người.
        </p>
    <p>
        Các nghiên cứu đã cho thấy rằng
        các chất chống oxy hoá có trong mật ong có thể ngăn ngừa chứng hẹp động
        mạch gây suy tim, suy giảm trí nhớ, hoặc nhức đầu. Vì vậy, uống một ly
        nước với vài muỗng mật ong mỗi ngày sẽ là một biện pháp tốt để ngăn ngừa
        nguy cơ mắc các bệnh về tim mạch.
    </p><p><b>5. Cải thiện trí nhớ</b></p><p>
        Các
        nghiên cứu khác đã cho thấy khả năng chống lại stress của mật ong, khôi
        phục lại hệ thống phòng chống oxy hóa của tế bào, và kết quả là cải
        thiện trí nhớ . Ngoài ra, canxi chứa trong mật ong dễ dàng được não hấp
        thụ, đem lại lợi ích cho các quá trình hoạt động, chuyển hóa của não bộ.
    </p><p><b>6. Tăng chất lượng giấc ngủ</b></p><p>
        Đường
        chứa trong mật ong làm tăng lượng insulin trong máu, giúp giải phóng
        serotonin. Serotonin được chuyển hóa thành melatonin, một loại hooc-môn
        giúp thúc đẩy giấc ngủ ngon hơn.
    </p><img src="http://sohanews.sohacdn.com/2018/2/10/photo-4-15182342551031753229726.jpg" /><p>
        Mật
        ong là một chất khử trùng mạnh, do đó bạn nên ăn một thìa mật ong mỗi
        sáng khi dạ dày còn rỗng. Phương pháp đơn giản này sẽ giúp bạn ngăn ngừa
        được các bệnh khác nhau liên quan đến đường tiêu hóa. Bên cạnh đó, khi
        mật ong đi qua dạ dày, nó sẽ giúp tiêu diệt vi trùng và chữa lành các
        vết thương nhỏ trong niêm mạc.
    </p><p><b>8. Làm giảm căng thẳng, mệt mỏi, stress</b></p><p>
        Điều
        này nghe có vẻ kỳ quặc, nhưng thực tế đúng là vậy. Mật ong giúp làm dịu
        các dây thần kinh và giảm bớt mệt mỏi . Glucose chứa trong mật ong rất
        cần thiết cho hoạt động của các nơ-ron thần kinh. Nó được hấp thụ nhanh
        chóng vào trong máu, làm cho việc thư giãn và giảm các rối loạn tâm lý
        trở nên hiệu quả hơn.
    </p><p>
        Khi kết hợp với một loại thuốc tự nhiên khác
        có tính chất khử trùng và chữa bệnh mạnh mẽ như tỏi, sức mạnh của mật
        ong sẽ tăng lên gấp 10 lần. Hỗn hợp mật ong và tỏi sẽ giúp tăng cường hệ
        thống miễn dịch của cơ thể và giúp cơ thể luôn trong tình trạng khỏe
        mạnh.
    </p><p>Dưới đây là một số công thức kết hợp giữa mật ong và tỏi để có thể mang lại lợi ích tốt nhất.</p>
    <img src="http://sohanews.sohacdn.com/2018/2/10/photo-6-15182342551081594171965-15182348575251696427355.png" /><p>
        Tách
        các nhánh tỏi và loại bỏ lớp vỏ ngoài của chúng. Đặt chúng vào trong
        bình, rồi đổ mật ong lên. Bỏ bớt bong bóng nếu cần. Đậy nắp và đợi trong
        vài ngày. Uống 1 thìa hỗn hợp mỗi ngày khi dạ dày còn rỗng, bạn sẽ cảm
        thấy cơ thể tràn đầy sức sống và khỏe mạnh hơn bao giờ hết.
    </p>
    <div id="admzone480455"><div id="ads_zone480455"><div id="ads_zone480455_slot1"><div id="ads_zone480455_banner554187" class="banner0" style="display: none;"><div id="sspbid_3308"><iframe id="ads-place-3308" style="border: 0px none; margin: 0px; padding: 0px;" src="javascript:void(0)" width="0" height="0"></iframe></div></div></div> </div></div><p><b>Công thức 2:</b></p><p><b><i>Thành phần</i></b></p><p>- 4 nắm tay tỏi cắt nhỏ</p><p>- 1 củ hành tây cắt nhỏ</p><p>- 2 quả ớt đỏ cắt nhỏ</p><p>- 1 muỗng canh gừng xắt nhỏ</p><p>- 1 quả chanh</p><p>- 1 thìa cà phê dấm táo</p><p>- 1 bình 500ml.</p><p><b><i>Cách làm</i></b></p><p>
        Cho
        hành tây cắt nhỏ vào dưới cùng của bình. Sau đó thêm tỏi và ớt. Tiếp
        theo cho gừng xắt nhỏ và từ từ đổ nước chanh vào bình. Ở trên cùng, thêm
        một thìa cà phê dấm táo và đóng bình thật chặt. Để thừa một khoảng
        không gian để hỗn hợp có thể lên men. Cất giữ bình ở nơi tối, thoáng mát
        và sử dụng thường xuyên hoặc cho đến khi tất cả các triệu chứng của bạn
        đã biến mất.
    </p><p style="text-align: right;"><i>*Theo Life Advencer, Brightside</i></p>

', NULL, NULL, NULL, N'', N'-1', N'', CAST(N'2018-08-05T13:40:24.783' AS DateTime), N'', 1, N'', N'', NULL)
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [TenSP], [Mota], [Gia], [GiaGiam], [HinhAnh], [HinhAnhThem], [TrangThai], [TonKho], [BanChay], [Moi], [Hot], [KhuyenMai], [ChiTietSanPham], [BaoHanh], [TopHot], [DaCoVAT], [TieuDeMeta], [IDMenuCha], [TieuDeSeo], [NgayTao], [NguoiTao], [HienThiTrenTrangChu], [MetaKeyWord], [MeTaDescription], [SoLuotXem]) VALUES (9, 2, N'Mật ong nguyên chất 9', N'
Mật ong là một thứ nguyên liệu dễ kiếm và dễ sử dụng. Đồng thời, nó cũng có rất nhiều lợi ích đối với sức khỏe con người .
', 120000.0000, 110000.0000, N'/Content/Upload/SanPham/MatOng/9.jpg', NULL, 1, 100, 1, 1, 1, 1, N'

    <p>
       <b>Mật ong</b>
        là một thứ nguyên liệu dễ kiếm và dễ sử dụng. Đồng thời, nó cũng có rất
        nhiều lợi ích đối với sức khỏe con người. Dưới đây là những lợi của mật
        ong đối với sức khỏe và các phương pháp để có thể tận dụng được triệt
        để lợi ích của mật ong:
    </p><p><b>1. Làm đẹp da</b></p><div><img src="http://sohanews.sohacdn.com/2018/2/10/photo-1-15182342543041378086659.jpg"></div><p>
        Mật
        ong là một chất chống oxy hoá tuyệt vời, giúp thanh lọc cơ thể, loại bỏ
        nhiều chất độc khác nhau. Ngoài ra, do tính kháng khuẩn mạnh mẽ nên nó
        sẽ giúp cải thiện đáng kể tình trạng da, giúp da tươi sáng, căng tràn
        sức sống và luôn khỏe mạnh.
    </p><p><b>2. Hỗ trợ giảm cân</b></p><p>
        Nếu
        đang trong chế độ giảm cân, bạn nên loại bỏ tất cả các loại đồ ngọt có
        đường, trừ mật ong. Vì lượng đường có trong mật ong chứa thành phần khác
        với chất tạo ngọt thường.
    </p><p>
        Ít ai biết rằng khoảng 70% lượng đường
        của mật ong là đường tự nhiên, và chưa tới 5% còn lại là loại đường
        giống với đường chúng ta vẫn ăn hằng ngày.
    </p><img src="http://sohanews.sohacdn.com/2018/2/10/photo-1-1518234255097789679822.jpg" />
        <p>
            Do
            đó, mật ong vẫn giải quyết được các nhu cầu thèm ngọt hàng ngày nhưng
            vẫn đảm bảo được lượng calo hấp thụ chỉ bằng 64% so với các loại nước
            ngọt có gas. Đồng thời còn giúp tăng cường sự trao đổi chất, điều này
            rất cần thiết cho việc giảm cân.
        </p>
   <p><b>3. Giảm cholesterol</b></p><p>
        Mật
        ong không có cholesterol. Ngược lại thành phần cấu tạo và vitamin của
        mật ong góp phần làm  giảm mức cholesterol. Tiêu thụ mật ong hàng ngày
        rất có lợi cho việc tăng các hợp chất chống oxy hoá trong cơ thể và có
        thể chống lại lượng cholesterol dư thừa.
    </p><img src="http://sohanews.sohacdn.com/2018/2/10/photo-2-15182342550991575497251-15182348641831341350506.png" />
        <p>
            Vitamin
            C, E và Pinocembrin là 2 chất chống oxy hóa tự nhiên tuyệt vời có trong
            mật ong. Những chất này có tác dụng rất tốt trong việc ngăn chặn và
            giảm nguy cơ mắc bệnh tim ở người.
        </p>
    <p>
        Các nghiên cứu đã cho thấy rằng
        các chất chống oxy hoá có trong mật ong có thể ngăn ngừa chứng hẹp động
        mạch gây suy tim, suy giảm trí nhớ, hoặc nhức đầu. Vì vậy, uống một ly
        nước với vài muỗng mật ong mỗi ngày sẽ là một biện pháp tốt để ngăn ngừa
        nguy cơ mắc các bệnh về tim mạch.
    </p><p><b>5. Cải thiện trí nhớ</b></p><p>
        Các
        nghiên cứu khác đã cho thấy khả năng chống lại stress của mật ong, khôi
        phục lại hệ thống phòng chống oxy hóa của tế bào, và kết quả là cải
        thiện trí nhớ . Ngoài ra, canxi chứa trong mật ong dễ dàng được não hấp
        thụ, đem lại lợi ích cho các quá trình hoạt động, chuyển hóa của não bộ.
    </p><p><b>6. Tăng chất lượng giấc ngủ</b></p><p>
        Đường
        chứa trong mật ong làm tăng lượng insulin trong máu, giúp giải phóng
        serotonin. Serotonin được chuyển hóa thành melatonin, một loại hooc-môn
        giúp thúc đẩy giấc ngủ ngon hơn.
    </p><img src="http://sohanews.sohacdn.com/2018/2/10/photo-4-15182342551031753229726.jpg" /><p>
        Mật
        ong là một chất khử trùng mạnh, do đó bạn nên ăn một thìa mật ong mỗi
        sáng khi dạ dày còn rỗng. Phương pháp đơn giản này sẽ giúp bạn ngăn ngừa
        được các bệnh khác nhau liên quan đến đường tiêu hóa. Bên cạnh đó, khi
        mật ong đi qua dạ dày, nó sẽ giúp tiêu diệt vi trùng và chữa lành các
        vết thương nhỏ trong niêm mạc.
    </p><p><b>8. Làm giảm căng thẳng, mệt mỏi, stress</b></p><p>
        Điều
        này nghe có vẻ kỳ quặc, nhưng thực tế đúng là vậy. Mật ong giúp làm dịu
        các dây thần kinh và giảm bớt mệt mỏi . Glucose chứa trong mật ong rất
        cần thiết cho hoạt động của các nơ-ron thần kinh. Nó được hấp thụ nhanh
        chóng vào trong máu, làm cho việc thư giãn và giảm các rối loạn tâm lý
        trở nên hiệu quả hơn.
    </p><p>
        Khi kết hợp với một loại thuốc tự nhiên khác
        có tính chất khử trùng và chữa bệnh mạnh mẽ như tỏi, sức mạnh của mật
        ong sẽ tăng lên gấp 10 lần. Hỗn hợp mật ong và tỏi sẽ giúp tăng cường hệ
        thống miễn dịch của cơ thể và giúp cơ thể luôn trong tình trạng khỏe
        mạnh.
    </p><p>Dưới đây là một số công thức kết hợp giữa mật ong và tỏi để có thể mang lại lợi ích tốt nhất.</p>
    <img src="http://sohanews.sohacdn.com/2018/2/10/photo-6-15182342551081594171965-15182348575251696427355.png" /><p>
        Tách
        các nhánh tỏi và loại bỏ lớp vỏ ngoài của chúng. Đặt chúng vào trong
        bình, rồi đổ mật ong lên. Bỏ bớt bong bóng nếu cần. Đậy nắp và đợi trong
        vài ngày. Uống 1 thìa hỗn hợp mỗi ngày khi dạ dày còn rỗng, bạn sẽ cảm
        thấy cơ thể tràn đầy sức sống và khỏe mạnh hơn bao giờ hết.
    </p>
    <div id="admzone480455"><div id="ads_zone480455"><div id="ads_zone480455_slot1"><div id="ads_zone480455_banner554187" class="banner0" style="display: none;"><div id="sspbid_3308"><iframe id="ads-place-3308" style="border: 0px none; margin: 0px; padding: 0px;" src="javascript:void(0)" width="0" height="0"></iframe></div></div></div> </div></div><p><b>Công thức 2:</b></p><p><b><i>Thành phần</i></b></p><p>- 4 nắm tay tỏi cắt nhỏ</p><p>- 1 củ hành tây cắt nhỏ</p><p>- 2 quả ớt đỏ cắt nhỏ</p><p>- 1 muỗng canh gừng xắt nhỏ</p><p>- 1 quả chanh</p><p>- 1 thìa cà phê dấm táo</p><p>- 1 bình 500ml.</p><p><b><i>Cách làm</i></b></p><p>
        Cho
        hành tây cắt nhỏ vào dưới cùng của bình. Sau đó thêm tỏi và ớt. Tiếp
        theo cho gừng xắt nhỏ và từ từ đổ nước chanh vào bình. Ở trên cùng, thêm
        một thìa cà phê dấm táo và đóng bình thật chặt. Để thừa một khoảng
        không gian để hỗn hợp có thể lên men. Cất giữ bình ở nơi tối, thoáng mát
        và sử dụng thường xuyên hoặc cho đến khi tất cả các triệu chứng của bạn
        đã biến mất.
    </p><p style="text-align: right;"><i>*Theo Life Advencer, Brightside</i></p>

', NULL, NULL, NULL, N'', N'-1', N'', CAST(N'2018-08-05T13:40:24.783' AS DateTime), N'', 1, N'', N'', NULL)
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [TenSP], [Mota], [Gia], [GiaGiam], [HinhAnh], [HinhAnhThem], [TrangThai], [TonKho], [BanChay], [Moi], [Hot], [KhuyenMai], [ChiTietSanPham], [BaoHanh], [TopHot], [DaCoVAT], [TieuDeMeta], [IDMenuCha], [TieuDeSeo], [NgayTao], [NguoiTao], [HienThiTrenTrangChu], [MetaKeyWord], [MeTaDescription], [SoLuotXem]) VALUES (10, 2, N'Mật ong nguyên chất 10', N'
Mật ong là một thứ nguyên liệu dễ kiếm và dễ sử dụng. Đồng thời, nó cũng có rất nhiều lợi ích đối với sức khỏe con người .
', 120000.0000, 110000.0000, N'/Content/Upload/SanPham/MatOng/10.jpg', NULL, 1, 100, 1, 1, 1, 1, N'

    <p>
       <b>Mật ong</b>
        là một thứ nguyên liệu dễ kiếm và dễ sử dụng. Đồng thời, nó cũng có rất
        nhiều lợi ích đối với sức khỏe con người. Dưới đây là những lợi của mật
        ong đối với sức khỏe và các phương pháp để có thể tận dụng được triệt
        để lợi ích của mật ong:
    </p><p><b>1. Làm đẹp da</b></p><div><img src="http://sohanews.sohacdn.com/2018/2/10/photo-1-15182342543041378086659.jpg"></div><p>
        Mật
        ong là một chất chống oxy hoá tuyệt vời, giúp thanh lọc cơ thể, loại bỏ
        nhiều chất độc khác nhau. Ngoài ra, do tính kháng khuẩn mạnh mẽ nên nó
        sẽ giúp cải thiện đáng kể tình trạng da, giúp da tươi sáng, căng tràn
        sức sống và luôn khỏe mạnh.
    </p><p><b>2. Hỗ trợ giảm cân</b></p><p>
        Nếu
        đang trong chế độ giảm cân, bạn nên loại bỏ tất cả các loại đồ ngọt có
        đường, trừ mật ong. Vì lượng đường có trong mật ong chứa thành phần khác
        với chất tạo ngọt thường.
    </p><p>
        Ít ai biết rằng khoảng 70% lượng đường
        của mật ong là đường tự nhiên, và chưa tới 5% còn lại là loại đường
        giống với đường chúng ta vẫn ăn hằng ngày.
    </p><img src="http://sohanews.sohacdn.com/2018/2/10/photo-1-1518234255097789679822.jpg" />
        <p>
            Do
            đó, mật ong vẫn giải quyết được các nhu cầu thèm ngọt hàng ngày nhưng
            vẫn đảm bảo được lượng calo hấp thụ chỉ bằng 64% so với các loại nước
            ngọt có gas. Đồng thời còn giúp tăng cường sự trao đổi chất, điều này
            rất cần thiết cho việc giảm cân.
        </p>
   <p><b>3. Giảm cholesterol</b></p><p>
        Mật
        ong không có cholesterol. Ngược lại thành phần cấu tạo và vitamin của
        mật ong góp phần làm  giảm mức cholesterol. Tiêu thụ mật ong hàng ngày
        rất có lợi cho việc tăng các hợp chất chống oxy hoá trong cơ thể và có
        thể chống lại lượng cholesterol dư thừa.
    </p><img src="http://sohanews.sohacdn.com/2018/2/10/photo-2-15182342550991575497251-15182348641831341350506.png" />
        <p>
            Vitamin
            C, E và Pinocembrin là 2 chất chống oxy hóa tự nhiên tuyệt vời có trong
            mật ong. Những chất này có tác dụng rất tốt trong việc ngăn chặn và
            giảm nguy cơ mắc bệnh tim ở người.
        </p>
    <p>
        Các nghiên cứu đã cho thấy rằng
        các chất chống oxy hoá có trong mật ong có thể ngăn ngừa chứng hẹp động
        mạch gây suy tim, suy giảm trí nhớ, hoặc nhức đầu. Vì vậy, uống một ly
        nước với vài muỗng mật ong mỗi ngày sẽ là một biện pháp tốt để ngăn ngừa
        nguy cơ mắc các bệnh về tim mạch.
    </p><p><b>5. Cải thiện trí nhớ</b></p><p>
        Các
        nghiên cứu khác đã cho thấy khả năng chống lại stress của mật ong, khôi
        phục lại hệ thống phòng chống oxy hóa của tế bào, và kết quả là cải
        thiện trí nhớ . Ngoài ra, canxi chứa trong mật ong dễ dàng được não hấp
        thụ, đem lại lợi ích cho các quá trình hoạt động, chuyển hóa của não bộ.
    </p><p><b>6. Tăng chất lượng giấc ngủ</b></p><p>
        Đường
        chứa trong mật ong làm tăng lượng insulin trong máu, giúp giải phóng
        serotonin. Serotonin được chuyển hóa thành melatonin, một loại hooc-môn
        giúp thúc đẩy giấc ngủ ngon hơn.
    </p><img src="http://sohanews.sohacdn.com/2018/2/10/photo-4-15182342551031753229726.jpg" /><p>
        Mật
        ong là một chất khử trùng mạnh, do đó bạn nên ăn một thìa mật ong mỗi
        sáng khi dạ dày còn rỗng. Phương pháp đơn giản này sẽ giúp bạn ngăn ngừa
        được các bệnh khác nhau liên quan đến đường tiêu hóa. Bên cạnh đó, khi
        mật ong đi qua dạ dày, nó sẽ giúp tiêu diệt vi trùng và chữa lành các
        vết thương nhỏ trong niêm mạc.
    </p><p><b>8. Làm giảm căng thẳng, mệt mỏi, stress</b></p><p>
        Điều
        này nghe có vẻ kỳ quặc, nhưng thực tế đúng là vậy. Mật ong giúp làm dịu
        các dây thần kinh và giảm bớt mệt mỏi . Glucose chứa trong mật ong rất
        cần thiết cho hoạt động của các nơ-ron thần kinh. Nó được hấp thụ nhanh
        chóng vào trong máu, làm cho việc thư giãn và giảm các rối loạn tâm lý
        trở nên hiệu quả hơn.
    </p><p>
        Khi kết hợp với một loại thuốc tự nhiên khác
        có tính chất khử trùng và chữa bệnh mạnh mẽ như tỏi, sức mạnh của mật
        ong sẽ tăng lên gấp 10 lần. Hỗn hợp mật ong và tỏi sẽ giúp tăng cường hệ
        thống miễn dịch của cơ thể và giúp cơ thể luôn trong tình trạng khỏe
        mạnh.
    </p><p>Dưới đây là một số công thức kết hợp giữa mật ong và tỏi để có thể mang lại lợi ích tốt nhất.</p>
    <img src="http://sohanews.sohacdn.com/2018/2/10/photo-6-15182342551081594171965-15182348575251696427355.png" /><p>
        Tách
        các nhánh tỏi và loại bỏ lớp vỏ ngoài của chúng. Đặt chúng vào trong
        bình, rồi đổ mật ong lên. Bỏ bớt bong bóng nếu cần. Đậy nắp và đợi trong
        vài ngày. Uống 1 thìa hỗn hợp mỗi ngày khi dạ dày còn rỗng, bạn sẽ cảm
        thấy cơ thể tràn đầy sức sống và khỏe mạnh hơn bao giờ hết.
    </p>
    <div id="admzone480455"><div id="ads_zone480455"><div id="ads_zone480455_slot1"><div id="ads_zone480455_banner554187" class="banner0" style="display: none;"><div id="sspbid_3308"><iframe id="ads-place-3308" style="border: 0px none; margin: 0px; padding: 0px;" src="javascript:void(0)" width="0" height="0"></iframe></div></div></div> </div></div><p><b>Công thức 2:</b></p><p><b><i>Thành phần</i></b></p><p>- 4 nắm tay tỏi cắt nhỏ</p><p>- 1 củ hành tây cắt nhỏ</p><p>- 2 quả ớt đỏ cắt nhỏ</p><p>- 1 muỗng canh gừng xắt nhỏ</p><p>- 1 quả chanh</p><p>- 1 thìa cà phê dấm táo</p><p>- 1 bình 500ml.</p><p><b><i>Cách làm</i></b></p><p>
        Cho
        hành tây cắt nhỏ vào dưới cùng của bình. Sau đó thêm tỏi và ớt. Tiếp
        theo cho gừng xắt nhỏ và từ từ đổ nước chanh vào bình. Ở trên cùng, thêm
        một thìa cà phê dấm táo và đóng bình thật chặt. Để thừa một khoảng
        không gian để hỗn hợp có thể lên men. Cất giữ bình ở nơi tối, thoáng mát
        và sử dụng thường xuyên hoặc cho đến khi tất cả các triệu chứng của bạn
        đã biến mất.
    </p><p style="text-align: right;"><i>*Theo Life Advencer, Brightside</i></p>

', NULL, NULL, NULL, N'', N'-1', N'', CAST(N'2018-08-05T13:40:24.783' AS DateTime), N'', 1, N'', N'', NULL)
SET IDENTITY_INSERT [dbo].[SanPham] OFF
SET IDENTITY_INSERT [dbo].[Slider] ON 

INSERT [dbo].[Slider] ([ID], [HinhAnh], [ThuTu], [Link], [MoTa], [NgayTao], [NguoiTao]) VALUES (1, N'1.jpg', 0, N'', N'', CAST(N'2018-08-06T16:58:33.927' AS DateTime), N'admin                                             ')
INSERT [dbo].[Slider] ([ID], [HinhAnh], [ThuTu], [Link], [MoTa], [NgayTao], [NguoiTao]) VALUES (2, N'2.jpg', 1, N'', N'', CAST(N'2018-08-06T16:58:36.177' AS DateTime), N'admin                                             ')
INSERT [dbo].[Slider] ([ID], [HinhAnh], [ThuTu], [Link], [MoTa], [NgayTao], [NguoiTao]) VALUES (3, N'3.jpg', 2, N'', N'', CAST(N'2018-08-06T16:58:37.640' AS DateTime), N'admin                                             ')
INSERT [dbo].[Slider] ([ID], [HinhAnh], [ThuTu], [Link], [MoTa], [NgayTao], [NguoiTao]) VALUES (4, N'4.jpg', 3, N'', N'', CAST(N'2018-08-06T16:58:39.530' AS DateTime), N'admin                                             ')
INSERT [dbo].[Slider] ([ID], [HinhAnh], [ThuTu], [Link], [MoTa], [NgayTao], [NguoiTao]) VALUES (5, N'5.jpg', 4, N'', N'', CAST(N'2018-08-06T16:58:41.227' AS DateTime), N'admin                                             ')
INSERT [dbo].[Slider] ([ID], [HinhAnh], [ThuTu], [Link], [MoTa], [NgayTao], [NguoiTao]) VALUES (6, N'6.jpg', 5, N'', N'', CAST(N'2018-08-06T16:58:43.227' AS DateTime), N'admin                                             ')
SET IDENTITY_INSERT [dbo].[Slider] OFF
SET IDENTITY_INSERT [dbo].[TaiKhanMXH] ON 

INSERT [dbo].[TaiKhanMXH] ([ID], [Ten], [NoiDung], [IconLink]) VALUES (1, N'Zalo', N'0167.552.8766', N'zalo.png')
INSERT [dbo].[TaiKhanMXH] ([ID], [Ten], [NoiDung], [IconLink]) VALUES (2, N'Line', N'0167.552.8766', N'Line.png')
INSERT [dbo].[TaiKhanMXH] ([ID], [Ten], [NoiDung], [IconLink]) VALUES (3, N'Facebook', N'matongtamphat', N'FB.png')
INSERT [dbo].[TaiKhanMXH] ([ID], [Ten], [NoiDung], [IconLink]) VALUES (4, N'Instagram', N'0167.552.8766', N'Instagram.png')
INSERT [dbo].[TaiKhanMXH] ([ID], [Ten], [NoiDung], [IconLink]) VALUES (5, N'Google', N'0167.552.8766', N'GooglePlus.png')
INSERT [dbo].[TaiKhanMXH] ([ID], [Ten], [NoiDung], [IconLink]) VALUES (6, N'Skype', N'0167.552.8766', N'Skype.png')
INSERT [dbo].[TaiKhanMXH] ([ID], [Ten], [NoiDung], [IconLink]) VALUES (7, N'Email', N'MatOngTamPhat@gmail.com', N'mail.png')
SET IDENTITY_INSERT [dbo].[TaiKhanMXH] OFF
SET IDENTITY_INSERT [dbo].[TaiKhoanNganHang] ON 

INSERT [dbo].[TaiKhoanNganHang] ([ID], [NganHang], [ChuTaiKhoan], [SoTaiKhoan], [ChiNhanh]) VALUES (2, N'Sacombank', N'Nguyễn Văn Vương', N'0123456789                                                                                          ', N'Đà Lạt')
INSERT [dbo].[TaiKhoanNganHang] ([ID], [NganHang], [ChuTaiKhoan], [SoTaiKhoan], [ChiNhanh]) VALUES (3, N'BIDV', N'Nguyễn Văn Vương', N'0123456789                                                                                          ', N'Đà Lạt')
INSERT [dbo].[TaiKhoanNganHang] ([ID], [NganHang], [ChuTaiKhoan], [SoTaiKhoan], [ChiNhanh]) VALUES (4, N'VietcomBank', N'Nguyễn Văn Vương', N'0123456789                                                                                          ', N'Đà Lạt')
SET IDENTITY_INSERT [dbo].[TaiKhoanNganHang] OFF
ALTER TABLE [dbo].[ChinhSua] ADD  CONSTRAINT [DF_ThayDoi_NgaySua]  DEFAULT (getdate()) FOR [NgaySua]
GO
ALTER TABLE [dbo].[ChinhSua] ADD  CONSTRAINT [DF_ThayDoi_NguoiSua]  DEFAULT ('') FOR [NguoiSua]
GO
ALTER TABLE [dbo].[FeedBack] ADD  CONSTRAINT [DF_FeedBack_Ten]  DEFAULT ('') FOR [Ten]
GO
ALTER TABLE [dbo].[FeedBack] ADD  CONSTRAINT [DF_FeedBack_SDT]  DEFAULT ('') FOR [SDT]
GO
ALTER TABLE [dbo].[FeedBack] ADD  CONSTRAINT [DF_FeedBack_Email]  DEFAULT ('') FOR [Email]
GO
ALTER TABLE [dbo].[FeedBack] ADD  CONSTRAINT [DF_FeedBack_DiaChi]  DEFAULT ('') FOR [DiaChi]
GO
ALTER TABLE [dbo].[FeedBack] ADD  CONSTRAINT [DF_FeedBack_TieuDe]  DEFAULT ('') FOR [TieuDe]
GO
ALTER TABLE [dbo].[FeedBack] ADD  CONSTRAINT [DF_FeedBack_NoiDung]  DEFAULT ('') FOR [NoiDung]
GO
ALTER TABLE [dbo].[LoaiHang] ADD  CONSTRAINT [DF_LoaiHang_MoTa]  DEFAULT ('') FOR [MoTa]
GO
ALTER TABLE [dbo].[LoaiHang] ADD  CONSTRAINT [DF_LoaiHang_HinhAnh]  DEFAULT ('') FOR [HinhAnh]
GO
ALTER TABLE [dbo].[LoaiHang] ADD  CONSTRAINT [DF_LoaiHang_NoiBat]  DEFAULT ((0)) FOR [NoiBat]
GO
ALTER TABLE [dbo].[LoaiHang] ADD  CONSTRAINT [DF_LoaiHang_TieuDeMeta]  DEFAULT ('') FOR [TieuDeMeta]
GO
ALTER TABLE [dbo].[LoaiHang] ADD  CONSTRAINT [DF_LoaiHang_IDMenuCha]  DEFAULT ((-1)) FOR [IDMenuCha]
GO
ALTER TABLE [dbo].[LoaiHang] ADD  CONSTRAINT [DF_LoaiHang_TieuDeSeo]  DEFAULT ('') FOR [TieuDeSeo]
GO
ALTER TABLE [dbo].[LoaiHang] ADD  CONSTRAINT [DF_LoaiHang_NgayTao]  DEFAULT (getdate()) FOR [NgayTao]
GO
ALTER TABLE [dbo].[LoaiHang] ADD  CONSTRAINT [DF_LoaiHang_NguoiTao]  DEFAULT ('') FOR [NguoiTao]
GO
ALTER TABLE [dbo].[LoaiHang] ADD  CONSTRAINT [DF_LoaiHang_DaXoa]  DEFAULT ((0)) FOR [TrangThai]
GO
ALTER TABLE [dbo].[LoaiHang] ADD  CONSTRAINT [DF_LoaiHang_HienThiTrenTrangChu]  DEFAULT ((0)) FOR [HienThiTrenTrangChu]
GO
ALTER TABLE [dbo].[LoaiHang] ADD  CONSTRAINT [DF_LoaiHang_MetaKeyWord]  DEFAULT ('') FOR [MetaKeyWord]
GO
ALTER TABLE [dbo].[LoaiHang] ADD  CONSTRAINT [DF_LoaiHang_MeTaDescription]  DEFAULT ('') FOR [MeTaDescription]
GO
ALTER TABLE [dbo].[LoaiTinTuc] ADD  CONSTRAINT [DF_LoaiTinTuc_MoTa]  DEFAULT ('') FOR [MoTa]
GO
ALTER TABLE [dbo].[LoaiTinTuc] ADD  CONSTRAINT [DF_LoaiTinTuc_HinhAnh]  DEFAULT ('') FOR [HinhAnh]
GO
ALTER TABLE [dbo].[LoaiTinTuc] ADD  CONSTRAINT [DF_LoaiTinTuc_NoiBat]  DEFAULT ((0)) FOR [NoiBat]
GO
ALTER TABLE [dbo].[LoaiTinTuc] ADD  CONSTRAINT [DF_LoaiTinTuc_TieuDeMeta]  DEFAULT ('') FOR [TieuDeMeta]
GO
ALTER TABLE [dbo].[LoaiTinTuc] ADD  CONSTRAINT [DF_LoaiTinTuc_IDMenuCha]  DEFAULT ((-1)) FOR [IDMenuCha]
GO
ALTER TABLE [dbo].[LoaiTinTuc] ADD  CONSTRAINT [DF_LoaiTinTuc_TieuDeSeo]  DEFAULT ('') FOR [TieuDeSeo]
GO
ALTER TABLE [dbo].[LoaiTinTuc] ADD  CONSTRAINT [DF_LoaiTinTuc_NgayTao]  DEFAULT (getdate()) FOR [NgayTao]
GO
ALTER TABLE [dbo].[LoaiTinTuc] ADD  CONSTRAINT [DF_LoaiTinTuc_NguoiTao]  DEFAULT ('') FOR [NguoiTao]
GO
ALTER TABLE [dbo].[LoaiTinTuc] ADD  CONSTRAINT [DF_LoaiTinTuc_DaXoa]  DEFAULT ((0)) FOR [TrangThai]
GO
ALTER TABLE [dbo].[LoaiTinTuc] ADD  CONSTRAINT [DF_LoaiTinTuc_HienThiTrenTrangChu]  DEFAULT ((0)) FOR [HienThiTrenTrangChu]
GO
ALTER TABLE [dbo].[LoaiTinTuc] ADD  CONSTRAINT [DF_LoaiTinTuc_MetaKeyWord]  DEFAULT ('') FOR [MetaKeyWord]
GO
ALTER TABLE [dbo].[LoaiTinTuc] ADD  CONSTRAINT [DF_LoaiTinTuc_MeTaDescription]  DEFAULT ('') FOR [MeTaDescription]
GO
ALTER TABLE [dbo].[NguoiDung] ADD  CONSTRAINT [DF_NguoiDung_NgayTao]  DEFAULT (getdate()) FOR [NgayTao]
GO
ALTER TABLE [dbo].[SanPham] ADD  CONSTRAINT [DF_SanPham_Mota]  DEFAULT ('') FOR [Mota]
GO
ALTER TABLE [dbo].[SanPham] ADD  CONSTRAINT [DF_SanPham_Gia]  DEFAULT ((0)) FOR [Gia]
GO
ALTER TABLE [dbo].[SanPham] ADD  CONSTRAINT [DF_SanPham_GiaGiam]  DEFAULT ((0)) FOR [GiaGiam]
GO
ALTER TABLE [dbo].[SanPham] ADD  CONSTRAINT [DF_SanPham_HinhAnh]  DEFAULT ('') FOR [HinhAnh]
GO
ALTER TABLE [dbo].[SanPham] ADD  CONSTRAINT [DF_SanPham_TrangThai]  DEFAULT ((1)) FOR [TrangThai]
GO
ALTER TABLE [dbo].[SanPham] ADD  CONSTRAINT [DF_SanPham_TonKho]  DEFAULT ((100)) FOR [TonKho]
GO
ALTER TABLE [dbo].[SanPham] ADD  CONSTRAINT [DF_SanPham_BanChay]  DEFAULT ((1)) FOR [BanChay]
GO
ALTER TABLE [dbo].[SanPham] ADD  CONSTRAINT [DF_SanPham_Moi]  DEFAULT ((1)) FOR [Moi]
GO
ALTER TABLE [dbo].[SanPham] ADD  CONSTRAINT [DF_SanPham_Hot]  DEFAULT ((1)) FOR [Hot]
GO
ALTER TABLE [dbo].[SanPham] ADD  CONSTRAINT [DF_SanPham_KhuyenMai]  DEFAULT ((1)) FOR [KhuyenMai]
GO
ALTER TABLE [dbo].[SanPham] ADD  CONSTRAINT [DF_SanPham_ChiTietSanPham]  DEFAULT ('') FOR [ChiTietSanPham]
GO
ALTER TABLE [dbo].[SanPham] ADD  CONSTRAINT [DF_SanPham_BaoHanh]  DEFAULT ((0)) FOR [BaoHanh]
GO
ALTER TABLE [dbo].[SanPham] ADD  CONSTRAINT [DF_SanPham_TopHot]  DEFAULT (getdate()) FOR [TopHot]
GO
ALTER TABLE [dbo].[SanPham] ADD  CONSTRAINT [DF_SanPham_DaCoVAT]  DEFAULT ((1)) FOR [DaCoVAT]
GO
ALTER TABLE [dbo].[SanPham] ADD  CONSTRAINT [DF_SanPham_TieuDeMeta1]  DEFAULT ('') FOR [TieuDeMeta]
GO
ALTER TABLE [dbo].[SanPham] ADD  CONSTRAINT [DF_SanPham_IDMenuCha]  DEFAULT ((-1)) FOR [IDMenuCha]
GO
ALTER TABLE [dbo].[SanPham] ADD  CONSTRAINT [DF_SanPham_TieuDeSeo]  DEFAULT ('') FOR [TieuDeSeo]
GO
ALTER TABLE [dbo].[SanPham] ADD  CONSTRAINT [DF_SanPham_NgayTao]  DEFAULT (getdate()) FOR [NgayTao]
GO
ALTER TABLE [dbo].[SanPham] ADD  CONSTRAINT [DF_SanPham_NguoiTao]  DEFAULT ('') FOR [NguoiTao]
GO
ALTER TABLE [dbo].[SanPham] ADD  CONSTRAINT [DF_SanPham_HienThiTrenTrangChu]  DEFAULT ((0)) FOR [HienThiTrenTrangChu]
GO
ALTER TABLE [dbo].[SanPham] ADD  CONSTRAINT [DF_SanPham_MetaKeyWord]  DEFAULT ('') FOR [MetaKeyWord]
GO
ALTER TABLE [dbo].[SanPham] ADD  CONSTRAINT [DF_SanPham_MeTaDescription]  DEFAULT ('') FOR [MeTaDescription]
GO
ALTER TABLE [dbo].[SanPham] ADD  CONSTRAINT [DF_SanPham_SoLuotXem]  DEFAULT ((0)) FOR [SoLuotXem]
GO
ALTER TABLE [dbo].[Slider] ADD  CONSTRAINT [DF_Slider_HinhAnh]  DEFAULT ('') FOR [HinhAnh]
GO
ALTER TABLE [dbo].[Slider] ADD  CONSTRAINT [DF_Slider_ThuTu]  DEFAULT ((0)) FOR [ThuTu]
GO
ALTER TABLE [dbo].[Slider] ADD  CONSTRAINT [DF_Slider_Link]  DEFAULT ('') FOR [Link]
GO
ALTER TABLE [dbo].[Slider] ADD  CONSTRAINT [DF_Slider_MoTa]  DEFAULT ('') FOR [MoTa]
GO
ALTER TABLE [dbo].[Slider] ADD  CONSTRAINT [DF_Slider_NgayTao]  DEFAULT (getdate()) FOR [NgayTao]
GO
ALTER TABLE [dbo].[Slider] ADD  CONSTRAINT [DF_Slider_NguoiTao]  DEFAULT ('') FOR [NguoiTao]
GO
ALTER TABLE [dbo].[TinTuc] ADD  CONSTRAINT [DF_TinTuc_Mota]  DEFAULT ('') FOR [Mota]
GO
ALTER TABLE [dbo].[TinTuc] ADD  CONSTRAINT [DF_TinTuc_HinhAnh]  DEFAULT ('') FOR [HinhAnh]
GO
ALTER TABLE [dbo].[TinTuc] ADD  CONSTRAINT [DF_TinTuc_TrangThai]  DEFAULT ((1)) FOR [TrangThai]
GO
ALTER TABLE [dbo].[TinTuc] ADD  CONSTRAINT [DF_TinTuc_Hot]  DEFAULT ((1)) FOR [Hot]
GO
ALTER TABLE [dbo].[TinTuc] ADD  CONSTRAINT [DF_TinTuc_KhuyenMai]  DEFAULT ((1)) FOR [KhuyenMai]
GO
ALTER TABLE [dbo].[TinTuc] ADD  CONSTRAINT [DF_TinTuc_ChiTietSanPham]  DEFAULT ('') FOR [NoiDung]
GO
ALTER TABLE [dbo].[TinTuc] ADD  CONSTRAINT [DF_TinTuc_TopHot]  DEFAULT (getdate()) FOR [TopHot]
GO
ALTER TABLE [dbo].[TinTuc] ADD  CONSTRAINT [DF_TinTuc_TieuDeMeta]  DEFAULT ('') FOR [TieuDeMeta]
GO
ALTER TABLE [dbo].[TinTuc] ADD  CONSTRAINT [DF_TinTuc_IDMenuCha]  DEFAULT ((-1)) FOR [IDMenuCha]
GO
ALTER TABLE [dbo].[TinTuc] ADD  CONSTRAINT [DF_TinTuc_TieuDeSeo]  DEFAULT ('') FOR [TieuDeSeo]
GO
ALTER TABLE [dbo].[TinTuc] ADD  CONSTRAINT [DF_TinTuc_NgayTao]  DEFAULT (getdate()) FOR [NgayTao]
GO
ALTER TABLE [dbo].[TinTuc] ADD  CONSTRAINT [DF_TinTuc_NguoiTao]  DEFAULT ('') FOR [NguoiTao]
GO
ALTER TABLE [dbo].[TinTuc] ADD  CONSTRAINT [DF_TinTuc_HienThiTrenTrangChu]  DEFAULT ((0)) FOR [HienThiTrenTrangChu]
GO
ALTER TABLE [dbo].[TinTuc] ADD  CONSTRAINT [DF_TinTuc_MetaKeyWord]  DEFAULT ('') FOR [MetaKeyWord]
GO
ALTER TABLE [dbo].[TinTuc] ADD  CONSTRAINT [DF_TinTuc_MeTaDescription]  DEFAULT ('') FOR [MeTaDescription]
GO
ALTER TABLE [dbo].[TinTuc] ADD  CONSTRAINT [DF_TinTuc_SoLuotXem]  DEFAULT ((0)) FOR [SoLuotXem]
GO
ALTER TABLE [dbo].[TinTuc] ADD  CONSTRAINT [DF_TinTuc_Tags]  DEFAULT ('') FOR [Tags]
GO
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHoaDon_HoaDon] FOREIGN KEY([MaHD])
REFERENCES [dbo].[HoaDon] ([MaHD])
GO
ALTER TABLE [dbo].[ChiTietHoaDon] CHECK CONSTRAINT [FK_ChiTietHoaDon_HoaDon]
GO
ALTER TABLE [dbo].[PhienDangNhap]  WITH CHECK ADD  CONSTRAINT [FK_PhienDangNhap_NguoiDung] FOREIGN KEY([TenDangNhap])
REFERENCES [dbo].[NguoiDung] ([TenDangNhap])
GO
ALTER TABLE [dbo].[PhienDangNhap] CHECK CONSTRAINT [FK_PhienDangNhap_NguoiDung]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_LoaiHang] FOREIGN KEY([MaLoai])
REFERENCES [dbo].[LoaiHang] ([MaLoai])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_LoaiHang]
GO
/****** Object:  StoredProcedure [dbo].[Admin_Delete]    Script Date: 8/14/2018 3:05:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Admin_Delete]
AS
delete from ChiTietHoaDon
delete from HoaDon
delete from [dbo].[PhienDangNhap]
DBCC CHECKIDENT ('[ChiTietHoaDon]', RESEED, 0)
DBCC CHECKIDENT ('[HoaDon]', RESEED, 0);
DBCC CHECKIDENT ('[PhienDangNhap]', RESEED, 0);
delete from [dbo].[NguoiDung]
where [TenDangNhap]!='admin'
DBCC CHECKIDENT ('[PhienDangNhap]', RESEED, 2);
GO
