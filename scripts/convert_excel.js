const xlsx = require('xlsx');
const fs = require('fs');

const inputFile = 'excel/Equipment Tracking HoangAnh.xlsx';
const outputFile = 'excel/Master_Equipment_List.xlsx';

const workbook = xlsx.readFile(inputFile);

// Clean up and mapping logic
const masterList = [];
const seenSerials = new Set();
const seenNames = new Set();

let assetCounter = 1;
const generateAssetTag = (prefix) => {
  const tag = `${prefix}-${assetCounter.toString().padStart(4, '0')}`;
  assetCounter++;
  return tag;
}

const addAsset = (asset) => {
  // Deduplication rules
  if (asset['Serial Number'] && asset['Serial Number'] !== 'N/A' && asset['Serial Number'] !== '') {
    if (seenSerials.has(asset['Serial Number'].toLowerCase())) return;
    seenSerials.add(asset['Serial Number'].toLowerCase());
  } else if (asset['Tên máy tính'] && asset['Tên máy tính'] !== 'N/A' && asset['Tên máy tính'] !== '') {
    if (seenNames.has(asset['Tên máy tính'].toLowerCase())) return;
    seenNames.add(asset['Tên máy tính'].toLowerCase());
  }

  // Generate Asset Tag
  if (!asset['Mã thiết bị']) {
    let prefix = 'IT';
    const type = (asset['Loại thiết bị'] || '').toLowerCase();
    if (type.includes('laptop')) prefix = 'LT';
    else if (type.includes('desktop') || type.includes('máy tính bàn')) prefix = 'PC';
    else if (type.includes('printer') || type.includes('máy in')) prefix = 'PR';
    else if (type.includes('switch') || type.includes('router') || type.includes('network')) prefix = 'NW';
    
    asset['Mã thiết bị'] = generateAssetTag(prefix);
  }

  masterList.push(asset);
}

// Map each sheet
// 1. Hardware ver1 / Hardware / Windows 10
['Hardware ver1', 'Windows 10', 'Hardware'].forEach(sheetName => {
  const sheet = workbook.Sheets[sheetName];
  if (!sheet) return;
  const data = xlsx.utils.sheet_to_json(sheet);
  
  data.forEach(row => {
    const asset = {
      'Mã thiết bị': '',
      'Loại thiết bị': row['Loại '] || row['Phân loại'] || 'PC/Laptop',
      'Phòng ban': row['Bộ phận'] || '',
      'Vị trí': row['Khu vực'] || '',
      'Tên máy tính': row['Computer Name'] || '',
      'Model': row['Model'] || '',
      'Serial Number': row['Serialnumber'] || '',
      'CPU': row['CPU'] || '',
      'RAM': row['RAM'] || '',
      'Ổ cứng': row['Hard disk '] || row['Hard disk'] || '',
      'Ghi chú': row['Owner'] ? `Owner: ${row['Owner']}` : ''
    };
    addAsset(asset);
  });
});

// 2. Printer or Photocopy
const printerSheet = workbook.Sheets['Printer or Photocopy'];
if (printerSheet) {
  const data = xlsx.utils.sheet_to_json(printerSheet);
  data.forEach(row => {
    const asset = {
      'Mã thiết bị': '',
      'Loại thiết bị': row['Loại'] || 'Printer',
      'Phòng ban': row['Phòng ban/Bộ phận'] || '',
      'Vị trí': '',
      'Tên máy tính': row['Tên máy'] || '',
      'Model': row['Tên máy'] || '',
      'Serial Number': '',
      'CPU': '',
      'RAM': '',
      'Ổ cứng': '',
      'Ghi chú': row['Địa chỉ IP'] ? `IP: ${row['Địa chỉ IP']}` : ''
    };
    addAsset(asset);
  });
}

// 3. Network
const networkSheet = workbook.Sheets['Network'];
if (networkSheet) {
  const data = xlsx.utils.sheet_to_json(networkSheet);
  data.forEach(row => {
    const asset = {
      'Mã thiết bị': '',
      'Loại thiết bị': row['Loại '] || 'Network',
      'Phòng ban': row['Bộ phận'] || '',
      'Vị trí': row['Khu vực'] || '',
      'Tên máy tính': row['Computer Name'] || '',
      'Model': row['Model'] || '',
      'Serial Number': row['Serialnumber'] || '',
      'CPU': row['CPU'] || '',
      'RAM': row['RAM'] || '',
      'Ổ cứng': row['Hard disk '] || '',
      'Ghi chú': row['IP'] ? `IP: ${row['IP']}` : ''
    };
    addAsset(asset);
  });
}

// Write to new workbook
const newWb = xlsx.utils.book_new();
const newWs = xlsx.utils.json_to_sheet(masterList);
xlsx.utils.book_append_sheet(newWb, newWs, "Master List");
xlsx.writeFile(newWb, outputFile);

console.log(`Successfully generated master list with ${masterList.length} assets at ${outputFile}`);
