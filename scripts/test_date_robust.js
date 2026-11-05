const xlsx = require('xlsx');

function formatToMMDDYYYY(val) {
  if (val === null || val === undefined || val === '') return null;
  
  // 1. If Excel serial number
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
    // If d > 12, it is definitely DD/MM/YYYY
    if (d > 12 && m <= 12) {
      return `${String(m).padStart(2, '0')}/${String(d).padStart(2, '0')}/${y}`;
    }
    // Standard assume DD/MM/YYYY for VN documents
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

const wb = xlsx.readFile('excel/Equipment Tracking HoangAnh_021126.xlsx');
['Hardware', 'Network'].forEach(sheet => {
  const data = xlsx.utils.sheet_to_json(wb.Sheets[sheet]);
  console.log(`\n=== Date Samples from [${sheet}] ===`);
  data.slice(0, 5).forEach((r, idx) => {
    console.log(`Row ${idx+1} [${r['Owner'] || r['Model']}]:`);
    ['Thời gian đầu tư', 'HSD ban đầu', 'Thời gian bảo trì', 'HSD gia hạn', 'Thời gian hết niên hạn'].forEach(col => {
      if (r[col] !== undefined) {
        console.log(`  ${col}: ${r[col]} => ${formatToMMDDYYYY(r[col])}`);
      }
    });
  });
});

