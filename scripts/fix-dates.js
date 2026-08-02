const xlsx = require('xlsx');
const path = require('path');

const dbPath = path.join(__dirname, '../data/database.xlsx');
const workbook = xlsx.readFile(dbPath);
const sheet = workbook.Sheets['ThietBi'];

if (sheet) {
  const data = xlsx.utils.sheet_to_json(sheet);
  const dateColumns = ["Thoi gian dau tu", "HSD ban dau", "Thoi gian bao tri", "HSD gia han"];

  function excelDateToString(serial) {
    if (!serial || isNaN(Number(serial))) return serial;
    // Excel days since Jan 1 1900 (minus 1 for the 1900 leap year bug)
    // 25569 is the offset to Unix epoch (Jan 1 1970)
    const utc_days = Math.floor(serial - 25569);
    const date_info = new Date(utc_days * 86400 * 1000);
    
    const d = date_info.getUTCDate().toString().padStart(2, '0');
    const m = (date_info.getUTCMonth() + 1).toString().padStart(2, '0');
    const y = date_info.getUTCFullYear();
    
    return `${d}/${m}/${y}`;
  }

  let modified = false;

  data.forEach(row => {
    dateColumns.forEach(col => {
      if (row[col] && typeof row[col] === 'number') {
        row[col] = excelDateToString(row[col]);
        modified = true;
      }
    });
  });

  if (modified) {
    const newWs = xlsx.utils.json_to_sheet(data, { header: Object.keys(data[0] || {}) });
    workbook.Sheets['ThietBi'] = newWs;
    xlsx.writeFile(workbook, dbPath);
    console.log("Fixed dates in database.xlsx!");
  } else {
    console.log("No dates needed fixing.");
  }
} else {
  console.log("ThietBi sheet not found.");
}
