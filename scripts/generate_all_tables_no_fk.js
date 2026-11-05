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

console.log("=== BẮT ĐẦU CHUẨN HÓA DỮ LIỆU ĐA BẢNG ===");

// 1. CHUẨN BỊ DỮ LIỆU LICENSE
const rawLicense = xlsx.utils.sheet_to_json(wbNew.Sheets['License']);
const licenseMapByOwner = new Map();
const licenses = [];
let licStt = 1;
rawLicense.forEach(r => {
  const owner = cleanStr(r['Owner']);
  const globalDomain = cleanStr(r['Global Domain']);
  const localDomain = cleanStr(r['Local Domain']);
  if (owner) {
    licenseMapByOwner.set(owner.toLowerCase(), { globalDomain, localDomain });
  }
  licenses.push({
    STT: licStt++,
    ComputerName: cleanStr(r['Computer Name']),
    GlobalDomain: globalDomain,
    LocalDomain: localDomain,
    ActiveAccount: cleanStr(r['Active office']),
    Owner: owner,
    PhongBan: cleanStr(r['Bộ phận']),
    KichHoat: cleanStr(r['Kích hoạt ']) || 'Enabled'
  });
});
console.log(`- License: ${licenses.length} bản ghi`);

// 2. CHUẨN BỊ DỮ LIỆU NGƯỜI DÙNG (USER / NHÂN VIÊN)
const rawNhanVien = xlsx.utils.sheet_to_json(wbNew.Sheets['DanhSachNhanVien']);
const users = [];
let userStt = 1;
rawNhanVien.forEach(r => {
  const hoTen = cleanStr(r['Họ và tên nhân viên']);
  if (!hoTen) return;
  
  // Enrich from License if available
  const matchLic = licenseMapByOwner.get(hoTen.toLowerCase());
  const email = matchLic ? matchLic.globalDomain : null;
  const username = matchLic ? matchLic.localDomain : null;

  users.push({
    STT: userStt++,
    HoTen: hoTen,
    Email: email,
    Username: username,
    ChucDanh: cleanStr(r['Hiện tại']),
    PhongBan: cleanStr(r['Phòng ban']),
    BoPhan: cleanStr(r['Bộ phận']),
    Khoi: cleanStr(r['Khối văn phòng/ Nhà máy']),
    TrangThai: 'Đang làm việc'
  });
});
console.log(`- NguoiDung (User): ${users.length} nhân sự`);

