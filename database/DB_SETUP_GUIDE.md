# Hướng Dẫn Tạo Lại Database Đúng và Kết Nối Ứng Dụng Desktop với SQL Server Local

## 1️⃣ Xóa Database Cũ (nếu cần)
```powershell
# Mở PowerShell (Run as Administrator) và thực thi:
sqlcmd -S ".\SQLEXPRESS" -E -Q "DROP DATABASE IF EXISTS ITAssetDB;"
```
> *Nếu bạn muốn giữ lại dữ liệu cũ, bỏ qua bước này và chỉ chạy các script cập nhật.*

## 2️⃣ Tạo Database và Schema Đúng
1. **Mở PowerShell** và chạy script DDL `setup_database.sql` (đã được cập nhật để có bảng `dbo.ThietBi` duy nhất, các view, stored procedure và index).
```powershell
sqlcmd -S ".\SQLEXPRESS" -E -i "C:\Users\duy.nguyenhk\OneDrive - HA Group\Desktop\it_asset\database\setup_database.sql"
```
2. **Kiểm tra** rằng bảng `ThietBi` đã được tạo và có cột `NhomThietBi`:
```powershell
sqlcmd -S ".\SQLEXPRESS" -E -Q "SELECT TOP 1 NhomThietBi, COUNT(*) AS Total FROM dbo.ThietBi GROUP BY NhomThietBi;"
```
Bạn sẽ nhận được các nhóm: `Máy tính`, `Thiết bị mạng`, `Máy in & Photocopy`, `Máy chủ`, `Hạ tầng & Camera`.

## 3️⃣ Nhập Dữ Liệu Từ Excel → SQL Server
> Đã có script `import_data.sql` được tạo tự động bởi `generate_import_sql.js`. Nếu bạn đã thay đổi cấu trúc cột (ví dụ `NhomThietBi`), chạy lại script mới để đồng bộ toàn bộ **257 thiết bị**:
```powershell
sqlcmd -S ".\SQLEXPRESS" -E -i "C:\Users\duy.nguyenhk\OneDrive - HA Group\Desktop\it_asset\database\import_data.sql"
```
Sau khi chạy, kiểm tra lại số lượng thiết bị:
```powershell
sqlcmd -S ".\SQLEXPRESS" -E -Q "SELECT NhomThietBi, COUNT(*) AS SoLuong FROM dbo.ThietBi GROUP BY NhomThietBi;"
```
Kết quả mẫu (số lượng có thể thay đổi tùy dữ liệu hiện tại):
```
NhomThietBi                SoLuong
------------------------- --------
Máy tính                  95
Thiết bị mạng             35
Máy in & Photocopy        23
Máy chủ                    4
Hạ tầng & Camera         100
```

## 4️⃣ Kết Nối Ứng Dụng Electron với SQL Server
### 4.1 Cài Đặt Thư Viện `mssql`
```powershell
# Từ thư mục gốc của dự án (desktop-app)
cd desktop-app
npm install mssql
```
> **Lưu ý:** `mssql` sử dụng driver `tedious` (đã được bao gồm). Không cần cài thêm ODBC.

### 4.2 Tạo File Cấu Hình Kết Nối
**Tạo mới** `desktop-app/src/database/dbConfig.js`:
```js
// dbConfig.js – cấu hình kết nối SQL Server (Windows Authentication)
const sql = require('mssql');

const config = {
  server: 'localhost\\SQLEXPRESS',   // hoặc ".\\SQLEXPRESS"
  database: 'ITAssetDB',
  options: {
    encrypt: false,            // SQL Server Express không cần encryption
    trustServerCertificate: true,
    enableArithAbort: true,
  },
  // Đối với Windows Authentication:
  // Nếu chạy dưới tài khoản Windows hiện tại, không cần user/pwd
  authentication: {
    type: 'ntlm',
    options: {
      domain: '',
      userName: '',  // để trống ⇒ dùng tài khoản hiện hành
      password: ''
    }
  }
};

module.exports = { sql, config };
```
> *Nếu muốn dùng SQL login, thay `authentication` bằng `user`/`password`.

