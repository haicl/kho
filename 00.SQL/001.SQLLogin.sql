SELECT * FROM dbo.ACCOUNT WHERE UserName = 'Admin' COLLATE SQL_Latin1_General_CP1_CS_AS AND Pass = '11111' COLLATE SQL_Latin1_General_CP1_CS_AS
GO
--------------------------------------------------------------
CREATE PROC prLogin
	@UserName char(20),
	@Pass char(16)
AS
BEGIN
	SELECT * FROM dbo.ACCOUNT WHERE UserName =@UserName COLLATE SQL_Latin1_General_CP1_CS_AS AND Pass = @Pass COLLATE SQL_Latin1_General_CP1_CS_AS
END
GO
-----------
EXEC dbo.prLogin @UserName ,  @Pass

--------------------------------------------------------------
CREATE PROC prUpdateRemember
	@UserName char(20),
	@Pass char(16)
AS
BEGIN
	UPDATE dbo.ACCOUNT SET remember = 0
	UPDATE dbo.ACCOUNT SET remember = 1 WHERE UserName = @UserName AND Pass = @Pass
END
GO
------------
EXEC dbo.prUpdateRemember @UserName = 'admin',@Pass = '11111'   
GO
--------------------------------------------------------------
SELECT fullName FROM dbo.ACCOUNT WHERE UserName = 'admin' COLLATE SQL_Latin1_General_CP1_CS_AS AND Pass = '11111' COLLATE SQL_Latin1_General_CP1_CS_AS
GO

CREATE PROC prUserLogin
	@UserName char(20),
	@Pass char(16)
AS
BEGIN
	SELECT fullName FROM dbo.ACCOUNT WHERE UserName = @UserName COLLATE SQL_Latin1_General_CP1_CS_AS AND Pass = @Pass COLLATE SQL_Latin1_General_CP1_CS_AS
END
GO
-------------
EXEC dbo.prLogin @UserName , @Pass
--------------------------------------------------------------
