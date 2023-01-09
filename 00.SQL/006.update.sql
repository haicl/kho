USE KhoIntech22
GO

----------------------------------------------------------------
CREATE PROC prDeleteDssanpham
@MaSp  CHAR(25)
AS
BEGIN
	DELETE dbo.DSSANPHAM WHERE MaSp = @MaSp AND SoLuongTon =0
END
GO
----------------------------------------------------------------

CREATE TRIGGER trg_UpdateDsSanpham on dbo.DSSANPHAM after UPDATE
AS
BEGIN
	IF	EXISTS(SELECT t1.MaSp  FROM dbo.TonKho t1, Deleted t2 WHERE t1.MaSp = t2.MaSp)
	BEGIN
	   UPDATE t1 SET t1.MaSp = t3.MaSp , t1.TenSp = t3.TenSp , t1.NhomSp = t3.NhomSp, t1.Maker = t3.Maker , t1.DonViTinh = t3.DonViTinh
	   FROM dbo.TonKho t1, Deleted t2, Inserted t3
	   WHERE t1.MaSp = t2.MaSp
	END

	IF	EXISTS (SELECT t1.MaSp  FROM dbo.History t1, Deleted t2 WHERE t1.MaSp = t2.MaSp)
	BEGIN
	   UPDATE t1 SET t1.MaSp = t3.MaSp , t1.TenSp = t3.TenSp,t1.Maker = t3.Maker 
	   FROM dbo.History t1, Deleted t2, Inserted t3
	   WHERE t1.MaSp = t2.MaSp
	END
end
GO

----------------------------------------------------------------
CREATE PROC prUpdateDsSanpham
@key  CHAR(25),
@MaSp  char(25),
@TenSp  nvarchar(100),
@Maker  nvarchar(50),
@DonViTinh  nvarchar(10),
@KhoiLuong  FLOAT,
@Cdai  FLOAT,
@cRong  FLOAT,
@cCao  FLOAT,
@DonGia  FLOAT,
@SoLuongTon INT,
@QuyDoi  NTEXT
AS
BEGIN
	UPDATE dbo.DSSANPHAM SET MaSp= @MaSp,
							TenSp = @TenSp,
							SoLuongTon = @SoLuongTon,
							Maker =@Maker,
							QuyDoi =@QuyDoi,
							DonGia = @DonGia,
							Cdai =@Cdai,
							cRong=@cRong,
							cCao =@cCao,
							KhoiLuong =@KhoiLuong WHERE MaSp =@key
END
GO
-------------------------------- --------------------------------