### 4.3 Tạo Service Giao Tiếp DB
**Tạo mới** `desktop-app/src/database/dbService.js`:
```js
// dbService.js – các hàm CRUD dùng trong Electron main process
const { sql, config } = require('./dbConfig');

// Mở một pool kết nối (được tái sử dụng)
let pool;
async function getPool() {
  if (!pool) {
    pool = await sql.connect(config);
  }
  return pool;
}

// ---------- Đọc toàn bộ dữ liệu (các sheet) ----------
async function readAll() {
  const p = await getPool();
  const result = {};
  // 1. Máy tính & Laptop
  const r1 = await p.request().query('SELECT * FROM dbo.vw_ThietBi_MayTinh');
  result.ThietBi = r1.recordset;
  // 2. Thiết bị mạng
  const r2 = await p.request().query('SELECT * FROM dbo.vw_ThietBi_Mang');
  result.Network = r2.recordset;
  // 3. Máy in & Photocopy
  const r3 = await p.request().query('SELECT * FROM dbo.vw_ThietBi_MayIn');
  result.Printer = r3.recordset;
  // 4. License
  const r4 = await p.request().query('SELECT * FROM dbo.License');
  result.License = r4.recordset;
  // 5. Lịch sử (bàn giao, lưu kho, ...)
  const r5 = await p.request().query('SELECT * FROM dbo.LichSuDieuChuyen');
  result.LichSu = r5.recordset;
  // 6. Ứng dụng phần mềm
  const r6 = await p.request().query('SELECT * FROM dbo.ApplicationSoftware');
  result.Application = r6.recordset;
  return result;
}

// ---------- Ghi dữ liệu (cập nhật) ----------
async function saveUpdates(tableName, rows) {
  // rows: mảng object được chuẩn hoá từ UI (cùng cấu trúc cột trong DB)
  const p = await getPool();
  const transaction = new sql.Transaction(p);
  await transaction.begin();
  try {
    const request = new sql.Request(transaction);
    // Xóa toàn bộ dữ liệu hiện tại trong bảng (đơn giản cho demo)
    await request.query(`DELETE FROM dbo.${tableName}`);
    // Chèn lại
    for (const row of rows) {
      const columns = Object.keys(row).map(col => `[${col}]`).join(', ');
      const values = Object.values(row).map(v => {
        if (v === null || v === undefined) return 'NULL';
        if (typeof v === 'number') return v;
        // Escape single quote
        const s = String(v).replace(/'/g, "''");
        return `N'${s}'`;
      }).join(', ');
      await request.query(`INSERT INTO dbo.${tableName} (${columns}) VALUES (${values});`);
    }
    await transaction.commit();
    return { success: true };
  } catch (err) {
    await transaction.rollback();
    return { error: err.message };
  }
}

module.exports = { readAll, saveUpdates };
```
> **Lưu ý:** Đối với ứng dụng thực tế, nên dùng `MERGE`/UPSERT thay vì xóa‑chèn toàn bộ. Code trên chỉ để minh hoạ nhanh.

### 4.4 Expose API tới Renderer (preload)
Mở `desktop-app/electron/preload.cjs` và **thêm** các hàm mới:
```js
const { contextBridge, ipcRenderer } = require('electron');
const { readAll, saveUpdates } = require('../src/database/dbService');

contextBridge.exposeInMainWorld('electronAPI', {
  // Các API hiện có (readDb, writeDb, getConfig, setConfig) vẫn giữ nguyên nếu bạn muốn
  readDb: async () => {
    // Thay thế đọc Excel bằng query DB
    return await readAll();
  },
  writeDb: async (data) => {
    // data là object { ThietBi: [], Network: [], Printer: [], License: [], LichSu: [], Application: [] }
    const tables = {
      ThietBi: 'ThietBi',
      Network: 'ThietBi_Mang', // view name -> thực tế bảng ThietBi dùng NhomThietBi, nhưng để nhập nhanh dùng view tạm
      Printer: 'ThietBi_MayIn',
      License: 'License',
      Application: 'ApplicationSoftware',
      // LichSu và NhatKyBaoTri cần logic đặc thù, bỏ qua trong demo
    };
    for (const [key, rows] of Object.entries(data)) {
      if (tables[key]) {
        const res = await saveUpdates(tables[key], rows);
        if (res.error) return { error: res.error };
      }
    }
    return { success: true };
  },
  getConfig: async () => ipcRenderer.invoke('get-config'),
  setConfig: async (newConfig) => ipcRenderer.invoke('set-config', newConfig),
  // ... các hàm cũ khác nếu cần
});
```
> **Đảm bảo** đường dẫn `../src/database/dbService` đúng với vị trí file `preload.cjs`.

