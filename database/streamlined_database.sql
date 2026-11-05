-- ==========================================================================================
-- CSDL IT ASSET MANAGEMENT - KIẾN TRÚC TINH GỌN (5 BẢNG NGHIỆP VỤ + 1 LỊCH SỬ ĐIỀU CHUYỂN)
-- HOÀN TOÀN KHÔNG KHÓA NGOẠI (DECOUPLED) - CHUẨN UNICODE & FORMAT MM/DD/YYYY
-- ==========================================================================================

USE ITAssetDB;
SET NOCOUNT ON;

DECLARE @dropFkSql NVARCHAR(MAX) = N'';
SELECT @dropFkSql += N'ALTER TABLE ' + QUOTENAME(OBJECT_SCHEMA_NAME(parent_object_id)) + '.' + QUOTENAME(OBJECT_NAME(parent_object_id)) + 
                      N' DROP CONSTRAINT ' + QUOTENAME(name) + ';' + CHAR(13)
FROM sys.foreign_keys;
EXEC sp_executesql @dropFkSql;
GO

IF OBJECT_ID('dbo.Users', 'U') IS NOT NULL DROP TABLE dbo.Users;
IF OBJECT_ID('dbo.NguoiDung', 'U') IS NOT NULL DROP TABLE dbo.NguoiDung;
GO
CREATE TABLE dbo.Users (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Username NVARCHAR(50) NULL,
    PasswordHash NVARCHAR(255) NULL,
    FullName NVARCHAR(150) NOT NULL,
    Email NVARCHAR(150) NULL,
    Role NVARCHAR(50) DEFAULT N'User',
    Department NVARCHAR(100) NULL,
    Position NVARCHAR(150) NULL,
    Block NVARCHAR(100) NULL,
    IsActive BIT DEFAULT 1,
    CreatedAt DATETIME DEFAULT GETDATE()
);
CREATE NONCLUSTERED INDEX IX_Users_FullName ON dbo.Users(FullName);
CREATE NONCLUSTERED INDEX IX_Users_Department ON dbo.Users(Department);
GO

IF OBJECT_ID('dbo.ThietBi', 'U') IS NOT NULL DROP TABLE dbo.ThietBi;
GO
CREATE TABLE dbo.ThietBi (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    STT INT NULL,
    UserId INT NULL,                      -- Liên kết tới Users.Id (không ràng buộc FK)
    NhomThietBi NVARCHAR(50) NOT NULL,
    PhanLoai NVARCHAR(100) NULL,
    Model NVARCHAR(255) NULL,
    Alias NVARCHAR(150) NULL,
    SerialNumber NVARCHAR(100) NULL,
    IPAddress NVARCHAR(50) NULL,
    Firmware NVARCHAR(100) NULL,
    PhongBan NVARCHAR(100) NULL,
    Owner NVARCHAR(150) NULL,
    OS NVARCHAR(100) NULL,
    CPU NVARCHAR(200) NULL,
    RAM NVARCHAR(100) NULL,
    HardDisk NVARCHAR(200) NULL,
    RansomwareProtection NVARCHAR(50) DEFAULT N'Yes',
    OutlookStorage NVARCHAR(100) NULL,
    ThoiGianDauTu NVARCHAR(50) NULL,
    HSDBanDau NVARCHAR(50) NULL,
    ThoiGianBaoTri NVARCHAR(50) NULL,
    HSDGiaHan NVARCHAR(50) NULL,
    NienHanBanDau NVARCHAR(100) NULL,
    NienHanGiaHan NVARCHAR(100) NULL,
    PhanHoiNguoiDung NVARCHAR(MAX) NULL,
    DanhGiaKhiBaoTri NVARCHAR(MAX) NULL,
    KhuyenNghiIT NVARCHAR(MAX) NULL,
    ChiPhiDuKien DECIMAL(18,2) NULL DEFAULT 0,
    HienTrang NVARCHAR(100) NULL DEFAULT N'Đang sử dụng',
    CapNhatMay NVARCHAR(100) NULL,
    KichHoat NVARCHAR(50) NULL DEFAULT N'Enabled',
    NgayTao DATETIME DEFAULT GETDATE(),
    NgayCapNhat DATETIME DEFAULT GETDATE()
);
CREATE NONCLUSTERED INDEX IX_ThietBi_Nhom ON dbo.ThietBi(NhomThietBi);
CREATE NONCLUSTERED INDEX IX_ThietBi_Serial ON dbo.ThietBi(SerialNumber);
CREATE NONCLUSTERED INDEX IX_ThietBi_UserId ON dbo.ThietBi(UserId);
GO

IF OBJECT_ID('dbo.License', 'U') IS NOT NULL DROP TABLE dbo.License;
GO
CREATE TABLE dbo.License (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    STT INT NULL,
    UserId INT NULL,
    ComputerName NVARCHAR(100) NULL,
    GlobalDomain NVARCHAR(200) NULL,
    LocalDomain NVARCHAR(200) NULL,
    ActiveAccount NVARCHAR(200) NULL,
    Owner NVARCHAR(150) NULL,
    PhongBan NVARCHAR(100) NULL,
    KichHoat NVARCHAR(50) DEFAULT N'Enabled',
    NgayCapNhat DATETIME DEFAULT GETDATE()
);
CREATE NONCLUSTERED INDEX IX_License_UserId ON dbo.License(UserId);
GO

IF OBJECT_ID('dbo.ApplicationSoftware', 'U') IS NOT NULL DROP TABLE dbo.ApplicationSoftware;
GO
CREATE TABLE dbo.ApplicationSoftware (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    STT INT NULL,
    UserId INT NULL,
    Owner NVARCHAR(150) NULL,
    PhongBan NVARCHAR(100) NULL,
    May NVARCHAR(255) NULL,
    UngDung NVARCHAR(200) NULL,
    LyDo NVARCHAR(255) NULL,
    LoaiPhanMem NVARCHAR(100) NULL,
    TrangThai NVARCHAR(50) DEFAULT N'Đang sử dụng',
    NgayCaiDat NVARCHAR(50) NULL,
    GhiChu NVARCHAR(MAX) NULL
);
CREATE NONCLUSTERED INDEX IX_AppSoft_UserId ON dbo.ApplicationSoftware(UserId);
GO

IF OBJECT_ID('dbo.KeHoachBaoTri', 'U') IS NOT NULL DROP TABLE dbo.KeHoachBaoTri;
IF OBJECT_ID('dbo.NhatKyBaoTri', 'U') IS NOT NULL DROP TABLE dbo.NhatKyBaoTri;
IF OBJECT_ID('dbo.LichSuBaoTri', 'U') IS NOT NULL DROP TABLE dbo.LichSuBaoTri;
GO
CREATE TABLE dbo.LichSuBaoTri (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    ThietBiID INT NULL,
    SerialNumber NVARCHAR(100) NULL,
    Model NVARCHAR(255) NULL,
    TieuDe NVARCHAR(255) NULL,
    LoaiHanhDong NVARCHAR(100) NOT NULL,
    ChiTiet NVARCHAR(MAX) NULL,
    LinhKienThayThe NVARCHAR(500) NULL,
    ChiPhi DECIMAL(18,2) NULL DEFAULT 0,
    NguoiThucHien NVARCHAR(150) NULL,
    NgayThucHien NVARCHAR(50) NULL,            -- mm/dd/yyyy
    NgayDuKien NVARCHAR(50) NULL,              -- mm/dd/yyyy
    TrangThai NVARCHAR(50) DEFAULT N'Hoàn thành', -- 'Kế hoạch', 'Đang thực hiện', 'Hoàn thành'
    GhiChu NVARCHAR(MAX) NULL
);
CREATE NONCLUSTERED INDEX IX_BaoTri_Serial ON dbo.LichSuBaoTri(SerialNumber);
CREATE NONCLUSTERED INDEX IX_BaoTri_TrangThai ON dbo.LichSuBaoTri(TrangThai);
GO

IF OBJECT_ID('dbo.LichSuDieuChuyen', 'U') IS NOT NULL DROP TABLE dbo.LichSuDieuChuyen;
GO
CREATE TABLE dbo.LichSuDieuChuyen (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    STT INT NULL,
    ThietBiID INT NULL,
    ThietBi_Model NVARCHAR(255) NULL,
    ThietBi_Serial NVARCHAR(100) NULL,
    LoaiHanhDong NVARCHAR(100) NOT NULL,
    Ngay NVARCHAR(100) NULL,
    PhongBan_Cu NVARCHAR(100) NULL,
    PhongBan_Moi NVARCHAR(100) NULL,
    Owner_Cu NVARCHAR(150) NULL,
    Owner_Moi NVARCHAR(150) NULL,
    ChiTiet NVARCHAR(MAX) NULL,
    ChiPhi NVARCHAR(100) NULL,
    NguoiThucHien NVARCHAR(150) NULL,
    NgayTao DATETIME DEFAULT GETDATE()
);
GO

