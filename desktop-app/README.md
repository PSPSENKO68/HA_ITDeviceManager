# IT Asset Pro 💻

**IT Asset Pro** là ứng dụng Desktop quản lý tài sản công nghệ thông tin (IT Asset Management) nội bộ, được thiết kế chuyên biệt để theo dõi vòng đời thiết bị phần cứng, máy in, phần mềm và bản quyền (license) trong doanh nghiệp.

Ứng dụng sở hữu giao diện **Premium Dark/Light Mode** lấy cảm hứng từ ngôn ngữ thiết kế tối giản của Apple, đảm bảo trải nghiệm người dùng hiện đại, trực quan và mượt mà.

## 🌟 Tính năng nổi bật

- **Quản lý đa dạng tài sản:**
  - **Laptop/Desktop & Thiết bị mạng:** Theo dõi cấu hình, tình trạng, niên hạn, owner, và chi phí bảo trì.
  - **Máy in & Photocopy:** Quản lý máy in theo phòng ban.
  - **License & Ứng dụng:** Theo dõi bản quyền phần mềm (Kích hoạt, domain mail, tài khoản sử dụng) với tính năng Auto-fill dữ liệu Owner/Phòng ban thông minh thông qua Serial Number.
  - **Lịch sử hoạt động:** Ghi vết và theo dõi các thay đổi tài sản.
- **Cơ sở dữ liệu Excel (Low-code friendly):** Sử dụng trực tiếp file Excel (`database.xlsx`) làm cơ sở dữ liệu nền, cho phép người dùng (Non-IT) dễ dàng chỉnh sửa, backup, hoặc liên kết với hệ thống chia sẻ mạng nội bộ (Shared Disk).
- **Auto-Import thông minh:** Hỗ trợ script trích xuất và chuẩn hóa tự động dữ liệu cũ từ file Tracking thô sang định dạng Database chuẩn.

## 🛠 Công nghệ sử dụng

- **Core & Giao diện:** React 19, TypeScript, Vite
- **Desktop Framework:** Electron
- **Styling:** Vanilla CSS (CSS thuần) với triết lý thiết kế Apple Design System.
- **Xử lý dữ liệu:** SheetJS (`xlsx`) đọc/ghi file Excel trực tiếp.
- **Đóng gói (Build):** `electron-builder` tạo file Portable chạy thẳng không cần cài đặt.

## 🚀 Cài đặt & Phát triển (Dành cho Developer)

### 1. Yêu cầu hệ thống
- [Node.js](https://nodejs.org/) (Khuyến nghị phiên bản 18+ hoặc 20+)
- Hệ điều hành Windows 10/11 (để build bản EXE).

### 2. Cài đặt các gói phụ thuộc
Tại thư mục `desktop-app`, chạy lệnh:
```bash
npm install
```

### 3. Chạy môi trường phát triển (Dev Mode)
Chạy ứng dụng bằng Vite kết hợp Electron:
```bash
npm run dev
```

### 4. Nạp dữ liệu cũ (Import Data)
Nếu bạn có file Tracking Excel cũ, bạn có thể chạy script import để cập nhật vào `database.xlsx`:
```bash
node import_hardware.cjs
```

### 5. Đóng gói ứng dụng (Build Portable Exe)
Để build ra file chạy `.exe` Portable phục vụ cho người dùng cuối (End-User), hãy chạy:
```bash
npm run build
```
File `.exe` thành phẩm sẽ xuất hiện tại thư mục đích (Ví dụ: `C:\Users\...\Downloads\it_asset_build\`).

## 🎨 Giao diện & Thiết kế

Dự án tuân thủ nghiêm ngặt **Apple Design Analysis** (Xem chi tiết tại `Apple_DESIGN.md`):
- Màu sắc chủ đạo: Action Blue (`#0066cc` / `#0a84ff`)
- Font chữ: SF Pro Display & Inter
- Bố cục lưới không dùng bóng đổ cấu trúc (No structural shadows), thiết kế tràn viền tinh tế.

---
*Phát triển bởi đội ngũ IT & Deepmind Agent.*
