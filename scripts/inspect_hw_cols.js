const xlsx = require('xlsx');

const wb = xlsx.readFile('excel/Equipment Tracking HoangAnh_021126.xlsx');
const hw = xlsx.utils.sheet_to_json(wb.Sheets['Hardware']);
const w10 = xlsx.utils.sheet_to_json(wb.Sheets['Windows 10']);

console.log("Hardware columns:", Object.keys(hw[0]));
console.log("Windows 10 columns:", Object.keys(w10[0]));