INSERT INTO dbo.Users (Username, FullName, Email, Role, Department, Position, Block, IsActive) VALUES (
  N'admin', N'System Administrator', N'it-admin@hoanganh.com.vn', N'Admin', N'HR&IT', N'Quản trị hệ thống', N'Văn phòng', 1
);
INSERT INTO dbo.Users (Username, FullName, Email, Role, Department, Position, Block, IsActive) VALUES (
  N'duy.nguyenhk', N'Nguyễn Hoàng Khánh Duy', N'duy.nguyenhk@hoanganh.com.vn', N'Admin', N'HR&IT', N'IT Lead', N'Văn phòng', 1
);
INSERT INTO dbo.Users (Username, FullName, Email, Role, Department, Position, Block, IsActive) VALUES (
  N'nhan.tran', N'Trần Hải Nhân', N'nhan.tranh@hoanganh.com.vn', N'Admin', N'HR&IT', N'Network Specialist', N'Văn phòng', 1
);
INSERT INTO dbo.Users (Username, FullName, Email, Role, Department, Position, Block, IsActive) VALUES (
  N'dat.nguyent', N'Nguyễn Thành Đạt', N'dat.nguyent@hoanganh.com.vn', N'IT Support', N'HR&IT', N'IT Helpdesk', N'Văn phòng', 1
);
INSERT INTO dbo.Users (Username, FullName, Email, Role, Department, Position, Block, IsActive) VALUES (
  N'hao.lamg', N'Lâm Gia Hào', N'hao.lamg@hoanganh.com.vn', N'IT Support', N'HR&IT', N'IT Support', N'Văn phòng', 1
);
INSERT INTO dbo.Users (Username, FullName, Email, Role, Department, Position, Block, IsActive) VALUES (
  N'son.nguyenx', N'Nguyễn Xuân Sơn', N'son.nguyenx@hoanganh.com.vn', N'IT Support', N'HR&IT', N'IT Support', N'Văn phòng', 1
);
INSERT INTO dbo.Users (Username, FullName, Email, Role, Department, Position, Block, IsActive) VALUES (
  N'phuong.tran', N'Trần Hoàng Phương', NULL, N'User', N'Production', N'Production Line', N'Nhà máy', 1
);
INSERT INTO dbo.Users (Username, FullName, Email, Role, Department, Position, Block, IsActive) VALUES (
  N'luan.tran', N'Trần Văn Thành Luận', NULL, N'User', N'Production', N'Production Staff', N'Nhà máy', 1
);
INSERT INTO dbo.Users (Username, FullName, Email, Role, Department, Position, Block, IsActive) VALUES (
  N'quy.daom', N'Đào Minh Quý', N'quy.daom@hoanganh.com.vn', N'User', N'Production', N'Senior Production Line', N'Nhà máy', 1
);
INSERT INTO dbo.Users (Username, FullName, Email, Role, Department, Position, Block, IsActive) VALUES (
  N'viet.nguyen', N'Nguyễn Minh Việt', NULL, N'User', N'Production', N'Production Staff', N'Nhà máy', 1
);
INSERT INTO dbo.Users (Username, FullName, Email, Role, Department, Position, Block, IsActive) VALUES (
  N'son.nguyen', N'Nguyễn Văn Sơn', NULL, N'User', N'Production', N'Production Line', N'Nhà máy', 1
);
INSERT INTO dbo.Users (Username, FullName, Email, Role, Department, Position, Block, IsActive) VALUES (
  N'đai.le', N'Lê Thanh Đại', NULL, N'User', N'Planning&Delivery', N'Driver', N'Nhà máy', 1
);
INSERT INTO dbo.Users (Username, FullName, Email, Role, Department, Position, Block, IsActive) VALUES (
  N'thuy.nguyentt', N'Nguyễn Thị Thanh Thúy', N'thuy.nguyentt@hoanganh.com.vn', N'User', N'QM', N'Regulation Excutive', N'Nhà máy', 1
);
INSERT INTO dbo.Users (Username, FullName, Email, Role, Department, Position, Block, IsActive) VALUES (
  N'đien.ho', N'Hồ Văn Điền', NULL, N'User', N'Production', N'Production Line', N'Nhà máy', 1
);
INSERT INTO dbo.Users (Username, FullName, Email, Role, Department, Position, Block, IsActive) VALUES (
  N'quoc.ngov', N'Ngô Văn Quốc', N'quoc.ngov@hoanganh.com.vn', N'User', N'Production', N'Production Manager', N'Nhà máy', 1
);
INSERT INTO dbo.Users (Username, FullName, Email, Role, Department, Position, Block, IsActive) VALUES (
  N'khanh.nguyen', N'Nguyễn Phương Khanh', NULL, N'User', N'Production', N'Production Leader', N'Nhà máy', 1
);
INSERT INTO dbo.Users (Username, FullName, Email, Role, Department, Position, Block, IsActive) VALUES (
  N'vinh.tran', N'Trần Trọng Vinh', NULL, N'User', N'Production', N'Production Staff', N'Nhà máy', 1
);
INSERT INTO dbo.Users (Username, FullName, Email, Role, Department, Position, Block, IsActive) VALUES (
  N'din.trant', N'Trần Tiến Din', N'din.trant@hoanganh.com.vn', N'User', N'ME&Warehouse', N'Senior Project Engineering', N'Nhà máy', 1
);
INSERT INTO dbo.Users (Username, FullName, Email, Role, Department, Position, Block, IsActive) VALUES (
  N'ha.tran', N'Trần Thị Hà', NULL, N'User', N'Plant Admin', N'Cleaner', N'Nhà máy', 1
);
INSERT INTO dbo.Users (Username, FullName, Email, Role, Department, Position, Block, IsActive) VALUES (
  N'van.nguyen', N'Nguyễn Quốc Văn', NULL, N'User', N'ME&Warehouse', N'ME Technician', N'Nhà máy', 1
);
INSERT INTO dbo.Users (Username, FullName, Email, Role, Department, Position, Block, IsActive) VALUES (
  N'du.phamt', N'Nguyễn Thị Ngọc Huyền', N'huyen.nguyentn@hoanganh.com.vn', N'User', N'Production', N'ERP Assistant', N'Nhà máy', 1
);
INSERT INTO dbo.Users (Username, FullName, Email, Role, Department, Position, Block, IsActive) VALUES (
  N'than.nguyen', N'Nguyễn Viết Thân', NULL, N'User', N'Production', N'Production Line', N'Nhà máy', 1
);
INSERT INTO dbo.Users (Username, FullName, Email, Role, Department, Position, Block, IsActive) VALUES (
  N'thanh.tran', N'Trần Minh Thanh', NULL, N'User', N'Production', N'Production Line', N'Nhà máy', 1
);
INSERT INTO dbo.Users (Username, FullName, Email, Role, Department, Position, Block, IsActive) VALUES (
  N'tuyet.vo', N'Võ Thị Ánh Tuyết', NULL, N'User', N'Plant Admin', N'Cleaner', N'Nhà máy', 1
);
INSERT INTO dbo.Users (Username, FullName, Email, Role, Department, Position, Block, IsActive) VALUES (
  N'giang.tran', N'Trần Văn Giang', NULL, N'User', N'Production', N'Production Staff', N'Nhà máy', 1
);
INSERT INTO dbo.Users (Username, FullName, Email, Role, Department, Position, Block, IsActive) VALUES (
  N'phat.nguyent', N'Nguyễn Tấn Phát', N'phat.nguyent@hoanganh.com.vn', N'User', N'Production', N'Senior PE Specialist', N'Nhà máy', 1
);
INSERT INTO dbo.Users (Username, FullName, Email, Role, Department, Position, Block, IsActive) VALUES (
  N'minh.nguyen', N'Nguyễn Trọng Minh', NULL, N'User', N'Production', N'Production Staff', N'Nhà máy', 1
);
INSERT INTO dbo.Users (Username, FullName, Email, Role, Department, Position, Block, IsActive) VALUES (
  N'man.đao', N'Đào Minh Mẩn', NULL, N'User', N'Production', N'Production Staff', N'Nhà máy', 1
);
INSERT INTO dbo.Users (Username, FullName, Email, Role, Department, Position, Block, IsActive) VALUES (
  N'tuan.nguyen', N'Nguyễn Lương Tuấn', NULL, N'User', N'Production', N'Production Staff', N'Nhà máy', 1
);
INSERT INTO dbo.Users (Username, FullName, Email, Role, Department, Position, Block, IsActive) VALUES (
  N'cuong.vu', N'Vũ Văn Cường', NULL, N'User', N'ME&Warehouse', N'ME Technician', N'Nhà máy', 1
);
INSERT INTO dbo.Users (Username, FullName, Email, Role, Department, Position, Block, IsActive) VALUES (
  N'dung.buitp', N'Bùi Thị Phương Dung', N'dung.buitp@hoanganh.com.vn', N'User', N'QM', N'QA Manager', N'Nhà máy', 1
);
INSERT INTO dbo.Users (Username, FullName, Email, Role, Department, Position, Block, IsActive) VALUES (
  N'hung.nguyen', N'Nguyễn Thanh Hùng', NULL, N'User', N'Planning&Delivery', N'Driver', N'Nhà máy', 1
);
INSERT INTO dbo.Users (Username, FullName, Email, Role, Department, Position, Block, IsActive) VALUES (
  N'thao.nguyentt', N'Nguyễn Thị Thu Thảo', N'thao.nguyentt@hoanganh.com.vn', N'User', N'QM', N'QA Executive', N'Nhà máy', 1
);
INSERT INTO dbo.Users (Username, FullName, Email, Role, Department, Position, Block, IsActive) VALUES (
  N'luan.tran', N'Trần Thành Luân', NULL, N'User', N'Production', N'Production Staff', N'Nhà máy', 1
);
INSERT INTO dbo.Users (Username, FullName, Email, Role, Department, Position, Block, IsActive) VALUES (
  N'thang.phamn', N'Nguyễn Hữu Thịnh', N'thang.phamn@hoanganh.com.vn', N'User', N'ME&Warehouse', N'ME & Warehouse Manager', N'Nhà máy', 1
);
INSERT INTO dbo.Users (Username, FullName, Email, Role, Department, Position, Block, IsActive) VALUES (
  N'tam.pham', N'Phạm Tuấn Tâm', NULL, N'User', N'Production', N'Production Staff', N'Nhà máy', 1
);
INSERT INTO dbo.Users (Username, FullName, Email, Role, Department, Position, Block, IsActive) VALUES (
  N'linh.huynhtt', N'Huỳnh Thị Thùy Linh', N'linh.huynhtt@hoanganh.com.vn', N'User', N'QM', N'QM Manager', N'Nhà máy', 1
);
INSERT INTO dbo.Users (Username, FullName, Email, Role, Department, Position, Block, IsActive) VALUES (
  N'nguyen.tran', N'Trần Thái Nguyên', NULL, N'User', N'Production', N'Production Staff', N'Nhà máy', 1
);
INSERT INTO dbo.Users (Username, FullName, Email, Role, Department, Position, Block, IsActive) VALUES (
  N'tran.leh', N'Lê Huyền Trân', N'tran.leh@hoanganh.com.vn', N'User', N'QM', N'Lab Executive', N'Nhà máy', 1
);
INSERT INTO dbo.Users (Username, FullName, Email, Role, Department, Position, Block, IsActive) VALUES (
  N'mo.tran', N'Trần Thị Mộng Mơ', NULL, N'User', N'Production', N'Production Staff', N'Nhà máy', 1
);
INSERT INTO dbo.Users (Username, FullName, Email, Role, Department, Position, Block, IsActive) VALUES (
  N'hieu.đo', N'Đỗ Thành Hiếu', NULL, N'User', N'Production', N'Production Staff', N'Nhà máy', 1
);
INSERT INTO dbo.Users (Username, FullName, Email, Role, Department, Position, Block, IsActive) VALUES (
  N'tuan.nguyen', N'Nguyễn Hoàng Tuấn', NULL, N'User', N'Production', N'Production Staff', N'Nhà máy', 1
);
INSERT INTO dbo.Users (Username, FullName, Email, Role, Department, Position, Block, IsActive) VALUES (
  N'phong.le', N'Lê Thành Phong', NULL, N'User', N'Planning&Delivery', N'Driver', N'Nhà máy', 1
);
INSERT INTO dbo.Users (Username, FullName, Email, Role, Department, Position, Block, IsActive) VALUES (
  N'giang.đao', N'Đào Hoàng Giang', NULL, N'User', N'Production', N'Production Staff', N'Nhà máy', 1
);
INSERT INTO dbo.Users (Username, FullName, Email, Role, Department, Position, Block, IsActive) VALUES (
  N'phuoc.le', N'Lê Bá Phước', NULL, N'User', N'Planning&Delivery', N'Driver', N'Nhà máy', 1
);
INSERT INTO dbo.Users (Username, FullName, Email, Role, Department, Position, Block, IsActive) VALUES (
  N'long.thuong', N'Thượng Hoàng Long', NULL, N'User', N'Planning&Delivery', N'Driver', N'Nhà máy', 1
);
INSERT INTO dbo.Users (Username, FullName, Email, Role, Department, Position, Block, IsActive) VALUES (
  N'khoi.nguyenm', N'Nguyễn Minh Khôi', N'khoi.nguyenm@hoanganh.com.vn', N'User', N'QM', N'QA Executive', N'Nhà máy', 1
);
INSERT INTO dbo.Users (Username, FullName, Email, Role, Department, Position, Block, IsActive) VALUES (
  N'tuan.ha', N'Hà Văn Tuấn', NULL, N'User', N'Planning&Delivery', N'Driver', N'Nhà máy', 1
);
INSERT INTO dbo.Users (Username, FullName, Email, Role, Department, Position, Block, IsActive) VALUES (
  N'phong.thuong', N'Thượng Đình Phong', N'phong.thuong@hoanganh.com.vn', N'User', N'ME&Warehouse', N'WH Team Leader', N'Nhà máy', 1
);
INSERT INTO dbo.Users (Username, FullName, Email, Role, Department, Position, Block, IsActive) VALUES (
  N'dung.nguyen', N'Nguyễn Tuấn Dũng', NULL, N'User', N'Production', N'Production Leader', N'Nhà máy', 1
);
INSERT INTO dbo.Users (Username, FullName, Email, Role, Department, Position, Block, IsActive) VALUES (
  N'ngoc.doan', N'Đoàn Thị Ngọc', N'ngoc.doan@hoanganh.com.vn', N'User', N'Planning&Delivery', N'Planning Supervisor', N'Nhà máy', 1
);
INSERT INTO dbo.Users (Username, FullName, Email, Role, Department, Position, Block, IsActive) VALUES (
  N'luon.ha', N'Hà Xuân Luôn', NULL, N'User', N'Production', N'Production Line', N'Nhà máy', 1
);
INSERT INTO dbo.Users (Username, FullName, Email, Role, Department, Position, Block, IsActive) VALUES (
  N'huong.vo', N'Võ Thị Hương', NULL, N'User', N'QM', N'QA Executive', N'Nhà máy', 1
);
INSERT INTO dbo.Users (Username, FullName, Email, Role, Department, Position, Block, IsActive) VALUES (
  N'tang.nguyen', N'Nguyễn Văn Tăng', NULL, N'User', N'Production', N'Production Line', N'Nhà máy', 1
);
INSERT INTO dbo.Users (Username, FullName, Email, Role, Department, Position, Block, IsActive) VALUES (
  N'tuyet.nguyentn', N'Nguyễn Thị Ngọc Tuyết', N'tuyet.nguyentn@hoanganh.com.vn', N'User', N'ME&Warehouse', N'WH Officer', N'Nhà máy', 1
);
INSERT INTO dbo.Users (Username, FullName, Email, Role, Department, Position, Block, IsActive) VALUES (
  N'thang.pham', N'Phạm Ngọc Thắng', NULL, N'User', N'ME&Warehouse', N'ME Executive', N'Nhà máy', 1
);
INSERT INTO dbo.Users (Username, FullName, Email, Role, Department, Position, Block, IsActive) VALUES (
  N'ha.chau', N'Châu Thị Thu Hà', NULL, N'User', N'Production', N'Production Staff', N'Nhà máy', 1
);
INSERT INTO dbo.Users (Username, FullName, Email, Role, Department, Position, Block, IsActive) VALUES (
  N'lam.le', N'Lê Thanh Lâm', NULL, N'User', N'ME&Warehouse', N'ME Technician', N'Nhà máy', 1
);
INSERT INTO dbo.Users (Username, FullName, Email, Role, Department, Position, Block, IsActive) VALUES (
  N'nhieu.phung', N'Phùng Thanh Nhiều', N'nhieu.phung@hoanganh.com.vn', N'User', N'ME&Warehouse', N'ME Team Leader', N'Nhà máy', 1
);
INSERT INTO dbo.Users (Username, FullName, Email, Role, Department, Position, Block, IsActive) VALUES (
  N'binh.le', N'Lê Thanh Bình', NULL, N'User', N'Planning&Delivery', N'Driver', N'Nhà máy', 1
);
INSERT INTO dbo.Users (Username, FullName, Email, Role, Department, Position, Block, IsActive) VALUES (
  N'nhu.nguyen', N'Nguyễn Đông Nhu', N'nhu.nguyen@hoanganh.com.vn', N'User', N'Finance & Accounting', N'Sr. General Finance & Accounting', N'Nhà máy', 1
);
INSERT INTO dbo.Users (Username, FullName, Email, Role, Department, Position, Block, IsActive) VALUES (
  N'trinh.leb', N'Lê Bá Trình', N'trinh.leb@hoanganh.com.vn', N'User', N'Production', N'Production Leader', N'Nhà máy', 1
);
INSERT INTO dbo.Users (Username, FullName, Email, Role, Department, Position, Block, IsActive) VALUES (
  N'an.nguyent', N'Nguyễn Trường An', N'an.nguyent@hoanganh.com.vn', N'User', N'Planning&Delivery', N'Planning Executive', N'Nhà máy', 1
);
INSERT INTO dbo.Users (Username, FullName, Email, Role, Department, Position, Block, IsActive) VALUES (
  N'duy.to', N'Tô Vũ Duy', NULL, N'User', N'Production', N'Production Staff', N'Nhà máy', 1
);
INSERT INTO dbo.Users (Username, FullName, Email, Role, Department, Position, Block, IsActive) VALUES (
  N'my.letn', N'Lê Thị Như Mỹ', N'my.letn@hoanganh.com.vn', N'User', N'Plant Admin', N'Admin Officer', N'Nhà máy', 1
);
INSERT INTO dbo.Users (Username, FullName, Email, Role, Department, Position, Block, IsActive) VALUES (
  N'lan.nguyent', N'Nguyễn Thị Lan', N'lan.nguyent@hoanganh.com.vn', N'User', N'QM', N'QA Lab Technician', N'Nhà máy', 1
);
INSERT INTO dbo.Users (Username, FullName, Email, Role, Department, Position, Block, IsActive) VALUES (
  N'giang.le', N'Lê Quỳnh Giang', NULL, N'User', N'Finance & Accounting', N'Finance & Accounting Executive', N'Nhà máy', 1
);
INSERT INTO dbo.Users (Username, FullName, Email, Role, Department, Position, Block, IsActive) VALUES (
  N'cuong.nguyenq', N'Nguyễn Quốc Cường', N'cuong.nguyenq@hoanganh.com.vn', N'User', N'QM', N'QA Technician', N'Nhà máy', 1
);
INSERT INTO dbo.Users (Username, FullName, Email, Role, Department, Position, Block, IsActive) VALUES (
  N'binh.leq', N'Lê Quang Bình', N'binh.leq@hoanganh.com.vn', N'User', N'Planning&Delivery', N'Delivery Team Leader', N'Nhà máy', 1
);
INSERT INTO dbo.Users (Username, FullName, Email, Role, Department, Position, Block, IsActive) VALUES (
  N'liem.nguyen', N'Nguyễn Quang Liêm', NULL, N'User', N'QM', N'QA Technician', N'Nhà máy', 1
);
INSERT INTO dbo.Users (Username, FullName, Email, Role, Department, Position, Block, IsActive) VALUES (
  N'nhat.le', N'Lê Minh Nhật', NULL, N'User', N'Production', N'Production Leader', N'Nhà máy', 1
);
INSERT INTO dbo.Users (Username, FullName, Email, Role, Department, Position, Block, IsActive) VALUES (
  N'phuc.nguyen', N'Nguyễn Minh Phục', NULL, N'User', N'Production', N'Production Staff', N'Nhà máy', 1
);
INSERT INTO dbo.Users (Username, FullName, Email, Role, Department, Position, Block, IsActive) VALUES (
  N'huy.led', N'Lê Đức Huy', N'huy.led@hoanganh.com.vn', N'User', N'Plant Admin', N'Plant Director', N'Nhà máy', 1
);
INSERT INTO dbo.Users (Username, FullName, Email, Role, Department, Position, Block, IsActive) VALUES (
  N'son.tran', N'Trần Hùng Linh Sơn', NULL, N'User', N'ME&Warehouse', N'Warehouse Staff', N'Nhà máy', 1
);
INSERT INTO dbo.Users (Username, FullName, Email, Role, Department, Position, Block, IsActive) VALUES (
  N'tam.nguyen', N'Nguyễn Văn Tâm', NULL, N'User', N'Production', N'Production staff', N'Nhà máy', 1
);
INSERT INTO dbo.Users (Username, FullName, Email, Role, Department, Position, Block, IsActive) VALUES (
  N'thanh.nguyen', N'Nguyễn Huỳnh Tấn Thành', NULL, N'User', N'QM', N'QA Technician', N'Nhà máy', 1
);
INSERT INTO dbo.Users (Username, FullName, Email, Role, Department, Position, Block, IsActive) VALUES (
  N'son.đoan', N'Đoàn Văn Sơn', NULL, N'User', N'Production', N'Production staff', N'Nhà máy', 1
);
INSERT INTO dbo.Users (Username, FullName, Email, Role, Department, Position, Block, IsActive) VALUES (
  N'hau.nguyen', N'Nguyễn Trung Hậu', NULL, N'User', N'Production', N'Production staff', N'Nhà máy', 1
);
INSERT INTO dbo.Users (Username, FullName, Email, Role, Department, Position, Block, IsActive) VALUES (
  N'tuyen.truong', N'Trương Thị Thanh Tuyền', NULL, N'User', N'Production', N'Production staff', N'Nhà máy', 1
);
INSERT INTO dbo.Users (Username, FullName, Email, Role, Department, Position, Block, IsActive) VALUES (
  N'thang.nguyen', N'Nguyễn Quốc Thắng', NULL, N'User', N'QM', N'QA Line', N'Nhà máy', 1
);
INSERT INTO dbo.Users (Username, FullName, Email, Role, Department, Position, Block, IsActive) VALUES (
  N'diem.huynhta', N'Huỳnh Thị Ái Diễm', N'diem.huynhta@hoanganh.com.vn', N'User', N'Finance & Accounting', N'Finance & Accounting Executive', N'Văn phòng', 1
);
INSERT INTO dbo.Users (Username, FullName, Email, Role, Department, Position, Block, IsActive) VALUES (
  N'duyen.nguyentm', N'Nguyễn Thị Mỹ Duyên', N'duyen.nguyentm@hoanganh.com.vn', N'User', N'Procurement', N'Senior Import, Export Executive', N'Văn phòng', 1
);
INSERT INTO dbo.Users (Username, FullName, Email, Role, Department, Position, Block, IsActive) VALUES (
  N'vantrang.pham', N'Phạm Thị Vân Trang', N'vantrang.pham@hoanganh.com.vn', N'User', N'Flavor & Application', N'Senior Flavorist', N'Văn phòng', 1
);
INSERT INTO dbo.Users (Username, FullName, Email, Role, Department, Position, Block, IsActive) VALUES (
  N'nga.nguyentn', N'Nguyễn Thị Ngọc Nga', N'nga.nguyentn@hoanganh.com.vn', N'User', N'Flavor & Application', N'Savoury Application Team Leader', N'Văn phòng', 1
);
INSERT INTO dbo.Users (Username, FullName, Email, Role, Department, Position, Block, IsActive) VALUES (
  N'chi.buinv', N'Bùi Ngọc Vân Chi', N'chi.buinv@hoanganh.com.vn', N'User', N'Flavor & Application', N'Flavorist cum Business Development Support', N'Văn phòng', 1
);
INSERT INTO dbo.Users (Username, FullName, Email, Role, Department, Position, Block, IsActive) VALUES (
  N'đuoc.nguyen', N'Nguyễn Văn Được', NULL, N'User', N'BOM', N'Driver', N'Văn phòng', 1
);
INSERT INTO dbo.Users (Username, FullName, Email, Role, Department, Position, Block, IsActive) VALUES (
  N'quoc.le', N'Lê Phú Quốc', NULL, N'User', N'Flavor & Application', N'Driver', N'Văn phòng', 1
);
INSERT INTO dbo.Users (Username, FullName, Email, Role, Department, Position, Block, IsActive) VALUES (
  N'khanh.le', N'Lê Văn Khanh', NULL, N'User', N'HR&IT', N'Driver & Gardener', N'Văn phòng', 1
);
INSERT INTO dbo.Users (Username, FullName, Email, Role, Department, Position, Block, IsActive) VALUES (
  N'thuy.đinh', N'Đinh Thị Thủy', NULL, N'User', N'HR&IT', N'Cleaner', N'Văn phòng', 1
);
INSERT INTO dbo.Users (Username, FullName, Email, Role, Department, Position, Block, IsActive) VALUES (
  N'tho.trant', N'Trần Thị Thọ', N'tho.trant@hoanganh.com.vn', N'User', N'Flavor & Application', N'Flavor Support Executive', N'Văn phòng', 1
);
INSERT INTO dbo.Users (Username, FullName, Email, Role, Department, Position, Block, IsActive) VALUES (
  N'thuy.phan', N'Phan Thị Thúy', NULL, N'User', N'Flavor & Application', N'Senior Food Technologist', N'Văn phòng', 1
);
INSERT INTO dbo.Users (Username, FullName, Email, Role, Department, Position, Block, IsActive) VALUES (
  N'thu.nguyenna', N'Nguyễn Ngọc Anh Thư', N'thu.nguyenna@hoanganh.com.vn', N'User', N'Commercial', N'Account Executive', N'Văn phòng', 1
);
INSERT INTO dbo.Users (Username, FullName, Email, Role, Department, Position, Block, IsActive) VALUES (
  N'van.vo', N'Võ Thị Ngọc Vân', NULL, N'User', N'Flavor & Application', N'Flavor Support Coordinator', N'Văn phòng', 1
);
INSERT INTO dbo.Users (Username, FullName, Email, Role, Department, Position, Block, IsActive) VALUES (
  N'duy.pham', N'Phạm Thị Duy', NULL, N'User', N'BOM', N'General Director', N'Văn phòng', 1
);
INSERT INTO dbo.Users (Username, FullName, Email, Role, Department, Position, Block, IsActive) VALUES (
  N'chuyen.pham', N'Phạm Thị Chuyên', N'chuyen.pham@hoanganh.com.vn', N'User', N'Flavor & Application', N'Senior Technical Advisor & Senior Flavorist', N'Văn phòng', 1
);
INSERT INTO dbo.Users (Username, FullName, Email, Role, Department, Position, Block, IsActive) VALUES (
  N'quyen.le', N'Lê Văn Quyền', NULL, N'User', N'Commercial', N'Commercial Director', N'Văn phòng', 1
);
INSERT INTO dbo.Users (Username, FullName, Email, Role, Department, Position, Block, IsActive) VALUES (
  N'trang.pham', N'Phạm Thị Ngọc Trang', N'trang.pham@hoanganh.com.vn', N'User', N'Flavor & Application', N'Senior Flavorist', N'Văn phòng', 1
);
INSERT INTO dbo.Users (Username, FullName, Email, Role, Department, Position, Block, IsActive) VALUES (
  N'tuyen.pham', N'Phạm Thị Anh Tuyền', NULL, N'User', N'Procurement', N'Procurement Director', N'Văn phòng', 1
);
INSERT INTO dbo.Users (Username, FullName, Email, Role, Department, Position, Block, IsActive) VALUES (
  N'phuc.le', N'Lê Thị Ánh Phúc', N'phuc.le@hoanganh.com.vn', N'User', N'Procurement', N'Local Purchasing Manager', N'Văn phòng', 1
);
INSERT INTO dbo.Users (Username, FullName, Email, Role, Department, Position, Block, IsActive) VALUES (
  N'tinh.nguyen', N'Nguyễn Tấn Tĩnh', NULL, N'User', N'Finance & Accounting', N'Head of Finance and Accounting', N'Văn phòng', 1
);
INSERT INTO dbo.Users (Username, FullName, Email, Role, Department, Position, Block, IsActive) VALUES (
  N'thu.le', N'Lê Nguyễn Phương Thư', NULL, N'User', N'Finance & Accounting', N'Deputy F&A manager', N'Văn phòng', 1
);
INSERT INTO dbo.Users (Username, FullName, Email, Role, Department, Position, Block, IsActive) VALUES (
  N'hanh.huynhnh', N'Huỳnh Nguyễn Hồng Hạnh', N'hanh.huynhnh@hoanganh.com.vn', N'User', N'Commercial', N'Senior Account Executive', N'Văn phòng', 1
);
INSERT INTO dbo.Users (Username, FullName, Email, Role, Department, Position, Block, IsActive) VALUES (
  N'anh.nguyentl', N'Nguyễn Thị Lan Anh', N'anh.nguyentl@hoanganh.com.vn', N'User', N'Commercial', N'Account Executive', N'Văn phòng', 1
);
INSERT INTO dbo.Users (Username, FullName, Email, Role, Department, Position, Block, IsActive) VALUES (
  N'luc.tran', N'Trần Lực', N'luc.tran@hoanganh.com.vn', N'User', N'Flavor & Application', N'Senior R&D Specialist', N'Văn phòng', 1
);
INSERT INTO dbo.Users (Username, FullName, Email, Role, Department, Position, Block, IsActive) VALUES (
  N'anh.bui', N'Bùi Ngọc Vân Anh', N'anh.bui@hoanganh.com.vn', N'User', N'Flavor & Application', N'Flavor Creation Director', N'Văn phòng', 1
);
INSERT INTO dbo.Users (Username, FullName, Email, Role, Department, Position, Block, IsActive) VALUES (
  N'điep.nguyen', N'Nguyễn Thị Điệp', NULL, N'User', N'HR&IT', N'Cleaner', N'Văn phòng', 1
);
INSERT INTO dbo.Users (Username, FullName, Email, Role, Department, Position, Block, IsActive) VALUES (
  N'cuong.huynh', N'Huỳnh Mạnh Cường', N'cuong.huynh@hoanganh.com.vn', N'User', N'Commercial', N'Senior Account Executive', N'Văn phòng', 1
);
INSERT INTO dbo.Users (Username, FullName, Email, Role, Department, Position, Block, IsActive) VALUES (
  N'bay.le', N'Lê Bảy', N'bay.le@hoanganh.com.vn', N'User', N'Procurement', N'Local Purchasing Executive', N'Văn phòng', 1
);
INSERT INTO dbo.Users (Username, FullName, Email, Role, Department, Position, Block, IsActive) VALUES (
  N'xiu.nguyen', N'Nguyễn Thị Lê Xíu', NULL, N'User', N'Flavor & Application', N'Flavor Support Teamleader', N'Văn phòng', 1
);
INSERT INTO dbo.Users (Username, FullName, Email, Role, Department, Position, Block, IsActive) VALUES (
  N'hue.khat', N'Kha Tuyết Huệ', N'hue.khat@hoanganh.com.vn', N'User', N'Flavor & Application', N'Flavor Support Executive', N'Văn phòng', 1
);
INSERT INTO dbo.Users (Username, FullName, Email, Role, Department, Position, Block, IsActive) VALUES (
  N'an.truong', N'Trương Lại Thùy An', NULL, N'User', N'Flavor & Application', N'Senior Regulation Specialist', N'Văn phòng', 1
);
INSERT INTO dbo.Users (Username, FullName, Email, Role, Department, Position, Block, IsActive) VALUES (
  N'hang.trinh', N'Trịnh Thu Hằng', N'hang.trinh@hoanganh.com.vn', N'User', N'Finance & Accounting', N'Finance & Accounting Executive', N'Văn phòng', 1
);
INSERT INTO dbo.Users (Username, FullName, Email, Role, Department, Position, Block, IsActive) VALUES (
  N'duyen.nguyen', N'Nguyễn Thúy Thảo Duyên', NULL, N'User', N'Flavor & Application', N'Sweet Application Team Leader', N'Văn phòng', 1
);
INSERT INTO dbo.Users (Username, FullName, Email, Role, Department, Position, Block, IsActive) VALUES (
  N'tran.nguyenb', N'Nguyễn Ngọc Bảo Trân', N'tran.nguyenb@hoanganh.com.vn', N'User', N'Flavor & Application', N'Food Technologist', N'Văn phòng', 1
);
INSERT INTO dbo.Users (Username, FullName, Email, Role, Department, Position, Block, IsActive) VALUES (
  N'thanh.trantp', N'Trần Thị Phương Thanh', N'thanh.trantp@hoanganh.com.vn', N'User', N'HR&IT', N'Deputy HR Manager', N'Văn phòng', 1
);
INSERT INTO dbo.Users (Username, FullName, Email, Role, Department, Position, Block, IsActive) VALUES (
  N'manh.huynhn', N'Huỳnh Ngọc Mạnh', N'manh.huynhn@hoanganh.com.vn', N'User', N'Flavor & Application', N'Food Technologist', N'Văn phòng', 1
);
INSERT INTO dbo.Users (Username, FullName, Email, Role, Department, Position, Block, IsActive) VALUES (
  N'ha.von', N'Võ Ngọc Hà', N'ha.von@@hoanganh.com.vn', N'User', N'Commercial', N'Senior Key Account Manager', N'Văn phòng', 1
);
INSERT INTO dbo.Users (Username, FullName, Email, Role, Department, Position, Block, IsActive) VALUES (
  N'duong.nguyenpt', N'Nguyễn Phan Thùy Dương', N'duong.nguyenpt@hoanganh.com.vn', N'User', N'Commercial', N'Marketing Specialist', N'Văn Phòng', 1
);
INSERT INTO dbo.Users (Username, FullName, Email, Role, Department, Position, Block, IsActive) VALUES (
  N'kim.huynht', N'Huỳnh Thị Kim', N'kim.huynht@hoanganh.com.vn', N'User', N'Flavor & Application', N'Flavor Support Executive', N'Văn phòng', 1
);
INSERT INTO dbo.Users (Username, FullName, Email, Role, Department, Position, Block, IsActive) VALUES (
  N'khue.nguyentn', N'Nguyễn Thị Ngọc Khuê', N'khue.nguyentn@@hoanganh.com.vn', N'User', N'Commercial', N'Senior Account Executive', N'Văn phòng', 1
);
INSERT INTO dbo.Users (Username, FullName, Email, Role, Department, Position, Block, IsActive) VALUES (
  N'nhung.tran', N'Trần Thị Cẩm Nhung', NULL, N'User', N'Flavor & Application', N'Flavor Support Executive', N'Văn phòng', 1
);
INSERT INTO dbo.Users (Username, FullName, Email, Role, Department, Position, Block, IsActive) VALUES (
  N'ha.buih', N'Bùi Hoàng Hà', N'ha.buih@hoanganh.com.vn', N'User', N'Commercial', N'Key Account Team Leader', N'Văn phòng', 1
);
INSERT INTO dbo.Users (Username, FullName, Email, Role, Department, Position, Block, IsActive) VALUES (
  N'yosuke.nakada', N'Nakada Yosuke', NULL, N'User', N'PMI', N'Strategy & Planning Manager', N'Văn phòng', 1
);
INSERT INTO dbo.Users (Username, FullName, Email, Role, Department, Position, Block, IsActive) VALUES (
  N'duyen.huynh', N'Huỳnh Thị Mỹ Duyên', NULL, N'User', N'HR&IT', N'HR Executive', N'Văn phòng', 1
);
INSERT INTO dbo.Users (Username, FullName, Email, Role, Department, Position, Block, IsActive) VALUES (
  N'giang.phamnm', N'Phạm Nhật Minh Giang', N'giang.phamnm@hoanganh.com.vn', N'User', N'Commercial', N'Senior Account Executive', N'Văn phòng', 1
);
INSERT INTO dbo.Users (Username, FullName, Email, Role, Department, Position, Block, IsActive) VALUES (
  N'yuya.hamasaki', N'Hamasaki Yuya', NULL, N'User', N'PMI', N'Deputy General Director', N'Văn phòng', 1
);
INSERT INTO dbo.Users (Username, FullName, Email, Role, Department, Position, Block, IsActive) VALUES (
  N'hang.nguyen', N'Nguyễn Thị Mỹ Hằng', NULL, N'User', N'PMI', N'Strategic Account Support Executive', N'Văn phòng', 1
);
INSERT INTO dbo.Users (Username, FullName, Email, Role, Department, Position, Block, IsActive) VALUES (
  N'tan.trann', N'Trần Ngọc Tấn', N'tan.trann@hoanganh.com.vn', N'User', N'Commercial', N'Key Account Manager', N'Văn phòng', 1
);
INSERT INTO dbo.Users (Username, FullName, Email, Role, Department, Position, Block, IsActive) VALUES (
  N'trinh.phan', N'Phan Thị Tuyết Trinh', NULL, N'User', N'Flavor&Application', N'Technical Admin', N'Văn phòng', 1
);
INSERT INTO dbo.Users (Username, FullName, Email, Role, Department, Position, Block, IsActive) VALUES (
  N'tuyen.nguyen', N'Nguyễn Thị Thanh Tuyền', NULL, N'User', N'BOM', N'Deputy General Director', N'Văn phòng', 1
);
INSERT INTO dbo.Users (Username, FullName, Email, Role, Department, Position, Block, IsActive) VALUES (
  N'thao.mait', N'Nguyễn Trâm Anh', N'thao.mait@hoanganh.com.vn', N'User', N'Commercial', N'Sales Support Executive', N'Văn phòng', 1
);
INSERT INTO dbo.Users (Username, FullName, Email, Role, Department, Position, Block, IsActive) VALUES (
  N'danh.pham', N'Phạm Công Danh', NULL, N'User', N'Chung Sức', N'Quản lý sản xuất', N'Nhà máy', 1
);
INSERT INTO dbo.Users (Username, FullName, Email, Role, Department, Position, Block, IsActive) VALUES (
  N'mai.ngo', N'Ngô Ngọc Phương Mai', NULL, N'User', N'Chung Sức', N'Senior Purchasing Executive', N'Văn phòng', 1
);
GO

INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  1, NULL, N'Máy tính', N'Laptop', N'HP 340S G7 Notebook PC', NULL,
  N'5CD1131WHJ', NULL, NULL, N'Commnercial',
  N'Bùi Ngọc Minh Trang', NULL, N'Intel Core i3 1005G1', N'8 GB', N'256 GB SSD',
  NULL, NULL,
  N'12/01/2021', N'11/30/2024', N'10/01/2023', N'11/30/2024',
  N'Đã hết hạn', N'Chưa được gia hạn', NULL, N'Đang sử dụng song song 2 máy Window và MacOS',
  NULL, NULL, NULL, N'Trong niên hạn', N'Disabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  2, 105, N'Máy tính', N'Laptop', N'HP 14 Laptop PC 14-d5000', NULL,
  N'5CD24314RP', NULL, NULL, N'Flavor',
  N'Bùi Ngọc Vân Anh', N'Windows 11', N'12th Gen Intel(R) Core(TM) i7-1255U', N'8GB - 3200- 2/2 SLOT', N'500GB SSD - SK Hynix',
  N'Yes', N'26gb/ 99gb',
  N'08/01/2022', N'07/31/2025', N'10/22/2026', N'10/22/2027',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Sử dụng bình thường',
  NULL, NULL, NULL, N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  3, 85, N'Máy tính', N'Laptop', N'HP 340S G7 Notebook', NULL,
  N'5CD151GWK8', NULL, NULL, N'Flavor',
  N'Bùi Ngọc Vân Chi', N'Windows 11', N'Intel Core i5 1035G1', N'8GB - 3200 - 1/2 SLOT', N'500GB SSD SK Hynix',
  N'Yes', N'26.5 free of 99gb',
  N'03/01/2022', N'02/28/2025', N'10/22/2026', N'10/22/2027',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Sử dụng bình thường',
  NULL, NULL, NULL, N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  4, 31, N'Máy tính', N'Laptop', N'HP ProBook 440 G6 Notebook PC', NULL,
  N'5CD9312KQ9', NULL, NULL, N'QM',
  N'Bùi Thị Phương Dung', N'Windows 11', N'Intel Core i5 8265U', N'8 GB', N'256 GB SSD + 500 GB HDD',
  N'Yes', NULL,
  N'03/01/2020', N'03/01/2023', N'10/14/2026', N'10/14/2027',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Máy cũ của chị Dung',
  NULL, NULL, N'Đang được dùng làm máy Training', N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  5, NULL, N'Máy tính', N'Desktop', N'DESKTOP-OA2I6Q1', NULL,
  N'SAMA', NULL, NULL, N'Quality Management (QM)',
  N'Bùi Thị Yến Ngọc', NULL, N'Intel Pentium G4560', N'8 GB', N'500 GB SSD',
  NULL, NULL,
  N'01/01/2018', N'12/31/2020', N'10/01/2023', N'09/30/2024',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Máy tính còn sử dụng HDD thường xuyên chậm máy, treo máy khi sử dụng các file, ổ chung',
  N'Cần nâng cấp ổ cứng SSD', NULL, N'Đã nâng cấp ổ cứng SSD ngày 31/10/2023', N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  6, NULL, N'Máy tính', N'Laptop', N'HP Pavilion 14 Laptop PC 14-dv2000', NULL,
  N'5CD2472LS9', NULL, NULL, N'Commnercial',
  N'Cao Hữu Ngọc Hoàng', NULL, N'12th Gen Intel Core i5-1235U', N'8 GB', N'512 GB SSD',
  NULL, NULL,
  N'06/01/2023', N'05/31/2026', N'10/01/2023', N'05/31/2026',
  N'Đã hết hạn', N'Chưa được gia hạn', NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Máy mới được cấp vào tháng 06-2023', N'Trong niên hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  7, NULL, N'Máy tính', N'Desktop', N'DESKTOP - J5SD467', NULL,
  N'SAMA', NULL, NULL, N'Flavor',
  N'Đặng Tuyết Quỳnh Phương', NULL, N'Intel Pentium G4400', N'4 GB', N'256 GB SSD',
  NULL, NULL,
  N'11/01/2019', N'10/31/2022', N'10/01/2023', N'10/31/2022',
  N'Đã hết hạn', N'Chưa được gia hạn', NULL, N'Máy tính đã hết niên hạn sử dụng và hiện tại máy tính đang sử dụng ổn định chưa phát sinh gì nhưng về sau sẽ chậm máy do RAM còn quá thấp',
  N'Cần nâng cấp RAM', NULL, NULL, N'Cần nâng cấp', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  8, 9, N'Máy tính', N'Desktop', N'Neo 50t Gen 3 Desktop (ThinkCentre)', NULL,
  N'GM03S1N6', NULL, NULL, N'Production',
  N'Đào Minh Quý', N'Windows 11', N'12th Gen Intel Core i3-12100', N'8GB', N'256 GB SSD - WD PC',
  N'Yes', N'13Gb / 99gb',
  N'06/01/2023', N'05/31/2026', N'04/29/2026', N'05/31/2026',
  N'Đã hết hạn', N'Chưa được gia hạn', NULL, N'Máy tính cần thay RAM',
  NULL, NULL, NULL, N'Trong niên hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  9, 120, N'Máy tính', N'Laptop', N'HP Probook 440 G7', NULL,
  N'5CD0190WQ5', NULL, NULL, N'Sales',
  N'Nguyễn Thị Ngọc Khuê', N'Windows 11', N'Intel Core i3-1005G1', N'8GB - 2667 - 2/2 slot', N'250GB SSD - WDC',
  N'Yes', N'11.2 gb / 99gb',
  NULL, N'12/30/1902', N'10/19/2026', N'12/30/1902',
  N'Đã hết hạn', N'Chưa được gia hạn', NULL, N'Máy giật lag khi mở nhiều file excel',
  NULL, NULL, NULL, N'Nâng cấp RAM', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  10, NULL, N'Máy tính', N'Desktop', N'Dell Vostro 3670', NULL,
  N'HJC3WV2', NULL, NULL, N'Quality Management (QM)',
  N'Dương Ngọc Sơn', NULL, N'Intel Pentium Gold G5400', N'8 GB', N'500 GB SSD',
  NULL, NULL,
  N'06/01/2020', N'06/01/2023', N'10/01/2023', N'09/30/2024',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Máy tính đã hết niên hạn sử dụng và máy tính chậm thường xuyên treo máy, bị màn hình xanh khi khởi động máy tính',
  N'Cần nâng cấp ổ cứng SSD', NULL, N'Đã nâng cấp ổ cứng ngày 18/10/2023', N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  11, 124, N'Máy tính', N'Laptop', N'HP Pavilion 14 Laptop PC 14-dv2000 (4Z018AV)', NULL,
  N'5CD2379SWJ', NULL, NULL, N'HR',
  N'Huỳnh Thị Mỹ Duyên', N'Windows 11', N'12th Gen Intel(R) Core(TM) i5-1235U', N'8GB-BUS3200-2/2 slot', N'512 GB SSD WDC',
  N'Yes', NULL,
  N'12/01/2022', N'11/30/2025', N'10/16/2026', N'10/16/2027',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Sử dụng bình thường',
  NULL, NULL, NULL, N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  12, NULL, N'Máy tính', N'Desktop', N'Dell Vostro 3671', NULL,
  N'29W4R33', NULL, NULL, N'Application',
  N'Hoàng Thị Kim Phương', NULL, N'Intel Pentium Gold G5420', N'8 GB', N'500 GB SSD',
  NULL, NULL,
  N'06/01/2021', N'05/31/2024', N'10/01/2023', N'09/30/2024',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Máy tính chạy chậm, treo máy khi làm việc với các tác vụ của Microsoft',
  N'Cần nâng cấp ổ cứng SSD', NULL, N'Đã nâng cấp ổ cứng SSD ngày 11/10/2023', N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  13, NULL, N'Máy tính', N'Desktop', N'DESKTOP-HMQ10T4', NULL,
  N'SAMA', NULL, NULL, N'Application',
  N'Hoàng Thị Thanh Mỹ', NULL, N'Intel(R) Pentium(R) CPU G3260', N'8 GB', N'500 GB SSD',
  NULL, NULL,
  N'05/01/2022', N'04/30/2025', N'10/01/2023', N'09/30/2024',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Máy tính sử dụng bình thường nhưng ổ cứng không đáp ứng nhu cầu làm việc',
  N'Cần nâng cấp ổ cứng SSD', NULL, N'Đã nâng cấp ổ cứng SSD ngày 11/10/2023', N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  14, 131, N'Máy tính', N'Laptop', N'HP 340s G7', NULL,
  N'5CD1389YBG', NULL, NULL, N'Sales',
  N'Nguyễn Trâm Anh', N'Windows 11', N'Intel Core i3-1005G1', N'8GB - 2667 - 2/2 slot', N'500GB SSD SK Hynix',
  N'Yes', N'2gb / 99gb',
  NULL, N'12/30/1902', N'10/19/2026', N'10/19/2027',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Sử dụng bình thường , đề xuất nâng cấp RAM',
  NULL, NULL, NULL, N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  15, NULL, N'Máy tính', N'Laptop', N'HP 340S G7 Notebook PC', NULL,
  N'5CD1389YDP', NULL, NULL, N'Commnercial',
  N'Huỳnh Thanh Sơn', NULL, N'Intel Core i3 1005G1', N'8 GB', N'256 GB SSD',
  NULL, NULL,
  N'08/01/2021', N'07/31/2024', N'10/01/2023', N'07/31/2024',
  N'Đã hết hạn', N'Chưa được gia hạn', NULL, N'Sử dụng bình thường',
  NULL, NULL, NULL, N'Trong niên hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  16, 81, N'Máy tính', N'Desktop', N'HP Desktop M01', NULL,
  N'1R57R13', NULL, NULL, N'Finance & Accounting',
  N'Huỳnh Thị Ái Diễm', N'Windows 11', N'13th Intel Core  i5 13400', N'8 GB - 3200 - 1/2 slot', N'500 GB SSD - WDC',
  N'Yes', N'50gb / 99gb',
  N'05/01/2021', N'04/30/2024', N'10/21/2026', N'10/21/2027',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Máy sử dụng bình thường',
  NULL, NULL, NULL, N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  17, 37, N'Máy tính', N'Desktop', N'HP ENVY Laptop 13-ba1000 (1F4E5AV)', NULL,
  N'CND2023PWH', NULL, NULL, N'QM',
  N'Huỳnh Thị Thùy Linh', N'Windows 11', N'11th Gen Intel(R) Core(TM) i5-1135G7', N'8GB-BUS3200-2/2 slot', N'500GB SSD - Kingston',
  N'Yes', N'49gb / 99gb',
  N'11/01/2022', N'10/31/2025', N'10/12/2026', N'10/12/2027',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Máy thiếu RAM, khi sử dụng nhiều ứng dụng',
  N'Nâng cấp RAM 16GB', NULL, NULL, N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  18, 110, N'Máy tính', N'Laptop', N'HP PROBOOK 440 G3', NULL,
  NULL, NULL, NULL, N'Flavor',
  N'Kha Tuyết Huệ', N'Windows 11', N'Intel Core i5 6200U', N'8 GB - DDR4 - 2133 - 2/2 slot', N'250GB SSD - SAMSUNG',
  N'Yes', N'14.8gb / 99gb',
  N'06/01/2016', N'06/01/2019', N'10/20/2026', N'06/01/2019',
  N'Đã hết hạn', N'Chưa được gia hạn', NULL, N'Máy đã hết niên hạn sử dụng , cần mua máy mới',
  NULL, NULL, NULL, N'Cần mua mới', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  19, NULL, N'Máy tính', N'Laptop', N'HP 340S G7 Notebook PC', NULL,
  N'5CD1080XKN', NULL, NULL, N'Application',
  N'Laptop dùng chung', N'Windows 11', N'Intel Core i3-1005G1', N'8 GB', N'512 GB SSD',
  N'Yes', NULL,
  N'11/01/2021', N'10/31/2024', N'10/22/2026', N'10/22/2027',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Sử dụng bình thường',
  NULL, NULL, NULL, N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  20, 62, N'Máy tính', N'Desktop', N'DESKTOP-R60MJDC', NULL,
  N'SAMA', NULL, NULL, N'Production',
  N'Lê Bá Trình', NULL, N'Intel Pentium G3450', N'6 GB', N'256 GB SSD',
  NULL, NULL,
  N'06/01/2018', N'05/31/2021', N'10/01/2023', N'09/30/2024',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Máy tính đã hết niên hạn sử dụng nhưng sử dụng bình thường',
  NULL, NULL, NULL, N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  21, NULL, N'Máy tính', N'Desktop', N'Dell Vostro 3670', NULL,
  N'7WL3WV2', NULL, NULL, N'QM',
  N'Võ Thị Hương SX', N'Windows 11', N'Intel Pentium CPU G5400', N'12GB - 8GB 3200 - & 4GB 2133 DDR4 - 2/2 slot', N'500GB SSD - SAMSUNG 870EVO',
  N'Yes', N'49.7gb / 99gb',
  N'10/01/2017', N'09/30/2020', N'10/12/2026', N'10/12/2027',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Máy sử dụng bình thường',
  NULL, NULL, NULL, N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  22, NULL, N'Máy tính', N'Desktop', N'Dell Vostro 3888', NULL,
  N'5PRW0D3', NULL, NULL, N'Commnercial',
  N'Lê Huy Cát', NULL, N'Intel Core i7 10700', N'32 GB', N'512 GB SSD + 1 TB HDD',
  NULL, NULL,
  N'05/01/2022', N'04/30/2025', N'10/01/2023', N'04/30/2025',
  N'Đã hết hạn', N'Chưa được gia hạn', NULL, N'Sử dụng bình thường',
  NULL, NULL, NULL, N'Trong niên hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  23, 39, N'Máy tính', N'Desktop', N'Dell Vostro 3670', NULL,
  N'4915HY2', NULL, NULL, N'QM',
  N'Lê Huyền Trân', N'Windows 11', N'Intel Pentium Gold G5420', N'8GB - 2400 - 2/2 slot', N'500GB SSD - SAMSUNG',
  N'Yes', N'7gb / 99gb',
  N'08/01/2020', N'08/01/2023', N'10/14/2026', N'08/01/2023',
  N'Đã hết hạn', N'Chưa được gia hạn', NULL, N'Máy tính đã hết niên hạn nhưng sử dụng bình thường',
  N'Nâng cấp RAM lên 1 thanh 16GB để hoạt động mượt mà với Windows 11', NULL, NULL, N'Nâng cấp RAM', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  24, NULL, N'Máy tính', N'Desktop', N'SAMA', NULL,
  N'SAMA', NULL, NULL, N'Application',
  N'Lê Kim Ngân', NULL, N'Intel Pentium G3440', N'8 GB', N'500 GB SSD',
  NULL, NULL,
  N'11/01/2021', N'10/31/2024', N'10/01/2023', N'09/30/2024',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Máy tính sử dụng bình thường nhưng ổ cứng không đáp ứng nhu cầu làm việc',
  N'Cần nâng cấp ổ cứng SSD', NULL, N'Đã nâng cấp ổ cứng SSD ngày 12/10/2023', N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  25, 101, N'Máy tính', N'Laptop', N'HP ProBook 440 G6 Notebook PC', NULL,
  N'5CD9302BC3', NULL, NULL, N'Finance & Accounting',
  N'Lê Nguyễn Phương Thư', N'Windows 11', N'Intel Core i5 8265U', N'8 GB', N'256 GB SSD',
  N'Yes', NULL,
  N'08/01/2021', N'07/31/2024', N'10/23/2026', N'10/23/2027',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Đã đầu tư máy mới , hiện tại vẫn đang giữ máy để backup',
  NULL, NULL, NULL, N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  26, 99, N'Máy tính', N'Laptop', N'HP Probook 440 G6 Notebook', NULL,
  N'5CD9271S5M', NULL, NULL, N'Purchasing',
  N'Lê Thị Ánh Phúc', N'Windows 11', N'Intel Core i5 8265U', N'8 GB', N'256 GB SSD Kingston + 500 GB HDD',
  N'Yes', N'59gb / 99gb',
  N'02/01/2019', N'01/31/2022', N'10/23/2026', N'10/23/2027',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Máy tính đã hết niên hạn sử dụng nhưng sử dụng bình thường',
  NULL, NULL, NULL, N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  27, NULL, N'Máy tính', N'Laptop', N'DESKTOP-EDIP08012', NULL,
  N'SAMA', NULL, NULL, N'Production',
  N'Production Public', N'Windows 11', N'Intel Pentium G2030', N'8 GB', N'500 GB SSD',
  NULL, NULL,
  N'01/01/2022', N'12/31/2024', N'10/14/2026', N'10/14/2027',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Đã nâng cấp ổ cứng SSD ngày 28/08/2023',
  NULL, NULL, N'Đã nâng cấp ổ cứng SSD ngày 28/08/2023', N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  28, NULL, N'Máy tính', N'Laptop', N'HP Pavilion - 14-bf017tu', NULL,
  N'CND7321MTZ', NULL, NULL, N'Ingredient',
  N'Lê Thị Mỹ Hiền', NULL, N'Intel Core i5 7200U', N'8 GB', N'500 GB SSD',
  NULL, NULL,
  N'08/01/2017', N'07/31/2020', N'10/01/2023', N'09/30/2024',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Máy tính đã hết niên hạn, bị lỗi màn hình xanh khi khởi động máy tính hoặc đang trong làm việc',
  N'Cần nâng cấp ổ cứng SSD', NULL, N'Đã nâng cấp ổ cứng SSD ngày 20/09/2023', N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  29, NULL, N'Máy tính', N'Laptop', N'HP 240 G8 Notebook PC', NULL,
  N'5CG13681KL', NULL, NULL, N'Ingredient',
  N'Lê Thuý Hà', NULL, N'Intel Core i3 1005G1', N'8 GB', N'256 GB SSD',
  NULL, NULL,
  N'11/01/2021', N'10/31/2024', N'10/01/2023', N'09/30/2024',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Sử dụng bình thường',
  NULL, NULL, NULL, N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  30, NULL, N'Máy tính', N'Desktop', N'Dell Vostro 3670', NULL,
  N'GSJF0T2', NULL, NULL, N'Finance & Accounting (F&A)',
  N'Lê Thuý Hằng', NULL, N'Intel Pentium Gold G5400', N'8 GB', N'1 TB HDD',
  NULL, NULL,
  N'05/01/2020', N'05/01/2023', N'10/01/2023', N'05/01/2023',
  N'Đã hết hạn', N'Chưa được gia hạn', NULL, N'Máy tính hết niên hạn sử dụng nhưng còn sử dụng HDD hay tình trạng đơ máy không đáp ứng nhu cầu làm việc về sau',
  N'Cần nâng cấp ổ cứng SSD', 1300000, NULL, N'Cần nâng cấp', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  31, 128, N'Máy tính', N'Laptop', N'HP 340s G7', NULL,
  N'5CD2106VMK', NULL, NULL, N'Sales',
  N'Trần Ngọc Tấn', N'Windows 11', N'Intel Core i5-1035G1', N'8GB-2400-1/2slot', N'240GB SSD - KIOXIA',
  N'Yes', NULL,
  NULL, N'12/30/1902', N'10/19/2026', N'10/19/2027',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Sử dụng bình thường',
  NULL, NULL, NULL, N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  32, NULL, N'Máy tính', N'Desktop', N'Dell Vostro 3671', NULL,
  N'5M3PG53', NULL, NULL, N'Flavor',
  N'Mạc Thị Ngọc Trâm', NULL, N'Intel Core i5 9400', N'8 GB', N'1 TB HDD',
  NULL, NULL,
  N'11/01/2021', N'10/31/2024', N'10/01/2023', N'09/30/2024',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Sử dụng bình thường',
  N'Nên nâng cấp ổ cứng lên SSD 512 GB', NULL, NULL, N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  33, NULL, N'Máy tính', N'Desktop', N'Dell Vostro 3670', NULL,
  N'6CK70T2', NULL, NULL, N'Quality Management (QM)',
  N'Mai Văn Tuấn', NULL, N'Intel Pentium Gold G5400', N'8 GB', N'500 GB SSD',
  NULL, NULL,
  N'11/01/2018', N'10/31/2021', N'10/01/2023', N'09/30/2024',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Máy tính đã hết niên hạn sử dụng, hay đơ máy, treo máy, xuất hiện màn hình xanh',
  N'Cần nâng cấp ổ cứng SSD', NULL, N'Đã nâng cấp ổ cứng ngày 18/10/2023', N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  34, NULL, N'Máy tính', N'Laptop', N'HP Probook 450 G5', NULL,
  N'5CD823C7B8', NULL, NULL, N'Commnercial',
  N'Ngô Huy Hoàng', NULL, N'Intel Core i5 8250U', N'8 GB', N'128 GB SSD + 500 GB HDD',
  NULL, NULL,
  N'06/01/2018', N'05/31/2021', NULL, NULL,
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Máy tính sử dụng các file Excel thì bị treo chuột tầm 1 - 3s và xảy ra thường xuyên',
  N'IT sẽ cập nhật lại driver chuột nếu trường hợp không khắc phục được sẽ tiến hành backup dữ liệu và cài lại window', NULL, N'Đang được IT quản lý', N'Tiếp tục gia hạn', N'Disabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  35, 69, N'Máy tính', N'Laptop', N'HP Probook 440 G7', NULL,
  N'5CD0128NKZ', NULL, NULL, N'Delivery',
  N'Lê Quang Bình', N'Windows 11', N'Intel Core i5 10210U', N'8GB - 2400 - DDR3 - 2/2 slot', N'512GB SSD',
  N'Yes', NULL,
  NULL, N'12/30/1902', N'04/16/2026', N'12/30/1902',
  N'Đã hết hạn', N'Chưa được gia hạn', NULL, N'Máy lag ở tác vụ bình thường và file excel > 1000 dòng',
  N'Nâng cấp Ram', NULL, NULL, N'Đã thu hồi về kho', N'Disabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  36, 127, N'Máy tính', N'Laptop', N'HP 245 G10', NULL,
  N'5CG53018MS', NULL, NULL, N'PMI',
  N'Nguyễn Thị Mỹ Hằng', N'Windows 11', N'AMD Ryzen 7 7730U', N'16GB - 3200 - 1/2 slot', N'500GB SSD - SAMSUNG',
  N'Yes', NULL,
  N'05/14/2026', N'05/13/2029', N'10/22/2026', N'05/13/2029',
  N'Còn hạn', N'Còn hạn', NULL, N'Máy tính mới mua',
  NULL, NULL, NULL, NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  37, NULL, N'Máy tính', N'Desktop', N'DESKTOP-OFC2QAO', NULL,
  N'SAMA', NULL, NULL, N'Quality Management (QM)',
  N'Nguyễn Chí Thanh', NULL, N'Intel(R) Pentium(R) CPU G4560', N'8 GB', N'500 GB HDD',
  NULL, NULL,
  N'04/01/2019', N'03/31/2022', N'10/01/2023', N'03/31/2022',
  N'Đã hết hạn', N'Chưa được gia hạn', NULL, N'Máy tính đã hết niên hạn sử dụng, sử dụng không ổn định hay chậm máy,treo máy và đáp ứng nhu cầu làm việc về tương lai',
  N'Cần nâng cấp ổ cứng SSD', 1300000, NULL, N'Cần nâng cấp', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  38, 61, N'Máy tính', N'Laptop', N'HP 340S G7 Notebook PC (8BC21AV)', NULL,
  N'5CD143H4C4', NULL, NULL, N'Finance & Accounting',
  N'Nguyễn Đông Nhu', N'Windows 11', N'Intel Core i5 1035G1', N'8GB-BUS3200-1/2 slot', N'500GB SSD - SK Hynix',
  N'Yes', N'30.5gb / 99gb',
  N'04/01/2022', N'03/31/2025', N'10/12/2026', N'10/12/2027',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Sử dụng bình thường',
  NULL, NULL, NULL, N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  39, NULL, N'Máy tính', N'Laptop', N'HP 340S G7 Notebook PC (8BC21AV)', NULL,
  N'5CD2106VFF', NULL, NULL, N'Commnercial',
  N'Nguyễn Hoàng Bảo', NULL, N'Intel Core i5 1035G1', N'8 GB', N'256 GB SSD',
  NULL, NULL,
  N'11/01/2022', N'10/31/2025', N'10/01/2023', N'10/31/2025',
  N'Đã hết hạn', N'Chưa được gia hạn', NULL, N'Sử dụng bình thường',
  NULL, NULL, NULL, N'Trong niên hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  40, 35, N'Máy tính', N'Laptop', N'HP 340S G7 Notebook PC (8BC21AV)', NULL,
  N'5CD1131Y30', NULL, NULL, N'ME',
  N'Nguyễn Hữu Thịnh', N'Windows 11', N'Intel Core i5 1035G1', N'8GB-BUS3200-1/2slot', N'512 GB SSD kioxia',
  N'Yes', N'45.5gb / 99gb',
  N'05/01/2021', N'04/30/2024', N'10/12/2026', N'10/12/2027',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Máy tính đã hết niên hạn , vừa thay pin',
  NULL, NULL, NULL, N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  41, NULL, N'Máy tính', N'Laptop', N'DESKTOP-LESD99E', NULL,
  N'SAMA', NULL, NULL, N'Production',
  N'Nguyễn Miêu Khả Tú', NULL, N'Intel Pentium G4400', N'8 GB', N'256 GB SSD',
  NULL, NULL,
  N'04/01/2018', N'03/31/2021', N'10/01/2023', N'09/30/2024',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Máy tính đã hết niên hạn sử dụng nhưng sử dụng bình thường',
  NULL, NULL, NULL, N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  42, 72, N'Máy tính', N'Desktop', N'DESKTOP - EDIP08050', NULL,
  N'SAMA', NULL, NULL, N'WH & Planning',
  N'Nguyễn Minh Phục', NULL, N'Intel Pentium G3260', N'4 GB', N'250 GB SSD',
  NULL, NULL,
  N'10/01/2018', N'09/30/2021', N'10/01/2023', N'09/30/2021',
  N'Đã hết hạn', N'Chưa được gia hạn', NULL, N'Máy tính đã hết niên hạn sử dụng, hay treo máy ,chậm máy khi xử lý công việc bằng Microsoft Offcice 365, ERP',
  N'Cần nâng cấp RAM', 900000, NULL, N'Cần nâng cấp', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  43, NULL, N'Máy tính', N'Laptop', N'HP ProBook 440 G5 Notebook PC', NULL,
  N'5CD7486JZL', NULL, NULL, N'Production',
  N'Production Leader', N'Windows 11', N'Intel Core i5 8250U', N'8GB - 2400 - DDR3 - 1/2 slot', N'500GB SSD - WDC',
  N'Yes', NULL,
  NULL, N'12/30/1902', N'10/12/2026', N'10/12/2027',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Sử dụng binh thường',
  NULL, NULL, NULL, N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  44, 26, N'Máy tính', N'Laptop', N'HP ProBook 440 G7 Notebook PC (6XJ55AV)', NULL,
  N'5CD0128NCS', NULL, NULL, N'PE',
  N'Nguyễn Tấn Phát', N'Windows 11', N'Intel Core i5 10210U', N'8GB-BUS2667-2/2slot', N'256 GB SSD',
  N'Yes', NULL,
  N'03/01/2020', N'03/01/2023', N'04/01/2026', N'03/01/2023',
  N'Đã hết hạn', N'Chưa được gia hạn', NULL, N'Máy tính đã lưu kho',
  NULL, NULL, NULL, N'Đã thu hồi về kho', N'Disabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  45, 100, N'Máy tính', N'Laptop', N'HP Probook 440 G8', NULL,
  N'5CD117JD29', NULL, NULL, N'Finance & Accounting',
  N'Nguyễn Tấn Tĩnh', N'Windows 11', N'11th Intel Core i5 1135G7', N'8 GB - 3200 - 1/2 slot', N'500 GB SSD',
  N'Yes', NULL,
  N'05/01/2021', N'04/30/2024', N'05/01/2026', N'05/01/2027',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Sử dụng bình thường',
  NULL, NULL, NULL, N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  46, 2, N'Máy tính', N'Laptop', N'HP Pavilion Laptop 14-dv2xxx', NULL,
  N'5CD2379SYH', NULL, NULL, N'IT',
  N'Nguyễn Hoàng Khánh Duy', N'Windows 11', N'Intel Core i5 1235U', N'20GB - 3200 - 2/2 slot', N'512GB SSD - WDC',
  N'Yes', N'46.5 GB free',
  NULL, N'12/30/1902', N'04/26/2026', N'04/26/2027',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Máy sử dụng bình thường',
  NULL, NULL, NULL, N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  47, NULL, N'Máy tính', N'Laptop', N'HP Pavilion 14-ce1018tu', NULL,
  N'5CD9056Q31', NULL, NULL, N'Commnercial',
  N'Nguyễn Thế Tài', NULL, N'Intel Core i5 8265U', N'8 GB', N'256 GB SSD',
  NULL, NULL,
  N'08/01/2018', N'07/31/2021', N'10/01/2023', N'09/30/2024',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Máy tính đã hết niên hạn sử dụng nhưng sử dụng bình thường',
  NULL, NULL, NULL, N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  48, NULL, N'Máy tính', N'Laptop', N'HP 340S G7 Notebook PC', NULL,
  N'5CD2106VCS', NULL, NULL, N'Commnercial',
  N'Nguyễn Thị Anh Lệ', NULL, N'Intel Core i5-1035G1', N'8 GB', N'256 GB SSD',
  NULL, NULL,
  N'04/01/2022', N'03/31/2025', N'10/01/2023', N'03/31/2025',
  N'Đã hết hạn', N'Chưa được gia hạn', NULL, N'Sử dụng bình thường',
  NULL, NULL, NULL, N'Trong niên hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  49, NULL, N'Máy tính', N'Laptop', N'HP 340S G7 Notebook PC', NULL,
  N'5CD143H3R0', NULL, NULL, N'Commnercial',
  N'Nguyễn Thị Hoài Thương', NULL, N'Intel Core i3-1005G1', N'8 GB', N'512 GB SSD',
  NULL, NULL,
  N'11/01/2020', N'11/01/2023', N'10/01/2023', N'09/30/2024',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Máy tính đã hết niên hạn sử dụng nhưng sử dụng bình thường',
  NULL, NULL, NULL, N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  50, 109, N'Máy tính', N'Laptop', N'HP 340S G7 Notebook', NULL,
  N'5CD0466SX4', NULL, NULL, N'Flavor',
  N'Nguyễn Thị Lê Xíu', N'Windows 11', N'Intel Core i3 1005G1', N'8GB - 3200 - 2/2 SLOT', N'500GB SSD - Gigabyte',
  N'Yes', N'30gb/ 99gb',
  N'11/01/2021', N'10/31/2024', N'10/22/2026', N'10/31/2024',
  N'Đã hết hạn', N'Chưa được gia hạn', NULL, N'Máy tính sử dụng giật lag khi mở nhiều tab excel',
  NULL, NULL, NULL, N'Mua mới', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  51, 82, N'Máy tính', N'Laptop', N'HP 245 G10', NULL,
  N'5CD0466SVR', NULL, NULL, N'Import, Export',
  N'Nguyễn Thị Mỹ Duyên', N'Windows 11', N'AMD Ryzen 7 7730U', N'16GB', N'512GB SSD',
  N'Yes', NULL,
  N'04/01/2026', N'03/31/2029', N'10/22/2025', N'03/31/2029',
  N'Còn hạn', N'Còn hạn', NULL, N'Sử dụng bình thường',
  NULL, NULL, NULL, N'Trong niên hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  52, 21, N'Máy tính', N'Desktop', N'Dell Vostro 3671', NULL,
  N'1RD6R13', NULL, NULL, N'Production',
  N'Nguyễn Thị Ngọc Huyền', N'Windows 11', N'Intel Pentium Gold G5240', N'16GB - DDR4 - 2133 - 1/2 slot', N'250 GB SSD',
  N'Yes', N'8.34GB/ 99GB',
  N'02/01/2021', N'02/01/2024', N'10/12/2026', N'10/12/2027',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Sử dụng bình thường
