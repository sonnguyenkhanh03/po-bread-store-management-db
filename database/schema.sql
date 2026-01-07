-- ===============================
-- SCHEMA: Tables & Constraints
-- ===============================

CREATE TABLE LoaiSanPham (
    MaLoai INT IDENTITY(1,1) PRIMARY KEY,
    TenLoai NVARCHAR(50) NOT NULL UNIQUE
);
GO

CREATE TABLE SanPham (
    MaSP INT IDENTITY(1,1) PRIMARY KEY,
    TenSP NVARCHAR(100) NOT NULL,
    GiaBan DECIMAL(10,2) NOT NULL CHECK (GiaBan >= 0),
    MaLoai INT,
    TrangThai NVARCHAR(50) DEFAULT N'Đang kinh doanh',
    CONSTRAINT FK_SanPham_LoaiSanPham
        FOREIGN KEY (MaLoai) REFERENCES LoaiSanPham(MaLoai)
);
GO

CREATE TABLE KhachHang (
    MaKH INT IDENTITY(1,1) PRIMARY KEY,
    TenKH NVARCHAR(100) NOT NULL,
    SDT CHAR(10) UNIQUE
        CHECK (SDT LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
    DiaChi NVARCHAR(200),
    DiemTichLuy INT DEFAULT 0 CHECK (DiemTichLuy >= 0)
);
GO

CREATE TABLE NhanVien (
    MaNV INT IDENTITY(1,1) PRIMARY KEY,
    TenNV NVARCHAR(100) NOT NULL,
    SDT CHAR(10) UNIQUE,
    ChucVu NVARCHAR(50),
    Luong DECIMAL(10,2) CHECK (Luong >= 0)
);
GO

CREATE TABLE DonHang (
    MaDH INT IDENTITY(1,1) PRIMARY KEY,
    NgayDat DATETIME DEFAULT GETDATE(),
    MaKH INT,
    MaNV INT NOT NULL,
    LoaiDon NVARCHAR(50),
    TrangThai NVARCHAR(50) DEFAULT N'Hoàn thành',
    TongTien DECIMAL(10,2) DEFAULT 0,
    CONSTRAINT FK_DonHang_KhachHang
        FOREIGN KEY (MaKH) REFERENCES KhachHang(MaKH),
    CONSTRAINT FK_DonHang_NhanVien
        FOREIGN KEY (MaNV) REFERENCES NhanVien(MaNV)
);
GO

CREATE TABLE ChiTietDonHang (
    MaDH INT,
    MaSP INT,
    SoLuong INT NOT NULL CHECK (SoLuong > 0),
    DonGia DECIMAL(10,2) NOT NULL,
    ThanhTien AS (SoLuong * DonGia) PERSISTED,
    PRIMARY KEY (MaDH, MaSP),
    CONSTRAINT FK_CTDH_DonHang
        FOREIGN KEY (MaDH) REFERENCES DonHang(MaDH),
    CONSTRAINT FK_CTDH_SanPham
        FOREIGN KEY (MaSP) REFERENCES SanPham(MaSP)
);
GO

CREATE TABLE HoaDon (
    MaHD INT IDENTITY(1,1) PRIMARY KEY,
    MaDH INT UNIQUE NOT NULL,
    NgayLap DATETIME DEFAULT GETDATE(),
    HinhThucTT NVARCHAR(50),
    TongTienThanhToan DECIMAL(10,2) NOT NULL CHECK (TongTienThanhToan > 0),
    CONSTRAINT FK_HoaDon_DonHang
        FOREIGN KEY (MaDH) REFERENCES DonHang(MaDH)
);
GO
