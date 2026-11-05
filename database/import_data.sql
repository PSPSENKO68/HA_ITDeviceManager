-- ==========================================================================================
-- SCRIPT MIGRATION TỔNG HỢP TOÀN BỘ THIẾT BỊ VÀO ITAssetDB (PHÂN TÁCH ĐỦ NHÓM)
-- ==========================================================================================

USE ITAssetDB;
SET NOCOUNT ON;

DELETE FROM dbo.ThietBi;
DBCC CHECKIDENT ('dbo.ThietBi', RESEED, 0);

-- 1.1 Nhập 95 Máy tính & Laptop
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, SerialNumber, OS, CPU, RAM, HardDisk,
  RansomwareProtection, OutlookStorage, PhongBan, Owner, ThoiGianDauTu, HSDBanDau,
  ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan, PhanHoiNguoiDung,
  DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  1, N'Máy tính', N'Laptop',
  N'HP 14 Laptop PC 14-d5000', N'5CD24314RP', N'Windows 11', N'12th Gen Intel(R) Core(TM) i7-1255U',
  N'8GB - 3200- 2/2 SLOT', N'500GB SSD - SK Hynix', N'Yes',
  N'6.57 gb free of 49.5', N'RnD', N'Bùi Ngọc Vân Anh',
  N'Aug-22', N'Jul-25', N'May-26',
  N'May-27', N'Đã hết hạn', N'Đã được gia hạn',
  NULL, N'Sử dụng bình thường',
  NULL, 0, NULL,
  N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, SerialNumber, OS, CPU, RAM, HardDisk,
  RansomwareProtection, OutlookStorage, PhongBan, Owner, ThoiGianDauTu, HSDBanDau,
  ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan, PhanHoiNguoiDung,
  DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  2, N'Máy tính', N'Laptop',
  N'HP 340S G7 Notebook', N'5CD151GWK8', N'Windows 11', N'Intel Core i5 1035G1',
  N'8GB - 3200 - 1/2 SLOT', N'240GB SSD SK Hynix', N'Yes',
  N'26.5 free of 49.5', N'RnD', N'Bùi Ngọc Vân Chi',
  N'Mar-22', N'Feb-25', N'May-26',
  N'May-27', N'Đã hết hạn', N'Đã được gia hạn',
  NULL, N'Sử dụng bình thường',
  N'Đề xuất thay ổ cứng', 0, NULL,
  N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, SerialNumber, OS, CPU, RAM, HardDisk,
  RansomwareProtection, OutlookStorage, PhongBan, Owner, ThoiGianDauTu, HSDBanDau,
  ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan, PhanHoiNguoiDung,
  DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  3, N'Máy tính', N'Laptop',
  N'HP ProBook 440 G6 Notebook PC', N'5CD9312KQ9', NULL, N'Intel Core i5 8265U',
  N'8 GB', N'256 GB SSD + 500 GB HDD', N'Yes',
  NULL, N'Quality Management (QM)', N'Bùi Thị Phương Dung',
  N'Mar-20', N'Mar-23', N'Oct-23',
  N'Sep-24', N'Đã hết hạn', N'Đã được gia hạn',
  NULL, N'Máy tính đã hết niên hạn nhưng bị liệt nút "Ctrl" bên trái bàn phím',
  N'Thay bàn phím mới', 0, N'Đã thay thế bàn phím ngày 22/08/2023',
  N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, SerialNumber, OS, CPU, RAM, HardDisk,
  RansomwareProtection, OutlookStorage, PhongBan, Owner, ThoiGianDauTu, HSDBanDau,
  ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan, PhanHoiNguoiDung,
  DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  4, N'Máy tính', N'Desktop',
  N'Neo 50t Gen 3 Desktop (ThinkCentre)', N'GM03S1N6', N'Windows 11', N'12th Gen Intel Core i3-12100',
  N'8GB', N'256 GB SSD', N'Yes',
  NULL, N'Production', N'Đào Minh Quý',
  N'Jun-23', N'May-26', N'Apr-26',
  N'May-26', N'Đã hết hạn', N'Chưa được gia hạn',
  NULL, N'Máy mới được cấp vào tháng 6-2023',
  NULL, 0, NULL,
  N'Trong niên hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, SerialNumber, OS, CPU, RAM, HardDisk,
  RansomwareProtection, OutlookStorage, PhongBan, Owner, ThoiGianDauTu, HSDBanDau,
  ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan, PhanHoiNguoiDung,
  DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  5, N'Máy tính', N'Laptop',
  N'HP Pavilion 14 Laptop PC 14-dv2000 (4Z018AV)', N'5CD2379SWJ', N'Windows 11', N'12th Gen Intel(R) Core(TM) i5-1235U',
  N'8GB-BUS3200-2/2 slot', N'512 GB SSD WDC', N'Yes',
  NULL, N'HR&IT', N'Huỳnh Thị Mỹ Duyên',
  N'Dec-22', N'Nov-25', N'Apr-26',
  N'Apr-27', N'Đã hết hạn', N'Đã được gia hạn',
  NULL, N'Sử dụng bình thường',
  NULL, 0, NULL,
  N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, SerialNumber, OS, CPU, RAM, HardDisk,
  RansomwareProtection, OutlookStorage, PhongBan, Owner, ThoiGianDauTu, HSDBanDau,
  ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan, PhanHoiNguoiDung,
  DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  6, N'Máy tính', N'Desktop',
  N'HP Desktop M01', N'1R57R13', N'Windows 11', N'13th Intel Core  i5 13400',
  N'8 GB - 3200 - 1/2 slot', N'500 GB SSD - WDC', N'Yes',
  N'4.15 gb free of 49.5', N'Finance & Accounting (F&A)', N'Huỳnh Thị Ái Diễm',
  N'May-21', N'Apr-24', N'May-26',
  N'May-27', N'Đã hết hạn', N'Đã được gia hạn',
  NULL, N'Máy sử dụng bình thường',
  NULL, 0, NULL,
  N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, SerialNumber, OS, CPU, RAM, HardDisk,
  RansomwareProtection, OutlookStorage, PhongBan, Owner, ThoiGianDauTu, HSDBanDau,
  ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan, PhanHoiNguoiDung,
  DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  7, N'Máy tính', N'Desktop',
  N'HP ENVY Laptop 13-ba1000 (1F4E5AV)', N'CND2023PWH', N'Windows 11', N'11th Gen Intel(R) Core(TM) i5-1135G7',
  N'8GB-BUS3200-2/2 slot', N'500GB SSD - Kingston', N'Yes',
  NULL, N'Quality Management (QM)', N'Huỳnh Thị Thùy Linh',
  N'Nov-22', N'Oct-25', N'Apr-26',
  N'Oct-25', N'Đã hết hạn', N'Chưa được gia hạn',
  NULL, N'Sử dụng bình thường',
  NULL, 0, N'Máy mới được cấp vào tháng 11-2022',
  N'Trong niên hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, SerialNumber, OS, CPU, RAM, HardDisk,
  RansomwareProtection, OutlookStorage, PhongBan, Owner, ThoiGianDauTu, HSDBanDau,
  ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan, PhanHoiNguoiDung,
  DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  8, N'Máy tính', N'Laptop',
  N'HP PROBOOK 440 G3', NULL, N'Windows 11', N'Intel Core i5 5200U',
  N'8 GB', N'500GB SSD - SAMSUNG', N'Yes',
  N'37.7 gb free of 49.5', N'RnD', N'Kha Tuyết Huệ',
  N'Jun-16', N'Jun-19', N'May-26',
  N'May-27', N'Đã hết hạn', N'Đã được gia hạn',
  NULL, N'Sử dụng bình thường',
  NULL, 0, NULL,
  N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, SerialNumber, OS, CPU, RAM, HardDisk,
  RansomwareProtection, OutlookStorage, PhongBan, Owner, ThoiGianDauTu, HSDBanDau,
  ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan, PhanHoiNguoiDung,
  DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  9, N'Máy tính', N'Laptop',
  N'HP 340S G7 Notebook PC', N'5CD1080XKN', N'Windows 11', N'Intel Core i3-1005G1',
  N'8 GB', N'512 GB SSD', N'Yes',
  NULL, N'Application', N'Phan Thị Tuyết Trinh',
  N'Nov-21', N'Oct-24', N'Oct-23',
  N'Oct-24', N'Đã hết hạn', N'Chưa được gia hạn',
  NULL, N'Sử dụng bình thường',
  NULL, 0, N'Máy tính được tất cả các user phòng Application sử dụng khi cần',
  N'Trong niên hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, SerialNumber, OS, CPU, RAM, HardDisk,
  RansomwareProtection, OutlookStorage, PhongBan, Owner, ThoiGianDauTu, HSDBanDau,
  ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan, PhanHoiNguoiDung,
  DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  10, N'Máy tính', N'Laptop',
  N'DESKTOP-R60MJDC', N'SAMA', NULL, N'Intel Pentium G3450',
  N'6 GB', N'256 GB SSD', NULL,
  NULL, N'Production', N'Lê Bá Trình',
  N'Jun-18', N'May-21', N'Oct-23',
  N'Sep-24', N'Đã hết hạn', N'Đã được gia hạn',
  NULL, N'Máy tính đã hết niên hạn sử dụng nhưng sử dụng bình thường',
  NULL, 0, NULL,
  N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, SerialNumber, OS, CPU, RAM, HardDisk,
  RansomwareProtection, OutlookStorage, PhongBan, Owner, ThoiGianDauTu, HSDBanDau,
  ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan, PhanHoiNguoiDung,
  DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  11, N'Máy tính', N'Desktop',
  N'Dell Vostro', N'7WL3WV2', N'Windows 11', N'Intel Pentium G5400',
  N'16GB - 3000 - 1/2 slot', N'250 GB SSD - Corsair', N'Yes',
  N'13gb free of 49.5', N'Procurement', N'Lê Bảy',
  N'Feb-19', N'Jan-22', N'May-26',
  N'May-27', N'Đã hết hạn', N'Đã được gia hạn',
  NULL, N'Đã thu hồi thùng cũ',
  NULL, 0, N'Đã đổi thùng mới trong kho , nâng ram 16gb',
  N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, SerialNumber, OS, CPU, RAM, HardDisk,
  RansomwareProtection, OutlookStorage, PhongBan, Owner, ThoiGianDauTu, HSDBanDau,
  ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan, PhanHoiNguoiDung,
  DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  12, N'Máy tính', N'Desktop',
  N'Dell Vostro 3670', N'4915HY2', N'Windows 11', N'Intel Pentium Gold G5420',
  N'8GB - 2400 - 2/2 slot', N'500GB SSD - SAMSUNG', N'Yes',
  NULL, N'Quality Management (QM)', N'Lê Huyền Trân',
  N'Aug-20', N'Aug-23', N'Oct-23',
  N'Sep-24', N'Đã hết hạn', N'Đã được gia hạn',
  NULL, N'Máy tính đã hết niên hạn nhưng sử dụng bình thường',
  NULL, 0, NULL,
  N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, SerialNumber, OS, CPU, RAM, HardDisk,
  RansomwareProtection, OutlookStorage, PhongBan, Owner, ThoiGianDauTu, HSDBanDau,
  ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan, PhanHoiNguoiDung,
  DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  13, N'Máy tính', N'Laptop',
  N'HP ProBook 440 G6 Notebook PC', N'5CD9302BC3', N'Windows 11', N'Intel Core i5 8265U',
  N'8 GB', N'256 GB SSD', N'Yes',
  NULL, N'Finance & Accounting (F&A)', N'Lê Nguyễn Phương Thư',
  N'Aug-21', N'Jul-24', N'Oct-23',
  N'Jul-24', N'Đã hết hạn', N'Chưa được gia hạn',
  NULL, N'Đầy ổ cứng disk C, treo máy không thể xử lý được',
  NULL, 0, N'Đã khắc phục vào tháng 06-2023',
  N'Trong niên hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, SerialNumber, OS, CPU, RAM, HardDisk,
  RansomwareProtection, OutlookStorage, PhongBan, Owner, ThoiGianDauTu, HSDBanDau,
  ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan, PhanHoiNguoiDung,
  DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  14, N'Máy tính', N'Laptop',
  N'HP Probook 440 G6 Notebook', N'5CD9271S5M', N'Windows 11', N'Intel Core i5 8265U',
  N'8 GB', N'256 GB SSD Kingston + 500 GB HDD', N'Yes',
  N'6.07 gb of   49.5 gb', N'Procurement', N'Lê Thị Ánh Phúc',
  N'Feb-19', N'Jan-22', N'Oct-23',
  N'Sep-24', N'Đã hết hạn', N'Đã được gia hạn',
  NULL, N'Máy tính đã hết niên hạn sử dụng nhưng sử dụng bình thường',
  NULL, 0, NULL,
  N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, SerialNumber, OS, CPU, RAM, HardDisk,
  RansomwareProtection, OutlookStorage, PhongBan, Owner, ThoiGianDauTu, HSDBanDau,
  ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan, PhanHoiNguoiDung,
  DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  15, N'Máy tính', N'Laptop',
  N'DESKTOP-EDIP08012', N'SAMA', NULL, N'Intel Pentium G2030',
  N'8 GB', N'500 GB SSD', NULL,
  NULL, N'Production', N'Production Public',
  N'Jan-22', N'Dec-24', N'Oct-23',
  N'Sep-24', N'Đã hết hạn', N'Đã được gia hạn',
  NULL, N'Đã nâng cấp ổ cứng SSD ngày 28/08/2023',
  NULL, 0, N'Đã nâng cấp ổ cứng SSD ngày 28/08/2023',
  N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, SerialNumber, OS, CPU, RAM, HardDisk,
  RansomwareProtection, OutlookStorage, PhongBan, Owner, ThoiGianDauTu, HSDBanDau,
  ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan, PhanHoiNguoiDung,
  DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  16, N'Máy tính', N'Laptop',
  N'HP 245 G10', N'5CG53018MS', N'Windows 11', N'Ryzen 7 7730u',
  N'16GB-3200- 1/2 slot', N'500GB-SK Hynix', N'Yes',
  NULL, N'Process Engineer (PE)', N'Ngô Văn Quốc',
  N'Mar-26', N'Feb-29', N'Apr-26',
  N'Feb-29', N'Còn hạn', N'Còn hạn',
  NULL, N'Sử dụng bình thường',
  NULL, 0, NULL,
  N'Trong niên hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, SerialNumber, OS, CPU, RAM, HardDisk,
  RansomwareProtection, OutlookStorage, PhongBan, Owner, ThoiGianDauTu, HSDBanDau,
  ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan, PhanHoiNguoiDung,
  DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  17, N'Máy tính', N'Laptop',
  N'HP 340S G7 Notebook PC (8BC21AV)', N'5CD143H4C4', N'Windows 11', N'Intel Core i5 1035G1',
  N'8GB-BUS3200-1/2 slot', N'500GB SSD - SK Hynix', N'Yes',
  NULL, N'Finance & Accounting (F&A)', N'Nguyễn Đông Nhu',
  N'Apr-22', N'Mar-25', N'Apr-26',
  N'Mar-25', N'Đã hết hạn', N'Chưa được gia hạn',
  NULL, N'Sử dụng bình thường',
  NULL, 0, NULL,
  N'Trong niên hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, SerialNumber, OS, CPU, RAM, HardDisk,
  RansomwareProtection, OutlookStorage, PhongBan, Owner, ThoiGianDauTu, HSDBanDau,
  ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan, PhanHoiNguoiDung,
  DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  18, N'Máy tính', N'Laptop',
  N'HP 340S G7 Notebook PC (8BC21AV)', N'5CD1131Y30', N'Windows 11', N'Intel Core i5 1035G1',
  N'8GB-BUS3200-1/2slot', N'512 GB SSD kioxia', N'Yes',
  NULL, N'Maintenance Engineer (ME)', N'Nguyễn Hữu Thịnh',
  N'May-21', N'Apr-24', N'Apr-26',
  N'Apr-24', N'Đã hết hạn', N'Chưa được gia hạn',
  NULL, N'Sử dụng bình thường',
  NULL, 0, NULL,
  N'Trong niên hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, SerialNumber, OS, CPU, RAM, HardDisk,
  RansomwareProtection, OutlookStorage, PhongBan, Owner, ThoiGianDauTu, HSDBanDau,
  ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan, PhanHoiNguoiDung,
  DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  19, N'Máy tính', N'Laptop',
  N'HP ProBook 440 G7 Notebook PC (6XJ55AV)', N'5CD0128NCS', N'Windows 11', N'Intel Core i5 10210U',
  N'8GB-BUS2667-2/2slot', N'256 GB SSD', N'Yes',
  NULL, N'Process Engineer (PE)', N'Nguyễn Tấn Phát',
  N'Mar-20', N'Mar-23', N'Apr-26',
  N'Apr-27', N'Đã hết hạn', N'Đã được gia hạn',
  NULL, N'Máy tính sử dụng bình thường , gia hạn niên hạn',
  NULL, 0, NULL,
  N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, SerialNumber, OS, CPU, RAM, HardDisk,
  RansomwareProtection, OutlookStorage, PhongBan, Owner, ThoiGianDauTu, HSDBanDau,
  ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan, PhanHoiNguoiDung,
  DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  20, N'Máy tính', N'Laptop',
  N'HP Probook 440 G8', N'5CD117JD29', N'Windows 11', N'11th Intel Core i5 1135G7',
  N'8 GB - 3200 - 1/2 slot', N'500 GB SSD', N'Yes',
  NULL, N'Finance & Accounting (F&A)', N'Nguyễn Tấn Tỉnh',
  N'May-21', N'Apr-24', N'May-26',
  N'May-27', N'Đã hết hạn', N'Đã được gia hạn',
  NULL, N'Sử dụng bình thường',
  NULL, 0, NULL,
  N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, SerialNumber, OS, CPU, RAM, HardDisk,
  RansomwareProtection, OutlookStorage, PhongBan, Owner, ThoiGianDauTu, HSDBanDau,
  ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan, PhanHoiNguoiDung,
  DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  21, N'Máy tính', N'Laptop',
  N'HP Pavilion 14 Laptop PC 14-dv2000 (4Z018AV)', N'5CD2379SYH', N'Windows 11', N'12th Gen Intel(R) Core(TM) i5-1235U',
  N'8 GB', N'512 GB SSD', N'Yes',
  NULL, N'HR&IT', N'Nguyễn Thành Đạt',
  N'Jan-23', N'Dec-25', N'Apr-26',
  N'Apr-27', N'Đã hết hạn', N'Đã được gia hạn',
  NULL, N'Sử dụng bình thường',
  NULL, 0, NULL,
  N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, SerialNumber, OS, CPU, RAM, HardDisk,
  RansomwareProtection, OutlookStorage, PhongBan, Owner, ThoiGianDauTu, HSDBanDau,
  ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan, PhanHoiNguoiDung,
  DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  22, N'Máy tính', N'Laptop',
  N'HP 340S G7 Notebook', N'5CD0466SX4', N'Windows 11', N'Intel Core i3 1005G1',
  N'8GB - 3200 - 2/2 SLOT', N'500GB SSD - Gigabyte', N'Yes',
  N'19.4 gb free / 49.5', N'RnD', N'Nguyễn Thị Lê Xíu',
  N'Nov-21', N'Oct-24', N'May-26',
  N'May-27', N'Đã hết hạn', N'Đã được gia hạn',
  NULL, N'Sử dụng bình thường',
  NULL, 0, NULL,
  N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, SerialNumber, OS, CPU, RAM, HardDisk,
  RansomwareProtection, OutlookStorage, PhongBan, Owner, ThoiGianDauTu, HSDBanDau,
  ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan, PhanHoiNguoiDung,
  DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  23, N'Máy tính', N'Laptop',
  N'HP 245 G10', N'5CD0466SVR', N'Windows 11', N'Intel Core i3 1005G1',
  N'8 GB', N'256 GB SSD', N'Yes',
  NULL, N'Procurement', N'Nguyễn Thị Mỹ Duyên',
  N'Nov-22', N'Oct-25', N'Oct-23',
  N'Oct-25', N'Đã hết hạn', N'Chưa được gia hạn',
  NULL, N'Sử dụng bình thường',
  NULL, 0, NULL,
  N'Trong niên hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, SerialNumber, OS, CPU, RAM, HardDisk,
  RansomwareProtection, OutlookStorage, PhongBan, Owner, ThoiGianDauTu, HSDBanDau,
  ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan, PhanHoiNguoiDung,
  DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  24, N'Máy tính', N'Desktop',
  N'Dell Vostro 3671', N'1RD6R13', N'Windows 11', N'Intel Pentium Gold G5240',
  N'8 GB', N'250 GB SSD', N'Yes',
  NULL, N'Production', N'Nguyễn Thị Ngọc Huyền',
  N'Feb-21', N'Feb-24', N'Oct-23',
  N'Sep-24', N'Đã hết hạn', N'Đã được gia hạn',
  NULL, N'Sử dụng bình thường',
  NULL, 0, N'Đã nâng cấp ổ cứng SSD ngày 20/04/2023',
  N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, SerialNumber, OS, CPU, RAM, HardDisk,
  RansomwareProtection, OutlookStorage, PhongBan, Owner, ThoiGianDauTu, HSDBanDau,
  ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan, PhanHoiNguoiDung,
  DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  25, N'Máy tính', N'Laptop',
  N'HP Probook 440 G3 Notebook', N'5CD6217771', N'Windows 10', N'Intel Core i5 6200U',
  N'8GB - 2133 - 2/2 slot', N'240GB SSD - SANDISK', N'Yes',
  N'37gb free of 49.5', N'Application', N'Nguyễn Thị Ngọc Nga',
  N'Jun-16', N'Jun-19', N'May-26',
  N'May-27', N'Đã hết hạn', N'Đã được gia hạn',
  NULL, N'Sử dụng bình thường',
  NULL, 0, NULL,
  N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, SerialNumber, OS, CPU, RAM, HardDisk,
  RansomwareProtection, OutlookStorage, PhongBan, Owner, ThoiGianDauTu, HSDBanDau,
  ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan, PhanHoiNguoiDung,
  DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  26, N'Máy tính', N'Laptop',
  N'HP 340s G7', N'5CD0456swz', N'Windows 11', N'Intel Core i3 1005G1',
  N'8 GB - BUS3200 - 1/2 slot', N'512GB SSD ADATA', N'Yes',
  NULL, N'Quality Management (QM)', N'Nguyễn Thị Thanh Thuý',
  N'Nov-15', N'Oct-18', N'Apr-26',
  N'Apr-27', N'Đã hết hạn', N'Đã được gia hạn',
  NULL, N'Máy tính sử dụng bình thường , gia hạn niên hạn',
  NULL, 0, NULL,
  N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, SerialNumber, OS, CPU, RAM, HardDisk,
  RansomwareProtection, OutlookStorage, PhongBan, Owner, ThoiGianDauTu, HSDBanDau,
  ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan, PhanHoiNguoiDung,
  DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  27, N'Máy tính', N'Laptop',
  N'HP Laptop 14 ep1179TU', N'5CG5313X8L', N'Windows 11', N'Core 5 120U',
  N'16GB-3200- 2/2 slot', N'500GB SSD - SK Hynix', N'Yes',
  NULL, N'Quality Management (QM)', N'Nguyễn Thị Thu Thảo',
  N'Jun-21', N'May-24', N'Apr-26',
  N'Apr-27', N'Đã hết hạn', N'Đã được gia hạn',
  NULL, N'máy tính sử dụng bình thường',
  NULL, 0, NULL,
  N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, SerialNumber, OS, CPU, RAM, HardDisk,
  RansomwareProtection, OutlookStorage, PhongBan, Owner, ThoiGianDauTu, HSDBanDau,
  ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan, PhanHoiNguoiDung,
  DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  28, N'Máy tính', N'Laptop',
  N'HP 340S G7 Notebook', N'5CD143H3YB', N'Windows 11', N'Intel Core i3 1005G1',
  N'8GB - 2667 - 2/2 slot', N'500GB SSD', N'Yes',
  N'42GB free of 49.5', N'Application', N'Nguyễn Thị Thảo Duyên',
  N'Nov-21', N'Oct-24', N'May-26',
  N'May-27', N'Đã hết hạn', N'Đã được gia hạn',
  NULL, N'Sử dụng bình thường',
  NULL, 0, NULL,
  N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, SerialNumber, OS, CPU, RAM, HardDisk,
  RansomwareProtection, OutlookStorage, PhongBan, Owner, ThoiGianDauTu, HSDBanDau,
  ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan, PhanHoiNguoiDung,
  DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  29, N'Máy tính', N'Laptop',
  N'DESKTOP-EQ7IHP4', N'SAMA', NULL, N'Intel Pentium G3260',
  N'8 GB', N'256 GB SSD', N'Yes',
  NULL, N'Production', N'Nguyễn Tường Vy',
  N'Jul-18', N'Jun-21', N'Oct-23',
  N'Sep-24', N'Đã hết hạn', N'Đã được gia hạn',
  NULL, N'Máy tính đã hết niên hạn sử dụng nhưng sử dụng bình thường',
  NULL, 0, NULL,
  N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, SerialNumber, OS, CPU, RAM, HardDisk,
  RansomwareProtection, OutlookStorage, PhongBan, Owner, ThoiGianDauTu, HSDBanDau,
  ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan, PhanHoiNguoiDung,
  DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  30, N'Máy tính', N'Laptop',
  N'HP Probook 440 G7 Notebook', N'5CD0128N5G', N'Windows 11', N'Intel Core i5 10210U',
  N'8 GB', N'512 GB SSD', N'Yes',
  NULL, N'HR&IT', N'Nguyễn Xuân Sơn',
  N'May-21', N'Apr-24', N'Oct-23',
  N'Apr-24', N'Đã hết hạn', N'Chưa được gia hạn',
  NULL, N'Sử dụng bình thường',
  NULL, 0, NULL,
  N'Trong niên hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, SerialNumber, OS, CPU, RAM, HardDisk,
  RansomwareProtection, OutlookStorage, PhongBan, Owner, ThoiGianDauTu, HSDBanDau,
  ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan, PhanHoiNguoiDung,
  DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  31, N'Máy tính', N'Laptop',
  N'HP ProBook 440 G7 Notebook PC (6XJ52AV)', N'5CD0190Y5Y', NULL, N'Intel Core i3 10110U',
  N'8 GB', N'256 GB SSD', N'Yes',
  NULL, N'Maintenance Engineer (ME)', N'Phạm Ngọc Thắng',
  N'Jun-22', N'May-25', N'Oct-23',
  N'May-25', N'Đã hết hạn', N'Chưa được gia hạn',
  NULL, N'Sử dụng bình thường',
  NULL, 0, NULL,
  N'Trong niên hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, SerialNumber, OS, CPU, RAM, HardDisk,
  RansomwareProtection, OutlookStorage, PhongBan, Owner, ThoiGianDauTu, HSDBanDau,
  ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan, PhanHoiNguoiDung,
  DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  32, N'Máy tính', N'Laptop',
  N'HP ENVY 13-ay1000 x360 Convertible PC', N'CND148BGPR', N'Windows 11', N'AMD Ryzen 7 5800U',
  N'8GB - 3200 - 2/2 SLOT', N'1 TB SSD - SAMSUNG 980', N'Yes',
  N'8.45 gb free of 49.5', N'RnD', N'Phạm Thị Chuyên',
  N'Nov-22', N'Oct-25', N'May-26',
  N'May-27', N'Đã hết hạn', N'Đã được gia hạn',
  NULL, N'Sử dụng bình thường',
  NULL, 0, NULL,
  N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, SerialNumber, OS, CPU, RAM, HardDisk,
  RansomwareProtection, OutlookStorage, PhongBan, Owner, ThoiGianDauTu, HSDBanDau,
  ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan, PhanHoiNguoiDung,
  DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  33, N'Máy tính', N'Desktop',
  N'DESKTOP-GQA9U7Q', N'SAMA', N'Windows 10', N'Intel Pentium CPU G3260',
  N'8GB - 1400 - 1/4 slot', N'500GB SSD - SAMSUNG 870EVO', N'Yes',
  N'43gb free / 49.5 free', N'Application', N'Phạm Thị Ngọc',
  N'May-23', N'Apr-26', N'May-26',
  N'May-27', N'Đã hết hạn', N'Đã được gia hạn',
  NULL, N'Máy sử dụng bình thường',
  NULL, 0, NULL,
  N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, SerialNumber, OS, CPU, RAM, HardDisk,
  RansomwareProtection, OutlookStorage, PhongBan, Owner, ThoiGianDauTu, HSDBanDau,
  ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan, PhanHoiNguoiDung,
  DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  34, N'Máy tính', N'Laptop',
  N'HP Envy Laptop 13 ba1000', N'CND2023PRN', N'Windows 11', N'11th Gen Intel Core i5 1135G7',
  N'8GB - 3200 - 2/2 SLOT', N'240GB - SSD Kioxia', N'Yes',
  N'34.6 gb free of 49.5', N'RnD', N'Phạm Thị Ngọc Trang',
  N'Nov-22', N'Oct-25', N'May-26',
  N'May-27', N'Đã hết hạn', N'Đã được gia hạn',
  NULL, N'Máy sử dụng bình thường',
  NULL, 0, NULL,
  N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, SerialNumber, OS, CPU, RAM, HardDisk,
  RansomwareProtection, OutlookStorage, PhongBan, Owner, ThoiGianDauTu, HSDBanDau,
  ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan, PhanHoiNguoiDung,
  DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  35, N'Máy tính', N'Laptop',
  N'HP 340S G7 Notebook', N'5CD0466SVN', N'Windows 11', N'Intel Core i3 1005G1',
  N'8GB - 3200 - 2/2 SLOT', N'240 GB SSD', N'Yes',
  N'32.9 gb free of 49.5 gb', N'RnD', N'Phạm Thị Vân Trang',
  N'Nov-21', N'Oct-24', N'May-26',
  N'May-27', N'Đã hết hạn', N'Đã được gia hạn',
  NULL, N'Sử dụng bình thường',
  NULL, 0, NULL,
  N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, SerialNumber, OS, CPU, RAM, HardDisk,
  RansomwareProtection, OutlookStorage, PhongBan, Owner, ThoiGianDauTu, HSDBanDau,
  ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan, PhanHoiNguoiDung,
  DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  36, N'Máy tính', N'Laptop',
  N'Dell Vostro 3670', N'45B7HY2', NULL, N'Intel Core i7 9700',
  N'8 GB', N'1 TB HDD', N'Yes',
  NULL, N'Production', N'Phòng cân - Nguyên liệu',
  N'Oct-20', N'Oct-23', N'Oct-23',
  N'Sep-24', N'Đã hết hạn', N'Đã được gia hạn',
  NULL, N'Máy tính đã hết niên hạn sử dụng nhưng sử dụng bình thường',
  NULL, 0, NULL,
  N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, SerialNumber, OS, CPU, RAM, HardDisk,
  RansomwareProtection, OutlookStorage, PhongBan, Owner, ThoiGianDauTu, HSDBanDau,
  ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan, PhanHoiNguoiDung,
  DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  37, N'Máy tính', N'Laptop',
  N'Dell Vostro 3670', N'9HQP6Z2', NULL, N'Intel Core i5 9400',
  N'8 GB', N'1 TB HDD', N'Yes',
  NULL, N'Production', N'Phòng Cân - Pha Loãng',
  N'Oct-20', N'Oct-23', N'Oct-23',
  N'Sep-24', N'Đã hết hạn', N'Đã được gia hạn',
  NULL, N'Máy tính đã hết niên hạn sử dụng nhưng sử dụng bình thường',
  NULL, 0, NULL,
  N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, SerialNumber, OS, CPU, RAM, HardDisk,
  RansomwareProtection, OutlookStorage, PhongBan, Owner, ThoiGianDauTu, HSDBanDau,
  ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan, PhanHoiNguoiDung,
  DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  38, N'Máy tính', N'Laptop',
  N'DESKTOP-CCDC', N'SAMA', N'Windows 10', N'Intel(R) Pentium(R) CPU G4400',
  N'8 GB', N'256 GB SSD', N'Yes',
  NULL, N'Production', N'Phòng CCDC',
  N'Apr-17', N'Mar-20', N'Oct-23',
  N'Sep-24', N'Đã hết hạn', N'Đã được gia hạn',
  NULL, N'Chưa đáp ứng đủ nhu cầu làm việc do RAM quá thấp',
  N'Cần nâng cấp RAM', 0, N'Đã nâng cấp RAM vào 03/10/2023',
  N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, SerialNumber, OS, CPU, RAM, HardDisk,
  RansomwareProtection, OutlookStorage, PhongBan, Owner, ThoiGianDauTu, HSDBanDau,
  ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan, PhanHoiNguoiDung,
  DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  39, N'Máy tính', N'Laptop',
  N'DESKTOP-VEOFTOV', N'SAMA', NULL, N'Intel Pentium G3250',
  N'8 GB', N'256 GB SSD', N'Yes',
  NULL, N'Production', N'Phòng Trưởng Ca',
  N'Jul-22', N'Jun-25', N'Oct-23',
  N'Sep-24', N'Đã hết hạn', N'Đã được gia hạn',
  NULL, N'Máy tính xử lý file chậm, thường xuyên treo máy vào các ca làm việc',
  N'Cần nâng cấp RAM', 0, N'Đã nâng cấp RAM vào 28/08/2023',
  N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, SerialNumber, OS, CPU, RAM, HardDisk,
  RansomwareProtection, OutlookStorage, PhongBan, Owner, ThoiGianDauTu, HSDBanDau,
  ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan, PhanHoiNguoiDung,
  DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  40, N'Máy tính', N'Desktop',
  N'Dell Vostro', NULL, N'Windows 11', N'Intel Pentium G5420',
  N'8GB-BUS2400-2/2slot', N'256GB SSD-Lexar', N'Yes',
  NULL, N'Maintenance Engineer (ME)', N'Phùng Thanh Nhiều',
  N'May-19', N'Apr-22', N'Apr-26',
  N'Apr-27', N'Đã hết hạn', N'Đã được gia hạn',
  NULL, N'Máy tính sử dụng bình thường, màn hình bị xuất hiện sọc ngang không ảnh hưởng công việc',
  NULL, 0, NULL,
  N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, SerialNumber, OS, CPU, RAM, HardDisk,
  RansomwareProtection, OutlookStorage, PhongBan, Owner, ThoiGianDauTu, HSDBanDau,
  ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan, PhanHoiNguoiDung,
  DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  41, N'Máy tính', N'Laptop',
  N'HP Probook 450 G5', N'5CD823C7B8', N'Windows 11', N'Intel Core i5 8th',
  N'4GB-bus 2400-1/2slot', N'500GB SSD', N'Yes',
  NULL, N'Maintenance Engineer (ME)', N'Lý Trường Sơn',
  NULL, N'Dec-02', N'Apr-26',
  N'Dec-02', N'Đã hết hạn', N'Chưa được gia hạn',
  NULL, N'Máy tính giật lag do thiếu Ram',
  N'Cần nâng cấp RAM', 0, NULL,
  NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, SerialNumber, OS, CPU, RAM, HardDisk,
  RansomwareProtection, OutlookStorage, PhongBan, Owner, ThoiGianDauTu, HSDBanDau,
  ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan, PhanHoiNguoiDung,
  DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  42, N'Máy tính', N'Laptop',
  N'Dell Vostro 3671', N'24K2R33', NULL, N'Intel Core i7 9700',
  N'16GB', N'1 TB HDD', N'Yes',
  NULL, N'Flavor', N'RnD',
  N'Jul-21', N'Jun-24', N'Oct-23',
  N'Jun-24', N'Đã hết hạn', N'Chưa được gia hạn',
  NULL, N'Sử dụng bình thường',
  NULL, 0, NULL,
  N'Trong niên hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, SerialNumber, OS, CPU, RAM, HardDisk,
  RansomwareProtection, OutlookStorage, PhongBan, Owner, ThoiGianDauTu, HSDBanDau,
  ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan, PhanHoiNguoiDung,
  DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  43, N'Máy tính', N'Desktop',
  N'Dell Vostro 3681', N'6WB50G3', N'Windows 11', N'Intel Core i3 10100',
  N'8GB - 2666 - 2/2 slot', N'500GB SSD - SAMSUNG 860EVO', N'Yes',
  NULL, N'WH & Planning', N'Thượng Đình Phong',
  N'Nov-22', N'Oct-25', N'Apr-26',
  N'Apr-27', N'Đã hết hạn', N'Đã được gia hạn',
  NULL, N'Sử dụng giật lag khi thao tác với file excel',
  N'Nâng cấp Ram', 0, NULL,
  N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, SerialNumber, OS, CPU, RAM, HardDisk,
  RansomwareProtection, OutlookStorage, PhongBan, Owner, ThoiGianDauTu, HSDBanDau,
  ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan, PhanHoiNguoiDung,
  DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  44, N'Máy tính', N'Laptop',
  N'HP ProBook 450 G6 Notebook PC', N'5CD922776X', NULL, N'Intel Core i5 8th',
  N'8 GB', N'128 GB SSD + 1 TB HDD', N'Yes',
  NULL, N'HR&IT', N'Trần Hải Nhân',
  N'Feb-19', N'Jan-22', N'Oct-23',
  N'Sep-24', N'Đã hết hạn', N'Đã được gia hạn',
  NULL, N'Máy tính đã hết niên hạn sử dụng nhưng sử dụng bình thường',
  NULL, 0, NULL,
  N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, SerialNumber, OS, CPU, RAM, HardDisk,
  RansomwareProtection, OutlookStorage, PhongBan, Owner, ThoiGianDauTu, HSDBanDau,
  ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan, PhanHoiNguoiDung,
  DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  45, N'Máy tính', N'Laptop',
  N'HP ProBook 440 G5 Notebook', N'5CD822515W', N'Windows 11', N'Intel Core i5 8250U',
  N'8 GB', N'256 GB SSD + 500 GB HDD', N'Yes',
  N'39.5GB free of 49.5', N'Flavor', N'Trần Lực',
  N'Jun-18', N'May-21', N'May-26',
  N'May-27', N'Đã hết hạn', N'Đã được gia hạn',
  NULL, N'Máy tính sử dụng bình thường',
  NULL, 0, NULL,
  N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, SerialNumber, OS, CPU, RAM, HardDisk,
  RansomwareProtection, OutlookStorage, PhongBan, Owner, ThoiGianDauTu, HSDBanDau,
  ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan, PhanHoiNguoiDung,
  DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  46, N'Máy tính', N'Laptop',
  N'HP ENVY x360 13.3', N'CND2452QPX', NULL, N'12th Gen Intel Core i7-1250U',
  N'8 GB', N'512 GB SSD', N'Yes',
  NULL, N'BOM', N'Trần Minh Hải',
  N'Jun-23', N'May-26', N'Oct-23',
  N'May-26', N'Đã hết hạn', N'Chưa được gia hạn',
  NULL, N'Sử dụng bình thường',
  NULL, 0, NULL,
  N'Trong niên hạn', N'Disabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, SerialNumber, OS, CPU, RAM, HardDisk,
  RansomwareProtection, OutlookStorage, PhongBan, Owner, ThoiGianDauTu, HSDBanDau,
  ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan, PhanHoiNguoiDung,
  DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  47, N'Máy tính', N'Laptop',
  N'HP 240 G8 Notebook', N'5CG147C3RG', NULL, N'11th Intel Core i5 1135G7',
  N'8 GB', N'512 GB SSD', N'Yes',
  NULL, N'Ingredient', N'Trần Thị Cẩm Oanh',
  N'May-22', N'Apr-25', N'Oct-23',
  N'Apr-25', N'Đã hết hạn', N'Chưa được gia hạn',
  NULL, N'Sử dụng bình thường',
  NULL, 0, NULL,
  N'Trong niên hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, SerialNumber, OS, CPU, RAM, HardDisk,
  RansomwareProtection, OutlookStorage, PhongBan, Owner, ThoiGianDauTu, HSDBanDau,
  ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan, PhanHoiNguoiDung,
  DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  48, N'Máy tính', N'Laptop',
  N'HP Probook 440 G7 Notebook', N'5CD0378CDL', NULL, N'Intel Core i5 10210U',
  N'8 GB', N'500 GB SSD', N'Yes',
  NULL, N'HR&IT', N'Trần Thị Phương Thanh',
  N'May-21', N'Apr-24', N'Oct-23',
  N'Sep-24', N'Đã hết hạn', N'Đã được gia hạn',
  NULL, N'Trong lúc sử dụng bị nóng máy và đột ngột tắt thường xuyên Sau khi kiểm tra do máy tính bị lỗi nguồn Adapter mainboard và dây sạc bị hư',
  N'Đã sửa và hiện tại không gặp vấn đề gì nhưng đề xuất thay thế cho năm 2024', 0, N'Đã sửa ngày 27/10/2023',
  N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, SerialNumber, OS, CPU, RAM, HardDisk,
  RansomwareProtection, OutlookStorage, PhongBan, Owner, ThoiGianDauTu, HSDBanDau,
  ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan, PhanHoiNguoiDung,
  DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  49, N'Máy tính', N'Laptop',
  N'HP Probook 440 G3 Notebook', N'5CD62365R4', N'Windows 10', N'Intel Core i5 6200U',
  N'8GB - 2133 - 2/2 SLOT', N'500 GB HDD - WDC', N'Yes',
  N'25.3 gb free of 49.5', N'RnD', N'Trần Thị Thọ',
  N'Jun-16', N'Jun-19', N'May-26',
  N'Jun-19', N'Đã hết hạn', N'Chưa được gia hạn',
  NULL, N'Máy tính đã hết niên hạn sử dụng và sử dụng bình thường nhưng còn sử dụng ổ cứng HDD',
  N'Cần nâng cấp ổ cứng SSD', 0, NULL,
  N'Cần nâng cấp', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, SerialNumber, OS, CPU, RAM, HardDisk,
  RansomwareProtection, OutlookStorage, PhongBan, Owner, ThoiGianDauTu, HSDBanDau,
  ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan, PhanHoiNguoiDung,
  DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  50, N'Máy tính', N'Laptop',
  N'Dell G15 5515 Ryzen Edition', N'2M99ZJ3', N'Windows 11', N'AMD Ryzen 7 5800H',
  N'16 GB - 3200 - 2/2 slot', N'512 GB SSD KDI', N'Yes',
  N'40GB free of 49.5', N'Project', N'Trần Tiến Din',
  N'Oct-21', N'Sep-24', N'Apr-26',
  N'Apr-27', N'Đã hết hạn', N'Đã được gia hạn',
  NULL, N'Sử dụng bình thường',
  NULL, 0, NULL,
  N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, SerialNumber, OS, CPU, RAM, HardDisk,
  RansomwareProtection, OutlookStorage, PhongBan, Owner, ThoiGianDauTu, HSDBanDau,
  ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan, PhanHoiNguoiDung,
  DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  51, N'Máy tính', N'Laptop',
  N'HP ProBook 440 G6 Notebook PC', N'5CD9312KV7', NULL, N'Intel Core i5 8265U',
  N'8 GB', N'256 GB SSD + 1TB HDD', N'Yes',
  NULL, N'Production', N'Trần Xuân Thiện',
  N'Sep-18', N'Aug-21', N'Oct-23',
  N'Sep-24', N'Đã hết hạn', N'Đã được gia hạn',
  NULL, N'Máy tính đã hết niên hạn sử dụng nhưng sử dụng bình thường',
  NULL, 0, NULL,
  N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, SerialNumber, OS, CPU, RAM, HardDisk,
  RansomwareProtection, OutlookStorage, PhongBan, Owner, ThoiGianDauTu, HSDBanDau,
  ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan, PhanHoiNguoiDung,
  DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  52, N'Máy tính', N'Desktop',
  N'DESKTOP-79EKIAO', N'SAMA', NULL, N'Intel Pentium G3440',
  N'8 GB', N'500 GB HDD', N'Yes',
  NULL, N'Admin Plant', N'Lê Thị Như Mỹ',
  N'Apr-17', N'Mar-20', N'Oct-23',
  N'Sep-24', N'Đã hết hạn', N'Đã được gia hạn',
  NULL, N'Sử dụng bình thường',
  NULL, 0, NULL,
  N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, SerialNumber, OS, CPU, RAM, HardDisk,
  RansomwareProtection, OutlookStorage, PhongBan, Owner, ThoiGianDauTu, HSDBanDau,
  ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan, PhanHoiNguoiDung,
  DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  53, N'Máy tính', N'Desktop',
  N'Lenovo V50t 13IOB G2', N'PC2A6LAG', N'Windows 11', N'Intel Core i3 10105',
  N'8GB -2667-1/2 slot', N'240GB SSD SAMSUNG', N'Yes',
  N'27.9 gb free of 49.4', N'Finance & Accounting (F&A)', N'Trịnh Thu Hằng',
  N'May-22', N'Apr-25', N'May-26',
  N'Apr-25', N'Đã hết hạn', N'Chưa được gia hạn',
  NULL, N'Sử dụng bình thường',
  NULL, 0, NULL,
  N'Trong niên hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, SerialNumber, OS, CPU, RAM, HardDisk,
  RansomwareProtection, OutlookStorage, PhongBan, Owner, ThoiGianDauTu, HSDBanDau,
  ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan, PhanHoiNguoiDung,
  DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  54, N'Máy tính', N'Laptop',
  N'HP ProBook 440 G6 Notebook', N'5CD9105BTZ', N'Windows 11', N'Intel Core i3 8145U',
  N'8GB - 2400 - 1/2 SLOT', N'512 GB SSD', N'Yes',
  N'15.4 free /49.5', N'RnD', N'Trương Lại Thuỳ An',
  N'Jun-20', N'Jun-23', N'May-26',
  N'May-27', N'Đã hết hạn', N'Đã được gia hạn',
  NULL, N'Máy tính đã hết niên hạn sử dụng nhưng sử dụng bình thường',
  NULL, 0, NULL,
  N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, SerialNumber, OS, CPU, RAM, HardDisk,
  RansomwareProtection, OutlookStorage, PhongBan, Owner, ThoiGianDauTu, HSDBanDau,
  ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan, PhanHoiNguoiDung,
  DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  55, N'Máy tính', N'Desktop',
  N'Dell Vostro 3670', N'7VL4WV2', N'Windows 11', N'Inel Pentium Gold G5400',
  N'8GB - 2400 - DDR3 - 2/2 slot', N'500GB SSD - SAMSUNG 870EVO', N'Yes',
  NULL, N'Quality Management (QM)', N'Võ Thị Hương Cont',
  N'Jun-20', N'Jun-23', N'Apr-26',
  N'Apr-27', N'Đã hết hạn', N'Đã được gia hạn',
  NULL, N'Máy sử dụng bình thường',
  NULL, 0, NULL,
  N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, SerialNumber, OS, CPU, RAM, HardDisk,
  RansomwareProtection, OutlookStorage, PhongBan, Owner, ThoiGianDauTu, HSDBanDau,
  ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan, PhanHoiNguoiDung,
  DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  56, N'Máy tính', N'Desktop',
  N'Dell Vostro 3670', N'7WL3WV2', N'Windows 10', N'Intel Pentium CPU G5400',
  N'8GB - 2400 - DDR3 - 2/2 slot', N'500GB SSD - SAMSUNG 870EVO', N'Yes',
  NULL, N'Quality Management (QM)', N'Võ Thị Hương SX',
  N'Oct-17', N'Sep-20', N'May-26',
  N'May-27', N'Đã hết hạn', N'Đã được gia hạn',
  NULL, N'Máy sử dụng bình thường',
  NULL, 0, NULL,
  N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, SerialNumber, OS, CPU, RAM, HardDisk,
  RansomwareProtection, OutlookStorage, PhongBan, Owner, ThoiGianDauTu, HSDBanDau,
  ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan, PhanHoiNguoiDung,
  DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  57, N'Máy tính', N'Desktop',
  N'Dell  Vostro', N'HHS2WV2', N'Windows 11', N'Intel Pentium Gold G5400',
  N'8GB - 2400 - DDR3 - 2/2 slot', N'500GB SSD - SAMSUNG 870EVO', N'Yes',
  NULL, N'Quality Management (QM)', N'Nguyễn Minh Khôi',
  N'Aug-19', N'Jul-22', N'May-26',
  N'May-27', N'Đã hết hạn', N'Đã được gia hạn',
  NULL, N'Máy tính đã hết niên hạn sử dụng nhưng sử dụng bình thường',
  NULL, 0, NULL,
  N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, SerialNumber, OS, CPU, RAM, HardDisk,
  RansomwareProtection, OutlookStorage, PhongBan, Owner, ThoiGianDauTu, HSDBanDau,
  ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan, PhanHoiNguoiDung,
  DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  58, N'Máy tính', N'Laptop',
  N'HP ProBook 440 G6 Notebook PC', N'5CD92274TV', NULL, N'Intel Core i5 8250U',
  N'8 GB', N'256 GB SSD', N'Yes',
  NULL, N'Production', N'Lê Bá Trình',
  N'Jan-20', N'Dec-22', N'Oct-23',
  N'Sep-24', N'Đã hết hạn', N'Đã được gia hạn',
  NULL, N'Máy tính đã hết niên hạn sử dụng nhưng sử dụng bình thường',
  NULL, 0, NULL,
  N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, SerialNumber, OS, CPU, RAM, HardDisk,
  RansomwareProtection, OutlookStorage, PhongBan, Owner, ThoiGianDauTu, HSDBanDau,
  ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan, PhanHoiNguoiDung,
  DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  59, N'Máy tính', N'Laptop',
  N'HP ProBook 440 G6 Notebook PC', N'5CD905798S', NULL, N'Intel Core i5 8250U',
  N'8 GB', N'500 GB SSD', N'Yes',
  NULL, N'Production', N'Nguyễn Thị Hồng Diễm',
  N'May-21', N'Apr-24', N'Oct-23',
  N'Sep-24', N'Đã hết hạn', N'Đã được gia hạn',
  NULL, N'Sử dụng 2 ổ cứng SSD M2 và HDD 2.5 SATA nhưng bị hư 1 ổ SSD chỉ còn sử dụng được HDD mà cũng không đáp ứng được nhu cầu làm việc',
  N'Cần nâng cấp ổ cứng SSD', 0, N'Đã nâng cấp ổ cứng SSD ngày 03/10/2023',
  N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, SerialNumber, OS, CPU, RAM, HardDisk,
  RansomwareProtection, OutlookStorage, PhongBan, Owner, ThoiGianDauTu, HSDBanDau,
  ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan, PhanHoiNguoiDung,
  DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  60, N'Máy tính', N'Laptop',
  N'HP Omnibook  Flip Laptop 14 fp0057TU', N'8CG53240GZ', N'Windows 11', N'Intel Core 5 120U',
  N'16GB - 5200 - 2/2 slot', N'512GB SSD', N'Yes',
  NULL, N'WH & Planning', N'Đoàn Thị Ngọc',
  N'Apr-26', N'Apr-29', NULL,
  N'Apr-29', N'Còn hạn', N'Còn hạn',
  NULL, NULL,
  NULL, 0, NULL,
  NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, SerialNumber, OS, CPU, RAM, HardDisk,
  RansomwareProtection, OutlookStorage, PhongBan, Owner, ThoiGianDauTu, HSDBanDau,
  ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan, PhanHoiNguoiDung,
  DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  61, N'Máy tính', N'Laptop',
  N'HP Probook 440 G7', N'5CD0190YSY', N'Windows 11', N'Intel Core i3 10110U',
  N'8GB -BUS2667- DDR3 - 2/2 slot', N'256GB SSD HP', N'Yes',
  NULL, N'WH & Planning', N'Nguyễn Trường An',
  NULL, N'Dec-02', N'Apr-26',
  N'Apr-27', N'Đã hết hạn', N'Đã được gia hạn',
  NULL, N'Sử dụng bình thường',
  NULL, 0, NULL,
  N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, SerialNumber, OS, CPU, RAM, HardDisk,
  RansomwareProtection, OutlookStorage, PhongBan, Owner, ThoiGianDauTu, HSDBanDau,
  ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan, PhanHoiNguoiDung,
  DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  62, N'Máy tính', N'Desktop',
  N'Desktop Think Centre Neo', NULL, N'Windows 11', N'Intel Core i3 13100',
  N'8GB -3200- DDR4 - 1/2slot', N'256GB SSD SAMSUNG', N'Yes',
  NULL, N'WH & Planning', N'Lê Huỳnh Giang',
  NULL, N'Dec-02', N'Apr-26',
  N'Apr-27', N'Đã hết hạn', N'Đã được gia hạn',
  NULL, N'Sử dụng binh thường',
  NULL, 0, NULL,
  N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, SerialNumber, OS, CPU, RAM, HardDisk,
  RansomwareProtection, OutlookStorage, PhongBan, Owner, ThoiGianDauTu, HSDBanDau,
  ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan, PhanHoiNguoiDung,
  DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  63, N'Máy tính', N'Laptop',
  N'HP Probook 440 G7', N'5CD0128NKZ', N'Windows 11', N'Intel Core i5 10210U',
  N'8GB - 2400 - DDR3 - 2/2 slot', N'512GB SSD', N'Yes',
  NULL, N'Delivery', N'Lê Quang Bình',
  NULL, N'Dec-02', N'Apr-26',
  N'Dec-02', N'Đã hết hạn', N'Chưa được gia hạn',
  NULL, N'Máy lag ở tác vụ bình thường và file excel > 1000 dòng',
  N'Nâng cấp Ram', 0, NULL,
  N'Nâng cấp Ram', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, SerialNumber, OS, CPU, RAM, HardDisk,
  RansomwareProtection, OutlookStorage, PhongBan, Owner, ThoiGianDauTu, HSDBanDau,
  ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan, PhanHoiNguoiDung,
  DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  64, N'Máy tính', N'Desktop',
  N'Dell Vostro', NULL, N'Windows 11', N'Intel Pentium Gold G5420',
  N'8GB - 2400 - DDR3 - 2/2 slot', N'500GB SSD - SAMSUNG 870EVO', N'Yes',
  NULL, N'Quality Management (QM)', N'Nguyễn Quang Liêm',
  NULL, N'Dec-02', N'Apr-26',
  N'Dec-02', N'Đã hết hạn', N'Chưa được gia hạn',
  NULL, N'Đa tác vụ như excel(file nhẹ) và ERP cùng lúc bị lag',
  N'Nâng cấp Ram với Bus cao hơn', 0, NULL,
  N'Nâng cấp Ram', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, SerialNumber, OS, CPU, RAM, HardDisk,
  RansomwareProtection, OutlookStorage, PhongBan, Owner, ThoiGianDauTu, HSDBanDau,
  ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan, PhanHoiNguoiDung,
  DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  65, N'Máy tính', N'Desktop',
  N'Dell Vostro', NULL, N'Windows 11', N'Intel Pentium Gold G5400',
  N'8GB - 2400 - DDR3 - 2/2 slot', N'500GB SSD - SAMSUNG 870EVO', N'Yes',
  NULL, N'Quality Management (QM)', N'Nguyễn Quốc Cường',
  NULL, N'Dec-02', N'Apr-26',
  N'Dec-02', N'Đã hết hạn', N'Chưa được gia hạn',
  NULL, N'Sử dụng bình thường',
  NULL, 0, NULL,
  NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, SerialNumber, OS, CPU, RAM, HardDisk,
  RansomwareProtection, OutlookStorage, PhongBan, Owner, ThoiGianDauTu, HSDBanDau,
  ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan, PhanHoiNguoiDung,
  DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  66, N'Máy tính', N'Desktop',
  N'Dell Vostro', NULL, N'Windows 11', N'Intel Pentium Gold G5400',
  N'8GB - 2400 - DDR3 - 2/2 slot', N'500GB SSD - SAMSUNG 870EVO', N'Yes',
  NULL, N'Quality Management (QM)', N'Huỳnh Nguyễn Tấn Thành',
  NULL, N'Dec-02', N'Apr-26',
  N'Dec-02', N'Đã hết hạn', N'Chưa được gia hạn',
  NULL, N'Sử dụng bình thường',
  NULL, 0, NULL,
  NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, SerialNumber, OS, CPU, RAM, HardDisk,
  RansomwareProtection, OutlookStorage, PhongBan, Owner, ThoiGianDauTu, HSDBanDau,
  ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan, PhanHoiNguoiDung,
  DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  67, N'Máy tính', N'Laptop',
  N'HP ProBook 440 G6 Notebook', N'5CD905798S', N'Windows 11', N'Intel Core i5 8265U',
  N'8GB - 2400 - DDR3 - 2/2 slot', N'500GB SSD - SAMSUNG 870EVO', N'Yes',
  NULL, N'Production', N'Đào Minh Quý',
  NULL, N'Dec-02', N'Apr-26',
  N'Apr-27', N'Đã hết hạn', N'Đã được gia hạn',
  NULL, N'Sử dụng bình thường , màn bị sức ron màn hình(một phần nhỏ ở cạnh)',
  N'Cần nâng cấp Windows 11', 0, NULL,
  N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, SerialNumber, OS, CPU, RAM, HardDisk,
  RansomwareProtection, OutlookStorage, PhongBan, Owner, ThoiGianDauTu, HSDBanDau,
  ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan, PhanHoiNguoiDung,
  DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  68, N'Máy tính', N'Laptop',
  N'HP ProBook 440 G5 Notebook PC', N'5CD7486JZL', N'Windows 11', N'Intel Core i5 8250U',
  N'8GB - 2400 - DDR3 - 1/2 slot', N'500GB SSD - WDC', N'Yes',
  NULL, N'Production', N'Production Leader',
  NULL, N'Dec-02', N'Apr-26',
  N'Dec-02', N'Đã hết hạn', N'Chưa được gia hạn',
  NULL, N'Sử dụng binh thường',
  NULL, 0, NULL,
  NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, SerialNumber, OS, CPU, RAM, HardDisk,
  RansomwareProtection, OutlookStorage, PhongBan, Owner, ThoiGianDauTu, HSDBanDau,
  ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan, PhanHoiNguoiDung,
  DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  69, N'Máy tính', N'Laptop',
  N'HP ProBook 440 G6 Notebook', N'5CD92274TV', N'Windows 11', N'Intel Core i5 8265U',
  N'8GB - 2400 - DDR3 - 2/2 slot', N'500GB SSD - WDC', N'Yes',
  NULL, N'Production', N'Production Leader',
  NULL, N'Dec-02', N'Apr-26',
  N'Apr-27', N'Đã hết hạn', N'Đã được gia hạn',
  NULL, N'Máy sử dụng bình thường , cần lên Win11',
  N'Cần nâng cấp Windows 11', 0, NULL,
  N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, SerialNumber, OS, CPU, RAM, HardDisk,
  RansomwareProtection, OutlookStorage, PhongBan, Owner, ThoiGianDauTu, HSDBanDau,
  ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan, PhanHoiNguoiDung,
  DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  70, N'Máy tính', N'Desktop',
  N'DESKTOP PV Computer', NULL, N'Windows 10', N'Intel Pentium CPU G3260',
  N'8GB - 1400 - 1/4 slot', N'250GB SSD - SAMSUNG 860 EVO', N'Yes',
  NULL, N'WH & Planning', N'Nguyễn Thị Ngọc Tuyết',
  NULL, N'Dec-02', N'Apr-26',
  N'Dec-02', N'Đã hết hạn', N'Chưa được gia hạn',
  NULL, N'Máy sử dụng giật lag khi mở file excel',
  NULL, 0, NULL,
  NULL, N'Disabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, SerialNumber, OS, CPU, RAM, HardDisk,
  RansomwareProtection, OutlookStorage, PhongBan, Owner, ThoiGianDauTu, HSDBanDau,
  ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan, PhanHoiNguoiDung,
  DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  71, N'Máy tính', N'Laptop',
  N'HP ProBook 440 G5 Notebook PC', N'5CD7486JZL', N'Windows 11', N'Intel Core i7 8550U',
  N'12GB - 2400 - 2/2 slot', N'250GB SSD - WDC', N'Yes',
  N'46.5 GB free', N'HR&IT', N'Nguyễn Hoàng Khánh Duy',
  NULL, N'Dec-02', N'Apr-26',
  N'Apr-27', N'Đã hết hạn', N'Đã được gia hạn',
  NULL, N'Máy sử dụng bình thường',
  NULL, 0, NULL,
  N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, SerialNumber, OS, CPU, RAM, HardDisk,
  RansomwareProtection, OutlookStorage, PhongBan, Owner, ThoiGianDauTu, HSDBanDau,
  ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan, PhanHoiNguoiDung,
  DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  72, N'Máy tính', N'Laptop',
  N'HP 340 G7', N'5CD1389YPD', N'Windows 11', N'Intel Core i3 1005G1',
  N'8GB - 2667 - 2/2 slot', N'250GB SSD - WDC', N'Yes',
  N'41.7 Gb free', N'Commnercial', N'Nguyễn Thị Lan Anh',
  NULL, N'Dec-02', N'Apr-26',
  N'Apr-27', N'Đã hết hạn', N'Đã được gia hạn',
  NULL, N'Máy sử dụng bình thường',
  NULL, 0, NULL,
  N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, SerialNumber, OS, CPU, RAM, HardDisk,
  RansomwareProtection, OutlookStorage, PhongBan, Owner, ThoiGianDauTu, HSDBanDau,
  ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan, PhanHoiNguoiDung,
  DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  73, N'Máy tính', N'Laptop',
  N'HP 340 G7', N'5CD13681KL', N'Windows 11', N'Intel Core i3 1005G1',
  N'8GB - 2667 - 2/2 slot', N'256 GB SSD Kioxai', N'Yes',
  NULL, N'Commnercial', N'Nguyễn Ngọc Anh Thư',
  NULL, N'Dec-02', N'Apr-26',
  N'Apr-27', N'Đã hết hạn', N'Đã được gia hạn',
  NULL, N'Sử dụng bình thường',
  NULL, 0, NULL,
  N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, SerialNumber, OS, CPU, RAM, HardDisk,
  RansomwareProtection, OutlookStorage, PhongBan, Owner, ThoiGianDauTu, HSDBanDau,
  ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan, PhanHoiNguoiDung,
  DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  74, N'Máy tính', N'Laptop',
  N'HP 240 G8', N'5CG147C3RG', N'Windows 11', N'Intel Core i5-1135G7',
  N'8GB - 2667 - 1/2 slot', N'500GB SSD', N'Yes',
  NULL, N'Commnercial', N'Huỳnh Nguyễn Hồng Hạnh',
  NULL, N'Dec-02', N'Apr-26',
  N'Apr-27', N'Đã hết hạn', N'Đã được gia hạn',
  NULL, N'Sử dụng bình thường',
  NULL, 0, NULL,
  N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, SerialNumber, OS, CPU, RAM, HardDisk,
  RansomwareProtection, OutlookStorage, PhongBan, Owner, ThoiGianDauTu, HSDBanDau,
  ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan, PhanHoiNguoiDung,
  DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  75, N'Máy tính', N'Laptop',
  N'HP 340s G7', N'5CD1389YBG', N'Windows 11', N'Intel Core i3-1005G1',
  N'8GB - 2667 - 2/2 slot', N'500GB SSD SK Hynix', N'Yes',
  NULL, N'Commnercial', N'Mai Thị Thảo',
  NULL, N'Dec-02', N'Apr-26',
  N'Apr-27', N'Đã hết hạn', N'Đã được gia hạn',
  NULL, N'Sử dụng bình thường',
  NULL, 0, NULL,
  N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, SerialNumber, OS, CPU, RAM, HardDisk,
  RansomwareProtection, OutlookStorage, PhongBan, Owner, ThoiGianDauTu, HSDBanDau,
  ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan, PhanHoiNguoiDung,
  DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  76, N'Máy tính', N'Laptop',
  N'HP Probook 440 G7', N'5CD0190WQ5', N'Windows 11', N'Intel Core i3-1005G1',
  N'8GB - 2667 - 2/2 slot', N'250GB SSD - WDC', N'Yes',
  N'41.7 Gb free', N'Commnercial', N'Nguyễn Thị Ngọc Khuê',
  NULL, N'Dec-02', N'Apr-26',
  N'Apr-27', N'Đã hết hạn', N'Đã được gia hạn',
  NULL, N'Sử dụng bình thường',
  NULL, 0, NULL,
  N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, SerialNumber, OS, CPU, RAM, HardDisk,
  RansomwareProtection, OutlookStorage, PhongBan, Owner, ThoiGianDauTu, HSDBanDau,
  ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan, PhanHoiNguoiDung,
  DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  77, N'Máy tính', N'Laptop',
  N'HP 240 G8', N'5CG20413T4', N'Windows 11', N'Intel Core i5-1135G7',
  N'8GB - 3200 - 1/2 slot', N'500GB SSD - Intel', N'Yes',
  NULL, N'Commnercial', N'Võ Ngọc Hà',
  NULL, N'Dec-02', N'Apr-26',
  N'Apr-27', N'Đã hết hạn', N'Đã được gia hạn',
  NULL, N'Sử dụng bình thường',
  NULL, 0, NULL,
  N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, SerialNumber, OS, CPU, RAM, HardDisk,
  RansomwareProtection, OutlookStorage, PhongBan, Owner, ThoiGianDauTu, HSDBanDau,
  ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan, PhanHoiNguoiDung,
  DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  78, N'Máy tính', N'Laptop',
  N'HP Omnibook  Flip Laptop 14 fp0057TU', N'8CG5513YS8', N'Windows 11', N'Intel Core i5 120U',
  N'16GB - 5200 - 2/2 slot', N'500GB SSD - SK Hynix', N'Yes',
  NULL, N'BOM', N'Lê Đức Huy',
  NULL, N'Dec-02', N'Apr-26',
  N'Apr-27', N'Đã hết hạn', N'Đã được gia hạn',
  NULL, N'Sử dụng bình thường',
  NULL, 0, NULL,
  N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, SerialNumber, OS, CPU, RAM, HardDisk,
  RansomwareProtection, OutlookStorage, PhongBan, Owner, ThoiGianDauTu, HSDBanDau,
  ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan, PhanHoiNguoiDung,
  DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  79, N'Máy tính', N'Laptop',
  N'HP 340s G7', N'5CD2106VMK', N'Windows 11', N'Intel Core i5-1035G1',
  N'8GB-3200-1/2 slot', N'240GB SSD - Samsung', N'Yes',
  NULL, N'Commnercial', N'Bùi Hoàng Hà',
  NULL, N'Dec-02', N'Apr-26',
  N'Apr-27', N'Đã hết hạn', N'Đã được gia hạn',
  NULL, N'Sử dụng bình thường',
  NULL, 0, NULL,
  N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, SerialNumber, OS, CPU, RAM, HardDisk,
  RansomwareProtection, OutlookStorage, PhongBan, Owner, ThoiGianDauTu, HSDBanDau,
  ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan, PhanHoiNguoiDung,
  DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  80, N'Máy tính', N'Laptop',
  N'HP 340s G7', N'5CD2106VMK', N'Windows 11', N'Intel Core i5-1035G1',
  N'8GB-2400-1/2slot', N'240GB SSD - KIOXIA', N'Yes',
  NULL, N'Commnercial', N'Trần Ngọc Tấn',
  NULL, N'Dec-02', N'Apr-26',
  N'Apr-27', N'Đã hết hạn', N'Đã được gia hạn',
  NULL, N'Sử dụng bình thường',
  NULL, 0, NULL,
  N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, SerialNumber, OS, CPU, RAM, HardDisk,
  RansomwareProtection, OutlookStorage, PhongBan, Owner, ThoiGianDauTu, HSDBanDau,
  ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan, PhanHoiNguoiDung,
  DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  81, N'Máy tính', N'Laptop',
  N'HP Probook 440 G6', N'5YM63PA#UUF', N'Windows 11', N'Intel Core i3-8145U',
  N'8GB-2400-2/2slot', N'240GB SSD - WDC', N'Yes',
  NULL, N'HR&IT', N'Lâm Gia Hào',
  NULL, N'Dec-02', N'Apr-26',
  N'Apr-27', N'Đã hết hạn', N'Đã được gia hạn',
  NULL, N'Máy cấp cho người mới',
  NULL, 0, NULL,
  N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, SerialNumber, OS, CPU, RAM, HardDisk,
  RansomwareProtection, OutlookStorage, PhongBan, Owner, ThoiGianDauTu, HSDBanDau,
  ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan, PhanHoiNguoiDung,
  DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  82, N'Máy tính', N'Desktop',
  NULL, NULL, N'Windows 10', N'Intel Pentium Gold G5420',
  N'8GB-2133-2/2slot', N'500GB SSD - WDC', N'Yes',
  NULL, N'Phòng cân', N'Phòng cân',
  NULL, N'Dec-02', N'May-26',
  N'May-27', N'Đã hết hạn', N'Đã được gia hạn',
  NULL, N'Máy sử dụng bình thường',
  NULL, 0, NULL,
  N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, SerialNumber, OS, CPU, RAM, HardDisk,
  RansomwareProtection, OutlookStorage, PhongBan, Owner, ThoiGianDauTu, HSDBanDau,
  ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan, PhanHoiNguoiDung,
  DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  83, N'Máy tính', N'Desktop',
  N'Lenovo', N'PC1N4E1L', N'Windows 10', N'Intel Core i3-10100',
  N'8GB - 2133 -1/2 slot', N'240GB - SSD SAMSUNG', N'Yes',
  NULL, N'Quality Management (QM)', N'Nguyễn Thị Lan',
  NULL, N'Dec-02', N'May-26',
  N'May-27', N'Đã hết hạn', N'Đã được gia hạn',
  NULL, N'Máy sử dụng bình thường',
  NULL, 0, NULL,
  N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, SerialNumber, OS, CPU, RAM, HardDisk,
  RansomwareProtection, OutlookStorage, PhongBan, Owner, ThoiGianDauTu, HSDBanDau,
  ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan, PhanHoiNguoiDung,
  DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  84, N'Máy tính', N'Laptop',
  N'HP OMINIBOOK X FLIP 14', N'8CG5313FLX', N'Windows 11', N'Intel Core Ultra 7 258v',
  N'32GB - 8533- 2/2 SLOT', N'500GB SSD - SAMSUNG', N'Yes',
  N'46.8 free of 49.5', N'BOM', N'Yuya Hamasaki',
  NULL, N'Dec-02', N'May-26',
  N'May-27', N'Đã hết hạn', N'Đã được gia hạn',
  NULL, N'Máy sử dụng bình thường',
  NULL, 0, NULL,
  N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, SerialNumber, OS, CPU, RAM, HardDisk,
  RansomwareProtection, OutlookStorage, PhongBan, Owner, ThoiGianDauTu, HSDBanDau,
  ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan, PhanHoiNguoiDung,
  DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  85, N'Máy tính', N'Desktop',
  N'Dell Vostro 3670', N'6C4B0T2', N'Windows 11', N'Intel Pentium Gold G5400',
  N'8GB - 2400 - 1/2 SLOT', N'500GB SSD', N'Yes',
  N'42.5gb free of 49.5', N'Application', N'Nguyễn Thị Minh Thùy',
  NULL, N'Dec-02', N'May-26',
  N'May-27', N'Đã hết hạn', N'Đã được gia hạn',
  NULL, N'Ram máy chỉ có 4gb',
  N'Cần nâng cấp ram', 0, NULL,
  N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, SerialNumber, OS, CPU, RAM, HardDisk,
  RansomwareProtection, OutlookStorage, PhongBan, Owner, ThoiGianDauTu, HSDBanDau,
  ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan, PhanHoiNguoiDung,
  DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  86, N'Máy tính', N'Desktop',
  N'SAMA', NULL, N'Windows 10', N'INTEL PENTIUM G3440',
  N'8GB - DDR3 - 1600 - 1/4 SLOT', N'500GB SSD - SAMSUNG 870EVO', N'Yes',
  N'47.7 free of 49.5 gb', N'Application', N'Nguyễn Ngọc Bảo Trân',
  NULL, N'Dec-02', N'May-26',
  N'May-27', N'Đã hết hạn', N'Đã được gia hạn',
  NULL, N'Máy sử dụng bình thường',
  N'Cần nâng cấp lên Windows 11', 0, NULL,
  N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, SerialNumber, OS, CPU, RAM, HardDisk,
  RansomwareProtection, OutlookStorage, PhongBan, Owner, ThoiGianDauTu, HSDBanDau,
  ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan, PhanHoiNguoiDung,
  DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  87, N'Máy tính', N'Desktop',
  N'Dell Vostro 3670', NULL, N'Windows 11', N'Intel pentium gold g5420',
  N'8GB - 2400 - 1/2 SLOT', N'500GB SSD - SAMSUNG 870EVO', N'Yes',
  N'47.6gb free of 49.5', N'Application', N'Huỳnh Ngọc Mạnh',
  NULL, N'Dec-02', N'May-26',
  N'May-27', N'Đã hết hạn', N'Đã được gia hạn',
  NULL, N'Máy sử dụng bình thường',
  NULL, 0, NULL,
  N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, SerialNumber, OS, CPU, RAM, HardDisk,
  RansomwareProtection, OutlookStorage, PhongBan, Owner, ThoiGianDauTu, HSDBanDau,
  ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan, PhanHoiNguoiDung,
  DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  88, N'Máy tính', N'Desktop',
  N'Lenovo', N'PC1AXXYL', N'Windows 11', N'Intel Pentium Gold G5420',
  N'8GB - 2400 - 2/2 SLOT', N'240GB SSD SATA - Solid State', N'Yes',
  N'45.1gb free of 49.5', N'Application', N'Phan Thị Thúy',
  NULL, N'Dec-02', N'May-26',
  N'May-27', N'Đã hết hạn', N'Đã được gia hạn',
  NULL, N'Máy tính sử dụng bình thường',
  NULL, 0, NULL,
  N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, SerialNumber, OS, CPU, RAM, HardDisk,
  RansomwareProtection, OutlookStorage, PhongBan, Owner, ThoiGianDauTu, HSDBanDau,
  ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan, PhanHoiNguoiDung,
  DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  89, N'Máy tính', N'Desktop',
  N'Dell Vostro 3671', NULL, N'Windows 11', N'Intel Core i5 9400',
  N'8GB - 2666- 1/2 SLOT', N'1TB HDD - WDC', N'Yes',
  N'41.7gb free of 49.5', N'RnD', N'Huỳnh Thị Kim',
  NULL, N'Dec-02', N'May-26',
  N'Dec-02', N'Đã hết hạn', N'Chưa được gia hạn',
  NULL, N'Máy tính sử dụng bình thường nhưng ổ cứng là HDD cần nâng cấp lên ổ SSD',
  NULL, 0, NULL,
  N'Cần nâng cấp SSD', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, SerialNumber, OS, CPU, RAM, HardDisk,
  RansomwareProtection, OutlookStorage, PhongBan, Owner, ThoiGianDauTu, HSDBanDau,
  ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan, PhanHoiNguoiDung,
  DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  90, N'Máy tính', N'Laptop',
  N'Dell Vostro 3671', NULL, N'Windows 11', N'Intel Core i5 9700',
  N'16GB - 2666- 2/2 SLOT', N'1TB HDD', N'Yes',
  N'43.7 gb free of 49.5', N'RnD', N'Trần Thị Cẩm Nhung',
  NULL, N'Dec-02', N'May-26',
  N'Dec-02', N'Đã hết hạn', N'Chưa được gia hạn',
  NULL, N'Máy tính sử dụng bình thường nhưng ổ cứng là HDD cần nâng cấp lên ổ SSD',
  NULL, 0, NULL,
  N'Cần nâng cấp SSD', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, SerialNumber, OS, CPU, RAM, HardDisk,
  RansomwareProtection, OutlookStorage, PhongBan, Owner, ThoiGianDauTu, HSDBanDau,
  ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan, PhanHoiNguoiDung,
  DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  91, N'Máy tính', N'Laptop',
  N'HP 245 G10', N'5CG53018MS', N'Windows 11', N'AMD Ryzen 7 7730U',
  N'16GB - 3200 - 1/2 slot', N'500GB SSD - SAMSUNG', N'Yes',
  NULL, N'Commnercial', N'Nguyễn Thị Mỹ Hằng',
  N'May-26', N'May-29', N'May-26',
  N'May-29', N'Còn hạn', N'Còn hạn',
  NULL, N'Máy tính mới mua',
  NULL, 0, NULL,
  NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, SerialNumber, OS, CPU, RAM, HardDisk,
  RansomwareProtection, OutlookStorage, PhongBan, Owner, ThoiGianDauTu, HSDBanDau,
  ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan, PhanHoiNguoiDung,
  DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  92, N'Máy tính', N'Laptop',
  N'Hp Pavillion 14', NULL, N'Windows 11', N'8th  i5-8265U',
  N'8GB - 2400', N'240GB SSD - WDC', N'Yes',
  NULL, N'HR&IT', N'Đinh Thị Thủy',
  NULL, N'Dec-02', N'May-26',
  N'Dec-02', N'Đã hết hạn', N'Chưa được gia hạn',
  NULL, N'Máy tính chỉ dùng cho việc nhập liệu lên bảo trì tòa nhà',
  NULL, 0, N'Lưu kho',
  NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, SerialNumber, OS, CPU, RAM, HardDisk,
  RansomwareProtection, OutlookStorage, PhongBan, Owner, ThoiGianDauTu, HSDBanDau,
  ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan, PhanHoiNguoiDung,
  DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  93, N'Máy tính', N'Laptop',
  N'HP 340S G7 Notebook PC', N'5CD1088RXS', N'Windows 11', N'10th Intel Core i5 1035G1',
  N'8GB -2667-1/2 slot', N'240GB SSD - NVME - Toshiba', N'Yes',
  NULL, N'Admin Plant', N'Lê Thị Như Mỹ',
  NULL, N'Dec-02', N'May-26',
  N'May-27', N'Đã hết hạn', N'Đã được gia hạn',
  NULL, N'Máy cũ chị Ngọc , được bàn giao lại cho chị Mỹ',
  NULL, 0, NULL,
  N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, SerialNumber, OS, CPU, RAM, HardDisk,
  RansomwareProtection, OutlookStorage, PhongBan, Owner, ThoiGianDauTu, HSDBanDau,
  ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan, PhanHoiNguoiDung,
  DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  94, N'Máy tính', N'Laptop',
  N'HP 240 G8 Notebook PC', NULL, N'Windows 11', N'11th Intel Core i5 1135G7',
  N'8GB - 3200 - 1/2 slot', N'240GB SSD - NVME - Samsung', N'Yes',
  NULL, N'Admin Plant', N'Lê Thị Như Mỹ',
  NULL, N'Dec-02', N'May-26',
  N'May-27', N'Đã hết hạn', N'Đã được gia hạn',
  NULL, N'Máy cũ anh Quốc , được bàn giao lại cho chị Mỹ',
  NULL, 0, NULL,
  N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, SerialNumber, OS, CPU, RAM, HardDisk,
  RansomwareProtection, OutlookStorage, PhongBan, Owner, ThoiGianDauTu, HSDBanDau,
  ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan, PhanHoiNguoiDung,
  DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  95, N'Máy tính', N'Laptop',
  N'Dell Precision 7680', NULL, N'Windows 11', N'13th Intel Core i7-13580HX',
  N'32GB - 5600 - 1/1 SLOT', N'1TB SSD - NVME - KINGSTON', N'Yes',
  N'40GB free of 49.5', N'Project', N'Trần Tiến Din',
  N'May-26', N'May-29', N'May-26',
  N'May-29', N'Còn hạn', N'Còn hạn',
  NULL, N'Máy mới được cấp vào tháng 5-2026',
  NULL, 0, NULL,
  N'Trong niên hạn', N'Enabled'
);
PRINT N'-> Da import 95 thiet bi Nhom [Máy tính].';

