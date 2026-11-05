-- ==========================================================================================
-- IT ASSET MANAGEMENT & MAINTENANCE MONITORING DATABASE (CHUẨN HÓA ĐA NHÓM THIẾT BỊ)
-- Hệ thống Quản lý & Giám sát Bảo trì Toàn diện (Máy tính, Thiết bị mạng, Máy in, Camera...)
-- Hệ quản trị CSDL: Microsoft SQL Server (Local / Express / Standard)
-- ==========================================================================================

USE master;
GO

-- Xóa database cũ nếu tồn tại để tạo lại hoàn toàn sạch sẽ và chuẩn xác
IF EXISTS (SELECT name FROM sys.databases WHERE name = N'ITAssetDB')
BEGIN
    ALTER DATABASE ITAssetDB SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE ITAssetDB;
    PRINT N'-> Da xoa database cu ITAssetDB thanh cong.';
END
GO

CREATE DATABASE ITAssetDB;
PRINT N'-> Da tao moi co so du lieu ITAssetDB.';
GO

USE ITAssetDB;
GO

-- ==========================================================================================
-- 1. BẢNG TỔNG HỢP TÀI SẢN CNTT (MASTER IT ASSET TABLE)
-- ==========================================================================================
CREATE TABLE dbo.ThietBi (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    STT INT NULL,
    
    -- PHÂN TÁCH & PHÂN NHÓM RÕ RÀNG
    NhomThietBi NVARCHAR(50) NOT NULL,    -- 'Máy tính', 'Thiết bị mạng', 'Máy in & Photocopy', 'Máy chủ', 'Hạ tầng & Camera'
    PhanLoai NVARCHAR(100) NULL,          -- Chi tiết: Laptop, Desktop, Switch Core, AccessPoint, Router, Firewall, Printer, Photocopy, Server, IP Camera...
    
    -- THÔNG TIN ĐỊNH DANH
    Model NVARCHAR(255) NULL,
    Alias NVARCHAR(150) NULL,             -- Tên gợi nhớ / Tên máy in / Tên Switch
    SerialNumber NVARCHAR(100) NULL,
    IPAddress NVARCHAR(50) NULL,          -- Địa chỉ IP (quan trọng cho Máy in, Switch, Server, Router, Camera)
    Firmware NVARCHAR(100) NULL,          -- Firmware cho Router, Switch, Camera
    
    -- VỊ TRÍ & NGƯỜI SỬ DỤNG
    PhongBan NVARCHAR(100) NULL,
    Owner NVARCHAR(150) NULL,              -- Người sử dụng hoặc kỹ thuật viên phụ trách
    
    -- CẤU HÌNH PHẦN CỨNG (Nếu là PC, Laptop, Server)
    OS NVARCHAR(100) NULL,
    CPU NVARCHAR(200) NULL,
    RAM NVARCHAR(100) NULL,
    HardDisk NVARCHAR(200) NULL,
    RansomwareProtection NVARCHAR(50) DEFAULT N'Yes',
    OutlookStorage NVARCHAR(100) NULL,
    
    -- NIÊN HẠN, BẢO HÀNH & BẢO TRÌ
    ThoiGianDauTu NVARCHAR(50) NULL,       -- Ngày/Tháng đầu tư (VD: Aug-22)
    HSDBanDau NVARCHAR(50) NULL,           -- Hạn sử dụng ban đầu (VD: Jul-25)
    ThoiGianBaoTri NVARCHAR(50) NULL,      -- Thời gian bảo trì gần nhất (VD: May-26)
    HSDGiaHan NVARCHAR(50) NULL,           -- Hạn sử dụng sau gia hạn (VD: May-27)
    NienHanBanDau NVARCHAR(100) NULL,      -- Đã hết hạn / Còn hạn
    NienHanGiaHan NVARCHAR(100) NULL,      -- Đã gia hạn / Chưa gia hạn
    
    -- ĐÁNH GIÁ & GIÁM SÁT KỸ THUẬT
    PhanHoiNguoiDung NVARCHAR(MAX) NULL,   -- Phản hồi thực tế
    DanhGiaKhiBaoTri NVARCHAR(MAX) NULL,   -- Tình trạng kỹ thuật lúc kiểm tra định kỳ
    KhuyenNghiIT NVARCHAR(MAX) NULL,       -- Đề xuất: Nâng RAM, thay SSD, thay drum/mực in, thay Switch...
    ChiPhiDuKien DECIMAL(18,2) NULL DEFAULT 0,
    
    -- HIỆN TRẠNG HOẠT ĐỘNG
    HienTrang NVARCHAR(100) NULL DEFAULT N'Đang sử dụng', -- Đang sử dụng, Lưu kho, In Use, Hỏng, Chờ bảo trì...
    CapNhatMay NVARCHAR(100) NULL,
    KichHoat NVARCHAR(50) NULL DEFAULT N'Enabled',
    
    NgayTao DATETIME DEFAULT GETDATE(),
    NgayCapNhat DATETIME DEFAULT GETDATE()
);