Màn hình đã cũ , bị tối góc',
  NULL, NULL, NULL, N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  53, 84, N'Máy tính', N'Laptop', N'HP Probook 440 G3 Notebook', NULL,
  N'5CD6217771', NULL, NULL, N'Application',
  N'Nguyễn Thị Ngọc Nga', N'Windows 10', N'Intel Core i5 6200U', N'8GB - 2133 - 2/2 slot', N'240GB SSD - SANDISK',
  N'Yes', N'12gb / 99gb',
  N'06/01/2016', N'06/01/2019', N'10/22/2026', N'06/01/2019',
  N'Đã hết hạn', N'Chưa được gia hạn', NULL, N'Máy đã quá cũ , không thể tiếp tục nâng cấp hay gia hạn',
  NULL, NULL, NULL, N'Mua mới', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  54, NULL, N'Máy tính', N'Laptop', N'HP 240 G8 Notebook PC', NULL,
  N'5CG20415TQ', NULL, NULL, N'Delivery',
  N'Nguyễn Thị Quyên', NULL, N'11th Gen Intel Core i5-1135G7', N'8 GB', N'512 GB SSD',
  NULL, NULL,
  N'06/01/2022', N'05/31/2025', N'10/01/2023', N'05/31/2025',
  N'Đã hết hạn', N'Chưa được gia hạn', NULL, N'Sử dụng bình thường',
  NULL, NULL, NULL, N'Trong niên hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  55, NULL, N'Máy tính', N'Laptop', N'HP 340s G7', NULL,
  N'5CD0456swz', NULL, NULL, NULL,
  N'Nguyễn Thị Thanh Thuý', N'Windows 11', N'Intel Core i3 1005G1', N'8 GB - BUS3200 - 1/2 slot', N'512GB SSD ADATA',
  N'Yes', N'56gb / 99gb',
  N'11/01/2015', N'10/31/2018', N'10/12/2026', N'10/12/2027',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Máy đã bị chai pin nặng , đang đợi mua pin về',
  N'Mua pin thay thế', NULL, N'Đã thay thế pin vào ngày 19/10/2026', N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  56, 33, N'Máy tính', N'Laptop', N'HP Laptop 14 ep1179TU', NULL,
  N'5CG5313X8L', NULL, NULL, N'QM',
  N'Nguyễn Thị Thu Thảo', N'Windows 11', N'Core 5 120U', N'16GB-3200- 2/2 slot', N'500GB SSD - SK Hynix',
  N'Yes', N'33.15gb / 99gb',
  N'06/01/2021', N'05/31/2024', N'10/12/2026', N'10/12/2027',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Máy tính sử dụng bình thường , gia hạn niên hạn',
  NULL, NULL, NULL, N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  57, 113, N'Máy tính', N'Laptop', N'HP 340S G7 Notebook', NULL,
  N'5CD143H3YB', NULL, NULL, N'Application',
  N'Nguyễn Thúy Thảo Duyên', N'Windows 11', N'Intel Core i3 1005G1', N'8GB - 2667 - 2/2 slot', N'500GB SSD',
  N'Yes', N'9.58gb / 99gb',
  N'11/01/2021', N'10/31/2024', N'10/22/2026', N'10/31/2024',
  N'Đã hết hạn', N'Chưa được gia hạn', NULL, N'Máy tính giật lag khi sử dụng nhiều tab excel, đề xuất nâng cấp RAM',
  NULL, NULL, NULL, N'Nâng cấp RAM', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  58, NULL, N'Máy tính', N'Desktop', N'DESKTOP-EQ7IHP4', NULL,
  N'SAMA', NULL, NULL, N'Production',
  N'Nguyễn Tường Vy', NULL, N'Intel Pentium G3260', N'8 GB', N'256 GB SSD',
  NULL, NULL,
  N'07/01/2018', N'06/30/2021', N'10/01/2023', N'09/30/2024',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Máy tính đã hết niên hạn sử dụng nhưng sử dụng bình thường',
  NULL, NULL, NULL, N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  59, 6, N'Máy tính', N'Laptop', N'HP Probook 440 G7 Notebook', NULL,
  N'5CD0128N5G', NULL, NULL, N'HR&IT',
  N'Nguyễn Xuân Sơn', NULL, N'Intel Core i5 10210U', N'8 GB', N'512 GB SSD',
  NULL, NULL,
  N'05/01/2021', N'04/30/2024', N'10/01/2023', N'04/30/2024',
  N'Đã hết hạn', N'Chưa được gia hạn', NULL, N'Sử dụng bình thường',
  NULL, NULL, NULL, N'Trong niên hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  60, 56, N'Máy tính', N'Laptop', N'HP ProBook 440 G7 Notebook PC (6XJ52AV)', NULL,
  N'5CD0190Y5Y', NULL, NULL, N'Maintenance Engineer (ME)',
  N'Phạm Ngọc Thắng', NULL, N'Intel Core i3 10110U', N'8 GB', N'256 GB SSD',
  NULL, NULL,
  N'06/01/2022', N'05/31/2025', N'10/01/2023', N'05/31/2025',
  N'Đã hết hạn', N'Chưa được gia hạn', NULL, N'Sử dụng bình thường',
  NULL, NULL, NULL, N'Trong niên hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  61, 95, N'Máy tính', N'Laptop', N'HP ENVY 13-ay1000 x360 Convertible PC', NULL,
  N'CND148BGPR', NULL, NULL, N'Flavor',
  N'Phạm Thị Chuyên', N'Windows 11', N'AMD Ryzen 7 5800U', N'8GB - 3200 - 2/2 SLOT', N'1 TB SSD - SAMSUNG 980',
  N'Yes', N'19.5gb/99gb',
  N'11/01/2022', N'10/31/2025', N'10/22/2026', N'10/22/2027',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Sử dụng bình thường',
  NULL, NULL, NULL, N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  62, NULL, N'Máy tính', N'Desktop', N'DESKTOP-GQA9U7Q', NULL,
  N'SAMA', NULL, NULL, N'Application',
  N'Phạm Thị Ngọc', N'Windows 10', N'Intel Pentium CPU G3260', N'8GB - 1400 - 1/4 slot', N'500GB SSD - SAMSUNG 870EVO',
  N'Yes', N'43gb free / 99gb',
  N'05/01/2023', N'04/30/2026', N'05/01/2026', N'04/30/2026',
  N'Đã hết hạn', N'Chưa được gia hạn', NULL, N'Máy sử dụng bình thường',
  NULL, NULL, NULL, N'Đang để ở phòng Application', N'Disabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  63, 97, N'Máy tính', N'Laptop', N'HP Envy Laptop 13 ba1000', NULL,
  N'CND2023PRN', NULL, NULL, N'Flavor',
  N'Phạm Thị Ngọc Trang', N'Windows 11', N'11th Gen Intel Core i5 1135G7', N'8GB - 3200 - 2/2 SLOT', N'240GB - SSD Kioxia',
  N'Yes', N'19gb /99gb',
  N'11/01/2022', N'10/31/2025', N'10/22/2026', N'10/22/2027',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Máy sử dụng bình thường',
  NULL, NULL, NULL, N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  64, 83, N'Máy tính', N'Laptop', N'HP 340S G7 Notebook', NULL,
  N'5CD0466SVN', NULL, NULL, N'Flavor',
  N'Phạm Thị Vân Trang', N'Windows 11', N'Intel Core i3 1005G1', N'8GB - 3200 - 2/2 SLOT', N'240 GB SSD',
  N'Yes', N'20gb / 99gb',
  N'11/01/2021', N'10/31/2024', N'10/22/2026', N'10/22/2027',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Sử dụng bình thường',
  NULL, NULL, NULL, N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  65, NULL, N'Máy tính', N'Desktop', N'DESKTOP-0E93PTG', NULL,
  N'SAMA', NULL, NULL, N'Finance & Accounting (F&A)',
  N'Phạm Tố Tố', NULL, N'Intel Pentium G3440', N'8 GB', N'500 GB HDD',
  NULL, NULL,
  N'04/01/2018', N'03/31/2021', N'10/01/2023', N'03/31/2021',
  N'Đã hết hạn', N'Chưa được gia hạn', NULL, N'Máy tính đã hết niên hạn sử dụng, máy tính xử lý chậm ổ cứng không đáp ứng nhu cầu làm việc, treo máy',
  N'Cần nâng cấp ổ cứng SSD', 1300000, NULL, N'Cần nâng cấp', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  66, 91, N'Máy tính', N'Desktop', N'Lenovo', NULL,
  N'PC1AXXYL', NULL, NULL, N'Application',
  N'Phan Thị Thúy', N'Windows 11', N'Intel Pentium Gold G5420', N'8GB - 2400 - 2/2 SLOT', N'240GB SSD SATA - Solid State',
  N'Yes', N'5GB / 99GB',
  NULL, N'12/30/1902', N'10/22/2026', N'10/22/2027',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Máy tính sử dụng bình thường',
  NULL, NULL, NULL, N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  67, NULL, N'Máy tính', N'Laptop', N'HP 340S G7 Notebook PC', NULL,
  N'5CD1389Y0R', NULL, NULL, N'Commnercial',
  N'Phan Trần Khánh Long', NULL, N'Intel Core i3 1005G1', N'8 GB', N'256 GB SSD',
  NULL, NULL,
  N'11/01/2020', N'11/01/2023', N'10/01/2023', N'09/30/2024',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Máy tính đã hết niên hạn sử dụng nhưng sử dụng bình thường',
  NULL, NULL, NULL, N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  68, NULL, N'Máy tính', N'Laptop', N'HP 340S G7 Notebook PC', NULL,
  N'5CD0466SWZ', NULL, NULL, N'Quality Management (QM)',
  N'Phan Văn Tươi', NULL, N'Intel Core i3 1005G1', N'8 GB', N'256 GB SSD',
  NULL, NULL,
  N'11/01/2021', N'10/31/2024', N'10/01/2023', N'10/31/2024',
  N'Đã hết hạn', N'Chưa được gia hạn', NULL, N'Đang sử dụng Local Account và chưa gia nhập vào hệ thống domain Hoàng Anh',
  N'Backup dữ liệu từ local account và gia nhập domain', NULL, NULL, N'Trong niên hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  69, NULL, N'Máy tính', N'Desktop', N'Dell Vostro 3670', NULL,
  N'45B7HY2', NULL, NULL, N'Production',
  N'Phòng cân - Nguyên liệu', N'Windows 10', N'Intel Core i7 9700', N'8 GB', N'1 TB HDD',
  N'Yes', NULL,
  N'10/01/2020', N'10/01/2023', N'10/01/2023', N'09/30/2024',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Máy tính đã hết niên hạn sử dụng nhưng sử dụng bình thường',
  NULL, NULL, NULL, N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  70, NULL, N'Máy tính', N'Desktop', N'Dell Vostro 3670', NULL,
  N'9HQP6Z2', NULL, NULL, N'Production',
  N'Phòng Cân - Pha Loãng', N'Windows 10', N'Intel Core i5 9400', N'8 GB', N'1 TB HDD',
  N'Yes', NULL,
  N'10/01/2020', N'10/01/2023', N'10/01/2023', N'09/30/2024',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Máy tính đã hết niên hạn sử dụng nhưng sử dụng bình thường',
  NULL, NULL, NULL, N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  71, NULL, N'Máy tính', N'Desktop', N'DESKTOP-CCDC', NULL,
  N'SAMA', NULL, NULL, N'Production',
  N'Phòng CCDC', N'Windows 10', N'Intel(R) Pentium(R) CPU G4400', N'8 GB', N'256 GB SSD',
  N'Yes', NULL,
  N'04/01/2017', N'03/31/2020', N'10/01/2023', N'03/31/2020',
  N'Đã hết hạn', N'Chưa được gia hạn', NULL, N'Máy tính đã hết niên hạn sử dụng , hiện không đủ điều kiện nâng cấp lên windows 11',
  N'Đề xuất mua mới', NULL, NULL, N'Mua mới', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  72, NULL, N'Máy tính', N'Desktop', N'DESKTOP-VEOFTOV', NULL,
  N'SAMA', NULL, NULL, N'Production',
  N'Phòng Trưởng Ca', N'Windows 10', N'Intel Pentium G3250', N'8 GB - 1400 - 1/4 slot - DDR3', N'240 GB SSD - SAMSUNG',
  N'Yes', NULL,
  N'07/01/2022', N'06/30/2025', N'10/01/2023', N'06/30/2025',
  N'Đã hết hạn', N'Chưa được gia hạn', NULL, N'Máy tính đã hết niên hạn sử dụng , hiện không đủ điều kiện nâng cấp lên windows 11',
  N'Đề xuất mua mới', NULL, NULL, N'Mua mới', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  73, 59, N'Máy tính', N'Desktop', N'Dell Vostro', NULL,
  NULL, NULL, NULL, N'Maintenance Engineer (ME)',
  N'Phùng Thanh Nhiều', N'Windows 11', N'Intel Pentium G5420', N'8GB-BUS2400-2/2slot', N'256GB SSD-Lexar',
  NULL, NULL,
  N'05/01/2019', N'04/30/2022', N'04/01/2026', N'04/01/2027',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Máy tính sử dụng bình thường, màn hình bị xuất hiện sọc ngang không ảnh hưởng công việc',
  NULL, NULL, NULL, N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  74, NULL, N'Máy tính', N'Desktop', N'Dell Vostro 3671', NULL,
  N'24K2R33', NULL, NULL, N'Flavor',
  N'RnD', N'Windows 11', N'Intel Core i7 9700', N'16GB', N'1 TB HDD',
  N'Yes', NULL,
  N'07/01/2021', N'06/30/2024', N'10/01/2023', N'06/30/2024',
  N'Đã hết hạn', N'Chưa được gia hạn', NULL, N'Sử dụng bình thường',
  NULL, NULL, NULL, N'Trong niên hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  75, 49, N'Máy tính', N'Desktop', N'Dell Vostro 3681', NULL,
  N'6WB50G3', NULL, NULL, N'Warehouse',
  N'Thượng Đình Phong', N'Windows 11', N'Intel Core i3 10100', N'8GB - 2666 - 2/2 slot', N'500GB SSD - SAMSUNG 860EVO',
  N'Yes', N'45gb / 99gb',
  N'11/01/2022', N'10/31/2025', N'10/14/2026', N'10/31/2025',
  N'Đã hết hạn', N'Chưa được gia hạn', NULL, N'Máy tính sử dụng bình thường
Màn hình bị cũ, màn bị loe màu , bị chói',
  N'Nâng cấp RAM lên 1 thanh 16GB để hoạt động mượt mà với Windows 11', NULL, NULL, N'Cần nâng cấp RAM', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  76, 3, N'Máy tính', N'Laptop', N'HP ProBook 450 G6 Notebook PC', NULL,
  N'5CD922776X', NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, N'Intel Core i5 8th', N'8 GB', N'128 GB SSD + 1 TB HDD',
  NULL, NULL,
  N'02/01/2019', N'01/31/2022', N'10/01/2023', N'09/30/2024',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Máy tính đã hết niên hạn sử dụng nhưng sử dụng bình thường',
  NULL, NULL, NULL, N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  77, 104, N'Máy tính', N'Laptop', N'HP ProBook 440 G5 Notebook', NULL,
  N'5CD822515W', NULL, NULL, N'Flavor',
  N'Trần Lực', N'Windows 11', N'Intel Core i5 8250U', N'8 GB', N'256 GB SSD + 500 GB HDD',
  N'Yes', N'39.5GB free of 49.5',
  N'06/01/2018', N'05/31/2021', N'05/01/2026', N'05/01/2027',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Máy tính sử dụng bình thường',
  NULL, NULL, NULL, N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  78, 26, N'Máy tính', N'Laptop', N'HP ENVY x360 13.3', NULL,
  N'CND2452QPX', NULL, NULL, N'PE',
  N'Nguyễn Tấn Phát', N'Windows 11', N'12th Gen Intel Core i7-1250U', N'8GB - 4627 - 2/2 slot', N'512 GB SSD',
  N'Yes', N'20.8gb/ 99gb',
  N'06/01/2023', N'05/31/2026', N'10/12/2026', N'10/12/2027',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Máy tính sử dụng bình thường, tiếp tục gia hạn',
  NULL, NULL, NULL, N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  79, 102, N'Máy tính', N'Laptop', N'HP 240 G8', NULL,
  N'5CG147C3RG', NULL, NULL, N'Sales',
  N'Huỳnh Nguyễn Hồng Hạnh', N'Windows 11', N'Intel Core i5-1135G7', N'8GB - 2667 - 1/2 slot', N'500GB SSD',
  N'Yes', N'12gb / 99gb',
  NULL, N'12/30/1902', N'10/19/2026', N'10/19/2027',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Sử dụng bình thường, chưa có nhu cầu nâng cấp',
  NULL, NULL, NULL, N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  80, 115, N'Máy tính', N'Laptop', N'HP Pavilion 14 Laptop PC 14-dv2000', NULL,
  N'5CD0378CDL', NULL, NULL, N'HR',
  N'Trần Thị Phương Thanh', N'Windows 11', N'12th Gen Intel(R) Core(TM) i5-1235U', N'16GB', N'500 GB SSD',
  N'Yes', NULL,
  N'05/01/2021', N'04/30/2024', N'10/01/2023', N'09/30/2024',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Trong lúc sử dụng bị nóng máy và đột ngột tắt thường xuyên Sau khi kiểm tra do máy tính bị lỗi nguồn Adapter mainboard và dây sạc bị hư',
  N'Đã sửa và hiện tại không gặp vấn đề gì nhưng đề xuất thay thế cho năm 2024', NULL, N'Đã sửa ngày 27/10/2023', N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  81, 90, N'Máy tính', N'Laptop', N'HP Probook 440 G3 Notebook', NULL,
  N'5CD62365R4', NULL, NULL, N'Flavor',
  N'Trần Thị Thọ', N'Windows 10', N'Intel Core i5 6200U', N'8GB - 2133 - 2/2 SLOT', N'500 GB HDD - WDC',
  N'Yes', N'25.3 gb free of 49.5',
  N'06/01/2016', N'06/01/2019', N'05/01/2026', N'06/01/2019',
  N'Đã hết hạn', N'Chưa được gia hạn', NULL, N'Máy tính đã hết niên hạn sử dụng và sử dụng bình thường nhưng còn sử dụng ổ cứng HDD',
  N'Cần nâng cấp ổ cứng SSD', NULL, NULL, N'Cần nâng cấp', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  82, 56, N'Máy tính', N'Laptop', N'Dell G15 5515 Ryzen Edition', NULL,
  N'2M99ZJ3', NULL, NULL, N'ME',
  N'Phạm Ngọc Thắng', N'Windows 11', N'AMD Ryzen 7 5800H', N'16 GB - 3200 - 2/2 slot', N'512 GB SSD KDI',
  N'Yes', N'5GB / 99GB',
  N'10/01/2021', N'09/30/2024', N'10/12/2026', N'09/30/2024',
  N'Đã hết hạn', N'Chưa được gia hạn', NULL, N'Máy tính bị dơ lớp chống chói màn hình, mặt A,B,C nhiều chỗ bị bễ, đã đề xuất, báo giá nâng cấp',
  NULL, NULL, NULL, N'Chờ sửa chữa', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  83, NULL, N'Máy tính', N'Laptop', N'HP ProBook 440 G6 Notebook PC', NULL,
  N'5CD9312KV7', NULL, NULL, N'Production',
  N'Nguyễn Thanh Xuân', NULL, N'Intel Core i5 8265U', N'8 GB', N'256 GB SSD + 1TB HDD',
  NULL, NULL,
  N'09/01/2018', N'08/31/2021', NULL, N'08/31/2021',
  N'Đã hết hạn', N'Chưa được gia hạn', NULL, N'Sử dụng bình thường',
  NULL, NULL, NULL, NULL, N'Disabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  84, 65, N'Máy tính', N'Desktop', N'DESKTOP-79EKIAO', NULL,
  N'SAMA', NULL, NULL, N'Admin Plant',
  N'Lê Thị Như Mỹ', N'Windows 10', N'Intel Pentium G3440', N'8 GB', N'500 GB HDD',
  NULL, NULL,
  N'04/01/2017', N'03/31/2020', N'10/01/2023', N'09/30/2024',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Sử dụng bình thường',
  NULL, NULL, NULL, N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  85, 112, N'Máy tính', N'Desktop', N'Lenovo V50t 13IOB G2', NULL,
  N'PC2A6LAG', NULL, NULL, N'Finance & Accounting',
  N'Trịnh Thu Hằng', N'Windows 11', N'Intel Core i3 10105', N'8GB -2667-1/2 slot', N'240GB SSD SAMSUNG',
  N'Yes', N'27.9 gb free of 49.4',
  N'05/01/2022', N'04/30/2025', N'05/01/2026', N'04/30/2025',
  N'Đã hết hạn', N'Chưa được gia hạn', NULL, N'Sử dụng bình thường',
  NULL, NULL, NULL, N'Trong niên hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  86, 111, N'Máy tính', N'Laptop', N'HP ProBook 440 G6 Notebook', NULL,
  N'5CD9105BTZ', NULL, NULL, N'Flavor',
  N'Trương Lại Thùy An', N'Windows 11', N'Intel Core i3 8145U', N'12GB - 2400 - 2/2 SLOT', N'512 GB SSD',
  N'Yes', N'43.07 free / 90gb',
  N'06/01/2020', N'06/01/2023', N'10/22/2026', N'06/01/2023',
  N'Đã hết hạn', N'Chưa được gia hạn', NULL, N'Máy tính đã hết niên hạn, sử dụng giật lag, mở một lần 5-6 file excel(phân tích dữ liệu) + Copilot(tổng hợp dữ liệu ) + 10  tab chrome',
  NULL, NULL, NULL, N'Nâng cấp máy tính', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  87, NULL, N'Máy tính', N'Desktop', N'DESKTOP-6U08JSD', NULL,
  N'SAMA', NULL, NULL, N'Quality Management (QM)',
  N'Trương Thị Hồng Phước', NULL, N'Intel Pentium G3450', N'8 GB', N'120 GB SSD + 500 GB HDD',
  NULL, NULL,
  N'06/01/2018', N'05/31/2021', N'10/01/2023', N'05/31/2021',
  N'Đã hết hạn', N'Chưa được gia hạn', NULL, N'Máy tính đã hết niên hạn sử dụng, máy tính đã đầy ổ đĩa dẫn tới tính trạng zalo cảnh báo đầy dung lượng, về lâu dài máy tính sẽ chậm, tắt máy đột ngột',
  N'Cần nâng cấp lên SSD 256 GB', 1300000, NULL, N'Cần nâng cấp', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  88, NULL, N'Máy tính', N'Laptop', N'HP ProBook 440 G5 Notebook PC', NULL,
  N'5CD7486K07', NULL, NULL, N'Quality Management (QM)',
  N'Trương Thị Hồng Phước', NULL, N'Intel Core i5-8250U', N'8 GB', N'250 GB SSD',
  NULL, NULL,
  N'11/01/2017', N'10/31/2020', N'10/01/2023', N'09/30/2024',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Sử dụng bình thường',
  NULL, NULL, NULL, N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  89, NULL, N'Máy tính', N'Laptop', N'HP ProBook 440 G6 Notebook PC', NULL,
  N'5CD92275JL', NULL, NULL, N'Commnercial',
  N'Võ Châu Xuyên', NULL, N'Intel Core i3 8145U', N'8 GB', N'128 GB SSD + 1 TB HDD',
  NULL, NULL,
  N'11/01/2020', N'11/01/2023', N'10/01/2023', N'09/30/2024',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Máy tính đã hết niên hạn sử dụng nhưng sử dụng bình thường',
  NULL, NULL, NULL, N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  90, NULL, N'Máy tính', N'Laptop', N'HP Probook 430 G3 Base', NULL,
  N'5CD705139H', NULL, NULL, N'Ingredient',
  N'Võ Lâm Minh Thư', NULL, N'Intel Core i5 6200U', N'8 GB', N'240 GB SSD',
  NULL, NULL,
  N'06/01/2022', N'05/31/2025', N'10/01/2023', N'05/31/2025',
  N'Đã hết hạn', N'Chưa được gia hạn', NULL, N'Sử dụng bình thường',
  NULL, NULL, NULL, N'Trong niên hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  91, NULL, N'Máy tính', N'Desktop', N'Dell Vostro 3670', NULL,
  N'7VL4WV2', NULL, NULL, N'QM',
  N'Võ Thị Hương Cont', N'Windows 11', N'Inel Pentium Gold G5400', N'12GB - 8GB 3200 & 4GB 2133 - 2/2 slot', N'500GB SSD - SAMSUNG 870EVO',
  N'Yes', N'49.7gb / 99gb',
  N'06/01/2020', N'06/01/2023', N'10/12/2026', N'10/12/2027',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Máy sử dụng bình thường , màn hình cũ bị tối góc',
  NULL, NULL, NULL, N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  92, 66, N'Máy tính', N'Desktop', N'Lenovo', NULL,
  N'PC1N4E1L', NULL, NULL, N'QM',
  N'Nguyễn Thị Lan', N'Windows 11', N'Intel Core i3-10100', N'16GB - 2133 -1/2 slot', N'240GB - SSD SAMSUNG',
  N'Yes', N'2.3gb / 99gb',
  NULL, N'12/30/1902', N'10/14/2026', N'10/14/2027',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Máy sử dụng bình thường',
  NULL, NULL, NULL, N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  93, 68, N'Máy tính', N'Desktop', N'Dell  Vostro 3670', NULL,
  N'HHS2WV2', NULL, NULL, N'QM',
  N'Nguyễn Quốc Cường', N'Windows 11', N'Intel Pentium Gold G5400', N'12GB - 8GB 3200 - & 4GB 2133 DDR4 - 2/2 slot', N'500GB SSD - SAMSUNG 870EVO',
  N'Yes', N'3gb / 99gb',
  N'08/01/2019', N'07/31/2022', N'10/12/2026', N'10/12/2027',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Máy tính đã hết niên hạn sử dụng nhưng sử dụng bình thường',
  NULL, NULL, NULL, N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  94, NULL, N'Máy tính', N'Laptop', N'HP ProBook 440 G6 Notebook', NULL,
  N'5CD92274TV', NULL, NULL, N'Production',
  N'Production Leader', N'Windows 11', N'Intel Core i5 8265U', N'8GB - 2400 - DDR3 - 2/2 slot', N'500GB SSD - WDC',
  N'Yes', NULL,
  NULL, N'12/30/1902', N'10/12/2026', N'10/12/2027',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Máy sử dụng bình thường , cần lên Win11',
  N'Cần nâng cấp Windows 11', NULL, NULL, N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  95, 9, N'Máy tính', N'Laptop', N'HP ProBook 440 G6 Notebook', NULL,
  N'5CD905798S', NULL, NULL, N'Production',
  N'Đào Minh Quý', N'Windows 11', N'Intel Core i5 8265U', N'8GB - 2400 - DDR3 - 2/2 slot', N'500GB SSD - SAMSUNG 870EVO',
  N'Yes', NULL,
  NULL, N'12/30/1902', N'04/14/2026', N'04/14/2027',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Sử dụng bình thường , màn bị sức ron màn hình(một phần nhỏ ở cạnh)',
  N'Cần nâng cấp Windows 11', NULL, NULL, N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  96, NULL, N'Máy tính', N'Desktop', N'Dell  Vostro', NULL,
  N'SAMA', NULL, NULL, N'Quality Management (QM)',
  N'Nguyễn Hữu Nhâm', NULL, N'Intel Pentium Gold G5400', N'8 GB', N'1 TB HDD',
  NULL, NULL,
  N'08/01/2019', N'07/31/2022', NULL, N'07/31/2022',
  N'Đã hết hạn', N'Chưa được gia hạn', NULL, N'Chờ nâng cấp',
  N'Cần nâng cấp ổ cứng SSD', NULL, NULL, NULL, N'Disabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  97, 69, N'Máy tính', N'Laptop', N'HP 340S G7 Notebook PC', NULL,
  N'5CD1088RXS', NULL, NULL, N'Delivery',
  N'Lê Quang Bình', N'Windows 11', N'10th Intel Core i5 1035G1', N'12GB -2667-2/2 slot', N'240GB SSD - NVME - Toshiba',
  N'Yes', N'5GB / 99GB',
  NULL, N'12/30/1902', N'10/12/2026', N'10/12/2027',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Máy cũ của chị Ngọc , hiện tại sử dụng bình thường',
  NULL, NULL, NULL, N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  98, 51, N'Máy tính', N'Laptop', N'HP Omnibook  Flip Laptop 14 fp0057TU', NULL,
  N'8CG53240GZ', NULL, NULL, N'Planning',
  N'Đoàn Thị Ngọc', N'Windows 11', N'Intel Core 5 120U', N'16GB - 5200 - 2/2 slot', N'512GB SSD',
  N'Yes', N'56gb / 99gb',
  N'04/10/2026', N'04/09/2029', N'10/14/2026', N'10/14/2027',
  N'Còn hạn', N'Còn hạn', NULL, N'Máy tính mới mua , sử dụng bình thường',
  NULL, NULL, NULL, N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  99, 63, N'Máy tính', N'Laptop', N'HP Probook 440 G7', NULL,
  N'5CD0190YSY', NULL, NULL, N'Planning',
  N'Nguyễn Trường An', N'Windows 11', N'Intel Core i3 10110U', N'8GB -BUS2667- DDR3 - 2/2 slot', N'256GB SSD HP',
  N'Yes', N'36.24gb / 99gb',
  NULL, N'12/30/1902', N'10/14/2026', N'12/30/1902',
  N'Đã hết hạn', N'Chưa được gia hạn', NULL, N'Máy tính sử dụng bình thường',
  N'Cần nâng cấp RAM để đảm bảo sử dụng ổn định Windows 11', NULL, NULL, N'Cần nâng cấp RAM', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  100, NULL, N'Máy tính', N'Desktop', N'Desktop Think Centre Neo', NULL,
  NULL, NULL, NULL, N'WH & Planning',
  N'Lê Huỳnh Giang', N'Windows 11', N'Intel Core i3 13100', N'8GB -3200- DDR4 - 1/2slot', N'256GB SSD SAMSUNG',
  NULL, NULL,
  NULL, N'12/30/1902', N'04/15/2026', N'04/15/2027',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Sử dụng binh thường',
  NULL, NULL, NULL, N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  101, 70, N'Máy tính', N'Desktop', N'Dell Vostro', NULL,
  NULL, NULL, NULL, N'Quality Management (QM)',
  N'Nguyễn Quang Liêm', N'Windows 11', N'Intel Pentium Gold G5420', N'8GB - 2400 - DDR3 - 2/2 slot', N'500GB SSD - SAMSUNG 870EVO',
  NULL, NULL,
  NULL, N'12/30/1902', N'04/01/2026', N'12/30/1902',
  N'Đã hết hạn', N'Chưa được gia hạn', NULL, N'Đa tác vụ như excel(file nhẹ) và ERP cùng lúc bị lag',
  N'Nâng cấp Ram với Bus cao hơn', NULL, NULL, N'Nâng cấp Ram', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  102, 68, N'Máy tính', N'Desktop', N'Dell Vostro', NULL,
  NULL, NULL, NULL, N'Quality Management (QM)',
  N'Nguyễn Quốc Cường', N'Windows 11', N'Intel Pentium Gold G5400', N'8GB - 2400 - DDR3 - 2/2 slot', N'500GB SSD - SAMSUNG 870EVO',
  NULL, NULL,
  NULL, N'12/30/1902', N'04/01/2026', N'12/30/1902',
  N'Đã hết hạn', N'Chưa được gia hạn', NULL, N'Sử dụng bình thường',
  NULL, NULL, NULL, NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  103, NULL, N'Máy tính', N'Desktop', N'Dell Vostro', NULL,
  NULL, NULL, NULL, N'Quality Management (QM)',
  N'Huỳnh Nguyễn Tấn Thành', N'Windows 11', N'Intel Pentium Gold G5400', N'8GB - 2400 - DDR3 - 2/2 slot', N'500GB SSD - SAMSUNG 870EVO',
  NULL, NULL,
  NULL, N'12/30/1902', N'04/01/2026', N'12/30/1902',
  N'Đã hết hạn', N'Chưa được gia hạn', NULL, N'Sử dụng bình thường',
  NULL, NULL, NULL, NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  104, 55, N'Máy tính', N'Desktop', N'DESKTOP PV Computer', NULL,
  N'SAMA', NULL, NULL, N'Warehouse',
  N'Nguyễn Thị Ngọc Tuyết', N'Windows 10', N'Intel Pentium CPU G3260', N'8GB - 1400 - 1/4 slot', N'250GB SSD - SAMSUNG 860 EVO',
  N'Yes', NULL,
  NULL, N'12/30/1902', N'10/14/2026', N'12/30/1902',
  N'Đã hết hạn', N'Chưa được gia hạn', NULL, N'Máy đã hết niên hạn , cần mua mới