-- 1.2 Nhập 139 Thiết bị Mạng, Máy chủ, Camera, Chấm công
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  CPU, RAM, HardDisk, PhongBan, Owner, ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri,
  HSDGiaHan, NienHanBanDau, NienHanGiaHan, HienTrang, CapNhatMay, KichHoat
) VALUES (
  1, N'Máy chủ', N'Server',
  N'HP ProLiant DL380p Gen8', NULL, N'SGH426KPB9',
  NULL, NULL, N'Intel® Xeon® E5-2650 (2.0GHz/8-core/15MB/7.2GT)',
  N'56GB', N'RAID 1: 76GB HDD SAS + 4TB HDD', N'IT',
  N'Trần Hải Nhân', N'Jul-18', NULL,
  NULL, NULL, N'Jun-21',
  NULL, N'Expired', NULL,
  N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  CPU, RAM, HardDisk, PhongBan, Owner, ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri,
  HSDGiaHan, NienHanBanDau, NienHanGiaHan, HienTrang, CapNhatMay, KichHoat
) VALUES (
  2, N'Máy chủ', N'Server',
  N'Dell PowerEdge T140', NULL, N'FNSSTC3',
  NULL, NULL, N'Intel Xeon E-2234 (4C/8T, 3.60 GHz, 8MB)',
  N'64GB', N'RAID 1:  4TB HDD', N'IT',
  N'Trần Hải Nhân', N'Mar-21', NULL,
  NULL, NULL, N'Feb-24',
  NULL, N'Expired', NULL,
  N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  CPU, RAM, HardDisk, PhongBan, Owner, ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri,
  HSDGiaHan, NienHanBanDau, NienHanGiaHan, HienTrang, CapNhatMay, KichHoat
) VALUES (
  3, N'Máy chủ', N'Server',
  N'HP ProLiant ML150 GEN 9', NULL, N'SGH721X3TF',
  NULL, NULL, N'Intel Xeon E5-2609v4 (1.7GHz/8-core/15MB/85W)',
  N'32GB', N'RAID 1:  4TB HDD', N'IT',
  N'Trần Hải Nhân', N'Aug-23', NULL,
  NULL, NULL, N'Jul-26',
  NULL, N'Expiring soon', NULL,
  N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  CPU, RAM, HardDisk, PhongBan, Owner, ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri,
  HSDGiaHan, NienHanBanDau, NienHanGiaHan, HienTrang, CapNhatMay, KichHoat
) VALUES (
  4, N'Máy chủ', N'Server',
  N'Dell PowerEdge T150', NULL, N'84105W3',
  NULL, NULL, N'Xeon E-2324G/8GB/2TB/DVDRW/300W',
  N'128GB', N'RAID 1:  4TB HDD', N'IT',
  N'Trần Hải Nhân', N'Sep-21', NULL,
  NULL, NULL, N'Aug-24',
  NULL, N'Expired', NULL,
  N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  CPU, RAM, HardDisk, PhongBan, Owner, ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri,
  HSDGiaHan, NienHanBanDau, NienHanGiaHan, HienTrang, CapNhatMay, KichHoat
) VALUES (
  5, N'Thiết bị mạng', N'AccessPoint',
  N'GWN7605', NULL, NULL,
  N'10.0.0.43', NULL, NULL,
  NULL, NULL, N'IT',
  N'Trần Hải Nhân', NULL, NULL,
  NULL, NULL, NULL,
  NULL, NULL, NULL,
  N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  CPU, RAM, HardDisk, PhongBan, Owner, ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri,
  HSDGiaHan, NienHanBanDau, NienHanGiaHan, HienTrang, CapNhatMay, KichHoat
) VALUES (
  6, N'Thiết bị mạng', N'AccessPoint',
  N'GWN7605', NULL, NULL,
  N'10.0.0.41', NULL, NULL,
  NULL, NULL, N'IT',
  N'Trần Hải Nhân', NULL, NULL,
  NULL, NULL, NULL,
  NULL, NULL, NULL,
  N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  CPU, RAM, HardDisk, PhongBan, Owner, ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri,
  HSDGiaHan, NienHanBanDau, NienHanGiaHan, HienTrang, CapNhatMay, KichHoat
) VALUES (
  7, N'Thiết bị mạng', N'AccessPoint',
  N'GWN7605', NULL, NULL,
  N'10.0.0.46', NULL, NULL,
  NULL, NULL, N'IT',
  N'Trần Hải Nhân', NULL, NULL,
  NULL, NULL, NULL,
  NULL, NULL, NULL,
  N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  CPU, RAM, HardDisk, PhongBan, Owner, ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri,
  HSDGiaHan, NienHanBanDau, NienHanGiaHan, HienTrang, CapNhatMay, KichHoat
) VALUES (
  8, N'Thiết bị mạng', N'AccessPoint',
  N'GWN7605', NULL, NULL,
  N'10.0.0.51', NULL, NULL,
  NULL, NULL, N'IT',
  N'Trần Hải Nhân', NULL, NULL,
  NULL, NULL, NULL,
  NULL, NULL, NULL,
  N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  CPU, RAM, HardDisk, PhongBan, Owner, ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri,
  HSDGiaHan, NienHanBanDau, NienHanGiaHan, HienTrang, CapNhatMay, KichHoat
) VALUES (
  9, N'Thiết bị mạng', N'AccessPoint',
  N'GWN7605', NULL, NULL,
  N'10.0.0.50', NULL, NULL,
  NULL, NULL, N'IT',
  N'Trần Hải Nhân', NULL, NULL,
  NULL, NULL, NULL,
  NULL, NULL, NULL,
  N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  CPU, RAM, HardDisk, PhongBan, Owner, ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri,
  HSDGiaHan, NienHanBanDau, NienHanGiaHan, HienTrang, CapNhatMay, KichHoat
) VALUES (
  10, N'Thiết bị mạng', N'AccessPoint',
  N'GWN7605', NULL, NULL,
  N'10.0.0.42', NULL, NULL,
  NULL, NULL, N'IT',
  N'Trần Hải Nhân', NULL, NULL,
  NULL, NULL, NULL,
  NULL, NULL, NULL,
  N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  CPU, RAM, HardDisk, PhongBan, Owner, ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri,
  HSDGiaHan, NienHanBanDau, NienHanGiaHan, HienTrang, CapNhatMay, KichHoat
) VALUES (
  11, N'Thiết bị mạng', N'AccessPoint',
  N'GWN7605', NULL, NULL,
  N'10.0.0.48', NULL, NULL,
  NULL, NULL, N'IT',
  N'Trần Hải Nhân', NULL, NULL,
  NULL, NULL, NULL,
  NULL, NULL, NULL,
  N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  CPU, RAM, HardDisk, PhongBan, Owner, ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri,
  HSDGiaHan, NienHanBanDau, NienHanGiaHan, HienTrang, CapNhatMay, KichHoat
) VALUES (
  12, N'Thiết bị mạng', N'AccessPoint',
  N'GWN7605', NULL, NULL,
  N'10.0.0.49', NULL, NULL,
  NULL, NULL, N'IT',
  N'Trần Hải Nhân', NULL, NULL,
  NULL, NULL, NULL,
  NULL, NULL, NULL,
  N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  CPU, RAM, HardDisk, PhongBan, Owner, ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri,
  HSDGiaHan, NienHanBanDau, NienHanGiaHan, HienTrang, CapNhatMay, KichHoat
) VALUES (
  13, N'Thiết bị mạng', N'AccessPoint',
  N'GWN7605', NULL, NULL,
  N'10.0.0.44', NULL, NULL,
  NULL, NULL, N'IT',
  N'Trần Hải Nhân', NULL, NULL,
  NULL, NULL, NULL,
  NULL, NULL, NULL,
  N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  CPU, RAM, HardDisk, PhongBan, Owner, ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri,
  HSDGiaHan, NienHanBanDau, NienHanGiaHan, HienTrang, CapNhatMay, KichHoat
) VALUES (
  14, N'Thiết bị mạng', N'AccessPoint',
  N'GWN7605', NULL, NULL,
  N'192.168.2.10', NULL, NULL,
  NULL, NULL, N'IT',
  N'Trần Hải Nhân', NULL, NULL,
  NULL, NULL, NULL,
  NULL, NULL, NULL,
  N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  CPU, RAM, HardDisk, PhongBan, Owner, ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri,
  HSDGiaHan, NienHanBanDau, NienHanGiaHan, HienTrang, CapNhatMay, KichHoat
) VALUES (
  15, N'Thiết bị mạng', N'AccessPoint',
  N'GWN7660E', NULL, NULL,
  N'192.168.2.9', NULL, NULL,
  NULL, NULL, N'IT',
  N'Trần Hải Nhân', NULL, NULL,
  NULL, NULL, NULL,
  NULL, NULL, NULL,
  N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  CPU, RAM, HardDisk, PhongBan, Owner, ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri,
  HSDGiaHan, NienHanBanDau, NienHanGiaHan, HienTrang, CapNhatMay, KichHoat
) VALUES (
  16, N'Thiết bị mạng', N'AccessPoint',
  N'GWN7660E', NULL, NULL,
  N'192.168.2.8', NULL, NULL,
  NULL, NULL, N'IT',
  N'Trần Hải Nhân', NULL, NULL,
  NULL, NULL, NULL,
  NULL, NULL, NULL,
  N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  CPU, RAM, HardDisk, PhongBan, Owner, ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri,
  HSDGiaHan, NienHanBanDau, NienHanGiaHan, HienTrang, CapNhatMay, KichHoat
) VALUES (
  17, N'Thiết bị mạng', N'AccessPoint',
  N'GWN7605LR', NULL, NULL,
  N'192.168.2.7', NULL, NULL,
  NULL, NULL, N'IT',
  N'Trần Hải Nhân', NULL, NULL,
  NULL, NULL, NULL,
  NULL, NULL, NULL,
  N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  CPU, RAM, HardDisk, PhongBan, Owner, ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri,
  HSDGiaHan, NienHanBanDau, NienHanGiaHan, HienTrang, CapNhatMay, KichHoat
) VALUES (
  18, N'Thiết bị mạng', N'AccessPoint',
  N'GWN7605LR', NULL, NULL,
  N'192.168.2.6', NULL, NULL,
  NULL, NULL, N'IT',
  N'Trần Hải Nhân', NULL, NULL,
  NULL, NULL, NULL,
  NULL, NULL, NULL,
  N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  CPU, RAM, HardDisk, PhongBan, Owner, ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri,
  HSDGiaHan, NienHanBanDau, NienHanGiaHan, HienTrang, CapNhatMay, KichHoat
) VALUES (
  19, N'Thiết bị mạng', N'Router Controller',
  N'iZiFi SG-250', N'Y21200014510', NULL,
  NULL, NULL, NULL,
  NULL, N'Sep-22', N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL,
  NULL, N'Aug-25', NULL,
  N'Expired', NULL, N'Enabled',
  N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  CPU, RAM, HardDisk, PhongBan, Owner, ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri,
  HSDGiaHan, NienHanBanDau, NienHanGiaHan, HienTrang, CapNhatMay, KichHoat
) VALUES (
  20, N'Thiết bị mạng', N'Wifi',
  N'FIT-A782', NULL, NULL,
  NULL, NULL, NULL,
  NULL, N'Sep-22', N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL,
  NULL, N'Aug-25', NULL,
  N'Expired', NULL, N'Enabled',
  N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  CPU, RAM, HardDisk, PhongBan, Owner, ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri,
  HSDGiaHan, NienHanBanDau, NienHanGiaHan, HienTrang, CapNhatMay, KichHoat
) VALUES (
  21, N'Thiết bị mạng', N'Wifi',
  N'FIT-A782', NULL, NULL,
  NULL, NULL, NULL,
  NULL, N'Sep-22', N'Procurement',
  N'Trần Hải Nhân', NULL, NULL,
  NULL, N'Aug-25', NULL,
  N'Expired', NULL, N'Enabled',
  N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  CPU, RAM, HardDisk, PhongBan, Owner, ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri,
  HSDGiaHan, NienHanBanDau, NienHanGiaHan, HienTrang, CapNhatMay, KichHoat
) VALUES (
  22, N'Thiết bị mạng', N'Wifi',
  N'FIT-A782', NULL, NULL,
  NULL, NULL, NULL,
  NULL, N'Sep-22', N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL,
  NULL, N'Aug-25', NULL,
  N'Expired', NULL, N'Enabled',
  N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  CPU, RAM, HardDisk, PhongBan, Owner, ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri,
  HSDGiaHan, NienHanBanDau, NienHanGiaHan, HienTrang, CapNhatMay, KichHoat
) VALUES (
  23, N'Thiết bị mạng', N'Wifi',
  N'FIT-A782', NULL, NULL,
  NULL, NULL, NULL,
  NULL, N'Sep-22', N'Commnercial',
  N'Trần Hải Nhân', NULL, NULL,
  NULL, N'Aug-25', NULL,
  N'Expired', NULL, N'Enabled',
  N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  CPU, RAM, HardDisk, PhongBan, Owner, ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri,
  HSDGiaHan, NienHanBanDau, NienHanGiaHan, HienTrang, CapNhatMay, KichHoat
) VALUES (
  24, N'Thiết bị mạng', N'Wifi',
  N'FIT-A782', NULL, NULL,
  NULL, NULL, NULL,
  NULL, N'Sep-22', N'Ingredient',
  N'Trần Hải Nhân', NULL, NULL,
  NULL, N'Aug-25', NULL,
  N'Expired', NULL, N'Enabled',
  N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  CPU, RAM, HardDisk, PhongBan, Owner, ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri,
  HSDGiaHan, NienHanBanDau, NienHanGiaHan, HienTrang, CapNhatMay, KichHoat
) VALUES (
  25, N'Thiết bị mạng', N'Wifi',
  N'FIT-A782', NULL, NULL,
  NULL, NULL, NULL,
  NULL, N'Sep-22', N'Flavor',
  N'Trần Hải Nhân', NULL, NULL,
  NULL, N'Aug-25', NULL,
  N'Expired', NULL, N'Enabled',
  N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  CPU, RAM, HardDisk, PhongBan, Owner, ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri,
  HSDGiaHan, NienHanBanDau, NienHanGiaHan, HienTrang, CapNhatMay, KichHoat
) VALUES (
  26, N'Thiết bị mạng', N'Wifi',
  N'FIT-A782', NULL, NULL,
  NULL, NULL, NULL,
  NULL, N'Sep-22', N'Flavor',
  N'Trần Hải Nhân', NULL, NULL,
  NULL, N'Aug-25', NULL,
  N'Expired', NULL, N'Enabled',
  N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  CPU, RAM, HardDisk, PhongBan, Owner, ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri,
  HSDGiaHan, NienHanBanDau, NienHanGiaHan, HienTrang, CapNhatMay, KichHoat
) VALUES (
  27, N'Thiết bị mạng', N'Wifi',
  N'FIT-A782', NULL, NULL,
  NULL, NULL, NULL,
  NULL, N'Sep-22', N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL,
  NULL, N'Aug-25', NULL,
  N'Expired', NULL, N'Enabled',
  N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  CPU, RAM, HardDisk, PhongBan, Owner, ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri,
  HSDGiaHan, NienHanBanDau, NienHanGiaHan, HienTrang, CapNhatMay, KichHoat
) VALUES (
  28, N'Thiết bị mạng', N'Wifi',
  N'FIT-A782', NULL, NULL,
  NULL, NULL, NULL,
  NULL, N'Sep-22', N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL,
  NULL, N'Aug-25', NULL,
  N'Expired', NULL, N'Enabled',
  N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  CPU, RAM, HardDisk, PhongBan, Owner, ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri,
  HSDGiaHan, NienHanBanDau, NienHanGiaHan, HienTrang, CapNhatMay, KichHoat
) VALUES (
  29, N'Thiết bị mạng', N'Firewall',
  N'Sonicwall NSA 2700', N'18C241050E08', NULL,
  NULL, NULL, NULL,
  NULL, N'Sep-22', N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL,
  NULL, N'Aug-25', NULL,
  N'Expired', NULL, N'Enabled',
  N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  CPU, RAM, HardDisk, PhongBan, Owner, ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri,
  HSDGiaHan, NienHanBanDau, NienHanGiaHan, HienTrang, CapNhatMay, KichHoat
) VALUES (
  30, N'Thiết bị mạng', N'Firewall',
  N'Sonicwall NSA 2700', N'18C241050E08', NULL,
  NULL, NULL, NULL,
  NULL, N'Sep-22', N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL,
  NULL, N'Aug-25', NULL,
  N'Expired', NULL, N'Enabled',
  N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  CPU, RAM, HardDisk, PhongBan, Owner, ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri,
  HSDGiaHan, NienHanBanDau, NienHanGiaHan, HienTrang, CapNhatMay, KichHoat
) VALUES (
  31, N'Thiết bị mạng', N'Firewall',
  N'Sonicwall NSA 2400', NULL, NULL,
  NULL, NULL, NULL,
  NULL, N'Sep-22', N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL,
  NULL, N'Aug-25', NULL,
  N'Expired', NULL, N'Enabled',
  N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  CPU, RAM, HardDisk, PhongBan, Owner, ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri,
  HSDGiaHan, NienHanBanDau, NienHanGiaHan, HienTrang, CapNhatMay, KichHoat
) VALUES (
  32, N'Thiết bị mạng', N'Switch Core',
  N'Juniper EX2300-24T', N'JZ0219280130', NULL,
  NULL, NULL, NULL,
  NULL, N'Sep-22', N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL,
  NULL, N'Aug-25', NULL,
  N'Expired', NULL, N'Enabled',
  N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  CPU, RAM, HardDisk, PhongBan, Owner, ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri,
  HSDGiaHan, NienHanBanDau, NienHanGiaHan, HienTrang, CapNhatMay, KichHoat
) VALUES (
  33, N'Thiết bị mạng', N'Switch Core',
  N'Juniper EX2300-24T', N'JZ0219280147', NULL,
  NULL, NULL, NULL,
  NULL, N'Sep-22', N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL,
  NULL, N'Aug-25', NULL,
  N'Expired', NULL, N'Enabled',
  N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  CPU, RAM, HardDisk, PhongBan, Owner, ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri,
  HSDGiaHan, NienHanBanDau, NienHanGiaHan, HienTrang, CapNhatMay, KichHoat
) VALUES (
  34, N'Thiết bị mạng', N'Switch Managed',
  N'ES205GC-P', N'CAR61J6024607', NULL,
  NULL, NULL, NULL,
  NULL, N'Sep-22', N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL,
  NULL, N'Aug-25', NULL,
  N'Expired', NULL, N'Enabled',
  N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  CPU, RAM, HardDisk, PhongBan, Owner, ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri,
  HSDGiaHan, NienHanBanDau, NienHanGiaHan, HienTrang, CapNhatMay, KichHoat
) VALUES (
  35, N'Thiết bị mạng', N'Switch Managed',
  N'ES226GC-P', N'CAR61J6024607', NULL,
  NULL, NULL, NULL,
  NULL, N'Sep-22', N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL,
  NULL, N'Aug-25', NULL,
  N'Expired', NULL, N'Enabled',
  N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  CPU, RAM, HardDisk, PhongBan, Owner, ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri,
  HSDGiaHan, NienHanBanDau, NienHanGiaHan, HienTrang, CapNhatMay, KichHoat
) VALUES (
  36, N'Thiết bị mạng', N'Switch Managed',
  N'ES226GC-P', N'G1QH6WE001877', NULL,
  NULL, NULL, NULL,
  NULL, N'Sep-22', N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL,
  NULL, N'Aug-25', NULL,
  N'Expired', NULL, N'Enabled',
  N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  CPU, RAM, HardDisk, PhongBan, Owner, ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri,
  HSDGiaHan, NienHanBanDau, NienHanGiaHan, HienTrang, CapNhatMay, KichHoat
) VALUES (
  37, N'Thiết bị mạng', N'Switch Managed',
  N'ES226GC-P', N'G1QH6WE002346', NULL,
  NULL, NULL, NULL,
  NULL, N'Sep-22', N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL,
  NULL, N'Aug-25', NULL,
  N'Expired', NULL, N'Enabled',
  N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  CPU, RAM, HardDisk, PhongBan, Owner, ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri,
  HSDGiaHan, NienHanBanDau, NienHanGiaHan, HienTrang, CapNhatMay, KichHoat
) VALUES (
  38, N'Thiết bị mạng', N'Switch Managed',
  N'ES208GC', N'CAQL75P00005B', NULL,
  NULL, NULL, NULL,
  NULL, N'Sep-22', N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL,
  NULL, N'Aug-25', NULL,
  N'Expired', NULL, N'Enabled',
  N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  CPU, RAM, HardDisk, PhongBan, Owner, ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri,
  HSDGiaHan, NienHanBanDau, NienHanGiaHan, HienTrang, CapNhatMay, KichHoat
) VALUES (
  39, N'Thiết bị mạng', N'Switch Managed',
  N'ES208GC', N'CAQL75P009168', NULL,
  NULL, NULL, NULL,
  NULL, N'Sep-22', N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL,
  NULL, N'Aug-25', NULL,
  N'Expired', NULL, N'Enabled',
  N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  CPU, RAM, HardDisk, PhongBan, Owner, ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri,
  HSDGiaHan, NienHanBanDau, NienHanGiaHan, HienTrang, CapNhatMay, KichHoat
) VALUES (
  40, N'Hạ tầng & Camera', N'Digital Video Recorder',
  N'DHI-NVR5232- 4KS2', NULL, NULL,
  NULL, NULL, NULL,
  NULL, N'May-20', N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL,
  NULL, N'May-23', NULL,
  N'Expired', NULL, N'Enabled',
  N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  CPU, RAM, HardDisk, PhongBan, Owner, ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri,
  HSDGiaHan, NienHanBanDau, NienHanGiaHan, HienTrang, CapNhatMay, KichHoat
) VALUES (
  41, N'Hạ tầng & Camera', N'Digital Video Recorder',
  N'DHI-NVR5232- 4KS2', NULL, NULL,
  NULL, NULL, NULL,
  NULL, N'Nov-22', N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL,
  NULL, N'Oct-25', NULL,
  N'Expired', NULL, N'Enabled',
  N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  CPU, RAM, HardDisk, PhongBan, Owner, ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri,
  HSDGiaHan, NienHanBanDau, NienHanGiaHan, HienTrang, CapNhatMay, KichHoat
) VALUES (
  42, N'Hạ tầng & Camera', N'Digital Video Recorder',
  N'DHI-NVR5232- 4KS2', NULL, NULL,
  NULL, NULL, NULL,
  NULL, N'Dec-22', N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL,
  NULL, N'Nov-25', NULL,
  N'Expired', NULL, N'Enabled',
  N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  CPU, RAM, HardDisk, PhongBan, Owner, ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri,
  HSDGiaHan, NienHanBanDau, NienHanGiaHan, HienTrang, CapNhatMay, KichHoat
) VALUES (
  43, N'Hạ tầng & Camera', N'IP Camera',
  N'DH-HAC-HFW1200SP-S3', NULL, NULL,
  NULL, NULL, NULL,
  NULL, N'May-20', N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL,
  NULL, N'May-23', NULL,
  N'Expired', NULL, N'Enabled',
  N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  CPU, RAM, HardDisk, PhongBan, Owner, ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri,
  HSDGiaHan, NienHanBanDau, NienHanGiaHan, HienTrang, CapNhatMay, KichHoat
) VALUES (
  44, N'Hạ tầng & Camera', N'IP Camera',
  N'DH-HAC-HFW1200SP-S3', NULL, NULL,
  NULL, NULL, NULL,
  NULL, N'May-20', N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL,
  NULL, N'May-23', NULL,
  N'Expired', NULL, N'Enabled',
  N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  CPU, RAM, HardDisk, PhongBan, Owner, ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri,
  HSDGiaHan, NienHanBanDau, NienHanGiaHan, HienTrang, CapNhatMay, KichHoat
) VALUES (
  45, N'Hạ tầng & Camera', N'IP Camera',
  N'DH-HAC-HFW1200SP-S3', NULL, NULL,
  NULL, NULL, NULL,
  NULL, N'May-20', N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL,
  NULL, N'May-23', NULL,
  N'Expired', NULL, N'Enabled',
  N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  CPU, RAM, HardDisk, PhongBan, Owner, ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri,
  HSDGiaHan, NienHanBanDau, NienHanGiaHan, HienTrang, CapNhatMay, KichHoat
) VALUES (
  46, N'Hạ tầng & Camera', N'IP Camera',
  N'DH-HAC-HFW1200SP-S3', NULL, NULL,
  NULL, NULL, NULL,
  NULL, N'May-20', N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL,
  NULL, N'May-23', NULL,
  N'Expired', NULL, N'Enabled',
  N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  CPU, RAM, HardDisk, PhongBan, Owner, ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri,
  HSDGiaHan, NienHanBanDau, NienHanGiaHan, HienTrang, CapNhatMay, KichHoat
) VALUES (
  47, N'Hạ tầng & Camera', N'IP Camera',
  N'DH-HAC-HFW1200SP-S3', NULL, NULL,
  NULL, NULL, NULL,
  NULL, N'May-20', N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL,
  NULL, N'May-23', NULL,
  N'Expired', NULL, N'Enabled',
  N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  CPU, RAM, HardDisk, PhongBan, Owner, ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri,
  HSDGiaHan, NienHanBanDau, NienHanGiaHan, HienTrang, CapNhatMay, KichHoat
) VALUES (
  48, N'Hạ tầng & Camera', N'IP Camera',
  N'DH-HAC-HFW1200SP-S3', NULL, NULL,
  NULL, NULL, NULL,
  NULL, N'May-20', N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL,
  NULL, N'May-23', NULL,
  N'Expired', NULL, N'Enabled',
  N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  CPU, RAM, HardDisk, PhongBan, Owner, ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri,
  HSDGiaHan, NienHanBanDau, NienHanGiaHan, HienTrang, CapNhatMay, KichHoat
) VALUES (
  49, N'Hạ tầng & Camera', N'IP Camera',
  N'DH-HAC-HFW1200SP-S3', NULL, NULL,
  NULL, NULL, NULL,
  NULL, N'May-20', N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL,
  NULL, N'May-23', NULL,
  N'Expired', NULL, N'Enabled',
  N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  CPU, RAM, HardDisk, PhongBan, Owner, ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri,
  HSDGiaHan, NienHanBanDau, NienHanGiaHan, HienTrang, CapNhatMay, KichHoat
) VALUES (
  50, N'Hạ tầng & Camera', N'IP Camera',
  N'DH-HAC-HFW1200SP-S3', NULL, NULL,
  NULL, NULL, NULL,
  NULL, N'May-20', N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL,
  NULL, N'May-23', NULL,
  N'Expired', NULL, N'Enabled',
  N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  CPU, RAM, HardDisk, PhongBan, Owner, ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri,
  HSDGiaHan, NienHanBanDau, NienHanGiaHan, HienTrang, CapNhatMay, KichHoat
) VALUES (
  51, N'Hạ tầng & Camera', N'IP Camera',
  N'DH-HAC-HFW1200SP-S3', NULL, NULL,
  NULL, NULL, NULL,
  NULL, N'May-20', N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL,
  NULL, N'May-23', NULL,
  N'Expired', NULL, N'Enabled',
  N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  CPU, RAM, HardDisk, PhongBan, Owner, ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri,
  HSDGiaHan, NienHanBanDau, NienHanGiaHan, HienTrang, CapNhatMay, KichHoat
) VALUES (
  52, N'Hạ tầng & Camera', N'IP Camera',
  N'DH-HAC-HFW1200SP-S3', NULL, NULL,
  NULL, NULL, NULL,
  NULL, N'May-20', N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL,
  NULL, N'May-23', NULL,
  N'Expired', NULL, N'Enabled',
  N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  CPU, RAM, HardDisk, PhongBan, Owner, ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri,
  HSDGiaHan, NienHanBanDau, NienHanGiaHan, HienTrang, CapNhatMay, KichHoat
) VALUES (
  53, N'Hạ tầng & Camera', N'IP Camera',
  N'DH-HAC-HFW1200SP-S3', NULL, NULL,
  NULL, NULL, NULL,
  NULL, N'May-20', N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL,
  NULL, N'May-23', NULL,
  N'Expired', NULL, N'Enabled',
  N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  CPU, RAM, HardDisk, PhongBan, Owner, ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri,
  HSDGiaHan, NienHanBanDau, NienHanGiaHan, HienTrang, CapNhatMay, KichHoat
) VALUES (
  54, N'Hạ tầng & Camera', N'IP Camera',
  N'DH-HAC-HFW1200SP-S3', NULL, NULL,
  NULL, NULL, NULL,
  NULL, N'May-20', N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL,
  NULL, N'May-23', NULL,
  N'Expired', NULL, N'Enabled',
  N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  CPU, RAM, HardDisk, PhongBan, Owner, ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri,
  HSDGiaHan, NienHanBanDau, NienHanGiaHan, HienTrang, CapNhatMay, KichHoat
) VALUES (
  55, N'Hạ tầng & Camera', N'IP Camera',
  N'DH-HAC-HFW1200SP-S3', NULL, NULL,
  NULL, NULL, NULL,
  NULL, N'May-20', N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL,
  NULL, N'May-23', NULL,
  N'Expired', NULL, N'Enabled',
  N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  CPU, RAM, HardDisk, PhongBan, Owner, ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri,
  HSDGiaHan, NienHanBanDau, NienHanGiaHan, HienTrang, CapNhatMay, KichHoat
) VALUES (
  56, N'Hạ tầng & Camera', N'IP Camera',
  N'DH-HAC-HFW1200SP-S3', NULL, NULL,
  NULL, NULL, NULL,
  NULL, N'May-20', N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL,
  NULL, N'May-23', NULL,
  N'Expired', NULL, N'Enabled',
  N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  CPU, RAM, HardDisk, PhongBan, Owner, ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri,
  HSDGiaHan, NienHanBanDau, NienHanGiaHan, HienTrang, CapNhatMay, KichHoat
) VALUES (
  57, N'Hạ tầng & Camera', N'IP Camera',
  N'DH-HAC-HFW1200SP-S3', NULL, NULL,
  NULL, NULL, NULL,
  NULL, N'May-20', N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL,
  NULL, N'May-23', NULL,
  N'Expired', NULL, N'Enabled',
  N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  CPU, RAM, HardDisk, PhongBan, Owner, ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri,
  HSDGiaHan, NienHanBanDau, NienHanGiaHan, HienTrang, CapNhatMay, KichHoat
) VALUES (
  58, N'Hạ tầng & Camera', N'IP Camera',
  N'DH-HAC-HFW1200SP-S3', NULL, NULL,
  NULL, NULL, NULL,
  NULL, N'May-20', N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL,
  NULL, N'May-23', NULL,
  N'Expired', NULL, N'Enabled',
  N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  CPU, RAM, HardDisk, PhongBan, Owner, ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri,
  HSDGiaHan, NienHanBanDau, NienHanGiaHan, HienTrang, CapNhatMay, KichHoat
) VALUES (
  59, N'Hạ tầng & Camera', N'IP Camera',
  N'DH-HAC-HFW1200SP-S3', NULL, NULL,
  NULL, NULL, NULL,
  NULL, N'May-20', N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL,
  NULL, N'May-23', NULL,
  N'Expired', NULL, N'Enabled',
  N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  CPU, RAM, HardDisk, PhongBan, Owner, ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri,
  HSDGiaHan, NienHanBanDau, NienHanGiaHan, HienTrang, CapNhatMay, KichHoat
) VALUES (
  60, N'Hạ tầng & Camera', N'IP Camera',
  N'DH-HAC-HFW1200SP-S3', NULL, NULL,
  NULL, NULL, NULL,
  NULL, N'May-20', N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL,
  NULL, N'May-23', NULL,
  N'Expired', NULL, N'Enabled',
  N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  CPU, RAM, HardDisk, PhongBan, Owner, ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri,
  HSDGiaHan, NienHanBanDau, NienHanGiaHan, HienTrang, CapNhatMay, KichHoat
) VALUES (
  61, N'Hạ tầng & Camera', N'IP Camera',
  N'DH-HAC-HFW1200SP-S3', NULL, NULL,
  NULL, NULL, NULL,
  NULL, N'May-20', N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL,
  NULL, N'May-23', NULL,
  N'Expired', NULL, N'Enabled',
  N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  CPU, RAM, HardDisk, PhongBan, Owner, ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri,
  HSDGiaHan, NienHanBanDau, NienHanGiaHan, HienTrang, CapNhatMay, KichHoat
) VALUES (
  62, N'Hạ tầng & Camera', N'IP Camera',
  N'DH-HAC-HFW1200SP-S3', NULL, NULL,
  NULL, NULL, NULL,
  NULL, N'May-20', N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL,
  NULL, N'May-23', NULL,
  N'Expired', NULL, N'Enabled',
  N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  CPU, RAM, HardDisk, PhongBan, Owner, ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri,
  HSDGiaHan, NienHanBanDau, NienHanGiaHan, HienTrang, CapNhatMay, KichHoat
) VALUES (
  63, N'Hạ tầng & Camera', N'IP Camera',
  N'DH-HAC-HFW1200SP-S3', NULL, NULL,
  NULL, NULL, NULL,
  NULL, N'May-20', N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL,
  NULL, N'May-23', NULL,
  N'Expired', NULL, N'Enabled',
  N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  CPU, RAM, HardDisk, PhongBan, Owner, ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri,
  HSDGiaHan, NienHanBanDau, NienHanGiaHan, HienTrang, CapNhatMay, KichHoat
) VALUES (
  64, N'Hạ tầng & Camera', N'IP Camera',
  N'DH-HAC-HFW1200SP-S3', NULL, NULL,
  NULL, NULL, NULL,
  NULL, N'May-20', N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL,
  NULL, N'May-23', NULL,
  N'Expired', NULL, N'Enabled',
  N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  CPU, RAM, HardDisk, PhongBan, Owner, ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri,
  HSDGiaHan, NienHanBanDau, NienHanGiaHan, HienTrang, CapNhatMay, KichHoat
) VALUES (
  65, N'Hạ tầng & Camera', N'IP Camera',
  N'DH-HAC-HFW1200SP-S3', NULL, NULL,
  NULL, NULL, NULL,
  NULL, N'May-20', N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL,
  NULL, N'May-23', NULL,
  N'Expired', NULL, N'Enabled',
  N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  CPU, RAM, HardDisk, PhongBan, Owner, ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri,
  HSDGiaHan, NienHanBanDau, NienHanGiaHan, HienTrang, CapNhatMay, KichHoat
) VALUES (
  66, N'Hạ tầng & Camera', N'IP Camera',
  N'DH-HAC-HFW1200SP-S3', NULL, NULL,
  NULL, NULL, NULL,
  NULL, N'May-20', N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL,
  NULL, N'May-23', NULL,
  N'Expired', NULL, N'Enabled',
  N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  CPU, RAM, HardDisk, PhongBan, Owner, ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri,
  HSDGiaHan, NienHanBanDau, NienHanGiaHan, HienTrang, CapNhatMay, KichHoat
) VALUES (
  67, N'Hạ tầng & Camera', N'IP Camera',
  N'DH-HAC-HFW1200SP-S3', NULL, NULL,
  NULL, NULL, NULL,
  NULL, N'May-20', N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL,
  NULL, N'May-23', NULL,
  N'Expired', NULL, N'Enabled',
  N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  CPU, RAM, HardDisk, PhongBan, Owner, ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri,
  HSDGiaHan, NienHanBanDau, NienHanGiaHan, HienTrang, CapNhatMay, KichHoat
) VALUES (
  68, N'Hạ tầng & Camera', N'IP Camera',
  N'DH-HAC-HFW1200SP-S3', NULL, NULL,
  NULL, NULL, NULL,
  NULL, N'May-20', N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL,
  NULL, N'May-23', NULL,
  N'Expired', NULL, N'Enabled',
  N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  CPU, RAM, HardDisk, PhongBan, Owner, ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri,
  HSDGiaHan, NienHanBanDau, NienHanGiaHan, HienTrang, CapNhatMay, KichHoat
) VALUES (
  69, N'Hạ tầng & Camera', N'IP Camera',
  N'DH-HAC-HFW1200SP-S3', NULL, NULL,
  NULL, NULL, NULL,
  NULL, N'May-20', N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL,
  NULL, N'May-23', NULL,
  N'Expired', NULL, N'Enabled',
  N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  CPU, RAM, HardDisk, PhongBan, Owner, ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri,
  HSDGiaHan, NienHanBanDau, NienHanGiaHan, HienTrang, CapNhatMay, KichHoat
) VALUES (
  70, N'Hạ tầng & Camera', N'IP Camera',
  N'DH-HAC-HFW1200SP-S3', NULL, NULL,
  NULL, NULL, NULL,
  NULL, N'May-20', N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL,
  NULL, N'May-23', NULL,
  N'Expired', NULL, N'Enabled',
  N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  CPU, RAM, HardDisk, PhongBan, Owner, ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri,
  HSDGiaHan, NienHanBanDau, NienHanGiaHan, HienTrang, CapNhatMay, KichHoat
) VALUES (
  71, N'Hạ tầng & Camera', N'IP Camera',
  N'DH-HAC-HFW1200SP-S3', NULL, NULL,
  NULL, NULL, NULL,
  NULL, N'May-20', N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL,
  NULL, N'May-23', NULL,
  N'Expired', NULL, N'Enabled',
  N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  CPU, RAM, HardDisk, PhongBan, Owner, ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri,
  HSDGiaHan, NienHanBanDau, NienHanGiaHan, HienTrang, CapNhatMay, KichHoat
) VALUES (
  72, N'Hạ tầng & Camera', N'IP Camera',
  N'DH-HAC-HFW1200SP-S3', NULL, NULL,
  NULL, NULL, NULL,
  NULL, N'May-20', N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL,
  NULL, N'May-23', NULL,
  N'Expired', NULL, N'Enabled',
  N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  CPU, RAM, HardDisk, PhongBan, Owner, ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri,
  HSDGiaHan, NienHanBanDau, NienHanGiaHan, HienTrang, CapNhatMay, KichHoat
) VALUES (
  73, N'Hạ tầng & Camera', N'IP Camera',
  N'DH-HAC-HFW1200SP-S3', NULL, NULL,
  NULL, NULL, NULL,
  NULL, N'May-20', N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL,
  NULL, N'May-23', NULL,
  N'Expired', NULL, N'Enabled',
  N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  CPU, RAM, HardDisk, PhongBan, Owner, ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri,
  HSDGiaHan, NienHanBanDau, NienHanGiaHan, HienTrang, CapNhatMay, KichHoat
) VALUES (
  74, N'Hạ tầng & Camera', N'IP Camera',
  N'DH-HAC-HFW1200SP-S3', NULL, NULL,
  NULL, NULL, NULL,
  NULL, N'May-20', N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL,
  NULL, N'May-23', NULL,
  N'Expired', NULL, N'Enabled',
  N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  CPU, RAM, HardDisk, PhongBan, Owner, ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri,
  HSDGiaHan, NienHanBanDau, NienHanGiaHan, HienTrang, CapNhatMay, KichHoat
) VALUES (
  75, N'Hạ tầng & Camera', N'IP Camera',
  N'DASBN4431S-S3', NULL, NULL,
  NULL, NULL, NULL,
  NULL, N'Dec-22', N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL,
  NULL, N'Nov-25', NULL,
  N'Expired', NULL, N'Enabled',
  N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  CPU, RAM, HardDisk, PhongBan, Owner, ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri,
  HSDGiaHan, NienHanBanDau, NienHanGiaHan, HienTrang, CapNhatMay, KichHoat
) VALUES (
  76, N'Hạ tầng & Camera', N'IP Camera',
  N'DASBN4431S-S3', NULL, NULL,
  NULL, NULL, NULL,
  NULL, N'Dec-22', N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL,
  NULL, N'Nov-25', NULL,
  N'Expired', NULL, N'Enabled',
  N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  CPU, RAM, HardDisk, PhongBan, Owner, ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri,
  HSDGiaHan, NienHanBanDau, NienHanGiaHan, HienTrang, CapNhatMay, KichHoat
) VALUES (
  77, N'Hạ tầng & Camera', N'IP Camera',
  N'DASBN4431S-S3', NULL, NULL,
  NULL, NULL, NULL,
  NULL, N'Dec-22', N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL,
  NULL, N'Nov-25', NULL,
  N'Expired', NULL, N'Enabled',
  N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  CPU, RAM, HardDisk, PhongBan, Owner, ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri,
  HSDGiaHan, NienHanBanDau, NienHanGiaHan, HienTrang, CapNhatMay, KichHoat
) VALUES (
  78, N'Hạ tầng & Camera', N'IP Camera',
  N'DASBN4431S-S3', NULL, NULL,
  NULL, NULL, NULL,
  NULL, N'Dec-22', N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL,
  NULL, N'Nov-25', NULL,
  N'Expired', NULL, N'Enabled',
  N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  CPU, RAM, HardDisk, PhongBan, Owner, ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri,
  HSDGiaHan, NienHanBanDau, NienHanGiaHan, HienTrang, CapNhatMay, KichHoat
) VALUES (
  79, N'Hạ tầng & Camera', N'IP Camera',
  N'DASBN4431S-S3', NULL, NULL,
  NULL, NULL, NULL,
  NULL, N'Dec-22', N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL,
  NULL, N'Nov-25', NULL,
  N'Expired', NULL, N'Enabled',
  N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  CPU, RAM, HardDisk, PhongBan, Owner, ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri,
  HSDGiaHan, NienHanBanDau, NienHanGiaHan, HienTrang, CapNhatMay, KichHoat
) VALUES (
  80, N'Hạ tầng & Camera', N'IP Camera',
  N'DASBN4431S-S3', NULL, NULL,
  NULL, NULL, NULL,
  NULL, N'Dec-22', N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL,
  NULL, N'Nov-25', NULL,
  N'Expired', NULL, N'Enabled',
  N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  CPU, RAM, HardDisk, PhongBan, Owner, ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri,
  HSDGiaHan, NienHanBanDau, NienHanGiaHan, HienTrang, CapNhatMay, KichHoat
) VALUES (
  81, N'Hạ tầng & Camera', N'IP Camera',
  N'DASBN4431S-S3', NULL, NULL,
  NULL, NULL, NULL,
  NULL, N'Dec-22', N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL,
  NULL, N'Nov-25', NULL,
  N'Expired', NULL, N'Enabled',
  N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  CPU, RAM, HardDisk, PhongBan, Owner, ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri,
  HSDGiaHan, NienHanBanDau, NienHanGiaHan, HienTrang, CapNhatMay, KichHoat
) VALUES (
  82, N'Hạ tầng & Camera', N'IP Camera',
  N'DASBN4431S-S3', NULL, NULL,
  NULL, NULL, NULL,
  NULL, N'Dec-22', N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL,
  NULL, N'Nov-25', NULL,
  N'Expired', NULL, N'Enabled',
  N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  CPU, RAM, HardDisk, PhongBan, Owner, ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri,
  HSDGiaHan, NienHanBanDau, NienHanGiaHan, HienTrang, CapNhatMay, KichHoat
) VALUES (
  83, N'Hạ tầng & Camera', N'IP Camera',
  N'DASBN4431S-S3', NULL, NULL,
  NULL, NULL, NULL,
  NULL, N'Dec-22', N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL,
  NULL, N'Nov-25', NULL,
  N'Expired', NULL, N'Enabled',
  N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  CPU, RAM, HardDisk, PhongBan, Owner, ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri,
  HSDGiaHan, NienHanBanDau, NienHanGiaHan, HienTrang, CapNhatMay, KichHoat
) VALUES (
  84, N'Hạ tầng & Camera', N'IP Camera',
  N'DASBN4431S-S3', NULL, NULL,
  NULL, NULL, NULL,
  NULL, N'Dec-22', N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL,
  NULL, N'Nov-25', NULL,
  N'Expired', NULL, N'Enabled',
  N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  CPU, RAM, HardDisk, PhongBan, Owner, ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri,
  HSDGiaHan, NienHanBanDau, NienHanGiaHan, HienTrang, CapNhatMay, KichHoat
) VALUES (
  85, N'Hạ tầng & Camera', N'IP Camera',
  N'DASBN4431S-S3', NULL, NULL,
  NULL, NULL, NULL,
  NULL, N'Dec-22', N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL,
  NULL, N'Nov-25', NULL,
  N'Expired', NULL, N'Enabled',
  N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  CPU, RAM, HardDisk, PhongBan, Owner, ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri,
  HSDGiaHan, NienHanBanDau, NienHanGiaHan, HienTrang, CapNhatMay, KichHoat
) VALUES (
  86, N'Hạ tầng & Camera', N'IP Camera',
  N'DASBN4431S-S3', NULL, NULL,
  NULL, NULL, NULL,
  NULL, N'Dec-22', N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL,
  NULL, N'Nov-25', NULL,
  N'Expired', NULL, N'Enabled',
  N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  CPU, RAM, HardDisk, PhongBan, Owner, ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri,
  HSDGiaHan, NienHanBanDau, NienHanGiaHan, HienTrang, CapNhatMay, KichHoat
) VALUES (
  87, N'Hạ tầng & Camera', N'IP Camera',
  N'DASBN4431S-S3', NULL, NULL,
  NULL, NULL, NULL,
  NULL, N'Dec-22', N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL,
  NULL, N'Nov-25', NULL,
  N'Expired', NULL, N'Enabled',
  N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  CPU, RAM, HardDisk, PhongBan, Owner, ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri,
  HSDGiaHan, NienHanBanDau, NienHanGiaHan, HienTrang, CapNhatMay, KichHoat
) VALUES (
  88, N'Hạ tầng & Camera', N'IP Camera',
  N'DASBN4431S-S3', NULL, NULL,
  NULL, NULL, NULL,
  NULL, N'Dec-22', N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL,
  NULL, N'Nov-25', NULL,
  N'Expired', NULL, N'Enabled',
  N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  CPU, RAM, HardDisk, PhongBan, Owner, ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri,
  HSDGiaHan, NienHanBanDau, NienHanGiaHan, HienTrang, CapNhatMay, KichHoat
) VALUES (
  89, N'Hạ tầng & Camera', N'IP Camera',
  N'DASBN4431S-S3', NULL, NULL,
  NULL, NULL, NULL,
  NULL, N'Dec-22', N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL,
  NULL, N'Nov-25', NULL,
  N'Expired', NULL, N'Enabled',
  N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  CPU, RAM, HardDisk, PhongBan, Owner, ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri,
  HSDGiaHan, NienHanBanDau, NienHanGiaHan, HienTrang, CapNhatMay, KichHoat
) VALUES (
  90, N'Hạ tầng & Camera', N'IP Camera',
  N'DASBN4431S-S3', NULL, NULL,
  NULL, NULL, NULL,
  NULL, N'Dec-22', N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL,
  NULL, N'Nov-25', NULL,
  N'Expired', NULL, N'Enabled',
  N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  CPU, RAM, HardDisk, PhongBan, Owner, ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri,
  HSDGiaHan, NienHanBanDau, NienHanGiaHan, HienTrang, CapNhatMay, KichHoat
) VALUES (
  91, N'Hạ tầng & Camera', N'IP Camera',
  N'DASBN4431S-S3', NULL, NULL,
  NULL, NULL, NULL,
  NULL, N'Dec-22', N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL,
  NULL, N'Nov-25', NULL,
  N'Expired', NULL, N'Enabled',
  N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  CPU, RAM, HardDisk, PhongBan, Owner, ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri,
  HSDGiaHan, NienHanBanDau, NienHanGiaHan, HienTrang, CapNhatMay, KichHoat
) VALUES (
  92, N'Hạ tầng & Camera', N'IP Camera',
  N'DASBN4431S-S3', NULL, NULL,
  NULL, NULL, NULL,
  NULL, N'Dec-22', N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL,
  NULL, N'Nov-25', NULL,
  N'Expired', NULL, N'Enabled',
  N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  CPU, RAM, HardDisk, PhongBan, Owner, ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri,
  HSDGiaHan, NienHanBanDau, NienHanGiaHan, HienTrang, CapNhatMay, KichHoat
) VALUES (
  93, N'Hạ tầng & Camera', N'IP Camera',
  N'DASBN4431S-S3', NULL, NULL,
  NULL, NULL, NULL,
  NULL, N'Dec-22', N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL,
  NULL, N'Nov-25', NULL,
  N'Expired', NULL, N'Enabled',
  N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  CPU, RAM, HardDisk, PhongBan, Owner, ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri,
  HSDGiaHan, NienHanBanDau, NienHanGiaHan, HienTrang, CapNhatMay, KichHoat
) VALUES (
  94, N'Hạ tầng & Camera', N'IP Camera',
  N'DASBN4431S-S3', NULL, NULL,
  NULL, NULL, NULL,
  NULL, N'Dec-22', N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL,
  NULL, N'Nov-25', NULL,
  N'Expired', NULL, N'Enabled',
  N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  CPU, RAM, HardDisk, PhongBan, Owner, ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri,
  HSDGiaHan, NienHanBanDau, NienHanGiaHan, HienTrang, CapNhatMay, KichHoat
) VALUES (
  95, N'Hạ tầng & Camera', N'IP Camera',
  N'DASBN4431S-S3', NULL, NULL,
  NULL, NULL, NULL,
  NULL, N'Dec-22', N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL,
  NULL, N'Nov-25', NULL,
  N'Expired', NULL, N'Enabled',
  N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  CPU, RAM, HardDisk, PhongBan, Owner, ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri,
  HSDGiaHan, NienHanBanDau, NienHanGiaHan, HienTrang, CapNhatMay, KichHoat
) VALUES (
  96, N'Hạ tầng & Camera', N'IP Camera',
  N'DASBN4431S-S3', NULL, NULL,
  NULL, NULL, NULL,
  NULL, N'Dec-22', N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL,
  NULL, N'Nov-25', NULL,
  N'Expired', NULL, N'Enabled',
  N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  CPU, RAM, HardDisk, PhongBan, Owner, ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri,
  HSDGiaHan, NienHanBanDau, NienHanGiaHan, HienTrang, CapNhatMay, KichHoat
) VALUES (
  97, N'Hạ tầng & Camera', N'IP Camera',
  N'DASBN4431S-S3', NULL, NULL,
  NULL, NULL, NULL,
  NULL, N'Dec-22', N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL,
  NULL, N'Nov-25', NULL,
  N'Expired', NULL, N'Enabled',
  N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  CPU, RAM, HardDisk, PhongBan, Owner, ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri,
  HSDGiaHan, NienHanBanDau, NienHanGiaHan, HienTrang, CapNhatMay, KichHoat
) VALUES (
  98, N'Hạ tầng & Camera', N'IP Camera',
  N'DASBN4431S-S3', NULL, NULL,
  NULL, NULL, NULL,
  NULL, N'Dec-22', N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL,
  NULL, N'Nov-25', NULL,
  N'Expired', NULL, N'Enabled',
  N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  CPU, RAM, HardDisk, PhongBan, Owner, ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri,
  HSDGiaHan, NienHanBanDau, NienHanGiaHan, HienTrang, CapNhatMay, KichHoat
) VALUES (
  99, N'Hạ tầng & Camera', N'IP Camera',
  N'DASBN4431S-S3', NULL, NULL,
  NULL, NULL, NULL,
  NULL, N'Dec-22', N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL,
  NULL, N'Nov-25', NULL,
  N'Expired', NULL, N'Enabled',
  N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  CPU, RAM, HardDisk, PhongBan, Owner, ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri,
  HSDGiaHan, NienHanBanDau, NienHanGiaHan, HienTrang, CapNhatMay, KichHoat
) VALUES (
  100, N'Hạ tầng & Camera', N'IP Camera',
  N'DASBN4431S-S3', NULL, NULL,
  NULL, NULL, NULL,
  NULL, N'Dec-22', N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL,
  NULL, N'Nov-25', NULL,
  N'Expired', NULL, N'Enabled',
  N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  CPU, RAM, HardDisk, PhongBan, Owner, ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri,
  HSDGiaHan, NienHanBanDau, NienHanGiaHan, HienTrang, CapNhatMay, KichHoat
) VALUES (
  101, N'Hạ tầng & Camera', N'IP Camera',
  N'DASBN4431S-S3', NULL, NULL,
  NULL, NULL, NULL,
  NULL, N'Dec-22', N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL,
  NULL, N'Nov-25', NULL,
  N'Expired', NULL, N'Enabled',
  N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  CPU, RAM, HardDisk, PhongBan, Owner, ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri,
  HSDGiaHan, NienHanBanDau, NienHanGiaHan, HienTrang, CapNhatMay, KichHoat
) VALUES (
  102, N'Hạ tầng & Camera', N'IP Camera',
  N'DASBN4431S-S3', NULL, NULL,
  NULL, NULL, NULL,
  NULL, N'Dec-22', N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL,
  NULL, N'Nov-25', NULL,
  N'Expired', NULL, N'Enabled',
  N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  CPU, RAM, HardDisk, PhongBan, Owner, ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri,
  HSDGiaHan, NienHanBanDau, NienHanGiaHan, HienTrang, CapNhatMay, KichHoat
) VALUES (
  103, N'Hạ tầng & Camera', N'IP Camera',
  N'DASBN4431S-S3', NULL, NULL,
  NULL, NULL, NULL,
  NULL, N'Dec-22', N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL,
  NULL, N'Nov-25', NULL,
  N'Expired', NULL, N'Enabled',
  N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  CPU, RAM, HardDisk, PhongBan, Owner, ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri,
  HSDGiaHan, NienHanBanDau, NienHanGiaHan, HienTrang, CapNhatMay, KichHoat
) VALUES (
  104, N'Hạ tầng & Camera', N'IP Camera',
  N'DASBN4431S-S3', NULL, NULL,
  NULL, NULL, NULL,
  NULL, N'Dec-22', N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL,
  NULL, N'Nov-25', NULL,
  N'Expired', NULL, N'Enabled',
  N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  CPU, RAM, HardDisk, PhongBan, Owner, ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri,
  HSDGiaHan, NienHanBanDau, NienHanGiaHan, HienTrang, CapNhatMay, KichHoat
) VALUES (
  105, N'Hạ tầng & Camera', N'IP Camera',
  N'DASBN4431S-S3', NULL, NULL,
  NULL, NULL, NULL,
  NULL, N'Dec-22', N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL,
  NULL, N'Nov-25', NULL,
  N'Expired', NULL, N'Enabled',
  N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  CPU, RAM, HardDisk, PhongBan, Owner, ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri,
  HSDGiaHan, NienHanBanDau, NienHanGiaHan, HienTrang, CapNhatMay, KichHoat
) VALUES (
  106, N'Hạ tầng & Camera', N'IP Camera',
  N'DASBN4431S-S3', NULL, NULL,
  NULL, NULL, NULL,
  NULL, N'Dec-22', N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL,
  NULL, N'Nov-25', NULL,
  N'Expired', NULL, N'Enabled',
  N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  CPU, RAM, HardDisk, PhongBan, Owner, ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri,
  HSDGiaHan, NienHanBanDau, NienHanGiaHan, HienTrang, CapNhatMay, KichHoat
) VALUES (
  107, N'Hạ tầng & Camera', N'IP Camera',
  N'DASBN4431S-S3', NULL, NULL,
  NULL, NULL, NULL,
  NULL, N'Dec-22', N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL,
  NULL, N'Nov-25', NULL,
  N'Expired', NULL, N'Enabled',
  N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  CPU, RAM, HardDisk, PhongBan, Owner, ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri,
  HSDGiaHan, NienHanBanDau, NienHanGiaHan, HienTrang, CapNhatMay, KichHoat
) VALUES (
  108, N'Hạ tầng & Camera', N'IP Camera',
  N'DASBN4431S-S3', NULL, NULL,
  NULL, NULL, NULL,
  NULL, N'Dec-22', N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL,
  NULL, N'Nov-25', NULL,
  N'Expired', NULL, N'Enabled',
  N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  CPU, RAM, HardDisk, PhongBan, Owner, ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri,
  HSDGiaHan, NienHanBanDau, NienHanGiaHan, HienTrang, CapNhatMay, KichHoat
) VALUES (
  109, N'Hạ tầng & Camera', N'IP Camera',
  N'DASBN4431S-S3', NULL, NULL,
  NULL, NULL, NULL,
  NULL, N'Dec-22', N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL,
  NULL, N'Nov-25', NULL,
  N'Expired', NULL, N'Enabled',
  N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  CPU, RAM, HardDisk, PhongBan, Owner, ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri,
  HSDGiaHan, NienHanBanDau, NienHanGiaHan, HienTrang, CapNhatMay, KichHoat
) VALUES (
  110, N'Hạ tầng & Camera', N'IP Camera',
  N'DASBN4431S-S3', NULL, NULL,
  NULL, NULL, NULL,
  NULL, N'Dec-22', N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL,
  NULL, N'Nov-25', NULL,
  N'Expired', NULL, N'Enabled',
  N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  CPU, RAM, HardDisk, PhongBan, Owner, ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri,
  HSDGiaHan, NienHanBanDau, NienHanGiaHan, HienTrang, CapNhatMay, KichHoat
) VALUES (
  111, N'Hạ tầng & Camera', N'IP Camera',
  N'DASBN4431S-S3', NULL, NULL,
  NULL, NULL, NULL,
  NULL, N'Dec-22', N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL,
  NULL, N'Nov-25', NULL,
  N'Expired', NULL, N'Enabled',
  N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  CPU, RAM, HardDisk, PhongBan, Owner, ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri,
  HSDGiaHan, NienHanBanDau, NienHanGiaHan, HienTrang, CapNhatMay, KichHoat
) VALUES (
  112, N'Hạ tầng & Camera', N'IP Camera',
  N'DASBN4431S-S3', NULL, NULL,
  NULL, NULL, NULL,
  NULL, N'Dec-22', N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL,
  NULL, N'Nov-25', NULL,
  N'Expired', NULL, N'Enabled',
  N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  CPU, RAM, HardDisk, PhongBan, Owner, ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri,
  HSDGiaHan, NienHanBanDau, NienHanGiaHan, HienTrang, CapNhatMay, KichHoat
) VALUES (
  113, N'Hạ tầng & Camera', N'IP Camera',
  N'DASBN4431S-S3', NULL, NULL,
  NULL, NULL, NULL,
  NULL, N'Dec-22', N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL,
  NULL, N'Nov-25', NULL,
  N'Expired', NULL, N'Enabled',
  N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  CPU, RAM, HardDisk, PhongBan, Owner, ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri,
  HSDGiaHan, NienHanBanDau, NienHanGiaHan, HienTrang, CapNhatMay, KichHoat
) VALUES (
  114, N'Hạ tầng & Camera', N'IP Camera',
  N'DASBN4431S-S3', NULL, NULL,
  NULL, NULL, NULL,
  NULL, N'Dec-22', N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL,
  NULL, N'Nov-25', NULL,
  N'Expired', NULL, N'Enabled',
  N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  CPU, RAM, HardDisk, PhongBan, Owner, ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri,
  HSDGiaHan, NienHanBanDau, NienHanGiaHan, HienTrang, CapNhatMay, KichHoat
) VALUES (
  115, N'Hạ tầng & Camera', N'IP Camera',
  N'DASBN4431S-S3', NULL, NULL,
  NULL, NULL, NULL,
  NULL, N'Dec-22', N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL,
  NULL, N'Nov-25', NULL,
  N'Expired', NULL, N'Enabled',
  N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  CPU, RAM, HardDisk, PhongBan, Owner, ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri,
  HSDGiaHan, NienHanBanDau, NienHanGiaHan, HienTrang, CapNhatMay, KichHoat
) VALUES (
  116, N'Hạ tầng & Camera', N'IP Camera',
  N'DASBN4431S-S3', NULL, NULL,
  NULL, NULL, NULL,
  NULL, N'Dec-22', N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL,
  NULL, N'Nov-25', NULL,
  N'Expired', NULL, N'Enabled',
  N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  CPU, RAM, HardDisk, PhongBan, Owner, ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri,
  HSDGiaHan, NienHanBanDau, NienHanGiaHan, HienTrang, CapNhatMay, KichHoat
) VALUES (
  117, N'Hạ tầng & Camera', N'IP Camera',
  N'DASBN4431S-S3', NULL, NULL,
  NULL, NULL, NULL,
  NULL, N'Dec-22', N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL,
  NULL, N'Nov-25', NULL,
  N'Expired', NULL, N'Enabled',
  N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  CPU, RAM, HardDisk, PhongBan, Owner, ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri,
  HSDGiaHan, NienHanBanDau, NienHanGiaHan, HienTrang, CapNhatMay, KichHoat
) VALUES (
  118, N'Hạ tầng & Camera', N'IP Camera',
  N'DASBN4431S-S3', NULL, NULL,
  NULL, NULL, NULL,
  NULL, N'Dec-22', N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL,
  NULL, N'Nov-25', NULL,
  N'Expired', NULL, N'Enabled',
  N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  CPU, RAM, HardDisk, PhongBan, Owner, ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri,
  HSDGiaHan, NienHanBanDau, NienHanGiaHan, HienTrang, CapNhatMay, KichHoat
) VALUES (
  119, N'Hạ tầng & Camera', N'IP Camera',
  N'DASBN4431S-S3', NULL, NULL,
  NULL, NULL, NULL,
  NULL, N'Dec-22', N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL,
  NULL, N'Nov-25', NULL,
  N'Expired', NULL, N'Enabled',
  N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  CPU, RAM, HardDisk, PhongBan, Owner, ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri,
  HSDGiaHan, NienHanBanDau, NienHanGiaHan, HienTrang, CapNhatMay, KichHoat
) VALUES (
  120, N'Hạ tầng & Camera', N'IP Camera',
  N'DASBN4431S-S3', NULL, NULL,
  NULL, NULL, NULL,
  NULL, N'Dec-22', N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL,
  NULL, N'Nov-25', NULL,
  N'Expired', NULL, N'Enabled',
  N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  CPU, RAM, HardDisk, PhongBan, Owner, ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri,
  HSDGiaHan, NienHanBanDau, NienHanGiaHan, HienTrang, CapNhatMay, KichHoat
) VALUES (
  121, N'Hạ tầng & Camera', N'IP Camera',
  N'DASBN4431S-S3', NULL, NULL,
  NULL, NULL, NULL,
  NULL, N'Dec-22', N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL,
  NULL, N'Nov-25', NULL,
  N'Expired', NULL, N'Enabled',
  N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  CPU, RAM, HardDisk, PhongBan, Owner, ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri,
  HSDGiaHan, NienHanBanDau, NienHanGiaHan, HienTrang, CapNhatMay, KichHoat
) VALUES (
  122, N'Hạ tầng & Camera', N'IP Camera',
  N'DASBN4431S-S3', NULL, NULL,
  NULL, NULL, NULL,
  NULL, N'Dec-22', N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL,
  NULL, N'Nov-25', NULL,
  N'Expired', NULL, N'Enabled',
  N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  CPU, RAM, HardDisk, PhongBan, Owner, ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri,
  HSDGiaHan, NienHanBanDau, NienHanGiaHan, HienTrang, CapNhatMay, KichHoat
) VALUES (
  123, N'Hạ tầng & Camera', N'IP Camera',
  N'DASBN4431S-S3', NULL, NULL,
  NULL, NULL, NULL,
  NULL, N'Dec-22', N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL,
  NULL, N'Nov-25', NULL,
  N'Expired', NULL, N'Enabled',
  N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  CPU, RAM, HardDisk, PhongBan, Owner, ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri,
  HSDGiaHan, NienHanBanDau, NienHanGiaHan, HienTrang, CapNhatMay, KichHoat
) VALUES (
  124, N'Hạ tầng & Camera', N'IP Camera',
  N'DASBN4431S-S3', NULL, NULL,
  NULL, NULL, NULL,
  NULL, N'Dec-22', N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL,
  NULL, N'Nov-25', NULL,
  N'Expired', NULL, N'Enabled',
  N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  CPU, RAM, HardDisk, PhongBan, Owner, ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri,
  HSDGiaHan, NienHanBanDau, NienHanGiaHan, HienTrang, CapNhatMay, KichHoat
) VALUES (
  125, N'Hạ tầng & Camera', N'IP Camera',
  N'DASBN4431S-S3', NULL, NULL,
  NULL, NULL, NULL,
  NULL, N'Dec-22', N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL,
  NULL, N'Nov-25', NULL,
  N'Expired', NULL, N'Enabled',
  N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  CPU, RAM, HardDisk, PhongBan, Owner, ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri,
  HSDGiaHan, NienHanBanDau, NienHanGiaHan, HienTrang, CapNhatMay, KichHoat
) VALUES (
  126, N'Hạ tầng & Camera', N'IP Camera',
  N'DASBN4431S-S3', NULL, NULL,
  NULL, NULL, NULL,
  NULL, N'Dec-22', N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL,
  NULL, N'Nov-25', NULL,
  N'Expired', NULL, N'Enabled',
  N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  CPU, RAM, HardDisk, PhongBan, Owner, ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri,
  HSDGiaHan, NienHanBanDau, NienHanGiaHan, HienTrang, CapNhatMay, KichHoat
) VALUES (
  127, N'Hạ tầng & Camera', N'IP Camera',
  N'DASBN4431S-S3', NULL, NULL,
  NULL, NULL, NULL,
  NULL, N'Dec-22', N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL,
  NULL, N'Nov-25', NULL,
  N'Expired', NULL, N'Enabled',
  N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  CPU, RAM, HardDisk, PhongBan, Owner, ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri,
  HSDGiaHan, NienHanBanDau, NienHanGiaHan, HienTrang, CapNhatMay, KichHoat
) VALUES (
  128, N'Hạ tầng & Camera', N'IP Camera',
  N'DASBN4431S-S3', NULL, NULL,
  NULL, NULL, NULL,
  NULL, N'Dec-22', N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL,
  NULL, N'Nov-25', NULL,
  N'Expired', NULL, N'Enabled',
  N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  CPU, RAM, HardDisk, PhongBan, Owner, ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri,
  HSDGiaHan, NienHanBanDau, NienHanGiaHan, HienTrang, CapNhatMay, KichHoat
) VALUES (
  129, N'Hạ tầng & Camera', N'IP Camera',
  N'DASBN4431S-S3', NULL, NULL,
  NULL, NULL, NULL,
  NULL, N'Dec-22', N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL,
  NULL, N'Nov-25', NULL,
  N'Expired', NULL, N'Enabled',
  N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  CPU, RAM, HardDisk, PhongBan, Owner, ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri,
  HSDGiaHan, NienHanBanDau, NienHanGiaHan, HienTrang, CapNhatMay, KichHoat
) VALUES (
  130, N'Hạ tầng & Camera', N'IP Camera',
  N'DASBN4431S-S3', NULL, NULL,
  NULL, NULL, NULL,
  NULL, N'Dec-22', N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL,
  NULL, N'Nov-25', NULL,
  N'Expired', NULL, N'Enabled',
  N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  CPU, RAM, HardDisk, PhongBan, Owner, ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri,
  HSDGiaHan, NienHanBanDau, NienHanGiaHan, HienTrang, CapNhatMay, KichHoat
) VALUES (
  131, N'Hạ tầng & Camera', N'IP Camera',
  N'DASBN4431S-S3', NULL, NULL,
  NULL, NULL, NULL,
  NULL, N'Dec-22', N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL,
  NULL, N'Nov-25', NULL,
  N'Expired', NULL, N'Enabled',
  N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  CPU, RAM, HardDisk, PhongBan, Owner, ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri,
  HSDGiaHan, NienHanBanDau, NienHanGiaHan, HienTrang, CapNhatMay, KichHoat
) VALUES (
  132, N'Hạ tầng & Camera', N'IP Camera',
  N'DASBN4431S-S3', NULL, NULL,
  NULL, NULL, NULL,
  NULL, N'Dec-22', N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL,
  NULL, N'Nov-25', NULL,
  N'Expired', NULL, N'Enabled',
  N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  CPU, RAM, HardDisk, PhongBan, Owner, ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri,
  HSDGiaHan, NienHanBanDau, NienHanGiaHan, HienTrang, CapNhatMay, KichHoat
) VALUES (
  133, N'Hạ tầng & Camera', N'IP Camera',
  N'DASBN4431S-S3', NULL, NULL,
  NULL, NULL, NULL,
  NULL, N'Dec-22', N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL,
  NULL, N'Nov-25', NULL,
  N'Expired', NULL, N'Enabled',
  N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  CPU, RAM, HardDisk, PhongBan, Owner, ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri,
  HSDGiaHan, NienHanBanDau, NienHanGiaHan, HienTrang, CapNhatMay, KichHoat
) VALUES (
  134, N'Hạ tầng & Camera', N'IP Camera',
  N'DASBN4431S-S3', NULL, NULL,
  NULL, NULL, NULL,
  NULL, N'Dec-22', N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL,
  NULL, N'Nov-25', NULL,
  N'Expired', NULL, N'Enabled',
  N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  CPU, RAM, HardDisk, PhongBan, Owner, ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri,
  HSDGiaHan, NienHanBanDau, NienHanGiaHan, HienTrang, CapNhatMay, KichHoat
) VALUES (
  135, N'Hạ tầng & Camera', N'IP Camera',
  N'DASBN4431S-S3', NULL, NULL,
  NULL, NULL, NULL,
  NULL, N'Dec-22', N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL,
  NULL, N'Nov-25', NULL,
  N'Expired', NULL, N'Enabled',
  N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  CPU, RAM, HardDisk, PhongBan, Owner, ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri,
  HSDGiaHan, NienHanBanDau, NienHanGiaHan, HienTrang, CapNhatMay, KichHoat
) VALUES (
  136, N'Hạ tầng & Camera', N'IP Camera',
  N'DASBN4431S-S3', NULL, NULL,
  NULL, NULL, NULL,
  NULL, N'Dec-22', N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL,
  NULL, N'Nov-25', NULL,
  N'Expired', NULL, N'Enabled',
  N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  CPU, RAM, HardDisk, PhongBan, Owner, ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri,
  HSDGiaHan, NienHanBanDau, NienHanGiaHan, HienTrang, CapNhatMay, KichHoat
) VALUES (
  137, N'Hạ tầng & Camera', N'IP Camera',
  N'DASBN4431S-S3', NULL, NULL,
  NULL, NULL, NULL,
  NULL, N'Dec-22', N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL,
  NULL, N'Nov-25', NULL,
  N'Expired', NULL, N'Enabled',
  N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  CPU, RAM, HardDisk, PhongBan, Owner, ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri,
  HSDGiaHan, NienHanBanDau, NienHanGiaHan, HienTrang, CapNhatMay, KichHoat
) VALUES (
  138, N'Hạ tầng & Camera', N'IP Camera',
  N'DASBN4431S-S3', NULL, NULL,
  NULL, NULL, NULL,
  NULL, N'Dec-22', N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL,
  NULL, N'Nov-25', NULL,
  N'Expired', NULL, N'Enabled',
  N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  CPU, RAM, HardDisk, PhongBan, Owner, ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri,
  HSDGiaHan, NienHanBanDau, NienHanGiaHan, HienTrang, CapNhatMay, KichHoat
) VALUES (
  139, N'Hạ tầng & Camera', N'Máy chấm công',
  NULL, NULL, NULL,
  NULL, NULL, NULL,
  NULL, NULL, NULL,
  NULL, NULL, NULL,
  NULL, N'Dec-02', NULL,
  N'Expired', NULL, N'Enabled',
  N'Enabled'
);
PRINT N'-> Da import 139 thiet bi Nhom [Thiết bị mạng, Máy chủ, Camera].';

