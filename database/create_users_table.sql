-- ==========================================================================================
-- TẠO BẢNG USERS (HỆ THỐNG TÀI KHOẢN NGƯỜI DÙNG / PHÂN QUYỀN - KHÔNG KHÓA NGOẠI)
-- ==========================================================================================
USE ITAssetDB;
SET NOCOUNT ON;

IF OBJECT_ID('dbo.Users', 'U') IS NOT NULL 
    DROP TABLE dbo.Users;
GO

CREATE TABLE dbo.Users (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Username NVARCHAR(50) NOT NULL,
    PasswordHash NVARCHAR(255) NULL,
    FullName NVARCHAR(150) NOT NULL,
    Email NVARCHAR(150) NULL,
    Role NVARCHAR(50) DEFAULT N'Admin',          -- Admin, IT Support, Manager, User
    Department NVARCHAR(100) NULL,              -- HR&IT, v.v.
    IsActive BIT DEFAULT 1,                     -- 1: Đang hoạt động, 0: Khóa
    LastLogin DATETIME NULL,
    CreatedAt DATETIME DEFAULT GETDATE(),
    UpdatedAt DATETIME DEFAULT GETDATE()
);
GO

CREATE UNIQUE NONCLUSTERED INDEX IX_Users_Username ON dbo.Users(Username);
CREATE NONCLUSTERED INDEX IX_Users_Email ON dbo.Users(Email);
GO

-- Nạp sẵn dữ liệu tài khoản quản trị và nhân sự IT
INSERT INTO dbo.Users (Username, PasswordHash, FullName, Email, Role, Department, IsActive) VALUES
(N'admin', NULL, N'System Administrator', N'it-admin@hoanganh.com.vn', N'Admin', N'HR&IT', 1),
(N'duy.nguyenhk', NULL, N'Nguyễn Hoàng Khánh Duy', N'duy.nguyenhk@hoanganh.com.vn', N'Admin', N'HR&IT', 1),
(N'nhan.tran', NULL, N'Trần Hải Nhân', N'nhan.tranh@hoanganh.com.vn', N'Admin', N'HR&IT', 1),
(N'dat.nguyent', NULL, N'Nguyễn Thành Đạt', N'dat.nguyent@hoanganh.com.vn', N'IT Support', N'HR&IT', 1),
(N'hao.lamg', NULL, N'Lâm Gia Hào', N'hao.lamg@hoanganh.com.vn', N'IT Support', N'HR&IT', 1),
(N'son.nguyenx', NULL, N'Nguyễn Xuân Sơn', N'son.nguyenx@hoanganh.com.vn', N'IT Support', N'HR&IT', 1);
GO