Màn hình bị cũ, màn bị loe màu , bị chói',
  N'Cần mua mới', NULL, NULL, N'Cần mua mới', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  105, 103, N'Máy tính', N'Laptop', N'HP 340s G7', NULL,
  N'5CD1389YPD', NULL, NULL, N'Sales',
  N'Nguyễn Thị Lan Anh', N'Windows 11', N'Intel Core i3 1005G1', N'8GB - 2667 - 2/2 slot', N'250GB SSD - WDC',
  N'Yes', N'41.7 Gb free',
  NULL, N'12/30/1902', N'10/19/2026', N'12/30/1902',
  N'Đã hết hạn', N'Chưa được gia hạn', NULL, N'Ngoại quan máy bị nứt vỏ mặt C,gãy khúc bản lề,  màn hình bị ám màu nặng, đóm màu',
  NULL, NULL, NULL, N'Sửa chữa hoặc mua mới', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  106, 92, N'Máy tính', N'Laptop', N'HP 340s G7', NULL,
  N'5CD13681KL', NULL, NULL, N'Sales',
  N'Nguyễn Ngọc Anh Thư', N'Windows 11', N'Intel Core i3 1005G1', N'8GB - 2667 - 2/2 slot', N'256 GB SSD Kioxai',
  N'Yes', N'20gb / 99gb',
  NULL, N'12/30/1902', N'10/19/2026', N'10/19/2027',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Sử dụng bình thường, chưa có nhu cầu nâng cấp',
  NULL, NULL, NULL, N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  107, 117, N'Máy tính', N'Laptop', N'HP 240 G8', NULL,
  N'5CG20413T4', NULL, NULL, N'Sales',
  N'Võ Ngọc Hà', N'Windows 11', N'Intel Core i5-1135G7', N'8GB - 3200 - 1/2 slot', N'500GB SSD - Intel',
  N'Yes', NULL,
  NULL, N'12/30/1902', N'04/26/2026', N'12/30/1902',
  N'Đã hết hạn', N'Chưa được gia hạn', NULL, N'Sử dụng bình thường',
  NULL, NULL, NULL, N'Đang được lưu kho', N'Disabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  108, 73, N'Máy tính', N'Laptop', N'HP Omnibook  X Flip Laptop 14 fp0057TU', NULL,
  N'8CG5513YS8', NULL, NULL, N'Plant Admin',
  N'Lê Đức Huy', N'Windows 11', N'Intel Core i5 120U', N'16GB - 5200 - 2/2 slot', N'500GB SSD - SK Hynix',
  N'Yes', NULL,
  NULL, N'12/30/1902', N'10/12/2026', N'10/12/2027',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Sử dụng bình thường',
  NULL, NULL, NULL, N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  109, 5, N'Máy tính', N'Laptop', N'HP Probook 440 G6', NULL,
  N'5YM63PA#UUF', NULL, NULL, N'HR',
  N'Lâm Gia Hào', N'Windows 11', N'Intel Core i3-10210U', N'8GB-2400- 1/2 slot', N'240GB SSD - WDC',
  N'Yes', NULL,
  NULL, N'12/30/1902', N'10/28/2026', N'10/28/2027',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Máy tính đã chai pin nặng , đã đặt mua pin',
  NULL, NULL, NULL, N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  110, NULL, N'Máy tính', N'Desktop', N'Dell Vostro 3670', NULL,
  NULL, NULL, NULL, N'Phòng cân',
  N'Phòng cân', N'Windows 10', N'Intel Pentium Gold G5420', N'8GB-2133-2/2slot', N'500GB SSD - WDC',
  NULL, NULL,
  NULL, N'12/30/1902', N'05/06/2026', N'05/06/2027',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Máy sử dụng bình thường',
  NULL, NULL, NULL, N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  111, NULL, N'Máy tính', N'Desktop', N'SAMA', NULL,
  NULL, NULL, NULL, N'Phòng CCDC',
  N'Phòng CCDC', N'Windows 10', N'Intel Pentium G4400', N'8GB-2133-2/2slot', N'240GB - SSD SAMSUNG',
  NULL, NULL,
  NULL, N'12/30/1902', N'05/01/2026', N'05/01/2027',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Máy sử dụng bình thường',
  NULL, NULL, NULL, N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  112, 126, N'Máy tính', N'Laptop', N'HP OMINIBOOK X FLIP 14', NULL,
  N'8CG5313FLX', NULL, NULL, N'PMI',
  N'Hamasaki Yuya', N'Windows 11', N'Intel Core Ultra 7 258v', N'32GB - 8533- 2/2 SLOT', N'500GB SSD - SAMSUNG',
  N'Yes', N'10gb / 99gb',
  NULL, N'12/30/1902', N'10/22/2026', N'10/22/2027',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Máy sử dụng bình thường',
  NULL, NULL, NULL, N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  113, 129, N'Máy tính', N'Desktop', N'Dell Vostro 3670', NULL,
  N'6C4B0T2', NULL, NULL, N'Application',
  N'Phan Thị Tuyết Trinh', N'Windows 11', N'Intel Pentium Gold G5400', N'8GB - 2400 - 2/2 SLOT', N'500GB SSD',
  N'Yes', N'7.8gb / 99gb',
  NULL, N'12/30/1902', N'10/22/2026', N'10/22/2027',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Máy tính sử dụng bình thường
Màn hình bị sọc ngang = > Đã dùng màn hình của chị Ngọc để thay thế tạm',
  NULL, NULL, NULL, N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  114, 114, N'Máy tính', N'Desktop', N'SAMA', NULL,
  NULL, NULL, NULL, N'Application',
  N'Nguyễn Ngọc Bảo Trân', N'Windows 11', N'INTEL PENTIUM G3440', N'8GB - DDR3 - 1600 - 1/4 SLOT', N'500GB SSD - SAMSUNG 870EVO',
  N'Yes', N'4gb / 99gb',
  NULL, N'12/30/1902', N'10/22/2026', N'10/22/2027',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Máy sử dụng bình thường',
  NULL, NULL, NULL, N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  115, 116, N'Máy tính', N'Desktop', N'Dell Vostro 3670', NULL,
  NULL, NULL, NULL, N'Application',
  N'Huỳnh Ngọc Mạnh', N'Windows 11', N'Intel pentium gold g5420', N'8GB - 2400 - 1/2 SLOT', N'500GB SSD - SAMSUNG 870EVO',
  N'Yes', N'3.5 gb / 99gb',
  NULL, N'12/30/1902', N'10/22/2026', N'10/22/2027',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Máy sử dụng bình thường',
  NULL, NULL, NULL, N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  116, 91, N'Máy tính', N'Desktop', N'Lenovo', NULL,
  NULL, NULL, NULL, N'Application',
  N'Phan Thị Thúy', N'Windows 11', N'Intel Pentium Gold G5420', N'8GB - 2400 - 2/2 SLOT', N'240GB SSD SATA - Solid State',
  NULL, N'45.1gb free of 49.5',
  NULL, N'12/30/1902', N'05/01/2026', N'05/01/2027',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Máy tính sử dụng bình thường',
  NULL, NULL, NULL, N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  117, 119, N'Máy tính', N'Desktop', N'Dell Vostro 3671', NULL,
  NULL, NULL, NULL, N'Flavor',
  N'Huỳnh Thị Kim', N'Windows 11', N'Intel Core i5 9400', N'8GB - 2666- 1/2 SLOT', N'1TB HDD - WDC',
  N'Yes', N'8.7gb / 99gb',
  NULL, N'12/30/1902', N'10/22/2026', N'12/30/1902',
  N'Đã hết hạn', N'Chưa được gia hạn', NULL, N'Máy tính sử dụng bình thường nhưng ổ cứng là HDD cần nâng cấp lên ổ SSD',
  NULL, NULL, NULL, N'Cần nâng cấp SSD', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  118, 121, N'Máy tính', N'Laptop', N'Dell Vostro 3671', NULL,
  NULL, NULL, NULL, N'Flavor',
  N'Trần Thị Cẩm Nhung', N'Windows 11', N'Intel Core i5 9700', N'16GB - 2666- 2/2 SLOT', N'1TB HDD',
  N'Yes', N'6.3gb / 99gb',
  NULL, N'12/30/1902', N'10/22/2026', N'12/30/1902',
  N'Đã hết hạn', N'Chưa được gia hạn', NULL, N'Máy tính sử dụng bình thường nhưng ổ cứng là HDD cần nâng cấp lên ổ SSD',
  NULL, NULL, NULL, N'Cần nâng cấp SSD', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  119, 89, N'Máy tính', N'Laptop', N'Hp Pavillion 14', NULL,
  NULL, NULL, NULL, N'HR',
  N'Đinh Thị Thủy', N'Windows 11', N'8th  i5-8265U', N'8GB - 2400', N'240GB SSD - WDC',
  N'Yes', NULL,
  NULL, N'12/30/1902', N'05/01/2026', N'12/30/1902',
  N'Đã hết hạn', N'Chưa được gia hạn', NULL, N'Máy tính chỉ dùng cho việc nhập liệu lên bảo trì tòa nhà, đã được thu hồi và lưu trữ trong kho',
  NULL, NULL, NULL, N'Đang được lưu kho', N'Disabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  120, NULL, N'Máy tính', N'Laptop', NULL, NULL,
  NULL, NULL, NULL, NULL,
  NULL, NULL, NULL, NULL, NULL,
  NULL, NULL,
  NULL, N'12/30/1902', NULL, N'12/30/1902',
  N'Đã hết hạn', N'Chưa được gia hạn', NULL, NULL,
  NULL, NULL, NULL, NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  121, 65, N'Máy tính', N'Laptop', N'HP 240 G8 Notebook PC', NULL,
  NULL, NULL, NULL, N'Admin Plant',
  N'Lê Thị Như Mỹ', N'Windows 11', N'11th Intel Core i5 1135G7', N'8GB - 3200 - 1/2 slot', N'240GB SSD - NVME - Samsung',
  NULL, NULL,
  NULL, N'12/30/1902', N'05/26/2026', N'05/26/2027',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Máy cũ anh Quốc , được bàn giao lại cho chị Mỹ',
  NULL, NULL, NULL, N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  122, 18, N'Máy tính', N'Laptop', N'Dell Precision 7680', NULL,
  NULL, NULL, NULL, N'PJ',
  N'Trần Tiến Din', N'Windows 11', N'13th Intel Core i7-13580HX', N'32GB - 5600 - 1/1 SLOT', N'1TB SSD - NVME - KINGSTON',
  N'Yes', N'11gb / 99gb',
  N'05/26/2026', N'05/25/2029', N'10/12/2026', N'05/25/2029',
  N'Còn hạn', N'Còn hạn', NULL, N'Máy mới được cấp vào tháng 5-2026',
  NULL, NULL, NULL, N'Trong niên hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  123, 4, N'Máy tính', N'Laptop', N'HP Probook 450 G10', NULL,
  NULL, NULL, NULL, N'IT',
  N'Nguyễn Thành Đạt', N'Windows 11', N'13th Intel Core i5 1335U', N'16Gb', N'512 GB SSD',
  N'Yes', NULL,
  N'01/01/2023', N'12/31/2025', N'10/16/2026', N'10/16/2027',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Sử dụng bình thường',
  NULL, NULL, NULL, N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  124, 6, N'Máy tính', N'Laptop', N'HP Omnibook  Flip Laptop 14', NULL,
  NULL, NULL, NULL, N'HR',
  N'Nguyễn Xuân Sơn', N'Windows 11', N'Ryzen 5 340', N'16GB', N'512 GB SSD',
  N'Yes', NULL,
  N'05/01/2021', N'04/30/2024', N'10/16/2026', N'04/30/2024',
  N'Đã hết hạn', N'Chưa được gia hạn', NULL, N'Sử dụng bình thường',
  NULL, NULL, NULL, N'Trong niên hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  125, 59, N'Máy tính', N'Desktop', N'Dell Vostro 3671', NULL,
  N'2F01R33', NULL, NULL, N'ME',
  N'Phùng Thanh Nhiều', N'Windows 11', N'Intel Pentium G5420', N'8GB - 2400 - 2/2 slot', N'256GB SSD-Lexar',
  N'Yes', N'7.82gb / 99gb',
  N'05/01/2019', N'04/30/2022', N'10/12/2026', N'10/12/2027',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Máy tính sử dụng bình thường
Màn hình bị xuất hiện sọc ngang đề nghị thay thế',
  NULL, NULL, NULL, N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  126, 3, N'Máy tính', N'Laptop', N'HP Omnibook 5 16inch', NULL,
  NULL, NULL, NULL, N'IT',
  N'Trần Hải Nhân', N'Windows 11', N'Ryzen AI 7 350', N'16Gb', N'512GB SSD',
  N'Yes', NULL,
  N'10/15/2026', N'10/14/2029', N'10/16/2026', N'10/16/2027',
  N'Còn hạn', N'Còn hạn', NULL, N'Máy mới vừa được đầu tư vào tháng 10/2026',
  NULL, NULL, NULL, N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  127, 67, N'Máy tính', N'Desktop', N'Desktop Think Centre Neo', NULL,
  NULL, NULL, NULL, N'Finance & Accounting',
  N'Lê Quỳnh Giang', N'Windows 11', N'Intel Core i3 13100', N'8GB -3200- DDR4 - 1/2slot', N'256GB SSD SAMSUNG',
  N'Yes', NULL,
  NULL, N'12/30/1902', N'04/15/2026', N'04/15/2027',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Sử dụng binh thường',
  NULL, NULL, NULL, N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  128, 70, N'Máy tính', N'Desktop', N'Dell Vostro 3670', NULL,
  NULL, NULL, NULL, N'QM',
  N'Nguyễn Quang Liêm', N'Windows 11', N'Intel Pentium Gold G5420', N'12GB - 8GB 3200 & 4GB 2133 - 2/2 slot', N'500GB SSD - SAMSUNG 870EVO',
  N'Yes', N'7.34gb / 99gb',
  NULL, N'12/30/1902', N'10/12/2026', N'10/12/2027',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Máy tính sử dụng bình thường 
màn hình đã cũ, bị mờ gốc màn',
  NULL, NULL, NULL, N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  129, 80, N'Máy tính', N'Desktop', N'Dell Vostro 3670', NULL,
  NULL, NULL, NULL, N'QM',
  N'Nguyễn Quốc Thắng', N'Windows 11', N'Intel Pentium Gold G5400', N'12GB - 8GB 3200 & 4GB 2133 - 2/2 slot', N'500GB SSD - SAMSUNG 870EVO',
  N'Yes', N'10.3gb / 99gb',
  NULL, N'12/30/1902', N'10/12/2026', N'10/12/2027',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Máy tính sử dụng bình thường
 màn hình còn mới',
  NULL, NULL, NULL, N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  130, 76, N'Máy tính', N'Desktop', N'Dell Vostro 3670', NULL,
  NULL, NULL, NULL, N'QM',
  N'Nguyễn Huỳnh Tấn Thành', N'Windows 11', N'Intel Pentium Gold G5400', N'12GB - 8GB 3200 & 4GB 2133 - 2/2 slot', N'500GB SSD - SAMSUNG 870EVO',
  N'Yes', N'11gb / 99gb',
  NULL, N'12/30/1902', N'10/12/2026', N'10/12/2027',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Máy sử dụng bình thường, 
màn hình đã cũ, bị mờ gốc màn',
  NULL, NULL, NULL, N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  131, 65, N'Máy tính', N'Laptop', N'HP 240 G8 Notebook PC', NULL,
  N'5CG2040XHN', NULL, NULL, N'Plant Admin',
  N'Lê Thị Như Mỹ', N'Windows 11', N'11th Intel Core i5 1135G7', N'8GB - 3200 - 1/2 slot', N'240GB SSD - NVME - Samsung',
  N'Yes', N'5GB / 99GB',
  NULL, N'12/30/1902', N'10/14/2026', N'10/14/2027',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Máy cũ anh Quốc , được bàn giao lại cho chị Mỹ , máy tính sử dụng bình thường
