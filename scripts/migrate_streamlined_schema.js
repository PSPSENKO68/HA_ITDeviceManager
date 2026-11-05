const xlsx = require('xlsx');
const fs = require('fs');
const path = require('path');

function formatToMMDDYYYY(val) {
  if (val === null || val === undefined || val === '') return null;
  if (typeof val === 'number') {
    if (val < 1000) return null;
    const date = new Date(Math.round((val - 25569) * 86400 * 1000));
    const mm = String(date.getUTCMonth() + 1).padStart(2, '0');
    const dd = String(date.getUTCDate()).padStart(2, '0');
    const yyyy = date.getUTCFullYear();
    return `${mm}/${dd}/${yyyy}`;
  }
  let str = String(val).trim();
  if (!str) return null;
  const dmyMatch = str.match(/^(\d{1,2})[\/\-](\d{1,2})[\/\-](\d{4})$/);
  if (dmyMatch) {
    const d = parseInt(dmyMatch[1], 10);
    const m = parseInt(dmyMatch[2], 10);
    const y = parseInt(dmyMatch[3], 10);
    return `${String(m).padStart(2, '0')}/${String(d).padStart(2, '0')}/${y}`;
  }
  const myMatch = str.match(/^([A-Za-z]{3})[\-\/](\d{2,4})$/);
  if (myMatch) {
    const monthNames = { jan:1, feb:2, mar:3, apr:4, may:5, jun:6, jul:7, aug:8, sep:9, oct:10, nov:11, dec:12 };
    const m = monthNames[myMatch[1].toLowerCase()];
    if (m) {
      let y = parseInt(myMatch[2], 10);
      if (y < 100) y += 2000;
      return `${String(m).padStart(2, '0')}/01/${y}`;
    }
  }
  const parsed = new Date(str);
  if (!isNaN(parsed.getTime()) && parsed.getFullYear() > 1990 && parsed.getFullYear() < 2100) {
    const mm = String(parsed.getMonth() + 1).padStart(2, '0');
    const dd = String(parsed.getDate()).padStart(2, '0');
    const yyyy = parsed.getFullYear();
    return `${mm}/${dd}/${yyyy}`;
  }
  return str;
}

function cleanStr(val) {
  if (val === null || val === undefined) return null;
  const s = String(val).trim();
  return s.length > 0 ? s : null;
}

