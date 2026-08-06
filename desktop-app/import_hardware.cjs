const xlsx = require('xlsx');
const fs = require('fs');

const sourceFile = 'C:/Users/duy.nguyenhk/OneDrive - HA Group/Desktop/it_asset/excel/Equipment Tracking HoangAnh.xlsx';
const targetFile = 'C:/Users/duy.nguyenhk/OneDrive - HA Group/Desktop/it_asset/data/database.xlsx';

console.log('Loading source file:', sourceFile);
// We use { cellDates: false } because we will use raw: false in sheet_to_json to get the formatted strings from Excel directly
const sourceWb = xlsx.readFile(sourceFile, { cellDates: false });

const hardwareSheetName = sourceWb.SheetNames.find(s => s.toLowerCase().includes('hardware'));
const networkSheetName = sourceWb.SheetNames.find(s => s.toLowerCase().includes('network'));

let allMappedData = [];
let sttIndex = 1;

if (hardwareSheetName) {
  console.log(`Extracting data from sheet: ${hardwareSheetName}`);
  const sourceSheet = sourceWb.Sheets[hardwareSheetName];
  // raw: false will get the formatted dates as strings, e.g., 'Aug-22'
  const rawData = xlsx.utils.sheet_to_json(sourceSheet, { raw: false, dateNF: 'mm/dd/yyyy' });

  const mappedHardware = rawData.map((row) => {
    return {
      'STT': sttIndex++,
      'PhongBan': row['Bộ phận'] || '',
      'Owner': row['Owner'] || '',
      'PhanLoai': row['Phân loại'] || row['Loại '] || row['Loại'] || '',
      'Model': row['Model'] || '',
      'SerialNumber': row['Serialnumber'] || row['Serial number'] || row['Serial'] || '',
      'OS': row['OS'] || row['OS '] || '',
      'CPU': row['CPU'] || '',
      'RAM': row['RAM'] || '',
      'HardDisk': row['Hard disk '] || row['Hard disk'] || '',
      'Ransomeware Protection': row['Ransomeware Protection '] || row['Ransomeware Protection'] || row['Ransomware'] || '',
      'Outlook Storage': row['Outlook Storage'] || row['Outlook Storage '] || '',
      'Thoi gian dau tu': row['Thời gian đầu tư'] || '',
      'HSD ban dau': row['HSD ban đầu'] || '',
      'Thoi gian bao tri': row['Thời gian bảo trì'] || '',
      'HSD gia han': row['HSD gia hạn'] || '',
      'Nien han ban dau': row['Niên hạn ban đầu '] || row['Niên hạn BĐ'] || '',
      'Nien han gia han': row['Niên hạn gia hạn'] || row['Niên hạn GH'] || '',
      'Phan hoi thuc te cua nguoi dung': row['Phản hồi thực tế của người dùng'] || '',
      'Danh gia khi bao tri': row['Đánh giá khi bảo trì'] || '',
      'Khuyen nghi IT': row['Khuyến nghị IT'] || '',
      'Chi phi du kien': row['Chi phí dự kiến '] || row['Chi phí dự kiến'] || '',
      'Hien trang': row['Hiện trạng'] || '',
      'Cap nhat may': row['Cập nhật máy '] || row['Cập nhật máy'] || '',
      'KichHoat': row['Kích hoạt'] || ''
    };
  });
  
  allMappedData = allMappedData.concat(mappedHardware);
  console.log(`Extracted ${mappedHardware.length} records from Hardware.`);
} else {
  console.error('Could not find a Hardware sheet in the source file.');
}

if (networkSheetName) {
  console.log(`Extracting data from sheet: ${networkSheetName}`);
  const sourceSheet = sourceWb.Sheets[networkSheetName];
  // raw: false will get the formatted dates as strings, e.g., 'Aug-22'
  const rawData = xlsx.utils.sheet_to_json(sourceSheet, { raw: false, dateNF: 'mm/dd/yyyy' });

  const mappedNetwork = rawData.map((row) => {
    return {
      'STT': sttIndex++,
      'PhongBan': row['Bộ phận'] || '',
      'Owner': row['Owner'] || '',
      'PhanLoai': row['Loại '] || row['Loại'] || 'Network',
      'Model': row['Model'] || '',
      'SerialNumber': row['Serialnumber'] || row['Serial number'] || row['Serial'] || '',
      'OS': '',
      'CPU': row['CPU'] || '',
      'RAM': row['RAM'] || '',
      'HardDisk': row['Hard disk '] || row['Hard disk'] || '',
      'Ransomeware Protection': '',
      'Outlook Storage': '',
      'Thoi gian dau tu': row['Thời gian đầu tư'] || '',
      'HSD ban dau': '',
      'Thoi gian bao tri': '',
      'HSD gia han': '',
      'Nien han ban dau': row['Thời gian hết niên hạn'] || '',
      'Nien han gia han': '',
      'Phan hoi thuc te cua nguoi dung': '',
      'Danh gia khi bao tri': row['Đánh giá khi bảo trì'] || '',
      'Khuyen nghi IT': '',
      'Chi phi du kien': '',
      'Hien trang': row['Tình trạng máy'] || '',
      'Cap nhat may': '',
      'KichHoat': row['Kích hoạt'] || ''
    };
  });

  allMappedData = allMappedData.concat(mappedNetwork);
  console.log(`Extracted ${mappedNetwork.length} records from Network.`);
} else {
  console.warn('Could not find a Network sheet in the source file.');
}

console.log(`Total extracted ${allMappedData.length} records.`);
if (allMappedData.length > 0) {
  console.log('Sample of first record date:', allMappedData[0]['Thoi gian dau tu']);
}

console.log('Loading target database:', targetFile);
const targetWb = xlsx.readFile(targetFile, { cellDates: false });

// Create new sheet and replace the old one
const newWs = xlsx.utils.json_to_sheet(allMappedData);

// Set column widths based on headers
const colWidths = Object.keys(allMappedData[0] || {}).map(() => ({ wch: 20 }));
if (colWidths.length > 0) colWidths[0] = { wch: 5 }; // STT
newWs['!cols'] = colWidths;

targetWb.Sheets['ThietBi'] = newWs;

console.log('Saving target database...');
xlsx.writeFile(targetWb, targetFile);

console.log('Done! Database ThietBi sheet has been updated.');
