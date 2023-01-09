
-------------------------------------------
-------------------------------------------

CREATE PROC prDsNxt
@date1 date,
@date2 date
AS
BEGIN
	SET @date2 = DATEADD(DAY,1,@date2)
	SELECT DISTINCT dbo.History.MaSp , dbo.History.TenSp, dbo.History.DonViTinh , dbo.DSSANPHAM.DonGia FROM dbo.History , dbo.DSSANPHAM
	WHERE History.MaSp = DSSANPHAM.MaSp --AND Ngay >= @date1 AND Ngay<= @date2
END
GO
-------------------------------------------


CREATE PROC prSlNXT
@date1  date,
@date2  date,
@MaSp  char(25)
AS
BEGIN
	SET @date2 = DATEADD(DAY,1,@date2)
	DECLARE @slDauky INT SET	 @slDauky =0
	DECLARE @slNhapKho INT SET	 @slNhapKho =0
	DECLARE @slXuatKho INT SET	 @slXuatKho =0
	DECLARE @slCuoiKy INT SET	 @slCuoiKy =0
	
	DECLARE @nhDauKy INT
	DECLARE @xhDauKy INT

	DECLARE @nhCuoiKy INT
	DECLARE @xhCuoiKy INT

	---- sl dau ky
	SELECT @nhDauKy =  SUM(dbo.History.SoLuong) FROM dbo.History WHERE TacVu = N'Nhập Hàng' AND MaSp = @MaSp AND Ngay < @date1
	SELECT @xhDauKy =  SUM(dbo.History.SoLuong) FROM dbo.History WHERE TacVu = N'Xuất Hàng' AND MaSp = @MaSp AND Ngay < @date1
	IF( @nhDauKy IS NULL)
	BEGIN
		SET @nhDauKy = 0
	END
	IF (@xhDauKy IS NULL)
	BEGIN
		SET @xhDauKy = 0
	END
	SET @slDauky = @nhDauKy - @xhDauKy
	-------------------------------
	---sl nhap kho
	SELECT @slNhapKho =  SUM(dbo.History.SoLuong) FROM dbo.History WHERE TacVu = N'Nhập Hàng' AND MaSp = @MaSp AND Ngay >= @date1 AND Ngay <= @date2
	SELECT @slXuatKho =  SUM(dbo.History.SoLuong) FROM dbo.History WHERE TacVu = N'Xuất Hàng' AND MaSp = @MaSp AND Ngay >= @date1 AND Ngay <= @date2
	IF( @slNhapKho IS NULL)
	BEGIN
		SET @slNhapKho = 0
	END
	IF (@slXuatKho IS NULL)
	BEGIN
		SET @slXuatKho = 0
	END
	------------------------------------
	---- sl cuoi ky
	SELECT @nhCuoiKy =  SUM(dbo.History.SoLuong) FROM dbo.History WHERE TacVu = N'Nhập Hàng' AND MaSp = @MaSp AND Ngay <= @date2
	SELECT @xhCuoiKy =  SUM(dbo.History.SoLuong) FROM dbo.History WHERE TacVu = N'Xuất Hàng' AND MaSp = @MaSp AND Ngay <= @date2
	IF( @nhCuoiKy IS NULL)
	BEGIN
		SET @nhCuoiKy = 0
	END
	IF (@xhCuoiKy IS NULL)
	BEGIN
		SET @xhCuoiKy = 0
	END
	SET @slCuoiKy = @nhCuoiKy -@xhCuoiKy
	----------------------------------------
	SELECT @slDauky AS slDauKy, @slNhapKho AS slNhapKho, @slXuatKho AS slXuatKho, @slCuoiKy AS slCuoiKy
END
GO
-------------------------------------------

-------------------------------------------

CREATE PROC prDsSoChiTiet
@date1 date,
@date2 DATE,
@MaSp  char(25)
AS
BEGIN
	SET @date2 = DATEADD(DAY,1,@date2)
	SELECT dbo.History.Ngay, dbo.History.MaSp, dbo.History.TenSp, dbo.History.TacVu, dbo.DSSANPHAM.DonGia, dbo.History.DienGiai, dbo.History.STT,dbo.History.DonViTinh  FROM dbo.History, dbo.DSSANPHAM
	WHERE dbo.History.MaSp =@MaSp AND Ngay >= @date1 AND Ngay <= @date2 AND dbo.History.MaSp = dbo.DSSANPHAM.MaSp 
	ORDER BY Ngay ASC
END
GO
-------------------------------------------

CREATE PROC prSlSochitiet
@date1  DATETIME,
@MaSp  char(25),
@TacVu NVARCHAR(15),
@STT INT
AS
BEGIN
	
	DECLARE @slNhapKho INT SET	 @slNhapKho =0
	DECLARE @slXuatKho INT SET	 @slXuatKho =0
	DECLARE @slCuoiKy INT SET	 @slCuoiKy =0

	DECLARE @nhCuoiKy INT
	DECLARE @xhCuoiKy INT
	-------------------------------

	IF (@TacVu = N'Nhập Hàng')
	BEGIN
		SELECT @slNhapKho = dbo.History.SoLuong FROM dbo.History WHERE TacVu = N'Nhập Hàng' AND MaSp = @MaSp AND STT = @STT
		IF (@slNhapKho IS NULL)
		BEGIN
			SET @slNhapKho =0
		END
	END
	ELSE
    BEGIN
		SELECT @slXuatKho = dbo.History.SoLuong FROM dbo.History WHERE TacVu = N'Xuất Hàng' AND MaSp = @MaSp AND STT = @STT
		IF (@slXuatKho IS NULL)
		BEGIN
			SET @slXuatKho =0
		END
	END
	------------------------------------
	---- sl cuoi ky
	SET @date1 = DATEADD(SECOND,1,@date1)

	SELECT @nhCuoiKy =  SUM(dbo.History.SoLuong) FROM dbo.History WHERE TacVu = N'Nhập Hàng' AND MaSp = @MaSp AND STT <= @STT
	SELECT @xhCuoiKy =  SUM(dbo.History.SoLuong) FROM dbo.History WHERE TacVu = N'Xuất Hàng' AND MaSp = @MaSp AND STT <= @STT
	IF( @nhCuoiKy IS NULL)
	BEGIN
		SET @nhCuoiKy = 0
	END
	IF (@xhCuoiKy IS NULL)
	BEGIN
		SET @xhCuoiKy = 0
	END
	SET @slCuoiKy = @nhCuoiKy - @xhCuoiKy
	----------------------------------------
	SELECT @slNhapKho AS slNhapKho, @slXuatKho AS slXuatKho, @slCuoiKy AS slCuoiKy
END
GO
--------------------------------------------
ALTER TABLE History
ADD STT INT IDENTITY(1,1)
GO
-------------------------------------------