CREATE NONCLUSTERED INDEX IX_ThietBi_Nhom ON dbo.ThietBi(NhomThietBi);
CREATE NONCLUSTERED INDEX IX_ThietBi_PhanLoai ON dbo.ThietBi(PhanLoai);
CREATE NONCLUSTERED INDEX IX_ThietBi_Serial ON dbo.ThietBi(SerialNumber);
CREATE NONCLUSTERED INDEX IX_ThietBi_PhongBan ON dbo.ThietBi(PhongBan);
CREATE NONCLUSTERED INDEX IX_ThietBi_IP ON dbo.ThietBi(IPAddress);

PRINT N'-> Da tao bang ThietBi voi day du phan nhom.';
GO

-- ==========================================================================================
-- 2. BẢNG NHẬT KÝ BẢO TRÌ & SỬA CHỮA (ÁP DỤNG ĐƯỢC CHO TẤT CẢ LOẠI THIẾT BỊ)
-- ==========================================================================================
CREATE TABLE dbo.NhatKyBaoTri (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    ThietBiID INT NULL CONSTRAINT FK_NhatKyBaoTri_ThietBi REFERENCES dbo.ThietBi(ID) ON DELETE SET NULL,
    SerialNumber NVARCHAR(100) NULL,
    Model NVARCHAR(255) NULL,
    NgayThucHien DATETIME DEFAULT GETDATE(),
    LoaiHanhDong NVARCHAR(100) NOT NULL,    -- Bảo trì định kỳ, Sửa chữa phần cứng, Nạp mực/Thay linh kiện, Update Firmware...
    ChiTiet NVARCHAR(MAX) NULL,             -- Mô tả chi tiết việc đã làm
    LinhKienThayThe NVARCHAR(500) NULL,     -- SSD, Màn hình, Cụm Drum mực máy in, Nguồn Switch, Quạt tản nhiệt...
    PhongBan NVARCHAR(100) NULL,
    Owner NVARCHAR(150) NULL,
    ChiPhi DECIMAL(18,2) NULL DEFAULT 0,    -- Chi phí bảo trì/sửa chữa (VNĐ)
    NguoiThucHien NVARCHAR(150) NULL,       -- IT nội bộ hoặc đơn vị bảo trì bên ngoài
    DanhGiaSauBaoTri NVARCHAR(MAX) NULL,    -- Tình trạng sau bảo trì
    KhuyenNghiIT NVARCHAR(MAX) NULL,
    NgayBaoTriTiepTheo DATE NULL,
    TrangThai NVARCHAR(50) DEFAULT N'Hoàn thành',
    GhiChu NVARCHAR(MAX) NULL
);

CREATE NONCLUSTERED INDEX IX_NhatKyBaoTri_ThietBiID ON dbo.NhatKyBaoTri(ThietBiID);
CREATE NONCLUSTERED INDEX IX_NhatKyBaoTri_Ngay ON dbo.NhatKyBaoTri(NgayThucHien);

PRINT N'-> Da tao bang NhatKyBaoTri.';
GO