Màn hình desktop cũ, màn bị chói',
  NULL, NULL, NULL, N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  132, 118, N'Máy tính', N'Laptop', N'HP 340s G7', NULL,
  NULL, NULL, NULL, N'Marketing',
  N'Nguyễn Phan Thùy Dương', N'Windows 11', N'10th Intel Core i3 1035G1', N'8GB - 2667 - 2/2 slot', N'240GB SSD - NVME',
  N'Yes', N'6.58GB / 99GB',
  NULL, N'12/30/1902', N'10/21/2026', N'10/21/2027',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Hiệu năng máy tính bình thường , nhu cầu sử dụng user không cao, hiện tại chưa cần nâng cấp',
  NULL, NULL, NULL, N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  133, 101, N'Máy tính', N'Laptop', N'HP Omnibook  Flip Laptop 14', NULL,
  NULL, NULL, NULL, N'Finance & Accounting',
  N'Lê Nguyễn Phương Thư', N'Windows 11', N'Intel Core Ultra 5 226V', N'16Gb', N'512GB SSD',
  N'Yes', NULL,
  N'05/01/2026', N'04/30/2029', N'10/23/2026', N'04/30/2029',
  N'Còn hạn', N'Còn hạn', NULL, N'Máy tính mới , đầu tư vào tháng 5/2026',
  NULL, NULL, NULL, N'Trong niên hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  134, 133, N'Máy tính', N'Laptop', N'HP 340s G7', NULL,
  NULL, NULL, NULL, NULL,
  N'Ngô Ngọc Phương Mai', N'Windows 11', N'Intel Core i3 1005G1', N'8GB', N'256GB SSD',
  N'Yes', N'20gb / 99gb',
  NULL, N'12/30/1902', N'10/23/2026', N'10/23/2027',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Máy đã hết niên hạn, Máy sử dụng giật lag khi mở nhiều tab excel',
  NULL, NULL, NULL, N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  135, 117, N'Máy tính', N'Laptop', N'HP Pavilion Laptop 14', NULL,
  NULL, NULL, NULL, N'Sales',
  N'Võ Ngọc Hà', N'Windows 11', N'Intel Core i5 1235U', N'16GB', N'512GB SSD',
  N'Yes', N'30gb / 99gb',
  NULL, N'12/30/1902', N'10/22/2026', N'10/22/2027',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Máy mới được cấp lại từ máy anh Quyền',
  NULL, NULL, NULL, N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  136, 125, N'Máy tính', N'Laptop', N'HP Probook 440 G6', NULL,
  NULL, NULL, NULL, N'Sales',
  N'Phạm Nhật Minh Giang', N'Windows 11', N'8th  i5-8265U', N'8GB - 2400 - 2/2 slot', N'240GB SSD - NVME - SK Hynix',
  N'Yes', N'5GB / 99GB',
  NULL, N'12/30/1902', N'10/21/2026', N'10/21/2027',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Máy tính sử dụng bình thường, đã hết niên hạn sử dụng, nhu cầu sử dụng không cao, vẫn có thể tiếp tục sử dụng',
  NULL, NULL, NULL, N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  137, 132, N'Máy tính', N'Laptop', N'HP 245 G10 14inch', NULL,
  NULL, NULL, NULL, NULL,
  N'Phạm Công Danh', N'Windows 11', N'Ryzen 7 7730u', N'16GB-3200- 1/2 slot', N'500GB-SK Hynix',
  N'Yes', N'20gb / 99gb',
  NULL, N'12/30/1902', N'10/12/2026', N'10/12/2027',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Máy tính còn mới, gia hạn niên hạn',
  NULL, NULL, NULL, N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  138, 61, N'Máy tính', N'Laptop', N'HP Probook 460 G11 A74MSPT', NULL,
  NULL, NULL, NULL, N'Finance & Accounting',
  N'Nguyễn Đông Nhu', N'Windows 11', N'Intel Core U5 125H', N'16Gb', N'512GB SSD',
  N'Yes', N'30.5gb / 99gb',
  N'10/23/2026', N'10/22/2029', N'10/12/2026', N'10/12/2027',
  N'Còn hạn', N'Còn hạn', NULL, N'Máy mới được cấp vào tháng 10-2026',
  NULL, NULL, NULL, N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  139, 31, N'Máy tính', N'Laptop', N'HP 245 G10', NULL,
  NULL, NULL, NULL, N'QM',
  N'Bùi Thị Phương Dung', N'Windows 11', N'Ryzen 5 7530U', N'16GB', N'256GB SSD',
  N'Yes', N'40gb/99gb',
  N'10/01/2026', N'09/30/2029', N'10/12/2026', N'09/30/2029',
  N'Còn hạn', N'Còn hạn', NULL, N'Máy mới được cấp vào tháng 10-2026',
  NULL, NULL, NULL, N'Trong niên hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  140, 47, N'Máy tính', N'Laptop', N'HP 340s G7', NULL,
  NULL, NULL, NULL, N'QM',
  N'Nguyễn Minh Khôi', N'Windows 11', N'Intel Core i3 1035G1', N'8GB-BUS3200-1/2 slot', N'120GB SSD',
  N'Yes', N'9gb / 99gb',
  NULL, N'12/30/1902', N'10/12/2026', N'12/30/1902',
  N'Đã hết hạn', N'Chưa được gia hạn', NULL, N'Máy đã hết niên hạn, Máy sử dụng giật lag khi mở file word, excel, mở file rất lâu',
  NULL, NULL, NULL, N'Mua mới', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  141, 98, N'Máy tính', N'Laptop', N'HP ENVY 13-ay1000 x360 Convertible PC', NULL,
  NULL, NULL, NULL, N'Procurement',
  N'Phạm Thị Anh Tuyền', N'Windows 11', NULL, NULL, NULL,
  NULL, NULL,
  NULL, N'12/30/1902', NULL, N'12/30/1902',
  N'Đã hết hạn', N'Chưa được gia hạn', NULL, NULL,
  NULL, NULL, NULL, NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  142, 107, N'Máy tính', N'Laptop', NULL, NULL,
  NULL, NULL, NULL, N'Sales',
  N'Huỳnh Mạnh Cường', N'Windows 11', NULL, NULL, NULL,
  NULL, NULL,
  NULL, N'12/30/1902', NULL, N'12/30/1902',
  N'Đã hết hạn', N'Chưa được gia hạn', NULL, NULL,
  NULL, NULL, NULL, NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  143, 123, N'Máy tính', N'Laptop', N'HP Omnibook  Flip Laptop 14', NULL,
  NULL, NULL, NULL, N'PMI',
  N'Nakada Yosuke', N'Windows 11', NULL, NULL, NULL,
  NULL, NULL,
  NULL, N'12/30/1902', NULL, N'12/30/1902',
  N'Đã hết hạn', N'Chưa được gia hạn', NULL, NULL,
  NULL, NULL, NULL, NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  144, 130, N'Máy tính', N'Laptop', N'HP Omnibook  Flip Laptop 14', NULL,
  NULL, NULL, NULL, N'BOM',
  N'Nguyễn Thị Thanh Tuyền', N'Windows 11', NULL, NULL, NULL,
  NULL, NULL,
  NULL, N'12/30/1902', NULL, N'12/30/1902',
  N'Đã hết hạn', N'Chưa được gia hạn', NULL, NULL,
  NULL, NULL, NULL, NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  145, 96, N'Máy tính', N'Laptop', N'HP Omnibook  X Flip Laptop 14 fp0057TU', NULL,
  NULL, NULL, NULL, N'Sales',
  N'Lê Văn Quyền', N'Windows 11', N'Intel Core i5 120U', N'16GB - 5200 - 2/2 slot', N'500GB SSD - SK Hynix',
  N'Yes', NULL,
  NULL, N'12/30/1902', NULL, N'12/30/1902',
  N'Đã hết hạn', N'Chưa được gia hạn', NULL, NULL,
  NULL, NULL, NULL, NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  146, NULL, N'Máy in', N'Photocopy', N'Canon IR224n', NULL,
  NULL, N'10.0.32.38', NULL, N'HR&IT',
  NULL, NULL, NULL, NULL, NULL,
  NULL, NULL,
  NULL, NULL, NULL, NULL,
  NULL, NULL, NULL, NULL,
  NULL, NULL, N'In Use', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  147, NULL, N'Máy in', N'Printer', N'Canon MF260dw II', NULL,
  NULL, N'10.0.32.39', NULL, N'Purchasing',
  NULL, NULL, NULL, NULL, NULL,
  NULL, NULL,
  NULL, NULL, NULL, NULL,
  NULL, NULL, NULL, NULL,
  NULL, NULL, N'In Use', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  148, NULL, N'Máy in', N'Printer', N'HP LaserJet Color 252n', NULL,
  NULL, N'USB Connection', NULL, N'HR & IT',
  NULL, NULL, NULL, NULL, NULL,
  NULL, NULL,
  NULL, NULL, NULL, NULL,
  NULL, NULL, NULL, NULL,
  NULL, NULL, N'Not Use', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  149, NULL, N'Máy in', N'Printer', N'HP LaserJet Pro MFP M127fw', NULL,
  NULL, N'10.0.32.40', NULL, N'Commercial',
  NULL, NULL, NULL, NULL, NULL,
  NULL, NULL,
  NULL, NULL, NULL, NULL,
  NULL, NULL, NULL, NULL,
  NULL, NULL, N'In Use', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  150, NULL, N'Máy in', N'Printer', N'HP LaserJet Pro MFP M227fdn', NULL,
  NULL, N'10.0.32.42', NULL, N'Application',
  NULL, NULL, NULL, NULL, NULL,
  NULL, NULL,
  NULL, NULL, NULL, NULL,
  NULL, NULL, NULL, NULL,
  NULL, NULL, N'In Use', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  151, NULL, N'Máy in', N'Printer', N'HP LaserJet Color 252n', NULL,
  NULL, N'10.0.32.43', NULL, N'Application',
  NULL, NULL, NULL, NULL, NULL,
  NULL, NULL,
  NULL, NULL, NULL, NULL,
  NULL, NULL, NULL, NULL,
  NULL, NULL, N'In Use', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  152, NULL, N'Máy in', N'Printer', N'Canon LBP 2900', NULL,
  NULL, N'USB Connection', NULL, N'RnD',
  NULL, NULL, NULL, NULL, NULL,
  NULL, NULL,
  NULL, NULL, NULL, NULL,
  NULL, NULL, NULL, NULL,
  NULL, NULL, N'In Use', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  153, NULL, N'Máy in', N'Printer', N'Canon Mf453dw', NULL,
  NULL, N'10.0.32.41', NULL, N'PMI',
  NULL, NULL, NULL, NULL, NULL,
  NULL, NULL,
  NULL, NULL, NULL, NULL,
  NULL, NULL, NULL, NULL,
  NULL, NULL, N'In Use', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  154, NULL, N'Máy in', N'Printer', N'HP LaserJet 1212nf MFP', NULL,
  NULL, N'10.0.32.127', NULL, N'Flavor',
  NULL, NULL, NULL, NULL, NULL,
  NULL, NULL,
  NULL, NULL, NULL, NULL,
  NULL, NULL, NULL, NULL,
  NULL, NULL, N'In Use', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  155, NULL, N'Máy in', N'Printer', N'HP LaserJet Pro MFP 255dw', NULL,
  NULL, N'10.0.32.36', NULL, N'RnD - Floor 4',
  NULL, NULL, NULL, NULL, NULL,
  NULL, NULL,
  NULL, NULL, NULL, NULL,
  NULL, NULL, NULL, NULL,
  NULL, NULL, N'In Use', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  156, NULL, N'Máy in', N'Printer', N'Canon ImageClass MFP 247dw', NULL,
  NULL, N'192.168.10.5', NULL, N'Lab',
  NULL, NULL, NULL, NULL, NULL,
  NULL, NULL,
  NULL, NULL, NULL, NULL,
  NULL, NULL, NULL, NULL,
  NULL, NULL, N'In Use', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  157, NULL, N'Máy in', N'Printer', N'HP LaserJet Pro M404dn', NULL,
  NULL, N'192.168.10.6', NULL, N'QLSX',
  NULL, NULL, NULL, NULL, NULL,
  NULL, NULL,
  NULL, NULL, NULL, NULL,
  NULL, NULL, NULL, NULL,
  NULL, NULL, N'In Use', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  158, NULL, N'Máy in', N'Printer', N'Brother 2701D', NULL,
  NULL, N'USB Connection', NULL, N'Cont QM',
  NULL, NULL, NULL, NULL, NULL,
  NULL, NULL,
  NULL, NULL, NULL, NULL,
  NULL, NULL, NULL, NULL,
  NULL, NULL, N'In Use', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  159, NULL, N'Máy in', N'Printer', N'Canon LBP 2901', NULL,
  NULL, N'USB Connection', NULL, N'Delivery',
  NULL, NULL, NULL, NULL, NULL,
  NULL, NULL,
  NULL, NULL, NULL, NULL,
  NULL, NULL, NULL, NULL,
  NULL, NULL, N'In Use', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  160, NULL, N'Máy in', N'Printer', N'HP Laserjet 225jw', NULL,
  NULL, N'192.168.10.15', NULL, N'WH & Planning',
  NULL, NULL, NULL, NULL, NULL,
  NULL, NULL,
  NULL, NULL, NULL, NULL,
  NULL, NULL, NULL, NULL,
  NULL, NULL, N'In Use', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  161, NULL, N'Máy in', N'Printer', N'Canon G1010', NULL,
  NULL, N'USB Connection', NULL, N'Administration',
  NULL, NULL, NULL, NULL, NULL,
  NULL, NULL,
  NULL, NULL, NULL, NULL,
  NULL, NULL, NULL, NULL,
  NULL, NULL, N'In Use', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  162, NULL, N'Máy in', N'Printer', N'TOSHIBA e-STUDIO5018A', NULL,
  NULL, N'192.168.10.7', NULL, N'Administration',
  NULL, NULL, NULL, NULL, NULL,
  NULL, NULL,
  NULL, NULL, NULL, NULL,
  NULL, NULL, NULL, NULL,
  NULL, NULL, N'In Use', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  163, NULL, N'Máy in', N'Label Printer', N'Zebra GT800', NULL,
  NULL, N'USB Connection', NULL, N'Warehouse',
  NULL, NULL, NULL, NULL, NULL,
  NULL, NULL,
  NULL, NULL, NULL, NULL,
  NULL, NULL, NULL, NULL,
  NULL, NULL, N'In Use', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  164, NULL, N'Máy in', N'Printer', N'Canon LBP 2900', NULL,
  NULL, N'USB Connection', NULL, N'Warehouse',
  NULL, NULL, NULL, NULL, NULL,
  NULL, NULL,
  NULL, NULL, NULL, NULL,
  NULL, NULL, NULL, NULL,
  NULL, NULL, N'In Use', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  165, NULL, N'Máy in', N'Printer', N'HP Laserjet P1566', NULL,
  NULL, N'USB Connection', NULL, N'Cont QM',
  NULL, NULL, NULL, NULL, NULL,
  NULL, NULL,
  NULL, NULL, NULL, NULL,
  NULL, NULL, NULL, NULL,
  NULL, NULL, N'In Use', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  166, NULL, N'Máy in', N'Printer', N'Canon LBP 3050', NULL,
  NULL, N'USB Connection', NULL, N'ME',
  NULL, NULL, NULL, NULL, NULL,
  NULL, NULL,
  NULL, NULL, NULL, NULL,
  NULL, NULL, NULL, NULL,
  NULL, NULL, N'In Use', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  167, NULL, N'Máy in', N'Printer', N'HP M402 PCL6', NULL,
  NULL, N'192.168.10.8', NULL, N'Phòng cân',
  NULL, NULL, NULL, NULL, NULL,
  NULL, NULL,
  NULL, NULL, NULL, NULL,
  NULL, NULL, NULL, NULL,
  NULL, NULL, N'In Use', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  168, NULL, N'Máy in', N'Printer', N'HP LASETJET PRO M501', NULL,
  NULL, N'USB Connection', NULL, N'Phòng công cụ dụng cụ',
  NULL, NULL, NULL, NULL, NULL,
  NULL, NULL,
  NULL, NULL, NULL, NULL,
  NULL, NULL, NULL, NULL,
  NULL, NULL, N'In Use', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  169, NULL, N'Máy in', N'Printer', N'HP Laserjet Pro M404dn', NULL,
  NULL, N'192.168.3.4', NULL, N'Cont Chung Sức',
  NULL, NULL, NULL, NULL, NULL,
  NULL, NULL,
  NULL, NULL, NULL, NULL,
  NULL, NULL, NULL, NULL,
  NULL, NULL, N'In Use', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  170, NULL, N'Máy in', N'Printer', N'Epson L8050', NULL,
  NULL, N'Wifi Connection', NULL, N'Cont Chung Sức',
  NULL, NULL, NULL, NULL, NULL,
  NULL, NULL,
  NULL, NULL, NULL, NULL,
  NULL, NULL, NULL, NULL,
  NULL, NULL, N'In Use', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  171, NULL, N'Máy in', N'Printer', N'Canon MF236N', NULL,
  NULL, N'192.168.3.5', NULL, N'Cont Chung Sức',
  NULL, NULL, NULL, NULL, NULL,
  NULL, NULL,
  NULL, NULL, NULL, NULL,
  NULL, NULL, NULL, NULL,
  NULL, NULL, N'In Use', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  172, NULL, N'Máy in', N'Printer', N'Godex EZ530+ in nhãn', NULL,
  NULL, N'192.168.10.12', NULL, N'QM',
  NULL, NULL, NULL, NULL, NULL,
  NULL, NULL,
  NULL, NULL, NULL, NULL,
  NULL, NULL, NULL, NULL,
  NULL, NULL, N'In Use', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  173, NULL, N'Máy in', N'AccessPoint', N'AP chỗ chị Mỹ', NULL,
  NULL, N'192.168.10.13', NULL, N'Administration',
  NULL, NULL, NULL, NULL, NULL,
  NULL, NULL,
  NULL, NULL, NULL, NULL,
  NULL, NULL, NULL, NULL,
  NULL, NULL, N'In Use', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  174, NULL, N'Máy in', N'AccessPoint', N'AP chỗ anh Huy', NULL,
  NULL, N'192.168.10.11', NULL, N'Plant Director',
  NULL, NULL, NULL, NULL, NULL,
  NULL, NULL,
  NULL, NULL, NULL, NULL,
  NULL, NULL, NULL, NULL,
  NULL, NULL, N'In Use', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  175, NULL, N'Máy in', N'AccessPoint', N'AP chỗ anh Din', NULL,
  NULL, N'192.168.10.10', NULL, N'ME',
  NULL, NULL, NULL, NULL, NULL,
  NULL, NULL,
  NULL, NULL, NULL, NULL,
  NULL, NULL, NULL, NULL,
  NULL, NULL, N'In Use', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  176, NULL, N'Máy in', N'DSM', N'DSM 923 plus', NULL,
  NULL, N'192.168.10.14', NULL, N'Warehouse',
  NULL, NULL, NULL, NULL, NULL,
  NULL, NULL,
  NULL, NULL, NULL, NULL,
  NULL, NULL, NULL, NULL,
  NULL, NULL, N'In Use', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  177, NULL, N'Máy in', N'Printer', N'HP LASETJET PRO M501', NULL,
  NULL, N'USB Connection', NULL, N'Production',
  NULL, NULL, NULL, NULL, NULL,
  NULL, NULL,
  NULL, NULL, NULL, NULL,
  NULL, NULL, NULL, NULL,
  N'Máy dùng in nhãn Phòng CCDC', NULL, N'In Use', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  178, NULL, N'Máy in', N'Printer', N'RICOH SP 230DNW', NULL,
  NULL, N'USB Connection', NULL, N'Production',
  NULL, NULL, NULL, NULL, NULL,
  NULL, NULL,
  NULL, NULL, NULL, NULL,
  NULL, NULL, NULL, NULL,
  N'Máy in Phòng cân Nguyên liệu', NULL, N'In Use', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  179, NULL, N'Máy in', N'Printer', N'Canon LBP2900', NULL,
  NULL, N'USB Connection', NULL, N'Production',
  NULL, NULL, NULL, NULL, NULL,
  NULL, NULL,
  NULL, NULL, NULL, NULL,
  NULL, NULL, NULL, NULL,
  N'Phòng cân Pha loãng', NULL, N'In Use', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  180, 3, N'Máy chủ', N'Server', N'HP ProLiant DL380p Gen8', N'WIN-K3VS3N2HC66',
  N'SGH426KPB9', NULL, NULL, N'IT',
  N'Trần Hải Nhân', NULL, N'Intel® Xeon® E5-2650 (2.0GHz/8-core/15MB/7.2GT)', N'56GB', N'RAID 1: 76GB HDD SAS + 4TB HDD',
  NULL, NULL,
  N'07/01/2018', N'06/30/2021', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  181, 3, N'Máy chủ', N'Server', N'Dell PowerEdge T140', N'PRIMARYERP',
  N'FNSSTC3', NULL, NULL, N'IT',
  N'Trần Hải Nhân', NULL, N'Intel Xeon E-2234 (4C/8T, 3.60 GHz, 8MB)', N'64GB', N'RAID 1:  4TB HDD',
  NULL, NULL,
  N'03/01/2021', N'02/29/2024', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  182, 3, N'Máy chủ', N'Server', N'HP ProLiant ML150 GEN 9', N'WIN-5QMKPD9BIG3',
  N'SGH721X3TF', NULL, NULL, N'IT',
  N'Trần Hải Nhân', NULL, N'Intel Xeon E5-2609v4 (1.7GHz/8-core/15MB/85W)', N'32GB', N'RAID 1:  4TB HDD',
  NULL, NULL,
  N'08/01/2023', N'07/31/2026', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  183, 3, N'Máy chủ', N'Server', N'Dell PowerEdge T150', N'WIN-0I7L833QCA5',
  N'84105W3', NULL, NULL, N'IT',
  N'Trần Hải Nhân', NULL, N'Xeon E-2324G/8GB/2TB/DVDRW/300W', N'128GB', N'RAID 1:  4TB HDD',
  NULL, NULL,
  N'09/01/2021', N'08/31/2024', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  184, 3, N'Thiết bị mạng', N'Router Controller', N'iZiFi SG-250', NULL,
  N'Y21200014510', NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'09/01/2022', N'08/31/2025', NULL, NULL,
  N'Expired', NULL, NULL, NULL,
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  185, 3, N'Thiết bị mạng', N'Wifi', N'FIT-A782', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'09/01/2022', N'08/31/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  186, 3, N'Thiết bị mạng', N'Wifi', N'FIT-A782', NULL,
  NULL, NULL, NULL, N'Procurement',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'09/01/2022', N'08/31/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  187, 3, N'Thiết bị mạng', N'Wifi', N'FIT-A782', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'09/01/2022', N'08/31/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  188, 3, N'Thiết bị mạng', N'Wifi', N'FIT-A782', NULL,
  NULL, NULL, NULL, N'Commnercial',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'09/01/2022', N'08/31/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  189, 3, N'Thiết bị mạng', N'Wifi', N'FIT-A782', NULL,
  NULL, NULL, NULL, N'Ingredient',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'09/01/2022', N'08/31/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  190, 3, N'Thiết bị mạng', N'Wifi', N'FIT-A782', NULL,
  NULL, NULL, NULL, N'Flavor',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'09/01/2022', N'08/31/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  191, 3, N'Thiết bị mạng', N'Wifi', N'FIT-A782', NULL,
  NULL, NULL, NULL, N'Flavor',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'09/01/2022', N'08/31/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  192, 3, N'Thiết bị mạng', N'Wifi', N'FIT-A782', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'09/01/2022', N'08/31/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  193, 3, N'Thiết bị mạng', N'Wifi', N'FIT-A782', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'09/01/2022', N'08/31/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  194, 3, N'Thiết bị mạng', N'Firewall', N'Sonicwall NSA 2700', NULL,
  N'18C241050E08', NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'09/01/2022', N'08/31/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  195, 3, N'Thiết bị mạng', N'Firewall', N'Sonicwall NSA 2700', NULL,
  N'18C241050E08', NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'09/01/2022', N'08/31/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  196, 3, N'Thiết bị mạng', N'Firewall', N'Sonicwall NSA 2400', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'09/01/2022', N'08/31/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  197, 3, N'Thiết bị mạng', N'Switch Core', N'Juniper EX2300-24T', NULL,
  N'JZ0219280130', NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'09/01/2022', N'08/31/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  198, 3, N'Thiết bị mạng', N'Switch Core', N'Juniper EX2300-24T', NULL,
  N'JZ0219280147', NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'09/01/2022', N'08/31/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  199, 3, N'Thiết bị mạng', N'Switch Managed', N'ES205GC-P', NULL,
  N'CAR61J6024607', NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'09/01/2022', N'08/31/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  200, 3, N'Thiết bị mạng', N'Switch Managed', N'ES226GC-P', NULL,
  N'CAR61J6024607', NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'09/01/2022', N'08/31/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  201, 3, N'Thiết bị mạng', N'Switch Managed', N'ES226GC-P', NULL,
  N'G1QH6WE001877', NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'09/01/2022', N'08/31/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  202, 3, N'Thiết bị mạng', N'Switch Managed', N'ES226GC-P', NULL,
  N'G1QH6WE002346', NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'09/01/2022', N'08/31/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  203, 3, N'Thiết bị mạng', N'Switch Managed', N'ES208GC', NULL,
  N'CAQL75P00005B', NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'09/01/2022', N'08/31/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  204, 3, N'Thiết bị mạng', N'Switch Managed', N'ES208GC', NULL,
  N'CAQL75P009168', NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'09/01/2022', N'08/31/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  205, 3, N'Thiết bị mạng', N'Digital Video Recorder', N'DHI-NVR5232- 4KS2', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'05/01/2020', N'05/01/2023', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  206, 3, N'Thiết bị mạng', N'Digital Video Recorder', N'DHI-NVR5232- 4KS2', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'11/01/2022', N'10/31/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  207, 3, N'Thiết bị mạng', N'Digital Video Recorder', N'DHI-NVR5232- 4KS2', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'12/01/2022', N'11/30/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  208, 3, N'Camera & Hạ tầng', N'IP Camera', N'DH-HAC-HFW1200SP-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'05/01/2020', N'05/01/2023', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  209, 3, N'Camera & Hạ tầng', N'IP Camera', N'DH-HAC-HFW1200SP-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'05/01/2020', N'05/01/2023', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  210, 3, N'Camera & Hạ tầng', N'IP Camera', N'DH-HAC-HFW1200SP-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'05/01/2020', N'05/01/2023', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  211, 3, N'Camera & Hạ tầng', N'IP Camera', N'DH-HAC-HFW1200SP-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'05/01/2020', N'05/01/2023', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  212, 3, N'Camera & Hạ tầng', N'IP Camera', N'DH-HAC-HFW1200SP-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'05/01/2020', N'05/01/2023', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  213, 3, N'Camera & Hạ tầng', N'IP Camera', N'DH-HAC-HFW1200SP-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'05/01/2020', N'05/01/2023', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  214, 3, N'Camera & Hạ tầng', N'IP Camera', N'DH-HAC-HFW1200SP-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'05/01/2020', N'05/01/2023', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  215, 3, N'Camera & Hạ tầng', N'IP Camera', N'DH-HAC-HFW1200SP-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'05/01/2020', N'05/01/2023', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  216, 3, N'Camera & Hạ tầng', N'IP Camera', N'DH-HAC-HFW1200SP-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'05/01/2020', N'05/01/2023', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  217, 3, N'Camera & Hạ tầng', N'IP Camera', N'DH-HAC-HFW1200SP-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'05/01/2020', N'05/01/2023', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  218, 3, N'Camera & Hạ tầng', N'IP Camera', N'DH-HAC-HFW1200SP-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'05/01/2020', N'05/01/2023', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  219, 3, N'Camera & Hạ tầng', N'IP Camera', N'DH-HAC-HFW1200SP-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'05/01/2020', N'05/01/2023', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  220, 3, N'Camera & Hạ tầng', N'IP Camera', N'DH-HAC-HFW1200SP-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'05/01/2020', N'05/01/2023', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  221, 3, N'Camera & Hạ tầng', N'IP Camera', N'DH-HAC-HFW1200SP-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'05/01/2020', N'05/01/2023', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  222, 3, N'Camera & Hạ tầng', N'IP Camera', N'DH-HAC-HFW1200SP-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'05/01/2020', N'05/01/2023', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  223, 3, N'Camera & Hạ tầng', N'IP Camera', N'DH-HAC-HFW1200SP-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'05/01/2020', N'05/01/2023', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  224, 3, N'Camera & Hạ tầng', N'IP Camera', N'DH-HAC-HFW1200SP-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'05/01/2020', N'05/01/2023', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  225, 3, N'Camera & Hạ tầng', N'IP Camera', N'DH-HAC-HFW1200SP-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'05/01/2020', N'05/01/2023', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  226, 3, N'Camera & Hạ tầng', N'IP Camera', N'DH-HAC-HFW1200SP-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'05/01/2020', N'05/01/2023', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  227, 3, N'Camera & Hạ tầng', N'IP Camera', N'DH-HAC-HFW1200SP-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'05/01/2020', N'05/01/2023', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  228, 3, N'Camera & Hạ tầng', N'IP Camera', N'DH-HAC-HFW1200SP-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'05/01/2020', N'05/01/2023', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  229, 3, N'Camera & Hạ tầng', N'IP Camera', N'DH-HAC-HFW1200SP-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'05/01/2020', N'05/01/2023', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  230, 3, N'Camera & Hạ tầng', N'IP Camera', N'DH-HAC-HFW1200SP-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'05/01/2020', N'05/01/2023', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  231, 3, N'Camera & Hạ tầng', N'IP Camera', N'DH-HAC-HFW1200SP-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'05/01/2020', N'05/01/2023', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  232, 3, N'Camera & Hạ tầng', N'IP Camera', N'DH-HAC-HFW1200SP-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'05/01/2020', N'05/01/2023', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  233, 3, N'Camera & Hạ tầng', N'IP Camera', N'DH-HAC-HFW1200SP-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'05/01/2020', N'05/01/2023', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  234, 3, N'Camera & Hạ tầng', N'IP Camera', N'DH-HAC-HFW1200SP-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'05/01/2020', N'05/01/2023', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  235, 3, N'Camera & Hạ tầng', N'IP Camera', N'DH-HAC-HFW1200SP-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'05/01/2020', N'05/01/2023', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  236, 3, N'Camera & Hạ tầng', N'IP Camera', N'DH-HAC-HFW1200SP-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'05/01/2020', N'05/01/2023', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  237, 3, N'Camera & Hạ tầng', N'IP Camera', N'DH-HAC-HFW1200SP-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'05/01/2020', N'05/01/2023', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  238, 3, N'Camera & Hạ tầng', N'IP Camera', N'DH-HAC-HFW1200SP-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'05/01/2020', N'05/01/2023', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  239, 3, N'Camera & Hạ tầng', N'IP Camera', N'DH-HAC-HFW1200SP-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'05/01/2020', N'05/01/2023', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  240, 3, N'Camera & Hạ tầng', N'IP Camera', N'DASBN4431S-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'12/01/2022', N'11/30/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  241, 3, N'Camera & Hạ tầng', N'IP Camera', N'DASBN4431S-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'12/01/2022', N'11/30/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  242, 3, N'Camera & Hạ tầng', N'IP Camera', N'DASBN4431S-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'12/01/2022', N'11/30/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  243, 3, N'Camera & Hạ tầng', N'IP Camera', N'DASBN4431S-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'12/01/2022', N'11/30/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  244, 3, N'Camera & Hạ tầng', N'IP Camera', N'DASBN4431S-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'12/01/2022', N'11/30/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  245, 3, N'Camera & Hạ tầng', N'IP Camera', N'DASBN4431S-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'12/01/2022', N'11/30/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  246, 3, N'Camera & Hạ tầng', N'IP Camera', N'DASBN4431S-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'12/01/2022', N'11/30/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  247, 3, N'Camera & Hạ tầng', N'IP Camera', N'DASBN4431S-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'12/01/2022', N'11/30/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  248, 3, N'Camera & Hạ tầng', N'IP Camera', N'DASBN4431S-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'12/01/2022', N'11/30/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  249, 3, N'Camera & Hạ tầng', N'IP Camera', N'DASBN4431S-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'12/01/2022', N'11/30/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  250, 3, N'Camera & Hạ tầng', N'IP Camera', N'DASBN4431S-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'12/01/2022', N'11/30/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  251, 3, N'Camera & Hạ tầng', N'IP Camera', N'DASBN4431S-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'12/01/2022', N'11/30/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  252, 3, N'Camera & Hạ tầng', N'IP Camera', N'DASBN4431S-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'12/01/2022', N'11/30/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  253, 3, N'Camera & Hạ tầng', N'IP Camera', N'DASBN4431S-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'12/01/2022', N'11/30/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  254, 3, N'Camera & Hạ tầng', N'IP Camera', N'DASBN4431S-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'12/01/2022', N'11/30/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  255, 3, N'Camera & Hạ tầng', N'IP Camera', N'DASBN4431S-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'12/01/2022', N'11/30/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  256, 3, N'Camera & Hạ tầng', N'IP Camera', N'DASBN4431S-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'12/01/2022', N'11/30/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  257, 3, N'Camera & Hạ tầng', N'IP Camera', N'DASBN4431S-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'12/01/2022', N'11/30/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  258, 3, N'Camera & Hạ tầng', N'IP Camera', N'DASBN4431S-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'12/01/2022', N'11/30/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  259, 3, N'Camera & Hạ tầng', N'IP Camera', N'DASBN4431S-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'12/01/2022', N'11/30/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  260, 3, N'Camera & Hạ tầng', N'IP Camera', N'DASBN4431S-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'12/01/2022', N'11/30/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  261, 3, N'Camera & Hạ tầng', N'IP Camera', N'DASBN4431S-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'12/01/2022', N'11/30/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  262, 3, N'Camera & Hạ tầng', N'IP Camera', N'DASBN4431S-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'12/01/2022', N'11/30/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  263, 3, N'Camera & Hạ tầng', N'IP Camera', N'DASBN4431S-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'12/01/2022', N'11/30/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  264, 3, N'Camera & Hạ tầng', N'IP Camera', N'DASBN4431S-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'12/01/2022', N'11/30/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  265, 3, N'Camera & Hạ tầng', N'IP Camera', N'DASBN4431S-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'12/01/2022', N'11/30/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  266, 3, N'Camera & Hạ tầng', N'IP Camera', N'DASBN4431S-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'12/01/2022', N'11/30/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  267, 3, N'Camera & Hạ tầng', N'IP Camera', N'DASBN4431S-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'12/01/2022', N'11/30/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  268, 3, N'Camera & Hạ tầng', N'IP Camera', N'DASBN4431S-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'12/01/2022', N'11/30/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  269, 3, N'Camera & Hạ tầng', N'IP Camera', N'DASBN4431S-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'12/01/2022', N'11/30/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  270, 3, N'Camera & Hạ tầng', N'IP Camera', N'DASBN4431S-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'12/01/2022', N'11/30/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  271, 3, N'Camera & Hạ tầng', N'IP Camera', N'DASBN4431S-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'12/01/2022', N'11/30/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  272, 3, N'Camera & Hạ tầng', N'IP Camera', N'DASBN4431S-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'12/01/2022', N'11/30/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  273, 3, N'Camera & Hạ tầng', N'IP Camera', N'DASBN4431S-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'12/01/2022', N'11/30/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  274, 3, N'Camera & Hạ tầng', N'IP Camera', N'DASBN4431S-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'12/01/2022', N'11/30/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  275, 3, N'Camera & Hạ tầng', N'IP Camera', N'DASBN4431S-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'12/01/2022', N'11/30/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  276, 3, N'Camera & Hạ tầng', N'IP Camera', N'DASBN4431S-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'12/01/2022', N'11/30/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  277, 3, N'Camera & Hạ tầng', N'IP Camera', N'DASBN4431S-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'12/01/2022', N'11/30/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  278, 3, N'Camera & Hạ tầng', N'IP Camera', N'DASBN4431S-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'12/01/2022', N'11/30/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  279, 3, N'Camera & Hạ tầng', N'IP Camera', N'DASBN4431S-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'12/01/2022', N'11/30/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  280, 3, N'Camera & Hạ tầng', N'IP Camera', N'DASBN4431S-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'12/01/2022', N'11/30/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  281, 3, N'Camera & Hạ tầng', N'IP Camera', N'DASBN4431S-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'12/01/2022', N'11/30/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  282, 3, N'Camera & Hạ tầng', N'IP Camera', N'DASBN4431S-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'12/01/2022', N'11/30/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  283, 3, N'Camera & Hạ tầng', N'IP Camera', N'DASBN4431S-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'12/01/2022', N'11/30/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  284, 3, N'Camera & Hạ tầng', N'IP Camera', N'DASBN4431S-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'12/01/2022', N'11/30/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  285, 3, N'Camera & Hạ tầng', N'IP Camera', N'DASBN4431S-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'12/01/2022', N'11/30/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  286, 3, N'Camera & Hạ tầng', N'IP Camera', N'DASBN4431S-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'12/01/2022', N'11/30/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  287, 3, N'Camera & Hạ tầng', N'IP Camera', N'DASBN4431S-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'12/01/2022', N'11/30/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  288, 3, N'Camera & Hạ tầng', N'IP Camera', N'DASBN4431S-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'12/01/2022', N'11/30/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  289, 3, N'Camera & Hạ tầng', N'IP Camera', N'DASBN4431S-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'12/01/2022', N'11/30/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  290, 3, N'Camera & Hạ tầng', N'IP Camera', N'DASBN4431S-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'12/01/2022', N'11/30/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  291, 3, N'Camera & Hạ tầng', N'IP Camera', N'DASBN4431S-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'12/01/2022', N'11/30/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  292, 3, N'Camera & Hạ tầng', N'IP Camera', N'DASBN4431S-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'12/01/2022', N'11/30/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  293, 3, N'Camera & Hạ tầng', N'IP Camera', N'DASBN4431S-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'12/01/2022', N'11/30/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  294, 3, N'Camera & Hạ tầng', N'IP Camera', N'DASBN4431S-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'12/01/2022', N'11/30/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  295, 3, N'Camera & Hạ tầng', N'IP Camera', N'DASBN4431S-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'12/01/2022', N'11/30/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  296, 3, N'Camera & Hạ tầng', N'IP Camera', N'DASBN4431S-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'12/01/2022', N'11/30/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  297, 3, N'Camera & Hạ tầng', N'IP Camera', N'DASBN4431S-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'12/01/2022', N'11/30/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  298, 3, N'Camera & Hạ tầng', N'IP Camera', N'DASBN4431S-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'12/01/2022', N'11/30/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  299, 3, N'Camera & Hạ tầng', N'IP Camera', N'DASBN4431S-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'12/01/2022', N'11/30/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  300, 3, N'Camera & Hạ tầng', N'IP Camera', N'DASBN4431S-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'12/01/2022', N'11/30/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  301, 3, N'Camera & Hạ tầng', N'IP Camera', N'DASBN4431S-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'12/01/2022', N'11/30/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  302, 3, N'Camera & Hạ tầng', N'IP Camera', N'DASBN4431S-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'12/01/2022', N'11/30/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  303, 3, N'Camera & Hạ tầng', N'IP Camera', N'DASBN4431S-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'12/01/2022', N'11/30/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  304, NULL, N'Thiết bị mạng', N'Máy chấm công', NULL, NULL,
  NULL, N'192.168.10.9', NULL, NULL,
  NULL, NULL, NULL, NULL, NULL,
  NULL, NULL,
  NULL, N'12/30/1902', NULL, NULL,
  N'Expired', NULL, NULL, NULL,
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
GO

