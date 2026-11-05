# BÁO CÁO GIẢI PHÁP HỆ THỐNG QUẢN LÝ TÀI SẢN CNTT
## HA GROUP IT ASSET MANAGEMENT (EXECUTIVE SUMMARY)

> **Kính gửi:** Ban Giám đốc Tập đoàn Hoàng Anh  
> **Đơn vị thực hiện:** Bộ phận Công nghệ Thông tin (IT Department)  
> **Mục tiêu:** Báo cáo tóm lược giải pháp số hóa và tối ưu hóa quản trị vòng đời tài sản CNTT

---

# 1. Bài toán và nỗi đau hiện tại

Trước khi triển khai hệ thống, công tác quản lý tài nguyên công nghệ thông tin tại tập đoàn phụ thuộc phần lớn vào các bảng tính Excel và hồ sơ giấy tờ phân tán, dẫn đến những thách thức lớn đối với công tác điều hành và kiểm soát chi phí:

| Vấn đề nghiệp vụ (Pain Point) | Tác động đến doanh nghiệp | Giá trị hệ thống mang lại |
| :--- | :--- | :--- |
| **Quản lý tài sản bằng Excel phân tán** | Dữ liệu nằm rải rác ở nhiều file, dễ sai lệch khi nhân sự biến động, mất nhiều thời gian tổng hợp báo cáo cho Ban Giám đốc. | **Tập trung hóa 100% dữ liệu:** Toàn bộ thiết bị máy tính, máy in, mạng được quản lý trên một nền tảng cơ sở dữ liệu duy nhất. |
| **Khó theo dõi lịch sử và vòng đời thiết bị** | Không nắm được máy móc đang cấp cho ai, đã khấu hao bao nhiêu năm, lịch sử hỏng hóc thế nào để ra quyết định mua sắm hoặc thay thế chính xác. | **Minh bạch vòng đời tài sản:** Lưu vết toàn bộ lịch sử sử dụng, các lần sửa chữa và luân chuyển giữa các phòng ban. |
| **Khó kiểm soát License Microsoft 365** | Chính sách quy định tối đa 10 máy/tài khoản nhưng quản lý thủ công không nắm được tài khoản nào quá tải, nguy cơ xung đột hoặc bị khóa bản quyền đột ngột. | **Tối ưu chi phí & Cảnh báo tức thì:** Dashboard tự động phát hiện và cảnh báo các tài khoản vượt hạn mức 10 máy, tránh lãng phí chi phí mua thêm license. |
| **Tốn thời gian tạo biên bản bàn giao / thu hồi** | IT phải nhập tay lại cấu hình máy, email và quyền truy cập lên file Word, mất 15–20 phút/lần; dễ quên cập nhật vào sổ theo dõi chung. | **Tự động hóa thủ tục 1-chạm:** Tự động tạo biên bản cấp phát/thu hồi chuẩn mẫu công ty trong vài giây, tự cập nhật trạng thái kho ngay khi duyệt. |
| **Khó lập kế hoạch bảo trì định kỳ** | Bảo dưỡng định kỳ hàng quý hoặc vệ sinh thiết bị theo phòng ban không có kế hoạch tổng thể, dễ bỏ sót máy và khó theo dõi ngân sách sửa chữa. | **Kế hoạch hóa & Kiểm soát ngân sách:** Lập lịch bảo dưỡng hàng loạt theo từng phòng ban, theo dõi trực quan trên lịch tháng và kiểm soát chi phí sửa chữa. |

---

# 2. Kiến trúc và công nghệ sử dụng

Giải pháp được thiết kế tối ưu hóa cho môi trường doanh nghiệp với tiêu chí: **Bảo mật nội bộ, Vận hành ổn định, và Triển khai nhanh chóng**.

### Mô hình hệ thống
* **Desktop Hybrid Application:** Ứng dụng kết hợp giữa nền tảng web hiện đại và sự tiện lợi của ứng dụng máy tính để bàn (Desktop App). 
* Người dùng khởi chạy bằng 1 cú nhấp chuột trực tiếp ngoài màn hình Desktop, không cần thông qua cài đặt phức tạp.