-- 1.3 Nhập 23 Máy in & Photocopy
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, IPAddress, PhongBan, HienTrang, KichHoat
) VALUES (
  1, N'Máy in & Photocopy', N'Photocopy',
  N'TOSHIBA e-STUDIO456-07405618', N'10.0.32.38', N'HR&IT',
  N'In Use', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, IPAddress, PhongBan, HienTrang, KichHoat
) VALUES (
  2, N'Máy in & Photocopy', N'Printer',
  N'Canon MF260dw II', N'10.0.32.39', N'Purchasing',
  N'In Use', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, IPAddress, PhongBan, HienTrang, KichHoat
) VALUES (
  3, N'Máy in & Photocopy', N'Printer',
  N'HP LaserJet Color 252n', N'USB Connection', N'Commercial',
  N'Not Found', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, IPAddress, PhongBan, HienTrang, KichHoat
) VALUES (
  4, N'Máy in & Photocopy', N'Printer',
  N'HP LaserJet Pro MFP M127fw', N'10.0.32.40', N'Commercial',
  N'In Use', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, IPAddress, PhongBan, HienTrang, KichHoat
) VALUES (
  5, N'Máy in & Photocopy', N'Printer',
  N'HP LaserJet Pro MFP M227fdn', N'10.0.32.42', N'Application',
  N'In Use', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, IPAddress, PhongBan, HienTrang, KichHoat
) VALUES (
  6, N'Máy in & Photocopy', N'Printer',
  N'HP LaserJet Color 252n', N'10.0.32.43', N'Application',
  N'In Use', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, IPAddress, PhongBan, HienTrang, KichHoat
) VALUES (
  7, N'Máy in & Photocopy', N'Printer',
  N'Canon LBP 2900', N'USB Connection', N'RnD',
  N'In Use', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, IPAddress, PhongBan, HienTrang, KichHoat
) VALUES (
  8, N'Máy in & Photocopy', N'Printer',
  N'Canon Mf453dw', N'10.0.32.41', N'Flavor',
  N'In Use', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, IPAddress, PhongBan, HienTrang, KichHoat
) VALUES (
  9, N'Máy in & Photocopy', N'Printer',
  N'HP LaserJet 1212nf MFP', N'10.0.32.127', N'Flavor',
  N'In Use', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, IPAddress, PhongBan, HienTrang, KichHoat
) VALUES (
  10, N'Máy in & Photocopy', N'Printer',
  N'HP LaserJet Pro MFP 255dw', N'10.0.32.36', N'RnD - Floor 4',
  N'In Use', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, IPAddress, PhongBan, HienTrang, KichHoat
) VALUES (
  11, N'Máy in & Photocopy', N'Printer',
  N'Canon ImageClass MFP 247dw', N'192.168.10.5', N'Lab',
  N'In Use', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, IPAddress, PhongBan, HienTrang, KichHoat
) VALUES (
  12, N'Máy in & Photocopy', N'Printer',
  N'HP LaserJet Pro M404dn', N'192.168.10.6', N'QLSX',
  N'In Use', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, IPAddress, PhongBan, HienTrang, KichHoat
) VALUES (
  13, N'Máy in & Photocopy', N'Printer',
  N'Brother 2701D', N'USB Connection', N'Cont QM',
  N'In Use', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, IPAddress, PhongBan, HienTrang, KichHoat
) VALUES (
  14, N'Máy in & Photocopy', N'Printer',
  N'Canon LBP 2901', N'USB Connection', N'Delivery',
  N'In Use', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, IPAddress, PhongBan, HienTrang, KichHoat
) VALUES (
  15, N'Máy in & Photocopy', N'Printer',
  N'HP Laserjet 225jw', N'192.168.10.15', N'WH & Planning',
  N'In Use', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, IPAddress, PhongBan, HienTrang, KichHoat
) VALUES (
  16, N'Máy in & Photocopy', N'Printer',
  N'TOSHIBA e-STUDIO5018A', N'192.168.10.7', N'Administration',
  N'In Use', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, IPAddress, PhongBan, HienTrang, KichHoat
) VALUES (
  17, N'Máy in & Photocopy', N'Printer',
  N'Canon LBP 2900', N'USB Connection', N'Warehouse',
  N'In Use', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, IPAddress, PhongBan, HienTrang, KichHoat
) VALUES (
  18, N'Máy in & Photocopy', N'Printer',
  N'HP Laserjet P1566', N'USB Connection', N'Cont QM',
  N'In Use', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, IPAddress, PhongBan, HienTrang, KichHoat
) VALUES (
  19, N'Máy in & Photocopy', N'Printer',
  N'Canon LBP 3050', N'USB Connection', N'ME',
  N'In Use', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, IPAddress, PhongBan, HienTrang, KichHoat
) VALUES (
  20, N'Máy in & Photocopy', N'Printer',
  N'HP M402 PCL6', N'192.168.10.8', N'Phòng cân',
  N'In Use', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, IPAddress, PhongBan, HienTrang, KichHoat
) VALUES (
  21, N'Máy in & Photocopy', N'Printer',
  N'HP LASETJET PRO M501', N'USB Connection', N'Phòng công cụ dụng cụ',
  N'In Use', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, IPAddress, PhongBan, HienTrang, KichHoat
) VALUES (
  22, N'Máy in & Photocopy', N'Printer',
  NULL, N'192.168.4.5', N'Danh - Chung Sức',
  N'In Use', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, IPAddress, PhongBan, HienTrang, KichHoat
) VALUES (
  23, N'Máy in & Photocopy', N'Printer',
  N'Godex EZ530+ in nhãn', N'192.168.10.12', N'QM',
  N'In Use', N'Enabled'
);
PRINT N'-> Da import 23 thiet bi Nhom [Máy in & Photocopy].';