INSERT INTO dbo.License (STT, UserId, ComputerName, GlobalDomain, LocalDomain, ActiveAccount, Owner, PhongBan, KichHoat) VALUES (
  1, 4, N'5CD2379SYH', N'dat.nguyent@hoanganh.com.vn', N'dat.nguyent',
  N'helpdesk01@hlnltphoanganh.onmicrosoft.com', N'Nguyễn Thành Đạt', N'HR&IT', N'Enabled'
);
INSERT INTO dbo.License (STT, UserId, ComputerName, GlobalDomain, LocalDomain, ActiveAccount, Owner, PhongBan, KichHoat) VALUES (
  2, 5, N'5YM63PA#UUF', N'hao.lamg@hoanganh.com.vn', N'hao.lamg',
  N'helpdesk04@hlnltphoanganh.onmicrosoft.com', N'Lâm Gia Hào', N'HR&IT', N'Enabled'
);
INSERT INTO dbo.License (STT, UserId, ComputerName, GlobalDomain, LocalDomain, ActiveAccount, Owner, PhongBan, KichHoat) VALUES (
  3, 6, N'5CD0128N5G', N'son.nguyenx@hoanganh.com.vn', N'son.nguyenx',
  N'helpdesk09@hlnltphoanganh.onmicrosoft.com', N'Nguyễn Xuân Sơn', N'HR&IT', N'Enabled'
);
INSERT INTO dbo.License (STT, UserId, ComputerName, GlobalDomain, LocalDomain, ActiveAccount, Owner, PhongBan, KichHoat) VALUES (
  4, 115, N'5CD0378CDL', N'thanh.trantp@hoanganh.com.vn', N'thanh.trantp',
  N'helpdesk01@hlnltphoanganh.onmicrosoft.com', N'Trần Thị Phương Thanh', N'HR&IT', N'Enabled'
);
INSERT INTO dbo.License (STT, UserId, ComputerName, GlobalDomain, LocalDomain, ActiveAccount, Owner, PhongBan, KichHoat) VALUES (
  5, 3, N'5CD922776X', N'nhan.tran@hoanganh.com.vn', N'nhan.tran',
  N'helpdesk01@hlnltphoanganh.onmicrosoft.com', N'Trần Hải Nhân', N'HR&IT', N'Enabled'
);
INSERT INTO dbo.License (STT, UserId, ComputerName, GlobalDomain, LocalDomain, ActiveAccount, Owner, PhongBan, KichHoat) VALUES (
  6, 112, N'PC2A6LAG', N'hang.trinh@hoanganh.com.vn', N'hang.trinh',
  N'helpdesk01@hlnltphoanganh.onmicrosoft.com', N'Trịnh Thu Hằng', N'Finance & Accounting (F&A)', N'Enabled'
);
INSERT INTO dbo.License (STT, UserId, ComputerName, GlobalDomain, LocalDomain, ActiveAccount, Owner, PhongBan, KichHoat) VALUES (
  7, 108, N'SAMA', N'bay.le@hoanganh.com.vn', N'bay.le',
  N'helpdesk11@hlnltphoanganh.onmicrosoft.com', N'Lê Bảy', N'Procurment', N'Enabled'
);
INSERT INTO dbo.License (STT, UserId, ComputerName, GlobalDomain, LocalDomain, ActiveAccount, Owner, PhongBan, KichHoat) VALUES (
  8, 81, N'1R57R13', N'diem.huynhta@hoanganh.com.vn', N'diem.huynhta',
  N'helpdesk08@hlnltphoanganh.onmicrosoft.com', N'Huỳnh Thị Ái Diễm', N'Finance & Accounting (F&A)', N'Enabled'
);
INSERT INTO dbo.License (STT, UserId, ComputerName, GlobalDomain, LocalDomain, ActiveAccount, Owner, PhongBan, KichHoat) VALUES (
  9, NULL, N'5CD117JD29', N'tinh.nguyen@hoanganh.com.vn', N'tinh.nguyen',
  N'helpdesk09@hlnltphoanganh.onmicrosoft.com', N'Nguyễn Tấn Tỉnh', N'Finance & Accounting (F&A)', N'Enabled'
);
INSERT INTO dbo.License (STT, UserId, ComputerName, GlobalDomain, LocalDomain, ActiveAccount, Owner, PhongBan, KichHoat) VALUES (
  10, 99, N'5CD9271S5M', N'phuc.le@hoanganh.com.vn', N'phuc.le',
  N'helpdesk02@hlnltphoanganh.onmicrosoft.com', N'Lê Thị Ánh Phúc', N'Procurment', N'Enabled'
);
INSERT INTO dbo.License (STT, UserId, ComputerName, GlobalDomain, LocalDomain, ActiveAccount, Owner, PhongBan, KichHoat) VALUES (
  11, 82, N'5CD0466SVR', N'duyen.nguyentm@hoanganh.com.vn', N'duyen.nguyentm',
  N'helpdesk05@hlnltphoanganh.onmicrosoft.com', N'Nguyễn Thị Mỹ Duyên', N'Procurment', N'Enabled'
);
INSERT INTO dbo.License (STT, UserId, ComputerName, GlobalDomain, LocalDomain, ActiveAccount, Owner, PhongBan, KichHoat) VALUES (
  12, 107, N'5CD1389YBG', N'cuong.huynh@hoanganh.com.vn', N'cuong.huynh',
  N'Active01@hlnltphoanganh.onmicrosoft.com', N'Huỳnh Mạnh Cường', N'Commnercial', N'Enabled'
);
INSERT INTO dbo.License (STT, UserId, ComputerName, GlobalDomain, LocalDomain, ActiveAccount, Owner, PhongBan, KichHoat) VALUES (
  13, 104, N'5CD822515W', N'luc.tran@hoanganh.com.vn', N'luc.tran',
  N'helpdesk11@hlnltphoanganh.onmicrosoft.com', N'Trần Lực', N'Flavors', N'Enabled'
);
INSERT INTO dbo.License (STT, UserId, ComputerName, GlobalDomain, LocalDomain, ActiveAccount, Owner, PhongBan, KichHoat) VALUES (
  14, NULL, N'SAMA', N'ngoc.phamt@hoanganh.com.vn', N'ngoc.phamt',
  N'helpdesk08@hlnltphoanganh.onmicrosoft.com', N'Phạm Thị Ngọc', N'Application', N'Enabled'
);
INSERT INTO dbo.License (STT, UserId, ComputerName, GlobalDomain, LocalDomain, ActiveAccount, Owner, PhongBan, KichHoat) VALUES (
  15, NULL, N'PC1AXXYL', N'thuy.phant@hoanganh.com.vn', N'thuy.phant',
  N'helpdesk03@hlnltphoanganh.onmicrosoft.com', N'Phan Thị Thuý', N'Application', N'Enabled'
);
INSERT INTO dbo.License (STT, UserId, ComputerName, GlobalDomain, LocalDomain, ActiveAccount, Owner, PhongBan, KichHoat) VALUES (
  16, 84, N'5CD6217771', N'nga.nguyentn@hoanganh.com.vn', N'nga.nguyentn',
  N'helpdesk10@hlnltphoanganh.onmicrosoft.com', N'Nguyễn Thị Ngọc Nga', N'Application', N'Enabled'
);
INSERT INTO dbo.License (STT, UserId, ComputerName, GlobalDomain, LocalDomain, ActiveAccount, Owner, PhongBan, KichHoat) VALUES (
  17, NULL, N'5CD143H3YB', N'duyen.nguyenthuythao@hoanganh.com.vn', N'duyen.nguyenthuythao',
  N'helpdesk05@hlnltphoanganh.onmicrosoft.com', N'Nguyễn Thuý Thảo Duyên', N'Application', N'Enabled'
);
INSERT INTO dbo.License (STT, UserId, ComputerName, GlobalDomain, LocalDomain, ActiveAccount, Owner, PhongBan, KichHoat) VALUES (
  18, NULL, N'5CD1080XKN', N'laptopapplication@hoanganh.com.vn', N'laptopapplication',
  N'helpdesk07@hlnltphoanganh.onmicrosoft.com', N'Laptop Application', N'Application', N'Enabled'
);
INSERT INTO dbo.License (STT, UserId, ComputerName, GlobalDomain, LocalDomain, ActiveAccount, Owner, PhongBan, KichHoat) VALUES (
  19, NULL, N'5CD9105BTZ', N'an.truong@hoanganh.com.vn', N'an.truong',
  N'helpdesk09@hlnltphoanganh.onmicrosoft.com', N'Trương Lại Thuỳ An', N'RnD', N'Enabled'
);
INSERT INTO dbo.License (STT, UserId, ComputerName, GlobalDomain, LocalDomain, ActiveAccount, Owner, PhongBan, KichHoat) VALUES (
  20, NULL, N'5CD0466SX4', N'xiu.nguyen@hoanganh.com.vn', N'xiu.nguyen',
  N'helpdesk09@hlnltphoanganh.onmicrosoft.com', N'Nguyễn Thị Xíu', N'RnD', N'Enabled'
);
INSERT INTO dbo.License (STT, UserId, ComputerName, GlobalDomain, LocalDomain, ActiveAccount, Owner, PhongBan, KichHoat) VALUES (
  21, 97, N'CND2023PRN', N'trang.pham@hoanganh.com.vn', N'trang.pham',
  N'trang@tuvanfv.onmicrosoft.com', N'Phạm Thị Ngọc Trang', N'RnD', N'Enabled'
);
INSERT INTO dbo.License (STT, UserId, ComputerName, GlobalDomain, LocalDomain, ActiveAccount, Owner, PhongBan, KichHoat) VALUES (
  22, 95, N'CND148BGPR', N'chuyen.pham@hoanganh.com.vn', N'chuyen.pham',
  N'chuyen@tuvanfv.onmicrosoft.com', N'Phạm Thị Chuyên', N'RnD', N'Enabled'
);
INSERT INTO dbo.License (STT, UserId, ComputerName, GlobalDomain, LocalDomain, ActiveAccount, Owner, PhongBan, KichHoat) VALUES (
  23, 105, N'5CD24314RP', N'anh.bui@hoanganh.com.vn', N'anh.bui',
  N'vanh@tuvanfv.onmicrosoft.com', N'Bùi Ngọc Vân Anh', N'RnD', N'Enabled'
);
INSERT INTO dbo.License (STT, UserId, ComputerName, GlobalDomain, LocalDomain, ActiveAccount, Owner, PhongBan, KichHoat) VALUES (
  24, 85, N'5CD151GWK8', N'chi.buinv@hoanganh.com.vn', N'chi.buinv',
  N'helpdesk04@hlnltphoanganh.onmicrosoft.com', N'Bùi Ngọc Vân Chi', N'RnD', N'Enabled'
);
INSERT INTO dbo.License (STT, UserId, ComputerName, GlobalDomain, LocalDomain, ActiveAccount, Owner, PhongBan, KichHoat) VALUES (
  25, 83, N'5CD0466SVN', N'vantrang.pham@hoanganh.com.vn', N'vantrang.pham',
  N'vantrang@tuvanfv.onmicrosoft.com', N'Phạm Thị Vân Trang', N'RnD', N'Enabled'
);
INSERT INTO dbo.License (STT, UserId, ComputerName, GlobalDomain, LocalDomain, ActiveAccount, Owner, PhongBan, KichHoat) VALUES (
  26, 110, N'FBVKF32', N'hue.khat@hoanganh.com.vn', N'hue.khat',
  N'helpdesk05@hlnltphoanganh.onmicrosoft.com', N'Kha Tuyết Huệ', N'RnD', N'Enabled'
);
INSERT INTO dbo.License (STT, UserId, ComputerName, GlobalDomain, LocalDomain, ActiveAccount, Owner, PhongBan, KichHoat) VALUES (
  27, 90, N'5CD62365R4', N'tho.trant@hoanganh.com.vn', N'tho.trant',
  N'helpdesk08@hlnltphoanganh.onmicrosoft.com', N'Trần Thị Thọ', N'RnD', N'Enabled'
);
INSERT INTO dbo.License (STT, UserId, ComputerName, GlobalDomain, LocalDomain, ActiveAccount, Owner, PhongBan, KichHoat) VALUES (
  28, NULL, N'24K2R33', N'tram.mactn@hoanganh.com.vn', N'tram.mactn',
  N'helpdesk04@hlnltphoanganh.onmicrosoft.com', N'RnD', N'Flavors', N'Disabled'
);
INSERT INTO dbo.License (STT, UserId, ComputerName, GlobalDomain, LocalDomain, ActiveAccount, Owner, PhongBan, KichHoat) VALUES (
  29, NULL, N'SAMA', N'dung.nguyen@hoanganh.com.vn', N'lam.let',
  N'helpdesk11@hlnltphoanganh.onmicrosoft.com', N'Phòng Trưởng Ca', N'Production', N'Enabled'
);
INSERT INTO dbo.License (STT, UserId, ComputerName, GlobalDomain, LocalDomain, ActiveAccount, Owner, PhongBan, KichHoat) VALUES (
  30, NULL, N'SAMA', N'ngoc.ungd@hoanganh.com.vn', N'lam.let',
  N'helpdesk11@hlnltphoanganh.onmicrosoft.com', N'Phòng Trưởng Ca', N'Production', N'Enabled'
);
INSERT INTO dbo.License (STT, UserId, ComputerName, GlobalDomain, LocalDomain, ActiveAccount, Owner, PhongBan, KichHoat) VALUES (
  31, NULL, N'SAMA', N'khanh.nguyenp@hoanganh.com.vn', N'lam.let',
  N'helpdesk11@hlnltphoanganh.onmicrosoft.com', N'Phòng Trưởng Ca', N'Production', N'Enabled'
);
INSERT INTO dbo.License (STT, UserId, ComputerName, GlobalDomain, LocalDomain, ActiveAccount, Owner, PhongBan, KichHoat) VALUES (
  32, NULL, N'SAMA', N'tuan.maiv@hoanganh.com.vn', N'tuan.maiv',
  N'helpdesk05@hlnltphoanganh.onmicrosoft.com', N'Lê Thị Kim Yến', N'Production', N'Enabled'
);
INSERT INTO dbo.License (STT, UserId, ComputerName, GlobalDomain, LocalDomain, ActiveAccount, Owner, PhongBan, KichHoat) VALUES (
  33, 62, N'SAMA', N'trinh.leb@hoanganh.com.vn', N'trinh.leb',
  N'helpdesk05@hlnltphoanganh.onmicrosoft.com', N'Lê Bá Trình', N'Production', N'Enabled'
);
INSERT INTO dbo.License (STT, UserId, ComputerName, GlobalDomain, LocalDomain, ActiveAccount, Owner, PhongBan, KichHoat) VALUES (
  34, 21, N'1RD6R13', N'huyen.nguyentn@hoanganh.com.vn', N'du.phamt',
  N'helpdesk05@hlnltphoanganh.onmicrosoft.com', N'Nguyễn Thị Ngọc Huyền', N'Production', N'Enabled'
);
INSERT INTO dbo.License (STT, UserId, ComputerName, GlobalDomain, LocalDomain, ActiveAccount, Owner, PhongBan, KichHoat) VALUES (
  35, 9, N'GM03S1N6', N'mh.hp@hoanganh.com.vn', N'mh.hp',
  N'helpdesk04@hlnltphoanganh.onmicrosoft.com', N'Đào Minh Quý', N'Production', N'Enabled'
);
INSERT INTO dbo.License (STT, UserId, ComputerName, GlobalDomain, LocalDomain, ActiveAccount, Owner, PhongBan, KichHoat) VALUES (
  36, 39, N'4915HY2', N'tran.leh@hoanganh.com.vn', N'tran.leh',
  N'helpdesk08@hlnltphoanganh.onmicrosoft.com', N'Lê Huyền Trân', N'Quality Management (QM)', N'Enabled'
);
INSERT INTO dbo.License (STT, UserId, ComputerName, GlobalDomain, LocalDomain, ActiveAccount, Owner, PhongBan, KichHoat) VALUES (
  37, NULL, N'5CD7486JZL', N'anh.nguyennt@hoanganh.com.vn', N'anh.nguyennt',
  N'helpdesk05@hlnltphoanganh.onmicrosoft.com', N'Nguyễn Ngọc Tuấn Anh', N'Production', N'Enabled'
);
INSERT INTO dbo.License (STT, UserId, ComputerName, GlobalDomain, LocalDomain, ActiveAccount, Owner, PhongBan, KichHoat) VALUES (
  38, NULL, N'SAMA', N'mh.hp@hoanganh.com.vn', N'mh.hp',
  N'helpdesk11@hlnltphoanganh.onmicrosoft.com', N'Phòng CCDC', N'Production', N'Enabled'
);
INSERT INTO dbo.License (STT, UserId, ComputerName, GlobalDomain, LocalDomain, ActiveAccount, Owner, PhongBan, KichHoat) VALUES (
  39, NULL, N'45B7HY2', N'mh.hp@hoanganh.com.vn', N'hp.cannguyenlieu',
  N'helpdesk11@hlnltphoanganh.onmicrosoft.com', N'Phòng cân - Nguyên liệu', N'Production', N'Enabled'
);
INSERT INTO dbo.License (STT, UserId, ComputerName, GlobalDomain, LocalDomain, ActiveAccount, Owner, PhongBan, KichHoat) VALUES (
  40, NULL, N'9HQP6Z2', N'mh.hp@hoanganh.com.vn', N'hp.cannguyenlieu',
  N'helpdesk04@hlnltphoanganh.onmicrosoft.com', N'Phòng Cân - Pha Loãng', N'Production', N'Enabled'
);
INSERT INTO dbo.License (STT, UserId, ComputerName, GlobalDomain, LocalDomain, ActiveAccount, Owner, PhongBan, KichHoat) VALUES (
  41, 49, N'6WB50G3', N'phong.thuong@hoanganh.com.vn', N'phong.thuong',
  N'helpdesk04@hlnltphoanganh.onmicrosoft.com', N'Thượng Đình Phong', N'WH & Planning', N'Enabled'
);
INSERT INTO dbo.License (STT, UserId, ComputerName, GlobalDomain, LocalDomain, ActiveAccount, Owner, PhongBan, KichHoat) VALUES (
  42, NULL, N'SAMA', N'huong.vo@hoanganh.com.vn', N'huong.vo',
  N'helpdesk01@hlnltphoanganh.onmicrosoft.com', N'Võ Thị Hương SX', N'Quality Management (QM)', N'Enabled'
);
INSERT INTO dbo.License (STT, UserId, ComputerName, GlobalDomain, LocalDomain, ActiveAccount, Owner, PhongBan, KichHoat) VALUES (
  43, NULL, N'7VL4WV2', N'huong.vo@hoanganh.com.vn', N'huong.vo',
  N'helpdesk10@hlnltphoanganh.onmicrosoft.com', N'Võ Thị Hương Cont', N'Quality Management (QM)', N'Enabled'
);
INSERT INTO dbo.License (STT, UserId, ComputerName, GlobalDomain, LocalDomain, ActiveAccount, Owner, PhongBan, KichHoat) VALUES (
  44, 33, N'5CG5313X8L', N'thao.nguyentt@hoanganh.com.vn', N'thao.nguyentt',
  N'helpdesk02@hlnltphoanganh.onmicrosoft.com', N'Nguyễn Thị Thu Thảo', N'Quality Management (QM)', N'Enabled'
);
INSERT INTO dbo.License (STT, UserId, ComputerName, GlobalDomain, LocalDomain, ActiveAccount, Owner, PhongBan, KichHoat) VALUES (
  45, 13, N'5CD0456SWZ', N'thuy.nguyentt@hoanganh.com.vn', N'thuy.nguyentt',
  N'helpdesk05@hlnltphoanganh.onmicrosoft.com', N'Nguyễn Thị Thanh Thúy', N'Quality Management (QM)', N'Enabled'
);
INSERT INTO dbo.License (STT, UserId, ComputerName, GlobalDomain, LocalDomain, ActiveAccount, Owner, PhongBan, KichHoat) VALUES (
  46, 31, N'5CD9312KQ9', N'dung.buitp@hoanganh.com.vn', N'dung.buitp',
  N'helpdesk04@hlnltphoanganh.onmicrosoft.com', N'Bùi Thị Phương Dung', N'Quality Management (QM)', N'Enabled'
);
INSERT INTO dbo.License (STT, UserId, ComputerName, GlobalDomain, LocalDomain, ActiveAccount, Owner, PhongBan, KichHoat) VALUES (
  47, 37, N'CND2023PWH', N'linh.huynhtt@hoanganh.com.vn', N'linh.huynhtt',
  N'helpdesk10@hlnltphoanganh.onmicrosoft.com', N'Huỳnh Thị Thùy Linh', N'Quality Management (QM)', N'Enabled'
);
INSERT INTO dbo.License (STT, UserId, ComputerName, GlobalDomain, LocalDomain, ActiveAccount, Owner, PhongBan, KichHoat) VALUES (
  48, 61, N'5CD143H4C4', N'nhu.nguyen@hoanganh.com.vn', N'nhu.nguyen',
  N'helpdesk06@hlnltphoanganh.onmicrosoft.com', N'Nguyễn Đông Nhu', N'Finance & Accounting (F&A)', N'Enabled'
);
INSERT INTO dbo.License (STT, UserId, ComputerName, GlobalDomain, LocalDomain, ActiveAccount, Owner, PhongBan, KichHoat) VALUES (
  49, 26, N'5CD0128NCS', N'phat.nguyent@hoanganh.com.vn', N'phat.nguyent',
  N'helpdesk05@hlnltphoanganh.onmicrosoft.com', N'Nguyễn Tấn Phát', N'Process Engineer (PE)', N'Enabled'
);
INSERT INTO dbo.License (STT, UserId, ComputerName, GlobalDomain, LocalDomain, ActiveAccount, Owner, PhongBan, KichHoat) VALUES (
  50, 35, N'5CD1131Y30', N'thinh.nguyenh@hoanganh.com.vn', N'thinh.nguyenh',
  N'helpdesk05@hlnltphoanganh.onmicrosoft.com', N'Nguyễn Hữu Thịnh', N'Maintenance Engineer (ME)', N'Enabled'
);
INSERT INTO dbo.License (STT, UserId, ComputerName, GlobalDomain, LocalDomain, ActiveAccount, Owner, PhongBan, KichHoat) VALUES (
  51, 35, N'5CD0190Y5Y', N'thang.phamn@hoanganh.com.vn', N'thang.phamn',
  N'helpdesk08@hlnltphoanganh.onmicrosoft.com', N'Nguyễn Hữu Thịnh', N'Maintenance Engineer (ME)', N'Enabled'
);
INSERT INTO dbo.License (STT, UserId, ComputerName, GlobalDomain, LocalDomain, ActiveAccount, Owner, PhongBan, KichHoat) VALUES (
  52, NULL, N'5CD823C7B8', N'son.lyt@hoanganh.com.vn', N'son.lyt',
  N'helpdesk02@hlnltphoanganh.onmicrosoft.com', N'Lý Trường Sơn', N'Maintenance Engineer (ME)', N'Enabled'
);
INSERT INTO dbo.License (STT, UserId, ComputerName, GlobalDomain, LocalDomain, ActiveAccount, Owner, PhongBan, KichHoat) VALUES (
  53, 59, N'Dell Vostro', N'nhieu.phung@hoanganh.com.vn', N'nhieu.phung',
  N'helpdesk06@hlnltphoanganh.onmicrosoft.com', N'Phùng Thanh Nhiều', N'Maintenance Engineer (ME)', N'Enabled'
);
INSERT INTO dbo.License (STT, UserId, ComputerName, GlobalDomain, LocalDomain, ActiveAccount, Owner, PhongBan, KichHoat) VALUES (
  54, 15, N'5CG53018MS', N'quoc.ngov@hoanganh.com.vn', N'quoc.ngov',
  N'helpdesk09@hlnltphoanganh.onmicrosoft.com', N'Ngô Văn Quốc', N'Process Engineer (PE)', N'Enabled'
);
INSERT INTO dbo.License (STT, UserId, ComputerName, GlobalDomain, LocalDomain, ActiveAccount, Owner, PhongBan, KichHoat) VALUES (
  55, 51, N'5CD0190WQ5', N'ngoc.doan@hoanganh.com.vn', N'ngoc.doan',
  N'helpdesk10@hlnltphoanganh.onmicrosoft.com', N'Đoàn Thị Ngọc', N'WH & Planning', N'Enabled'
);
INSERT INTO dbo.License (STT, UserId, ComputerName, GlobalDomain, LocalDomain, ActiveAccount, Owner, PhongBan, KichHoat) VALUES (
  56, 18, N'2M99ZJ3', N'din.trant@hoanganh.com.vn', N'din.trant',
  N'helpdesk06@hlnltphoanganh.onmicrosoft.com', N'Trần Tiến Din', N'Project', N'Enabled'
);
INSERT INTO dbo.License (STT, UserId, ComputerName, GlobalDomain, LocalDomain, ActiveAccount, Owner, PhongBan, KichHoat) VALUES (
  57, 51, N'8CG53240GZ', N'ngoc.doan@hoanganh.com.vn', N'ngoc.doan',
  N'helpdesk04@hlnltphoanganh.onmicrosoft.com', N'Đoàn Thị Ngọc', N'WH & Planning', N'Enabled'
);
INSERT INTO dbo.License (STT, UserId, ComputerName, GlobalDomain, LocalDomain, ActiveAccount, Owner, PhongBan, KichHoat) VALUES (
  58, 63, N'5CD0190YSY', N'an.nguyent@hoanganh.com.vn', N'an.nguyent',
  N'helpdesk11@hlnltphoanganh.onmicrosoft.com', N'Nguyễn Trường An', N'WH & Planning', N'Enabled'
);
INSERT INTO dbo.License (STT, UserId, ComputerName, GlobalDomain, LocalDomain, ActiveAccount, Owner, PhongBan, KichHoat) VALUES (
  59, NULL, N'Desktop Think Centre Neo', N'giang.leh@hoanganh.com.vn', N'giang.leh',
  N'helpdesk10@hlnltphoanganh.onmicrosoft.com', N'Lê Huỳnh Giang', N'WH & Planning', N'Enabled'
);
INSERT INTO dbo.License (STT, UserId, ComputerName, GlobalDomain, LocalDomain, ActiveAccount, Owner, PhongBan, KichHoat) VALUES (
  60, 69, N'5CD0128NKZ', N'binh.leq@hoanganh.com.vn', N'binh.leq',
  N'helpdesk10@hlnltphoanganh.onmicrosoft.com', N'Lê Quang Bình', N'Delivery', N'Enabled'
);
INSERT INTO dbo.License (STT, UserId, ComputerName, GlobalDomain, LocalDomain, ActiveAccount, Owner, PhongBan, KichHoat) VALUES (
  61, NULL, N'Dell Vostro', N'liem.nguyenq@hoanganh.com.vn', N'liem.nguyenq',
  N'helpdesk02@hlnltphoanganh.onmicrosoft.com', NULL, N'Quality Management (QM)', N'Enabled'
);
INSERT INTO dbo.License (STT, UserId, ComputerName, GlobalDomain, LocalDomain, ActiveAccount, Owner, PhongBan, KichHoat) VALUES (
  62, 68, N'Dell Vostro', N'cuong.nguyenq@hoanganh.com.vn', N'cuong.nguyenq',
  N'helpdesk10@hlnltphoanganh.onmicrosoft.com', N'Nguyễn Quốc Cường', N'Quality Management (QM)', N'Enabled'
);
INSERT INTO dbo.License (STT, UserId, ComputerName, GlobalDomain, LocalDomain, ActiveAccount, Owner, PhongBan, KichHoat) VALUES (
  63, NULL, N'Dell Vostro', N'thanh.nguyenht@hoanganh.com.vn', N'thanh.nguyenht',
  N'helpdesk11@hlnltphoanganh.onmicrosoft.com', N'Huỳnh Nguyễn Tấn Thành', N'Quality Management (QM)', N'Enabled'
);
INSERT INTO dbo.License (STT, UserId, ComputerName, GlobalDomain, LocalDomain, ActiveAccount, Owner, PhongBan, KichHoat) VALUES (
  64, 9, N'5CD905798S', N'quy.daom@hoanganh.com.vn', N'quy.daom',
  N'helpdesk08@hlnltphoanganh.onmicrosoft.com', N'Đào Minh Quý', N'Production', N'Enabled'
);
INSERT INTO dbo.License (STT, UserId, ComputerName, GlobalDomain, LocalDomain, ActiveAccount, Owner, PhongBan, KichHoat) VALUES (
  65, NULL, N'5CD7486JZL', NULL, N'prod.leader',
  N'helpdesk05@hlnltphoanganh.onmicrosoft.com', NULL, N'Production', N'Enabled'
);
INSERT INTO dbo.License (STT, UserId, ComputerName, GlobalDomain, LocalDomain, ActiveAccount, Owner, PhongBan, KichHoat) VALUES (
  66, NULL, N'5CD92274TV', NULL, N'trưởng ca',
  N'helpdesk11@hlnltphoanganh.onmicrosoft.com', NULL, N'Production', N'Enabled'
);
INSERT INTO dbo.License (STT, UserId, ComputerName, GlobalDomain, LocalDomain, ActiveAccount, Owner, PhongBan, KichHoat) VALUES (
  67, 103, N'5CD1389YPD', N'anh.nguyentl@hoanganh.com.vn', N'anh.nguyentl',
  N'helpdesk03@hlnltphoanganh.onmicrosoft.com', N'Nguyễn Thị Lan Anh', N'Commnercial', N'Enabled'
);
INSERT INTO dbo.License (STT, UserId, ComputerName, GlobalDomain, LocalDomain, ActiveAccount, Owner, PhongBan, KichHoat) VALUES (
  68, 92, N'5CG13681KL', N'thu.nguyenna@hoanganh.com.vn', N'thu.nguyenna',
  N'Active01@hlnltphoanganh.onmicrosoft.com', N'Nguyễn Ngọc Anh Thư', N'Commnercial', N'Enabled'
);
INSERT INTO dbo.License (STT, UserId, ComputerName, GlobalDomain, LocalDomain, ActiveAccount, Owner, PhongBan, KichHoat) VALUES (
  69, 102, N'5CG147C3RG', N'hanh.huynhnh@hoanganh.com.vn', N'hanh.huynhnh',
  N'Active01@hlnltphoanganh.onmicrosoft.com', N'Huỳnh Nguyễn Hồng Hạnh', N'Commnercial', N'Enabled'
);
INSERT INTO dbo.License (STT, UserId, ComputerName, GlobalDomain, LocalDomain, ActiveAccount, Owner, PhongBan, KichHoat) VALUES (
  70, 131, N'5CD1389YBG', N'thao.mait@hoanganh.com.vn', N'thao.mait',
  N'Active01@hlnltphoanganh.onmicrosoft.com', N'Nguyễn Trâm Anh', N'Commnercial', N'Enabled'
);
INSERT INTO dbo.License (STT, UserId, ComputerName, GlobalDomain, LocalDomain, ActiveAccount, Owner, PhongBan, KichHoat) VALUES (
  71, 120, N'5CD0190WQ5', N'khue.nguyentn@@hoanganh.com.vn', N'khue.nguyentn',
  N'Active01@hlnltphoanganh.onmicrosoft.com', N'Nguyễn Thị Ngọc Khuê', N'Commnercial', N'Enabled'
);
INSERT INTO dbo.License (STT, UserId, ComputerName, GlobalDomain, LocalDomain, ActiveAccount, Owner, PhongBan, KichHoat) VALUES (
  72, 117, N'5CG20413T4', N'ha.von@@hoanganh.com.vn', N'ha.von',
  N'Active01@hlnltphoanganh.onmicrosoft.com', N'Võ Ngọc Hà', N'Commnercial', N'Enabled'
);
INSERT INTO dbo.License (STT, UserId, ComputerName, GlobalDomain, LocalDomain, ActiveAccount, Owner, PhongBan, KichHoat) VALUES (
  73, 73, N'8CG5513YS8', N'huy.led@hoanganh.com.vn', N'huy.led',
  N'helpdesk09@hlnltphoanganh.onmicrosoft.com', N'Lê Đức Huy', N'Operation Director', N'Enabled'
);
INSERT INTO dbo.License (STT, UserId, ComputerName, GlobalDomain, LocalDomain, ActiveAccount, Owner, PhongBan, KichHoat) VALUES (
  74, 122, N'5CD2106VMK', N'ha.buih@hoanganh.com.vn', N'ha.buih',
  N'Active01@hlnltphoanganh.onmicrosoft.com', N'Bùi Hoàng Hà', N'Commnercial', N'Enabled'
);
INSERT INTO dbo.License (STT, UserId, ComputerName, GlobalDomain, LocalDomain, ActiveAccount, Owner, PhongBan, KichHoat) VALUES (
  75, 128, N'5CD2106VFF', N'tan.trann@hoanganh.com.vn', N'tan.trann',
  N'Active01@hlnltphoanganh.onmicrosoft.com', N'Trần Ngọc Tấn', N'Commnercial', N'Enabled'
);
INSERT INTO dbo.License (STT, UserId, ComputerName, GlobalDomain, LocalDomain, ActiveAccount, Owner, PhongBan, KichHoat) VALUES (
  76, 125, N'5CD9523X88', N'giang.phamnm@hoanganh.com.vn', N'giang.phamnm',
  N'Active01@hlnltphoanganh.onmicrosoft.com', N'Phạm Nhật Minh Giang', N'Commnercial', N'Enabled'
);
INSERT INTO dbo.License (STT, UserId, ComputerName, GlobalDomain, LocalDomain, ActiveAccount, Owner, PhongBan, KichHoat) VALUES (
  77, NULL, N'Dell Vostro', N'Phòng cân', N'Phòng cân',
  N'helpdesk10@hlnltphoanganh.onmicrosoft.com', N'Phòng cân', N'Phòng cân', N'Enabled'
);
INSERT INTO dbo.License (STT, UserId, ComputerName, GlobalDomain, LocalDomain, ActiveAccount, Owner, PhongBan, KichHoat) VALUES (
  78, NULL, N'SAMA', N'Phòng công cụ dụng cụ', N'Phòng công cụ dụng cụ',
  N'helpdesk11@hlnltphoanganh.onmicrosoft.com', N'Phòng công cụ dụng cụ', N'Phòng công cụ dụng cụ', N'Enabled'
);
INSERT INTO dbo.License (STT, UserId, ComputerName, GlobalDomain, LocalDomain, ActiveAccount, Owner, PhongBan, KichHoat) VALUES (
  79, 47, N'Dell Vostro', N'khoi.nguyenm@hoanganh.com.vn', N'khoi.nguyenm',
  N'helpdesk10@hlnltphoanganh.onmicrosoft.com', N'Nguyễn Minh Khôi', N'Quality Management (QM)', N'Enabled'
);
INSERT INTO dbo.License (STT, UserId, ComputerName, GlobalDomain, LocalDomain, ActiveAccount, Owner, PhongBan, KichHoat) VALUES (
  80, 66, N'Lenovo', N'lan.nguyent@hoanganh.com.vn', N'lan.nguyent',
  N'helpdesk03@hlnltphoanganh.onmicrosoft.com', N'Nguyễn Thị Lan', N'Quality Management (QM)', N'Enabled'
);
INSERT INTO dbo.License (STT, UserId, ComputerName, GlobalDomain, LocalDomain, ActiveAccount, Owner, PhongBan, KichHoat) VALUES (
  81, NULL, N'8CG5313FLX', N'yuya_hamasaki@hoanganh.com.vn', N'yuya_hamasaki',
  N'yuya_hamasaki@hoanganh.com.vn', N'Yuya Hamasaki', N'BOM', N'Enabled'
);
INSERT INTO dbo.License (STT, UserId, ComputerName, GlobalDomain, LocalDomain, ActiveAccount, Owner, PhongBan, KichHoat) VALUES (
  82, NULL, NULL, N'trinh.phantt@hoanganh.com.vn', N'trinh.phantt',
  N'helpdesk09@hlnltphoanganh.onmicrosoft.com', N'Nguyễn Thị Tuyết Trinh', N'Application', N'Enabled'
);
INSERT INTO dbo.License (STT, UserId, ComputerName, GlobalDomain, LocalDomain, ActiveAccount, Owner, PhongBan, KichHoat) VALUES (
  83, 116, N'Dell Vostro', N'manh.huynhn@hoanganh.com.vn', N'manh.huynhn',
  N'helpdesk10@hlnltphoanganh.onmicrosoft.com', N'Huỳnh Ngọc Mạnh', N'Application', N'Enabled'
);
INSERT INTO dbo.License (STT, UserId, ComputerName, GlobalDomain, LocalDomain, ActiveAccount, Owner, PhongBan, KichHoat) VALUES (
  84, 114, N'SAMA', N'tran.nguyenb@hoanganh.com.vn', N'tran.nguyenb',
  N'helpdesk10@hlnltphoanganh.onmicrosoft.com', N'Nguyễn Ngọc Bảo Trân', N'Application', N'Enabled'
);
INSERT INTO dbo.License (STT, UserId, ComputerName, GlobalDomain, LocalDomain, ActiveAccount, Owner, PhongBan, KichHoat) VALUES (
  85, 119, N'Dell Vostro', N'kim.huynht@hoanganh.com.vn', N'kim.huynht',
  N'helpdesk06@hlnltphoanganh.onmicrosoft.com', N'Huỳnh Thị Kim', N'Application', N'Enabled'
);
INSERT INTO dbo.License (STT, UserId, ComputerName, GlobalDomain, LocalDomain, ActiveAccount, Owner, PhongBan, KichHoat) VALUES (
  86, 55, N'SAMA', N'tuyet.nguyentn@hoanganh.com.vn', N'tuyet.nguyentn',
  N'helpesk01@hlnltphoanganh.onmicrosoft.com', N'Nguyễn Thị Ngọc Tuyết', N'WH & Planning', N'Enabled'
);
INSERT INTO dbo.License (STT, UserId, ComputerName, GlobalDomain, LocalDomain, ActiveAccount, Owner, PhongBan, KichHoat) VALUES (
  87, 65, N'5CG2040XHN', N'my.letn@hoanganh.com.vn', N'my.letn',
  N'helpdesk08@hlnltphoanganh.onmicrosoft.com', N'Lê Thị Như Mỹ', N'Admin Plant', N'Enabled'
);
INSERT INTO dbo.License (STT, UserId, ComputerName, GlobalDomain, LocalDomain, ActiveAccount, Owner, PhongBan, KichHoat) VALUES (
  88, NULL, N'SAMA', N'hp.truongca@hoanganh.com.vn', N'hp.truongca',
  N'helpdesk07@hlnltphoanganh.onmicrosoft.com', N'Trưởng ca sản xuất', N'Production', N'Enabled'
);
INSERT INTO dbo.License (STT, UserId, ComputerName, GlobalDomain, LocalDomain, ActiveAccount, Owner, PhongBan, KichHoat) VALUES (
  89, 118, NULL, N'duong.nguyenpt@hoanganh.com.vn', N'duong.nguyenpt',
  N'helpdesk02@hlnltphoanganh.onmicrosoft.com', N'Nguyễn Phan Thùy Dương', N'Commnercial', N'Enabled'
);
GO

