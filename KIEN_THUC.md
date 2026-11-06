# CẨM NANG KIẾN TRÚC HỆ THỐNG & LUỒNG DỮ LIỆU DỰ ÁN IT ASSET MANAGEMENT

**Dự án:** Hoàng Anh Group IT Asset Management  
**Nền tảng:** ASP.NET Core MVC (.NET 10) | SQL Server | Entity Framework Core | Photino Desktop  

---

## MỤC LỤC
1. [Tổng quan Kiến trúc Hệ thống & Vòng đời Xử lý Request](#1-tổng-quan-kiến-trúc-hệ-thống--vòng-đời-xử-lý-request)
   - [Sơ đồ luồng dữ liệu 5 tầng](#sơ-đồ-luồng-dữ-liệu-5-tầng)
   - [Vòng đời 1 HTTP GET Request (Truy vấn từ CSDL lên UI)](#vòng-đời-1-http-get-request-truy-vấn-từ-csdl-lên-ui)
   - [Vòng đời 1 HTTP POST Request (Nhận dữ liệu từ UI xuống CSDL)](#vòng-đời-1-http-post-request-nhận-dữ-liệu-từ-ui-xuống-csdl)
2. [Cấu trúc và Vai trò từng Tầng trong Codebase](#2-cấu-trúc-và-vai-trò-từng-tầng-trong-codebase)
   - [Tầng 0: Khởi chạy ứng dụng & Desktop Host (Program.cs)](#tầng-0-khởi-chạy-ứng-dụng--desktop-host-programcs)
   - [Tầng 1: Tầng truy xuất CSDL (ITAssetDBContext - EF Core)](#tầng-1-tầng-truy-xuất-csdl-itassetdbcontext---ef-core)
   - [Tầng 2: Mô hình Dữ liệu (Entity Models & ViewModels)](#tầng-2-mô-hình-dữ-liệu-entity-models--viewmodels)
   - [Tầng 3: Tầng Điều phối Nghiệp vụ (Controllers)](#tầng-3-tầng-điều-phối-nghiệp-vụ-controllers)
   - [Tầng 4: Tầng Hiển thị & Tương tác (Razor Views & JavaScript)](#tầng-4-tầng-hiển-thị--tương-tác-razor-views--javascript)
3. [Chi tiết Luồng hoạt động của từng Phân hệ Chức năng](#3-chi-tiết-luồng-hoạt-động-của-từng-phân-hệ-chức-năng)
   - [3.1. Phân hệ Quản lý Thiết bị (ThietBiController)](#31-phân-hệ-quản-lý-thiết-bị-thietbicontroller)
   - [3.2. Phân hệ Biên bản Bàn giao & Thu hồi (BienBanController)](#32-phân-hệ-biên-bản-bàn-giao--thu-hồi-bienbancontroller)
   - [3.3. Phân hệ Phần mềm Cài đặt (ApplicationSoftwareController)](#33-phân-hệ-phần-mềm-cài-đặt-applicationsoftwarecontroller)
   - [3.4. Phân hệ Bản quyền & License (LicenseController)](#34-phân-hệ-bản-quyền--license-licensecontroller)
   - [3.5. Phân hệ Lịch sử & Kế hoạch Bảo trì (BaoTriController)](#35-phân-hệ-lịch-sử--kế-hoạch-bảo-trì-baotricontroller)
   - [3.6. Phân hệ Quản lý Nhân sự (UsersController)](#36-phân-hệ-quản-lý-nhân-sự-userscontroller)
4. [Cơ chế Vận hành Desktop & Cơ sở Dữ liệu SQL Server](#4-cơ-chế-vận-hành-desktop--cơ-sở-dữ-liệu-sql-server)
   - [Tại sao ứng dụng chạy được khi không bật phần mềm SSMS?](#tại-sao-ứng-dụng-chạy-được-khi-không-bật-phần-mềm-ssms)
   - [Cơ chế Desktop Hybrid: Kestrel + Photino.NET](#cơ-chế-desktop-hybrid-kestrel--photinonet)
5. [Đánh giá Kỹ thuật: Bảo mật, Hạn chế Kiến trúc & Hướng Refactor](#5-đánh-giá-kỹ-thuật-bảo-mật-hạn-chế-kiến-trúc--hướng-refactor)
   - [Các cơ chế bảo mật có sẵn](#các-cơ-chế-bảo-mật-có-sẵn)
   - [Điểm cần cải tiến (Zero-FK, Fat Controller, Authentication)](#điểm-cần-cải-tiến-zero-fk-fat-controller-authentication)

---

## 1. TỔNG QUAN KIẾN TRÚC HỆ THỐNG & VÒNG ĐỜI XỬ LÝ REQUEST

### Sơ đồ luồng dữ liệu 5 tầng

Toàn bộ hệ thống được xây dựng trên kiến trúc **ASP.NET Core MVC kết hợp Entity Framework Core**. Dữ liệu di chuyển theo chu trình khép kín:

```
[SQL Server Database: ITAssetDB]
            ▲
            │ (1. Đọc/Ghi dữ liệu qua LINQ & SQL Connection)
            ▼
[Data Access Layer: ITAssetDBContext (DbContext)]
            ▲
            │ (2. Ánh xạ thành C# Class Objects)
            ▼
[Data Models: Entity Models (ThietBi, User...) & ViewModels]
            ▲
            │ (3. Xử lý nghiệp vụ, lọc, validate, gán ViewBag)
            ▼
[Controllers: ThietBiController, BienBanController...]
            ▲
            │ (4. Truyền Model + ViewBag sang View)
            ▼
[Presentation: Razor Views (.cshtml) + Client JavaScript]
            ▲
            │ (5. Render HTML/CSS/DOM)
            ▼
[UI Cửa sổ Desktop (Photino WebView2)]
```

---

### Vòng đời 1 HTTP GET Request (Truy vấn từ CSDL lên UI)

Khi người dùng mở một trang (ví dụ xem danh sách thiết bị `/ThietBi`):

```
1. Client gửi GET request: /ThietBi?nhomThietBi=MayTinh&searchTerm=hp
   │
2. Kestrel Web Server nhận request và chuyển tiếp vào ASP.NET Core Middleware Pipeline.
   │
3. Cơ chế Routing phân tích URL:
   - Controller = "ThietBi"  -> Gọi class ThietBiController.cs
   - Action     = "Index"    -> Gọi method Index(string? nhomThietBi, string? searchTerm)
   │
4. Dependency Injection tiêm instance của `ITAssetDBContext` vào Constructor của ThietBiController.
   │
5. Controller thực thi truy vấn:
   - Khởi tạo IQueryable: `var query = _context.ThietBis.AsQueryable();`
   - Ghép điều kiện lọc WHERE bằng LINQ:
     query = query.Where(t => t.NhomThietBi == nhomThietBi);
     query = query.Where(t => t.Model.Contains(searchTerm) || t.SerialNumber.Contains(searchTerm)...);
   - Thực thi truy vấn xuống SQL Server khi gọi `.ToListAsync()`:
     EF Core sinh ra câu lệnh SQL: `SELECT [t].[Id], [t].[Model], ... FROM [ThietBi] AS [t] WHERE ...`
   - Đếm số lượng theo nhóm: `_context.ThietBis.GroupBy(t => t.NhomThietBi)...`
   │
6. Controller gán dữ liệu phụ trợ vào ViewBag:
   - `ViewBag.GroupCounts`: danh sách thống kê số lượng từng nhóm.
   - `ViewBag.SearchTerm`: giữ lại từ khóa tìm kiếm trên ô input.
   │
7. Controller trả về kết quả: `return View(list);`
   │
8. Razor View Engine nạp file `Views/ThietBi/Index.cshtml`:
   - Khai báo kiểu nhận: `@model IEnumerable<ITAssetManagement.Models.ThietBi>`
   - Chạy vòng lặp `@foreach (var item in Model)` để render các thẻ HTML, badge trạng thái, nút thao tác.
   │
9. Kestrel trả về mã HTML hoàn chỉnh cho cửa sổ Photino Desktop hiển thị.
```

---

### Vòng đời 1 HTTP POST Request (Nhận dữ liệu từ UI xuống CSDL)

Khi người dùng bấm nút "Lưu thiết bị" hoặc "Cập nhật thay đổi":

```
1. Người dùng submit form HTML:
   - Form gửi POST request lên URL `/ThietBi/Create`
   - Đính kèm Form Data (Model, SerialNumber, Cpu, Ram, Owner, ThoiGianDauTu...)
   - Đính kèm thẻ ẩn chống giả mạo: `__RequestVerificationToken`
   │
2. Middleware kiểm tra CSRF:
   - Controller có gắn thuộc tính `[ValidateAntiForgeryToken]`.
   - Nếu token không hợp lệ hoặc thiếu -> Trả lỗi HTTP 400 Bad Request ngay lập tức.
   │
3. Model Binding tự động:
   - ASP.NET Core đọc các trường form có tên tương ứng (`name="Model"`, `name="SerialNumber"`...)
   - Tự động map vào các thuộc tính của đối tượng `ThietBi thietBi` truyền vào Action.
   │
4. Kiểm tra hợp lệ (Validation):
   - Kiểm tra `ModelState.IsValid`.
   - Nếu có thuộc tính bị vi phạm Data Annotations (vd: để trống trường bắt buộc), Controller trả lại View cũ kèm danh sách lỗi hiển thị màu đỏ.
   │
5. Thực thi Nghiệp vụ trong Controller:
   - Chuẩn hóa ngày tháng: gọi hàm `FormatDateToDb()` để chuyển `yyyy-MM-dd` từ date picker thành `MM/dd/yyyy`.
   - Xử lý quan hệ User: Nếu có `UserId`, tự truy vấn `_context.Users` để điền đồng bộ `Owner` và `PhongBan`.
   - Logic Kho IT: Nếu `Owner` để trống, tự gán `Owner = "Kho IT"` và `PhongBan = "IT"`.
   - Ghi bản ghi thiết bị: `_context.Add(thietBi); await _context.SaveChangesAsync();`
   - Ghi lịch sử luân chuyển: khởi tạo đối tượng `LichSuDieuChuyen` mới và lưu tiếp:
     `_context.LichSuDieuChuyens.Add(history); await _context.SaveChangesAsync();`
   │
6. Điều hướng kết quả:
   - Gán thông báo thành công: `TempData["SuccessMessage"] = "...";`
   - Chuyển hướng người dùng về trang danh sách: `return RedirectToAction(nameof(Index));`
```

---

## 2. CẤU TRÚC VÀ VAI TRÒ TỪNG TẦNG TRONG CODEBASE

### Tầng 0: Khởi chạy ứng dụng & Desktop Host (`Program.cs`)
- **File:** `ITAssetManagement/Program.cs`
- **Chức năng:** Điểm vào (Entry Point) của toàn bộ tiến trình khi chạy `ITAssetManagement.exe`.
- **Nội dung thực thi chính:**
  1. **Đăng ký Service vào DI Container (`builder.Services`):**
     - `builder.Services.AddControllersWithViews()`: Đăng ký dịch vụ MVC.
     - `builder.Services.AddDbContext<ITAssetDBContext>(options => options.UseSqlServer(connectionString))`: Đăng ký DbContext kết nối SQL Server theo phạm vi Scoped.
     - `builder.Services.AddHostedService<HeartbeatService>()`: Chạy dịch vụ nền kiểm tra kết nối định kỳ.
  2. **Cấu hình Middleware Pipeline (`app.Use...`):**
     - `app.UseStaticFiles()`: Phục vụ các file tĩnh trong thư mục `wwwroot/` (css, js, hình ảnh, vendor).
     - `app.UseRouting()`: Định tuyến request đến đúng Controller/Action.
     - `app.MapControllerRoute(name: "default", pattern: "{controller=Home}/{action=Index}/{id?}")`: Thiết lập route mặc định trỏ về Dashboard `Home/Index`.
  3. **Tích hợp Photino Desktop (`Photino.NET`):**
     - Kestrel Web Server được khởi động trên một cổng localhost nội bộ (vd: `http://127.0.0.1:5000`).
     - Khởi tạo cửa sổ `PhotinoWindow` nhúng WebView2 trỏ thẳng vào URL localhost đó, cho phép ứng dụng hiển thị như một phần mềm desktop Native (.exe).

---

### Tầng 1: Tầng truy xuất CSDL (`ITAssetDBContext` - EF Core)
- **File:** `ITAssetManagement/Models/ITAssetDBContext.cs`
- **Chức năng:** Đại diện cho toàn bộ Cơ sở dữ liệu `ITAssetDB`, kế thừa class `DbContext` của Entity Framework Core.
- **Nội dung khai báo:**
  - Các thuộc tính `DbSet<T>` tương ứng với các bảng trong SQL Server:
    ```csharp
    public virtual DbSet<ThietBi> ThietBis { get; set; }
    public virtual DbSet<User> Users { get; set; }
    public virtual DbSet<License> Licenses { get; set; }
    public virtual DbSet<ApplicationSoftware> ApplicationSoftwares { get; set; }
    public virtual DbSet<LichSuDieuChuyen> LichSuDieuChuyens { get; set; }
    public virtual DbSet<LichSuBaoTri> LichSuBaoTris { get; set; }
    ```
  - Cấu hình ánh xạ bảng trong phương thức `OnModelCreating()`: Khai báo tên bảng, kiểu dữ liệu cột, tên khóa chính (`Id`).
  - **Phương thức hoạt động:**
    - Truy vấn dữ liệu: Sử dụng LINQ (`_context.ThietBis.Where(...)`). EF Core dịch câu LINQ sang SQL query và tự map kết quả trả về thành các C# Object.
    - Lưu thay đổi: Gọi `_context.SaveChangesAsync()`. EF Core tự quản lý Change Tracker, tự tạo câu lệnh `INSERT`, `UPDATE` hoặc `DELETE` tương ứng và thực thi trong Transaction.

---

### Tầng 2: Mô hình Dữ liệu (Entity Models & ViewModels)

Trong hệ thống, dữ liệu được phân tách rõ ràng thành 2 loại:

#### A. Entity Models (`ITAssetManagement/Models/`)
Ánh xạ trực tiếp 1-1 với cấu trúc các bảng vật lý dưới SQL Server:
- `ThietBi.cs`: Đại diện bảng `ThietBi` (Id, NhomThietBi, Model, SerialNumber, Owner, UserId, ThoiGianDauTu, HsdbanDau, ThoiGianBaoTri, HsdgiaHan...).
- `User.cs`: Đại diện bảng `Users` (Id, Username, FullName, Email, Department, Position, IsActive...).
- `License.cs`: Đại diện bảng `License` (Id, Owner, ComputerName, GlobalDomain, LocalDomain, ActiveAccount, KichHoat...).
- `ApplicationSoftware.cs`: Đại diện bảng `ApplicationSoftware` (Id, UserId, Owner, PhongBan, May, UngDung, LoaiPhanMem...).
- `LichSuDieuChuyen.cs`: Đại diện bảng `LichSuDieuChuyen` (Id, ThietBiId, LoaiHanhDong, Ngay, OwnerCu, OwnerMoi, NguoiThucHien...).
- `LichSuBaoTri.cs`: Đại diện bảng `LichSuBaoTri` (Id, ThietBiId, Model, SerialNumber, TieuDe, LoaiHanhDong, TrangThai, NgayDuKien, ChiPhi...).

#### B. ViewModels (`ITAssetManagement/Models/`)
Là các mô hình dữ liệu tạo ra để phục vụ hiển thị riêng cho từng màn hình khi cấu trúc bảng phẳng dưới DB không đáp ứng trực tiếp:
- `UserAppGroupViewModel.cs`: Phục vụ màn hình danh mục phần mềm cài đặt. Một nhân sự có thể có từ 5-10 phần mềm. Thay vì hiển thị các dòng trùng lặp tên người, ViewModel này gom nhóm 1 User đi kèm một danh sách `List<ApplicationSoftware> Apps`.
- `BienBanViewModel.cs`: Phục vụ màn hình tạo và in biên bản bàn giao. Gom thông tin từ nhiều bảng: thông tin nhân sự nhận/giao (`User`), thông số kỹ thuật máy tính (`ThietBi`), tài khoản đăng nhập và email M365 (`License`).

---

### Tầng 3: Tầng Điều phối Nghiệp vụ (Controllers)
- **Vị trí:** `ITAssetManagement/Controllers/`
- **Vai trò:** Nhận request từ trình duyệt, điều phối dữ liệu với `ITAssetDBContext`, xử lý logic nghiệp vụ và trả về View tương ứng.
- **Quy tắc thiết kế:**
  - Nhận `ITAssetDBContext` thông qua Dependency Injection tại Constructor:
    ```csharp
    private readonly ITAssetDBContext _context;
    public ThietBiController(ITAssetDBContext context) { _context = context; }
    ```
  - Phương thức `Index()`: Nhận query string từ URL (`search`, `filter`), lọc dữ liệu qua LINQ, tính toán số liệu thống kê truyền vào `ViewBag`, sau đó trả về View chính.
  - Phương thức `Create()` / `Edit()`:
    - Nhánh GET: Chuẩn bị dữ liệu danh mục (Users, Devices) đưa vào `ViewBag` để nạp vào các Dropdown / Modal picker.
    - Nhánh POST: Có gắn `[HttpPost]` và `[ValidateAntiForgeryToken]`, nhận model đã bind, kiểm tra validation, xử lý logic bổ sung, gọi `SaveChangesAsync()` và redirect về `Index`.

---

### Tầng 4: Tầng Hiển thị & Tương tác (Razor Views & JavaScript)
- **Vị trí:** `ITAssetManagement/Views/<TênController>/`
- **Vai trò:** Sinh mã HTML/CSS và quản lý tương tác giao diện người dùng.
- **Thành phần kỹ thuật:**
  1. **Razor Engine (.cshtml):**
     - Chỉ thị `@model`: Khai báo kiểu dữ liệu mạnh mà View nhận từ Controller.
     - Khối lệnh C# `@ { ... }`: Định dạng dữ liệu ngày tháng, logic hiển thị ẩn/hiện badge trạng thái.
     - Tag Helpers (`asp-for`, `asp-action`, `asp-controller`): Tự động sinh `id`, `name`, `value` chuẩn cho các thẻ input trong form, liên kết chính xác với thuộc tính trong Model.
  2. **Client-side JavaScript:**
     - Hàm tìm kiếm không dấu `removeVietnameseTones(str)`: Chuẩn hóa chuỗi tiếng Việt có dấu về dạng ký tự ascii không dấu để lọc dữ liệu trực tiếp trên DOM mà không cần gọi lại server.
     - Hàm auto-fill dữ liệu `selectUserFromModal()`: Nhận `userId`, gán vào thẻ `<input type="hidden">`, tự điền Họ tên, Phòng ban vào form.
     - Tự động tính hạn bảo hành `setWarrantyMonths(36)`: Lấy giá trị ngày đầu tư, cộng thêm 36 tháng và tự động điền vào ô hạn sử dụng.

---

## 3. CHI TIẾT LUỒNG HOẠT ĐỘNG CỦA TỪNG PHÂN HỆ CHỨC NĂNG

### 3.1. Phân hệ Quản lý Thiết bị (`ThietBiController`)

#### Các file tham gia:
- Controller: `Controllers/ThietBiController.cs`
- Entity Model: `Models/ThietBi.cs`, `Models/LichSuDieuChuyen.cs`
- Views: `Views/ThietBi/Index.cshtml`, `Create.cshtml`, `Edit.cshtml`, `Details.cshtml`

#### Chi tiết luồng xử lý:

```
                  ┌──────────────────────────────┐
                  │      ThietBiController       │
                  └──────────────┬───────────────┘
          ┌──────────────────────┼──────────────────────┐
          ▼                      ▼                      ▼
    Index() [GET]          Create() [POST]        Details() [GET]
          │                      │                      │
 1. Lọc theo nhóm &     1. ValidateAntiForgeryToken   1. Lấy ThietBi theo Id
    từ khóa tìm kiếm       FormatDateToDb()           2. Lấy User qua UserId
 2. GroupBy đếm nhóm    2. Check Owner:               3. Lấy LichSuBaoTri
 3. Return View(list)      - Trống -> "Kho IT"        4. Lấy LichSuDieuChuyen
                           - Có User -> Map Dept      5. Return View(thietBi)
                        3. _context.Add(thietBi)
                        4. Tạo LichSuDieuChuyen:
                           LoaiHanhDong = "Nhập kho mới"
                        5. SaveChangesAsync()
```

1. **Hiển thị danh sách (`Index`):**
   - Nhận 2 tham số lọc: `nhomThietBi` và `searchTerm`.
   - Sử dụng LINQ `_context.ThietBis.Where(...)` để tìm kiếm đa trường: Model, SerialNumber, Owner, PhongBan, Ipaddress.
   - Thống kê nhóm động: `_context.ThietBis.GroupBy(t => t.NhomThietBi).Select(...)` để đếm chính xác số lượng máy tính, thiết bị mạng, máy in... hiện có.
   - Trang `Index.cshtml` kiểm tra thuộc tính `Owner`: Nếu bằng `"Kho IT"` hoặc rỗng, hiển thị badge xanh `[📦 Kho IT]`.

2. **Thêm mới thiết bị & Logic Nhập kho IT (`Create`):**
   - **Giao diện (`Create.cshtml`):**
     - Form chứa 4 khu vực: Thông tin chung, Người sử dụng, Cấu hình phần cứng, Niên hạn & Bảo trì.
     - Người dùng có thể chọn gán cho nhân sự qua Modal tìm kiếm hoặc để trống.
     - Các trường ngày (`ThoiGianDauTu`, `HsdbanDau`, `ThoiGianBaoTri`, `HsdgiaHan`) sử dụng `<input type="date">`. Nút "Tự tính +36 tháng" tự động cộng 3 năm từ ngày đầu tư để điền vào HSD ban đầu.
   - **Xử lý tại Controller (`Create` POST):**
     - Gọi hàm private `FormatDateToDb()` để chuyển đổi chuỗi ngày từ chuẩn HTML5 (`yyyy-MM-dd`) sang chuẩn lưu trữ của hệ thống (`MM/dd/yyyy`).
     - **Kiểm tra nghiệp vụ kho:**
       ```csharp
       bool isNhapKho = string.IsNullOrWhiteSpace(thietBi.Owner) || thietBi.Owner.Trim().ToLower() == "kho it";
       if (isNhapKho)
       {
           thietBi.Owner = "Kho IT";
           thietBi.UserId = null;
           thietBi.PhongBan = "IT";
       }
       ```
     - Lưu đối tượng `ThietBi` vào database: `_context.Add(thietBi); await _context.SaveChangesAsync();`.
     - **Tự động ghi vết điều chuyển ban đầu:** Tạo một bản ghi trong `LichSuDieuChuyen`:
       - `LoaiHanhDong`: `"Nhập kho mới"` (nếu đưa vào kho) hoặc `"Cấp phát mới"` (nếu gán thẳng cho User).
       - `OwnerCu`: `"Nhà cung cấp / Mua mới"`.
       - `OwnerMoi`: `thietBi.Owner`.
       - `Ngay`: lấy theo ngày đầu tư `ThoiGianDauTu`.
     - Lưu lịch sử và chuyển hướng về `Index`.

3. **Chỉnh sửa thiết bị (`Edit`):**
   - Nhánh GET: Nạp thiết bị theo `id`, chuyển đổi chuỗi ngày `MM/dd/yyyy` sang `yyyy-MM-dd` qua hàm helper Razor `@FormatForDateInput()` để hiển thị đúng lên thẻ `input type="date"`.
   - Nhánh POST: Nhận đối tượng cập nhật, format lại ngày về `MM/dd/yyyy`, gọi `_context.Update(thietBi)` và lưu thay đổi.

4. **Xem chi tiết thiết bị (`Details`):**
   - Truy vấn thiết bị theo `Id`.
   - Đồng thời nạp liên kết từ 3 bảng khác vào `ViewBag`:
     - `ViewBag.LinkedUser`: Thông tin chi tiết của nhân sự đang nắm máy từ bảng `Users`.
     - `ViewBag.BaoTriList`: Toàn bộ lịch sử sửa chữa từ bảng `LichSuBaoTri` có `SerialNumber` hoặc `ThietBiId` trùng khớp.
     - `ViewBag.DieuChuyenList`: Toàn bộ lịch sử bàn giao/thu hồi từ bảng `LichSuDieuChuyen`.

---

### 3.2. Phân hệ Biên bản Bàn giao & Thu hồi (`BienBanController`)

#### Các file tham gia:
- Controller: `Controllers/BienBanController.cs`
- ViewModel: `Models/BienBanViewModel.cs`
- Entity Model: `Models/LichSuDieuChuyen.cs`, `Models/ThietBi.cs`, `Models/User.cs`, `Models/License.cs`
- File mẫu: `data/Bienban/CapPhat/CapphatTBCNTT.docx` và `data/Bienban/ThuHoi/ThuHoiTBCNTT.docx`
- Views: `Views/BienBan/Index.cshtml`, `Create.cshtml`, `Preview.cshtml`

#### Chi tiết luồng xử lý:

```
[Người dùng chọn Cấp phát hoặc Thu hồi]
                 │
                 ▼
1. BienBanController.Create(loai, thietBiId, userId) [GET]
   - Sinh Số biên bản tự động: DateTime.Now.ToString("yyMMdd.HHmmss")
   - Nạp thông số phần cứng từ ThietBi (CPU, RAM, HDD)
   - Nạp thông tin tài khoản từ User và License (Email M365, Domain)
   - Truyền BienBanViewModel sang View
                 │
                 ▼
2. Giao diện Create.cshtml:
   - Cho phép chỉnh sửa thông tin bàn giao
   - Hai lựa chọn xử lý: "Xuất file Word" hoặc "Lưu lịch sử điều chuyển"
                 │
        ┌────────┴───────────────────────────┐
        ▼                                    ▼
[Nút: Xuất file Word]             [Nút: Lưu lịch sử điều chuyển]
        │                                    │
3. Action ExportWord() [POST]:     4. Action SaveHistory() [POST]:
   - Đọc template .docx bằng ZipArchive - Tạo bản ghi LichSuDieuChuyen mới
   - Đọc word/document.xml              - Cập nhật bảng ThietBi:
   - Regex replace các «Placeholder»     + Cấp phát: Owner = NguoiNhan
   - Xóa thẻ <w:mailMerge>               + Thu hồi:  Owner = "Kho IT"
   - Trả về file Stream .docx           - _context.SaveChangesAsync()
```

1. **Khởi tạo dữ liệu biên bản (`Create` GET):**
   - Khởi tạo `BienBanViewModel` với số biên bản duy nhất sinh từ timestamp: `yyMMdd.HHmmss`.
   - Nếu có `thietBiId`: Tự động nạp thông số kỹ thuật (ghép CPU, RAM, HardDisk thành chuỗi `DacTinhKyThuat`), nạp ngày đầu tư vào `ThoiGianCap`.
   - Nếu có `userId`: Nạp Họ tên, Chức vụ, Phòng ban. Đồng thời truy vấn bảng `License` để lấy chính xác `LocalDomain` (tài khoản domain đăng nhập máy) và `GlobalDomain` (Email Microsoft 365).
   - Chuẩn bị danh sách `ViewBag.Devices` và `ViewBag.Users` để người dùng có thể đổi thiết bị hoặc nhân sự trực tiếp trên giao diện.

2. **Cơ chế Xuất file Word OpenXML trực tiếp (`ExportWord` POST):**
   - Ứng dụng không cần cài đặt Microsoft Word trên máy chủ, mà xử lý trực tiếp định dạng **OpenXML** của file `.docx` (vốn là một file `.zip` chứa các file XML):
     1. Nạp file template mẫu tương ứng từ thư mục `data/Bienban/`.
     2. Mở file bằng thư viện chuẩn .NET: `System.IO.Compression.ZipArchive`.
     3. Đọc nội dung file `word/document.xml`.
     4. Thay thế hàng loạt các placeholder được định nghĩa sẵn:
        `«SoBienBan»`, `«NgayBanGiao»`, `«NguoiBanGiao»`, `«NguoiNhan»`, `«TenThietBi»`, `«DacTinhKyThuat»`, `«Email_M365»`, `«Domain_Name»`, `«MucTruyCap_ERP»`.
     5. Xóa bỏ cấu hình `<w:mailMerge>` trong `word/settings.xml` để đảm bảo khi người dùng mở file Word trên máy tính không bị hiện popup cảnh báo SQL.
     6. Trả về `File(outputBytes, "application/vnd.openxmlformats-officedocument.wordprocessingml.document", fileName)` để trình duyệt tải file về.

3. **Lưu lịch sử điều chuyển & Chuyển giao chủ sở hữu (`SaveHistory` POST):**
   - Tạo đối tượng `LichSuDieuChuyen`:
     - Ghi nhận `LoaiHanhDong`: `"Cấp phát"` hoặc `"Thu hồi"`.
     - Ghi nhận `OwnerCu`, `PhongBanCu`, `OwnerMoi`, `PhongBanMoi`.
     - Lưu số biên bản và chi tiết thiết bị vào cột `ChiTiet`.
   - **Tự động cập nhật bảng `ThietBi`:**
     - Nếu là **Cấp phát:** Cập nhật `thietBi.Owner = model.NguoiNhan`, `thietBi.PhongBan = model.BoPhan_Nhan`. Nếu máy chưa có ngày đầu tư, tự động cập nhật theo ngày cấp phát.
     - Nếu là **Thu hồi:** Tự động chuyển máy về kho: `thietBi.Owner = "Kho IT"`, `thietBi.PhongBan = "IT"`, `thietBi.UserId = null`.
   - Cả hai bảng `LichSuDieuChuyen` và `ThietBi` được commit đồng thời qua `await _context.SaveChangesAsync()`.

---

### 3.3. Phân hệ Phần mềm Cài đặt (`ApplicationSoftwareController`)

#### Các file tham gia:
- Controller: `Controllers/ApplicationSoftwareController.cs`
- Entity Model: `Models/ApplicationSoftware.cs`
- ViewModel: `Models/UserAppGroupViewModel.cs`
- Views: `Views/ApplicationSoftware/Index.cshtml`, `Create.cshtml`, `Edit.cshtml`

#### Chi tiết luồng xử lý:

```
[Bảng ApplicationSoftware (SQL Server)]
(Lưu phẳng: mỗi dòng là 1 phần mềm của 1 user)
                 │
                 ▼ (EF Core LINQ Query)
var list = await _context.ApplicationSoftwares.ToListAsync();
                 │
                 ▼ (LINQ GroupBy trong Controller)
list.GroupBy(a => new { a.Owner, a.PhongBan, a.May, a.UserId })
    .Select(g => new UserAppGroupViewModel {
        Owner = g.Key.Owner,
        PhongBan = g.Key.PhongBan,
        May = g.Key.May,
        Apps = g.ToList() // Danh sách các phần mềm của user
    })
                 │
                 ▼
return View(grouped);
                 │
                 ▼
Views/ApplicationSoftware/Index.cshtml
Render giao diện dạng danh thiếp từng User, bấm vào để mở bảng chi tiết phần mềm.
```

1. **Gom nhóm dữ liệu bằng ViewModel (`Index`):**
   - Trong SQL Server, bảng `ApplicationSoftware` lưu dữ liệu dạng phẳng (ví dụ: dòng 1 là Duy cài Office, dòng 2 là Duy cài AutoCAD).
   - Nếu đổ thẳng ra giao diện, thông tin người dùng sẽ bị lặp lại hàng chục lần.
   - Controller dùng LINQ `GroupBy` theo bộ khóa `{ Owner, PhongBan, May, UserId }` và chiếu (project) vào danh sách các đối tượng `UserAppGroupViewModel`.
   - View nhận `@model IEnumerable<UserAppGroupViewModel>` và render giao diện Accordion: Mỗi nhân sự là một khối thông tin độc lập, bên trong chứa danh sách phần mềm họ sử dụng kèm loại bản quyền và ngày cài đặt.

2. **Thêm phần mềm mới (`Create`):**
   - Nhánh GET: Controller nạp danh sách `Users` và tạo một Dictionary map từ `UserId` sang tên thiết bị máy tính đang sở hữu (lấy từ bảng `ThietBi`). Đưa toàn bộ vào `ViewBag.Users` và `ViewBag.UserDevices`.
   - Giao diện `Create.cshtml`: Khi người dùng bấm chọn User trong modal tra cứu, mã JavaScript tự động đọc `ViewBag.UserDevices` để điền trước tên máy vào ô nhập liệu `May`, giảm thiểu thao tác nhập tay.
   - Nhánh POST: Kiểm tra `ModelState.IsValid`, gán ngày tạo và lưu vào bảng `ApplicationSoftware`.

---

### 3.4. Phân hệ Bản quyền & License (`LicenseController`)

#### Các file tham gia:
- Controller: `Controllers/LicenseController.cs`
- Entity Model: `Models/License.cs`
- Helper Model: `Models/LicenseUsageStat.cs`
- Views: `Views/License/Index.cshtml`, `Create.cshtml`, `Edit.cshtml`, `Details.cshtml`

#### Chi tiết luồng xử lý:
1. **Kiểm soát định mức tài khoản dùng chung (`Index`):**
   - Do chính sách cấp quyền phần mềm (vd: tài khoản M365 hoặc Autodesk), một tài khoản kích hoạt (`ActiveAccount`) có thể được chia sẻ tối đa cho 10 thiết bị.
   - Controller truy vấn toàn bộ license có `ActiveAccount`, thực hiện gom nhóm để tính toán số lượng thiết bị đang dùng chung mỗi tài khoản:
     ```csharp
     var accountStats = activeAccountLicenses
         .GroupBy(l => l.ActiveAccount!.Trim())
         .Select(g => new LicenseUsageStat {
             ActiveAccount = g.Key,
             Count = g.Count(),
             Limit = 10,
             Owners = g.Select(x => x.Owner).Distinct().ToList(),
             ComputerNames = g.Select(x => x.ComputerName).Distinct().ToList()
         }).ToList();
     ```
   - Class `LicenseUsageStat` cung cấp thuộc tính `IsOverLimit => Count > Limit`. Nếu tài khoản vượt quá 10 thiết bị, giao diện tự động bật cảnh báo vi phạm định mức bản quyền.

---

### 3.5. Phân hệ Lịch sử & Kế hoạch Bảo trì (`BaoTriController`)

#### Các file tham gia:
- Controller: `Controllers/BaoTriController.cs`
- Entity Model: `Models/LichSuBaoTri.cs`, `Models/ThietBi.cs`
- Views: `Views/BaoTri/Index.cshtml`, `Create.cshtml`, `Edit.cshtml`

#### Chi tiết luồng xử lý:
1. **Quản lý đa chế độ hiển thị (`Index`):**
   - Hỗ trợ 2 chế độ xem thông qua tham số `viewMode`:
     - `table`: Hiển thị dạng bảng truyền thống có lọc theo trạng thái (`Kế hoạch`, `Đang xử lý`, `Hoàn thành`).
     - `calendar`: Hiển thị dạng lưới lịch tháng (`ViewBag.SelectedMonth`, `ViewBag.SelectedYear`), ánh xạ các bản ghi bảo trì vào từng ô ngày theo trường `NgayDuKien`.
2. **Lập kế hoạch bảo trì hàng loạt (`CreateBatch` POST):**
   - Cho phép chọn nhiều thiết bị cùng lúc (ví dụ toàn bộ máy tính phòng Kế toán) để tạo lịch bảo dưỡng định kỳ trong một lần bấm.
   - Controller nhận danh sách `deviceIds`, lặp qua từng thiết bị và tạo một danh sách các bản ghi `LichSuBaoTri`, sau đó gọi `_context.LichSuBaoTris.AddRange(batchRecords)` để ghi vào DB trong một Transaction duy nhất.

---

### 3.6. Phân hệ Quản lý Nhân sự (`UsersController`)

#### Các file tham gia:
- Controller: `Controllers/UsersController.cs`
- Entity Model: `Models/User.cs`, `Models/ThietBi.cs`, `Models/License.cs`
- Views: `Views/Users/Index.cshtml`, `Details.cshtml`, `Create.cshtml`, `Edit.cshtml`

#### Chi tiết luồng xử lý:
1. **Xem chi tiết hồ sơ tài sản nhân sự (`Details`):**
   - Khi xem một nhân sự (`id`), Controller không chỉ đọc bảng `Users` mà còn thực hiện tổng hợp chéo tài sản:
     - Lấy danh sách máy móc đang giao: `_context.ThietBis.Where(t => t.UserId == user.Id || t.Owner == user.FullName)`.
     - Lấy danh sách License đang cấp: `_context.Licenses.Where(l => l.UserId == user.Id || l.Owner == user.FullName)`.
     - Lấy danh sách Phần mềm đang cài: `_context.ApplicationSoftwares.Where(a => a.UserId == user.Id || a.Owner == user.FullName)`.
   - View `Details.cshtml` hiển thị bức tranh toàn cảnh: nhân viên này đang giữ bao nhiêu thiết bị, dùng email M365 nào và đã cài các ứng dụng gì.

---

## 4. CƠ CHẾ VẬN HÀNH DESKTOP & CƠ SỞ DỮ LIỆU SQL SERVER

### Tại sao ứng dụng chạy được khi không bật phần mềm SSMS?

Một hiểu lầm phổ biến là nghĩ rằng muốn phần mềm chạy thì phải mở giao diện SQL Server Management Studio (SSMS). Thực tế kiến trúc được phân tách như sau:

```
┌───────────────────────────────────────┐
│     SSMS (Chương trình đồ họa)         │  <-- Chỉ là giao diện bấm bằng chuột cho người dùng
│     (Có thể tắt hoặc gỡ bỏ hoàn toàn) │
└───────────────────┬───────────────────┘
                    │ (Gửi lệnh SQL)
                    ▼
┌────────────────────────────────────────────────────────┐
│     Windows Service: MSSQLSERVER / MSSQL$SQLEXPRESS    │  <-- ĐÂY MỚI LÀ CƠ SỞ DỮ LIỆU THẬT SỰ
│     - Tiến trình: sqlservr.exe                         │
│     - Trạng thái: Running ngầm cùng hệ điều hành Windows│
│     - Lắng nghe: Port 1433 hoặc Shared Memory / Pipes  │
└───────────────────▲────────────────────────────────────┘
                    │ (Kết nối trực tiếp qua Connection String)
┌───────────────────┴───────────────────┐
│     Ứng dụng ITAssetManagement.exe    │  <-- Kết nối thẳng vào Windows Service ngầm
└───────────────────────────────────────┘
```

1. **SSMS chỉ là Client Tool:** SSMS thực chất chỉ là một phần mềm đồ họa (GUI Client) để lập trình viên mở lên xem bảng, tạo cột bằng chuột thay vì gõ lệnh. Nó không hề chứa dữ liệu.
2. **Cơ sở dữ liệu thực sự là Windows Service:** Khi cài đặt SQL Server, Windows sẽ tạo một Service chạy ngầm có tên `MSSQL$SQLEXPRESS` (tiến trình `sqlservr.exe`). Service này được đặt ở chế độ `Startup type: Automatic`, tức là ngay khi người dùng bật máy tính lên, Service này đã tự khởi động ngầm trong bộ nhớ RAM và sẵn sàng lắng nghe kết nối.
3. **Ứng dụng kết nối trực tiếp:** Trong `appsettings.json`, ứng dụng khai báo chuỗi kết nối:
   `Server=localhost\\SQLEXPRESS;Database=ITAssetDB;Trusted_Connection=True;...`
   Khi chạy, thư viện ADO.NET / EF Core của C# sẽ mở một Socket kết nối thẳng tới tiến trình `sqlservr.exe` qua cổng mạng nội bộ hoặc giao thức Shared Memory. Hoàn toàn không liên quan và không phụ thuộc vào việc phần mềm SSMS có đang mở hay không.

---

### Cơ chế Desktop Hybrid: Kestrel + Photino.NET

Ứng dụng không yêu cầu cài đặt web server cồng kềnh (như IIS hay Apache) trên máy tính mà sử dụng mô hình **Desktop Hybrid**:

1. **Web Server Kestrel nhúng:** Khi bấm chạy file `ITAssetManagement.exe`, .NET khởi động một Web Server siêu nhẹ tên là Kestrel ngay bên trong tiến trình của ứng dụng. Kestrel lắng nghe trên một cổng cục bộ ngẫu nhiên hoặc cố định (`http://127.0.0.1:5000`).
2. **Khung giao diện Photino Native Window:** Thư viện `Photino.NET` sử dụng engine trình duyệt có sẵn trên Windows (Microsoft Edge WebView2 Runtime) để mở ra một cửa sổ ứng dụng độc lập, loại bỏ toàn bộ thanh địa chỉ URL, thanh bookmark của trình duyệt thông thường.
3. **Ưu điểm:** Tận dụng được toàn bộ sức mạnh của ASP.NET Core MVC (tốc độ xử lý, template Razor, validation, bảo mật) nhưng người dùng cuối trải nghiệm hoàn toàn như một phần mềm desktop Native (.exe).

---

## 5. ĐÁNH GIÁ KỸ THUẬT: BẢO MẬT, HẠN CHẾ KIẾN TRÚC & HƯỚNG REFACTOR

### Các cơ chế bảo mật có sẵn

1. **Chống SQL Injection:**
   - Hệ thống không sử dụng phương pháp ghép chuỗi câu lệnh SQL thô (`string.Format("SELECT * FROM Users WHERE Name = '{0}'", input)`).
   - 100% các câu truy vấn đều thông qua Entity Framework Core (LINQ to Entities). EF Core tự động tham số hóa (Parameterized Query) toàn bộ dữ liệu người dùng truyền vào, vô hiệu hóa hoàn toàn nguy cơ SQL Injection.
2. **Chống tấn công Cross-Site Request Forgery (CSRF):**
   - Mọi phương thức POST tiếp nhận thay đổi dữ liệu đều được bảo vệ bởi bộ đôi:
     - Trên View: Tag Helper `<form>` tự động sinh ra một thẻ `<input type="hidden" name="__RequestVerificationToken" value="...">`.
     - Trên Controller: Thuộc tính `[ValidateAntiForgeryToken]` kiểm tra token này trước khi cho phép thực thi code.
3. **Chống tấn công Cross-Site Scripting (XSS):**
   - Mặc định, cú pháp Razor Engine `@Model.ThuocTinh` tự động mã hóa HTML (HTML Encoding) mọi chuỗi văn bản trước khi đưa vào DOM. Nếu người dùng nhập `<script>alert('hack')</script>`, trình duyệt sẽ hiển thị nguyên văn chuỗi ký tự đó chứ không thực thi mã JavaScript độc hại.
4. **Môi trường chạy cục bộ (Localhost):**
   - Kestrel chỉ bind vào `127.0.0.1` trên máy cục bộ, không mở cổng public ra Internet bên ngoài, loại bỏ phần lớn các nguy cơ tấn công mạng diện rộng.

---

### Điểm cần cải tiến (Zero-FK, Fat Controller, Authentication)

Dưới góc nhìn kỹ thuật, kiến trúc hiện tại có 3 điểm cần lưu ý khi nâng cấp hệ thống trong tương lai:

#### 1. Mô hình "Không Khóa Ngoại" (Zero-FK):
- **Thực trạng:** Các bảng trong CSDL `ITAssetDB` không đặt các ràng buộc khóa ngoại (Foreign Key Constraint) cứng ở tầng SQL Server. Quan hệ giữa `ThietBi.UserId` và `Users.Id` được duy trì hoàn toàn bằng logic trong code C#.
- **Ưu điểm:** Cực kỳ linh hoạt khi import dữ liệu ban đầu từ Excel vào hệ thống, không bị chặn lỗi vi phạm ràng buộc dữ liệu cũ.
- **Rủi ro:** Nếu sau này có chức năng xóa người dùng mà lập trình viên quên viết code cập nhật các bản ghi liên quan, CSDL sẽ xuất hiện "bản ghi mồ côi" (Orphan Records) — ví dụ thiết bị vẫn trỏ tới một `UserId` không còn tồn tại trong bảng `Users`.
- **Giải pháp:** Khi hệ thống đi vào vận hành ổn định, nên bổ sung các ràng buộc `ON DELETE SET NULL` trực tiếp dưới SQL Server hoặc viết cơ chế Soft-delete (`IsDeleted = true`).

#### 2. Vấn đề "Fat Controller" (Controller ôm đồm nhiều việc):
- **Thực trạng:** Hiện tại các Controller (`ThietBiController`, `BienBanController`) đang trực tiếp đảm nhận nhiều vai trò: nhận HTTP request, validate dữ liệu, viết câu truy vấn LINQ phức tạp, xử lý logic ghi file Word, tính toán số liệu thống kê.
- **Rủi ro:** Khi quy mô dự án tăng lên, file Controller sẽ dài ra (300 - 1.000 dòng), gây khó khăn cho việc đọc hiểu và không thể viết bài kiểm thử tự động (Unit Test).
- **Hướng Refactor chuẩn:** Tách nhỏ Controller bằng cách áp dụng **Service Layer**:
  ```
  Controller (Chỉ lo nhận request và trả về View)
      │
      ▼
  Service Layer (IThietBiService: xử lý nghiệp vụ, tính toán ngày khấu hao, nhập kho)
      │
      ▼
  Data Access (ITAssetDBContext: chỉ lo đọc/ghi database)
  ```

#### 3. Cơ chế Xác thực & Phân quyền (Authentication & Authorization):
- **Thực trạng:** Ứng dụng hiện tại chưa có module Đăng nhập (Login). Nhãn "IT Admin" trên thanh tiêu đề chỉ là giao diện tĩnh. Bất kỳ ai khởi động được file `.exe` đều có toàn quyền thêm, sửa, xóa dữ liệu.
- **Hướng nâng cấp:** Tích hợp `ASP.NET Core Identity` hoặc xác thực qua Windows Authentication / LDAP Domain của công ty, gắn các thuộc tính `[Authorize(Roles = "Admin")]` lên các Action chỉnh sửa quan trọng để đảm bảo an toàn truy cập.

---
*Tài liệu được cập nhật ngày 06/11/2026 bởi Đội ngũ Kỹ thuật CNTT Hoàng Anh Group.*
