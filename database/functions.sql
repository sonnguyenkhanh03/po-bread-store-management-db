-- ===============================
-- FUNCTIONS
-- ===============================

CREATE FUNCTION fn_TinhDoanhThuNgay (@NgayXem DATE)
RETURNS DECIMAL(10,2)
AS
BEGIN
    DECLARE @DoanhThu DECIMAL(10,2);

    SELECT @DoanhThu = ISNULL(SUM(TongTienThanhToan), 0)
    FROM HoaDon
    WHERE CAST(NgayLap AS DATE) = @NgayXem;

    RETURN @DoanhThu;
END;
GO