-- ==========================================================================================
-- 3. BẢNG KẾ HOẠCH BẢO TRÌ ĐỊNH KỲ CHO TỪNG THIẾT BỊ
-- ==========================================================================================
CREATE TABLE dbo.KeHoachBaoTri (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    ThietBiID INT NOT NULL CONSTRAINT FK_KeHoachBaoTri_ThietBi REFERENCES dbo.ThietBi(ID) ON DELETE CASCADE,
    TieuDe NVARCHAR(255) NOT NULL,          -- VD: Vệ sinh máy in định kỳ, Bảo trì Switch Server Q4
    NgayDuKien DATE NOT NULL,
    ChuKyThang INT DEFAULT 6,
    HangMucBaoTri NVARCHAR(MAX) NULL,
    NguoiPhuTrach NVARCHAR(150) NULL,
    TrangThai NVARCHAR(50) DEFAULT N'Chưa thực hiện',
    NgayHoanThanh DATE NULL,
    GhiChu NVARCHAR(500) NULL
);

CREATE NONCLUSTERED INDEX IX_KeHoachBaoTri_NgayDuKien ON dbo.KeHoachBaoTri(NgayDuKien, TrangThai);

PRINT N'-> Da tao bang KeHoachBaoTri.';
GO

-- ==========================================================================================
-- 4. BẢNG LỊCH SỬ ĐIỀU CHUYỂN, BÀN GIAO, LƯU KHO
-- ==========================================================================================
CREATE TABLE dbo.LichSuDieuChuyen (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    STT INT NULL,
    Ngay NVARCHAR(100) NULL,
    LoaiHanhDong NVARCHAR(100) NOT NULL,   -- Bàn giao, Lưu kho, Thu hồi, Di dời phòng ban
    ThietBi_STT INT NULL,
    ThietBi_Model NVARCHAR(255) NULL,
    ThietBi_Serial NVARCHAR(100) NULL,
    ChiTiet NVARCHAR(MAX) NULL,
    PhongBan_Cu NVARCHAR(100) NULL,
    PhongBan_Moi NVARCHAR(100) NULL,
    Owner_Cu NVARCHAR(150) NULL,
    Owner_Moi NVARCHAR(150) NULL,
    ChiPhi NVARCHAR(100) NULL,
    NguoiThucHien NVARCHAR(150) NULL,
    Nguon NVARCHAR(50) DEFAULT N'ThietBi',
    NgayTao DATETIME DEFAULT GETDATE()
);

PRINT N'-> Da tao bang LichSuDieuChuyen.';
GO

-- ==========================================================================================
-- 5. BẢNG QUẢN LÝ LICENSE VÀ PHẦN MỀM
-- ==========================================================================================
CREATE TABLE dbo.License (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    STT INT NULL,
    DeviceID NVARCHAR(100) NULL,
    Owner NVARCHAR(150) NULL,
    PhongBan NVARCHAR(100) NULL,
    ActiveAccount NVARCHAR(200) NULL,
    DomainMail NVARCHAR(200) NULL,
    LocalDomain NVARCHAR(200) NULL,
    KichHoat NVARCHAR(50) DEFAULT N'Enabled'
);
PRINT N'-> Da tao bang License.';
GO

CREATE TABLE dbo.ApplicationSoftware (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    Owner NVARCHAR(150) NULL,
    PhongBan NVARCHAR(100) NULL,
    May NVARCHAR(255) NULL,
    UngDung NVARCHAR(255) NULL,
    LyDo NVARCHAR(MAX) NULL,
    LoaiPhanMem NVARCHAR(100) NULL,
    TrangThai NVARCHAR(100) NULL,
    NgayCaiDat NVARCHAR(100) NULL,
    GhiChu NVARCHAR(MAX) NULL
);
PRINT N'-> Da tao bang ApplicationSoftware.';
GO

-- ==========================================================================================
-- 6. CÁC VIEW PHÂN NHÓM & GIÁM SÁT THIẾT BỊ CHUYÊN BIỆT
-- ==========================================================================================

-- View 6.1: CHUYÊN XEM MÁY TÍNH & LAPTOP
CREATE OR ALTER VIEW dbo.vw_ThietBi_MayTinh AS
SELECT 
    ID, STT, PhanLoai, Model, SerialNumber, PhongBan, Owner,
    OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
    ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
    PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
FROM dbo.ThietBi
WHERE NhomThietBi = N'Máy tính';
GO