// 3. CHUẨN BỊ DỮ LIỆU APPLICATION SOFTWARE
const rawApp = xlsx.utils.sheet_to_json(wbOld.Sheets['Application']);
const applications = [];
let appStt = 1;
rawApp.forEach(r => {
  applications.push({
    STT: appStt++,
    Owner: cleanStr(r['Owner']),
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
console.log(`- ApplicationSoftware: ${applications.length} ứng dụng`);

// 4. CHUẨN BỊ DỮ LIỆU LỊCH SỬ ĐIỀU CHUYỂN
const rawLichSu = xlsx.utils.sheet_to_json(wbOld.Sheets['LichSu']);
const lichSuList = [];
let lsStt = 1;
rawLichSu.forEach(r => {
  lichSuList.push({
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
console.log(`- LichSuDieuChuyen: ${lichSuList.length} lịch sử`);

// 5. CHUẨN BỊ DỮ LIỆU THIẾT BỊ (MERGED 304 DEVICES)
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
  devices.push({
    STT: devStt++,
    NhomThietBi: 'Máy tính',
    PhanLoai: cleanStr(r['Phân loại'] || r['Loại '] || 'Laptop'),
    Model: cleanStr(r['Model']),
    Alias: cleanStr(r['Computer Name']),
    SerialNumber: cleanStr(r['Serialnumber'] || r['SerialNumber']),
    IPAddress: cleanStr(r['IP'] || r['Địa chỉ IP']),
    Firmware: null,
    PhongBan: cleanStr(r['Bộ phận'] || r['Phòng ban']),
    Owner: cleanStr(r['Owner']),
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

  devices.push({
    STT: devStt++,
    NhomThietBi: nhom,
    PhanLoai: loaiRaw || 'Thiết bị mạng',
    Model: cleanStr(r['Model']),
    Alias: cleanStr(r['Computer Name']),
    SerialNumber: cleanStr(r['Serialnumber']),
    IPAddress: cleanStr(r['IP']),
    Firmware: null,
    PhongBan: cleanStr(r['Bộ phận']),
    Owner: cleanStr(r['Owner']),
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
console.log(`- ThietBi: ${devices.length} thiết bị`);

// VIẾT SCRIPT SQL TÁI TẠO BẢNG (KHÔNG CÓ KHÓA NGOẠI) VÀ INSERT DATA
let sql = `-- ==========================================================================================\n`;
sql += `-- RESTRUCTURE DATABASE KHÔNG KHÓA NGOẠI (DECOUPLED ARCHITECTURE)\n`;
sql += `-- BỔ SUNG BẢNG NGUOIDUNG (USER), LICENSE, APPLICATIONSOFTWARE, THIETBI\n`;
sql += `-- ==========================================================================================\n\n`;
sql += `USE ITAssetDB;\n`;
sql += `SET NOCOUNT ON;\n\n`;

// 1. DROP TẤT CẢ KHÓA NGOẠI NẾU CÓ
sql += `DECLARE @dropFkSql NVARCHAR(MAX) = N'';\n`;
sql += `SELECT @dropFkSql += N'ALTER TABLE ' + QUOTENAME(OBJECT_SCHEMA_NAME(parent_object_id)) + '.' + QUOTENAME(OBJECT_NAME(parent_object_id)) + \n`;
sql += `                      N' DROP CONSTRAINT ' + QUOTENAME(name) + ';' + CHAR(13)\n`;
sql += `FROM sys.foreign_keys;\n`;
sql += `EXEC sp_executesql @dropFkSql;\n`;
sql += `GO\n\n`;

// 2. TẠO HOẶC XÓA TẠO LẠI BẢNG NGUOIDUNG
sql += `IF OBJECT_ID('dbo.NguoiDung', 'U') IS NOT NULL DROP TABLE dbo.NguoiDung;\n`;
sql += `GO\n`;
sql += `CREATE TABLE dbo.NguoiDung (\n`;
sql += `    ID INT IDENTITY(1,1) PRIMARY KEY,\n`;
sql += `    STT INT NULL,\n`;
sql += `    HoTen NVARCHAR(150) NOT NULL,\n`;
sql += `    Email NVARCHAR(150) NULL,\n`;
sql += `    Username NVARCHAR(100) NULL,\n`;
sql += `    ChucDanh NVARCHAR(150) NULL,\n`;
sql += `    PhongBan NVARCHAR(100) NULL,\n`;
sql += `    BoPhan NVARCHAR(100) NULL,\n`;
sql += `    Khoi NVARCHAR(100) NULL,\n`;
sql += `    TrangThai NVARCHAR(50) DEFAULT N'Đang làm việc',\n`;
sql += `    NgayTao DATETIME DEFAULT GETDATE()\n`;
sql += `);\n`;
sql += `CREATE NONCLUSTERED INDEX IX_NguoiDung_HoTen ON dbo.NguoiDung(HoTen);\n`;
sql += `CREATE NONCLUSTERED INDEX IX_NguoiDung_PhongBan ON dbo.NguoiDung(PhongBan);\n`;
sql += `GO\n\n`;

// 3. TẠO LẠI BẢNG LICENSE (KHÔNG KHÓA NGOẠI)
sql += `IF OBJECT_ID('dbo.License', 'U') IS NOT NULL DROP TABLE dbo.License;\n`;
sql += `GO\n`;
sql += `CREATE TABLE dbo.License (\n`;
sql += `    ID INT IDENTITY(1,1) PRIMARY KEY,\n`;
sql += `    STT INT NULL,\n`;
sql += `    ComputerName NVARCHAR(100) NULL,\n`;
sql += `    GlobalDomain NVARCHAR(200) NULL,\n`;
sql += `    LocalDomain NVARCHAR(200) NULL,\n`;
sql += `    ActiveAccount NVARCHAR(200) NULL,\n`;
sql += `    Owner NVARCHAR(150) NULL,\n`;
sql += `    PhongBan NVARCHAR(100) NULL,\n`;
sql += `    KichHoat NVARCHAR(50) DEFAULT N'Enabled',\n`;
sql += `    NgayCapNhat DATETIME DEFAULT GETDATE()\n`;
sql += `);\n`;
sql += `CREATE NONCLUSTERED INDEX IX_License_Owner ON dbo.License(Owner);\n`;
sql += `CREATE NONCLUSTERED INDEX IX_License_Computer ON dbo.License(ComputerName);\n`;
sql += `GO\n\n`;

// 4. TẠO LẠI BẢNG APPLICATIONSOFTWARE (KHÔNG KHÓA NGOẠI)
sql += `IF OBJECT_ID('dbo.ApplicationSoftware', 'U') IS NOT NULL DROP TABLE dbo.ApplicationSoftware;\n`;
sql += `GO\n`;
sql += `CREATE TABLE dbo.ApplicationSoftware (\n`;
sql += `    ID INT IDENTITY(1,1) PRIMARY KEY,\n`;
sql += `    STT INT NULL,\n`;
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
sql += `CREATE NONCLUSTERED INDEX IX_AppSoft_Owner ON dbo.ApplicationSoftware(Owner);\n`;
sql += `GO\n\n`;

// 5. TẠO LẠI BẢNG NHATKYBAOTRI (KHÔNG KHÓA NGOẠI)
sql += `IF OBJECT_ID('dbo.NhatKyBaoTri', 'U') IS NOT NULL DROP TABLE dbo.NhatKyBaoTri;\n`;
sql += `GO\n`;
sql += `CREATE TABLE dbo.NhatKyBaoTri (\n`;
sql += `    ID INT IDENTITY(1,1) PRIMARY KEY,\n`;
sql += `    ThietBiID INT NULL,\n`;
sql += `    SerialNumber NVARCHAR(100) NULL,\n`;
sql += `    Model NVARCHAR(255) NULL,\n`;
sql += `    NgayThucHien DATETIME DEFAULT GETDATE(),\n`;
sql += `    LoaiHanhDong NVARCHAR(100) NOT NULL,\n`;
sql += `    ChiTiet NVARCHAR(MAX) NULL,\n`;
sql += `    LinhKienThayThe NVARCHAR(500) NULL,\n`;
sql += `    PhongBan NVARCHAR(100) NULL,\n`;
sql += `    Owner NVARCHAR(150) NULL,\n`;
sql += `    ChiPhi DECIMAL(18,2) NULL DEFAULT 0,\n`;
sql += `    NguoiThucHien NVARCHAR(150) NULL,\n`;
sql += `    DanhGiaSauBaoTri NVARCHAR(MAX) NULL,\n`;
sql += `    KhuyenNghiIT NVARCHAR(MAX) NULL,\n`;
sql += `    NgayBaoTriTiepTheo NVARCHAR(50) NULL,\n`;
sql += `    TrangThai NVARCHAR(50) DEFAULT N'Hoàn thành',\n`;
sql += `    GhiChu NVARCHAR(MAX) NULL\n`;
sql += `);\n`;
sql += `GO\n\n`;

// 6. TẠO LẠI BẢNG KEHOACHBAOTRI (KHÔNG KHÓA NGOẠI)
sql += `IF OBJECT_ID('dbo.KeHoachBaoTri', 'U') IS NOT NULL DROP TABLE dbo.KeHoachBaoTri;\n`;
sql += `GO\n`;
sql += `CREATE TABLE dbo.KeHoachBaoTri (\n`;
sql += `    ID INT IDENTITY(1,1) PRIMARY KEY,\n`;
sql += `    ThietBiID INT NULL,\n`;
sql += `    TieuDe NVARCHAR(255) NOT NULL,\n`;
sql += `    NgayDuKien NVARCHAR(50) NULL,\n`;
sql += `    ChuKyThang INT DEFAULT 6,\n`;
sql += `    HangMucBaoTri NVARCHAR(MAX) NULL,\n`;
sql += `    NguoiPhuTrach NVARCHAR(150) NULL,\n`;
sql += `    TrangThai NVARCHAR(50) DEFAULT N'Chưa thực hiện',\n`;
sql += `    NgayHoanThanh NVARCHAR(50) NULL,\n`;
sql += `    GhiChu NVARCHAR(500) NULL\n`;
sql += `);\n`;
sql += `GO\n\n`;

// 7. TẠO LẠI BẢNG LICHSUDIEUCHUYEN (KHÔNG KHÓA NGOẠI)
sql += `IF OBJECT_ID('dbo.LichSuDieuChuyen', 'U') IS NOT NULL DROP TABLE dbo.LichSuDieuChuyen;\n`;
sql += `GO\n`;
sql += `CREATE TABLE dbo.LichSuDieuChuyen (\n`;
sql += `    ID INT IDENTITY(1,1) PRIMARY KEY,\n`;
sql += `    STT INT NULL,\n`;
sql += `    Ngay NVARCHAR(100) NULL,\n`;
sql += `    LoaiHanhDong NVARCHAR(100) NOT NULL,\n`;
sql += `    ThietBi_STT INT NULL,\n`;
sql += `    ThietBi_Model NVARCHAR(255) NULL,\n`;
sql += `    ThietBi_Serial NVARCHAR(100) NULL,\n`;
sql += `    ChiTiet NVARCHAR(MAX) NULL,\n`;
sql += `    PhongBan_Cu NVARCHAR(100) NULL,\n`;
sql += `    PhongBan_Moi NVARCHAR(100) NULL,\n`;
sql += `    Owner_Cu NVARCHAR(150) NULL,\n`;
sql += `    Owner_Moi NVARCHAR(150) NULL,\n`;
sql += `    ChiPhi NVARCHAR(100) NULL,\n`;
sql += `    NguoiThucHien NVARCHAR(150) NULL,\n`;
sql += `    Nguon NVARCHAR(50) DEFAULT N'ThietBi',\n`;
sql += `    NgayTao DATETIME DEFAULT GETDATE()\n`;
sql += `);\n`;
sql += `GO\n\n`;

// 8. TÁI TẠO BẢNG THIETBI
sql += `DELETE FROM dbo.ThietBi;\n`;
sql += `DBCC CHECKIDENT ('dbo.ThietBi', RESEED, 0);\n`;
sql += `GO\n\n`;

// INSERTS CHO NGUOIDUNG
users.forEach(u => {
  sql += `INSERT INTO dbo.NguoiDung (STT, HoTen, Email, Username, ChucDanh, PhongBan, BoPhan, Khoi, TrangThai) VALUES (\n`;
  sql += `  ${u.STT}, ${toSqlVal(u.HoTen)}, ${toSqlVal(u.Email)}, ${toSqlVal(u.Username)}, ${toSqlVal(u.ChucDanh)},\n`;
  sql += `  ${toSqlVal(u.PhongBan)}, ${toSqlVal(u.BoPhan)}, ${toSqlVal(u.Khoi)}, ${toSqlVal(u.TrangThai)}\n`;
  sql += `);\n`;
});

// INSERTS CHO LICENSE
licenses.forEach(l => {
  sql += `INSERT INTO dbo.License (STT, ComputerName, GlobalDomain, LocalDomain, ActiveAccount, Owner, PhongBan, KichHoat) VALUES (\n`;
  sql += `  ${l.STT}, ${toSqlVal(l.ComputerName)}, ${toSqlVal(l.GlobalDomain)}, ${toSqlVal(l.LocalDomain)},\n`;
  sql += `  ${toSqlVal(l.ActiveAccount)}, ${toSqlVal(l.Owner)}, ${toSqlVal(l.PhongBan)}, ${toSqlVal(l.KichHoat)}\n`;
  sql += `);\n`;
});

// INSERTS CHO APPLICATIONSOFTWARE
applications.forEach(a => {
  sql += `INSERT INTO dbo.ApplicationSoftware (STT, Owner, PhongBan, May, UngDung, LyDo, LoaiPhanMem, TrangThai, NgayCaiDat, GhiChu) VALUES (\n`;
  sql += `  ${a.STT}, ${toSqlVal(a.Owner)}, ${toSqlVal(a.PhongBan)}, ${toSqlVal(a.May)}, ${toSqlVal(a.UngDung)},\n`;
  sql += `  ${toSqlVal(a.LyDo)}, ${toSqlVal(a.LoaiPhanMem)}, ${toSqlVal(a.TrangThai)}, ${toSqlVal(a.NgayCaiDat)}, ${toSqlVal(a.GhiChu)}\n`;
  sql += `);\n`;
});

// INSERTS CHO LICHSUDIEUCHUYEN
lichSuList.forEach(ls => {
  sql += `INSERT INTO dbo.LichSuDieuChuyen (STT, Ngay, LoaiHanhDong, ThietBi_Model, ThietBi_Serial, ChiTiet, PhongBan_Cu, PhongBan_Moi, Owner_Cu, Owner_Moi, ChiPhi, NguoiThucHien) VALUES (\n`;
  sql += `  ${ls.STT}, ${toSqlVal(ls.Ngay)}, ${toSqlVal(ls.LoaiHanhDong)}, ${toSqlVal(ls.Model)}, ${toSqlVal(ls.SerialNumber)},\n`;
  sql += `  ${toSqlVal(ls.ChiTiet)}, ${toSqlVal(ls.PhongBanCu)}, ${toSqlVal(ls.PhongBanMoi)}, ${toSqlVal(ls.OwnerCu)}, ${toSqlVal(ls.OwnerMoi)},\n`;
  sql += `  ${toSqlVal(ls.ChiPhi)}, ${toSqlVal(ls.NguoiThucHien)}\n`;
  sql += `);\n`;
});

// INSERTS CHO THIETBI
devices.forEach(d => {
  sql += `INSERT INTO dbo.ThietBi (\n`;
  sql += `  STT, NhomThietBi, PhanLoai, Model, Alias, SerialNumber, IPAddress, Firmware,\n`;
  sql += `  PhongBan, Owner, OS, CPU, RAM, HardDisk, RansomwareProtection, OutlookStorage,\n`;
  sql += `  ThoiGianDauTu, HSDBanDau, ThoiGianBaoTri, HSDGiaHan, NienHanBanDau, NienHanGiaHan,\n`;
  sql += `  PhanHoiNguoiDung, DanhGiaKhiBaoTri, KhuyenNghiIT, ChiPhiDuKien, HienTrang, CapNhatMay, KichHoat\n`;
  sql += `) VALUES (\n`;
  sql += `  ${d.STT}, ${toSqlVal(d.NhomThietBi)}, ${toSqlVal(d.PhanLoai)}, ${toSqlVal(d.Model)}, ${toSqlVal(d.Alias)},\n`;
  sql += `  ${toSqlVal(d.SerialNumber)}, ${toSqlVal(d.IPAddress)}, ${toSqlVal(d.Firmware)}, ${toSqlVal(d.PhongBan)},\n`;
  sql += `  ${toSqlVal(d.Owner)}, ${toSqlVal(d.OS)}, ${toSqlVal(d.CPU)}, ${toSqlVal(d.RAM)}, ${toSqlVal(d.HardDisk)},\n`;
  sql += `  ${toSqlVal(d.RansomwareProtection)}, ${toSqlVal(d.OutlookStorage)},\n`;
  sql += `  ${toSqlVal(d.ThoiGianDauTu)}, ${toSqlVal(d.HSDBanDau)}, ${toSqlVal(d.ThoiGianBaoTri)}, ${toSqlVal(d.HSDGiaHan)},\n`;
  sql += `  ${toSqlVal(d.NienHanBanDau)}, ${toSqlVal(d.NienHanGiaHan)}, ${toSqlVal(d.PhanHoiNguoiDung)}, ${toSqlVal(d.DanhGiaKhiBaoTri)},\n`;
  sql += `  ${toSqlVal(d.KhuyenNghiIT)}, ${toSqlVal(d.ChiPhiDuKien)}, ${toSqlVal(d.HienTrang)}, ${toSqlVal(d.CapNhatMay)}, ${toSqlVal(d.KichHoat)}\n`;
  sql += `);\n`;
});

const outSql = path.join(__dirname, '../database/rebuild_all_tables_no_fk.sql');
fs.writeFileSync(outSql, '\uFEFF' + sql, { encoding: 'utf8' });
console.log(`\n=> Đã tạo file SQL chuẩn hóa toàn bộ hệ thống không khóa ngoại tại: ${outSql}`);
