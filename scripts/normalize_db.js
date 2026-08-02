const xlsx = require('xlsx');
const fs = require('fs');
const path = require('path');

const inputFile = path.join(__dirname, '../excel/Equipment Tracking HoangAnh.xlsx');
const outputFile = path.join(__dirname, '../data/database.xlsx');

const workbook = xlsx.readFile(inputFile);

// The requested schemas
const thietBiHeaders = ["STT", "PhongBan", "Owner", "PhanLoai", "Model", "SerialNumber", "OS", "CPU", "RAM", "HardDisk", "Ransomeware Protection", "Outlook Storage", "Thoi gian dau tu", "HSD ban dau", "Thoi gian bao tri", "HSD gia han", "Nien han ban dau", "Nien han gia han", "Phan hoi thuc te cua nguoi dung", "Danh gia khi bao tri", "Khuyen nghi IT", "Chi phi du kien", "Hien trang", "Cap nhat may", "KichHoat"];

const printerHeaders = ["STT", "PhanLoai", "TenMay", "IP Address", "PhongBan", "TinhTrang"];

const licenseHeaders = ["STT", "DeviceID", "Owner", "PhongBan", "ActiveAccount", "DomainMail", "LocalDomain", "KichHoat"];

const thietBiData = [];
const printerData = [];
const licenseData = [];

// Helper to fill empty fields based on headers
const buildRow = (headers, dataObj) => {
  const row = {};
  headers.forEach(h => {
    row[h] = dataObj[h] || '';
  });
  return row;
};

// 1. Parse Hardware sheets (Hardware ver1, Windows 10, Hardware, Network) -> ThietBi
['Hardware ver1', 'Windows 10', 'Hardware', 'Network'].forEach(sheetName => {
  const sheet = workbook.Sheets[sheetName];
  if (!sheet) return;
  const data = xlsx.utils.sheet_to_json(sheet, { defval: '' });
  
  data.forEach((r, idx) => {
    // Determine PhanLoai and PhongBan
    const phanLoai = r['Loại '] || r['Phân loại'] || r['Loại'] || 'Thiết bị';
    const phongBan = r['Bộ phận'] || r['Phòng ban/Bộ phận'] || r['Khu vực'] || '';

    const asset = buildRow(thietBiHeaders, {
      "PhongBan": phongBan,
      "Owner": r['Owner'] || '',
      "PhanLoai": phanLoai,
      "Model": r['Model'] || '',
      "SerialNumber": r['Serialnumber'] || r['Serial Number'] || '',
      "OS": r['OS'] || '',
      "CPU": r['CPU'] || '',
      "RAM": r['RAM'] || '',
      "HardDisk": r['Hard disk '] || r['Hard disk'] || '',
      "Ransomeware Protection": r['Ransomeware Protection '] || '',
      "Outlook Storage": r['Outlook Storage'] || '',
      "Thoi gian dau tu": r['Thời gian đầu tư'] || '',
      "HSD ban dau": r['HSD ban đầu'] || '',
      "Thoi gian bao tri": r['Thời gian bảo trì'] || '',
      "HSD gia han": r['HSD gia hạn'] || '',
      "Nien han ban dau": r['Niên hạn ban đầu '] || '',
      "Nien han gia han": r['Niên hạn gia hạn'] || '',
      "Phan hoi thuc te cua nguoi dung": r['Phản hồi thực tế của người dùng '] || '',
      "Danh gia khi bao tri": r['Đánh giá khi bảo trì'] || '',
      "Khuyen nghi IT": r['Khuyến nghị IT'] || '',
      "Chi phi du kien": r['Chi phí dự kiến(nếu có)'] || '',
      "Hien trang": r['Hiện trạng'] || r['Tình trạng máy'] || '',
      "Cap nhat may": r['Cập nhật máy '] || '',
      "KichHoat": r['Kích hoạt'] || r['Kích hoạt '] || ''
    });
    thietBiData.push(asset);
  });
});

// Deduplicate ThietBi based on SerialNumber (if present)
const uniqueThietBi = [];
const seenSerials = new Set();
thietBiData.forEach(item => {
  let sn = String(item.SerialNumber).trim().toLowerCase();
  if (sn && sn !== 'n/a') {
    if (seenSerials.has(sn)) return;
    seenSerials.add(sn);
  }
  uniqueThietBi.push(item);
});
uniqueThietBi.forEach((item, idx) => item.STT = idx + 1);

// 2. Parse Printer or Photocopy -> Printer
const printerSheet = workbook.Sheets['Printer or Photocopy'];
if (printerSheet) {
  const data = xlsx.utils.sheet_to_json(printerSheet, { defval: '' });
  data.forEach((r, idx) => {
    const asset = buildRow(printerHeaders, {
      "STT": idx + 1,
      "PhanLoai": r['Loại'] || 'Máy in',
      "TenMay": r['Tên máy'] || '',
      "IP Address": r['Địa chỉ IP'] || '',
      "PhongBan": r['Phòng ban/Bộ phận'] || '',
      "TinhTrang": r['Tình trạng '] || ''
    });
    printerData.push(asset);
  });
}

// 3. Parse License -> License
const licenseSheet = workbook.Sheets['License'];
if (licenseSheet) {
  const data = xlsx.utils.sheet_to_json(licenseSheet, { defval: '' });
  data.forEach((r, idx) => {
    const asset = buildRow(licenseHeaders, {
      "STT": idx + 1,
      "DeviceID": r['Computer Name'] || '',
      "Owner": r['Owner'] || '',
      "PhongBan": r['Bộ phận'] || '',
      "ActiveAccount": r['Active office'] || '',
      "DomainMail": r['Global Domain'] || '',
      "LocalDomain": r['Local Domain'] || '',
      "KichHoat": r['Kích hoạt '] || ''
    });
    licenseData.push(asset);
  });
}

// Write to database.xlsx
const newWb = xlsx.utils.book_new();
const wsThietBi = xlsx.utils.json_to_sheet(uniqueThietBi, { header: thietBiHeaders });
const wsPrinter = xlsx.utils.json_to_sheet(printerData, { header: printerHeaders });
const wsLicense = xlsx.utils.json_to_sheet(licenseData, { header: licenseHeaders });

xlsx.utils.book_append_sheet(newWb, wsThietBi, "ThietBi");
xlsx.utils.book_append_sheet(newWb, wsPrinter, "Printer");
xlsx.utils.book_append_sheet(newWb, wsLicense, "License");

xlsx.writeFile(newWb, outputFile);
console.log(`Database generated successfully at: ${outputFile}`);
console.log(`- ThietBi: ${uniqueThietBi.length} rows`);
console.log(`- Printer: ${printerData.length} rows`);
console.log(`- License: ${licenseData.length} rows`);
