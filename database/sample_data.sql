-- ===============================
-- RESET DATA (IDEMPOTENT)
-- ===============================

DELETE FROM HoaDon; DBCC CHECKIDENT ('HoaDon', RESEED, 0);
DELETE FROM ChiTietDonHang;
DELETE FROM DonHang; DBCC CHECKIDENT ('DonHang', RESEED, 0);
DELETE FROM SanPham; DBCC CHECKIDENT ('SanPham', RESEED, 0);
DELETE FROM LoaiSanPham; DBCC CHECKIDENT ('LoaiSanPham', RESEED, 0);
DELETE FROM NhanVien; DBCC CHECKIDENT ('NhanVien', RESEED, 0);
DELETE FROM KhachHang; DBCC CHECKIDENT ('KhachHang', RESEED, 0);
GO

-- ===============================
-- INSERT SAMPLE DATA
-- ===============================

INSERT INTO LoaiSanPham (TenLoai)
VALUES (N'Bánh mì'), (N'Bánh ngọt'), (N'Đồ uống');
GO

INSERT INTO NhanVien (TenNV, SDT, ChucVu, Luong)
VALUES
(N'Nguyễn Văn Tứ', '0984736580', N'Quản lý', 15000000),
(N'Nguyễn Thủy Tiên', '0981944163', N'Thu ngân', 9000000),
(N'Nguyễn Thị Thu Phương', '0975258491', N'Thu ngân', 9000000);
GO

INSERT INTO KhachHang (TenKH, SDT, DiaChi, DiemTichLuy)
VALUES
(N'Nguyễn Đức Khanh', '0865916107', N'Bắc Ninh', 50),
(N'Trần Thị Mai', '0915862774', N'Hà Nội', 120),
(N'Lê Văn Bình', '0364567361', N'Đại Bái', 90);
GO

INSERT INTO SanPham (TenSP, GiaBan, MaLoai)
VALUES
(N'Bánh mì thịt', 25000, 1),
(N'Bánh mì trứng', 20000, 1),
(N'Bánh su kem', 15000, 2),
(N'Cà phê sữa', 30000, 3);
GO

DECLARE @MaDH1 INT;
EXEC sp_TaoDonHang 1, 1, N'Mang về', @MaDH1 OUTPUT;

INSERT INTO ChiTietDonHang (MaDH, MaSP, SoLuong, DonGia)
VALUES (@MaDH1, 1, 2, 25000);
GO

INSERT INTO HoaDon (MaDH, HinhThucTT, TongTienThanhToan)
VALUES (@MaDH1, N'Tiền mặt', 50000);
GO

-- ===============================
-- SAMPLE QUERIES
-- ===============================

SELECT dbo.fn_TinhDoanhThuNgay(CAST(GETDATE() AS DATE)) AS DoanhThuHomNay;
GO