-- 2. Nhập 9 lượt Lịch sử điều chuyển & Nhật ký bảo trì
DELETE FROM dbo.LichSuDieuChuyen;
DELETE FROM dbo.NhatKyBaoTri;
INSERT INTO dbo.LichSuDieuChuyen (
  STT, Ngay, LoaiHanhDong, ThietBi_STT, ThietBi_Model, ThietBi_Serial,
  ChiTiet, PhongBan_Cu, PhongBan_Moi, Owner_Cu, Owner_Moi, ChiPhi, NguoiThucHien, Nguon
) VALUES (
  1, N'11:29:49 21/7/2026', N'Lưu kho',
  1, N'HP 340S G7 Notebook PC', N'5CD1131WHJ',
  N'Chuyển sang lưu kho', N'Commnercial', N'Kho',
  N'Bùi Ngọc Minh Trang', NULL, NULL,
  NULL, N'ThietBi'
);
INSERT INTO dbo.LichSuDieuChuyen (
  STT, Ngay, LoaiHanhDong, ThietBi_STT, ThietBi_Model, ThietBi_Serial,
  ChiTiet, PhongBan_Cu, PhongBan_Moi, Owner_Cu, Owner_Moi, ChiPhi, NguoiThucHien, Nguon
) VALUES (
  2, N'11:47:34 21/7/2026', N'Lưu kho',
  1, N'HP 340S G7 Notebook PC', N'5CD1131WHJ',
  N'Chuyển sang lưu kho', N'Commnercial', N'Kho',
  N'Bùi Ngọc Minh Trang', NULL, NULL,
  NULL, N'ThietBi'
);
INSERT INTO dbo.LichSuDieuChuyen (
  STT, Ngay, LoaiHanhDong, ThietBi_STT, ThietBi_Model, ThietBi_Serial,
  ChiTiet, PhongBan_Cu, PhongBan_Moi, Owner_Cu, Owner_Moi, ChiPhi, NguoiThucHien, Nguon
) VALUES (
  3, N'11:47:52 21/7/2026', N'Bàn giao',
  1, N'HP 340S G7 Notebook PC', N'5CD1131WHJ',
  N'Bàn giao sang RnD/Lê Thị Như Mỹ', N'Commnercial', N'RnD',
  N'Bùi Ngọc Minh Trang', N'Lê Thị Như Mỹ', NULL,
  NULL, N'ThietBi'
);
INSERT INTO dbo.LichSuDieuChuyen (
  STT, Ngay, LoaiHanhDong, ThietBi_STT, ThietBi_Model, ThietBi_Serial,
  ChiTiet, PhongBan_Cu, PhongBan_Moi, Owner_Cu, Owner_Moi, ChiPhi, NguoiThucHien, Nguon
) VALUES (
  4, N'11:49:24 21/7/2026', N'Sửa chữa',
  1, N'HP 340S G7 Notebook PC', N'5CD1131WHJ',
  N'Sửa màn hình', N'RnD', N'RnD',
  N'Lê Thị Như Mỹ', N'Lê Thị Như Mỹ', N'700000',
  NULL, N'ThietBi'
);
INSERT INTO dbo.NhatKyBaoTri (
  SerialNumber, Model, LoaiHanhDong, ChiTiet, PhongBan, Owner, ChiPhi, NguoiThucHien
) VALUES (
  N'5CD1131WHJ', N'HP 340S G7 Notebook PC', N'Sửa chữa',
  N'Sửa màn hình', N'RnD',
  N'Lê Thị Như Mỹ', 700000, NULL
);
INSERT INTO dbo.LichSuDieuChuyen (
  STT, Ngay, LoaiHanhDong, ThietBi_STT, ThietBi_Model, ThietBi_Serial,
  ChiTiet, PhongBan_Cu, PhongBan_Moi, Owner_Cu, Owner_Moi, ChiPhi, NguoiThucHien, Nguon
) VALUES (
  5, N'11:53:21 21/7/2026', N'Bàn giao',
  1, N'HP 340S G7 Notebook PC', N'5CD1131WHJ',
  N'Bàn giao sang RnD/Bùi Ngọc Vân Trang', N'RnD', N'RnD',
  N'Lê Thị Như Mỹ', N'Bùi Ngọc Vân Trang', NULL,
  NULL, N'ThietBi'
);
INSERT INTO dbo.LichSuDieuChuyen (
  STT, Ngay, LoaiHanhDong, ThietBi_STT, ThietBi_Model, ThietBi_Serial,
  ChiTiet, PhongBan_Cu, PhongBan_Moi, Owner_Cu, Owner_Moi, ChiPhi, NguoiThucHien, Nguon
) VALUES (
  6, N'16:01:59 22/7/2026', N'Bàn giao',
  21, N'HP Pavilion 14 Laptop PC 14-dv2000 (4Z018AV)', N'5CD2379SYH',
  N'Chuyển máy cho Duy, Anh Đạt đã có máy mới', N'HR&IT', N'HR&IT',
  N'Nguyễn Thành Đạt', N'Nguyễn Hoàng Khánh Duy', NULL,
  NULL, N'ThietBi'
);
INSERT INTO dbo.LichSuDieuChuyen (
  STT, Ngay, LoaiHanhDong, ThietBi_STT, ThietBi_Model, ThietBi_Serial,
  ChiTiet, PhongBan_Cu, PhongBan_Moi, Owner_Cu, Owner_Moi, ChiPhi, NguoiThucHien, Nguon
) VALUES (
  7, N'16:02:34 22/7/2026', N'Lưu kho',
  71, N'HP ProBook 440 G5 Notebook PC', N'5CD7486JZL',
  N'Duy đã đc bàn giao laptop mới của anh Đạt', N'HR&IT', N'Kho',
  N'Nguyễn Hoàng Khánh Duy', NULL, NULL,
  NULL, N'ThietBi'
);
INSERT INTO dbo.LichSuDieuChuyen (
  STT, Ngay, LoaiHanhDong, ThietBi_STT, ThietBi_Model, ThietBi_Serial,
  ChiTiet, PhongBan_Cu, PhongBan_Moi, Owner_Cu, Owner_Moi, ChiPhi, NguoiThucHien, Nguon
) VALUES (
  8, N'15:23:51 6/8/2026', N'Bàn giao',
  9, N'HP 340S G7 Notebook PC', N'5CD1080XKN',
  N'Bàn giao máy cho nhân viên mới', N'Application', N'Application',
  N'Laptop dùng chung', N'Phan Thị Tuyết Trinh', NULL,
  NULL, N'ThietBi'
);
INSERT INTO dbo.LichSuDieuChuyen (
  STT, Ngay, LoaiHanhDong, ThietBi_STT, ThietBi_Model, ThietBi_Serial,
  ChiTiet, PhongBan_Cu, PhongBan_Moi, Owner_Cu, Owner_Moi, ChiPhi, NguoiThucHien, Nguon
) VALUES (
  9, N'13:02:44 28/8/2026', N'Lưu kho',
  92, N'Hp Pavillion 14', NULL,
  N'Chị Thủy không có dùng nữa', N'HR&IT', N'Kho',
  N'Đinh Thị Thủy', NULL, NULL,
  NULL, N'ThietBi'
);
DELETE FROM dbo.License;
INSERT INTO dbo.License (
  STT, DeviceID, Owner, PhongBan, ActiveAccount, DomainMail, LocalDomain, KichHoat
) VALUES (
  1, N'5CD2379SYH', N'Nguyễn Thành Đạt',
  N'HR&IT', N'helpdesk01@hlnltphoanganh.onmicrosoft.com', N'dat.nguyent@hoanganh.com.vn',
  N'dat.nguyent', N'Enabled'
);
INSERT INTO dbo.License (
  STT, DeviceID, Owner, PhongBan, ActiveAccount, DomainMail, LocalDomain, KichHoat
) VALUES (
  2, N'5CD0128N5G', N'Nguyễn Xuân Sơn',
  N'HR&IT', N'helpdesk09@hlnltphoanganh.onmicrosoft.com', N'son.nguyenx@hoanganh.com.vn',
  N'son.nguyenx', N'Enable'
);
INSERT INTO dbo.License (
  STT, DeviceID, Owner, PhongBan, ActiveAccount, DomainMail, LocalDomain, KichHoat
) VALUES (
  3, N'5CD0378CDL', N'Trần Thị Phương Thanh',
  N'HR&IT', N'helpdesk01@hlnltphoanganh.onmicrosoft.com', N'thanh.trantp@hoanganh.com.vn',
  N'thanh.trantp', N'Enable'
);
INSERT INTO dbo.License (
  STT, DeviceID, Owner, PhongBan, ActiveAccount, DomainMail, LocalDomain, KichHoat
) VALUES (
  4, N'5CD922776X', N'Trần Hải Nhân',
  N'HR&IT', N'helpdesk01@hlnltphoanganh.onmicrosoft.com', N'nhan.tran@hoanganh.com.vn',
  N'nhan.tran', N'Enable'
);
INSERT INTO dbo.License (
  STT, DeviceID, Owner, PhongBan, ActiveAccount, DomainMail, LocalDomain, KichHoat
) VALUES (
  5, N'PC2A6LAG', N'Trịnh Thu Hằng',
  N'Finance & Accounting (F&A)', N'helpdesk01@hlnltphoanganh.onmicrosoft.com', N'hang.trinh@hoanganh.com.vn',
  N'hang.trinh', N'Enable'
);
INSERT INTO dbo.License (
  STT, DeviceID, Owner, PhongBan, ActiveAccount, DomainMail, LocalDomain, KichHoat
) VALUES (
  6, N'Dell Vostro', N'Lê Bảy',
  N'Procurment', N'helpdesk11@hlnltphoanganh.onmicrosoft.com', N'bay.le@hoanganh.com.vn',
  N'bay.le', N'Enabled'
);
INSERT INTO dbo.License (
  STT, DeviceID, Owner, PhongBan, ActiveAccount, DomainMail, LocalDomain, KichHoat
) VALUES (
  7, N'1R57R13', N'Huỳnh Thị Ái Diễm',
  N'Finance & Accounting (F&A)', N'helpdesk08@hlnltphoanganh.onmicrosoft.com', N'diem.huynhta@hoanganh.com.vn',
  N'diem.huynhta', N'Enable'
);
INSERT INTO dbo.License (
  STT, DeviceID, Owner, PhongBan, ActiveAccount, DomainMail, LocalDomain, KichHoat
) VALUES (
  8, N'5CD117JD29', N'Nguyễn Tấn Tỉnh',
  N'Finance & Accounting (F&A)', N'helpdesk09@hlnltphoanganh.onmicrosoft.com', N'tinh.nguyen@hoanganh.com.vn',
  N'tinh.nguyen', N'Enable'
);
INSERT INTO dbo.License (
  STT, DeviceID, Owner, PhongBan, ActiveAccount, DomainMail, LocalDomain, KichHoat
) VALUES (
  9, N'5CD9271S5M', N'Lê Thị Ánh Phúc',
  N'Procurment', N'helpdesk02@hlnltphoanganh.onmicrosoft.com', N'phuc.le@hoanganh.com.vn',
  N'phuc.le', N'Enable'
);
INSERT INTO dbo.License (
  STT, DeviceID, Owner, PhongBan, ActiveAccount, DomainMail, LocalDomain, KichHoat
) VALUES (
  10, N'5CD0466SVR', N'Nguyễn Thị Mỹ Duyên',
  N'Procurment', N'helpdesk03@hlnltphoanganh.onmicrosoft.com', N'duyen.nguyentm@hoanganh.com.vn',
  N'duyen.nguyentm', N'Enable'
);
INSERT INTO dbo.License (
  STT, DeviceID, Owner, PhongBan, ActiveAccount, DomainMail, LocalDomain, KichHoat
) VALUES (
  11, N'5CD1389YBG', N'Huỳnh Mạnh Cường',
  N'Commnercial', N'active02@hlnltphoanganh.onmicrosoft.com', N'cuong.huynh@hoanganh.com.vn',
  N'cuong.huynh', N'Enable'
);
INSERT INTO dbo.License (
  STT, DeviceID, Owner, PhongBan, ActiveAccount, DomainMail, LocalDomain, KichHoat
) VALUES (
  12, N'5CD822515W', N'Trần Lực',
  N'Flavors', N'helpdesk11@hlnltphoanganh.onmicrosoft.com', N'luc.tran@hoanganh.com.vn',
  N'luc.tran', N'Enable'
);
INSERT INTO dbo.License (
  STT, DeviceID, Owner, PhongBan, ActiveAccount, DomainMail, LocalDomain, KichHoat
) VALUES (
  13, N'SAMA', N'Phạm Thị Ngọc',
  N'Application', N'helpdesk08@hlnltphoanganh.onmicrosoft.com', N'ngoc.phamt@hoanganh.com.vn',
  N'ngoc.phamt', N'Enable'
);
INSERT INTO dbo.License (
  STT, DeviceID, Owner, PhongBan, ActiveAccount, DomainMail, LocalDomain, KichHoat
) VALUES (
  14, N'PC1AXXYL', N'Phan Thị Thuý',
  N'Application', N'helpdesk03@hlnltphoanganh.onmicrosoft.com', N'thuy.phant@hoanganh.com.vn',
  N'thuy.phant', N'Enable'
);
INSERT INTO dbo.License (
  STT, DeviceID, Owner, PhongBan, ActiveAccount, DomainMail, LocalDomain, KichHoat
) VALUES (
  15, N'5CD6217771', N'Nguyễn Thị Ngọc Nga',
  N'Application', N'helpdesk10@hlnltphoanganh.onmicrosoft.com', N'nga.nguyentn@hoanganh.com.vn',
  N'nga.nguyentn', N'Enable'
);
INSERT INTO dbo.License (
  STT, DeviceID, Owner, PhongBan, ActiveAccount, DomainMail, LocalDomain, KichHoat
) VALUES (
  16, N'5CD143H3YB', N'Nguyễn Thuý Thảo Duyên',
  N'Application', N'helpdesk05@hlnltphoanganh.onmicrosoft.com', N'duyen.nguyenthuythao@hoanganh.com.vn',
  N'duyen.nguyenthuythao', N'Enable'
);
INSERT INTO dbo.License (
  STT, DeviceID, Owner, PhongBan, ActiveAccount, DomainMail, LocalDomain, KichHoat
) VALUES (
  17, N'5CD1080XKN', N'Laptop Application',
  N'Application', N'helpdesk07@hlnltphoanganh.onmicrosoft.com', N'laptopapplication@hoanganh.com.vn',
  N'laptopapplication', N'Enable'
);
INSERT INTO dbo.License (
  STT, DeviceID, Owner, PhongBan, ActiveAccount, DomainMail, LocalDomain, KichHoat
) VALUES (
  18, N'5CD9105BTZ', N'Trương Lại Thuỳ An',
  N'RnD', N'helpdesk09@hlnltphoanganh.onmicrosoft.com', N'an.truong@hoanganh.com.vn',
  N'an.truong', N'Enable'
);
INSERT INTO dbo.License (
  STT, DeviceID, Owner, PhongBan, ActiveAccount, DomainMail, LocalDomain, KichHoat
) VALUES (
  19, N'5CD0466SX4', N'Nguyễn Thị Xíu',
  N'RnD', N'helpdesk09@hlnltphoanganh.onmicrosoft.com', N'xiu.nguyen@hoanganh.com.vn',
  N'xiu.nguyen', N'Enable'
);
INSERT INTO dbo.License (
  STT, DeviceID, Owner, PhongBan, ActiveAccount, DomainMail, LocalDomain, KichHoat
) VALUES (
  20, N'CND2023PRN', N'Phạm Thị Ngọc Trang',
  N'RnD', N'trang@tuvanfv.onmicrosoft.com', N'trang.pham@hoanganh.com.vn',
  N'trang.pham', N'Enable'
);
INSERT INTO dbo.License (
  STT, DeviceID, Owner, PhongBan, ActiveAccount, DomainMail, LocalDomain, KichHoat
) VALUES (
  21, N'CND148BGPR', N'Phạm Thị Chuyên',
  N'RnD', N'chuyen@tuvanfv.onmicrosoft.com', N'chuyen.pham@hoanganh.com.vn',
  N'chuyen.pham', N'Enable'
);
INSERT INTO dbo.License (
  STT, DeviceID, Owner, PhongBan, ActiveAccount, DomainMail, LocalDomain, KichHoat
) VALUES (
  22, N'5CD24314RP', N'Bùi Ngọc Vân Anh',
  N'RnD', N'vanh@tuvanfv.onmicrosoft.com', N'anh.bui@hoanganh.com.vn',
  N'anh.bui', N'Enable'
);
INSERT INTO dbo.License (
  STT, DeviceID, Owner, PhongBan, ActiveAccount, DomainMail, LocalDomain, KichHoat
) VALUES (
  23, N'5CD151GWK8', N'Bùi Ngọc Vân Chi',
  N'RnD', N'helpdesk04@hlnltphoanganh.onmicrosoft.com', N'chi.buinv@hoanganh.com.vn',
  N'chi.buinv', N'Enable'
);
INSERT INTO dbo.License (
  STT, DeviceID, Owner, PhongBan, ActiveAccount, DomainMail, LocalDomain, KichHoat
) VALUES (
  24, N'5CD0466SVN', N'Phạm Thị Vân Trang',
  N'RnD', N'vantrang@tuvanfv.onmicrosoft.com', N'vantrang.pham@hoanganh.com.vn',
  N'vantrang.pham', N'Enable'
);
INSERT INTO dbo.License (
  STT, DeviceID, Owner, PhongBan, ActiveAccount, DomainMail, LocalDomain, KichHoat
) VALUES (
  25, N'FBVKF32', N'Kha Tuyết Huệ',
  N'RnD', N'helpdesk05@hlnltphoanganh.onmicrosoft.com', N'hue.khat@hoanganh.com.vn',
  N'hue.khat', N'Enable'
);
INSERT INTO dbo.License (
  STT, DeviceID, Owner, PhongBan, ActiveAccount, DomainMail, LocalDomain, KichHoat
) VALUES (
  26, N'5CD62365R4', N'Trần Thị Thọ',
  N'RnD', N'helpdesk08@hlnltphoanganh.onmicrosoft.com', N'tho.trant@hoanganh.com.vn',
  N'tho.trant', N'Enable'
);
INSERT INTO dbo.License (
  STT, DeviceID, Owner, PhongBan, ActiveAccount, DomainMail, LocalDomain, KichHoat
) VALUES (
  27, N'24K2R33', N'RnD',
  N'Flavors', N'helpdesk04@hlnltphoanganh.onmicrosoft.com', N'tram.mactn@hoanganh.com.vn',
  N'tram.mactn', N'Disable'
);
INSERT INTO dbo.License (
  STT, DeviceID, Owner, PhongBan, ActiveAccount, DomainMail, LocalDomain, KichHoat
) VALUES (
  28, N'SAMA', N'Phòng Trưởng Ca',
  N'Production', N'helpdesk11@hlnltphoanganh.onmicrosoft.com', N'dung.nguyen@hoanganh.com.vn',
  N'lam.let', N'Enable'
);
INSERT INTO dbo.License (
  STT, DeviceID, Owner, PhongBan, ActiveAccount, DomainMail, LocalDomain, KichHoat
) VALUES (
  29, N'SAMA', N'Phòng Trưởng Ca',
  N'Production', N'helpdesk11@hlnltphoanganh.onmicrosoft.com', N'ngoc.ungd@hoanganh.com.vn',
  N'lam.let', N'Enable'
);
INSERT INTO dbo.License (
  STT, DeviceID, Owner, PhongBan, ActiveAccount, DomainMail, LocalDomain, KichHoat
) VALUES (
  30, N'SAMA', N'Phòng Trưởng Ca',
  N'Production', N'helpdesk11@hlnltphoanganh.onmicrosoft.com', N'khanh.nguyenp@hoanganh.com.vn',
  N'lam.let', N'Enable'
);
INSERT INTO dbo.License (
  STT, DeviceID, Owner, PhongBan, ActiveAccount, DomainMail, LocalDomain, KichHoat
) VALUES (
  31, N'SAMA', N'Lê Thị Kim Yến',
  N'Production', N'helpdesk05@hlnltphoanganh.onmicrosoft.com', N'tuan.maiv@hoanganh.com.vn',
  N'tuan.maiv', N'Enable'
);
INSERT INTO dbo.License (
  STT, DeviceID, Owner, PhongBan, ActiveAccount, DomainMail, LocalDomain, KichHoat
) VALUES (
  32, N'SAMA', N'Lê Bá Trình',
  N'Production', N'helpdesk05@hlnltphoanganh.onmicrosoft.com', N'trinh.leb@hoanganh.com.vn',
  N'trinh.leb', N'Enable'
);
INSERT INTO dbo.License (
  STT, DeviceID, Owner, PhongBan, ActiveAccount, DomainMail, LocalDomain, KichHoat
) VALUES (
  33, N'1RD6R13', N'Nguyễn Thị Ngọc Huyền',
  N'Production', N'helpdesk05@hlnltphoanganh.onmicrosoft.com', N'huyen.nguyentn@hoanganh.com.vn',
  N'du.phamt', N'Enable'
);
INSERT INTO dbo.License (
  STT, DeviceID, Owner, PhongBan, ActiveAccount, DomainMail, LocalDomain, KichHoat
) VALUES (
  34, N'GM03S1N6', N'Đào Minh Quý',
  N'Production', N'helpdesk05@hlnltphoanganh.onmicrosoft.com', N'mh.hp@hoanganh.com.vn',
  N'mh.hp', N'Enable'
);
INSERT INTO dbo.License (
  STT, DeviceID, Owner, PhongBan, ActiveAccount, DomainMail, LocalDomain, KichHoat
) VALUES (
  35, N'4915HY2', N'Lê Huyền Trân',
  N'Quality Management (QM)', N'helpdesk08@hlnltphoanganh.onmicrosoft.com', N'tran.leh@hoanganh.com.vn',
  N'tran.leh', N'Enable'
);
INSERT INTO dbo.License (
  STT, DeviceID, Owner, PhongBan, ActiveAccount, DomainMail, LocalDomain, KichHoat
) VALUES (
  36, N'5CD7486JZL', N'Nguyễn Ngọc Tuấn Anh',
  N'Production', N'helpdesk05@hlnltphoanganh.onmicrosoft.com', N'anh.nguyennt@hoanganh.com.vn',
  N'anh.nguyennt', N'Enable'
);
INSERT INTO dbo.License (
  STT, DeviceID, Owner, PhongBan, ActiveAccount, DomainMail, LocalDomain, KichHoat
) VALUES (
  37, N'SAMA', N'Phòng CCDC',
  N'Production', N'helpdesk04@hlnltphoanganh.onmicrosoft.com', N'mh.hp@hoanganh.com.vn',
  N'mh.hp', N'Enable'
);
INSERT INTO dbo.License (
  STT, DeviceID, Owner, PhongBan, ActiveAccount, DomainMail, LocalDomain, KichHoat
) VALUES (
  38, N'45B7HY2', N'Phòng cân - Nguyên liệu',
  N'Production', N'helpdesk04@hlnltphoanganh.onmicrosoft.com', N'mh.hp@hoanganh.com.vn',
  N'hp.cannguyenlieu', N'Enable'
);
INSERT INTO dbo.License (
  STT, DeviceID, Owner, PhongBan, ActiveAccount, DomainMail, LocalDomain, KichHoat
) VALUES (
  39, N'9HQP6Z2', N'Phòng Cân - Pha Loãng',
  N'Production', N'helpdesk04@hlnltphoanganh.onmicrosoft.com', N'mh.hp@hoanganh.com.vn',
  N'hp.cannguyenlieu', N'Enable'
);
INSERT INTO dbo.License (
  STT, DeviceID, Owner, PhongBan, ActiveAccount, DomainMail, LocalDomain, KichHoat
) VALUES (
  40, N'6WB50G3', N'Thượng Đình Phong',
  N'WH & Planning', N'helpdesk04@hlnltphoanganh.onmicrosoft.com', N'phong.thuong@hoanganh.com.vn',
  N'phong.thuong', N'Enable'
);
INSERT INTO dbo.License (
  STT, DeviceID, Owner, PhongBan, ActiveAccount, DomainMail, LocalDomain, KichHoat
) VALUES (
  41, N'SAMA', N'Võ Thị Hương SX',
  N'Quality Management (QM)', N'helpdesk11@hlnltphoanganh.onmicrosoft.com', N'huong.vo@hoanganh.com.vn',
  N'huong.vo', N'Enable'
);
INSERT INTO dbo.License (
  STT, DeviceID, Owner, PhongBan, ActiveAccount, DomainMail, LocalDomain, KichHoat
) VALUES (
  42, N'7VL4WV2', N'Võ Thị Hương Cont',
  N'Quality Management (QM)', N'helpdesk10@hlnltphoanganh.onmicrosoft.com', N'huong.vo@hoanganh.com.vn',
  N'huong.vo', N'Enable'
);
INSERT INTO dbo.License (
  STT, DeviceID, Owner, PhongBan, ActiveAccount, DomainMail, LocalDomain, KichHoat
) VALUES (
  43, N'5CG5313X8L', N'Nguyễn Thị Thu Thảo',
  N'Quality Management (QM)', N'helpdesk02@hlnltphoanganh.onmicrosoft.com', N'thao.nguyentt@hoanganh.com.vn',
  N'thao.nguyentt', N'Enable'
);
INSERT INTO dbo.License (
  STT, DeviceID, Owner, PhongBan, ActiveAccount, DomainMail, LocalDomain, KichHoat
) VALUES (
  44, N'5CD0456SWZ', N'Nguyễn Thị Thanh Thúy',
  N'Quality Management (QM)', N'helpdesk05@hlnltphoanganh.onmicrosoft.com', N'thuy.nguyentt@hoanganh.com.vn',
  N'thuy.nguyentt', N'Enable'
);
INSERT INTO dbo.License (
  STT, DeviceID, Owner, PhongBan, ActiveAccount, DomainMail, LocalDomain, KichHoat
) VALUES (
  45, N'5CD9312KQ9', N'Bùi Thị Phương Dung',
  N'Quality Management (QM)', N'helpdesk04@hlnltphoanganh.onmicrosoft.com', N'dung.buitp@hoanganh.com.vn',
  N'dung.buitp', N'Enable'
);
INSERT INTO dbo.License (
  STT, DeviceID, Owner, PhongBan, ActiveAccount, DomainMail, LocalDomain, KichHoat
) VALUES (
  46, N'CND2023PWH', N'Huỳnh Thị Thùy Linh',
  N'Quality Management (QM)', N'helpdesk10@hlnltphoanganh.onmicrosoft.com', N'linh.huynhtt@hoanganh.com.vn',
  N'linh.huynhtt', N'Enable'
);
INSERT INTO dbo.License (
  STT, DeviceID, Owner, PhongBan, ActiveAccount, DomainMail, LocalDomain, KichHoat
) VALUES (
  47, N'5CD143H4C4', N'Nguyễn Đông Nhu',
  N'Finance & Accounting (F&A)', N'helpdesk06@hlnltphoanganh.onmicrosoft.com', N'nhu.nguyen@hoanganh.com.vn',
  N'nhu.nguyen', N'Enable'
);
INSERT INTO dbo.License (
  STT, DeviceID, Owner, PhongBan, ActiveAccount, DomainMail, LocalDomain, KichHoat
) VALUES (
  48, N'5CD0128NCS', N'Nguyễn Tấn Phát',
  N'Process Engineer (PE)', N'helpdesk11@hlnltphoanganh.onmicrosoft.com', N'phat.nguyent@hoanganh.com.vn',
  N'phat.nguyent', N'Enable'
);
INSERT INTO dbo.License (
  STT, DeviceID, Owner, PhongBan, ActiveAccount, DomainMail, LocalDomain, KichHoat
) VALUES (
  49, N'5CD1131Y30', N'Nguyễn Hữu Thịnh',
  N'Maintenance Engineer (ME)', N'helpdesk05@hlnltphoanganh.onmicrosoft.com', N'thinh.nguyenh@hoanganh.com.vn',
  N'thinh.nguyenh', N'Enable'
);
INSERT INTO dbo.License (
  STT, DeviceID, Owner, PhongBan, ActiveAccount, DomainMail, LocalDomain, KichHoat
) VALUES (
  50, N'5CD0190Y5Y', N'Phạm Ngọc Thắng',
  N'Maintenance Engineer (ME)', N'helpdesk08@hlnltphoanganh.onmicrosoft.com', N'thang.phamn@hoanganh.com.vn',
  N'thang.phamn', N'Enable'
);
INSERT INTO dbo.License (
  STT, DeviceID, Owner, PhongBan, ActiveAccount, DomainMail, LocalDomain, KichHoat
) VALUES (
  51, N'5CD823C7B8', N'Lý Trường Sơn',
  N'Maintenance Engineer (ME)', N'helpdesk02@hlnltphoanganh.onmicrosoft.com', N'son.lyt@hoanganh.com.vn',
  N'son.lyt', N'Enable'
);
INSERT INTO dbo.License (
  STT, DeviceID, Owner, PhongBan, ActiveAccount, DomainMail, LocalDomain, KichHoat
) VALUES (
  52, N'Dell Vostro', N'Phùng Thanh Nhiều',
  N'Maintenance Engineer (ME)', N'helpdesk10@hlnltphoanganh.onmicrosoft.com', N'nhieu.phung@hoanganh.com.vn',
  N'nhieu.phung', N'Enable'
);
INSERT INTO dbo.License (
  STT, DeviceID, Owner, PhongBan, ActiveAccount, DomainMail, LocalDomain, KichHoat
) VALUES (
  53, N'5CG53018MS', N'Ngô Văn Quốc',
  N'Process Engineer (PE)', N'helpdesk09@hlnltphoanganh.onmicrosoft.com', N'quoc.ngov@hoanganh.com.vn',
  N'quoc.ngov', N'Enable'
);
INSERT INTO dbo.License (
  STT, DeviceID, Owner, PhongBan, ActiveAccount, DomainMail, LocalDomain, KichHoat
) VALUES (
  54, N'5CD0190WQ5', N'Đoàn Thị Ngọc',
  N'WH & Planning', N'helpdesk09@hlnltphoanganh.onmicrosoft.com', N'ngoc.doan@hoanganh.com.vn',
  N'ngoc.doan', N'Enable'
);
INSERT INTO dbo.License (
  STT, DeviceID, Owner, PhongBan, ActiveAccount, DomainMail, LocalDomain, KichHoat
) VALUES (
  55, N'2M99ZJ3', N'Trần Tiến Din',
  N'Project', N'helpdesk06@hlnltphoanganh.onmicrosoft.com', N'din.trant@hoanganh.com.vn',
  N'din.trant', N'Enable'
);
INSERT INTO dbo.License (
  STT, DeviceID, Owner, PhongBan, ActiveAccount, DomainMail, LocalDomain, KichHoat
) VALUES (
  56, N'8CG53240GZ', N'Đoàn Thị Ngọc',
  N'WH & Planning', N'helpdesk04@hlnltphoanganh.onmicrosoft.com', N'ngoc.doan@hoanganh.com.vn',
  N'ngoc.doan', N'Enable'
);
INSERT INTO dbo.License (
  STT, DeviceID, Owner, PhongBan, ActiveAccount, DomainMail, LocalDomain, KichHoat
) VALUES (
  57, N'5CD0190YSY', N'Nguyễn Trường An',
  N'WH & Planning', N'helpdesk11@hlnltphoanganh.onmicrosoft.com', N'an.nguyent@hoanganh.com.vn',
  N'an.nguyent', N'Enable'
);
INSERT INTO dbo.License (
  STT, DeviceID, Owner, PhongBan, ActiveAccount, DomainMail, LocalDomain, KichHoat
) VALUES (
  58, N'Desktop Think Centre Neo', N'Lê Huỳnh Giang',
  N'WH & Planning', N'helpdesk10@hlnltphoanganh.onmicrosoft.com', N'giang.leh@hoanganh.com.vn',
  N'giang.leh', N'Enable'
);
INSERT INTO dbo.License (
  STT, DeviceID, Owner, PhongBan, ActiveAccount, DomainMail, LocalDomain, KichHoat
) VALUES (
  59, N'5CD0128NKZ', N'Lê Quang Bình',
  N'Delivery', N'helpdesk10@hlnltphoanganh.onmicrosoft.com', N'binh.leq@hoanganh.com.vn',
  N'binh.leq', N'Enable'
);
INSERT INTO dbo.License (
  STT, DeviceID, Owner, PhongBan, ActiveAccount, DomainMail, LocalDomain, KichHoat
) VALUES (
  60, N'Dell Vostro', N'Nguyễn Quang Liêm',
  N'Quality Management (QM)', N'helpdesk02@hlnltphoanganh.onmicrosoft.com', N'liem.nguyenq@hoanganh.com.vn',
  N'liem.nguyenq', N'Enable'
);
INSERT INTO dbo.License (
  STT, DeviceID, Owner, PhongBan, ActiveAccount, DomainMail, LocalDomain, KichHoat
) VALUES (
  61, N'Dell Vostro', N'Nguyễn Quốc Cường',
  N'Quality Management (QM)', N'helpdesk10@hlnltphoanganh.onmicrosoft.com', N'cuong.nguyenq@hoanganh.com.vn',
  N'cuong.nguyenq', N'Enable'
);
INSERT INTO dbo.License (
  STT, DeviceID, Owner, PhongBan, ActiveAccount, DomainMail, LocalDomain, KichHoat
) VALUES (
  62, N'Dell Vostro', N'Huỳnh Nguyễn Tấn Thành',
  N'Quality Management (QM)', N'helpdesk11@hlnltphoanganh.onmicrosoft.com', N'thanh.nguyenht@hoanganh.com.vn',
  N'thanh.nguyenht', N'Enable'
);
INSERT INTO dbo.License (
  STT, DeviceID, Owner, PhongBan, ActiveAccount, DomainMail, LocalDomain, KichHoat
) VALUES (
  63, N'5CD905798S', N'Đào Minh Quý',
  N'Production', N'helpdesk08@hlnltphoanganh.onmicrosoft.com', N'quy.daom@hoanganh.com.vn',
  N'quy.daom', N'Enable'
);
INSERT INTO dbo.License (
  STT, DeviceID, Owner, PhongBan, ActiveAccount, DomainMail, LocalDomain, KichHoat
) VALUES (
  64, N'5CD7486JZL', NULL,
  N'Production', N'helpdesk05@hlnltphoanganh.onmicrosoft.com', NULL,
  N'prod.leader', N'Enable'
);
INSERT INTO dbo.License (
  STT, DeviceID, Owner, PhongBan, ActiveAccount, DomainMail, LocalDomain, KichHoat
) VALUES (
  65, N'5CD92274TV', NULL,
  N'Production', N'helpdesk11@hlnltphoanganh.onmicrosoft.com', NULL,
  N'trưởng ca', N'Enable'
);
INSERT INTO dbo.License (
  STT, DeviceID, Owner, PhongBan, ActiveAccount, DomainMail, LocalDomain, KichHoat
) VALUES (
  66, N'5CD1389YPD', N'Nguyễn Thị Lan Anh',
  N'Commnercial', N'helpdesk05@hlnltphoanganh.onmicrosoft.com', N'anh.nguyentl@hoanganh.com.vn',
  N'anh.nguyentl', N'Enable'
);
INSERT INTO dbo.License (
  STT, DeviceID, Owner, PhongBan, ActiveAccount, DomainMail, LocalDomain, KichHoat
) VALUES (
  67, N'5CG13681KL', N'Nguyễn Ngọc Anh Thư',
  N'Commnercial', N'Active01@hlnltphoanganh.onmicrosoft.com', N'thu.nguyenna@hoanganh.com.vn',
  N'thu.nguyenna', N'Enable'
);
INSERT INTO dbo.License (
  STT, DeviceID, Owner, PhongBan, ActiveAccount, DomainMail, LocalDomain, KichHoat
) VALUES (
  68, N'5CG147C3RG', N'Huỳnh Nguyễn Hồng Hạnh',
  N'Commnercial', N'Active01@hlnltphoanganh.onmicrosoft.com', N'hanh.huynhnh@hoanganh.com.vn',
  N'hanh.huynhnh', N'Enable'
);
INSERT INTO dbo.License (
  STT, DeviceID, Owner, PhongBan, ActiveAccount, DomainMail, LocalDomain, KichHoat
) VALUES (
  69, N'5CD1389YBG', N'Mai Thị Thảo',
  N'Commnercial', N'Active01@hlnltphoanganh.onmicrosoft.com', N'thao.mait@hoanganh.com.vn',
  N'thao.mait', N'Enable'
);
INSERT INTO dbo.License (
  STT, DeviceID, Owner, PhongBan, ActiveAccount, DomainMail, LocalDomain, KichHoat
) VALUES (
  70, N'5CD0190WQ5', N'Nguyễn Thị Ngọc Khuê',
  N'Commnercial', N'Active01@hlnltphoanganh.onmicrosoft.com', N'khue.nguyentn@@hoanganh.com.vn',
  N'khue.nguyentn', N'Enable'
);
INSERT INTO dbo.License (
  STT, DeviceID, Owner, PhongBan, ActiveAccount, DomainMail, LocalDomain, KichHoat
) VALUES (
  71, N'5CG20413T4', N'Võ Ngọc Hà',
  N'Commnercial', N'Active01@hlnltphoanganh.onmicrosoft.com', N'ha.von@@hoanganh.com.vn',
  N'ha.von', N'Enable'
);
INSERT INTO dbo.License (
  STT, DeviceID, Owner, PhongBan, ActiveAccount, DomainMail, LocalDomain, KichHoat
) VALUES (
  72, N'8CG5513YS8', N'Lê Đức Huy',
  N'Operation Director', N'helpdesk09@hlnltphoanganh.onmicrosoft.com', N'huy.led@hoanganh.com.vn',
  N'huy.led', N'Enable'
);
INSERT INTO dbo.License (
  STT, DeviceID, Owner, PhongBan, ActiveAccount, DomainMail, LocalDomain, KichHoat
) VALUES (
  73, N'5CD2106VMK', N'Bùi Hoàng Hà',
  N'Commnercial', N'Active01@hlnltphoanganh.onmicrosoft.com', N'ha.buih@hoanganh.com.vn',
  N'ha.buih', N'Enable'
);
INSERT INTO dbo.License (
  STT, DeviceID, Owner, PhongBan, ActiveAccount, DomainMail, LocalDomain, KichHoat
) VALUES (
  74, N'5CD2106VFF', N'Trần Ngọc Tấn',
  N'Commnercial', N'active02@hlnltphoanganh.onmicrosoft.com', N'tan.trann@hoanganh.com.vn',
  N'tan.trann', N'Enable'
);
INSERT INTO dbo.License (
  STT, DeviceID, Owner, PhongBan, ActiveAccount, DomainMail, LocalDomain, KichHoat
) VALUES (
  75, N'5CD9523X88', N'Phạm Nhật Minh Giang',
  N'Commnercial', N'Active01@hlnltphoanganh.onmicrosoft.com', N'giang.phamnm@hoanganh.com.vn',
  N'giang.phamnm', N'Enable'
);
INSERT INTO dbo.License (
  STT, DeviceID, Owner, PhongBan, ActiveAccount, DomainMail, LocalDomain, KichHoat
) VALUES (
  76, N'Dell Vostro', N'Phòng cân',
  N'Phòng cân', N'helpdesk10@hlnltphoanganh.onmicrosoft.com', N'Phòng cân',
  N'Phòng cân', N'Enable'
);
INSERT INTO dbo.License (
  STT, DeviceID, Owner, PhongBan, ActiveAccount, DomainMail, LocalDomain, KichHoat
) VALUES (
  77, N'SAMA', N'Phòng công cụ dụng cụ',
  N'Phòng công cụ dụng cụ', N'helpdesk11@hlnltphoanganh.onmicrosoft.com', N'Phòng công cụ dụng cụ',
  N'Phòng công cụ dụng cụ', N'Enable'
);
INSERT INTO dbo.License (
  STT, DeviceID, Owner, PhongBan, ActiveAccount, DomainMail, LocalDomain, KichHoat
) VALUES (
  78, N'Dell Vostro', N'Nguyễn Minh Khôi',
  N'Quality Management (QM)', N'helpdesk10@hlnltphoanganh.onmicrosoft.com', N'khoi.nguyenm@hoanganh.com.vn',
  N'khoi.nguyenm', N'Enable'
);
INSERT INTO dbo.License (
  STT, DeviceID, Owner, PhongBan, ActiveAccount, DomainMail, LocalDomain, KichHoat
) VALUES (
  79, N'Lenovo', N'Nguyễn Thị Lan',
  N'Quality Management (QM)', N'helpdesk03@hlnltphoanganh.onmicrosoft.com', N'lan.nguyent@hoanganh.com.vn',
  N'lan.nguyent', N'Enable'
);
INSERT INTO dbo.License (
  STT, DeviceID, Owner, PhongBan, ActiveAccount, DomainMail, LocalDomain, KichHoat
) VALUES (
  80, N'8CG5313FLX', N'Yuya Hamasaki',
  N'BOM', N'yuya_hamasaki@hoanganh.com.vn', N'yuya_hamasaki@hoanganh.com.vn',
  N'yuya_hamasaki', N'Enable'
);
INSERT INTO dbo.License (
  STT, DeviceID, Owner, PhongBan, ActiveAccount, DomainMail, LocalDomain, KichHoat
) VALUES (
  81, N'6C4B0T2', N'Nguyễn Thị Minh Thùy',
  N'Application', N'helpdesk11@hlnltphoanganh.onmicrosoft.com', N'thuy.nguyentm@hoanganh.com.vn',
  N'thuy.nguyentm', N'Enable'
);
INSERT INTO dbo.License (
  STT, DeviceID, Owner, PhongBan, ActiveAccount, DomainMail, LocalDomain, KichHoat
) VALUES (
  82, N'Dell Vostro', N'Huỳnh Ngọc Mạnh',
  N'Application', N'helpdesk10@hlnltphoanganh.onmicrosoft.com', N'manh.huynhn@hoanganh.com.vn',
  N'manh.huynhn', N'Enable'
);
INSERT INTO dbo.License (
  STT, DeviceID, Owner, PhongBan, ActiveAccount, DomainMail, LocalDomain, KichHoat
) VALUES (
  83, N'SAMA', N'Nguyễn Ngọc Bảo Trân',
  N'Application', N'helpdesk10@hlnltphoanganh.onmicrosoft.com', N'tran.nguyenb@hoanganh.com.vn',
  N'tran.nguyenb', N'Enable'
);
INSERT INTO dbo.License (
  STT, DeviceID, Owner, PhongBan, ActiveAccount, DomainMail, LocalDomain, KichHoat
) VALUES (
  84, N'Dell Vostro', N'Huỳnh Thị Kim',
  N'Application', N'helpdesk06@hlnltphoanganh.onmicrosoft.com', N'kim.huynht@hoanganh.com.vn',
  N'kim.huynht', N'Enable'
);
DELETE FROM dbo.ApplicationSoftware;
INSERT INTO dbo.ApplicationSoftware (
  Owner, PhongBan, May, UngDung, LyDo, LoaiPhanMem, TrangThai, NgayCaiDat, GhiChu
) VALUES (
  N'Nguyễn Hoàng Khánh Duy', N'HR&IT', N'HP Pavilion 14 Laptop PC 14-dv2000 (4Z018AV)',
  N'Office365 (Word, Excel, PowerPoint)', N'Cài đặt mặc định theo tiêu chuẩn', N'Mặc định',
  N'Đang sử dụng', N'2026-07-28', NULL
);
INSERT INTO dbo.ApplicationSoftware (
  Owner, PhongBan, May, UngDung, LyDo, LoaiPhanMem, TrangThai, NgayCaiDat, GhiChu
) VALUES (
  N'Nguyễn Hoàng Khánh Duy', N'HR&IT', N'HP Pavilion 14 Laptop PC 14-dv2000 (4Z018AV)',
  N'OneDrive', N'Cài đặt mặc định theo tiêu chuẩn', N'Mặc định',
  N'Đang sử dụng', N'2026-07-28', NULL
);
INSERT INTO dbo.ApplicationSoftware (
  Owner, PhongBan, May, UngDung, LyDo, LoaiPhanMem, TrangThai, NgayCaiDat, GhiChu
) VALUES (
  N'Nguyễn Hoàng Khánh Duy', N'HR&IT', N'HP Pavilion 14 Laptop PC 14-dv2000 (4Z018AV)',
  N'Outlook', N'Cài đặt mặc định theo tiêu chuẩn', N'Mặc định',
  N'Đang sử dụng', N'2026-07-28', NULL
);
INSERT INTO dbo.ApplicationSoftware (
  Owner, PhongBan, May, UngDung, LyDo, LoaiPhanMem, TrangThai, NgayCaiDat, GhiChu
) VALUES (
  N'Nguyễn Hoàng Khánh Duy', N'HR&IT', N'HP Pavilion 14 Laptop PC 14-dv2000 (4Z018AV)',
  N'Google Chrome', N'Cài đặt mặc định theo tiêu chuẩn', N'Mặc định',
  N'Đang sử dụng', N'2026-07-28', NULL
);
INSERT INTO dbo.ApplicationSoftware (
  Owner, PhongBan, May, UngDung, LyDo, LoaiPhanMem, TrangThai, NgayCaiDat, GhiChu
) VALUES (
  N'Nguyễn Hoàng Khánh Duy', N'HR&IT', N'HP Pavilion 14 Laptop PC 14-dv2000 (4Z018AV)',
  N'Unikey', N'Cài đặt mặc định theo tiêu chuẩn', N'Mặc định',
  N'Đang sử dụng', N'2026-07-28', NULL
);
INSERT INTO dbo.ApplicationSoftware (
  Owner, PhongBan, May, UngDung, LyDo, LoaiPhanMem, TrangThai, NgayCaiDat, GhiChu
) VALUES (
  N'Nguyễn Hoàng Khánh Duy', N'HR&IT', N'HP Pavilion 14 Laptop PC 14-dv2000 (4Z018AV)',
  N'FoxitReader / PDFXChange', N'Cài đặt mặc định theo tiêu chuẩn', N'Mặc định',
  N'Đang sử dụng', N'2026-07-28', NULL
);
INSERT INTO dbo.ApplicationSoftware (
  Owner, PhongBan, May, UngDung, LyDo, LoaiPhanMem, TrangThai, NgayCaiDat, GhiChu
) VALUES (
  N'Nguyễn Hoàng Khánh Duy', N'HR&IT', N'HP Pavilion 14 Laptop PC 14-dv2000 (4Z018AV)',
  N'WinRAR', N'Cài đặt mặc định theo tiêu chuẩn', N'Mặc định',
  N'Đang sử dụng', N'2026-07-28', NULL
);
INSERT INTO dbo.ApplicationSoftware (
  Owner, PhongBan, May, UngDung, LyDo, LoaiPhanMem, TrangThai, NgayCaiDat, GhiChu
) VALUES (
  N'Nguyễn Hoàng Khánh Duy', N'HR&IT', N'HP Pavilion 14 Laptop PC 14-dv2000 (4Z018AV)',
  N'Ultraviewer', N'Cài đặt mặc định theo tiêu chuẩn', N'Mặc định',
  N'Đang sử dụng', N'2026-07-28', NULL
);
INSERT INTO dbo.ApplicationSoftware (
  Owner, PhongBan, May, UngDung, LyDo, LoaiPhanMem, TrangThai, NgayCaiDat, GhiChu
) VALUES (
  N'Nguyễn Hoàng Khánh Duy', N'HR&IT', N'HP Pavilion 14 Laptop PC 14-dv2000 (4Z018AV)',
  N'SS4U', N'Phục vụ công việc', N'Miễn phí',
  N'Đang sử dụng', N'2026-07-28', NULL
);

-- Cập nhật ThietBiID cho NhatKyBaoTri
UPDATE nk
SET nk.ThietBiID = t.ID
FROM dbo.NhatKyBaoTri nk
INNER JOIN dbo.ThietBi t ON (nk.SerialNumber = t.SerialNumber AND LEN(t.SerialNumber) > 0)
WHERE nk.ThietBiID IS NULL;

PRINT N'================================================================';
PRINT N'-> TỔNG CỘNG ĐÃ IMPORT 257 THIẾT BỊ ĐỦ CÁC NHÓM VÀO BANG ThietBi!';
PRINT N'================================================================';
