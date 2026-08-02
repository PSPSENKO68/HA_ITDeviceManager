const xlsx = require('xlsx');
const path = require('path');

const dbPath = path.join(__dirname, '../data/database.xlsx');
const workbook = xlsx.readFile(dbPath);
const sheet = workbook.Sheets['ThietBi'];

if (sheet) {
  const data = xlsx.utils.sheet_to_json(sheet);

  let modified = false;

  data.forEach(row => {
    const d1 = row['Thoi gian dau tu'];
    const d2 = row['HSD ban dau'];
    
    if (d1 && d2) {
      const p1 = String(d1).split('/');
      const p2 = String(d2).split('/');
      if (p1.length === 3 && p2.length === 3) {
        const date1 = new Date(`${p1[2]}-${p1[1]}-${p1[0]}`);
        const date2 = new Date(`${p2[2]}-${p2[1]}-${p2[0]}`);
        
        let years = date2.getFullYear() - date1.getFullYear();
        if (date2.getMonth() < date1.getMonth() || (date2.getMonth() === date1.getMonth() && date2.getDate() < date1.getDate())) {
          years--;
        }
        
        const newValue = years < 3 ? 'Đã hết hạn' : 'Còn hạn';
        if (row['Nien han ban dau'] !== newValue) {
          row['Nien han ban dau'] = newValue;
          modified = true;
        }
      }
    }
  });

  if (modified) {
    const newWs = xlsx.utils.json_to_sheet(data, { header: Object.keys(data[0] || {}) });
    workbook.Sheets['ThietBi'] = newWs;
    xlsx.writeFile(workbook, dbPath);
    console.log("Updated Nien han ban dau in database.xlsx!");
  } else {
    console.log("No updates needed.");
  }
} else {
  console.log("ThietBi sheet not found.");
}
