const xlsx = require('xlsx');
const fs = require('fs');
const path = 'C:/Users/duy.nguyenhk/OneDrive - HA Group/Desktop/it_asset/excel/Equipment Tracking HoangAnh_021126.xlsx';
const outFile = 'C:/Users/duy.nguyenhk/OneDrive - HA Group/Desktop/it_asset/database/import_updated.sql';

// Mapping from Excel column names to DB column names
const columnMap = {
  'Loại ': 'NhomThietBi',
  'Phân loại': 'PhanLoai',
  'Model': 'Model',
  'Serialnumber': 'SerialNumber',
  'OS': 'OS',
  'CPU': 'CPU',
  'RAM': 'RAM',
  'Hard disk ': 'HardDisk',
  'Owner': 'Owner',
  'Khu vực': 'KhuVuc',
  'Bộ phận': 'BoPhan',
  // add more if needed
};

function escapeSql(value) {
  if (value === null || value === undefined) return 'NULL';
  const str = String(value).replace(/'/g, "''");
  return `N'${str}'`;
}

function generateSqlRows(rows) {
  const columns = Object.values(columnMap);
  const colList = columns.join(', ');
  const statements = rows.map(row => {
    const values = columns.map(col => {
      // find original excel key that maps to this db column
      const excelKey = Object.keys(columnMap).find(k => columnMap[k] === col);
      return escapeSql(row[excelKey]);
    }).join(', ');
    return `INSERT INTO dbo.ThietBi (${colList}) VALUES (${values});`;
  });
  return statements.join('\n');
}

try {
  const wb = xlsx.readFile(path);
  const sheetName = wb.SheetNames[0]; // assume first sheet contains hardware data
  const ws = wb.Sheets[sheetName];
  const rows = xlsx.utils.sheet_to_json(ws, {defval: null});
  const sql = generateSqlRows(rows);
  fs.writeFileSync(outFile, sql, {encoding: 'utf8'});
  console.log('Generated', rows.length, 'INSERT statements to', outFile);
} catch (e) {
  console.error('Error generating SQL:', e.message);
}
