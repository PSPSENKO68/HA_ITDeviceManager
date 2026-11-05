const xlsx = require('xlsx');

function formatExcelDate(val) {
  if (val === null || val === undefined || val === '') return null;
  if (typeof val === 'number') {
    const date = new Date(Math.round((val - 25569) * 86400 * 1000));
    const mm = String(date.getUTCMonth() + 1).padStart(2, '0');
    const dd = String(date.getUTCDate()).padStart(2, '0');
    const yyyy = date.getUTCFullYear();
    return `${mm}/${dd}/${yyyy}`;
  }
  const str = String(val).trim();
  const d = new Date(str);
  if (!isNaN(d.getTime())) {
    const mm = String(d.getMonth() + 1).padStart(2, '0');
    const dd = String(d.getDate()).padStart(2, '0');
    const yyyy = d.getFullYear();
    return `${mm}/${dd}/${yyyy}`;
  }
  return str;
}

const wb = xlsx.readFile('excel/Equipment Tracking HoangAnh_021126.xlsx');
const hw = xlsx.utils.sheet_to_json(wb.Sheets['Hardware']);
console.log("Hardware row 0 dates:");
console.log("Thời gian đầu tư (raw):", hw[0]['Thời gian đầu tư'], "->", formatExcelDate(hw[0]['Thời gian đầu tư']));
console.log("HSD ban đầu (raw):", hw[0]['HSD ban đầu'], "->", formatExcelDate(hw[0]['HSD ban đầu']));
console.log("Thời gian bảo trì (raw):", hw[0]['Thời gian bảo trì'], "->", formatExcelDate(hw[0]['Thời gian bảo trì']));
console.log("HSD gia hạn (raw):", hw[0]['HSD gia hạn'], "->", formatExcelDate(hw[0]['HSD gia hạn']));

