-- ===============================
-- STORED PROCEDURES
-- ===============================

CREATE PROCEDURE sp_TaoDonHang
    @MaKH INT,
    @MaNV INT,
    @LoaiDon NVARCHAR(50),
    @MoiMaDH INT OUTPUT
AS
BEGIN
    INSERT INTO DonHang (MaKH, MaNV, LoaiDon)
    VALUES (@MaKH, @MaNV, @LoaiDon);

    SET @MoiMaDH = SCOPE_IDENTITY();
END;
GO
