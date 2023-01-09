USE KhoIntech22
GO

SELECT ViTriO FROM dbo.DsNhapHang
GO
-----------------------------------------------------------------------
CREATE PROC prInsertTbBackup
@TangDi  char(10),
@TangDen  char(10)
AS
BEGIN
	INSERT dbo.tbBackUp
	(
	    Ngay,
	    TangDi,
	    TangDen,
	    TrangThai
	)
	VALUES
	(   GETDATE(), -- Ngay - datetime
	    @TangDi,        -- TangDi - char(10)
	    @TangDen,        -- TangDen - char(10)
	    0       -- TrangThai - bit
	    )
END
GO
-----------------------------------------------------------------------

SELECT MAX(STT) FROM dbo.tbBackUp
GO

-----------------------------------------------------------------------
CREATE PROC prChieuCaoKhay
@Khay char(10)
AS
BEGIN
	SELECT* FROM dbo.CAUHINHKHAY WHERE tenKhay = @Khay
END
GO
-----------------------------------------------------------------------
CREATE PROC prUpdateBackUp
@STT int
AS
BEGIN
	UPDATE dbo.tbBackUp SET TrangThai = 1 WHERE STT = @STT
END
GO
-----------------------------------------------------------------------
CREATE PROC prKhayBackup
@Stt INT,
@ViTriO  char(10)
AS
BEGIN
	DELETE dbo.DsNhapHang WHERE STT = @Stt and ViTriO = @ViTriO
END
GO
-----------------------------------------------------------------------
CREATE PROC prdeleteDsNhapHang
@Stt INT,
@ViTriO  char(10)
AS
BEGIN
	DELETE dbo.DsNhapHang WHERE STT = @Stt and ViTriO = @ViTriO
END
GO
-----------------------------------------------------------------------
CREATE PROC prdeleteDsXuatHang
@Stt INT,
@ViTriO  char(10)
AS
BEGIN
	DELETE dbo.DsXuatHang WHERE STT = @Stt and ViTriO = @ViTriO
END
GO
-----------------------------------------------------------------------
CREATE PROC prINSERTTASK
@task  nvarchar(15)
AS
BEGIN
INSERT dbo.TASK
(
    Time,
    task
)
VALUES
(   GETDATE(), -- Time - datetime
    @task        -- task - nvarchar(15)
    )
END
GO
-----------------------------------------------------------------------
CREATE PROC prUPDATETASK
@task  nvarchar(15)
AS
BEGIN
	UPDATE dbo.TASK SET task = @task
END
GO

DELETE dbo.TASK




SELECT * FROM dbo.DsXuatHang
SELECT * FROM dbo.TonKho
SELECT * FROM dbo.TASK
SELECT * FROM dbo.TACVU ORDER BY STT ASC
 

 