INSERT INTO dbo.ApplicationSoftware (STT, UserId, Owner, PhongBan, May, UngDung, LyDo, LoaiPhanMem, TrangThai, NgayCaiDat, GhiChu) VALUES (
  1, 2, N'Nguyễn Hoàng Khánh Duy', N'HR&IT', N'HP Pavilion 14 Laptop PC 14-dv2000 (4Z018AV)', N'Office365 (Word, Excel, PowerPoint)',
  N'Cài đặt mặc định theo tiêu chuẩn', N'Mặc định', N'Đang sử dụng', N'07/28/2026', NULL
);
INSERT INTO dbo.ApplicationSoftware (STT, UserId, Owner, PhongBan, May, UngDung, LyDo, LoaiPhanMem, TrangThai, NgayCaiDat, GhiChu) VALUES (
  2, 2, N'Nguyễn Hoàng Khánh Duy', N'HR&IT', N'HP Pavilion 14 Laptop PC 14-dv2000 (4Z018AV)', N'OneDrive',
  N'Cài đặt mặc định theo tiêu chuẩn', N'Mặc định', N'Đang sử dụng', N'07/28/2026', NULL
);
INSERT INTO dbo.ApplicationSoftware (STT, UserId, Owner, PhongBan, May, UngDung, LyDo, LoaiPhanMem, TrangThai, NgayCaiDat, GhiChu) VALUES (
  3, 2, N'Nguyễn Hoàng Khánh Duy', N'HR&IT', N'HP Pavilion 14 Laptop PC 14-dv2000 (4Z018AV)', N'Outlook',
  N'Cài đặt mặc định theo tiêu chuẩn', N'Mặc định', N'Đang sử dụng', N'07/28/2026', NULL
);
INSERT INTO dbo.ApplicationSoftware (STT, UserId, Owner, PhongBan, May, UngDung, LyDo, LoaiPhanMem, TrangThai, NgayCaiDat, GhiChu) VALUES (
  4, 2, N'Nguyễn Hoàng Khánh Duy', N'HR&IT', N'HP Pavilion 14 Laptop PC 14-dv2000 (4Z018AV)', N'Google Chrome',
  N'Cài đặt mặc định theo tiêu chuẩn', N'Mặc định', N'Đang sử dụng', N'07/28/2026', NULL
);
INSERT INTO dbo.ApplicationSoftware (STT, UserId, Owner, PhongBan, May, UngDung, LyDo, LoaiPhanMem, TrangThai, NgayCaiDat, GhiChu) VALUES (
  5, 2, N'Nguyễn Hoàng Khánh Duy', N'HR&IT', N'HP Pavilion 14 Laptop PC 14-dv2000 (4Z018AV)', N'Unikey',
  N'Cài đặt mặc định theo tiêu chuẩn', N'Mặc định', N'Đang sử dụng', N'07/28/2026', NULL
);
INSERT INTO dbo.ApplicationSoftware (STT, UserId, Owner, PhongBan, May, UngDung, LyDo, LoaiPhanMem, TrangThai, NgayCaiDat, GhiChu) VALUES (
  6, 2, N'Nguyễn Hoàng Khánh Duy', N'HR&IT', N'HP Pavilion 14 Laptop PC 14-dv2000 (4Z018AV)', N'FoxitReader / PDFXChange',
  N'Cài đặt mặc định theo tiêu chuẩn', N'Mặc định', N'Đang sử dụng', N'07/28/2026', NULL
);
INSERT INTO dbo.ApplicationSoftware (STT, UserId, Owner, PhongBan, May, UngDung, LyDo, LoaiPhanMem, TrangThai, NgayCaiDat, GhiChu) VALUES (
  7, 2, N'Nguyễn Hoàng Khánh Duy', N'HR&IT', N'HP Pavilion 14 Laptop PC 14-dv2000 (4Z018AV)', N'WinRAR',
  N'Cài đặt mặc định theo tiêu chuẩn', N'Mặc định', N'Đang sử dụng', N'07/28/2026', NULL
);
INSERT INTO dbo.ApplicationSoftware (STT, UserId, Owner, PhongBan, May, UngDung, LyDo, LoaiPhanMem, TrangThai, NgayCaiDat, GhiChu) VALUES (
  8, 2, N'Nguyễn Hoàng Khánh Duy', N'HR&IT', N'HP Pavilion 14 Laptop PC 14-dv2000 (4Z018AV)', N'Ultraviewer',
  N'Cài đặt mặc định theo tiêu chuẩn', N'Mặc định', N'Đang sử dụng', N'07/28/2026', NULL
);
INSERT INTO dbo.ApplicationSoftware (STT, UserId, Owner, PhongBan, May, UngDung, LyDo, LoaiPhanMem, TrangThai, NgayCaiDat, GhiChu) VALUES (
  9, 2, N'Nguyễn Hoàng Khánh Duy', N'HR&IT', N'HP Pavilion 14 Laptop PC 14-dv2000 (4Z018AV)', N'SS4U',
  N'Phục vụ công việc', N'Miễn phí', N'Đang sử dụng', N'07/28/2026', NULL
);
GO

INSERT INTO dbo.LichSuBaoTri (SerialNumber, Model, TieuDe, LoaiHanhDong, ChiTiet, ChiPhi, NguoiThucHien, NgayThucHien, NgayDuKien, TrangThai) VALUES (
  N'5CD1131WHJ', N'HP 340S G7 Notebook PC', N'Kiểm tra bảo trì định kỳ', N'Bảo trì định kỳ', N'Đang sử dụng song song 2 máy Window và MacOS',
  0, N'IT Helpdesk', N'10/01/2023', NULL, N'Hoàn thành'
);
INSERT INTO dbo.LichSuBaoTri (SerialNumber, Model, TieuDe, LoaiHanhDong, ChiTiet, ChiPhi, NguoiThucHien, NgayThucHien, NgayDuKien, TrangThai) VALUES (
  N'5CD24314RP', N'HP 14 Laptop PC 14-d5000', N'Bảo trì định kỳ và gia hạn', N'Bảo trì định kỳ', N'Sử dụng bình thường, gia hạn sử dụng thêm 1 năm',
  0, N'IT Helpdesk', N'10/22/2026', NULL, N'Hoàn thành'
);
INSERT INTO dbo.LichSuBaoTri (SerialNumber, Model, TieuDe, LoaiHanhDong, ChiTiet, ChiPhi, NguoiThucHien, NgayThucHien, NgayDuKien, TrangThai) VALUES (
  N'5CD151GWK8', N'HP 340S G7 Notebook', N'Nâng cấp SSD & bảo trì', N'Nâng cấp phần cứng', N'Đề xuất nâng cấp ổ cứng SSD để tăng tốc độ',
  850000, N'IT Helpdesk', N'10/22/2026', NULL, N'Hoàn thành'
);
INSERT INTO dbo.LichSuBaoTri (SerialNumber, Model, TieuDe, LoaiHanhDong, ChiTiet, ChiPhi, NguoiThucHien, NgayThucHien, NgayDuKien, TrangThai) VALUES (
  N'5CD9312KQ9', N'HP ProBook 440 G6 Notebook PC', N'Thay thế bàn phím bị liệt nút Ctrl', N'Sửa chữa phần cứng', N'Đã thay thế bàn phím mới hoạt động tốt',
  450000, N'IT Helpdesk', N'10/14/2026', NULL, N'Hoàn thành'
);
INSERT INTO dbo.LichSuBaoTri (SerialNumber, Model, TieuDe, LoaiHanhDong, ChiTiet, ChiPhi, NguoiThucHien, NgayThucHien, NgayDuKien, TrangThai) VALUES (
  N'SAMA', N'DESKTOP-OA2I6Q1', N'Kế hoạch nâng cấp SSD cho phòng QM', N'Nâng cấp phần cứng', N'Máy tính còn dùng HDD thường xuyên bị chậm máy khi mở file chung',
  900000, N'IT Support', NULL, N'12/15/2026', N'Kế hoạch'
);
GO

INSERT INTO dbo.LichSuDieuChuyen (STT, Ngay, LoaiHanhDong, ThietBi_Model, ThietBi_Serial, ChiTiet, PhongBan_Cu, PhongBan_Moi, Owner_Cu, Owner_Moi, ChiPhi, NguoiThucHien) VALUES (
  1, N'11:29:49 21/7/2026', N'Lưu kho', N'HP 340S G7 Notebook PC', N'5CD1131WHJ',
  N'Chuyển sang lưu kho', N'Commnercial', N'Kho', N'Bùi Ngọc Minh Trang', NULL,
  NULL, NULL
);
INSERT INTO dbo.LichSuDieuChuyen (STT, Ngay, LoaiHanhDong, ThietBi_Model, ThietBi_Serial, ChiTiet, PhongBan_Cu, PhongBan_Moi, Owner_Cu, Owner_Moi, ChiPhi, NguoiThucHien) VALUES (
  2, N'11:47:34 21/7/2026', N'Lưu kho', N'HP 340S G7 Notebook PC', N'5CD1131WHJ',
  N'Chuyển sang lưu kho', N'Commnercial', N'Kho', N'Bùi Ngọc Minh Trang', NULL,
  NULL, NULL
);
INSERT INTO dbo.LichSuDieuChuyen (STT, Ngay, LoaiHanhDong, ThietBi_Model, ThietBi_Serial, ChiTiet, PhongBan_Cu, PhongBan_Moi, Owner_Cu, Owner_Moi, ChiPhi, NguoiThucHien) VALUES (
  3, N'11:47:52 21/7/2026', N'Bàn giao', N'HP 340S G7 Notebook PC', N'5CD1131WHJ',
  N'Bàn giao sang RnD/Lê Thị Như Mỹ', N'Commnercial', N'RnD', N'Bùi Ngọc Minh Trang', N'Lê Thị Như Mỹ',
  NULL, NULL
);
INSERT INTO dbo.LichSuDieuChuyen (STT, Ngay, LoaiHanhDong, ThietBi_Model, ThietBi_Serial, ChiTiet, PhongBan_Cu, PhongBan_Moi, Owner_Cu, Owner_Moi, ChiPhi, NguoiThucHien) VALUES (
  4, N'11:49:24 21/7/2026', N'Sửa chữa', N'HP 340S G7 Notebook PC', N'5CD1131WHJ',
  N'Sửa màn hình', N'RnD', N'RnD', N'Lê Thị Như Mỹ', N'Lê Thị Như Mỹ',
  N'700000', NULL
);
INSERT INTO dbo.LichSuDieuChuyen (STT, Ngay, LoaiHanhDong, ThietBi_Model, ThietBi_Serial, ChiTiet, PhongBan_Cu, PhongBan_Moi, Owner_Cu, Owner_Moi, ChiPhi, NguoiThucHien) VALUES (
  5, N'11:53:21 21/7/2026', N'Bàn giao', N'HP 340S G7 Notebook PC', N'5CD1131WHJ',
  N'Bàn giao sang RnD/Bùi Ngọc Vân Trang', N'RnD', N'RnD', N'Lê Thị Như Mỹ', N'Bùi Ngọc Vân Trang',
  NULL, NULL
);
INSERT INTO dbo.LichSuDieuChuyen (STT, Ngay, LoaiHanhDong, ThietBi_Model, ThietBi_Serial, ChiTiet, PhongBan_Cu, PhongBan_Moi, Owner_Cu, Owner_Moi, ChiPhi, NguoiThucHien) VALUES (
  6, N'16:01:59 22/7/2026', N'Bàn giao', N'HP Pavilion 14 Laptop PC 14-dv2000 (4Z018AV)', N'5CD2379SYH',
  N'Chuyển máy cho Duy, Anh Đạt đã có máy mới', N'HR&IT', N'HR&IT', N'Nguyễn Thành Đạt', N'Nguyễn Hoàng Khánh Duy',
  NULL, NULL
);
INSERT INTO dbo.LichSuDieuChuyen (STT, Ngay, LoaiHanhDong, ThietBi_Model, ThietBi_Serial, ChiTiet, PhongBan_Cu, PhongBan_Moi, Owner_Cu, Owner_Moi, ChiPhi, NguoiThucHien) VALUES (
  7, N'16:02:34 22/7/2026', N'Lưu kho', N'HP ProBook 440 G5 Notebook PC', N'5CD7486JZL',
  N'Duy đã đc bàn giao laptop mới của anh Đạt', N'HR&IT', N'Kho', N'Nguyễn Hoàng Khánh Duy', NULL,
  NULL, NULL
);
INSERT INTO dbo.LichSuDieuChuyen (STT, Ngay, LoaiHanhDong, ThietBi_Model, ThietBi_Serial, ChiTiet, PhongBan_Cu, PhongBan_Moi, Owner_Cu, Owner_Moi, ChiPhi, NguoiThucHien) VALUES (
  8, N'06/08/2026', N'Bàn giao', N'HP 340S G7 Notebook PC', N'5CD1080XKN',
  N'Bàn giao máy cho nhân viên mới', N'Application', N'Application', N'Laptop dùng chung', N'Phan Thị Tuyết Trinh',
  NULL, NULL
);
INSERT INTO dbo.LichSuDieuChuyen (STT, Ngay, LoaiHanhDong, ThietBi_Model, ThietBi_Serial, ChiTiet, PhongBan_Cu, PhongBan_Moi, Owner_Cu, Owner_Moi, ChiPhi, NguoiThucHien) VALUES (
  9, N'13:02:44 28/8/2026', N'Lưu kho', N'Hp Pavillion 14', NULL,
  N'Chị Thủy không có dùng nữa', N'HR&IT', N'Kho', N'Đinh Thị Thủy', NULL,
  NULL, NULL
);
GO

