const xlsx = require('xlsx');

const wb = xlsx.readFile('excel/Equipment Tracking HoangAnh_021126.xlsx');
const hw = xlsx.utils.sheet_to_json(wb.Sheets['Hardware']);
const w10 = xlsx.utils.sheet_to_json(wb.Sheets['Windows 10']);

console.log("Hardware rows:", hw.length);
console.log("Windows 10 rows:", w10.length);

const hwSerials = new Set(hw.map(r => String(r['Serialnumber'] || '').trim().toUpperCase()).filter(Boolean));
const w10Serials = new Set(w10.map(r => String(r['Serialnumber'] || '').trim().toUpperCase()).filter(Boolean));

console.log("Unique serials in Hardware:", hwSerials.size);
console.log("Unique serials in Windows 10:", w10Serials.size);

let inW10NotInHw = 0;
w10.forEach(r => {
  const sn = String(r['Serialnumber'] || '').trim().toUpperCase();
  if (sn && !hwSerials.has(sn)) {
    inW10NotInHw++;
    if (inW10NotInHw <= 5) {
      console.log(`  In W10 but not in Hardware: Owner=${r['Owner']}, Model=${r['Model']}, SN=${sn}, Status=${r['Kích hoạt']}`);
    }
  }
});
console.log(`Total in Windows 10 but not in Hardware: ${inW10NotInHw}`);

