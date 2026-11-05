-- ==========================================================================================
-- SCRIPT IMPORT CHUẨN UNICODE TIẾNG VIỆT & NGÀY THÁNG FORMAT MM/DD/YYYY
-- ==========================================================================================

USE ITAssetDB;
SET NOCOUNT ON;

DELETE FROM dbo.NhatKyBaoTri;
DELETE FROM dbo.KeHoachBaoTri;
DELETE FROM dbo.LichSuDieuChuyen;
DELETE FROM dbo.ThietBi;
DBCC CHECKIDENT ('dbo.ThietBi', RESEED, 0);

INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  1, N'Máy tính', N'Laptop', N'HP 340S G7 Notebook PC', NULL,
  N'5CD1131WHJ', NULL, NULL, N'Commnercial',
  N'Bùi Ngọc Minh Trang', NULL, N'Intel Core i3 1005G1', N'8 GB', N'256 GB SSD',
  NULL, NULL,
  N'12/01/2021', N'11/30/2024', N'10/01/2023', N'11/30/2024',
  N'Đã hết hạn', N'Chưa được gia hạn', NULL, N'Đang sử dụng song song 2 máy Window và MacOS',
  NULL, NULL, NULL, N'Trong niên hạn', N'Disabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  2, N'Máy tính', N'Laptop', N'HP 14 Laptop PC 14-d5000', NULL,
  N'5CD24314RP', NULL, NULL, N'Flavor',
  N'Bùi Ngọc Vân Anh', N'Windows 11', N'12th Gen Intel(R) Core(TM) i7-1255U', N'8GB - 3200- 2/2 SLOT', N'500GB SSD - SK Hynix',
  N'Yes', N'26gb/ 99gb',
  N'08/01/2022', N'07/31/2025', N'10/22/2026', N'10/22/2027',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Sử dụng bình thường',
  NULL, NULL, NULL, N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  3, N'Máy tính', N'Laptop', N'HP 340S G7 Notebook', NULL,
  N'5CD151GWK8', NULL, NULL, N'Flavor',
  N'Bùi Ngọc Vân Chi', N'Windows 11', N'Intel Core i5 1035G1', N'8GB - 3200 - 1/2 SLOT', N'500GB SSD SK Hynix',
  N'Yes', N'26.5 free of 99gb',
  N'03/01/2022', N'02/28/2025', N'10/22/2026', N'10/22/2027',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Sử dụng bình thường',
  NULL, NULL, NULL, N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  4, N'Máy tính', N'Laptop', N'HP ProBook 440 G6 Notebook PC', NULL,
  N'5CD9312KQ9', NULL, NULL, N'QM',
  N'Bùi Thị Phương Dung', N'Windows 11', N'Intel Core i5 8265U', N'8 GB', N'256 GB SSD + 500 GB HDD',
  N'Yes', NULL,
  N'03/01/2020', N'03/01/2023', N'10/14/2026', N'10/14/2027',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Máy cũ của chị Dung',
  NULL, NULL, N'Đang được dùng làm máy Training', N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  5, N'Máy tính', N'Desktop', N'DESKTOP-OA2I6Q1', NULL,
  N'SAMA', NULL, NULL, N'Quality Management (QM)',
  N'Bùi Thị Yến Ngọc', NULL, N'Intel Pentium G4560', N'8 GB', N'500 GB SSD',
  NULL, NULL,
  N'01/01/2018', N'12/31/2020', N'10/01/2023', N'09/30/2024',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Máy tính còn sử dụng HDD thường xuyên chậm máy, treo máy khi sử dụng các file, ổ chung',
  N'Cần nâng cấp ổ cứng SSD', NULL, N'Đã nâng cấp ổ cứng SSD ngày 31/10/2023', N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  6, N'Máy tính', N'Laptop', N'HP Pavilion 14 Laptop PC 14-dv2000', NULL,
  N'5CD2472LS9', NULL, NULL, N'Commnercial',
  N'Cao Hữu Ngọc Hoàng', NULL, N'12th Gen Intel Core i5-1235U', N'8 GB', N'512 GB SSD',
  NULL, NULL,
  N'06/01/2023', N'05/31/2026', N'10/01/2023', N'05/31/2026',
  N'Đã hết hạn', N'Chưa được gia hạn', NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Máy mới được cấp vào tháng 06-2023', N'Trong niên hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  7, N'Máy tính', N'Desktop', N'DESKTOP - J5SD467', NULL,
  N'SAMA', NULL, NULL, N'Flavor',
  N'Đặng Tuyết Quỳnh Phương', NULL, N'Intel Pentium G4400', N'4 GB', N'256 GB SSD',
  NULL, NULL,
  N'11/01/2019', N'10/31/2022', N'10/01/2023', N'10/31/2022',
  N'Đã hết hạn', N'Chưa được gia hạn', NULL, N'Máy tính đã hết niên hạn sử dụng và hiện tại máy tính đang sử dụng ổn định chưa phát sinh gì nhưng về sau sẽ chậm máy do RAM còn quá thấp',
  N'Cần nâng cấp RAM', NULL, NULL, N'Cần nâng cấp', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  8, N'Máy tính', N'Desktop', N'Neo 50t Gen 3 Desktop (ThinkCentre)', NULL,
  N'GM03S1N6', NULL, NULL, N'Production',
  N'Đào Minh Quý', N'Windows 11', N'12th Gen Intel Core i3-12100', N'8GB', N'256 GB SSD - WD PC',
  N'Yes', N'13Gb / 99gb',
  N'06/01/2023', N'05/31/2026', N'04/29/2026', N'05/31/2026',
  N'Đã hết hạn', N'Chưa được gia hạn', NULL, N'Máy tính cần thay RAM',
  NULL, NULL, NULL, N'Trong niên hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  9, N'Máy tính', N'Laptop', N'HP Probook 440 G7', NULL,
  N'5CD0190WQ5', NULL, NULL, N'Sales',
  N'Nguyễn Thị Ngọc Khuê', N'Windows 11', N'Intel Core i3-1005G1', N'8GB - 2667 - 2/2 slot', N'250GB SSD - WDC',
  N'Yes', N'11.2 gb / 99gb',
  NULL, N'12/30/1902', N'10/19/2026', N'12/30/1902',
  N'Đã hết hạn', N'Chưa được gia hạn', NULL, N'Máy giật lag khi mở nhiều file excel',
  NULL, NULL, NULL, N'Nâng cấp RAM', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  10, N'Máy tính', N'Desktop', N'Dell Vostro 3670', NULL,
  N'HJC3WV2', NULL, NULL, N'Quality Management (QM)',
  N'Dương Ngọc Sơn', NULL, N'Intel Pentium Gold G5400', N'8 GB', N'500 GB SSD',
  NULL, NULL,
  N'06/01/2020', N'06/01/2023', N'10/01/2023', N'09/30/2024',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Máy tính đã hết niên hạn sử dụng và máy tính chậm thường xuyên treo máy, bị màn hình xanh khi khởi động máy tính',
  N'Cần nâng cấp ổ cứng SSD', NULL, N'Đã nâng cấp ổ cứng ngày 18/10/2023', N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  11, N'Máy tính', N'Laptop', N'HP Pavilion 14 Laptop PC 14-dv2000 (4Z018AV)', NULL,
  N'5CD2379SWJ', NULL, NULL, N'HR',
  N'Huỳnh Thị Mỹ Duyên', N'Windows 11', N'12th Gen Intel(R) Core(TM) i5-1235U', N'8GB-BUS3200-2/2 slot', N'512 GB SSD WDC',
  N'Yes', NULL,
  N'12/01/2022', N'11/30/2025', N'10/16/2026', N'10/16/2027',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Sử dụng bình thường',
  NULL, NULL, NULL, N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  12, N'Máy tính', N'Desktop', N'Dell Vostro 3671', NULL,
  N'29W4R33', NULL, NULL, N'Application',
  N'Hoàng Thị Kim Phương', NULL, N'Intel Pentium Gold G5420', N'8 GB', N'500 GB SSD',
  NULL, NULL,
  N'06/01/2021', N'05/31/2024', N'10/01/2023', N'09/30/2024',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Máy tính chạy chậm, treo máy khi làm việc với các tác vụ của Microsoft',
  N'Cần nâng cấp ổ cứng SSD', NULL, N'Đã nâng cấp ổ cứng SSD ngày 11/10/2023', N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  13, N'Máy tính', N'Desktop', N'DESKTOP-HMQ10T4', NULL,
  N'SAMA', NULL, NULL, N'Application',
  N'Hoàng Thị Thanh Mỹ', NULL, N'Intel(R) Pentium(R) CPU G3260', N'8 GB', N'500 GB SSD',
  NULL, NULL,
  N'05/01/2022', N'04/30/2025', N'10/01/2023', N'09/30/2024',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Máy tính sử dụng bình thường nhưng ổ cứng không đáp ứng nhu cầu làm việc',
  N'Cần nâng cấp ổ cứng SSD', NULL, N'Đã nâng cấp ổ cứng SSD ngày 11/10/2023', N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  14, N'Máy tính', N'Laptop', N'HP 340s G7', NULL,
  N'5CD1389YBG', NULL, NULL, N'Sales',
  N'Nguyễn Trâm Anh', N'Windows 11', N'Intel Core i3-1005G1', N'8GB - 2667 - 2/2 slot', N'500GB SSD SK Hynix',
  N'Yes', N'2gb / 99gb',
  NULL, N'12/30/1902', N'10/19/2026', N'10/19/2027',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Sử dụng bình thường , đề xuất nâng cấp RAM',
  NULL, NULL, NULL, N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  15, N'Máy tính', N'Laptop', N'HP 340S G7 Notebook PC', NULL,
  N'5CD1389YDP', NULL, NULL, N'Commnercial',
  N'Huỳnh Thanh Sơn', NULL, N'Intel Core i3 1005G1', N'8 GB', N'256 GB SSD',
  NULL, NULL,
  N'08/01/2021', N'07/31/2024', N'10/01/2023', N'07/31/2024',
  N'Đã hết hạn', N'Chưa được gia hạn', NULL, N'Sử dụng bình thường',
  NULL, NULL, NULL, N'Trong niên hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  16, N'Máy tính', N'Desktop', N'HP Desktop M01', NULL,
  N'1R57R13', NULL, NULL, N'Finance & Accounting',
  N'Huỳnh Thị Ái Diễm', N'Windows 11', N'13th Intel Core  i5 13400', N'8 GB - 3200 - 1/2 slot', N'500 GB SSD - WDC',
  N'Yes', N'50gb / 99gb',
  N'05/01/2021', N'04/30/2024', N'10/21/2026', N'10/21/2027',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Máy sử dụng bình thường',
  NULL, NULL, NULL, N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  17, N'Máy tính', N'Desktop', N'HP ENVY Laptop 13-ba1000 (1F4E5AV)', NULL,
  N'CND2023PWH', NULL, NULL, N'QM',
  N'Huỳnh Thị Thùy Linh', N'Windows 11', N'11th Gen Intel(R) Core(TM) i5-1135G7', N'8GB-BUS3200-2/2 slot', N'500GB SSD - Kingston',
  N'Yes', N'49gb / 99gb',
  N'11/01/2022', N'10/31/2025', N'10/12/2026', N'10/12/2027',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Máy thiếu RAM, khi sử dụng nhiều ứng dụng',
  N'Nâng cấp RAM 16GB', NULL, NULL, N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  18, N'Máy tính', N'Laptop', N'HP PROBOOK 440 G3', NULL,
  NULL, NULL, NULL, N'Flavor',
  N'Kha Tuyết Huệ', N'Windows 11', N'Intel Core i5 6200U', N'8 GB - DDR4 - 2133 - 2/2 slot', N'250GB SSD - SAMSUNG',
  N'Yes', N'14.8gb / 99gb',
  N'06/01/2016', N'06/01/2019', N'10/20/2026', N'06/01/2019',
  N'Đã hết hạn', N'Chưa được gia hạn', NULL, N'Máy đã hết niên hạn sử dụng , cần mua máy mới',
  NULL, NULL, NULL, N'Cần mua mới', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  19, N'Máy tính', N'Laptop', N'HP 340S G7 Notebook PC', NULL,
  N'5CD1080XKN', NULL, NULL, N'Application',
  N'Laptop dùng chung', N'Windows 11', N'Intel Core i3-1005G1', N'8 GB', N'512 GB SSD',
  N'Yes', NULL,
  N'11/01/2021', N'10/31/2024', N'10/22/2026', N'10/22/2027',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Sử dụng bình thường',
  NULL, NULL, NULL, N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  20, N'Máy tính', N'Desktop', N'DESKTOP-R60MJDC', NULL,
  N'SAMA', NULL, NULL, N'Production',
  N'Lê Bá Trình', NULL, N'Intel Pentium G3450', N'6 GB', N'256 GB SSD',
  NULL, NULL,
  N'06/01/2018', N'05/31/2021', N'10/01/2023', N'09/30/2024',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Máy tính đã hết niên hạn sử dụng nhưng sử dụng bình thường',
  NULL, NULL, NULL, N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  21, N'Máy tính', N'Desktop', N'Dell Vostro 3670', NULL,
  N'7WL3WV2', NULL, NULL, N'QM',
  N'Võ Thị Hương SX', N'Windows 11', N'Intel Pentium CPU G5400', N'12GB - 8GB 3200 - & 4GB 2133 DDR4 - 2/2 slot', N'500GB SSD - SAMSUNG 870EVO',
  N'Yes', N'49.7gb / 99gb',
  N'10/01/2017', N'09/30/2020', N'10/12/2026', N'10/12/2027',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Máy sử dụng bình thường',
  NULL, NULL, NULL, N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  22, N'Máy tính', N'Desktop', N'Dell Vostro 3888', NULL,
  N'5PRW0D3', NULL, NULL, N'Commnercial',
  N'Lê Huy Cát', NULL, N'Intel Core i7 10700', N'32 GB', N'512 GB SSD + 1 TB HDD',
  NULL, NULL,
  N'05/01/2022', N'04/30/2025', N'10/01/2023', N'04/30/2025',
  N'Đã hết hạn', N'Chưa được gia hạn', NULL, N'Sử dụng bình thường',
  NULL, NULL, NULL, N'Trong niên hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  23, N'Máy tính', N'Desktop', N'Dell Vostro 3670', NULL,
  N'4915HY2', NULL, NULL, N'QM',
  N'Lê Huyền Trân', N'Windows 11', N'Intel Pentium Gold G5420', N'8GB - 2400 - 2/2 slot', N'500GB SSD - SAMSUNG',
  N'Yes', N'7gb / 99gb',
  N'08/01/2020', N'08/01/2023', N'10/14/2026', N'08/01/2023',
  N'Đã hết hạn', N'Chưa được gia hạn', NULL, N'Máy tính đã hết niên hạn nhưng sử dụng bình thường',
  N'Nâng cấp RAM lên 1 thanh 16GB để hoạt động mượt mà với Windows 11', NULL, NULL, N'Nâng cấp RAM', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  24, N'Máy tính', N'Desktop', N'SAMA', NULL,
  N'SAMA', NULL, NULL, N'Application',
  N'Lê Kim Ngân', NULL, N'Intel Pentium G3440', N'8 GB', N'500 GB SSD',
  NULL, NULL,
  N'11/01/2021', N'10/31/2024', N'10/01/2023', N'09/30/2024',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Máy tính sử dụng bình thường nhưng ổ cứng không đáp ứng nhu cầu làm việc',
  N'Cần nâng cấp ổ cứng SSD', NULL, N'Đã nâng cấp ổ cứng SSD ngày 12/10/2023', N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  25, N'Máy tính', N'Laptop', N'HP ProBook 440 G6 Notebook PC', NULL,
  N'5CD9302BC3', NULL, NULL, N'Finance & Accounting',
  N'Lê Nguyễn Phương Thư', N'Windows 11', N'Intel Core i5 8265U', N'8 GB', N'256 GB SSD',
  N'Yes', NULL,
  N'08/01/2021', N'07/31/2024', N'10/23/2026', N'10/23/2027',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Đã đầu tư máy mới , hiện tại vẫn đang giữ máy để backup',
  NULL, NULL, NULL, N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  26, N'Máy tính', N'Laptop', N'HP Probook 440 G6 Notebook', NULL,
  N'5CD9271S5M', NULL, NULL, N'Purchasing',
  N'Lê Thị Ánh Phúc', N'Windows 11', N'Intel Core i5 8265U', N'8 GB', N'256 GB SSD Kingston + 500 GB HDD',
  N'Yes', N'59gb / 99gb',
  N'02/01/2019', N'01/31/2022', N'10/23/2026', N'10/23/2027',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Máy tính đã hết niên hạn sử dụng nhưng sử dụng bình thường',
  NULL, NULL, NULL, N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  27, N'Máy tính', N'Laptop', N'DESKTOP-EDIP08012', NULL,
  N'SAMA', NULL, NULL, N'Production',
  N'Production Public', N'Windows 11', N'Intel Pentium G2030', N'8 GB', N'500 GB SSD',
  NULL, NULL,
  N'01/01/2022', N'12/31/2024', N'10/14/2026', N'10/14/2027',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Đã nâng cấp ổ cứng SSD ngày 28/08/2023',
  NULL, NULL, N'Đã nâng cấp ổ cứng SSD ngày 28/08/2023', N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  28, N'Máy tính', N'Laptop', N'HP Pavilion - 14-bf017tu', NULL,
  N'CND7321MTZ', NULL, NULL, N'Ingredient',
  N'Lê Thị Mỹ Hiền', NULL, N'Intel Core i5 7200U', N'8 GB', N'500 GB SSD',
  NULL, NULL,
  N'08/01/2017', N'07/31/2020', N'10/01/2023', N'09/30/2024',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Máy tính đã hết niên hạn, bị lỗi màn hình xanh khi khởi động máy tính hoặc đang trong làm việc',
  N'Cần nâng cấp ổ cứng SSD', NULL, N'Đã nâng cấp ổ cứng SSD ngày 20/09/2023', N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  29, N'Máy tính', N'Laptop', N'HP 240 G8 Notebook PC', NULL,
  N'5CG13681KL', NULL, NULL, N'Ingredient',
  N'Lê Thuý Hà', NULL, N'Intel Core i3 1005G1', N'8 GB', N'256 GB SSD',
  NULL, NULL,
  N'11/01/2021', N'10/31/2024', N'10/01/2023', N'09/30/2024',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Sử dụng bình thường',
  NULL, NULL, NULL, N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  30, N'Máy tính', N'Desktop', N'Dell Vostro 3670', NULL,
  N'GSJF0T2', NULL, NULL, N'Finance & Accounting (F&A)',
  N'Lê Thuý Hằng', NULL, N'Intel Pentium Gold G5400', N'8 GB', N'1 TB HDD',
  NULL, NULL,
  N'05/01/2020', N'05/01/2023', N'10/01/2023', N'05/01/2023',
  N'Đã hết hạn', N'Chưa được gia hạn', NULL, N'Máy tính hết niên hạn sử dụng nhưng còn sử dụng HDD hay tình trạng đơ máy không đáp ứng nhu cầu làm việc về sau',
  N'Cần nâng cấp ổ cứng SSD', 1300000, NULL, N'Cần nâng cấp', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  31, N'Máy tính', N'Laptop', N'HP 340s G7', NULL,
  N'5CD2106VMK', NULL, NULL, N'Sales',
  N'Trần Ngọc Tấn', N'Windows 11', N'Intel Core i5-1035G1', N'8GB-2400-1/2slot', N'240GB SSD - KIOXIA',
  N'Yes', NULL,
  NULL, N'12/30/1902', N'10/19/2026', N'10/19/2027',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Sử dụng bình thường',
  NULL, NULL, NULL, N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  32, N'Máy tính', N'Desktop', N'Dell Vostro 3671', NULL,
  N'5M3PG53', NULL, NULL, N'Flavor',
  N'Mạc Thị Ngọc Trâm', NULL, N'Intel Core i5 9400', N'8 GB', N'1 TB HDD',
  NULL, NULL,
  N'11/01/2021', N'10/31/2024', N'10/01/2023', N'09/30/2024',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Sử dụng bình thường',
  N'Nên nâng cấp ổ cứng lên SSD 512 GB', NULL, NULL, N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  33, N'Máy tính', N'Desktop', N'Dell Vostro 3670', NULL,
  N'6CK70T2', NULL, NULL, N'Quality Management (QM)',
  N'Mai Văn Tuấn', NULL, N'Intel Pentium Gold G5400', N'8 GB', N'500 GB SSD',
  NULL, NULL,
  N'11/01/2018', N'10/31/2021', N'10/01/2023', N'09/30/2024',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Máy tính đã hết niên hạn sử dụng, hay đơ máy, treo máy, xuất hiện màn hình xanh',
  N'Cần nâng cấp ổ cứng SSD', NULL, N'Đã nâng cấp ổ cứng ngày 18/10/2023', N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  34, N'Máy tính', N'Laptop', N'HP Probook 450 G5', NULL,
  N'5CD823C7B8', NULL, NULL, N'Commnercial',
  N'Ngô Huy Hoàng', NULL, N'Intel Core i5 8250U', N'8 GB', N'128 GB SSD + 500 GB HDD',
  NULL, NULL,
  N'06/01/2018', N'05/31/2021', NULL, NULL,
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Máy tính sử dụng các file Excel thì bị treo chuột tầm 1 - 3s và xảy ra thường xuyên',
  N'IT sẽ cập nhật lại driver chuột nếu trường hợp không khắc phục được sẽ tiến hành backup dữ liệu và cài lại window', NULL, N'Đang được IT quản lý', N'Tiếp tục gia hạn', N'Disabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  35, N'Máy tính', N'Laptop', N'HP Probook 440 G7', NULL,
  N'5CD0128NKZ', NULL, NULL, N'Delivery',
  N'Lê Quang Bình', N'Windows 11', N'Intel Core i5 10210U', N'8GB - 2400 - DDR3 - 2/2 slot', N'512GB SSD',
  N'Yes', NULL,
  NULL, N'12/30/1902', N'04/16/2026', N'12/30/1902',
  N'Đã hết hạn', N'Chưa được gia hạn', NULL, N'Máy lag ở tác vụ bình thường và file excel > 1000 dòng',
  N'Nâng cấp Ram', NULL, NULL, N'Đã thu hồi về kho', N'Disabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  36, N'Máy tính', N'Laptop', N'HP 245 G10', NULL,
  N'5CG53018MS', NULL, NULL, N'PMI',
  N'Nguyễn Thị Mỹ Hằng', N'Windows 11', N'AMD Ryzen 7 7730U', N'16GB - 3200 - 1/2 slot', N'500GB SSD - SAMSUNG',
  N'Yes', NULL,
  N'05/14/2026', N'05/13/2029', N'10/22/2026', N'05/13/2029',
  N'Còn hạn', N'Còn hạn', NULL, N'Máy tính mới mua',
  NULL, NULL, NULL, NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  37, N'Máy tính', N'Desktop', N'DESKTOP-OFC2QAO', NULL,
  N'SAMA', NULL, NULL, N'Quality Management (QM)',
  N'Nguyễn Chí Thanh', NULL, N'Intel(R) Pentium(R) CPU G4560', N'8 GB', N'500 GB HDD',
  NULL, NULL,
  N'04/01/2019', N'03/31/2022', N'10/01/2023', N'03/31/2022',
  N'Đã hết hạn', N'Chưa được gia hạn', NULL, N'Máy tính đã hết niên hạn sử dụng, sử dụng không ổn định hay chậm máy,treo máy và đáp ứng nhu cầu làm việc về tương lai',
  N'Cần nâng cấp ổ cứng SSD', 1300000, NULL, N'Cần nâng cấp', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  38, N'Máy tính', N'Laptop', N'HP 340S G7 Notebook PC (8BC21AV)', NULL,
  N'5CD143H4C4', NULL, NULL, N'Finance & Accounting',
  N'Nguyễn Đông Nhu', N'Windows 11', N'Intel Core i5 1035G1', N'8GB-BUS3200-1/2 slot', N'500GB SSD - SK Hynix',
  N'Yes', N'30.5gb / 99gb',
  N'04/01/2022', N'03/31/2025', N'10/12/2026', N'10/12/2027',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Sử dụng bình thường',
  NULL, NULL, NULL, N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  39, N'Máy tính', N'Laptop', N'HP 340S G7 Notebook PC (8BC21AV)', NULL,
  N'5CD2106VFF', NULL, NULL, N'Commnercial',
  N'Nguyễn Hoàng Bảo', NULL, N'Intel Core i5 1035G1', N'8 GB', N'256 GB SSD',
  NULL, NULL,
  N'11/01/2022', N'10/31/2025', N'10/01/2023', N'10/31/2025',
  N'Đã hết hạn', N'Chưa được gia hạn', NULL, N'Sử dụng bình thường',
  NULL, NULL, NULL, N'Trong niên hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  40, N'Máy tính', N'Laptop', N'HP 340S G7 Notebook PC (8BC21AV)', NULL,
  N'5CD1131Y30', NULL, NULL, N'ME',
  N'Nguyễn Hữu Thịnh', N'Windows 11', N'Intel Core i5 1035G1', N'8GB-BUS3200-1/2slot', N'512 GB SSD kioxia',
  N'Yes', N'45.5gb / 99gb',
  N'05/01/2021', N'04/30/2024', N'10/12/2026', N'10/12/2027',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Máy tính đã hết niên hạn , vừa thay pin',
  NULL, NULL, NULL, N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  41, N'Máy tính', N'Laptop', N'DESKTOP-LESD99E', NULL,
  N'SAMA', NULL, NULL, N'Production',
  N'Nguyễn Miêu Khả Tú', NULL, N'Intel Pentium G4400', N'8 GB', N'256 GB SSD',
  NULL, NULL,
  N'04/01/2018', N'03/31/2021', N'10/01/2023', N'09/30/2024',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Máy tính đã hết niên hạn sử dụng nhưng sử dụng bình thường',
  NULL, NULL, NULL, N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  42, N'Máy tính', N'Desktop', N'DESKTOP - EDIP08050', NULL,
  N'SAMA', NULL, NULL, N'WH & Planning',
  N'Nguyễn Minh Phục', NULL, N'Intel Pentium G3260', N'4 GB', N'250 GB SSD',
  NULL, NULL,
  N'10/01/2018', N'09/30/2021', N'10/01/2023', N'09/30/2021',
  N'Đã hết hạn', N'Chưa được gia hạn', NULL, N'Máy tính đã hết niên hạn sử dụng, hay treo máy ,chậm máy khi xử lý công việc bằng Microsoft Offcice 365, ERP',
  N'Cần nâng cấp RAM', 900000, NULL, N'Cần nâng cấp', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  43, N'Máy tính', N'Laptop', N'HP ProBook 440 G5 Notebook PC', NULL,
  N'5CD7486JZL', NULL, NULL, N'Production',
  N'Production Leader', N'Windows 11', N'Intel Core i5 8250U', N'8GB - 2400 - DDR3 - 1/2 slot', N'500GB SSD - WDC',
  N'Yes', NULL,
  NULL, N'12/30/1902', N'10/12/2026', N'10/12/2027',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Sử dụng binh thường',
  NULL, NULL, NULL, N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  44, N'Máy tính', N'Laptop', N'HP ProBook 440 G7 Notebook PC (6XJ55AV)', NULL,
  N'5CD0128NCS', NULL, NULL, N'PE',
  N'Nguyễn Tấn Phát', N'Windows 11', N'Intel Core i5 10210U', N'8GB-BUS2667-2/2slot', N'256 GB SSD',
  N'Yes', NULL,
  N'03/01/2020', N'03/01/2023', N'04/01/2026', N'03/01/2023',
  N'Đã hết hạn', N'Chưa được gia hạn', NULL, N'Máy tính đã lưu kho',
  NULL, NULL, NULL, N'Đã thu hồi về kho', N'Disabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  45, N'Máy tính', N'Laptop', N'HP Probook 440 G8', NULL,
  N'5CD117JD29', NULL, NULL, N'Finance & Accounting',
  N'Nguyễn Tấn Tĩnh', N'Windows 11', N'11th Intel Core i5 1135G7', N'8 GB - 3200 - 1/2 slot', N'500 GB SSD',
  N'Yes', NULL,
  N'05/01/2021', N'04/30/2024', N'05/01/2026', N'05/01/2027',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Sử dụng bình thường',
  NULL, NULL, NULL, N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  46, N'Máy tính', N'Laptop', N'HP Pavilion Laptop 14-dv2xxx', NULL,
  N'5CD2379SYH', NULL, NULL, N'IT',
  N'Nguyễn Hoàng Khánh Duy', N'Windows 11', N'Intel Core i5 1235U', N'20GB - 3200 - 2/2 slot', N'512GB SSD - WDC',
  N'Yes', N'46.5 GB free',
  NULL, N'12/30/1902', N'04/26/2026', N'04/26/2027',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Máy sử dụng bình thường',
  NULL, NULL, NULL, N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  47, N'Máy tính', N'Laptop', N'HP Pavilion 14-ce1018tu', NULL,
  N'5CD9056Q31', NULL, NULL, N'Commnercial',
  N'Nguyễn Thế Tài', NULL, N'Intel Core i5 8265U', N'8 GB', N'256 GB SSD',
  NULL, NULL,
  N'08/01/2018', N'07/31/2021', N'10/01/2023', N'09/30/2024',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Máy tính đã hết niên hạn sử dụng nhưng sử dụng bình thường',
  NULL, NULL, NULL, N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  48, N'Máy tính', N'Laptop', N'HP 340S G7 Notebook PC', NULL,
  N'5CD2106VCS', NULL, NULL, N'Commnercial',
  N'Nguyễn Thị Anh Lệ', NULL, N'Intel Core i5-1035G1', N'8 GB', N'256 GB SSD',
  NULL, NULL,
  N'04/01/2022', N'03/31/2025', N'10/01/2023', N'03/31/2025',
  N'Đã hết hạn', N'Chưa được gia hạn', NULL, N'Sử dụng bình thường',
  NULL, NULL, NULL, N'Trong niên hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  49, N'Máy tính', N'Laptop', N'HP 340S G7 Notebook PC', NULL,
  N'5CD143H3R0', NULL, NULL, N'Commnercial',
  N'Nguyễn Thị Hoài Thương', NULL, N'Intel Core i3-1005G1', N'8 GB', N'512 GB SSD',
  NULL, NULL,
  N'11/01/2020', N'11/01/2023', N'10/01/2023', N'09/30/2024',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Máy tính đã hết niên hạn sử dụng nhưng sử dụng bình thường',
  NULL, NULL, NULL, N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  50, N'Máy tính', N'Laptop', N'HP 340S G7 Notebook', NULL,
  N'5CD0466SX4', NULL, NULL, N'Flavor',
  N'Nguyễn Thị Lê Xíu', N'Windows 11', N'Intel Core i3 1005G1', N'8GB - 3200 - 2/2 SLOT', N'500GB SSD - Gigabyte',
  N'Yes', N'30gb/ 99gb',
  N'11/01/2021', N'10/31/2024', N'10/22/2026', N'10/31/2024',
  N'Đã hết hạn', N'Chưa được gia hạn', NULL, N'Máy tính sử dụng giật lag khi mở nhiều tab excel',
  NULL, NULL, NULL, N'Mua mới', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  51, N'Máy tính', N'Laptop', N'HP 245 G10', NULL,
  N'5CD0466SVR', NULL, NULL, N'Import, Export',
  N'Nguyễn Thị Mỹ Duyên', N'Windows 11', N'AMD Ryzen 7 7730U', N'16GB', N'512GB SSD',
  N'Yes', NULL,
  N'04/01/2026', N'03/31/2029', N'10/22/2025', N'03/31/2029',
  N'Còn hạn', N'Còn hạn', NULL, N'Sử dụng bình thường',
  NULL, NULL, NULL, N'Trong niên hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  52, N'Máy tính', N'Desktop', N'Dell Vostro 3671', NULL,
  N'1RD6R13', NULL, NULL, N'Production',
  N'Nguyễn Thị Ngọc Huyền', N'Windows 11', N'Intel Pentium Gold G5240', N'16GB - DDR4 - 2133 - 1/2 slot', N'250 GB SSD',
  N'Yes', N'8.34GB/ 99GB',
  N'02/01/2021', N'02/01/2024', N'10/12/2026', N'10/12/2027',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Sử dụng bình thường
