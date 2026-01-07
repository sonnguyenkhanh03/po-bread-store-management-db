-- ===============================
-- TRIGGERS
-- ===============================

CREATE TRIGGER trg_TichDiemKhachHang
ON HoaDon
AFTER INSERT
AS
BEGIN
    UPDATE KH
    SET KH.DiemTichLuy =
        KH.DiemTichLuy + CAST((I.TongTienThanhToan / 10000) AS INT)
    FROM KhachHang KH
    JOIN DonHang DH ON KH.MaKH = DH.MaKH
    JOIN inserted I ON DH.MaDH = I.MaDH
    WHERE DH.MaKH IS NOT NULL;
END;
GO

CREATE TRIGGER trg_CapNhatTongTienDonHang
ON ChiTietDonHang
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    UPDATE DH
    SET DH.TongTien = (
        SELECT ISNULL(SUM(ThanhTien), 0)
        FROM ChiTietDonHang
        WHERE MaDH = DH.MaDH
    )
    FROM DonHang DH
    WHERE DH.MaDH IN (
        SELECT MaDH FROM inserted
        UNION
        SELECT MaDH FROM deleted
    );
END;
GO
