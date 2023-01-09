CREATE DATABASE KhoIntech22
GO
USE KhoIntech22
GO
-----------------------------------------------------
CREATE TABLE ACCOUNT
(
	UserName CHAR(20) PRIMARY KEY NOT NULL,
	Pass CHAR(16)NOT NULL,
	remember BIT,
	fullName NVARCHAR(100) NOT NULL,
	position NVARCHAR(20) NOT NULL,
	id INT NOT NULL,
	sex NVARCHAR(5)
)

-----------------------------------------------------
INSERT dbo.ACCOUNT
(
    UserName,
    Pass,
    remember,
    fullName,
    position,
    id,
    sex
)
VALUES
(   
	'admin',   -- UserName - char(50)
	'111',   -- Pass - char(16)
	0, -- remember - bit
	N'Vũ Minh Đức',  -- fullName - nvarchar(100)
	N'NVKT',  -- position - nvarchar(20)
	528,    -- id - int
	N'Khác'   -- sex - nvarchar(5)
)
-----------------------------------------------------
INSERT dbo.ACCOUNT
(
    UserName,
    Pass,
    remember,
    fullName,
    position,
    id,
    sex
)
VALUES
(   
    'Kho1',   -- UserName - char(50)
    '11111',   -- Pass - char(16)
    1, -- remember - bit
    N'Lương Thị Hậu',  -- fullName - nvarchar(100)
    N'NVK',  -- position - nvarchar(20)
    678,    -- id - int
    N'Nữ'   -- sex - nvarchar(5)
)
GO
-----------------------------------------------------
CREATE TABLE NHOMSP
(
	STT INT IDENTITY,
	NhomSp NVARCHAR(50) PRIMARY KEY
)

-----------------------------------------------------
INSERT dbo.NHOMSP
(
    NhomSp
)
VALUES
(
	N'Bulong' -- NhomSp - nvarchar(50)
)

INSERT dbo.NHOMSP
(
    NhomSp
)
VALUES
(
	N'Gối bi' -- NhomSp - nvarchar(50)
)

INSERT dbo.NHOMSP
(
    NhomSp
)
VALUES
(
	N'Thiết bị điện' -- NhomSp - nvarchar(50)
)
GO

-----------------------------------------------------
CREATE TABLE DONVITINH
(
	STT INT IDENTITY,
	DonViTinh NVARCHAR(10) PRIMARY KEY
)


---------------------
INSERT dbo.DONVITINH
(
    DonViTinh
)
VALUES
(
	N'Con' -- DonViTinh - nvarchar(10)
)

INSERT dbo.DONVITINH
(
    DonViTinh
)
VALUES
(
	N'Pcs' -- DonViTinh - nvarchar(10)
)
INSERT dbo.DONVITINH
(
    DonViTinh
)
VALUES
(
	N'Mét' -- DonViTinh - nvarchar(10)
)

INSERT dbo.DONVITINH
(
    DonViTinh
)
VALUES
(
	N'Kg' -- DonViTinh - nvarchar(10)
)
INSERT dbo.DONVITINH
(
    DonViTinh
)
VALUES
(
	N'Box' -- DonViTinh - nvarchar(10)
)
-------------------------------------------------
GO
------------------------------------------------------
 CREATE TABLE DSSANPHAM
(
	MaSp  char(25) PRIMARY KEY NOT NULL,
    TenSp  nvarchar(100) NOT NULL,
    NhomSp  nvarchar(50),
    Maker  nvarchar(50),
    DonViTinh nvarchar(10),
    KhoiLuong  FLOAT,
    Cdai  FLOAT,
    cRong  FLOAT,
    cCao  FLOAT,
    DonGia  FLOAT,
    SoLuongTon  INT,
	QuyDoi NTEXT
)
GO
-----------------------------------------------------

SELECT * FROM dbo.DSSANPHAM