Màn hình đã cũ , bị tối góc',
  NULL, NULL, NULL, N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  53, N'Máy tính', N'Laptop', N'HP Probook 440 G3 Notebook', NULL,
  N'5CD6217771', NULL, NULL, N'Application',
  N'Nguyễn Thị Ngọc Nga', N'Windows 10', N'Intel Core i5 6200U', N'8GB - 2133 - 2/2 slot', N'240GB SSD - SANDISK',
  N'Yes', N'12gb / 99gb',
  N'06/01/2016', N'06/01/2019', N'10/22/2026', N'06/01/2019',
  N'Đã hết hạn', N'Chưa được gia hạn', NULL, N'Máy đã quá cũ , không thể tiếp tục nâng cấp hay gia hạn',
  NULL, NULL, NULL, N'Mua mới', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  54, N'Máy tính', N'Laptop', N'HP 240 G8 Notebook PC', NULL,
  N'5CG20415TQ', NULL, NULL, N'Delivery',
  N'Nguyễn Thị Quyên', NULL, N'11th Gen Intel Core i5-1135G7', N'8 GB', N'512 GB SSD',
  NULL, NULL,
  N'06/01/2022', N'05/31/2025', N'10/01/2023', N'05/31/2025',
  N'Đã hết hạn', N'Chưa được gia hạn', NULL, N'Sử dụng bình thường',
  NULL, NULL, NULL, N'Trong niên hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  55, N'Máy tính', N'Laptop', N'HP 340s G7', NULL,
  N'5CD0456swz', NULL, NULL, NULL,
  N'Nguyễn Thị Thanh Thuý', N'Windows 11', N'Intel Core i3 1005G1', N'8 GB - BUS3200 - 1/2 slot', N'512GB SSD ADATA',
  N'Yes', N'56gb / 99gb',
  N'11/01/2015', N'10/31/2018', N'10/12/2026', N'10/12/2027',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Máy đã bị chai pin nặng , đang đợi mua pin về',
  N'Mua pin thay thế', NULL, N'Đã thay thế pin vào ngày 19/10/2026', N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  56, N'Máy tính', N'Laptop', N'HP Laptop 14 ep1179TU', NULL,
  N'5CG5313X8L', NULL, NULL, N'QM',
  N'Nguyễn Thị Thu Thảo', N'Windows 11', N'Core 5 120U', N'16GB-3200- 2/2 slot', N'500GB SSD - SK Hynix',
  N'Yes', N'33.15gb / 99gb',
  N'06/01/2021', N'05/31/2024', N'10/12/2026', N'10/12/2027',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Máy tính sử dụng bình thường , gia hạn niên hạn',
  NULL, NULL, NULL, N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  57, N'Máy tính', N'Laptop', N'HP 340S G7 Notebook', NULL,
  N'5CD143H3YB', NULL, NULL, N'Application',
  N'Nguyễn Thúy Thảo Duyên', N'Windows 11', N'Intel Core i3 1005G1', N'8GB - 2667 - 2/2 slot', N'500GB SSD',
  N'Yes', N'9.58gb / 99gb',
  N'11/01/2021', N'10/31/2024', N'10/22/2026', N'10/31/2024',
  N'Đã hết hạn', N'Chưa được gia hạn', NULL, N'Máy tính giật lag khi sử dụng nhiều tab excel, đề xuất nâng cấp RAM',
  NULL, NULL, NULL, N'Nâng cấp RAM', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  58, N'Máy tính', N'Desktop', N'DESKTOP-EQ7IHP4', NULL,
  N'SAMA', NULL, NULL, N'Production',
  N'Nguyễn Tường Vy', NULL, N'Intel Pentium G3260', N'8 GB', N'256 GB SSD',
  NULL, NULL,
  N'07/01/2018', N'06/30/2021', N'10/01/2023', N'09/30/2024',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Máy tính đã hết niên hạn sử dụng nhưng sử dụng bình thường',
  NULL, NULL, NULL, N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  59, N'Máy tính', N'Laptop', N'HP Probook 440 G7 Notebook', NULL,
  N'5CD0128N5G', NULL, NULL, N'HR&IT',
  N'Nguyễn Xuân Sơn', NULL, N'Intel Core i5 10210U', N'8 GB', N'512 GB SSD',
  NULL, NULL,
  N'05/01/2021', N'04/30/2024', N'10/01/2023', N'04/30/2024',
  N'Đã hết hạn', N'Chưa được gia hạn', NULL, N'Sử dụng bình thường',
  NULL, NULL, NULL, N'Trong niên hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  60, N'Máy tính', N'Laptop', N'HP ProBook 440 G7 Notebook PC (6XJ52AV)', NULL,
  N'5CD0190Y5Y', NULL, NULL, N'Maintenance Engineer (ME)',
  N'Phạm Ngọc Thắng', NULL, N'Intel Core i3 10110U', N'8 GB', N'256 GB SSD',
  NULL, NULL,
  N'06/01/2022', N'05/31/2025', N'10/01/2023', N'05/31/2025',
  N'Đã hết hạn', N'Chưa được gia hạn', NULL, N'Sử dụng bình thường',
  NULL, NULL, NULL, N'Trong niên hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  61, N'Máy tính', N'Laptop', N'HP ENVY 13-ay1000 x360 Convertible PC', NULL,
  N'CND148BGPR', NULL, NULL, N'Flavor',
  N'Phạm Thị Chuyên', N'Windows 11', N'AMD Ryzen 7 5800U', N'8GB - 3200 - 2/2 SLOT', N'1 TB SSD - SAMSUNG 980',
  N'Yes', N'19.5gb/99gb',
  N'11/01/2022', N'10/31/2025', N'10/22/2026', N'10/22/2027',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Sử dụng bình thường',
  NULL, NULL, NULL, N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  62, N'Máy tính', N'Desktop', N'DESKTOP-GQA9U7Q', NULL,
  N'SAMA', NULL, NULL, N'Application',
  N'Phạm Thị Ngọc', N'Windows 10', N'Intel Pentium CPU G3260', N'8GB - 1400 - 1/4 slot', N'500GB SSD - SAMSUNG 870EVO',
  N'Yes', N'43gb free / 99gb',
  N'05/01/2023', N'04/30/2026', N'05/01/2026', N'04/30/2026',
  N'Đã hết hạn', N'Chưa được gia hạn', NULL, N'Máy sử dụng bình thường',
  NULL, NULL, NULL, N'Đang để ở phòng Application', N'Disabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  63, N'Máy tính', N'Laptop', N'HP Envy Laptop 13 ba1000', NULL,
  N'CND2023PRN', NULL, NULL, N'Flavor',
  N'Phạm Thị Ngọc Trang', N'Windows 11', N'11th Gen Intel Core i5 1135G7', N'8GB - 3200 - 2/2 SLOT', N'240GB - SSD Kioxia',
  N'Yes', N'19gb /99gb',
  N'11/01/2022', N'10/31/2025', N'10/22/2026', N'10/22/2027',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Máy sử dụng bình thường',
  NULL, NULL, NULL, N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  64, N'Máy tính', N'Laptop', N'HP 340S G7 Notebook', NULL,
  N'5CD0466SVN', NULL, NULL, N'Flavor',
  N'Phạm Thị Vân Trang', N'Windows 11', N'Intel Core i3 1005G1', N'8GB - 3200 - 2/2 SLOT', N'240 GB SSD',
  N'Yes', N'20gb / 99gb',
  N'11/01/2021', N'10/31/2024', N'10/22/2026', N'10/22/2027',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Sử dụng bình thường',
  NULL, NULL, NULL, N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  65, N'Máy tính', N'Desktop', N'DESKTOP-0E93PTG', NULL,
  N'SAMA', NULL, NULL, N'Finance & Accounting (F&A)',
  N'Phạm Tố Tố', NULL, N'Intel Pentium G3440', N'8 GB', N'500 GB HDD',
  NULL, NULL,
  N'04/01/2018', N'03/31/2021', N'10/01/2023', N'03/31/2021',
  N'Đã hết hạn', N'Chưa được gia hạn', NULL, N'Máy tính đã hết niên hạn sử dụng, máy tính xử lý chậm ổ cứng không đáp ứng nhu cầu làm việc, treo máy',
  N'Cần nâng cấp ổ cứng SSD', 1300000, NULL, N'Cần nâng cấp', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  66, N'Máy tính', N'Desktop', N'Lenovo', NULL,
  N'PC1AXXYL', NULL, NULL, N'Application',
  N'Phan Thị Thúy', N'Windows 11', N'Intel Pentium Gold G5420', N'8GB - 2400 - 2/2 SLOT', N'240GB SSD SATA - Solid State',
  N'Yes', N'5GB / 99GB',
  NULL, N'12/30/1902', N'10/22/2026', N'10/22/2027',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Máy tính sử dụng bình thường',
  NULL, NULL, NULL, N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  67, N'Máy tính', N'Laptop', N'HP 340S G7 Notebook PC', NULL,
  N'5CD1389Y0R', NULL, NULL, N'Commnercial',
  N'Phan Trần Khánh Long', NULL, N'Intel Core i3 1005G1', N'8 GB', N'256 GB SSD',
  NULL, NULL,
  N'11/01/2020', N'11/01/2023', N'10/01/2023', N'09/30/2024',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Máy tính đã hết niên hạn sử dụng nhưng sử dụng bình thường',
  NULL, NULL, NULL, N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  68, N'Máy tính', N'Laptop', N'HP 340S G7 Notebook PC', NULL,
  N'5CD0466SWZ', NULL, NULL, N'Quality Management (QM)',
  N'Phan Văn Tươi', NULL, N'Intel Core i3 1005G1', N'8 GB', N'256 GB SSD',
  NULL, NULL,
  N'11/01/2021', N'10/31/2024', N'10/01/2023', N'10/31/2024',
  N'Đã hết hạn', N'Chưa được gia hạn', NULL, N'Đang sử dụng Local Account và chưa gia nhập vào hệ thống domain Hoàng Anh',
  N'Backup dữ liệu từ local account và gia nhập domain', NULL, NULL, N'Trong niên hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  69, N'Máy tính', N'Desktop', N'Dell Vostro 3670', NULL,
  N'45B7HY2', NULL, NULL, N'Production',
  N'Phòng cân - Nguyên liệu', N'Windows 10', N'Intel Core i7 9700', N'8 GB', N'1 TB HDD',
  N'Yes', NULL,
  N'10/01/2020', N'10/01/2023', N'10/01/2023', N'09/30/2024',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Máy tính đã hết niên hạn sử dụng nhưng sử dụng bình thường',
  NULL, NULL, NULL, N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  70, N'Máy tính', N'Desktop', N'Dell Vostro 3670', NULL,
  N'9HQP6Z2', NULL, NULL, N'Production',
  N'Phòng Cân - Pha Loãng', N'Windows 10', N'Intel Core i5 9400', N'8 GB', N'1 TB HDD',
  N'Yes', NULL,
  N'10/01/2020', N'10/01/2023', N'10/01/2023', N'09/30/2024',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Máy tính đã hết niên hạn sử dụng nhưng sử dụng bình thường',
  NULL, NULL, NULL, N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  71, N'Máy tính', N'Desktop', N'DESKTOP-CCDC', NULL,
  N'SAMA', NULL, NULL, N'Production',
  N'Phòng CCDC', N'Windows 10', N'Intel(R) Pentium(R) CPU G4400', N'8 GB', N'256 GB SSD',
  N'Yes', NULL,
  N'04/01/2017', N'03/31/2020', N'10/01/2023', N'03/31/2020',
  N'Đã hết hạn', N'Chưa được gia hạn', NULL, N'Máy tính đã hết niên hạn sử dụng , hiện không đủ điều kiện nâng cấp lên windows 11',
  N'Đề xuất mua mới', NULL, NULL, N'Mua mới', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  72, N'Máy tính', N'Desktop', N'DESKTOP-VEOFTOV', NULL,
  N'SAMA', NULL, NULL, N'Production',
  N'Phòng Trưởng Ca', N'Windows 10', N'Intel Pentium G3250', N'8 GB - 1400 - 1/4 slot - DDR3', N'240 GB SSD - SAMSUNG',
  N'Yes', NULL,
  N'07/01/2022', N'06/30/2025', N'10/01/2023', N'06/30/2025',
  N'Đã hết hạn', N'Chưa được gia hạn', NULL, N'Máy tính đã hết niên hạn sử dụng , hiện không đủ điều kiện nâng cấp lên windows 11',
  N'Đề xuất mua mới', NULL, NULL, N'Mua mới', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  73, N'Máy tính', N'Desktop', N'Dell Vostro', NULL,
  NULL, NULL, NULL, N'Maintenance Engineer (ME)',
  N'Phùng Thanh Nhiều', N'Windows 11', N'Intel Pentium G5420', N'8GB-BUS2400-2/2slot', N'256GB SSD-Lexar',
  NULL, NULL,
  N'05/01/2019', N'04/30/2022', N'04/01/2026', N'04/01/2027',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Máy tính sử dụng bình thường, màn hình bị xuất hiện sọc ngang không ảnh hưởng công việc',
  NULL, NULL, NULL, N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  74, N'Máy tính', N'Desktop', N'Dell Vostro 3671', NULL,
  N'24K2R33', NULL, NULL, N'Flavor',
  N'RnD', N'Windows 11', N'Intel Core i7 9700', N'16GB', N'1 TB HDD',
  N'Yes', NULL,
  N'07/01/2021', N'06/30/2024', N'10/01/2023', N'06/30/2024',
  N'Đã hết hạn', N'Chưa được gia hạn', NULL, N'Sử dụng bình thường',
  NULL, NULL, NULL, N'Trong niên hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  75, N'Máy tính', N'Desktop', N'Dell Vostro 3681', NULL,
  N'6WB50G3', NULL, NULL, N'Warehouse',
  N'Thượng Đình Phong', N'Windows 11', N'Intel Core i3 10100', N'8GB - 2666 - 2/2 slot', N'500GB SSD - SAMSUNG 860EVO',
  N'Yes', N'45gb / 99gb',
  N'11/01/2022', N'10/31/2025', N'10/14/2026', N'10/31/2025',
  N'Đã hết hạn', N'Chưa được gia hạn', NULL, N'Máy tính sử dụng bình thường
