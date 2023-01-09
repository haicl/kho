
CREATE PROC prMaker
@MaSp  char(25),
@TenSp  nvarchar(100)
AS
BEGIN
SELECT Maker, DonViTinh , SoLuongTon , DonGia , Cdai, cRong , KhoiLuong FROM dbo.DSSANPHAM  WHERE MaSp = @MaSp AND TenSp = @TenSp
END
GO

--------------------------------------------------------
CREATE PROC prCheckSpTonKho
@MaSp  char(25)
AS
BEGIN
	SELECT * FROM dbo.TonKho  WHERE MaSp = @MaSp 
END
GO
-------------------------------------------------------

CREATE PROC prKtSp
@maSp  char(25)
AS
BEGIN
SELECT Cdai, cRong , cCao FROM dbo.DSSANPHAM  WHERE MaSp = @maSp 
END
GO

-----------------------------------------
CREATE TABLE  dbo.listNhap
(
	MaSp CHAR(25)  NOT NULL,
	SoLuong INT NOT NULL
)
GO
-----------------------------------------
CREATE PROC prInsertlistNhap
@maSp  char(25)
AS
BEGIN
	INSERT dbo.listNhap
	(
	    MaSp,
	    SoLuong
	)
	VALUES
	(  
		@maSp, -- MaSp - char(25)
	    0   -- SoLuong - int
	)
END
GO
---------------------------------------
CREATE PROC prCheckSpNhap
@MaSp  char(25)
AS
BEGIN
	SELECT * FROM dbo.listNhap  WHERE MaSp = @MaSp 
END
GO

---------------------------------------
CREATE PROC prUpdateListNhap
@MaSp  char(25),
@Soluong INT
AS
BEGIN
	UPDATE dbo.listNhap SET SoLuong = @Soluong WHERE MaSp =@MaSp
END
GO
-----------------------------------------
CREATE PROC prTtSanPham
@MaSp  char(25)
AS
BEGIN
	SELECT * FROM  dbo.DSSANPHAM WHERE MaSp = @MaSp
END
GO
--------------------------------------------------------
CREATE PROC prOchuaSp
@MaSp  char(25)
AS
BEGIN
	SELECT ViTriO , SoLuong , SoLuongMaxO = SoLuongMaxO -SoLuong , SoLuongMaxO FROM  dbo.TonKho WHERE MaSp = @MaSp and SoLuong < SoLuongMaxO
END
GO

---------------------------------------------------------
CREATE PROC prTangChuaSp
@MaSp  char(25)
AS
BEGIN
	SELECT ViTriO FROM  dbo.TonKho WHERE MaSp = @MaSp
END
GO

---------------------------------------------------------

SELECT * FROM  CAUHINHKHAY WHERE tenKhay like 'R%' AND tinhTrangO = 0 ORDER BY sttKhay ASC , sttO ASC 
go
--------------------------------------------------------------------------------
SELECT * FROM  CAUHINHKHAY WHERE tenKhay LIKE 'F%' AND tinhTrangO = 0 ORDER BY sttKhay ASC , sttO ASC 
GO
---------------------------------------------------------------------------------
CREATE PROC prcheckViTri
@ViTriO  char(10)
AS
BEGIN
	SELECT * FROM  dbo.CAUHINHKHAY WHERE ViTriO = @ViTriO
END
GO
---------------------------------------------------------------------------------

CREATE PROC prTTo
@ViTriO  char(10)
AS
BEGIN
	SELECT * FROM  dbo.TonKho WHERE ViTriO = @ViTriO
END
GO

---------------------------------------------------------

CREATE PROC prInsertDsNhapHang
		@STT  int,
	    @MaSp  char(25),
	    @TenSp  nvarchar(100),
	    @Maker nvarchar(50),
	    @DonViTinh nvarchar(10),
	    @SoLuong  int,
	    @ViTriO char(10),
	    @SoLuongMaxO  int,
	    @DienGiai ntext,
	    @checkDay  bit
AS
BEGIN
	INSERT INTO dbo.DsNhapHang
	(
	    STT,
	    MaSp,
	    TenSp,
	    Maker,
	    DonViTinh,
	    SoLuong,
	    ViTriO,
	    SoLuongMaxO,
	    DienGiai,
	    checkDay
	)
	VALUES
	(  
		@STT,   -- STT - int
	    @MaSp,  -- MaSp - char(25)
	    @TenSp, -- TenSp - nvarchar(100)
	    @Maker, -- Maker - nvarchar(50)
	    @DonViTinh, -- DonViTinh - nvarchar(10)
	    @SoLuong,   -- SoLuong - int
	    @ViTriO,  -- ViTriO - char(10)
	    @SoLuongMaxO,   -- SoLuongMaxO - int
	    @DienGiai, -- DienGiai - ntext
	    @checkDay -- checkDay - bit
	    )
END
GO

---------------------------------------------------------





SELECT * FROM  dbo.DsXuatHang 
GO

SELECT * FROM  dbo.TonKho 
GO

SELECT * FROM  dbo.DSSANPHAM 
GO
SELECT * FROM dbo.DONVITINH ORDER BY STT ASC