### 4.5 Cập Nhật UI nếu Cần (không bắt buộc)
Trong `src/App.tsx` và các component hiện tại, việc gọi `window.electronAPI.readDb()` và `writeDb()` vẫn hoạt động – chúng bây giờ sẽ tương tác với SQL Server thay vì file Excel.

Nếu muốn hiển thị nhóm thiết bị riêng, bạn có thể thêm **tab** mới và gọi các view riêng (`vw_ThietBi_MayIn`, `vw_ThietBi_Mang`, …) bằng cách truyền thêm tham số `type` vào `readDb()` hoặc tạo endpoint riêng trong `preload`.

## 5️⃣ Kiểm Tra Kết Nối Từ Ứng Dụng
1. **Khởi động lại Electron** (đảm bảo `npm run dev` hoặc `npm start`).
2. Mở console devtools (F12) và gõ:
```js
window.electronAPI.readDb().then(r => console.log('DB data:', r));
```
Bạn sẽ thấy object chứa 6 mảng dữ liệu, tương tự như khi đọc Excel.
3. Thực hiện một thay đổi trên UI (ví dụ thêm thiết bị), sau đó nhấn Save và kiểm tra DB:
```powershell
sqlcmd -S ".\SQLEXPRESS" -E -Q "SELECT TOP 5 * FROM dbo.ThietBi;"
```
Dòng mới vừa thêm sẽ xuất hiện.

## 6️⃣ Các Cài Đặt Bổ Sung (tùy chọn)
- **Bật TCP/IP** trong *SQL Server Configuration Manager* → `SQL Server Network Configuration → Protocols for SQLEXPRESS → TCP/IP` → `Enabled`. Khởi động lại service.
- **Mở Port 1433** trên Windows Firewall nếu muốn truy cập từ máy khác.
- **Tạo User SQL** nếu không muốn dùng Windows Authentication.

---

### 📎 Tài Nguyên Đính Kèm
- **Ảnh kiểm tra** (có thể xem trong dự án) – screenshot cấu hình `SQL Server Configuration Manager`.
- **File `setup_database.sql`** (đã cập nhật) – tạo bảng `ThietBi` toàn diện.
- **File `README.md`** (đã cập nhật) – mô tả cấu trúc DB và các view.

---

## 🚀 Tổng Kết Các Bước Nhanh
1️⃣ `DROP DATABASE ITAssetDB` (nếu muốn xóa).
2️⃣ `sqlcmd -i setup_database.sql` → tạo DB + các view.
3️⃣ `sqlcmd -i import_data.sql` → nhập 257 thiết bị.
4️⃣ `npm install mssql` → cài driver.
5️⃣ Thêm `dbConfig.js`, `dbService.js`, cập nhật `preload.cjs`.
6️⃣ Khởi động lại ứng dụng, kiểm tra bằng console.

Nếu gặp bất kỳ lỗi nào (kết nối, quyền), mở **SQL Server Management Studio** và kiểm tra log, hoặc chạy lại `sqlcmd -S .\SQLEXPRESS -E -Q "SELECT @@VERSION"` để chắc máy đang chạy.

---

**Bạn có muốn mình tạo tự động các file `dbConfig.js` và `dbService.js` trong dự án không?** Hoặc cần hỗ trợ chỉnh sửa `preload.cjs` cụ thể hơn? Hãy cho mình biết để tôi thực hiện các bước tiếp theo.