Màn hình bị cũ, màn bị loe màu , bị chói',
  N'Nâng cấp RAM lên 1 thanh 16GB để hoạt động mượt mà với Windows 11', NULL, NULL, N'Cần nâng cấp RAM', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  76, N'Máy tính', N'Laptop', N'HP ProBook 450 G6 Notebook PC', NULL,
  N'5CD922776X', NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, N'Intel Core i5 8th', N'8 GB', N'128 GB SSD + 1 TB HDD',
  NULL, NULL,
  N'02/01/2019', N'01/31/2022', N'10/01/2023', N'09/30/2024',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Máy tính đã hết niên hạn sử dụng nhưng sử dụng bình thường',
  NULL, NULL, NULL, N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  77, N'Máy tính', N'Laptop', N'HP ProBook 440 G5 Notebook', NULL,
  N'5CD822515W', NULL, NULL, N'Flavor',
  N'Trần Lực', N'Windows 11', N'Intel Core i5 8250U', N'8 GB', N'256 GB SSD + 500 GB HDD',
  N'Yes', N'39.5GB free of 49.5',
  N'06/01/2018', N'05/31/2021', N'05/01/2026', N'05/01/2027',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Máy tính sử dụng bình thường',
  NULL, NULL, NULL, N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  78, N'Máy tính', N'Laptop', N'HP ENVY x360 13.3', NULL,
  N'CND2452QPX', NULL, NULL, N'PE',
  N'Nguyễn Tấn Phát', N'Windows 11', N'12th Gen Intel Core i7-1250U', N'8GB - 4627 - 2/2 slot', N'512 GB SSD',
  N'Yes', N'20.8gb/ 99gb',
  N'06/01/2023', N'05/31/2026', N'10/12/2026', N'10/12/2027',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Máy tính sử dụng bình thường, tiếp tục gia hạn',
  NULL, NULL, NULL, N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  79, N'Máy tính', N'Laptop', N'HP 240 G8', NULL,
  N'5CG147C3RG', NULL, NULL, N'Sales',
  N'Huỳnh Nguyễn Hồng Hạnh', N'Windows 11', N'Intel Core i5-1135G7', N'8GB - 2667 - 1/2 slot', N'500GB SSD',
  N'Yes', N'12gb / 99gb',
  NULL, N'12/30/1902', N'10/19/2026', N'10/19/2027',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Sử dụng bình thường, chưa có nhu cầu nâng cấp',
  NULL, NULL, NULL, N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  80, N'Máy tính', N'Laptop', N'HP Pavilion 14 Laptop PC 14-dv2000', NULL,
  N'5CD0378CDL', NULL, NULL, N'HR',
  N'Trần Thị Phương Thanh', N'Windows 11', N'12th Gen Intel(R) Core(TM) i5-1235U', N'16GB', N'500 GB SSD',
  N'Yes', NULL,
  N'05/01/2021', N'04/30/2024', N'10/01/2023', N'09/30/2024',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Trong lúc sử dụng bị nóng máy và đột ngột tắt thường xuyên Sau khi kiểm tra do máy tính bị lỗi nguồn Adapter mainboard và dây sạc bị hư',
  N'Đã sửa và hiện tại không gặp vấn đề gì nhưng đề xuất thay thế cho năm 2024', NULL, N'Đã sửa ngày 27/10/2023', N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  81, N'Máy tính', N'Laptop', N'HP Probook 440 G3 Notebook', NULL,
  N'5CD62365R4', NULL, NULL, N'Flavor',
  N'Trần Thị Thọ', N'Windows 10', N'Intel Core i5 6200U', N'8GB - 2133 - 2/2 SLOT', N'500 GB HDD - WDC',
  N'Yes', N'25.3 gb free of 49.5',
  N'06/01/2016', N'06/01/2019', N'05/01/2026', N'06/01/2019',
  N'Đã hết hạn', N'Chưa được gia hạn', NULL, N'Máy tính đã hết niên hạn sử dụng và sử dụng bình thường nhưng còn sử dụng ổ cứng HDD',
  N'Cần nâng cấp ổ cứng SSD', NULL, NULL, N'Cần nâng cấp', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  82, N'Máy tính', N'Laptop', N'Dell G15 5515 Ryzen Edition', NULL,
  N'2M99ZJ3', NULL, NULL, N'ME',
  N'Phạm Ngọc Thắng', N'Windows 11', N'AMD Ryzen 7 5800H', N'16 GB - 3200 - 2/2 slot', N'512 GB SSD KDI',
  N'Yes', N'5GB / 99GB',
  N'10/01/2021', N'09/30/2024', N'10/12/2026', N'09/30/2024',
  N'Đã hết hạn', N'Chưa được gia hạn', NULL, N'Máy tính bị dơ lớp chống chói màn hình, mặt A,B,C nhiều chỗ bị bễ, đã đề xuất, báo giá nâng cấp',
  NULL, NULL, NULL, N'Chờ sửa chữa', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  83, N'Máy tính', N'Laptop', N'HP ProBook 440 G6 Notebook PC', NULL,
  N'5CD9312KV7', NULL, NULL, N'Production',
  N'Nguyễn Thanh Xuân', NULL, N'Intel Core i5 8265U', N'8 GB', N'256 GB SSD + 1TB HDD',
  NULL, NULL,
  N'09/01/2018', N'08/31/2021', NULL, N'08/31/2021',
  N'Đã hết hạn', N'Chưa được gia hạn', NULL, N'Sử dụng bình thường',
  NULL, NULL, NULL, NULL, N'Disabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  84, N'Máy tính', N'Desktop', N'DESKTOP-79EKIAO', NULL,
  N'SAMA', NULL, NULL, N'Admin Plant',
  N'Lê Thị Như Mỹ', N'Windows 10', N'Intel Pentium G3440', N'8 GB', N'500 GB HDD',
  NULL, NULL,
  N'04/01/2017', N'03/31/2020', N'10/01/2023', N'09/30/2024',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Sử dụng bình thường',
  NULL, NULL, NULL, N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  85, N'Máy tính', N'Desktop', N'Lenovo V50t 13IOB G2', NULL,
  N'PC2A6LAG', NULL, NULL, N'Finance & Accounting',
  N'Trịnh Thu Hằng', N'Windows 11', N'Intel Core i3 10105', N'8GB -2667-1/2 slot', N'240GB SSD SAMSUNG',
  N'Yes', N'27.9 gb free of 49.4',
  N'05/01/2022', N'04/30/2025', N'05/01/2026', N'04/30/2025',
  N'Đã hết hạn', N'Chưa được gia hạn', NULL, N'Sử dụng bình thường',
  NULL, NULL, NULL, N'Trong niên hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  86, N'Máy tính', N'Laptop', N'HP ProBook 440 G6 Notebook', NULL,
  N'5CD9105BTZ', NULL, NULL, N'Flavor',
  N'Trương Lại Thùy An', N'Windows 11', N'Intel Core i3 8145U', N'12GB - 2400 - 2/2 SLOT', N'512 GB SSD',
  N'Yes', N'43.07 free / 90gb',
  N'06/01/2020', N'06/01/2023', N'10/22/2026', N'06/01/2023',
  N'Đã hết hạn', N'Chưa được gia hạn', NULL, N'Máy tính đã hết niên hạn, sử dụng giật lag, mở một lần 5-6 file excel(phân tích dữ liệu) + Copilot(tổng hợp dữ liệu ) + 10  tab chrome',
  NULL, NULL, NULL, N'Nâng cấp máy tính', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  87, N'Máy tính', N'Desktop', N'DESKTOP-6U08JSD', NULL,
  N'SAMA', NULL, NULL, N'Quality Management (QM)',
  N'Trương Thị Hồng Phước', NULL, N'Intel Pentium G3450', N'8 GB', N'120 GB SSD + 500 GB HDD',
  NULL, NULL,
  N'06/01/2018', N'05/31/2021', N'10/01/2023', N'05/31/2021',
  N'Đã hết hạn', N'Chưa được gia hạn', NULL, N'Máy tính đã hết niên hạn sử dụng, máy tính đã đầy ổ đĩa dẫn tới tính trạng zalo cảnh báo đầy dung lượng, về lâu dài máy tính sẽ chậm, tắt máy đột ngột',
  N'Cần nâng cấp lên SSD 256 GB', 1300000, NULL, N'Cần nâng cấp', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  88, N'Máy tính', N'Laptop', N'HP ProBook 440 G5 Notebook PC', NULL,
  N'5CD7486K07', NULL, NULL, N'Quality Management (QM)',
  N'Trương Thị Hồng Phước', NULL, N'Intel Core i5-8250U', N'8 GB', N'250 GB SSD',
  NULL, NULL,
  N'11/01/2017', N'10/31/2020', N'10/01/2023', N'09/30/2024',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Sử dụng bình thường',
  NULL, NULL, NULL, N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  89, N'Máy tính', N'Laptop', N'HP ProBook 440 G6 Notebook PC', NULL,
  N'5CD92275JL', NULL, NULL, N'Commnercial',
  N'Võ Châu Xuyên', NULL, N'Intel Core i3 8145U', N'8 GB', N'128 GB SSD + 1 TB HDD',
  NULL, NULL,
  N'11/01/2020', N'11/01/2023', N'10/01/2023', N'09/30/2024',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Máy tính đã hết niên hạn sử dụng nhưng sử dụng bình thường',
  NULL, NULL, NULL, N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  90, N'Máy tính', N'Laptop', N'HP Probook 430 G3 Base', NULL,
  N'5CD705139H', NULL, NULL, N'Ingredient',
  N'Võ Lâm Minh Thư', NULL, N'Intel Core i5 6200U', N'8 GB', N'240 GB SSD',
  NULL, NULL,
  N'06/01/2022', N'05/31/2025', N'10/01/2023', N'05/31/2025',
  N'Đã hết hạn', N'Chưa được gia hạn', NULL, N'Sử dụng bình thường',
  NULL, NULL, NULL, N'Trong niên hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  91, N'Máy tính', N'Desktop', N'Dell Vostro 3670', NULL,
  N'7VL4WV2', NULL, NULL, N'QM',
  N'Võ Thị Hương Cont', N'Windows 11', N'Inel Pentium Gold G5400', N'12GB - 8GB 3200 & 4GB 2133 - 2/2 slot', N'500GB SSD - SAMSUNG 870EVO',
  N'Yes', N'49.7gb / 99gb',
  N'06/01/2020', N'06/01/2023', N'10/12/2026', N'10/12/2027',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Máy sử dụng bình thường , màn hình cũ bị tối góc',
  NULL, NULL, NULL, N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  92, N'Máy tính', N'Desktop', N'Lenovo', NULL,
  N'PC1N4E1L', NULL, NULL, N'QM',
  N'Nguyễn Thị Lan', N'Windows 11', N'Intel Core i3-10100', N'16GB - 2133 -1/2 slot', N'240GB - SSD SAMSUNG',
  N'Yes', N'2.3gb / 99gb',
  NULL, N'12/30/1902', N'10/14/2026', N'10/14/2027',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Máy sử dụng bình thường',
  NULL, NULL, NULL, N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  93, N'Máy tính', N'Desktop', N'Dell  Vostro 3670', NULL,
  N'HHS2WV2', NULL, NULL, N'QM',
  N'Nguyễn Quốc Cường', N'Windows 11', N'Intel Pentium Gold G5400', N'12GB - 8GB 3200 - & 4GB 2133 DDR4 - 2/2 slot', N'500GB SSD - SAMSUNG 870EVO',
  N'Yes', N'3gb / 99gb',
  N'08/01/2019', N'07/31/2022', N'10/12/2026', N'10/12/2027',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Máy tính đã hết niên hạn sử dụng nhưng sử dụng bình thường',
  NULL, NULL, NULL, N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  94, N'Máy tính', N'Laptop', N'HP ProBook 440 G6 Notebook', NULL,
  N'5CD92274TV', NULL, NULL, N'Production',
  N'Production Leader', N'Windows 11', N'Intel Core i5 8265U', N'8GB - 2400 - DDR3 - 2/2 slot', N'500GB SSD - WDC',
  N'Yes', NULL,
  NULL, N'12/30/1902', N'10/12/2026', N'10/12/2027',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Máy sử dụng bình thường , cần lên Win11',
  N'Cần nâng cấp Windows 11', NULL, NULL, N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  95, N'Máy tính', N'Laptop', N'HP ProBook 440 G6 Notebook', NULL,
  N'5CD905798S', NULL, NULL, N'Production',
  N'Đào Minh Quý', N'Windows 11', N'Intel Core i5 8265U', N'8GB - 2400 - DDR3 - 2/2 slot', N'500GB SSD - SAMSUNG 870EVO',
  N'Yes', NULL,
  NULL, N'12/30/1902', N'04/14/2026', N'04/14/2027',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Sử dụng bình thường , màn bị sức ron màn hình(một phần nhỏ ở cạnh)',
  N'Cần nâng cấp Windows 11', NULL, NULL, N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  96, N'Máy tính', N'Desktop', N'Dell  Vostro', NULL,
  N'SAMA', NULL, NULL, N'Quality Management (QM)',
  N'Nguyễn Hữu Nhâm', NULL, N'Intel Pentium Gold G5400', N'8 GB', N'1 TB HDD',
  NULL, NULL,
  N'08/01/2019', N'07/31/2022', NULL, N'07/31/2022',
  N'Đã hết hạn', N'Chưa được gia hạn', NULL, N'Chờ nâng cấp',
  N'Cần nâng cấp ổ cứng SSD', NULL, NULL, NULL, N'Disabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  97, N'Máy tính', N'Laptop', N'HP 340S G7 Notebook PC', NULL,
  N'5CD1088RXS', NULL, NULL, N'Delivery',
  N'Lê Quang Bình', N'Windows 11', N'10th Intel Core i5 1035G1', N'12GB -2667-2/2 slot', N'240GB SSD - NVME - Toshiba',
  N'Yes', N'5GB / 99GB',
  NULL, N'12/30/1902', N'10/12/2026', N'10/12/2027',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Máy cũ của chị Ngọc , hiện tại sử dụng bình thường',
  NULL, NULL, NULL, N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  98, N'Máy tính', N'Laptop', N'HP Omnibook  Flip Laptop 14 fp0057TU', NULL,
  N'8CG53240GZ', NULL, NULL, N'Planning',
  N'Đoàn Thị Ngọc', N'Windows 11', N'Intel Core 5 120U', N'16GB - 5200 - 2/2 slot', N'512GB SSD',
  N'Yes', N'56gb / 99gb',
  N'04/10/2026', N'04/09/2029', N'10/14/2026', N'10/14/2027',
  N'Còn hạn', N'Còn hạn', NULL, N'Máy tính mới mua , sử dụng bình thường',
  NULL, NULL, NULL, N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  99, N'Máy tính', N'Laptop', N'HP Probook 440 G7', NULL,
  N'5CD0190YSY', NULL, NULL, N'Planning',
  N'Nguyễn Trường An', N'Windows 11', N'Intel Core i3 10110U', N'8GB -BUS2667- DDR3 - 2/2 slot', N'256GB SSD HP',
  N'Yes', N'36.24gb / 99gb',
  NULL, N'12/30/1902', N'10/14/2026', N'12/30/1902',
  N'Đã hết hạn', N'Chưa được gia hạn', NULL, N'Máy tính sử dụng bình thường',
  N'Cần nâng cấp RAM để đảm bảo sử dụng ổn định Windows 11', NULL, NULL, N'Cần nâng cấp RAM', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  100, N'Máy tính', N'Desktop', N'Desktop Think Centre Neo', NULL,
  NULL, NULL, NULL, N'WH & Planning',
  N'Lê Huỳnh Giang', N'Windows 11', N'Intel Core i3 13100', N'8GB -3200- DDR4 - 1/2slot', N'256GB SSD SAMSUNG',
  NULL, NULL,
  NULL, N'12/30/1902', N'04/15/2026', N'04/15/2027',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Sử dụng binh thường',
  NULL, NULL, NULL, N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  101, N'Máy tính', N'Desktop', N'Dell Vostro', NULL,
  NULL, NULL, NULL, N'Quality Management (QM)',
  N'Nguyễn Quang Liêm', N'Windows 11', N'Intel Pentium Gold G5420', N'8GB - 2400 - DDR3 - 2/2 slot', N'500GB SSD - SAMSUNG 870EVO',
  NULL, NULL,
  NULL, N'12/30/1902', N'04/01/2026', N'12/30/1902',
  N'Đã hết hạn', N'Chưa được gia hạn', NULL, N'Đa tác vụ như excel(file nhẹ) và ERP cùng lúc bị lag',
  N'Nâng cấp Ram với Bus cao hơn', NULL, NULL, N'Nâng cấp Ram', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  102, N'Máy tính', N'Desktop', N'Dell Vostro', NULL,
  NULL, NULL, NULL, N'Quality Management (QM)',
  N'Nguyễn Quốc Cường', N'Windows 11', N'Intel Pentium Gold G5400', N'8GB - 2400 - DDR3 - 2/2 slot', N'500GB SSD - SAMSUNG 870EVO',
  NULL, NULL,
  NULL, N'12/30/1902', N'04/01/2026', N'12/30/1902',
  N'Đã hết hạn', N'Chưa được gia hạn', NULL, N'Sử dụng bình thường',
  NULL, NULL, NULL, NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  103, N'Máy tính', N'Desktop', N'Dell Vostro', NULL,
  NULL, NULL, NULL, N'Quality Management (QM)',
  N'Huỳnh Nguyễn Tấn Thành', N'Windows 11', N'Intel Pentium Gold G5400', N'8GB - 2400 - DDR3 - 2/2 slot', N'500GB SSD - SAMSUNG 870EVO',
  NULL, NULL,
  NULL, N'12/30/1902', N'04/01/2026', N'12/30/1902',
  N'Đã hết hạn', N'Chưa được gia hạn', NULL, N'Sử dụng bình thường',
  NULL, NULL, NULL, NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  104, N'Máy tính', N'Desktop', N'DESKTOP PV Computer', NULL,
  N'SAMA', NULL, NULL, N'Warehouse',
  N'Nguyễn Thị Ngọc Tuyết', N'Windows 10', N'Intel Pentium CPU G3260', N'8GB - 1400 - 1/4 slot', N'250GB SSD - SAMSUNG 860 EVO',
  N'Yes', NULL,
  NULL, N'12/30/1902', N'10/14/2026', N'12/30/1902',
  N'Đã hết hạn', N'Chưa được gia hạn', NULL, N'Máy đã hết niên hạn , cần mua mới
