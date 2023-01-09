USE KhoIntech22
GO
-----------------------------------------------------
SELECT * FROM dbo.DSSANPHAM WHERE SoLuongTon > 0
GO
-----------------------------------------------------
CREATE TABLE  dbo.listXuat
(
	MaSp CHAR(25)  NOT NULL,
	SoLuong INT NOT NULL
)
GO
-----------------------------------------------------
CREATE PROC prInsertlistXuat
@maSp  char(25)
AS
BEGIN
	INSERT dbo.listXuat
	(
	    MaSp,
	    SoLuong
	)
	VALUES
	(   @maSp, -- MaSp - char(25)
	    0   -- SoLuong - int
	    )
	
END
GO
-----------------------------------------------------
CREATE PROC prUpdateListXuat
@MaSp  char(25),
@Soluong INT
AS
BEGIN
	UPDATE dbo.listXuat SET SoLuong = @Soluong WHERE MaSp = @MaSp
END
GO
-----------------------------------------------------
CREATE PROC prCheckSpXuat
@MaSp  char(25)
AS
BEGIN
	SELECT * FROM dbo.listXuat  WHERE MaSp = @MaSp 
END
GO
-----------------------------------------------------

CREATE PROC prVitriHangTon
@MaSp  char(25)
AS
BEGIN
	SELECT * FROM dbo.TonKho  WHERE MaSp = @MaSp 
END
GO
-----------------------------------------------------
CREATE PROC prSoLuongTonKho
@MaSp  char(25)
AS
BEGIN
	SELECT * FROM dbo.DSSANPHAM  WHERE MaSp = @MaSp AND SoLuongTon > 0
END
GO
-----------------------------------------------------

CREATE PROC prDeleteTonKho
@MaSp  char(25),
@ViTriO  char(10)
AS
BEGIN
	DELETE  dbo.TonKho WHERE MaSp =@MaSp AND ViTriO = @ViTriO
END
GO
-----------------------------------------------------
---///////////////////////////////////////////////---



SELECT * FROM dbo.listXuat

SELECT * FROM dbo.DsXuatHang

SELECT * FROM dbo.TASK



SELECT * FROM dbo.TonKho

SELECT * FROM dbo.History

SELECT * FROM dbo.DSSANPHAM

DELETE dbo.History


