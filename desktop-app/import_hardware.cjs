const xlsx = require('xlsx');
const fs = require('fs');

const sourceFile = 'C:/Users/duy.nguyenhk/OneDrive - HA Group/Desktop/it_asset/excel/Equipment Tracking HoangAnh.xlsx';
const targetFile = 'C:/Users/duy.nguyenhk/OneDrive - HA Group/Desktop/it_asset/data/database.xlsx';

console.log('Loading source file:', sourceFile);
const sourceWb = xlsx.readFile(sourceFile, { cellDates: true });
const hardwareSheetName = sourceWb.SheetNames.find(s => s.toLowerCase().includes('hardware'));
if (!hardwareSheetName) {
  console.error('Could not find a Hardware sheet in the source file.');
  process.exit(1);
}

console.log(`Extracting data from sheet: ${hardwareSheetName}`);
const sourceSheet = sourceWb.Sheets[hardwareSheetName];
const rawData = xlsx.utils.sheet_to_json(sourceSheet); // Removed { range: 1 } because headers are on the first row

// Map raw data to database.xlsx format
const mappedData = rawData.map((row, index) => {
  return {
    'STT': index + 1,
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

console.log(`Extracted ${mappedData.length} records.`);
console.log('Sample of first row:', mappedData[0]);

console.log('Loading target database:', targetFile);
const targetWb = xlsx.readFile(targetFile, { cellDates: true });

// Create new sheet and replace the old one
const newWs = xlsx.utils.json_to_sheet(mappedData);

// Set column widths based on headers
const colWidths = Object.keys(mappedData[0] || {}).map(() => ({ wch: 20 }));
colWidths[0] = { wch: 5 }; // STT
newWs['!cols'] = colWidths;

targetWb.Sheets['ThietBi'] = newWs;

console.log('Saving target database...');
xlsx.writeFile(targetWb, targetFile);

console.log('Done! Database ThietBi sheet has been updated.');