Màn hình bị cũ, màn bị loe màu , bị chói',
  N'Cần mua mới', NULL, NULL, N'Cần mua mới', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  105, N'Máy tính', N'Laptop', N'HP 340s G7', NULL,
  N'5CD1389YPD', NULL, NULL, N'Sales',
  N'Nguyễn Thị Lan Anh', N'Windows 11', N'Intel Core i3 1005G1', N'8GB - 2667 - 2/2 slot', N'250GB SSD - WDC',
  N'Yes', N'41.7 Gb free',
  NULL, N'12/30/1902', N'10/19/2026', N'12/30/1902',
  N'Đã hết hạn', N'Chưa được gia hạn', NULL, N'Ngoại quan máy bị nứt vỏ mặt C,gãy khúc bản lề,  màn hình bị ám màu nặng, đóm màu',
  NULL, NULL, NULL, N'Sửa chữa hoặc mua mới', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  106, N'Máy tính', N'Laptop', N'HP 340s G7', NULL,
  N'5CD13681KL', NULL, NULL, N'Sales',
  N'Nguyễn Ngọc Anh Thư', N'Windows 11', N'Intel Core i3 1005G1', N'8GB - 2667 - 2/2 slot', N'256 GB SSD Kioxai',
  N'Yes', N'20gb / 99gb',
  NULL, N'12/30/1902', N'10/19/2026', N'10/19/2027',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Sử dụng bình thường, chưa có nhu cầu nâng cấp',
  NULL, NULL, NULL, N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  107, N'Máy tính', N'Laptop', N'HP 240 G8', NULL,
  N'5CG20413T4', NULL, NULL, N'Sales',
  N'Võ Ngọc Hà', N'Windows 11', N'Intel Core i5-1135G7', N'8GB - 3200 - 1/2 slot', N'500GB SSD - Intel',
  N'Yes', NULL,
  NULL, N'12/30/1902', N'04/26/2026', N'12/30/1902',
  N'Đã hết hạn', N'Chưa được gia hạn', NULL, N'Sử dụng bình thường',
  NULL, NULL, NULL, N'Đang được lưu kho', N'Disabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  108, N'Máy tính', N'Laptop', N'HP Omnibook  X Flip Laptop 14 fp0057TU', NULL,
  N'8CG5513YS8', NULL, NULL, N'Plant Admin',
  N'Lê Đức Huy', N'Windows 11', N'Intel Core i5 120U', N'16GB - 5200 - 2/2 slot', N'500GB SSD - SK Hynix',
  N'Yes', NULL,
  NULL, N'12/30/1902', N'10/12/2026', N'10/12/2027',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Sử dụng bình thường',
  NULL, NULL, NULL, N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  109, N'Máy tính', N'Laptop', N'HP Probook 440 G6', NULL,
  N'5YM63PA#UUF', NULL, NULL, N'HR',
  N'Lâm Gia Hào', N'Windows 11', N'Intel Core i3-10210U', N'8GB-2400- 1/2 slot', N'240GB SSD - WDC',
  N'Yes', NULL,
  NULL, N'12/30/1902', N'10/28/2026', N'10/28/2027',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Máy tính đã chai pin nặng , đã đặt mua pin',
  NULL, NULL, NULL, N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  110, N'Máy tính', N'Desktop', N'Dell Vostro 3670', NULL,
  NULL, NULL, NULL, N'Phòng cân',
  N'Phòng cân', N'Windows 10', N'Intel Pentium Gold G5420', N'8GB-2133-2/2slot', N'500GB SSD - WDC',
  NULL, NULL,
  NULL, N'12/30/1902', N'05/06/2026', N'05/06/2027',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Máy sử dụng bình thường',
  NULL, NULL, NULL, N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  111, N'Máy tính', N'Desktop', N'SAMA', NULL,
  NULL, NULL, NULL, N'Phòng CCDC',
  N'Phòng CCDC', N'Windows 10', N'Intel Pentium G4400', N'8GB-2133-2/2slot', N'240GB - SSD SAMSUNG',
  NULL, NULL,
  NULL, N'12/30/1902', N'05/01/2026', N'05/01/2027',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Máy sử dụng bình thường',
  NULL, NULL, NULL, N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  112, N'Máy tính', N'Laptop', N'HP OMINIBOOK X FLIP 14', NULL,
  N'8CG5313FLX', NULL, NULL, N'PMI',
  N'Hamasaki Yuya', N'Windows 11', N'Intel Core Ultra 7 258v', N'32GB - 8533- 2/2 SLOT', N'500GB SSD - SAMSUNG',
  N'Yes', N'10gb / 99gb',
  NULL, N'12/30/1902', N'10/22/2026', N'10/22/2027',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Máy sử dụng bình thường',
  NULL, NULL, NULL, N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  113, N'Máy tính', N'Desktop', N'Dell Vostro 3670', NULL,
  N'6C4B0T2', NULL, NULL, N'Application',
  N'Phan Thị Tuyết Trinh', N'Windows 11', N'Intel Pentium Gold G5400', N'8GB - 2400 - 2/2 SLOT', N'500GB SSD',
  N'Yes', N'7.8gb / 99gb',
  NULL, N'12/30/1902', N'10/22/2026', N'10/22/2027',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Máy tính sử dụng bình thường