-- View 6.2: CHUYÊN XEM THIẾT BỊ MẠNG (Switch, Router, AP, Firewall...)
CREATE OR ALTER VIEW dbo.vw_ThietBi_Mang AS
SELECT 
    ID, STT, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
    PhongBan, Owner, CPU, RAM, HardDisk,
    ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
    HienTrang, CapNhatMay, KichHoat
FROM dbo.ThietBi
WHERE NhomThietBi = N'Thiết bị mạng';
GO

-- View 6.3: CHUYÊN XEM MÁY IN & PHOTOCOPY (Printer, Photocopy, Máy Scan...)
CREATE OR ALTER VIEW dbo.vw_ThietBi_MayIn AS
SELECT 
    ID, STT, PhanLoai, Model AS TenMayIn, IPAddress,
    PhongBan, Owner, ThoiGianBaoTri, HienTrang, KichHoat
FROM dbo.ThietBi
WHERE NhomThietBi = N'Máy in & Photocopy';
GO

-- View 6.4: CHUYÊN XEM MÁY CHỦ, CAMERA & HẠ TẦNG (Server, DVR, Camera, Máy chấm công...)
CREATE OR ALTER VIEW dbo.vw_ThietBi_HaTang_Camera AS
SELECT 
    ID, STT, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
    PhongBan, Owner, CPU, RAM, HardDisk,
    ThoiGianDauTu, ThoiGianBaoTri, HSDGiaHan, HienTrang, KichHoat
FROM dbo.ThietBi
WHERE NhomThietBi IN (N'Máy chủ', N'Hạ tầng & Camera');
GO

-- View 6.5: BÁO CÁO TỔNG QUAN THEO TỪNG NHÓM THIẾT BỊ (Bảo trì & Chi phí)
CREATE OR ALTER VIEW dbo.vw_ThongKeTheoNhomThietBi AS
SELECT 
    t.NhomThietBi,
    COUNT(t.ID) AS TongSoLuong,
    COUNT(CASE WHEN t.HienTrang LIKE N'%sửa%' OR t.HienTrang LIKE N'%hỏng%' THEN 1 END) AS SoLuongDangHong,
    COUNT(CASE WHEN t.HienTrang LIKE N'%kho%' THEN 1 END) AS SoLuongLuuKho,
    COUNT(nk.ID) AS SoLuotBaoTri,
    ISNULL(SUM(nk.ChiPhi), 0) AS TongChiPhiBaoTriVND
FROM dbo.ThietBi t
LEFT JOIN dbo.NhatKyBaoTri nk ON t.ID = nk.ThietBiID OR t.SerialNumber = nk.SerialNumber
GROUP BY t.NhomThietBi;
GO

-- View 6.6: THIẾT BỊ CẦN BẢO DƯỠNG / NÂNG CẤP (Theo khuyến nghị IT)
CREATE OR ALTER VIEW dbo.vw_ThietBiCanNangCap AS
SELECT 
    ID, NhomThietBi, PhanLoai, Model, SerialNumber, PhongBan, Owner,
    RAM, HardDisk, KhuyenNghiIT, DanhGiaKhiBaoTri, HienTrang
FROM dbo.ThietBi
WHERE KhuyenNghiIT IS NOT NULL 
  AND LEN(TRIM(KhuyenNghiIT)) > 0
  AND KhuyenNghiIT NOT LIKE N'%bình thường%';
GO

-- View 6.7: TỔNG HỢP CHI PHÍ BẢO TRÌ THEO PHÒNG BAN
CREATE OR ALTER VIEW dbo.vw_ChiPhiBaoTriTheoPhongBan AS
SELECT 
    ISNULL(t.PhongBan, N'Chưa rõ') AS PhongBan,
    COUNT(DISTINCT t.ID) AS SoLuongThietBi,
    COUNT(nk.ID) AS SoLuotBaoTri,
    ISNULL(SUM(nk.ChiPhi), 0) AS TongChiPhiVND
FROM dbo.ThietBi t
LEFT JOIN dbo.NhatKyBaoTri nk ON t.ID = nk.ThietBiID OR t.SerialNumber = nk.SerialNumber
GROUP BY t.PhongBan;
GO

-- ==========================================================================================
-- 7. STORED PROCEDURES HỖ TRỢ VẬN HÀNH
-- ==========================================================================================