### Công nghệ sử dụng
* **Backend:** ASP.NET Core MVC – Đảm bảo hiệu năng xử lý cao, độ trễ thấp và bảo mật phân quyền chặt chẽ.
* **Cơ sở dữ liệu:** Microsoft SQL Server kết hợp Entity Framework Core – Lưu trữ tập trung, đảm bảo tính toàn vẹn và khả năng sao lưu dự phòng định kỳ an toàn.
* **Tự động hóa văn bản:** Nền tảng OpenXML – Tự động xuất biên bản chuẩn định dạng Microsoft Word (`.docx`) và in ấn trực tiếp không phụ thuộc phần mềm bên thứ ba.

### Phương thức triển khai & Vận hành
* **Hoạt động 100% trên mạng nội bộ (On-Premise / Local Intranet):** Toàn bộ dữ liệu thiết bị và nhân sự được lưu trữ trong nội bộ tập đoàn, không phụ thuộc vào internet công cộng, đảm bảo an toàn thông tin tuyệt đối.
* **Chuyển đổi linh hoạt:** Hệ thống cho phép vận hành linh hoạt giữa máy tính cá nhân của IT và kết nối đến máy chủ CSDL trung tâm của tập đoàn chỉ với 1 thao tác cấu hình.

---

# 3. Cấu trúc cơ sở dữ liệu

Cơ sở dữ liệu được thiết kế tinh giản, tập trung vào 6 thực thể nghiệp vụ cốt lõi:

| Bảng dữ liệu | Chức năng chính |
| :--- | :--- |
| **`Users`** | Quản lý danh bạ nhân sự toàn tập đoàn |
| **`ThietBi`** | Quản lý danh mục tài sản phần cứng CNTT |
| **`License`** | Quản lý và phân bổ bản quyền Microsoft 365 |
| **`LichSuDieuChuyen`** | Theo dõi lịch sử cấp phát, luân chuyển và thu hồi |
| **`LichSuBaoTri`** | Lập kế hoạch bảo dưỡng định kỳ và theo dõi sửa chữa |
| **`ApplicationSoftware`** | Theo dõi phần mềm cài đặt trên từng máy tính |

### Chi tiết các thực thể:

1. **`Users` (Nhân sự):**
   * *Dữ liệu quản lý:* Họ tên, chức vụ, phòng ban, khối làm việc, email doanh nghiệp, tài khoản mạng nội bộ.
   * *Vai trò:* Là trung tâm liên kết trách nhiệm pháp lý đối với các thiết bị và tài khoản phần mềm được công ty giao phó.

2. **`ThietBi` (Tài sản phần cứng):**
   * *Dữ liệu quản lý:* Chủng loại máy (Laptop, PC, Máy in, Thiết bị mạng, Camera), Model, Serial Number, cấu hình phần cứng, hiện trạng sử dụng (Đang cấp phát hay Tồn kho IT), thời gian đầu tư.
   * *Vai trò:* Cung cấp bức tranh toàn cảnh về số lượng, giá trị và hiện trạng toàn bộ tài sản phần cứng của doanh nghiệp.

3. **`License` (Bản quyền số):**
   * *Dữ liệu quản lý:* Danh mục tài khoản Active Office / M365, danh sách máy tính đang liên kết với từng tài khoản, trạng thái kích hoạt.
   * *Vai trò:* Kiểm soát tỷ lệ sử dụng tài khoản, ngăn chặn vi phạm quy định hạn mức và tối ưu chi phí mua bản quyền hàng năm.

4. **`LichSuDieuChuyen` (Nhật ký luân chuyển):**
   * *Dữ liệu quản lý:* Thời gian điều chuyển, người giao, người nhận, lý do bàn giao (cấp mới, đổi máy, nghỉ việc), mã số biên bản lưu trữ.
   * *Vai trò:* Đảm bảo tính minh bạch và truy cứu trách nhiệm khi có sự cố thất thoát hoặc tranh chấp tài sản.

5. **`LichSuBaoTri` (Bảo trì & Sự cố):**
   * *Dữ liệu quản lý:* Nội dung công việc bảo dưỡng, ngày thực hiện, kỹ thuật viên phụ trách, linh kiện thay thế, chi phí sửa chữa thực tế, trạng thái hoàn thành.
   * *Vai trò:* Giúp chủ động lên kế hoạch phòng ngừa hỏng hóc và theo dõi chính xác ngân sách bảo trì định kỳ.