Màn hình bị sọc ngang = > Đã dùng màn hình của chị Ngọc để thay thế tạm',
  NULL, NULL, NULL, N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  114, N'Máy tính', N'Desktop', N'SAMA', NULL,
  NULL, NULL, NULL, N'Application',
  N'Nguyễn Ngọc Bảo Trân', N'Windows 11', N'INTEL PENTIUM G3440', N'8GB - DDR3 - 1600 - 1/4 SLOT', N'500GB SSD - SAMSUNG 870EVO',
  N'Yes', N'4gb / 99gb',
  NULL, N'12/30/1902', N'10/22/2026', N'10/22/2027',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Máy sử dụng bình thường',
  NULL, NULL, NULL, N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  115, N'Máy tính', N'Desktop', N'Dell Vostro 3670', NULL,
  NULL, NULL, NULL, N'Application',
  N'Huỳnh Ngọc Mạnh', N'Windows 11', N'Intel pentium gold g5420', N'8GB - 2400 - 1/2 SLOT', N'500GB SSD - SAMSUNG 870EVO',
  N'Yes', N'3.5 gb / 99gb',
  NULL, N'12/30/1902', N'10/22/2026', N'10/22/2027',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Máy sử dụng bình thường',
  NULL, NULL, NULL, N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  116, N'Máy tính', N'Desktop', N'Lenovo', NULL,
  NULL, NULL, NULL, N'Application',
  N'Phan Thị Thúy', N'Windows 11', N'Intel Pentium Gold G5420', N'8GB - 2400 - 2/2 SLOT', N'240GB SSD SATA - Solid State',
  NULL, N'45.1gb free of 49.5',
  NULL, N'12/30/1902', N'05/01/2026', N'05/01/2027',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Máy tính sử dụng bình thường',
  NULL, NULL, NULL, N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  117, N'Máy tính', N'Desktop', N'Dell Vostro 3671', NULL,
  NULL, NULL, NULL, N'Flavor',
  N'Huỳnh Thị Kim', N'Windows 11', N'Intel Core i5 9400', N'8GB - 2666- 1/2 SLOT', N'1TB HDD - WDC',
  N'Yes', N'8.7gb / 99gb',
  NULL, N'12/30/1902', N'10/22/2026', N'12/30/1902',
  N'Đã hết hạn', N'Chưa được gia hạn', NULL, N'Máy tính sử dụng bình thường nhưng ổ cứng là HDD cần nâng cấp lên ổ SSD',
  NULL, NULL, NULL, N'Cần nâng cấp SSD', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  118, N'Máy tính', N'Laptop', N'Dell Vostro 3671', NULL,
  NULL, NULL, NULL, N'Flavor',
  N'Trần Thị Cẩm Nhung', N'Windows 11', N'Intel Core i5 9700', N'16GB - 2666- 2/2 SLOT', N'1TB HDD',
  N'Yes', N'6.3gb / 99gb',
  NULL, N'12/30/1902', N'10/22/2026', N'12/30/1902',
  N'Đã hết hạn', N'Chưa được gia hạn', NULL, N'Máy tính sử dụng bình thường nhưng ổ cứng là HDD cần nâng cấp lên ổ SSD',
  NULL, NULL, NULL, N'Cần nâng cấp SSD', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  119, N'Máy tính', N'Laptop', N'Hp Pavillion 14', NULL,
  NULL, NULL, NULL, N'HR',
  N'Đinh Thị Thủy', N'Windows 11', N'8th  i5-8265U', N'8GB - 2400', N'240GB SSD - WDC',
  N'Yes', NULL,
  NULL, N'12/30/1902', N'05/01/2026', N'12/30/1902',
  N'Đã hết hạn', N'Chưa được gia hạn', NULL, N'Máy tính chỉ dùng cho việc nhập liệu lên bảo trì tòa nhà, đã được thu hồi và lưu trữ trong kho',
  NULL, NULL, NULL, N'Đang được lưu kho', N'Disabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  120, N'Máy tính', N'Laptop', NULL, NULL,
  NULL, NULL, NULL, NULL,
  NULL, NULL, NULL, NULL, NULL,
  NULL, NULL,
  NULL, N'12/30/1902', NULL, N'12/30/1902',
  N'Đã hết hạn', N'Chưa được gia hạn', NULL, NULL,
  NULL, NULL, NULL, NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  121, N'Máy tính', N'Laptop', N'HP 240 G8 Notebook PC', NULL,
  NULL, NULL, NULL, N'Admin Plant',
  N'Lê Thị Như Mỹ', N'Windows 11', N'11th Intel Core i5 1135G7', N'8GB - 3200 - 1/2 slot', N'240GB SSD - NVME - Samsung',
  NULL, NULL,
  NULL, N'12/30/1902', N'05/26/2026', N'05/26/2027',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Máy cũ anh Quốc , được bàn giao lại cho chị Mỹ',
  NULL, NULL, NULL, N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  122, N'Máy tính', N'Laptop', N'Dell Precision 7680', NULL,
  NULL, NULL, NULL, N'PJ',
  N'Trần Tiến Din', N'Windows 11', N'13th Intel Core i7-13580HX', N'32GB - 5600 - 1/1 SLOT', N'1TB SSD - NVME - KINGSTON',
  N'Yes', N'11gb / 99gb',
  N'05/26/2026', N'05/25/2029', N'10/12/2026', N'05/25/2029',
  N'Còn hạn', N'Còn hạn', NULL, N'Máy mới được cấp vào tháng 5-2026',
  NULL, NULL, NULL, N'Trong niên hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  123, N'Máy tính', N'Laptop', N'HP Probook 450 G10', NULL,
  NULL, NULL, NULL, N'IT',
  N'Nguyễn Thành Đạt', N'Windows 11', N'13th Intel Core i5 1335U', N'16Gb', N'512 GB SSD',
  N'Yes', NULL,
  N'01/01/2023', N'12/31/2025', N'10/16/2026', N'10/16/2027',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Sử dụng bình thường',
  NULL, NULL, NULL, N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  124, N'Máy tính', N'Laptop', N'HP Omnibook  Flip Laptop 14', NULL,
  NULL, NULL, NULL, N'HR',
  N'Nguyễn Xuân Sơn', N'Windows 11', N'Ryzen 5 340', N'16GB', N'512 GB SSD',
  N'Yes', NULL,
  N'05/01/2021', N'04/30/2024', N'10/16/2026', N'04/30/2024',
  N'Đã hết hạn', N'Chưa được gia hạn', NULL, N'Sử dụng bình thường',
  NULL, NULL, NULL, N'Trong niên hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  125, N'Máy tính', N'Desktop', N'Dell Vostro 3671', NULL,
  N'2F01R33', NULL, NULL, N'ME',
  N'Phùng Thanh Nhiều', N'Windows 11', N'Intel Pentium G5420', N'8GB - 2400 - 2/2 slot', N'256GB SSD-Lexar',
  N'Yes', N'7.82gb / 99gb',
  N'05/01/2019', N'04/30/2022', N'10/12/2026', N'10/12/2027',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Máy tính sử dụng bình thường
