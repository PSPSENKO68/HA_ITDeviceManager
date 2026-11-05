const xlsx = require('xlsx');

const wbNew = xlsx.readFile('excel/Equipment Tracking HoangAnh_021126.xlsx');
console.log("\n=== License in Equipment Tracking ===");
const lic = xlsx.utils.sheet_to_json(wbNew.Sheets['License']);
console.log("Count:", lic.length);
if (lic.length > 0) console.log("Sample:", lic[0]);

console.log("\n=== DanhSachNhanVien in Equipment Tracking ===");
const nv = xlsx.utils.sheet_to_json(wbNew.Sheets['DanhSachNhanVien']);
console.log("Count:", nv.length);
if (nv.length > 0) console.log("Sample:", nv[0]);

const wbOld = xlsx.readFile('data/database.xlsx');
console.log("\n=== Application in database.xlsx ===");
const app = xlsx.utils.sheet_to_json(wbOld.Sheets['Application']);
console.log("Count:", app.length);
if (app.length > 0) console.log("Sample:", app[0]);

console.log("\n=== LichSu in database.xlsx ===");
const ls = xlsx.utils.sheet_to_json(wbOld.Sheets['LichSu']);
console.log("Count:", ls.length);
if (ls.length > 0) console.log("Sample:", ls[0]);

