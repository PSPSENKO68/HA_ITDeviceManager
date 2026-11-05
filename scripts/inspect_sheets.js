const xlsx = require('xlsx');

function inspectFile(filePath) {
    console.log(`\n=== FILE: ${filePath} ===`);
    try {
        const wb = xlsx.readFile(filePath);
        console.log("Sheets:", wb.SheetNames);
        wb.SheetNames.forEach(sheetName => {
            const ws = wb.Sheets[sheetName];
            const data = xlsx.utils.sheet_to_json(ws, { header: 1 });
            console.log(`  Sheet [${sheetName}]: ${data.length} rows`);
            if (data.length > 0) {
                console.log(`    Headers:`, data[0].slice(0, 10));
            }
        });
    } catch (e) {
        console.error("Error reading:", e.message);
    }
}

inspectFile('excel/Equipment Tracking HoangAnh_021126.xlsx');
inspectFile('data/database.xlsx');