Màn hình bị xuất hiện sọc ngang đề nghị thay thế',
  NULL, NULL, NULL, N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  126, N'Máy tính', N'Laptop', N'HP Omnibook 5 16inch', NULL,
  NULL, NULL, NULL, N'IT',
  N'Trần Hải Nhân', N'Windows 11', N'Ryzen AI 7 350', N'16Gb', N'512GB SSD',
  N'Yes', NULL,
  N'10/15/2026', N'10/14/2029', N'10/16/2026', N'10/16/2027',
  N'Còn hạn', N'Còn hạn', NULL, N'Máy mới vừa được đầu tư vào tháng 10/2026',
  NULL, NULL, NULL, N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  127, N'Máy tính', N'Desktop', N'Desktop Think Centre Neo', NULL,
  NULL, NULL, NULL, N'Finance & Accounting',
  N'Lê Quỳnh Giang', N'Windows 11', N'Intel Core i3 13100', N'8GB -3200- DDR4 - 1/2slot', N'256GB SSD SAMSUNG',
  N'Yes', NULL,
  NULL, N'12/30/1902', N'04/15/2026', N'04/15/2027',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Sử dụng binh thường',
  NULL, NULL, NULL, N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  128, N'Máy tính', N'Desktop', N'Dell Vostro 3670', NULL,
  NULL, NULL, NULL, N'QM',
  N'Nguyễn Quang Liêm', N'Windows 11', N'Intel Pentium Gold G5420', N'12GB - 8GB 3200 & 4GB 2133 - 2/2 slot', N'500GB SSD - SAMSUNG 870EVO',
  N'Yes', N'7.34gb / 99gb',
  NULL, N'12/30/1902', N'10/12/2026', N'10/12/2027',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Máy tính sử dụng bình thường 
màn hình đã cũ, bị mờ gốc màn',
  NULL, NULL, NULL, N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  129, N'Máy tính', N'Desktop', N'Dell Vostro 3670', NULL,
  NULL, NULL, NULL, N'QM',
  N'Nguyễn Quốc Thắng', N'Windows 11', N'Intel Pentium Gold G5400', N'12GB - 8GB 3200 & 4GB 2133 - 2/2 slot', N'500GB SSD - SAMSUNG 870EVO',
  N'Yes', N'10.3gb / 99gb',
  NULL, N'12/30/1902', N'10/12/2026', N'10/12/2027',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Máy tính sử dụng bình thường
 màn hình còn mới',
  NULL, NULL, NULL, N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  130, N'Máy tính', N'Desktop', N'Dell Vostro 3670', NULL,
  NULL, NULL, NULL, N'QM',
  N'Nguyễn Huỳnh Tấn Thành', N'Windows 11', N'Intel Pentium Gold G5400', N'12GB - 8GB 3200 & 4GB 2133 - 2/2 slot', N'500GB SSD - SAMSUNG 870EVO',
  N'Yes', N'11gb / 99gb',
  NULL, N'12/30/1902', N'10/12/2026', N'10/12/2027',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Máy sử dụng bình thường, 
màn hình đã cũ, bị mờ gốc màn',
  NULL, NULL, NULL, N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  131, N'Máy tính', N'Laptop', N'HP 240 G8 Notebook PC', NULL,
  N'5CG2040XHN', NULL, NULL, N'Plant Admin',
  N'Lê Thị Như Mỹ', N'Windows 11', N'11th Intel Core i5 1135G7', N'8GB - 3200 - 1/2 slot', N'240GB SSD - NVME - Samsung',
  N'Yes', N'5GB / 99GB',
  NULL, N'12/30/1902', N'10/14/2026', N'10/14/2027',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Máy cũ anh Quốc , được bàn giao lại cho chị Mỹ , máy tính sử dụng bình thường
