# Hướng Dẫn Cơ Sở Dữ Liệu SQL Server - IT Asset & Bảo Trì Thiết Bị (Đa Nhóm)

Hệ thống cơ sở dữ liệu đã được cấu trúc lại theo mô hình **Master IT Asset Table**: Tập hợp toàn bộ **257 thiết bị** của doanh nghiệp vào một cơ sở dữ liệu duy nhất với các trường phân nhóm rõ ràng (`NhomThietBi`, `PhanLoai`), giúp giám sát và lập lịch bảo trì cho tất cả các loại thiết bị: Máy tính, Thiết bị mạng, Máy in, Máy chủ, Camera...

---

## 1. Thông Tin Kết Nối
- **SQL Server Instance**: `.\SQLEXPRESS` (hoặc `localhost\SQLEXPRESS`)
- **Database Name**: `ITAssetDB`
- **Authentication**: `Windows Authentication` (kết nối trực tiếp trên máy nội bộ không cần gateway)

---

## 2. Phân Tách Nhóm Thiết Bị Trong Bảng `dbo.ThietBi`

Bảng `dbo.ThietBi` hiện chứa đầy đủ **257 thiết bị** được phân thành 5 nhóm chính:

| Nhóm Thiết Bị (`NhomThietBi`) | Số Lượng | Các Loại Thiết Bị Cụ Thể (`PhanLoai`) | Các Trường Đặc Thù |
| :--- | :---: | :--- | :--- |
| **Máy tính** | 95 | Laptop, Desktop, PC | OS, CPU, RAM, HardDisk, HSD gia hạn |
| **Thiết bị mạng** | 35 | Switch Core, Switch Managed, Router, Firewall, AccessPoint, Wifi | IPAddress, Firmware, Model, Serial |
| **Máy in & Photocopy** | 23 | Printer (Canon, HP...), Photocopy (Toshiba...) | IPAddress, Tên máy in, Tình trạng hộp mực |
| **Máy chủ** | 4 | Server (HP ProLiant, Dell PowerEdge...) | CPU Xeon, RAM 64GB, RAID HardDisk |
| **Hạ tầng & Camera** | 100 | Digital Video Recorder (Đầu ghi), IP Camera, Máy chấm công | IPAddress, Vị trí lắp đặt, Model |

---

## 3. Các View Tách Riêng Nhóm Thiết Bị (Dễ Dàng Quản Lý & Giám Sát)

Bạn có thể truy vấn từng nhóm riêng biệt thông qua các View chuyên dụng mà không cần viết câu lệnh `WHERE` phức tạp:

### 3.1. Xem riêng danh sách Máy In & Photocopy:
```sql
SELECT * FROM dbo.vw_ThietBi_MayIn;
```

### 3.2. Xem riêng danh sách Thiết Bị Mạng (Switch, Router, AP...):
```sql
SELECT * FROM dbo.vw_ThietBi_Mang;
```

### 3.3. Xem riêng danh sách Máy Tính & Laptop:
```sql
SELECT * FROM dbo.vw_ThietBi_MayTinh;
```

### 3.4. Xem danh sách Máy Chủ & Camera, Máy Chấm Công:
```sql
SELECT * FROM dbo.vw_ThietBi_HaTang_Camera;
```

### 3.5. Báo cáo thống kê tổng quan theo từng nhóm:
```sql
SELECT * FROM dbo.vw_ThongKeTheoNhomThietBi;
```

---

## 4. Quản Lý & Giám Sát Bảo Trì Đồng Bộ

Do tất cả thiết bị đã quy về một bảng chung `dbo.ThietBi`, bảng `dbo.NhatKyBaoTri` có thể ghi nhận lịch sử bảo trì cho **bất kỳ loại thiết bị nào** (sửa màn hình laptop, thay mực máy in, thay nguồn Switch, thay quạt server...):

```sql
-- Ví dụ: Ghi nhận bảo trì cho một Máy In (ID = 236)
EXEC dbo.sp_GhiNhanBaoTri 
    @ThietBiID = 236,
    @LoaiHanhDong = N'Thay linh kiện & Nạp mực',
    @ChiTiet = N'Thay cụm trống Drum và nạp bình mực Cartridge 051',
    @LinhKienThayThe = N'Drum Canon 051 + Mực Canon',
    @ChiPhi = 450000,
    @NguoiThucHien = N'Dịch vụ nạp mực Hoàng Gia',
    @DanhGiaSauBaoTri = N'Bản in sắc nét, không bị đen mép',
    @KhuyenNghiIT = N'Kiểm tra lại sau 3 tháng',
    @NgayBaoTriTiepTheo = '2026-11-30',
    @HienTrangMoi = N'In Use';
```

---

## 5. File Kịch Bản Trong Thư Mục `database/`
- `setup_database.sql`: Cấu trúc DDL hoàn chỉnh với các nhóm thiết bị và Views.
- `generate_import_sql.js`: Tool đồng bộ tự động 257 thiết bị từ `database.xlsx`.
- `import_data.sql`: Dữ liệu INSERT thực tế.