-- SP 7.1: Ghi nhận bảo trì
CREATE OR ALTER PROCEDURE dbo.sp_GhiNhanBaoTri
    @ThietBiID INT,
    @LoaiHanhDong NVARCHAR(100),
    @ChiTiet NVARCHAR(MAX),
    @LinhKienThayThe NVARCHAR(500) = NULL,
    @ChiPhi DECIMAL(18,2) = 0,
    @NguoiThucHien NVARCHAR(150) = NULL,
    @DanhGiaSauBaoTri NVARCHAR(MAX) = NULL,
    @KhuyenNghiIT NVARCHAR(MAX) = NULL,
    @NgayBaoTriTiepTheo DATE = NULL,
    @HienTrangMoi NVARCHAR(100) = N'Đang sử dụng'
AS
BEGIN
    SET NOCOUNT ON;
    
    DECLARE @Serial NVARCHAR(100), @Model NVARCHAR(255), @PhongBan NVARCHAR(100), @Owner NVARCHAR(150);
    SELECT 
        @Serial = SerialNumber,
        @Model = Model,
        @PhongBan = PhongBan,
        @Owner = Owner
    FROM dbo.ThietBi 
    WHERE ID = @ThietBiID;

    IF @Serial IS NULL AND @Model IS NULL
    BEGIN
        RAISERROR(N'Không tìm thấy thiết bị với ID này.', 16, 1);
        RETURN;
    END

    INSERT INTO dbo.NhatKyBaoTri (
        ThietBiID, SerialNumber, Model, NgayThucHien, LoaiHanhDong,
        ChiTiet, LinhKienThayThe, PhongBan, Owner, ChiPhi,
        NguoiThucHien, DanhGiaSauBaoTri, KhuyenNghiIT, NgayBaoTriTiepTheo, TrangThai
    )
    VALUES (
        @ThietBiID, @Serial, @Model, GETDATE(), @LoaiHanhDong,
        @ChiTiet, @LinhKienThayThe, @PhongBan, @Owner, @ChiPhi,
        @NguoiThucHien, @DanhGiaSauBaoTri, @KhuyenNghiIT, @NgayBaoTriTiepTheo, N'Hoàn thành'
    );

    UPDATE dbo.ThietBi
    SET 
        ThoiGianBaoTri = CONVERT(VARCHAR(10), GETDATE(), 103),
        DanhGiaKhiBaoTri = ISNULL(@DanhGiaSauBaoTri, DanhGiaKhiBaoTri),
        KhuyenNghiIT = ISNULL(@KhuyenNghiIT, KhuyenNghiIT),
        HienTrang = ISNULL(@HienTrangMoi, HienTrang),
        NgayCapNhat = GETDATE()
    WHERE ID = @ThietBiID;

    PRINT N'-> Đã ghi nhận bảo trì và cập nhật thiết bị thành công.';
END
GO

-- SP 7.2: Thống kê KPI
CREATE OR ALTER PROCEDURE dbo.sp_ThongKeGiamSat
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        (SELECT COUNT(*) FROM dbo.ThietBi) AS TongSoTatCaThietBi,
        (SELECT COUNT(*) FROM dbo.ThietBi WHERE NhomThietBi = N'Máy tính') AS TongMayTinh,
        (SELECT COUNT(*) FROM dbo.ThietBi WHERE NhomThietBi = N'Thiết bị mạng') AS TongThietBiMang,
        (SELECT COUNT(*) FROM dbo.ThietBi WHERE NhomThietBi = N'Máy in & Photocopy') AS TongMayIn,
        (SELECT COUNT(*) FROM dbo.ThietBi WHERE NhomThietBi IN (N'Máy chủ', N'Hạ tầng & Camera')) AS TongHaTangVaCamera,
        (SELECT COUNT(*) FROM dbo.NhatKyBaoTri) AS TongLuotBaoTri,
        (SELECT ISNULL(SUM(ChiPhi), 0) FROM dbo.NhatKyBaoTri) AS TongChiPhiBaoTriVND;
END
GO

PRINT N'================================================================';
PRINT N'  KHỞI TẠO CƠ SỞ DỮ LIỆU ITAssetDB HOÀN TẤT VỚI ĐẦY ĐỦ BẢNG & VIEW!';
PRINT N'================================================================';
GO