Màn hình desktop cũ, màn bị chói',
  NULL, NULL, NULL, N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  132, N'Máy tính', N'Laptop', N'HP 340s G7', NULL,
  NULL, NULL, NULL, N'Marketing',
  N'Nguyễn Phan Thùy Dương', N'Windows 11', N'10th Intel Core i3 1035G1', N'8GB - 2667 - 2/2 slot', N'240GB SSD - NVME',
  N'Yes', N'6.58GB / 99GB',
  NULL, N'12/30/1902', N'10/21/2026', N'10/21/2027',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Hiệu năng máy tính bình thường , nhu cầu sử dụng user không cao, hiện tại chưa cần nâng cấp',
  NULL, NULL, NULL, N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  133, N'Máy tính', N'Laptop', N'HP Omnibook  Flip Laptop 14', NULL,
  NULL, NULL, NULL, N'Finance & Accounting',
  N'Lê Nguyễn Phương Thư', N'Windows 11', N'Intel Core Ultra 5 226V', N'16Gb', N'512GB SSD',
  N'Yes', NULL,
  N'05/01/2026', N'04/30/2029', N'10/23/2026', N'04/30/2029',
  N'Còn hạn', N'Còn hạn', NULL, N'Máy tính mới , đầu tư vào tháng 5/2026',
  NULL, NULL, NULL, N'Trong niên hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  134, N'Máy tính', N'Laptop', N'HP 340s G7', NULL,
  NULL, NULL, NULL, NULL,
  N'Ngô Ngọc Phương Mai', N'Windows 11', N'Intel Core i3 1005G1', N'8GB', N'256GB SSD',
  N'Yes', N'20gb / 99gb',
  NULL, N'12/30/1902', N'10/23/2026', N'10/23/2027',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Máy đã hết niên hạn, Máy sử dụng giật lag khi mở nhiều tab excel',
  NULL, NULL, NULL, N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  135, N'Máy tính', N'Laptop', N'HP Pavilion Laptop 14', NULL,
  NULL, NULL, NULL, N'Sales',
  N'Võ Ngọc Hà', N'Windows 11', N'Intel Core i5 1235U', N'16GB', N'512GB SSD',
  N'Yes', N'30gb / 99gb',
  NULL, N'12/30/1902', N'10/22/2026', N'10/22/2027',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Máy mới được cấp lại từ máy anh Quyền',
  NULL, NULL, NULL, N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  136, N'Máy tính', N'Laptop', N'HP Probook 440 G6', NULL,
  NULL, NULL, NULL, N'Sales',
  N'Phạm Nhật Minh Giang', N'Windows 11', N'8th  i5-8265U', N'8GB - 2400 - 2/2 slot', N'240GB SSD - NVME - SK Hynix',
  N'Yes', N'5GB / 99GB',
  NULL, N'12/30/1902', N'10/21/2026', N'10/21/2027',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Máy tính sử dụng bình thường, đã hết niên hạn sử dụng, nhu cầu sử dụng không cao, vẫn có thể tiếp tục sử dụng',
  NULL, NULL, NULL, N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  137, N'Máy tính', N'Laptop', N'HP 245 G10 14inch', NULL,
  NULL, NULL, NULL, NULL,
  N'Phạm Công Danh', N'Windows 11', N'Ryzen 7 7730u', N'16GB-3200- 1/2 slot', N'500GB-SK Hynix',
  N'Yes', N'20gb / 99gb',
  NULL, N'12/30/1902', N'10/12/2026', N'10/12/2027',
  N'Đã hết hạn', N'Đã được gia hạn', NULL, N'Máy tính còn mới, gia hạn niên hạn',
  NULL, NULL, NULL, N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  138, N'Máy tính', N'Laptop', N'HP Probook 460 G11 A74MSPT', NULL,
  NULL, NULL, NULL, N'Finance & Accounting',
  N'Nguyễn Đông Nhu', N'Windows 11', N'Intel Core U5 125H', N'16Gb', N'512GB SSD',
  N'Yes', N'30.5gb / 99gb',
  N'10/23/2026', N'10/22/2029', N'10/12/2026', N'10/12/2027',
  N'Còn hạn', N'Còn hạn', NULL, N'Máy mới được cấp vào tháng 10-2026',
  NULL, NULL, NULL, N'Tiếp tục gia hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  139, N'Máy tính', N'Laptop', N'HP 245 G10', NULL,
  NULL, NULL, NULL, N'QM',
  N'Bùi Thị Phương Dung', N'Windows 11', N'Ryzen 5 7530U', N'16GB', N'256GB SSD',
  N'Yes', N'40gb/99gb',
  N'10/01/2026', N'09/30/2029', N'10/12/2026', N'09/30/2029',
  N'Còn hạn', N'Còn hạn', NULL, N'Máy mới được cấp vào tháng 10-2026',
  NULL, NULL, NULL, N'Trong niên hạn', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  140, N'Máy tính', N'Laptop', N'HP 340s G7', NULL,
  NULL, NULL, NULL, N'QM',
  N'Nguyễn Minh Khôi', N'Windows 11', N'Intel Core i3 1035G1', N'8GB-BUS3200-1/2 slot', N'120GB SSD',
  N'Yes', N'9gb / 99gb',
  NULL, N'12/30/1902', N'10/12/2026', N'12/30/1902',
  N'Đã hết hạn', N'Chưa được gia hạn', NULL, N'Máy đã hết niên hạn, Máy sử dụng giật lag khi mở file word, excel, mở file rất lâu',
  NULL, NULL, NULL, N'Mua mới', N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  141, N'Máy tính', N'Laptop', N'HP ENVY 13-ay1000 x360 Convertible PC', NULL,
  NULL, NULL, NULL, N'Procurement',
  N'Phạm Thị Anh Tuyền', N'Windows 11', NULL, NULL, NULL,
  NULL, NULL,
  NULL, N'12/30/1902', NULL, N'12/30/1902',
  N'Đã hết hạn', N'Chưa được gia hạn', NULL, NULL,
  NULL, NULL, NULL, NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  142, N'Máy tính', N'Laptop', NULL, NULL,
  NULL, NULL, NULL, N'Sales',
  N'Huỳnh Mạnh Cường', N'Windows 11', NULL, NULL, NULL,
  NULL, NULL,
  NULL, N'12/30/1902', NULL, N'12/30/1902',
  N'Đã hết hạn', N'Chưa được gia hạn', NULL, NULL,
  NULL, NULL, NULL, NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  143, N'Máy tính', N'Laptop', N'HP Omnibook  Flip Laptop 14', NULL,
  NULL, NULL, NULL, N'PMI',
  N'Nakada Yosuke', N'Windows 11', NULL, NULL, NULL,
  NULL, NULL,
  NULL, N'12/30/1902', NULL, N'12/30/1902',
  N'Đã hết hạn', N'Chưa được gia hạn', NULL, NULL,
  NULL, NULL, NULL, NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  144, N'Máy tính', N'Laptop', N'HP Omnibook  Flip Laptop 14', NULL,
  NULL, NULL, NULL, N'BOM',
  N'Nguyễn Thị Thanh Tuyền', N'Windows 11', NULL, NULL, NULL,
  NULL, NULL,
  NULL, N'12/30/1902', NULL, N'12/30/1902',
  N'Đã hết hạn', N'Chưa được gia hạn', NULL, NULL,
  NULL, NULL, NULL, NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  145, N'Máy tính', N'Laptop', N'HP Omnibook  X Flip Laptop 14 fp0057TU', NULL,
  NULL, NULL, NULL, N'Sales',
  N'Lê Văn Quyền', N'Windows 11', N'Intel Core i5 120U', N'16GB - 5200 - 2/2 slot', N'500GB SSD - SK Hynix',
  N'Yes', NULL,
  NULL, N'12/30/1902', NULL, N'12/30/1902',
  N'Đã hết hạn', N'Chưa được gia hạn', NULL, NULL,
  NULL, NULL, NULL, NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  146, N'Máy in', N'Photocopy', N'Canon IR224n', NULL,
  NULL, N'10.0.32.38', NULL, N'HR&IT',
  NULL, NULL, NULL, NULL, NULL,
  NULL, NULL,
  NULL, NULL, NULL, NULL,
  NULL, NULL, NULL, NULL,
  NULL, NULL, N'In Use', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  147, N'Máy in', N'Printer', N'Canon MF260dw II', NULL,
  NULL, N'10.0.32.39', NULL, N'Purchasing',
  NULL, NULL, NULL, NULL, NULL,
  NULL, NULL,
  NULL, NULL, NULL, NULL,
  NULL, NULL, NULL, NULL,
  NULL, NULL, N'In Use', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  148, N'Máy in', N'Printer', N'HP LaserJet Color 252n', NULL,
  NULL, N'USB Connection', NULL, N'HR & IT',
  NULL, NULL, NULL, NULL, NULL,
  NULL, NULL,
  NULL, NULL, NULL, NULL,
  NULL, NULL, NULL, NULL,
  NULL, NULL, N'Not Use', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  149, N'Máy in', N'Printer', N'HP LaserJet Pro MFP M127fw', NULL,
  NULL, N'10.0.32.40', NULL, N'Commercial',
  NULL, NULL, NULL, NULL, NULL,
  NULL, NULL,
  NULL, NULL, NULL, NULL,
  NULL, NULL, NULL, NULL,
  NULL, NULL, N'In Use', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  150, N'Máy in', N'Printer', N'HP LaserJet Pro MFP M227fdn', NULL,
  NULL, N'10.0.32.42', NULL, N'Application',
  NULL, NULL, NULL, NULL, NULL,
  NULL, NULL,
  NULL, NULL, NULL, NULL,
  NULL, NULL, NULL, NULL,
  NULL, NULL, N'In Use', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  151, N'Máy in', N'Printer', N'HP LaserJet Color 252n', NULL,
  NULL, N'10.0.32.43', NULL, N'Application',
  NULL, NULL, NULL, NULL, NULL,
  NULL, NULL,
  NULL, NULL, NULL, NULL,
  NULL, NULL, NULL, NULL,
  NULL, NULL, N'In Use', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  152, N'Máy in', N'Printer', N'Canon LBP 2900', NULL,
  NULL, N'USB Connection', NULL, N'RnD',
  NULL, NULL, NULL, NULL, NULL,
  NULL, NULL,
  NULL, NULL, NULL, NULL,
  NULL, NULL, NULL, NULL,
  NULL, NULL, N'In Use', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  153, N'Máy in', N'Printer', N'Canon Mf453dw', NULL,
  NULL, N'10.0.32.41', NULL, N'PMI',
  NULL, NULL, NULL, NULL, NULL,
  NULL, NULL,
  NULL, NULL, NULL, NULL,
  NULL, NULL, NULL, NULL,
  NULL, NULL, N'In Use', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  154, N'Máy in', N'Printer', N'HP LaserJet 1212nf MFP', NULL,
  NULL, N'10.0.32.127', NULL, N'Flavor',
  NULL, NULL, NULL, NULL, NULL,
  NULL, NULL,
  NULL, NULL, NULL, NULL,
  NULL, NULL, NULL, NULL,
  NULL, NULL, N'In Use', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  155, N'Máy in', N'Printer', N'HP LaserJet Pro MFP 255dw', NULL,
  NULL, N'10.0.32.36', NULL, N'RnD - Floor 4',
  NULL, NULL, NULL, NULL, NULL,
  NULL, NULL,
  NULL, NULL, NULL, NULL,
  NULL, NULL, NULL, NULL,
  NULL, NULL, N'In Use', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  156, N'Máy in', N'Printer', N'Canon ImageClass MFP 247dw', NULL,
  NULL, N'192.168.10.5', NULL, N'Lab',
  NULL, NULL, NULL, NULL, NULL,
  NULL, NULL,
  NULL, NULL, NULL, NULL,
  NULL, NULL, NULL, NULL,
  NULL, NULL, N'In Use', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  157, N'Máy in', N'Printer', N'HP LaserJet Pro M404dn', NULL,
  NULL, N'192.168.10.6', NULL, N'QLSX',
  NULL, NULL, NULL, NULL, NULL,
  NULL, NULL,
  NULL, NULL, NULL, NULL,
  NULL, NULL, NULL, NULL,
  NULL, NULL, N'In Use', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  158, N'Máy in', N'Printer', N'Brother 2701D', NULL,
  NULL, N'USB Connection', NULL, N'Cont QM',
  NULL, NULL, NULL, NULL, NULL,
  NULL, NULL,
  NULL, NULL, NULL, NULL,
  NULL, NULL, NULL, NULL,
  NULL, NULL, N'In Use', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  159, N'Máy in', N'Printer', N'Canon LBP 2901', NULL,
  NULL, N'USB Connection', NULL, N'Delivery',
  NULL, NULL, NULL, NULL, NULL,
  NULL, NULL,
  NULL, NULL, NULL, NULL,
  NULL, NULL, NULL, NULL,
  NULL, NULL, N'In Use', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  160, N'Máy in', N'Printer', N'HP Laserjet 225jw', NULL,
  NULL, N'192.168.10.15', NULL, N'WH & Planning',
  NULL, NULL, NULL, NULL, NULL,
  NULL, NULL,
  NULL, NULL, NULL, NULL,
  NULL, NULL, NULL, NULL,
  NULL, NULL, N'In Use', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  161, N'Máy in', N'Printer', N'Canon G1010', NULL,
  NULL, N'USB Connection', NULL, N'Administration',
  NULL, NULL, NULL, NULL, NULL,
  NULL, NULL,
  NULL, NULL, NULL, NULL,
  NULL, NULL, NULL, NULL,
  NULL, NULL, N'In Use', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  162, N'Máy in', N'Printer', N'TOSHIBA e-STUDIO5018A', NULL,
  NULL, N'192.168.10.7', NULL, N'Administration',
  NULL, NULL, NULL, NULL, NULL,
  NULL, NULL,
  NULL, NULL, NULL, NULL,
  NULL, NULL, NULL, NULL,
  NULL, NULL, N'In Use', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  163, N'Máy in', N'Label Printer', N'Zebra GT800', NULL,
  NULL, N'USB Connection', NULL, N'Warehouse',
  NULL, NULL, NULL, NULL, NULL,
  NULL, NULL,
  NULL, NULL, NULL, NULL,
  NULL, NULL, NULL, NULL,
  NULL, NULL, N'In Use', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  164, N'Máy in', N'Printer', N'Canon LBP 2900', NULL,
  NULL, N'USB Connection', NULL, N'Warehouse',
  NULL, NULL, NULL, NULL, NULL,
  NULL, NULL,
  NULL, NULL, NULL, NULL,
  NULL, NULL, NULL, NULL,
  NULL, NULL, N'In Use', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  165, N'Máy in', N'Printer', N'HP Laserjet P1566', NULL,
  NULL, N'USB Connection', NULL, N'Cont QM',
  NULL, NULL, NULL, NULL, NULL,
  NULL, NULL,
  NULL, NULL, NULL, NULL,
  NULL, NULL, NULL, NULL,
  NULL, NULL, N'In Use', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  166, N'Máy in', N'Printer', N'Canon LBP 3050', NULL,
  NULL, N'USB Connection', NULL, N'ME',
  NULL, NULL, NULL, NULL, NULL,
  NULL, NULL,
  NULL, NULL, NULL, NULL,
  NULL, NULL, NULL, NULL,
  NULL, NULL, N'In Use', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  167, N'Máy in', N'Printer', N'HP M402 PCL6', NULL,
  NULL, N'192.168.10.8', NULL, N'Phòng cân',
  NULL, NULL, NULL, NULL, NULL,
  NULL, NULL,
  NULL, NULL, NULL, NULL,
  NULL, NULL, NULL, NULL,
  NULL, NULL, N'In Use', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  168, N'Máy in', N'Printer', N'HP LASETJET PRO M501', NULL,
  NULL, N'USB Connection', NULL, N'Phòng công cụ dụng cụ',
  NULL, NULL, NULL, NULL, NULL,
  NULL, NULL,
  NULL, NULL, NULL, NULL,
  NULL, NULL, NULL, NULL,
  NULL, NULL, N'In Use', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  169, N'Máy in', N'Printer', N'HP Laserjet Pro M404dn', NULL,
  NULL, N'192.168.3.4', NULL, N'Cont Chung Sức',
  NULL, NULL, NULL, NULL, NULL,
  NULL, NULL,
  NULL, NULL, NULL, NULL,
  NULL, NULL, NULL, NULL,
  NULL, NULL, N'In Use', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  170, N'Máy in', N'Printer', N'Epson L8050', NULL,
  NULL, N'Wifi Connection', NULL, N'Cont Chung Sức',
  NULL, NULL, NULL, NULL, NULL,
  NULL, NULL,
  NULL, NULL, NULL, NULL,
  NULL, NULL, NULL, NULL,
  NULL, NULL, N'In Use', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  171, N'Máy in', N'Printer', N'Canon MF236N', NULL,
  NULL, N'192.168.3.5', NULL, N'Cont Chung Sức',
  NULL, NULL, NULL, NULL, NULL,
  NULL, NULL,
  NULL, NULL, NULL, NULL,
  NULL, NULL, NULL, NULL,
  NULL, NULL, N'In Use', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  172, N'Máy in', N'Printer', N'Godex EZ530+ in nhãn', NULL,
  NULL, N'192.168.10.12', NULL, N'QM',
  NULL, NULL, NULL, NULL, NULL,
  NULL, NULL,
  NULL, NULL, NULL, NULL,
  NULL, NULL, NULL, NULL,
  NULL, NULL, N'In Use', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  173, N'Máy in', N'AccessPoint', N'AP chỗ chị Mỹ', NULL,
  NULL, N'192.168.10.13', NULL, N'Administration',
  NULL, NULL, NULL, NULL, NULL,
  NULL, NULL,
  NULL, NULL, NULL, NULL,
  NULL, NULL, NULL, NULL,
  NULL, NULL, N'In Use', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  174, N'Máy in', N'AccessPoint', N'AP chỗ anh Huy', NULL,
  NULL, N'192.168.10.11', NULL, N'Plant Director',
  NULL, NULL, NULL, NULL, NULL,
  NULL, NULL,
  NULL, NULL, NULL, NULL,
  NULL, NULL, NULL, NULL,
  NULL, NULL, N'In Use', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  175, N'Máy in', N'AccessPoint', N'AP chỗ anh Din', NULL,
  NULL, N'192.168.10.10', NULL, N'ME',
  NULL, NULL, NULL, NULL, NULL,
  NULL, NULL,
  NULL, NULL, NULL, NULL,
  NULL, NULL, NULL, NULL,
  NULL, NULL, N'In Use', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  176, N'Máy in', N'DSM', N'DSM 923 plus', NULL,
  NULL, N'192.168.10.14', NULL, N'Warehouse',
  NULL, NULL, NULL, NULL, NULL,
  NULL, NULL,
  NULL, NULL, NULL, NULL,
  NULL, NULL, NULL, NULL,
  NULL, NULL, N'In Use', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  177, N'Máy in', N'Printer', N'HP LASETJET PRO M501', NULL,
  NULL, N'USB Connection', NULL, N'Production',
  NULL, NULL, NULL, NULL, NULL,
  NULL, NULL,
  NULL, NULL, NULL, NULL,
  NULL, NULL, NULL, NULL,
  N'Máy dùng in nhãn Phòng CCDC', NULL, N'In Use', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  178, N'Máy in', N'Printer', N'RICOH SP 230DNW', NULL,
  NULL, N'USB Connection', NULL, N'Production',
  NULL, NULL, NULL, NULL, NULL,
  NULL, NULL,
  NULL, NULL, NULL, NULL,
  NULL, NULL, NULL, NULL,
  N'Máy in Phòng cân Nguyên liệu', NULL, N'In Use', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  179, N'Máy in', N'Printer', N'Canon LBP2900', NULL,
  NULL, N'USB Connection', NULL, N'Production',
  NULL, NULL, NULL, NULL, NULL,
  NULL, NULL,
  NULL, NULL, NULL, NULL,
  NULL, NULL, NULL, NULL,
  N'Phòng cân Pha loãng', NULL, N'In Use', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  180, N'Máy chủ', N'Server', N'HP ProLiant DL380p Gen8', N'WIN-K3VS3N2HC66',
  N'SGH426KPB9', NULL, NULL, N'IT',
  N'Trần Hải Nhân', NULL, N'Intel® Xeon® E5-2650 (2.0GHz/8-core/15MB/7.2GT)', N'56GB', N'RAID 1: 76GB HDD SAS + 4TB HDD',
  NULL, NULL,
  N'07/01/2018', N'06/30/2021', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  181, N'Máy chủ', N'Server', N'Dell PowerEdge T140', N'PRIMARYERP',
  N'FNSSTC3', NULL, NULL, N'IT',
  N'Trần Hải Nhân', NULL, N'Intel Xeon E-2234 (4C/8T, 3.60 GHz, 8MB)', N'64GB', N'RAID 1:  4TB HDD',
  NULL, NULL,
  N'03/01/2021', N'02/29/2024', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  182, N'Máy chủ', N'Server', N'HP ProLiant ML150 GEN 9', N'WIN-5QMKPD9BIG3',
  N'SGH721X3TF', NULL, NULL, N'IT',
  N'Trần Hải Nhân', NULL, N'Intel Xeon E5-2609v4 (1.7GHz/8-core/15MB/85W)', N'32GB', N'RAID 1:  4TB HDD',
  NULL, NULL,
  N'08/01/2023', N'07/31/2026', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  183, N'Máy chủ', N'Server', N'Dell PowerEdge T150', N'WIN-0I7L833QCA5',
  N'84105W3', NULL, NULL, N'IT',
  N'Trần Hải Nhân', NULL, N'Xeon E-2324G/8GB/2TB/DVDRW/300W', N'128GB', N'RAID 1:  4TB HDD',
  NULL, NULL,
  N'09/01/2021', N'08/31/2024', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  184, N'Thiết bị mạng', N'Router Controller', N'iZiFi SG-250', NULL,
  N'Y21200014510', NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'09/01/2022', N'08/31/2025', NULL, NULL,
  N'Expired', NULL, NULL, NULL,
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  185, N'Thiết bị mạng', N'Wifi', N'FIT-A782', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'09/01/2022', N'08/31/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  186, N'Thiết bị mạng', N'Wifi', N'FIT-A782', NULL,
  NULL, NULL, NULL, N'Procurement',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'09/01/2022', N'08/31/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  187, N'Thiết bị mạng', N'Wifi', N'FIT-A782', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'09/01/2022', N'08/31/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  188, N'Thiết bị mạng', N'Wifi', N'FIT-A782', NULL,
  NULL, NULL, NULL, N'Commnercial',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'09/01/2022', N'08/31/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  189, N'Thiết bị mạng', N'Wifi', N'FIT-A782', NULL,
  NULL, NULL, NULL, N'Ingredient',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'09/01/2022', N'08/31/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  190, N'Thiết bị mạng', N'Wifi', N'FIT-A782', NULL,
  NULL, NULL, NULL, N'Flavor',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'09/01/2022', N'08/31/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  191, N'Thiết bị mạng', N'Wifi', N'FIT-A782', NULL,
  NULL, NULL, NULL, N'Flavor',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'09/01/2022', N'08/31/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  192, N'Thiết bị mạng', N'Wifi', N'FIT-A782', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'09/01/2022', N'08/31/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  193, N'Thiết bị mạng', N'Wifi', N'FIT-A782', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'09/01/2022', N'08/31/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  194, N'Thiết bị mạng', N'Firewall', N'Sonicwall NSA 2700', NULL,
  N'18C241050E08', NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'09/01/2022', N'08/31/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  195, N'Thiết bị mạng', N'Firewall', N'Sonicwall NSA 2700', NULL,
  N'18C241050E08', NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'09/01/2022', N'08/31/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  196, N'Thiết bị mạng', N'Firewall', N'Sonicwall NSA 2400', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'09/01/2022', N'08/31/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  197, N'Thiết bị mạng', N'Switch Core', N'Juniper EX2300-24T', NULL,
  N'JZ0219280130', NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'09/01/2022', N'08/31/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  198, N'Thiết bị mạng', N'Switch Core', N'Juniper EX2300-24T', NULL,
  N'JZ0219280147', NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'09/01/2022', N'08/31/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  199, N'Thiết bị mạng', N'Switch Managed', N'ES205GC-P', NULL,
  N'CAR61J6024607', NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'09/01/2022', N'08/31/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  200, N'Thiết bị mạng', N'Switch Managed', N'ES226GC-P', NULL,
  N'CAR61J6024607', NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'09/01/2022', N'08/31/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  201, N'Thiết bị mạng', N'Switch Managed', N'ES226GC-P', NULL,
  N'G1QH6WE001877', NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'09/01/2022', N'08/31/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  202, N'Thiết bị mạng', N'Switch Managed', N'ES226GC-P', NULL,
  N'G1QH6WE002346', NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'09/01/2022', N'08/31/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  203, N'Thiết bị mạng', N'Switch Managed', N'ES208GC', NULL,
  N'CAQL75P00005B', NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'09/01/2022', N'08/31/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  204, N'Thiết bị mạng', N'Switch Managed', N'ES208GC', NULL,
  N'CAQL75P009168', NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'09/01/2022', N'08/31/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  205, N'Thiết bị mạng', N'Digital Video Recorder', N'DHI-NVR5232- 4KS2', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'05/01/2020', N'05/01/2023', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  206, N'Thiết bị mạng', N'Digital Video Recorder', N'DHI-NVR5232- 4KS2', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'11/01/2022', N'10/31/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  207, N'Thiết bị mạng', N'Digital Video Recorder', N'DHI-NVR5232- 4KS2', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'12/01/2022', N'11/30/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  208, N'Camera & Hạ tầng', N'IP Camera', N'DH-HAC-HFW1200SP-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'05/01/2020', N'05/01/2023', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  209, N'Camera & Hạ tầng', N'IP Camera', N'DH-HAC-HFW1200SP-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'05/01/2020', N'05/01/2023', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  210, N'Camera & Hạ tầng', N'IP Camera', N'DH-HAC-HFW1200SP-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'05/01/2020', N'05/01/2023', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  211, N'Camera & Hạ tầng', N'IP Camera', N'DH-HAC-HFW1200SP-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'05/01/2020', N'05/01/2023', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  212, N'Camera & Hạ tầng', N'IP Camera', N'DH-HAC-HFW1200SP-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'05/01/2020', N'05/01/2023', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  213, N'Camera & Hạ tầng', N'IP Camera', N'DH-HAC-HFW1200SP-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'05/01/2020', N'05/01/2023', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  214, N'Camera & Hạ tầng', N'IP Camera', N'DH-HAC-HFW1200SP-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'05/01/2020', N'05/01/2023', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  215, N'Camera & Hạ tầng', N'IP Camera', N'DH-HAC-HFW1200SP-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'05/01/2020', N'05/01/2023', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  216, N'Camera & Hạ tầng', N'IP Camera', N'DH-HAC-HFW1200SP-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'05/01/2020', N'05/01/2023', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  217, N'Camera & Hạ tầng', N'IP Camera', N'DH-HAC-HFW1200SP-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'05/01/2020', N'05/01/2023', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  218, N'Camera & Hạ tầng', N'IP Camera', N'DH-HAC-HFW1200SP-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'05/01/2020', N'05/01/2023', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  219, N'Camera & Hạ tầng', N'IP Camera', N'DH-HAC-HFW1200SP-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'05/01/2020', N'05/01/2023', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  220, N'Camera & Hạ tầng', N'IP Camera', N'DH-HAC-HFW1200SP-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'05/01/2020', N'05/01/2023', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  221, N'Camera & Hạ tầng', N'IP Camera', N'DH-HAC-HFW1200SP-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'05/01/2020', N'05/01/2023', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  222, N'Camera & Hạ tầng', N'IP Camera', N'DH-HAC-HFW1200SP-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'05/01/2020', N'05/01/2023', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  223, N'Camera & Hạ tầng', N'IP Camera', N'DH-HAC-HFW1200SP-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'05/01/2020', N'05/01/2023', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  224, N'Camera & Hạ tầng', N'IP Camera', N'DH-HAC-HFW1200SP-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'05/01/2020', N'05/01/2023', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  225, N'Camera & Hạ tầng', N'IP Camera', N'DH-HAC-HFW1200SP-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'05/01/2020', N'05/01/2023', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  226, N'Camera & Hạ tầng', N'IP Camera', N'DH-HAC-HFW1200SP-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'05/01/2020', N'05/01/2023', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  227, N'Camera & Hạ tầng', N'IP Camera', N'DH-HAC-HFW1200SP-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'05/01/2020', N'05/01/2023', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  228, N'Camera & Hạ tầng', N'IP Camera', N'DH-HAC-HFW1200SP-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'05/01/2020', N'05/01/2023', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  229, N'Camera & Hạ tầng', N'IP Camera', N'DH-HAC-HFW1200SP-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'05/01/2020', N'05/01/2023', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  230, N'Camera & Hạ tầng', N'IP Camera', N'DH-HAC-HFW1200SP-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'05/01/2020', N'05/01/2023', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  231, N'Camera & Hạ tầng', N'IP Camera', N'DH-HAC-HFW1200SP-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'05/01/2020', N'05/01/2023', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  232, N'Camera & Hạ tầng', N'IP Camera', N'DH-HAC-HFW1200SP-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'05/01/2020', N'05/01/2023', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  233, N'Camera & Hạ tầng', N'IP Camera', N'DH-HAC-HFW1200SP-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'05/01/2020', N'05/01/2023', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  234, N'Camera & Hạ tầng', N'IP Camera', N'DH-HAC-HFW1200SP-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'05/01/2020', N'05/01/2023', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  235, N'Camera & Hạ tầng', N'IP Camera', N'DH-HAC-HFW1200SP-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'05/01/2020', N'05/01/2023', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  236, N'Camera & Hạ tầng', N'IP Camera', N'DH-HAC-HFW1200SP-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'05/01/2020', N'05/01/2023', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  237, N'Camera & Hạ tầng', N'IP Camera', N'DH-HAC-HFW1200SP-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'05/01/2020', N'05/01/2023', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  238, N'Camera & Hạ tầng', N'IP Camera', N'DH-HAC-HFW1200SP-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'05/01/2020', N'05/01/2023', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  239, N'Camera & Hạ tầng', N'IP Camera', N'DH-HAC-HFW1200SP-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'05/01/2020', N'05/01/2023', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  240, N'Camera & Hạ tầng', N'IP Camera', N'DASBN4431S-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'12/01/2022', N'11/30/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  241, N'Camera & Hạ tầng', N'IP Camera', N'DASBN4431S-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'12/01/2022', N'11/30/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  242, N'Camera & Hạ tầng', N'IP Camera', N'DASBN4431S-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'12/01/2022', N'11/30/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  243, N'Camera & Hạ tầng', N'IP Camera', N'DASBN4431S-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'12/01/2022', N'11/30/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  244, N'Camera & Hạ tầng', N'IP Camera', N'DASBN4431S-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'12/01/2022', N'11/30/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  245, N'Camera & Hạ tầng', N'IP Camera', N'DASBN4431S-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'12/01/2022', N'11/30/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  246, N'Camera & Hạ tầng', N'IP Camera', N'DASBN4431S-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'12/01/2022', N'11/30/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  247, N'Camera & Hạ tầng', N'IP Camera', N'DASBN4431S-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'12/01/2022', N'11/30/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  248, N'Camera & Hạ tầng', N'IP Camera', N'DASBN4431S-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'12/01/2022', N'11/30/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  249, N'Camera & Hạ tầng', N'IP Camera', N'DASBN4431S-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'12/01/2022', N'11/30/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  250, N'Camera & Hạ tầng', N'IP Camera', N'DASBN4431S-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'12/01/2022', N'11/30/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  251, N'Camera & Hạ tầng', N'IP Camera', N'DASBN4431S-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'12/01/2022', N'11/30/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  252, N'Camera & Hạ tầng', N'IP Camera', N'DASBN4431S-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'12/01/2022', N'11/30/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  253, N'Camera & Hạ tầng', N'IP Camera', N'DASBN4431S-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'12/01/2022', N'11/30/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  254, N'Camera & Hạ tầng', N'IP Camera', N'DASBN4431S-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'12/01/2022', N'11/30/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  255, N'Camera & Hạ tầng', N'IP Camera', N'DASBN4431S-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'12/01/2022', N'11/30/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  256, N'Camera & Hạ tầng', N'IP Camera', N'DASBN4431S-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'12/01/2022', N'11/30/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  257, N'Camera & Hạ tầng', N'IP Camera', N'DASBN4431S-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'12/01/2022', N'11/30/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  258, N'Camera & Hạ tầng', N'IP Camera', N'DASBN4431S-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'12/01/2022', N'11/30/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  259, N'Camera & Hạ tầng', N'IP Camera', N'DASBN4431S-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'12/01/2022', N'11/30/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  260, N'Camera & Hạ tầng', N'IP Camera', N'DASBN4431S-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'12/01/2022', N'11/30/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  261, N'Camera & Hạ tầng', N'IP Camera', N'DASBN4431S-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'12/01/2022', N'11/30/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  262, N'Camera & Hạ tầng', N'IP Camera', N'DASBN4431S-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'12/01/2022', N'11/30/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  263, N'Camera & Hạ tầng', N'IP Camera', N'DASBN4431S-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'12/01/2022', N'11/30/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  264, N'Camera & Hạ tầng', N'IP Camera', N'DASBN4431S-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'12/01/2022', N'11/30/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  265, N'Camera & Hạ tầng', N'IP Camera', N'DASBN4431S-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'12/01/2022', N'11/30/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  266, N'Camera & Hạ tầng', N'IP Camera', N'DASBN4431S-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'12/01/2022', N'11/30/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  267, N'Camera & Hạ tầng', N'IP Camera', N'DASBN4431S-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'12/01/2022', N'11/30/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  268, N'Camera & Hạ tầng', N'IP Camera', N'DASBN4431S-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'12/01/2022', N'11/30/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  269, N'Camera & Hạ tầng', N'IP Camera', N'DASBN4431S-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'12/01/2022', N'11/30/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  270, N'Camera & Hạ tầng', N'IP Camera', N'DASBN4431S-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'12/01/2022', N'11/30/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  271, N'Camera & Hạ tầng', N'IP Camera', N'DASBN4431S-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'12/01/2022', N'11/30/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  272, N'Camera & Hạ tầng', N'IP Camera', N'DASBN4431S-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'12/01/2022', N'11/30/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  273, N'Camera & Hạ tầng', N'IP Camera', N'DASBN4431S-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'12/01/2022', N'11/30/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  274, N'Camera & Hạ tầng', N'IP Camera', N'DASBN4431S-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'12/01/2022', N'11/30/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  275, N'Camera & Hạ tầng', N'IP Camera', N'DASBN4431S-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'12/01/2022', N'11/30/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  276, N'Camera & Hạ tầng', N'IP Camera', N'DASBN4431S-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'12/01/2022', N'11/30/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  277, N'Camera & Hạ tầng', N'IP Camera', N'DASBN4431S-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'12/01/2022', N'11/30/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  278, N'Camera & Hạ tầng', N'IP Camera', N'DASBN4431S-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'12/01/2022', N'11/30/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  279, N'Camera & Hạ tầng', N'IP Camera', N'DASBN4431S-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'12/01/2022', N'11/30/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  280, N'Camera & Hạ tầng', N'IP Camera', N'DASBN4431S-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'12/01/2022', N'11/30/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  281, N'Camera & Hạ tầng', N'IP Camera', N'DASBN4431S-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'12/01/2022', N'11/30/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  282, N'Camera & Hạ tầng', N'IP Camera', N'DASBN4431S-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'12/01/2022', N'11/30/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  283, N'Camera & Hạ tầng', N'IP Camera', N'DASBN4431S-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'12/01/2022', N'11/30/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  284, N'Camera & Hạ tầng', N'IP Camera', N'DASBN4431S-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'12/01/2022', N'11/30/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  285, N'Camera & Hạ tầng', N'IP Camera', N'DASBN4431S-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'12/01/2022', N'11/30/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  286, N'Camera & Hạ tầng', N'IP Camera', N'DASBN4431S-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'12/01/2022', N'11/30/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  287, N'Camera & Hạ tầng', N'IP Camera', N'DASBN4431S-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'12/01/2022', N'11/30/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  288, N'Camera & Hạ tầng', N'IP Camera', N'DASBN4431S-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'12/01/2022', N'11/30/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  289, N'Camera & Hạ tầng', N'IP Camera', N'DASBN4431S-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'12/01/2022', N'11/30/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  290, N'Camera & Hạ tầng', N'IP Camera', N'DASBN4431S-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'12/01/2022', N'11/30/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  291, N'Camera & Hạ tầng', N'IP Camera', N'DASBN4431S-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'12/01/2022', N'11/30/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  292, N'Camera & Hạ tầng', N'IP Camera', N'DASBN4431S-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'12/01/2022', N'11/30/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  293, N'Camera & Hạ tầng', N'IP Camera', N'DASBN4431S-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'12/01/2022', N'11/30/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  294, N'Camera & Hạ tầng', N'IP Camera', N'DASBN4431S-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'12/01/2022', N'11/30/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  295, N'Camera & Hạ tầng', N'IP Camera', N'DASBN4431S-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'12/01/2022', N'11/30/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  296, N'Camera & Hạ tầng', N'IP Camera', N'DASBN4431S-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'12/01/2022', N'11/30/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  297, N'Camera & Hạ tầng', N'IP Camera', N'DASBN4431S-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'12/01/2022', N'11/30/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  298, N'Camera & Hạ tầng', N'IP Camera', N'DASBN4431S-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'12/01/2022', N'11/30/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  299, N'Camera & Hạ tầng', N'IP Camera', N'DASBN4431S-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'12/01/2022', N'11/30/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  300, N'Camera & Hạ tầng', N'IP Camera', N'DASBN4431S-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'12/01/2022', N'11/30/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  301, N'Camera & Hạ tầng', N'IP Camera', N'DASBN4431S-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'12/01/2022', N'11/30/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  302, N'Camera & Hạ tầng', N'IP Camera', N'DASBN4431S-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'12/01/2022', N'11/30/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  303, N'Camera & Hạ tầng', N'IP Camera', N'DASBN4431S-S3', NULL,
  NULL, NULL, NULL, N'HR&IT',
  N'Trần Hải Nhân', NULL, NULL, NULL, NULL,
  NULL, NULL,
  N'12/01/2022', N'11/30/2025', NULL, NULL,
  N'Expired', NULL, NULL, N'Sử dụng bình thường',
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
INSERT INTO dbo.ThietBi (
  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,
  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,
  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,
  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat
) VALUES (
  304, N'Thiết bị mạng', N'Máy chấm công', NULL, NULL,
  NULL, N'192.168.10.9', NULL, NULL,
  NULL, NULL, NULL, NULL, NULL,
  NULL, NULL,
  NULL, N'12/30/1902', NULL, NULL,
  N'Expired', NULL, NULL, NULL,
  NULL, NULL, N'Expired', NULL, N'Enabled'
);
