USE [QuanLiQuanAo]
GO
/****** Object:  Table [dbo].[ChiTietDonHang]    Script Date: 15/6/2019 1:25:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietDonHang](
	[MaDonHang] [int] NOT NULL,
	[MaQuanAo] [int] NOT NULL,
	[SoLuong] [int] NULL,
	[DonGia] [nchar](10) NULL,
 CONSTRAINT [PK_ChiTietDonHang] PRIMARY KEY CLUSTERED 
(
	[MaDonHang] ASC,
	[MaQuanAo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DonHang]    Script Date: 15/6/2019 1:25:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonHang](
	[MaDonHang] [int] IDENTITY(1,1) NOT NULL,
	[DaThanhToan] [int] NULL,
	[TinhTrangGiaoHang] [int] NULL,
	[NgayDat] [datetime] NULL,
	[NgayGiao] [datetime] NULL,
	[MaKH] [int] NULL,
 CONSTRAINT [PK_DonHang] PRIMARY KEY CLUSTERED 
(
	[MaDonHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 15/6/2019 1:25:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKH] [int] IDENTITY(1,1) NOT NULL,
	[TaiKhoan] [varchar](50) NULL,
	[MatKhau] [nvarchar](50) NULL,
	[Emai] [nvarchar](100) NULL,
	[DiaChi] [nvarchar](200) NULL,
	[DienThoai] [varchar](50) NULL,
	[GioiTinh] [nvarchar](50) NULL,
	[NgaySinh] [datetime] NULL,
	[HoTen] [varchar](50) NULL,
 CONSTRAINT [PK_KhachHang] PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LoaiQuanAo]    Script Date: 15/6/2019 1:25:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiQuanAo](
	[MaLoai] [int] IDENTITY(1,1) NOT NULL,
	[LoaiQuanAo] [nvarchar](50) NULL,
 CONSTRAINT [PK_LoaiQuanAo] PRIMARY KEY CLUSTERED 
(
	[MaLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NhaCungCap]    Script Date: 15/6/2019 1:25:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NhaCungCap](
	[MaNCC] [int] IDENTITY(1,1) NOT NULL,
	[TenNCC] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](200) NULL,
	[DienThoai] [varchar](50) NULL,
 CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED 
(
	[MaNCC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NhaSanXuat]    Script Date: 15/6/2019 1:25:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhaSanXuat](
	[MaNSX] [int] IDENTITY(1,1) NOT NULL,
	[TenNSX] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](50) NULL,
	[DienThoai] [nvarchar](50) NULL,
 CONSTRAINT [PK_NhaSanXuat] PRIMARY KEY CLUSTERED 
(
	[MaNSX] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[QuanAo]    Script Date: 15/6/2019 1:25:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuanAo](
	[MaQuanAo] [int] IDENTITY(1,1) NOT NULL,
	[TenQuanAo] [nvarchar](50) NULL,
	[GiaBan] [decimal](18, 0) NULL,
	[Anh] [nvarchar](50) NULL,
	[NgayNhap] [datetime] NULL,
	[SoLuongTon] [int] NULL,
	[MaLoai] [int] NULL,
	[MaNCC] [int] NULL,
	[MaNSX] [int] NULL,
 CONSTRAINT [PK_QuanAo] PRIMARY KEY CLUSTERED 
(
	[MaQuanAo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[KhachHang] ON 

INSERT [dbo].[KhachHang] ([MaKH], [TaiKhoan], [MatKhau], [Emai], [DiaChi], [DienThoai], [GioiTinh], [NgaySinh], [HoTen]) VALUES (1013, N'abc', N'123456', N'ndthang2403@gmail.com', N'HaNoi', N'0357958195', N'Nam', CAST(0x00008AE500000000 AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[KhachHang] OFF
SET IDENTITY_INSERT [dbo].[LoaiQuanAo] ON 

INSERT [dbo].[LoaiQuanAo] ([MaLoai], [LoaiQuanAo]) VALUES (1, N'Quần short')
INSERT [dbo].[LoaiQuanAo] ([MaLoai], [LoaiQuanAo]) VALUES (2, N'Quần dài')
INSERT [dbo].[LoaiQuanAo] ([MaLoai], [LoaiQuanAo]) VALUES (3, N'Áo khoác')
INSERT [dbo].[LoaiQuanAo] ([MaLoai], [LoaiQuanAo]) VALUES (1006, N'Áo len')
INSERT [dbo].[LoaiQuanAo] ([MaLoai], [LoaiQuanAo]) VALUES (1007, N'Áo nỉ chui đầu')
INSERT [dbo].[LoaiQuanAo] ([MaLoai], [LoaiQuanAo]) VALUES (1008, N'Áo phông')
INSERT [dbo].[LoaiQuanAo] ([MaLoai], [LoaiQuanAo]) VALUES (1009, N'Quần jeans')
INSERT [dbo].[LoaiQuanAo] ([MaLoai], [LoaiQuanAo]) VALUES (1010, N'Quần vải')
INSERT [dbo].[LoaiQuanAo] ([MaLoai], [LoaiQuanAo]) VALUES (1011, N'Quần khaki')
INSERT [dbo].[LoaiQuanAo] ([MaLoai], [LoaiQuanAo]) VALUES (1012, N'Áo sơ mi')
SET IDENTITY_INSERT [dbo].[LoaiQuanAo] OFF
SET IDENTITY_INSERT [dbo].[NhaCungCap] ON 

INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [DienThoai]) VALUES (1, N'NCC-HN', N'Hanoi', N'545156')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [DienThoai]) VALUES (2, N'NCC-HP', N'HaiPhong', N'124854')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [DienThoai]) VALUES (3, N'NCC-HCM', N'HCM', N'845454')
SET IDENTITY_INSERT [dbo].[NhaCungCap] OFF
SET IDENTITY_INSERT [dbo].[NhaSanXuat] ON 

INSERT [dbo].[NhaSanXuat] ([MaNSX], [TenNSX], [DiaChi], [DienThoai]) VALUES (1, N'Nike', NULL, N'213215')
INSERT [dbo].[NhaSanXuat] ([MaNSX], [TenNSX], [DiaChi], [DienThoai]) VALUES (2, N'Adidas', NULL, N'318484')
INSERT [dbo].[NhaSanXuat] ([MaNSX], [TenNSX], [DiaChi], [DienThoai]) VALUES (3, N'Puma', NULL, N'654548')
SET IDENTITY_INSERT [dbo].[NhaSanXuat] OFF
SET IDENTITY_INSERT [dbo].[QuanAo] ON 

INSERT [dbo].[QuanAo] ([MaQuanAo], [TenQuanAo], [GiaBan], [Anh], [NgayNhap], [SoLuongTon], [MaLoai], [MaNCC], [MaNSX]) VALUES (8, N'Quần short xanh', CAST(349000 AS Decimal(18, 0)), N'quanshortxanh.jpg', CAST(0x0000A87B00000000 AS DateTime), 99, 1, 1, 1)
INSERT [dbo].[QuanAo] ([MaQuanAo], [TenQuanAo], [GiaBan], [Anh], [NgayNhap], [SoLuongTon], [MaLoai], [MaNCC], [MaNSX]) VALUES (9, N'Quần dài', CAST(399000 AS Decimal(18, 0)), N'quandai.jpg', CAST(0x0000A72B00000000 AS DateTime), 99, 2, 3, 1)
INSERT [dbo].[QuanAo] ([MaQuanAo], [TenQuanAo], [GiaBan], [Anh], [NgayNhap], [SoLuongTon], [MaLoai], [MaNCC], [MaNSX]) VALUES (10, N'Áo khoác', CAST(599000 AS Decimal(18, 0)), N'aokhoac.jpg', CAST(0x0000AA7F00000000 AS DateTime), 99, 3, 2, 2)
INSERT [dbo].[QuanAo] ([MaQuanAo], [TenQuanAo], [GiaBan], [Anh], [NgayNhap], [SoLuongTon], [MaLoai], [MaNCC], [MaNSX]) VALUES (11, N'Quần short xám', CAST(199000 AS Decimal(18, 0)), N'quanshortxam.jpg', CAST(0x0000A7CE00000000 AS DateTime), 99, 1, 3, 3)
INSERT [dbo].[QuanAo] ([MaQuanAo], [TenQuanAo], [GiaBan], [Anh], [NgayNhap], [SoLuongTon], [MaLoai], [MaNCC], [MaNSX]) VALUES (1008, N'Áo len', CAST(599000 AS Decimal(18, 0)), N'aolen.jpg', CAST(0x0000AB1800000000 AS DateTime), 99, 1006, 2, 1)
INSERT [dbo].[QuanAo] ([MaQuanAo], [TenQuanAo], [GiaBan], [Anh], [NgayNhap], [SoLuongTon], [MaLoai], [MaNCC], [MaNSX]) VALUES (1009, N'Quần khaki', CAST(249000 AS Decimal(18, 0)), N'quankhaki.jpg', CAST(0x0000A98E00000000 AS DateTime), 99, 1011, 1, 3)
INSERT [dbo].[QuanAo] ([MaQuanAo], [TenQuanAo], [GiaBan], [Anh], [NgayNhap], [SoLuongTon], [MaLoai], [MaNCC], [MaNSX]) VALUES (1010, N'Quần jeans', CAST(399000 AS Decimal(18, 0)), N'quanjeans.jpg', CAST(0x0000AA4300000000 AS DateTime), 99, 1009, 3, 2)
INSERT [dbo].[QuanAo] ([MaQuanAo], [TenQuanAo], [GiaBan], [Anh], [NgayNhap], [SoLuongTon], [MaLoai], [MaNCC], [MaNSX]) VALUES (1011, N'Áo sơ mi', CAST(299000 AS Decimal(18, 0)), N'aosomi.jpg', CAST(0x0000A72F00000000 AS DateTime), 99, 1012, 1, 1)
INSERT [dbo].[QuanAo] ([MaQuanAo], [TenQuanAo], [GiaBan], [Anh], [NgayNhap], [SoLuongTon], [MaLoai], [MaNCC], [MaNSX]) VALUES (1012, N'Quần vải', CAST(449000 AS Decimal(18, 0)), N'quanvai.jpg', CAST(0x0000A95300000000 AS DateTime), 99, 1010, 2, 3)
SET IDENTITY_INSERT [dbo].[QuanAo] OFF
ALTER TABLE [dbo].[ChiTietDonHang]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietDonHang_DonHang] FOREIGN KEY([MaDonHang])
REFERENCES [dbo].[DonHang] ([MaDonHang])
GO
ALTER TABLE [dbo].[ChiTietDonHang] CHECK CONSTRAINT [FK_ChiTietDonHang_DonHang]
GO
ALTER TABLE [dbo].[ChiTietDonHang]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietDonHang_QuanAo] FOREIGN KEY([MaQuanAo])
REFERENCES [dbo].[QuanAo] ([MaQuanAo])
GO
ALTER TABLE [dbo].[ChiTietDonHang] CHECK CONSTRAINT [FK_ChiTietDonHang_QuanAo]
GO
ALTER TABLE [dbo].[DonHang]  WITH CHECK ADD  CONSTRAINT [FK_DonHang_KhachHang] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
GO
ALTER TABLE [dbo].[DonHang] CHECK CONSTRAINT [FK_DonHang_KhachHang]
GO
ALTER TABLE [dbo].[QuanAo]  WITH CHECK ADD  CONSTRAINT [FK_QuanAo_LoaiQuanAo] FOREIGN KEY([MaLoai])
REFERENCES [dbo].[LoaiQuanAo] ([MaLoai])
GO
ALTER TABLE [dbo].[QuanAo] CHECK CONSTRAINT [FK_QuanAo_LoaiQuanAo]
GO
ALTER TABLE [dbo].[QuanAo]  WITH CHECK ADD  CONSTRAINT [FK_QuanAo_NhaCungCap] FOREIGN KEY([MaNCC])
REFERENCES [dbo].[NhaCungCap] ([MaNCC])
GO
ALTER TABLE [dbo].[QuanAo] CHECK CONSTRAINT [FK_QuanAo_NhaCungCap]
GO
ALTER TABLE [dbo].[QuanAo]  WITH CHECK ADD  CONSTRAINT [FK_QuanAo_NhaSanXuat] FOREIGN KEY([MaNSX])
REFERENCES [dbo].[NhaSanXuat] ([MaNSX])
GO
ALTER TABLE [dbo].[QuanAo] CHECK CONSTRAINT [FK_QuanAo_NhaSanXuat]
GO
