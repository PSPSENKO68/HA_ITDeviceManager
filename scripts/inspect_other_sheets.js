const xlsx = require('xlsx');

const wb = xlsx.readFile('excel/Equipment Tracking HoangAnh_021126.xlsx');
['Printer or Photocopy', 'Network'].forEach(sName => {
    console.log(`\n=== SHEET: ${sName} ===`);
    const ws = wb.Sheets[sName];
    const rows = xlsx.utils.sheet_to_json(ws, { defval: null });
    if (rows.length > 0) {
        console.log("Columns:", Object.keys(rows[0]));
        console.log("Row 0:", JSON.stringify(rows[0], null, 2));
    }
});

