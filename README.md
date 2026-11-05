<div align="center">

# 🏢 HA GROUP IT ASSET MANAGEMENT PRO
### Hệ thống Quản lý Vòng đời Tài sản CNTT & Dịch vụ Doanh nghiệp
**Công ty Cổ phần Tập đoàn Hoàng Anh (Hoang Anh Flavors & Food Ingredients)**

[![.NET](https://img.shields.io/badge/.NET-10.0-512BD4?style=for-the-badge&logo=dotnet&logoColor=white)](https://dotnet.microsoft.com/)
[![ASP.NET Core](https://img.shields.io/badge/ASP.NET_Core-MVC-blue?style=for-the-badge&logo=microsoft)](https://learn.microsoft.com/aspnet/core)
[![SQL Server](https://img.shields.io/badge/SQL_Server-2016+-CC292B?style=for-the-badge&logo=microsoftsqlserver&logoColor=white)](https://www.microsoft.com/sql-server)
[![Bootstrap](https://img.shields.io/badge/Bootstrap-5.3-7952B3?style=for-the-badge&logo=bootstrap&logoColor=white)](https://getbootstrap.com/)
[![Platform](https://img.shields.io/badge/Platform-Windows_Desktop-0078D6?style=for-the-badge&logo=windows&logoColor=white)](https://microsoft.com)

</div>

---

## 📖 GIỚI THIỆU TỔNG QUAN

**HA Group IT Asset Management Pro (v2.0)** là giải pháp phần mềm quản trị tập trung toàn diện vòng đời tài sản công nghệ thông tin cho doanh nghiệp. Hệ thống được thiết kế theo mô hình **Desktop Web-Hybrid**, hoạt động độc lập và an toàn 100% trên mạng nội bộ (On-Premise / Local Intranet), kết hợp hiệu năng xử lý cao của backend **.NET 10** và giao diện tinh tế chuẩn nhận diện thương hiệu Hoàng Anh Group.

Phần mềm giải quyết triệt để bài toán thất thoát thiết bị, kiểm soát chặt chẽ chi phí bản quyền Microsoft 365, tự động hóa thủ tục hành chính lập biên bản bàn giao chuẩn ISO công ty và tối ưu hóa quy trình bảo dưỡng định kỳ hàng loạt.

---

## ✨ TÍNH NĂNG NỔI BẬT

### 🖥️ 1. Quản lý Vòng đời Thiết bị Phần cứng (`/ThietBi`)
* **Phân loại nhóm tài sản:** Laptop, Máy tính để bàn (PC), Máy in văn phòng, Thiết bị mạng (Switch/AP), Camera giám sát, Màn hình.
* **Chi tiết thông số kỹ thuật:** Quản lý Model, Serial Number, CPU, RAM, Ổ cứng (SSD/HDD), Hệ điều hành, Địa chỉ IP, Thời gian đầu tư và khuyến nghị nâng cấp từ IT.
* **Theo dõi vị trí & hiện trạng:** Phân loại rõ ràng máy đang cấp phát cho nhân sự hoặc đang lưu tại Kho dự phòng IT.
* **Hồ sơ máy 360 độ:** Truy vấn chéo toàn bộ lịch sử sửa chữa bảo trì và nhật ký điều chuyển qua các đời chủ của từng thiết bị trên 1 trang duy nhất.

### 📊 2. Dashboard Giám sát Bản quyền License (`/License`)
* **Kiểm soát hạn mức 10 máy/user:** Trực quan hóa 18 tài khoản Microsoft 365 / Active Office của tập đoàn.
* **Cảnh báo vượt ngưỡng tự động:** Tự động viền đỏ nổi bật, hiển thị thanh tiến độ đỏ 100% và huy hiệu `Vượt: X/10` cho các tài khoản đang bị gán quá định mức.
* **Bộ lọc tương tác 1-chạm:** Nhấp vào bất kỳ thẻ tài khoản nào để lọc tức thì danh sách các máy tính đang kích hoạt bằng tài khoản đó; hỗ trợ công tắc gạt *"Chỉ xem vượt"* để IT xử lý ngay.

### 📄 3. Tự động hóa Biên bản Bàn giao & Thu hồi (`/BienBan`)
* **Mã biên bản tự động:** Sinh mã duy nhất theo thời gian thực `YYMMDD.Timestamp` (ví dụ: `#261105.141543`), chống trùng lặp tuyệt đối.
* **Searchable Picker Modal:** Bộ tìm kiếm thông minh không phụ thuộc dấu tiếng Việt (gõ `phong` tìm ra `Thượng Đình Phong`, `anh` ra `Bùi Ngọc Vân Anh`), tự động điền thông tin nhân sự và thiết bị trong 1 cú nhấp.
* **Logic tự động nhảy Email & Domain ERP:**
  * **Cấp phát:** Tự lấy email M365 và domain của nhân viên mới ở Bên Nhận.
  * **Thu hồi:** Tự động nhảy chính xác email M365 và domain ERP cần thu hồi của nhân viên nghỉ việc ở Bên Giao.
  * **Chọn máy cần thu hồi:** Tự nhận diện chủ sở hữu máy để điền Bên Giao và tự động nhảy luôn Email + Domain ERP.
* **Xuất văn bản chuẩn ISO:** Màn hình Live Preview khổ A4 chuẩn biểu mẫu ISO tập đoàn (`ITUA001-F01`), logo Hoàng Anh, bảng viền xanh lá `#00B050`; hỗ trợ xuất file Word `.docx` sạch (loại bỏ SQL popup) và In PDF trực tiếp.

### 🛠️ 4. Quản lý Bảo trì & Lịch tháng Tương tác (`/BaoTri`)
* **2 chế độ lập phiếu:**
  * *🔧 Sửa chữa đơn lẻ (1 thiết bị):* Xử lý sự cố đột xuất, ghi nhận đơn vị thực hiện, linh kiện thay thế và chi phí thực tế.
  * *📋 Lập kế hoạch hàng loạt (Nhiều thiết bị):* Chọn toàn bộ máy móc của một Phòng ban chỉ với 1 click để lập chiến dịch bảo dưỡng định kỳ (Q4).
* **Lịch bảo trì tháng (Interactive Calendar):** Trực quan hóa thẻ công việc theo ngày, phân màu trạng thái (Kế hoạch 🟡, Đang xử lý 🔵, Hoàn thành 🟢).
* **Nghiệm thu 1-chạm (`✔`):** Nút tích xanh trên danh sách cho phép IT nghiệm thu hoàn tất công việc tức thì.

### 👥 5. Quản lý Nhân sự & Phần mềm Cài đặt (`/Users` & `/ApplicationSoftware`)
* **Hồ sơ người dùng tổng thể:** Nắm bắt thiết bị nhân sự đang giữ, tài khoản M365 được cấp, quyền ERP và danh mục ứng dụng cài đặt.
* **Quản lý ứng dụng linh hoạt:** Hỗ trợ 2 chế độ xem: dạng Accordion (gom nhóm theo nhân sự) và dạng Bảng tổng thể.

### ⚙️ 6. CSDL Linh hoạt (Zero-FK) & Vận hành Desktop
* **Kiến trúc Zero-FK (0 khóa ngoại cứng):** Loại bỏ hoàn toàn lỗi chặn xóa (Cascade Delete blocking), nhập/xuất dữ liệu từ Excel mượt mà.
* **Đổi kết nối máy chủ 1-chạm (`/Settings`):** Chuyển đổi linh hoạt giữa máy cục bộ (`.\SQLEXPRESS`) và máy chủ công ty (`192.168.x.x`).
* **Single-Instance Launcher:** Khởi chạy cửa sổ ứng dụng qua Microsoft Edge App Mode; tự động kích hoạt cửa sổ khi mở lại lần 2, không bao giờ bị lỗi xung đột cổng mạng (`Port 5000: Address already in use`).
* **Vận hành ổn định 24/7:** Duy trì cổng 5000 liên tục khi treo máy, không tự ngắt; tích hợp nút "Thoát ứng dụng" chủ động và file `Tat-UngDung.bat`.

---

## 🏗️ KIẾN TRÚC KỸ THUẬT (TECH STACK)

| Thành phần | Công nghệ sử dụng | Vai trò |
| :--- | :--- | :--- |
| **Backend Framework** | C# ASP.NET Core 10.0 MVC | Xử lý logic nghiệp vụ, routing, validation, render giao diện Razor |
| **ORM & Database** | Entity Framework Core 10 / SQL Server | Quản lý dữ liệu tập trung với kiến trúc quan hệ Zero-FK |
| **Văn bản Doanh nghiệp**| OpenXML SDK & System.IO.Compression | Đọc file mẫu `.docx`, điền dữ liệu động, xuất biên bản sạch |
| **Giao diện Client** | Bootstrap 5, Bootstrap Icons, Font Inter | Giao diện chuẩn Apple Minimalist kết hợp 7 màu nhận diện Hoàng Anh |
| **Desktop Wrapper** | Microsoft Edge App Mode (`--app`) | Chạy như ứng dụng máy bàn độc lập, không thanh URL trình duyệt |

---

## 📁 BẢN ĐỒ CẤU TRÚC DỰ ÁN

```
it_asset/
├── ITAssetManagement/                 # Mã nguồn C# ASP.NET Core 10 MVC
│   ├── Controllers/                  # 7 Bộ điều khiển nghiệp vụ (ThietBi, Users, License, BaoTri, BienBan, Settings, Home)
│   ├── Models/                       # Các thực thể CSDL (Zero-FK) & ViewModels
│   ├── Views/                        # Giao diện Razor Views chuẩn thương hiệu Hoàng Anh
│   │   ├── ThietBi/                  # Quản lý thiết bị phần cứng & thống kê
│   │   ├── License/                  # Dashboard tỉ lệ license & cảnh báo đỏ
│   │   ├── BienBan/                  # Form tạo biên bản, Modal tìm kiếm & Review A4
│   │   ├── BaoTri/                   # Phiếu bảo trì đơn lẻ, hàng loạt & Lịch tháng
│   │   ├── Users/                    # Quản lý danh bạ nhân sự 360
│   │   ├── ApplicationSoftware/      # Phần mềm cài đặt (Accordion & Table)
│   │   └── Settings/                 # Màn hình cấu hình máy chủ CSDL
│   ├── Helpers/                      # WordExportHelper (OpenXML Engine xuất docx)
│   ├── wwwroot/                      # Logo Hoàng Anh, CSS thương hiệu, Font, Icons
│   └── Program.cs                    # Single-Instance Launcher, Kestrel Server Host
├── database/                         # Kịch bản SQL Server (streamlined_database.sql)
├── data/Bienban/                     # Biểu mẫu Word chuẩn ISO ITUA001-F01 & Excel mẫu
├── publish/                          # Bản phát hành chạy độc lập (ITAssetManagement.exe)
├── QuanLyTaiSanIT.lnk                # Phím tắt Desktop có icon Hoàng Anh
├── Chay-UngDung.bat                  # Script khởi động tự động
├── Tat-UngDung.bat                   # Script tắt máy chủ 1-chạm
├── TAI_LIEU_DU_AN.md                 # Báo cáo giải pháp tổng thể cho Ban Giám đốc
└── README.md                         # Tài liệu giới thiệu & hướng dẫn dự án
```

---

## 🚀 HƯỚNG DẪN CÀI ĐẶT & VẬN HÀNH

### 1. Yêu cầu hệ thống
* Hệ điều hành: Windows 10 / 11 hoặc Windows Server 2016+ (64-bit).
* Cơ sở dữ liệu: Microsoft SQL Server 2016 trở lên (hoặc SQL Server Express miễn phí).
* Môi trường chạy: .NET Desktop Runtime 10.0 (đã tích hợp sẵn trong bản `publish/`).

### 2. Khởi tạo Cơ sở dữ liệu (Chỉ làm 1 lần)
Mở PowerShell hoặc SSMS và chạy file kịch bản có sẵn trong thư mục `database/`:
```powershell
sqlcmd -S ".\SQLEXPRESS" -i "database\streamlined_database.sql"
```

### 3. Khởi chạy ứng dụng
Người dùng cuối có thể khởi chạy bằng 1 trong các cách sau:
* **Cách 1 (Khuyên dùng):** Nhấp đúp vào phím tắt ngoài màn hình chính: **`QuanLyTaiSanIT.lnk`**.
* **Cách 2:** Chạy trực tiếp file: **`publish\ITAssetManagement.exe`** (hoặc file **`Chay-UngDung.bat`**).

> 💡 **Mẹo:**
> * Để tắt hoàn toàn ứng dụng và giải phóng máy chủ: Bấm nút **"Thoát ứng dụng"** màu đỏ ở góc dưới menu bên trái, hoặc nhấp đúp file **`Tat-UngDung.bat`**.

---

## 👥 TÁC GIẢ & BẢN QUYỀN

* **Đơn vị chủ quản:** Công ty Cổ phần Tập đoàn Hoàng Anh (Hoang Anh Flavors & Food Ingredients).
* **Bộ phận phát triển:** Đội ngũ Công nghệ Thông tin (IT Department).
* **Tác giả chính:** Nguyễn Hoàng Khánh Duy ([@DUYNGUYENHK](https://github.com/DUYNGUYENHK) • [@PSPSENKO68](https://github.com/PSPSENKO68))
* **Bản quyền:** © 2026 Hoàng Anh Group. All rights reserved.

