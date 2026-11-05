const xlsx = require('xlsx');
const fs = require('fs');
const path = require('path');

function formatToMMDDYYYY(val) {
  if (val === null || val === undefined || val === '') return null;
  
  // 1. If Excel serial number (e.g. 44774)
  if (typeof val === 'number') {
    if (val < 1000) return null; // not a date serial
    const date = new Date(Math.round((val - 25569) * 86400 * 1000));
    const mm = String(date.getUTCMonth() + 1).padStart(2, '0');
    const dd = String(date.getUTCDate()).padStart(2, '0');
    const yyyy = date.getUTCFullYear();
    return `${mm}/${dd}/${yyyy}`;
  }
  
  let str = String(val).trim();
  if (!str) return null;

  // 2. Format DD/MM/YYYY or D/M/YYYY
  const dmyMatch = str.match(/^(\d{1,2})[\/\-](\d{1,2})[\/\-](\d{4})$/);
  if (dmyMatch) {
    const d = parseInt(dmyMatch[1], 10);
    const m = parseInt(dmyMatch[2], 10);
    const y = parseInt(dmyMatch[3], 10);
    return `${String(m).padStart(2, '0')}/${String(d).padStart(2, '0')}/${y}`;
  }

  // 3. Format "Mon-YY" e.g. "Aug-22"
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

  // 4. Try JS Date parse
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

const excelPath = 'excel/Equipment Tracking HoangAnh_021126.xlsx';
const wb = xlsx.readFile(excelPath);

console.log("Reading Excel file:", excelPath);

// Step 1: Read Hardware sheet (100 rows - updated laptops/desktops)
const hwRows = xlsx.utils.sheet_to_json(wb.Sheets['Hardware']);
// Step 2: Read Windows 10 sheet (146 rows - base computers)
const w10Rows = xlsx.utils.sheet_to_json(wb.Sheets['Windows 10']);
// Step 3: Read Printer sheet (34 rows)
const printerRows = xlsx.utils.sheet_to_json(wb.Sheets['Printer or Photocopy']);
// Step 4: Read Network sheet (125 rows)
const networkRows = xlsx.utils.sheet_to_json(wb.Sheets['Network']);

// Merge computers: Base is Windows 10, Hardware updates / overrides it!
const computerMap = new Map();

// Helper to make unique key
function getDeviceKey(row) {
  const sn = cleanStr(row['Serialnumber'] || row['SerialNumber']);
  if (sn && sn !== 'N/A' && sn !== 'SAMA' && sn.length > 3) {
    return 'SN:' + sn.toUpperCase();
  }
  const owner = cleanStr(row['Owner']) || '';
  const model = cleanStr(row['Model']) || '';
  return `OM:${owner}|${model}`;
}

// First add all Windows 10 rows
w10Rows.forEach(r => {
  const key = getDeviceKey(r);
  computerMap.set(key, { source: 'W10', raw: r });
});

// Now overwrite / supplement with Hardware rows (updated data)
let updatedCount = 0;
let newCount = 0;
hwRows.forEach(r => {
  const key = getDeviceKey(r);
  if (computerMap.has(key)) {
    // Override with new hardware info
    computerMap.set(key, { source: 'Hardware', raw: r });
    updatedCount++;
  } else {
    computerMap.set(key, { source: 'Hardware', raw: r });
    newCount++;
  }
});

console.log(`Merged Computers: ${computerMap.size} total (Updated from Hardware: ${updatedCount}, New from Hardware: ${newCount})`);

const devices = [];
let stt = 1;

// 1. Process merged computers
for (const [key, item] of computerMap.entries()) {
  const r = item.raw;
  const dev = {
    STT: stt++,
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
  };
  devices.push(dev);
}

// 2. Process Printers & Photocopiers
printerRows.forEach(r => {
  const dev = {
    STT: stt++,
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
  };
  devices.push(dev);
});

// 3. Process Network & Servers & Cameras
networkRows.forEach(r => {
  const loaiRaw = cleanStr(r['Loại ']) || '';
  let nhom = 'Thiết bị mạng';
  if (loaiRaw.toLowerCase().includes('server')) {
    nhom = 'Máy chủ';
  } else if (loaiRaw.toLowerCase().includes('camera') || loaiRaw.toLowerCase().includes('nvr')) {
    nhom = 'Camera & Hạ tầng';
  }

  const dev = {
    STT: stt++,
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
  };
  devices.push(dev);
});

console.log(`Total devices to insert: ${devices.length}`);

// Generate SQL
let sql = `-- ==========================================================================================\n`;
sql += `-- SCRIPT IMPORT CHUẨN UNICODE TIẾNG VIỆT & NGÀY THÁNG FORMAT MM/DD/YYYY\n`;
sql += `-- ==========================================================================================\n\n`;
sql += `USE ITAssetDB;\n`;
sql += `SET NOCOUNT ON;\n\n`;
sql += `DELETE FROM dbo.NhatKyBaoTri;\n`;
sql += `DELETE FROM dbo.KeHoachBaoTri;\n`;
sql += `DELETE FROM dbo.LichSuDieuChuyen;\n`;
sql += `DELETE FROM dbo.ThietBi;\n`;
sql += `DBCC CHECKIDENT ('dbo.ThietBi', RESEED, 0);\n\n`;

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

// Write with UTF-8 BOM so Windows sqlcmd, SSMS, PowerShell read 100% Vietnamese
const outFilePath = path.join(__dirname, '../database/import_data_clean.sql');
fs.writeFileSync(outFilePath, '\uFEFF' + sql, { encoding: 'utf8' });
console.log(`Generated clean SQL with UTF-8 BOM to: ${outFilePath}`);

