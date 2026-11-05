// Load Excel and output rows as JSON for debugging
const xlsx = require('xlsx');
const path = 'C:/Users/duy.nguyenhk/OneDrive - HA Group/Desktop/it_asset/excel/Equipment Tracking HoangAnh_021126.xlsx';
try {
  const wb = xlsx.readFile(path);
  const sheetName = wb.SheetNames[0]; // assume first sheet contains hardware data
  const ws = wb.Sheets[sheetName];
  const rows = xlsx.utils.sheet_to_json(ws, {defval: null});
  console.log('Rows count:', rows.length);
  console.log(JSON.stringify(rows.slice(0,5), null, 2)); // preview first 5 rows
} catch (e) {
  console.error('Error reading Excel:', e.message);
}