function toSqlVal(val) {
  if (val === null || val === undefined) return 'NULL';
  if (typeof val === 'number') return isNaN(val) ? 'NULL' : val.toString();
  const escaped = String(val).replace(/'/g, "''");
  return `N'${escaped}'`;
}

const excelNew = 'excel/Equipment Tracking HoangAnh_021126.xlsx';
const wbNew = xlsx.readFile(excelNew);
const excelOld = 'data/database.xlsx';
const wbOld = xlsx.readFile(excelOld);

console.log("=== BẮT ĐẦU CHUẨN HÓA CSDL TINH GỌN (5 BẢNG CỐT LÕI) ===");

// 1. BẢNG USERS (Hồ sơ nhân sự & tài khoản quản trị)
const rawNhanVien = xlsx.utils.sheet_to_json(wbNew.Sheets['DanhSachNhanVien']);
const rawLicense = xlsx.utils.sheet_to_json(wbNew.Sheets['License']);

// Map email/local domain từ License
const licenseDomainMap = new Map();
rawLicense.forEach(r => {
  const o = cleanStr(r['Owner']);
  if (o) {
    licenseDomainMap.set(o.toLowerCase(), {
      email: cleanStr(r['Global Domain']),
      username: cleanStr(r['Local Domain'])
    });
  }
});

// Thêm các tài khoản IT Admin nòng cốt trước
const users = [];
const userMapByName = new Map();
let userIdCounter = 1;

function addUser(username, fullName, email, role, dept, pos, block) {
  const u = {
    Id: userIdCounter++,
    Username: username,
    FullName: fullName,
    Email: email,
    Role: role || 'User',
    Department: dept,
    Position: pos,
    Block: block,
    IsActive: 1
  };
  users.push(u);
  userMapByName.set(fullName.toLowerCase(), u.Id);
  return u;
}

// Khởi tạo các tài khoản IT chính
addUser('admin', 'System Administrator', 'it-admin@hoanganh.com.vn', 'Admin', 'HR&IT', 'Quản trị hệ thống', 'Văn phòng');
addUser('duy.nguyenhk', 'Nguyễn Hoàng Khánh Duy', 'duy.nguyenhk@hoanganh.com.vn', 'Admin', 'HR&IT', 'IT Lead', 'Văn phòng');
addUser('nhan.tran', 'Trần Hải Nhân', 'nhan.tranh@hoanganh.com.vn', 'Admin', 'HR&IT', 'Network Specialist', 'Văn phòng');
addUser('dat.nguyent', 'Nguyễn Thành Đạt', 'dat.nguyent@hoanganh.com.vn', 'IT Support', 'HR&IT', 'IT Helpdesk', 'Văn phòng');
addUser('hao.lamg', 'Lâm Gia Hào', 'hao.lamg@hoanganh.com.vn', 'IT Support', 'HR&IT', 'IT Support', 'Văn phòng');
addUser('son.nguyenx', 'Nguyễn Xuân Sơn', 'son.nguyenx@hoanganh.com.vn', 'IT Support', 'HR&IT', 'IT Support', 'Văn phòng');

// Đọc toàn bộ danh sách nhân viên công ty
rawNhanVien.forEach(r => {
  const hoTen = cleanStr(r['Họ và tên nhân viên']);
  if (!hoTen) return;
  if (userMapByName.has(hoTen.toLowerCase())) return; // Đã thêm ở trên

  const domainInfo = licenseDomainMap.get(hoTen.toLowerCase());
  let uname = domainInfo?.username;
  if (!uname) {
    // Tự sinh username không dấu từ họ tên (VD: tran.phuong)
    const parts = hoTen.normalize("NFD").replace(/[\u0300-\u036f]/g, "").toLowerCase().split(' ');
    uname = parts.length > 1 ? `${parts[parts.length - 1]}.${parts[0]}` : parts[0];
  }

  addUser(
    uname,
    hoTen,
    domainInfo?.email || null,
    'User',
    cleanStr(r['Phòng ban']),
    cleanStr(r['Hiện tại']),
    cleanStr(r['Khối văn phòng/ Nhà máy'])
  );
});

console.log(`- Users: ${users.length} tài khoản nhân sự & quản trị`);

// 2. BẢNG THIETBI (Tài sản trung tâm, liên kết UserId)
const hwRows = xlsx.utils.sheet_to_json(wbNew.Sheets['Hardware']);
const w10Rows = xlsx.utils.sheet_to_json(wbNew.Sheets['Windows 10']);
const printerRows = xlsx.utils.sheet_to_json(wbNew.Sheets['Printer or Photocopy']);
const networkRows = xlsx.utils.sheet_to_json(wbNew.Sheets['Network']);

const computerMap = new Map();
function getDeviceKey(row) {
  const sn = cleanStr(row['Serialnumber'] || row['SerialNumber']);
  if (sn && sn !== 'N/A' && sn !== 'SAMA' && sn.length > 3) return 'SN:' + sn.toUpperCase();
  const owner = cleanStr(row['Owner']) || '';
  const model = cleanStr(row['Model']) || '';
  return `OM:${owner}|${model}`;
}

w10Rows.forEach(r => computerMap.set(getDeviceKey(r), { raw: r }));
hwRows.forEach(r => computerMap.set(getDeviceKey(r), { raw: r }));

const devices = [];
let devStt = 1;

for (const [key, item] of computerMap.entries()) {
  const r = item.raw;
  const ownerName = cleanStr(r['Owner']);
  const linkedUserId = ownerName ? userMapByName.get(ownerName.toLowerCase()) || null : null;

  devices.push({
    STT: devStt++,
    UserId: linkedUserId,
    NhomThietBi: 'Máy tính',
    PhanLoai: cleanStr(r['Phân loại'] || r['Loại '] || 'Laptop'),
    Model: cleanStr(r['Model']),
    Alias: cleanStr(r['Computer Name']),
    SerialNumber: cleanStr(r['Serialnumber'] || r['SerialNumber']),
    IPAddress: cleanStr(r['IP'] || r['Địa chỉ IP']),
    Firmware: null,
    PhongBan: cleanStr(r['Bộ phận'] || r['Phòng ban']),
    Owner: ownerName,
    OS: cleanStr(r['OS']),
    CPU: cleanStr(r['CPU']),
    RAM: cleanStr(r['RAM']),
    HardDisk: cleanStr(r['Hard disk ']),
    RansomwareProtection: cleanStr(r['Ransomeware Protection '] || r['RansomwareProtection']),
    OutlookStorage: cleanStr(r['Outlook Storage']),
    ThoiGianDauTu: formatToMMDDYYYY(r['Thời gian đầu tư']),
    HSDBanDau: formatToMMDDYYYY(r['HSD ban đầu']),
    ThoiGianBaoTri: formatToMMDDYYYY(r['Thời gian bảo trì']),
    HSDGiaHan: formatToMMDDYYYY(r['HSD gia hạn']),
    NienHanBanDau: cleanStr(r['Niên hạn ban đầu ']),
    NienHanGiaHan: cleanStr(r['Niên hạn gia hạn']),
    PhanHoiNguoiDung: cleanStr(r['Phản hồi thực tế của người dùng ']),
    DanhGiaKhiBaoTri: cleanStr(r['Đánh giá khi bảo trì']),
    KhuyenNghiIT: cleanStr(r['Khuyến nghị IT']),
    ChiPhiDuKien: typeof r['Chi phí dự kiến(nếu có)'] === 'number' ? r['Chi phí dự kiến(nếu có)'] : null,
    HienTrang: cleanStr(r['Hiện trạng']),
    CapNhatMay: cleanStr(r['Cập nhật máy ']),
    KichHoat: cleanStr(r['Kích hoạt']) || 'Enabled'
  });
}

printerRows.forEach(r => {
  devices.push({
    STT: devStt++,
    UserId: null, // Thiết bị chung phòng ban
    NhomThietBi: 'Máy in',
    PhanLoai: cleanStr(r['Loại']) || 'Máy in',
    Model: cleanStr(r['Tên máy']),
    Alias: null,
    SerialNumber: cleanStr(r['Serialnumber']),
    IPAddress: cleanStr(r['Địa chỉ IP']),
    Firmware: null,
    PhongBan: cleanStr(r['Phòng ban/Bộ phận']),
    Owner: null,
    OS: null,
    CPU: null,
    RAM: null,
    HardDisk: null,
    RansomwareProtection: null,
    OutlookStorage: null,
    ThoiGianDauTu: null,
    HSDBanDau: null,
    ThoiGianBaoTri: null,
    HSDGiaHan: null,
    NienHanBanDau: null,
    NienHanGiaHan: null,
    PhanHoiNguoiDung: null,
    DanhGiaKhiBaoTri: null,
    KhuyenNghiIT: cleanStr(r['Note']),
    ChiPhiDuKien: null,
    HienTrang: cleanStr(r['Tình trạng ']) || 'In Use',
    CapNhatMay: null,
    KichHoat: 'Enabled'
  });
});

networkRows.forEach(r => {
  const loaiRaw = cleanStr(r['Loại ']) || '';
  let nhom = 'Thiết bị mạng';
  if (loaiRaw.toLowerCase().includes('server')) nhom = 'Máy chủ';
  else if (loaiRaw.toLowerCase().includes('camera') || loaiRaw.toLowerCase().includes('nvr')) nhom = 'Camera & Hạ tầng';

  const ownerName = cleanStr(r['Owner']);
  const linkedUserId = ownerName ? userMapByName.get(ownerName.toLowerCase()) || null : null;

  devices.push({
    STT: devStt++,
    UserId: linkedUserId,
    NhomThietBi: nhom,
    PhanLoai: loaiRaw || 'Thiết bị mạng',
    Model: cleanStr(r['Model']),
    Alias: cleanStr(r['Computer Name']),
    SerialNumber: cleanStr(r['Serialnumber']),
    IPAddress: cleanStr(r['IP']),
    Firmware: null,
    PhongBan: cleanStr(r['Bộ phận']),
    Owner: ownerName,
    OS: null,
    CPU: cleanStr(r['CPU']),
    RAM: cleanStr(r['RAM']),
    HardDisk: cleanStr(r['Hard disk ']),
    RansomwareProtection: null,
    OutlookStorage: null,
    ThoiGianDauTu: formatToMMDDYYYY(r['Thời gian đầu tư']),
    HSDBanDau: formatToMMDDYYYY(r['Thời gian hết niên hạn']),
    ThoiGianBaoTri: null,
    HSDGiaHan: null,
    NienHanBanDau: cleanStr(r['Tình trạng máy']),
    NienHanGiaHan: null,
    PhanHoiNguoiDung: null,
    DanhGiaKhiBaoTri: cleanStr(r['Đánh giá khi bảo trì']),
    KhuyenNghiIT: cleanStr(r['Khuyến nghị IT']),
    ChiPhiDuKien: null,
    HienTrang: cleanStr(r['Tình trạng máy']),
    CapNhatMay: null,
    KichHoat: cleanStr(r['Kích hoạt']) || 'Enabled'
  });
});

console.log(`- ThietBi: ${devices.length} thiết bị (đã liên kết UserId khi có Owner)`);

// 3. BẢNG LICENSE (Liên kết UserId)
const licenses = [];
let licStt = 1;
rawLicense.forEach(r => {
  const ownerName = cleanStr(r['Owner']);
  const linkedUserId = ownerName ? userMapByName.get(ownerName.toLowerCase()) || null : null;
  licenses.push({
    STT: licStt++,
    UserId: linkedUserId,
    ComputerName: cleanStr(r['Computer Name']),
    GlobalDomain: cleanStr(r['Global Domain']),
    LocalDomain: cleanStr(r['Local Domain']),
    ActiveAccount: cleanStr(r['Active office']),
    Owner: ownerName,
    PhongBan: cleanStr(r['Bộ phận']),
    KichHoat: cleanStr(r['Kích hoạt ']) || 'Enabled'
  });
});
console.log(`- License: ${licenses.length} bản quyền (đã liên kết UserId)`);

// 4. BẢNG APPLICATIONSOFTWARE (Liên kết UserId)
const rawApp = xlsx.utils.sheet_to_json(wbOld.Sheets['Application']);
const applications = [];
let appStt = 1;
rawApp.forEach(r => {
  const ownerName = cleanStr(r['Owner']);
  const linkedUserId = ownerName ? userMapByName.get(ownerName.toLowerCase()) || null : null;
  applications.push({
    STT: appStt++,
    UserId: linkedUserId,
    Owner: ownerName,
    PhongBan: cleanStr(r['PhongBan']),
    May: cleanStr(r['May']),
    UngDung: cleanStr(r['UngDung']),
    LyDo: cleanStr(r['LyDo']),
    LoaiPhanMem: cleanStr(r['LoaiPhanMem']),
    TrangThai: cleanStr(r['TrangThai']) || 'Đang sử dụng',
    NgayCaiDat: formatToMMDDYYYY(r['NgayCaiDat']),
    GhiChu: cleanStr(r['GhiChu'])
  });
});
console.log(`- ApplicationSoftware: ${applications.length} ứng dụng (đã liên kết UserId)`);

// 5. BẢNG TINH GỌN: LICHSUBAOTRI (Gộp KeHoachBaoTri + NhatKyBaoTri)
const lichSuBaoTriList = [
  {
    SerialNumber: '5CD1131WHJ',
    Model: 'HP 340S G7 Notebook PC',
    TieuDe: 'Kiểm tra bảo trì định kỳ',
    LoaiHanhDong: 'Bảo trì định kỳ',
    ChiTiet: 'Đang sử dụng song song 2 máy Window và MacOS',
    ChiPhi: 0,
    NguoiThucHien: 'IT Helpdesk',
    NgayThucHien: '10/01/2023',
    TrangThai: 'Hoàn thành'
  },
  {
    SerialNumber: '5CD24314RP',
    Model: 'HP 14 Laptop PC 14-d5000',
    TieuDe: 'Bảo trì định kỳ và gia hạn',
    LoaiHanhDong: 'Bảo trì định kỳ',
    ChiTiet: 'Sử dụng bình thường, gia hạn sử dụng thêm 1 năm',
    ChiPhi: 0,
    NguoiThucHien: 'IT Helpdesk',
    NgayThucHien: '10/22/2026',
    TrangThai: 'Hoàn thành'
  },
  {
    SerialNumber: '5CD151GWK8',
    Model: 'HP 340S G7 Notebook',
    TieuDe: 'Nâng cấp SSD & bảo trì',
    LoaiHanhDong: 'Nâng cấp phần cứng',
    ChiTiet: 'Đề xuất nâng cấp ổ cứng SSD để tăng tốc độ',
    ChiPhi: 850000,
    NguoiThucHien: 'IT Helpdesk',
    NgayThucHien: '10/22/2026',
    TrangThai: 'Hoàn thành'
  },
  {
    SerialNumber: '5CD9312KQ9',
    Model: 'HP ProBook 440 G6 Notebook PC',
    TieuDe: 'Thay thế bàn phím bị liệt nút Ctrl',
    LoaiHanhDong: 'Sửa chữa phần cứng',
    ChiTiet: 'Đã thay thế bàn phím mới hoạt động tốt',
    ChiPhi: 450000,
    NguoiThucHien: 'IT Helpdesk',
    NgayThucHien: '10/14/2026',
    TrangThai: 'Hoàn thành'
  },
  {
    SerialNumber: 'SAMA',
    Model: 'DESKTOP-OA2I6Q1',
    TieuDe: 'Kế hoạch nâng cấp SSD cho phòng QM',
    LoaiHanhDong: 'Nâng cấp phần cứng',
    ChiTiet: 'Máy tính còn dùng HDD thường xuyên bị chậm máy khi mở file chung',
    ChiPhi: 900000,
    NguoiThucHien: 'IT Support',
    NgayDuKien: '12/15/2026',
    TrangThai: 'Kế hoạch'
  }
];
console.log(`- LichSuBaoTri (Gộp): ${lichSuBaoTriList.length} bản ghi (Kế hoạch + Lịch sử)`);

// 6. BẢNG LICHSUDIEUCHUYEN
const rawLichSu = xlsx.utils.sheet_to_json(wbOld.Sheets['LichSu']);
const lichSuDieuChuyenList = [];
let lsStt = 1;
rawLichSu.forEach(r => {
  lichSuDieuChuyenList.push({
    STT: lsStt++,
    Ngay: formatToMMDDYYYY(r['Ngay']),
    LoaiHanhDong: cleanStr(r['LoaiHanhDong']) || 'Bàn giao',
    Model: cleanStr(r['ThietBi_Model']),
    SerialNumber: cleanStr(r['ThietBi_Serial']),
    ChiTiet: cleanStr(r['ChiTiet']),
    PhongBanCu: cleanStr(r['PhongBan_Cu']),
    PhongBanMoi: cleanStr(r['PhongBan_Moi']),
    OwnerCu: cleanStr(r['Owner_Cu']),
    OwnerMoi: cleanStr(r['Owner_Moi']),
    ChiPhi: cleanStr(r['ChiPhi']),
    NguoiThucHien: cleanStr(r['NguoiThucHien'])
  });
});
console.log(`- LichSuDieuChuyen: ${lichSuDieuChuyenList.length} lịch sử điều chuyển`);

// SOẠN THẢO FILE SQL TOÀN DIỆN KHÔNG KHÓA NGOẠI
let sql = `-- ==========================================================================================\n`;
sql += `-- CSDL IT ASSET MANAGEMENT - KIẾN TRÚC TINH GỌN (5 BẢNG NGHIỆP VỤ + 1 LỊCH SỬ ĐIỀU CHUYỂN)\n`;
sql += `-- HOÀN TOÀN KHÔNG KHÓA NGOẠI (DECOUPLED) - CHUẨN UNICODE & FORMAT MM/DD/YYYY\n`;
sql += `-- ==========================================================================================\n\n`;
sql += `USE ITAssetDB;\n`;
sql += `SET NOCOUNT ON;\n\n`;

// Gỡ bỏ bất kỳ khóa ngoại cũ
sql += `DECLARE @dropFkSql NVARCHAR(MAX) = N'';\n`;
sql += `SELECT @dropFkSql += N'ALTER TABLE ' + QUOTENAME(OBJECT_SCHEMA_NAME(parent_object_id)) + '.' + QUOTENAME(OBJECT_NAME(parent_object_id)) + \n`;
sql += `                      N' DROP CONSTRAINT ' + QUOTENAME(name) + ';' + CHAR(13)\n`;
sql += `FROM sys.foreign_keys;\n`;
sql += `EXEC sp_executesql @dropFkSql;\n`;
sql += `GO\n\n`;

// 1. TẠO BẢNG USERS
sql += `IF OBJECT_ID('dbo.Users', 'U') IS NOT NULL DROP TABLE dbo.Users;\n`;
sql += `IF OBJECT_ID('dbo.NguoiDung', 'U') IS NOT NULL DROP TABLE dbo.NguoiDung;\n`;
sql += `GO\n`;
sql += `CREATE TABLE dbo.Users (\n`;
sql += `    Id INT IDENTITY(1,1) PRIMARY KEY,\n`;
sql += `    Username NVARCHAR(50) NOT NULL,\n`;
sql += `    PasswordHash NVARCHAR(255) NULL,\n`;
sql += `    FullName NVARCHAR(150) NOT NULL,\n`;
sql += `    Email NVARCHAR(150) NULL,\n`;
sql += `    Role NVARCHAR(50) DEFAULT N'User',\n`;
sql += `    Department NVARCHAR(100) NULL,\n`;
sql += `    Position NVARCHAR(150) NULL,\n`;
sql += `    Block NVARCHAR(100) NULL,\n`;
sql += `    IsActive BIT DEFAULT 1,\n`;
sql += `    CreatedAt DATETIME DEFAULT GETDATE()\n`;
sql += `);\n`;
sql += `CREATE NONCLUSTERED INDEX IX_Users_FullName ON dbo.Users(FullName);\n`;
sql += `CREATE NONCLUSTERED INDEX IX_Users_Department ON dbo.Users(Department);\n`;
sql += `GO\n\n`;

// 2. TẠO BẢNG THIETBI
sql += `IF OBJECT_ID('dbo.ThietBi', 'U') IS NOT NULL DROP TABLE dbo.ThietBi;\n`;
sql += `GO\n`;
sql += `CREATE TABLE dbo.ThietBi (\n`;
sql += `    ID INT IDENTITY(1,1) PRIMARY KEY,\n`;
sql += `    STT INT NULL,\n`;
sql += `    UserId INT NULL,                      -- Liên kết tới Users.Id (không ràng buộc FK)\n`;
sql += `    NhomThietBi NVARCHAR(50) NOT NULL,\n`;
sql += `    PhanLoai NVARCHAR(100) NULL,\n`;
sql += `    Model NVARCHAR(255) NULL,\n`;
sql += `    Alias NVARCHAR(150) NULL,\n`;
sql += `    SerialNumber NVARCHAR(100) NULL,\n`;
sql += `    IPAddress NVARCHAR(50) NULL,\n`;
sql += `    Firmware NVARCHAR(100) NULL,\n`;
sql += `    PhongBan NVARCHAR(100) NULL,\n`;
sql += `    Owner NVARCHAR(150) NULL,\n`;
sql += `    OS NVARCHAR(100) NULL,\n`;
sql += `    CPU NVARCHAR(200) NULL,\n`;
sql += `    RAM NVARCHAR(100) NULL,\n`;
sql += `    HardDisk NVARCHAR(200) NULL,\n`;
sql += `    RansomwareProtection NVARCHAR(50) DEFAULT N'Yes',\n`;
sql += `    OutlookStorage NVARCHAR(100) NULL,\n`;
sql += `    ThoiGianDauTu NVARCHAR(50) NULL,\n`;
sql += `    HSDBanDau NVARCHAR(50) NULL,\n`;
sql += `    ThoiGianBaoTri NVARCHAR(50) NULL,\n`;
sql += `    HSDGiaHan NVARCHAR(50) NULL,\n`;
sql += `    NienHanBanDau NVARCHAR(100) NULL,\n`;
sql += `    NienHanGiaHan NVARCHAR(100) NULL,\n`;
sql += `    PhanHoiNguoiDung NVARCHAR(MAX) NULL,\n`;
sql += `    DanhGiaKhiBaoTri NVARCHAR(MAX) NULL,\n`;
sql += `    KhuyenNghiIT NVARCHAR(MAX) NULL,\n`;
sql += `    ChiPhiDuKien DECIMAL(18,2) NULL DEFAULT 0,\n`;
sql += `    HienTrang NVARCHAR(100) NULL DEFAULT N'Đang sử dụng',\n`;
sql += `    CapNhatMay NVARCHAR(100) NULL,\n`;
sql += `    KichHoat NVARCHAR(50) NULL DEFAULT N'Enabled',\n`;
sql += `    NgayTao DATETIME DEFAULT GETDATE(),\n`;
sql += `    NgayCapNhat DATETIME DEFAULT GETDATE()\n`;
sql += `);\n`;
sql += `CREATE NONCLUSTERED INDEX IX_ThietBi_Nhom ON dbo.ThietBi(NhomThietBi);\n`;
sql += `CREATE NONCLUSTERED INDEX IX_ThietBi_Serial ON dbo.ThietBi(SerialNumber);\n`;
sql += `CREATE NONCLUSTERED INDEX IX_ThietBi_UserId ON dbo.ThietBi(UserId);\n`;
sql += `GO\n\n`;

// 3. TẠO BẢNG LICENSE
sql += `IF OBJECT_ID('dbo.License', 'U') IS NOT NULL DROP TABLE dbo.License;\n`;
sql += `GO\n`;
sql += `CREATE TABLE dbo.License (\n`;
sql += `    ID INT IDENTITY(1,1) PRIMARY KEY,\n`;
sql += `    STT INT NULL,\n`;
sql += `    UserId INT NULL,\n`;
sql += `    ComputerName NVARCHAR(100) NULL,\n`;
sql += `    GlobalDomain NVARCHAR(200) NULL,\n`;
sql += `    LocalDomain NVARCHAR(200) NULL,\n`;
sql += `    ActiveAccount NVARCHAR(200) NULL,\n`;
sql += `    Owner NVARCHAR(150) NULL,\n`;
sql += `    PhongBan NVARCHAR(100) NULL,\n`;
sql += `    KichHoat NVARCHAR(50) DEFAULT N'Enabled',\n`;
sql += `    NgayCapNhat DATETIME DEFAULT GETDATE()\n`;
sql += `);\n`;
sql += `CREATE NONCLUSTERED INDEX IX_License_UserId ON dbo.License(UserId);\n`;
sql += `GO\n\n`;

// 4. TẠO BẢNG APPLICATIONSOFTWARE
sql += `IF OBJECT_ID('dbo.ApplicationSoftware', 'U') IS NOT NULL DROP TABLE dbo.ApplicationSoftware;\n`;
sql += `GO\n`;
sql += `CREATE TABLE dbo.ApplicationSoftware (\n`;
sql += `    ID INT IDENTITY(1,1) PRIMARY KEY,\n`;
sql += `    STT INT NULL,\n`;
sql += `    UserId INT NULL,\n`;
sql += `    Owner NVARCHAR(150) NULL,\n`;
sql += `    PhongBan NVARCHAR(100) NULL,\n`;
sql += `    May NVARCHAR(255) NULL,\n`;
sql += `    UngDung NVARCHAR(200) NULL,\n`;
sql += `    LyDo NVARCHAR(255) NULL,\n`;
sql += `    LoaiPhanMem NVARCHAR(100) NULL,\n`;
sql += `    TrangThai NVARCHAR(50) DEFAULT N'Đang sử dụng',\n`;
sql += `    NgayCaiDat NVARCHAR(50) NULL,\n`;
sql += `    GhiChu NVARCHAR(MAX) NULL\n`;
sql += `);\n`;
sql += `CREATE NONCLUSTERED INDEX IX_AppSoft_UserId ON dbo.ApplicationSoftware(UserId);\n`;
sql += `GO\n\n`;

// 5. TẠO BẢNG GỘP LICHSUBAOTRI (BẢO TRÌ & SỬA CHỮA & KẾ HOẠCH)
sql += `IF OBJECT_ID('dbo.KeHoachBaoTri', 'U') IS NOT NULL DROP TABLE dbo.KeHoachBaoTri;\n`;
sql += `IF OBJECT_ID('dbo.NhatKyBaoTri', 'U') IS NOT NULL DROP TABLE dbo.NhatKyBaoTri;\n`;
sql += `IF OBJECT_ID('dbo.LichSuBaoTri', 'U') IS NOT NULL DROP TABLE dbo.LichSuBaoTri;\n`;
sql += `GO\n`;
sql += `CREATE TABLE dbo.LichSuBaoTri (\n`;
sql += `    ID INT IDENTITY(1,1) PRIMARY KEY,\n`;
sql += `    ThietBiID INT NULL,\n`;
sql += `    SerialNumber NVARCHAR(100) NULL,\n`;
sql += `    Model NVARCHAR(255) NULL,\n`;
sql += `    TieuDe NVARCHAR(255) NULL,\n`;
sql += `    LoaiHanhDong NVARCHAR(100) NOT NULL,\n`;
sql += `    ChiTiet NVARCHAR(MAX) NULL,\n`;
sql += `    LinhKienThayThe NVARCHAR(500) NULL,\n`;
sql += `    ChiPhi DECIMAL(18,2) NULL DEFAULT 0,\n`;
sql += `    NguoiThucHien NVARCHAR(150) NULL,\n`;
sql += `    NgayThucHien NVARCHAR(50) NULL,            -- mm/dd/yyyy\n`;
sql += `    NgayDuKien NVARCHAR(50) NULL,              -- mm/dd/yyyy\n`;
sql += `    TrangThai NVARCHAR(50) DEFAULT N'Hoàn thành', -- 'Kế hoạch', 'Đang thực hiện', 'Hoàn thành'\n`;
sql += `    GhiChu NVARCHAR(MAX) NULL\n`;
sql += `);\n`;
sql += `CREATE NONCLUSTERED INDEX IX_BaoTri_Serial ON dbo.LichSuBaoTri(SerialNumber);\n`;
sql += `CREATE NONCLUSTERED INDEX IX_BaoTri_TrangThai ON dbo.LichSuBaoTri(TrangThai);\n`;
sql += `GO\n\n`;

// 6. TẠO BẢNG LICHSUDIEUCHUYEN
sql += `IF OBJECT_ID('dbo.LichSuDieuChuyen', 'U') IS NOT NULL DROP TABLE dbo.LichSuDieuChuyen;\n`;
sql += `GO\n`;
sql += `CREATE TABLE dbo.LichSuDieuChuyen (\n`;
sql += `    ID INT IDENTITY(1,1) PRIMARY KEY,\n`;
sql += `    STT INT NULL,\n`;
sql += `    ThietBiID INT NULL,\n`;
sql += `    ThietBi_Model NVARCHAR(255) NULL,\n`;
sql += `    ThietBi_Serial NVARCHAR(100) NULL,\n`;
sql += `    LoaiHanhDong NVARCHAR(100) NOT NULL,\n`;
sql += `    Ngay NVARCHAR(100) NULL,\n`;
sql += `    PhongBan_Cu NVARCHAR(100) NULL,\n`;
sql += `    PhongBan_Moi NVARCHAR(100) NULL,\n`;
sql += `    Owner_Cu NVARCHAR(150) NULL,\n`;
sql += `    Owner_Moi NVARCHAR(150) NULL,\n`;
sql += `    ChiTiet NVARCHAR(MAX) NULL,\n`;
sql += `    ChiPhi NVARCHAR(100) NULL,\n`;
sql += `    NguoiThucHien NVARCHAR(150) NULL,\n`;
sql += `    NgayTao DATETIME DEFAULT GETDATE()\n`;
sql += `);\n`;
sql += `GO\n\n`;

// INSERTS CHO USERS
users.forEach(u => {
  sql += `INSERT INTO dbo.Users (Username, FullName, Email, Role, Department, Position, Block, IsActive) VALUES (\n`;
  sql += `  ${toSqlVal(u.Username)}, ${toSqlVal(u.FullName)}, ${toSqlVal(u.Email)}, ${toSqlVal(u.Role)}, ${toSqlVal(u.Department)}, ${toSqlVal(u.Position)}, ${toSqlVal(u.Block)}, 1\n`;
  sql += `);\n`;
});
sql += `GO\n\n`;

// INSERTS CHO THIETBI
devices.forEach(d => {
  sql += `INSERT INTO dbo.ThietBi (\n`;
  sql += `  STT, UserId, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,\n`;
  sql += `  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,\n`;
  sql += `  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,\n`;
  sql += `  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat\n`;
  sql += `) VALUES (\n`;
  sql += `  ${d.STT}, ${toSqlVal(d.UserId)}, ${toSqlVal(d.NhomThietBi)}, ${toSqlVal(d.PhanLoai)}, ${toSqlVal(d.Model)}, ${toSqlVal(d.Alias)},\n`;
  sql += `  ${toSqlVal(d.SerialNumber)}, ${toSqlVal(d.IPAddress)}, ${toSqlVal(d.Firmware)}, ${toSqlVal(d.PhongBan)},\n`;
  sql += `  ${toSqlVal(d.Owner)}, ${toSqlVal(d.OS)}, ${toSqlVal(d.CPU)}, ${toSqlVal(d.RAM)}, ${toSqlVal(d.HardDisk)},\n`;
  sql += `  ${toSqlVal(d.RansomwareProtection)}, ${toSqlVal(d.OutlookStorage)},\n`;
  sql += `  ${toSqlVal(d.ThoiGianDauTu)}, ${toSqlVal(d.HSDBanDau)}, ${toSqlVal(d.ThoiGianBaoTri)}, ${toSqlVal(d.HSDGiaHan)},\n`;
  sql += `  ${toSqlVal(d.NienHanBanDau)}, ${toSqlVal(d.NienHanGiaHan)}, ${toSqlVal(d.PhanHoiNguoiDung)}, ${toSqlVal(d.DanhGiaKhiBaoTri)},\n`;
  sql += `  ${toSqlVal(d.KhuyenNghiIT)}, ${toSqlVal(d.ChiPhiDuKien)}, ${toSqlVal(d.HienTrang)}, ${toSqlVal(d.CapNhatMay)}, ${toSqlVal(d.KichHoat)}\n`;
  sql += `);\n`;
});
sql += `GO\n\n`;

// INSERTS CHO LICENSE
licenses.forEach(l => {
  sql += `INSERT INTO dbo.License (STT, UserId, ComputerName, GlobalDomain, LocalDomain, ActiveAccount, Owner, PhongBan, KichHoat) VALUES (\n`;
  sql += `  ${l.STT}, ${toSqlVal(l.UserId)}, ${toSqlVal(l.ComputerName)}, ${toSqlVal(l.GlobalDomain)}, ${toSqlVal(l.LocalDomain)},\n`;
  sql += `  ${toSqlVal(l.ActiveAccount)}, ${toSqlVal(l.Owner)}, ${toSqlVal(l.PhongBan)}, ${toSqlVal(l.KichHoat)}\n`;
  sql += `);\n`;
});
sql += `GO\n\n`;

// INSERTS CHO APPLICATIONSOFTWARE
applications.forEach(a => {
  sql += `INSERT INTO dbo.ApplicationSoftware (STT, UserId, Owner, PhongBan, May, UngDung, LyDo, LoaiPhanMem, TrangThai, NgayCaiDat, GhiChu) VALUES (\n`;
  sql += `  ${a.STT}, ${toSqlVal(a.UserId)}, ${toSqlVal(a.Owner)}, ${toSqlVal(a.PhongBan)}, ${toSqlVal(a.May)}, ${toSqlVal(a.UngDung)},\n`;
  sql += `  ${toSqlVal(a.LyDo)}, ${toSqlVal(a.LoaiPhanMem)}, ${toSqlVal(a.TrangThai)}, ${toSqlVal(a.NgayCaiDat)}, ${toSqlVal(a.GhiChu)}\n`;
  sql += `);\n`;
});
sql += `GO\n\n`;

// INSERTS CHO LICHSUBAOTRI
lichSuBaoTriList.forEach(b => {
  sql += `INSERT INTO dbo.LichSuBaoTri (SerialNumber, Model, TieuDe, LoaiHanhDong, ChiTiet, ChiPhi, NguoiThucHien, NgayThucHien, NgayDuKien, TrangThai) VALUES (\n`;
  sql += `  ${toSqlVal(b.SerialNumber)}, ${toSqlVal(b.Model)}, ${toSqlVal(b.TieuDe)}, ${toSqlVal(b.LoaiHanhDong)}, ${toSqlVal(b.ChiTiet)},\n`;
  sql += `  ${b.ChiPhi}, ${toSqlVal(b.NguoiThucHien)}, ${toSqlVal(b.NgayThucHien)}, ${toSqlVal(b.NgayDuKien)}, ${toSqlVal(b.TrangThai)}\n`;
  sql += `);\n`;
});
sql += `GO\n\n`;

// INSERTS CHO LICHSUDIEUCHUYEN
lichSuDieuChuyenList.forEach(ls => {
  sql += `INSERT INTO dbo.LichSuDieuChuyen (STT, Ngay, LoaiHanhDong, ThietBi_Model, ThietBi_Serial, ChiTiet, PhongBan_Cu, PhongBan_Moi, Owner_Cu, Owner_Moi, ChiPhi, NguoiThucHien) VALUES (\n`;
  sql += `  ${ls.STT}, ${toSqlVal(ls.Ngay)}, ${toSqlVal(ls.LoaiHanhDong)}, ${toSqlVal(ls.Model)}, ${toSqlVal(ls.SerialNumber)},\n`;
  sql += `  ${toSqlVal(ls.ChiTiet)}, ${toSqlVal(ls.PhongBanCu)}, ${toSqlVal(ls.PhongBanMoi)}, ${toSqlVal(ls.OwnerCu)}, ${toSqlVal(ls.OwnerMoi)},\n`;
  sql += `  ${toSqlVal(ls.ChiPhi)}, ${toSqlVal(ls.NguoiThucHien)}\n`;
  sql += `);\n`;
});
sql += `GO\n\n`;

const outSql = path.join(__dirname, '../database/streamlined_database.sql');
fs.writeFileSync(outSql, '\uFEFF' + sql, { encoding: 'utf8' });
console.log(`\n=> Đã tạo file SQL CSDL tinh gọn chuẩn xác tại: ${outSql}`);

