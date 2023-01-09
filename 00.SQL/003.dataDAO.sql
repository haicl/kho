USE KhoIntech22
GO

-----------------------------------------------------------------------
CREATE PROC prUpdateTtViTriChk
@ViTriO char(10),
@TrangThai INT
AS
BEGIN
	UPDATE dbo.CAUHINHKHAY SET tinhTrangO = @TrangThai WHERE  ViTriO = @ViTriO
END
GO
-----------------------------------------------------------------------
CREATE PROC prUpdateDsSanPhamSlNhap
@MaSp  char(25),
@SoLuongNhap INT
AS
BEGIN
	UPDATE dbo.DSSANPHAM SET SoLuongTon = SoLuongTon + @SoLuongNhap WHERE  MaSp = @MaSp
END
GO
-----------------------------------------------------------------------

CREATE PROC prCheckTonKho
@MaSp  char(25),
@ViTriO char(10)
AS
BEGIN
	SELECT *  FROM dbo.TonKho WHERE MaSp = @MaSp AND ViTriO = @ViTriO
END
GO
-----------------------------------------------------------------------

CREATE PROC prUpdateSlTonKhoNhap
@MaSp  char(25),
@ViTriO char(10),
@SoLuongNhap INT
AS
BEGIN
	UPDATE dbo.TonKho SET SoLuong = SoLuong + @SoLuongNhap WHERE MaSp = @MaSp AND ViTriO = @ViTriO
END
GO

CREATE PROC prUpdateSlTonKhoXuat
@MaSp  char(25),
@ViTriO char(10),
@SoLuongXuat INT
AS
BEGIN
	UPDATE dbo.TonKho SET SoLuong = @SoLuongXuat WHERE MaSp = @MaSp AND ViTriO = @ViTriO
END
GO


-----------------------------------------------------------------------
CREATE PROC prINSERTTonKho
@MaSp char(25),
@TenSp nvarchar(100),
@NhomSp nvarchar(50),
@Maker nvarchar(50),
@DonViTinh nvarchar(10),
@SoLuong int,
@ViTriO char(10),
@SoLuongMaxO  int
AS
BEGIN
	INSERT dbo.TonKho
	(
	    MaSp,
	    TenSp,
	    NhomSp,
	    Maker,
	    DonViTinh,
	    SoLuong,
	    ViTriO,
	    SoLuongMaxO
	)
	VALUES
	(   
		@MaSp,  -- MaSp - char(25)
	    @TenSp, -- TenSp - nvarchar(100)
	    @NhomSp, -- NhomSp - nvarchar(50)
	    @Maker, -- Maker - nvarchar(50)
	    @DonViTinh, -- DonViTinh - nvarchar(10)
	    @SoLuong,   -- SoLuong - int
	    @ViTriO,  -- ViTriO - char(10)
	    @SoLuongMaxO    -- SoLuongMaxO - int
	  )
END
GO
-----------------------------------------------------------------------

CREATE PROC prINSERTLichSu
@MaSp  char(25),
@TenSp  nvarchar(100),
@Maker  nvarchar(50),
@TacVu  nvarchar(15),
@DonViTinh  nvarchar(10),
@SoLuong  int,
@ViTriO  char(10),
@DienGiai  ntext
AS
BEGIN
	INSERT dbo.History
	(
	    Ngay,
	    MaSp,
	    TenSp,
	    Maker,
	    TacVu,
	    DonViTinh,
	    SoLuong,
	    ViTriO,
	    DienGiai
	)
	VALUES
	(   GETDATE(), -- Ngay - date
	    @MaSp,        -- MaSp - char(25)
	    @TenSp,       -- TenSp - nvarchar(100)
	    @Maker,       -- Maker - nvarchar(50)
	    @TacVu,       -- TacVu - nvarchar(15)
	    @DonViTinh,       -- DonViTinh - nvarchar(10)
	    @SoLuong,         -- SoLuong - int
	    @ViTriO,        -- ViTriO - char(10)
	    @DienGiai        -- DienGiai - ntext
	    )
END
GO
-----------------------------------------------------------------------
CREATE PROC prInsertDsSanPham
@MaSp char(25),
@TenSp nvarchar(100),
@NhomSp nvarchar(50),
@Maker nvarchar(50),
@DonViTinh nvarchar(10),
@KhoiLuong float,
@Cdai float,
@cRong float,
@cCao float,
@DonGia float,
@SoLuongTon INT,
@QuyDoi NTEXT
AS
BEGIN

	INSERT dbo.DSSANPHAM
	(
		MaSp,
		TenSp,
		NhomSp,
		Maker,
		DonViTinh,
		KhoiLuong,
		Cdai,
		cRong,
		cCao,
		DonGia,
		SoLuongTon,
		QuyDoi
	)
	VALUES
	(   
		@MaSp,  -- MaSp - char(25)
		@TenSp, -- TenSp - nvarchar(100)
		@NhomSp, -- NhomSp - nvarchar(50)
		@Maker, -- Maker - nvarchar(50)
		@DonViTinh, -- DonViTinh - nvarchar(10)
		@KhoiLuong, -- KhoiLuong - float
		@Cdai, -- Cdai - float
		@cRong, -- cRong - float
		@cCao, -- cCao - float
		@DonGia, -- DonGia - float
		@SoLuongTon,    -- SoLuongTon - int
		@QuyDoi
	)
	END
GO
-----------------------------------------------------------------------
CREATE PROC prCheckInsertDsSanPham
@MaSp char(25)
AS
BEGIN

	SELECT * FROM dbo.DSSANPHAM WHERE MaSp = @MaSp;
	
END
GO
-----------------------------------------------------------------------
CREATE PROC prCheckInsertDonViTinh
@DonViTinh NVARCHAR(10)
AS
BEGIN
	SELECT * FROM dbo.DONVITINH WHERE DonViTinh = @DonViTinh
END
GO

-----------------------------------------------------------------------
-----------------------------------------------------------------------
-----------------------------------------------------------------------


SELECT * FROM dbo.CAUHINHKHAY
GO

SELECT * FROM dbo.DSSANPHAM ORDER BY TenSp ASC
GO

SELECT * FROM dbo.TonKho
GO

SELECT * FROM dbo.History
GO

SELECT * FROM dbo.DsXuatHang
GO

SELECT * FROM dbo.DONVITINH
GO