-----------------------------------------------------
CREATE TABLE CAUHINHKHAY
(
	tenKhay CHAR(10) NOT NULL,
	ViTriO CHAR(10) PRIMARY KEY NOT NULL,
	locationX INT NOT NULL,
	locationy INT NOT NULL,
	width INT NOT NULL,
	height INT NOT NULL,
	chieuCao INT,
	tinhTrangO int,
	sttKhay INT,
	sttO int
)
GO
------------------------------------------------------
CREATE TABLE TonKho
(
	MaSp CHAR(25)  NOT NULL,
	TenSp NVARCHAR(100)NOT NULL,
	NhomSp NVARCHAR(50),
	Maker NVARCHAR(50),
	DonViTinh NVARCHAR(10) NOT NULL,
	SoLuong INT NOT NULL,
	ViTriO CHAR(10) NOT NULL,
	SoLuongMaxO INT NOT NULL
	FOREIGN KEY (MaSp) REFERENCES dbo.DSSANPHAM,
	FOREIGN KEY (NhomSp) REFERENCES dbo.NHOMSP,
	FOREIGN KEY (ViTriO) REFERENCES dbo.CAUHINHKHAY,
	FOREIGN KEY (DonViTinh) REFERENCES dbo.DONVITINH
	
)
GO

------------------------------------------------------
CREATE TABLE TACVU
(
	STT INT IDENTITY,
	TacVu NVARCHAR(25) PRIMARY KEY
)

INSERT dbo.TACVU
(
    TacVu
)
VALUES
(
	N'Nhập Hàng' -- TacVu - nvarchar(15)
)

INSERT dbo.TACVU
(
    TacVu
)
VALUES
(
	N'Xuất Hàng' -- TacVu - nvarchar(15)
)

INSERT dbo.TACVU
(
    TacVu
)
VALUES
(
	N'Thêm Khay' -- TacVu - nvarchar(15)
)

INSERT dbo.TACVU
(
    TacVu
)
VALUES
(
	N'Xóa Khay' -- TacVu - nvarchar(15)
)

INSERT dbo.TACVU
(
    TacVu
)
VALUES
(
	N'Cấu hình khay' -- TacVu - nvarchar(15)
)

INSERT dbo.TACVU
(
    TacVu
)
VALUES
(
	N'Trống' -- TacVu - nvarchar(15)
)
GO

------------------------------------------------------
CREATE TABLE History
(
	Ngay DATETIME NOT NULL,
	MaSp CHAR(25)  NOT NULL,
	TenSp NVARCHAR(100)NOT NULL,
	Maker NVARCHAR(50),
	TacVu NVARCHAR(15) NOT NULL,
	DonViTinh NVARCHAR(10) NOT NULL,
	SoLuong INT NOT NULL,
	ViTriO CHAR(10) NOT NULL,
	DienGiai NTEXT
)
go
------------------------------------------------------

CREATE TABLE DsNhapHang
(
	STT int  NOT NULL,
	MaSp CHAR(25)  NOT NULL,
	TenSp NVARCHAR(100)NOT NULL,
	Maker NVARCHAR(50),
	DonViTinh NVARCHAR(10) NOT NULL,
	SoLuong INT NOT NULL,
	ViTriO CHAR(10) NOT NULL,
	SoLuongMaxO INT,
	DienGiai NTEXT,
	checkDay BIT,
	QuyDoi  NTEXT
    FOREIGN KEY (ViTriO) REFERENCES dbo.CAUHINHKHAY
)
GO

-------------------------------------------------------------

CREATE TABLE DsXuatHang
(
	STT int  NOT NULL,
	MaSp CHAR(25)  NOT NULL,
	TenSp NVARCHAR(100)NOT NULL,
	Maker NVARCHAR(50),
	DonViTinh NVARCHAR(10) NOT NULL,
	SoLuongXuat INT NOT NULL,
	ViTriO CHAR(10) NOT NULL,
	SoLuongTon INT NOT NULL,
	DienGiai NTEXT,
	QuyDoi  NTEXT
	FOREIGN KEY (MaSp) REFERENCES dbo.DSSANPHAM,
    FOREIGN KEY (ViTriO) REFERENCES dbo.CAUHINHKHAY
)
GO

-------------------------------------------------------------
CREATE TABLE tbBackUp
(
	STT int IDENTITY(1,1) PRIMARY KEY,
	Ngay DATETIME,
	TangDi CHAR(10) NOT NULL,
	TangDen CHAR(10) NOT NULL,
	TrangThai bit
   
)
GO
-------------------------------------------------------------
-------------------------------------------------------------
-------------------------------------------------------------

SELECT * FROM dbo.TACVU

SELECT * FROM dbo.LISTKHAY
GO

SELECT * FROM dbo.CAUHINHKHAY WHERE tenKhay = 'R17'
GO

DELETE FROM dbo.CAUHINHKHAY WHERE tenKhay = 'R17'
GO


UPDATE dbo.LISTKHAY SET State = 0, W_Min = 0, H_Min =  0
GO

SELECT * FROM dbo.CAUHINHKHAY
GO