6. **`ApplicationSoftware` (Phần mềm cài đặt):**
   * *Dữ liệu quản lý:* Tên các ứng dụng chuyên dụng cài trên từng máy (AutoCAD, ERP, Sales Project, Office...).
   * *Vai trò:* Kiểm soát tuân thủ bản quyền phần mềm và chuẩn hóa công cụ làm việc theo từng vị trí chức danh.

---

# 4. Chức năng hệ thống

Hệ thống được thiết kế tập trung phục vụ công tác quản lý và hỗ trợ tối đa cho việc ra quyết định của cấp lãnh đạo:

## 4.1. Chức năng cốt lõi
* **Quản lý Tài sản CNTT:** Theo dõi chi tiết thông số kỹ thuật, vị trí lưu trữ và hiện trạng sử dụng của toàn bộ máy tính, máy in và thiết bị mạng.
* **Quản lý Nhân sự sử dụng thiết bị:** Xem hồ sơ tài sản tổng thể của từng nhân viên (đang giữ máy nào, dùng tài khoản gì, có quyền truy cập ERP nào).
* **Quản lý Microsoft 365 License:** Nắm bắt chính xác số lượng license đã kích hoạt, license còn trống và các tài khoản đang sử dụng.
* **Quản lý Bảo trì & Sửa chữa:** Theo dõi các phiếu sửa chữa kỹ thuật phát sinh và chi phí linh kiện thay thế của từng máy.
* **Quản lý Phần mềm Cài đặt:** Nắm bắt danh mục ứng dụng làm việc theo từng cá nhân hoặc theo toàn bộ phòng ban.
* **Theo dõi Lịch sử Điều chuyển:** Lưu lại toàn bộ dấu vết mỗi khi thiết bị đổi người sử dụng hoặc thu hồi về kho.

## 4.2. Tính năng nổi bật mang lại giá trị cao
* 🔴 **Dashboard Cảnh báo License vượt ngưỡng (10 máy/user):**
  * Tự động phát hiện và cảnh báo nổi bật các tài khoản dùng quá định mức để IT can thiệp kịp thời.
  * Hỗ trợ bộ lọc 1-chạm giúp xem ngay danh sách các máy tính đang dùng tài khoản đó để tái phân bổ, tiết kiệm hàng chục triệu đồng chi phí bản quyền phát sinh không cần thiết.
* 📄 **Tự động hóa Biên bản Bàn giao & Thu hồi chuẩn ISO (`ITUA001-F01`):**
  * Tự động sinh mã biên bản duy nhất chống trùng lặp; tự điền cấu hình máy và quyền ERP mà không cần nhập tay.
  * Xem trước trực quan và xuất ra file Word sạch sẽ, sẵn sàng ký duyệt trong 1 phút.
* 🔍 **Tìm kiếm nhanh Nhân sự & Thiết bị thông minh:**
  * Bộ tìm kiếm không phụ thuộc dấu tiếng Việt giúp IT tra cứu hồ sơ máy móc và nhân viên ngay tức thì khi tiếp nhận yêu cầu.
* 📋 **Lập kế hoạch Bảo trì hàng loạt theo Phòng ban:**
  * Cho phép chọn toàn bộ máy móc của một phòng ban chỉ với 1 cú nhấp chuột để lập chiến dịch bảo dưỡng định kỳ (Quy mô Quý/Năm), giúp tiết kiệm 90% thời gian lập kế hoạch.
* 📅 **Lịch bảo trì tháng trực quan & Nghiệm thu 1-chạm:**
  * Thể hiện kế hoạch kỹ thuật theo từng ngày trên giao diện lịch trực quan; nút nghiệm thu nhanh giúp hoàn tất công việc ngay trên danh sách.
* 🖥️ **Trải nghiệm ứng dụng Desktop mượt mà & Ổn định:**
  * Khởi chạy tức thì từ màn hình chính, hoạt động bền bỉ liên tục suốt ngày làm việc mà không làm tiêu tốn tài nguyên máy tính.

---

# KẾT LUẬN & ĐỀ XUẤT

Hệ thống **HA Group IT Asset Management** đã giải quyết toàn diện bài toán thất thoát tài sản, tự động hóa quy trình hành chính IT và tối ưu hóa ngân sách bản quyền phần mềm cho doanh nghiệp. 

Hệ thống đã sẵn sàng đưa vào vận hành chính thức trên toàn tập đoàn nhằm nâng cao tính chuyên nghiệp, minh bạch và hiệu quả trong công tác quản trị tài nguyên CNTT của Hoàng Anh Group.
