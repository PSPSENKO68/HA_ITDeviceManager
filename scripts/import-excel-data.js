#!/usr/bin/env node

/**
 * Excel Data Import Script for IT Asset Management System
 * Imports data from the Equipment-Tracking-HoangAnh.xlsx file into Supabase
 * 
 * Usage: node scripts/import-excel-data.js
 */

const fs = require('fs');
const path = require('path');
const { read, utils } = require('xlsx');
const { createClient } = require('@supabase/supabase-js');

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL;
const supabaseServiceKey = process.env.SUPABASE_SERVICE_ROLE_KEY;

if (!supabaseUrl || !supabaseServiceKey) {
  console.error('❌ Missing required environment variables');
  process.exit(1);
}

const supabase = createClient(supabaseUrl, supabaseServiceKey);

async function importExcelData() {
  try {
    console.log('🚀 Starting Excel data import...\n');

    // Read Excel file
    const excelPath = path.join(__dirname, '..', 'data', 'Equipment-Tracking-HoangAnh-e1668b.xlsx');
    const workbook = read(fs.readFileSync(excelPath), { cellDates: true });

    console.log(`📊 Found ${workbook.SheetNames.length} sheets:\n`);
    workbook.SheetNames.forEach(name => console.log(`  • ${name}`));

    // Get Hardware sheet data
    const hardwareSheet = workbook.Sheets['Hardware ver1'];
    if (!hardwareSheet) {
      console.warn('⚠️  "Hardware ver1" sheet not found');
      return;
    }

    const hardware = utils.sheet_to_json(hardwareSheet);
    console.log(`\n📦 Processing ${hardware.length} hardware items...\n`);

    // Get or create departments
    const departments = [...new Set(hardware.map(h => h['Bộ phận']))].filter(Boolean);
    console.log(`🏢 Creating ${departments.length} departments...`);

    const deptMap = {};
    for (const dept of departments) {
      const { data } = await supabase
        .from('departments')
        .insert({ name: dept })
        .select()
        .single()
        .catch(e => ({ data: null, error: e }));
      
      if (data) deptMap[dept] = data.id;
    }

    // Get or create locations
    const locations = [...new Set(hardware.map(h => h['Khu vực']))].filter(Boolean);
    console.log(`📍 Creating ${locations.length} locations...`);

    const locMap = {};
    for (const loc of locations) {
      const { data } = await supabase
        .from('asset_locations')
        .insert({ name: loc })
        .select()
        .single()
        .catch(e => ({ data: null, error: e }));
      
      if (data) locMap[loc] = data.id;
    }

    // Get asset categories and brands
    const { data: categories } = await supabase.from('asset_categories').select('id, name');
    const { data: brands } = await supabase.from('asset_brands').select('id, name');

    const categoryMap = {};
    categories?.forEach(c => categoryMap[c.name] = c.id);

    const brandMap = {};
    brands?.forEach(b => brandMap[b.name] = b.id);

    // Process hardware items
    console.log(`\n💾 Importing assets...\n`);
    let importedCount = 0;

    for (const item of hardware) {
      const categoryId = categoryMap['Laptop'] || categoryMap['Desktop'] || Object.values(categoryMap)[0];
      const brand = item['Loại']?.split(' ')[0];
      const brandId = brandMap[brand] || brandMap['Dell'] || Object.values(brandMap)[0];

      const assetData = {
        asset_tag: `ASSET-${Date.now()}-${Math.random().toString(36).substr(2, 9)}`,
        serial_number: item['Serial'] || null,
        category_id: categoryId,
        brand_id: brandId,
        model: item['Model'] || item['Loại'],
        device_name: item['Computer Name'] || `Device-${item['Stt']}`,
        cpu: item['CPU'] || null,
        ram: item['RAM'] || null,
        storage: item['Hard disk'] || null,
        purchase_date: item['Thời gian đầu tư'] || null,
        status: item['Kích hoạt']?.toLowerCase() === 'active' ? 'active' : 'inactive',
        current_location_id: locMap[item['Khu vực']] || null,
      };

      const { error } = await supabase
        .from('assets')
        .insert(assetData)
        .catch(e => ({ error: e }));

      if (!error) {
        importedCount++;
        process.stdout.write(`\r✓ Imported ${importedCount}/${hardware.length} assets...`);
      }
    }

    console.log(`\n\n✅ Import completed!`);
    console.log(`   ✓ Imported ${importedCount} assets`);
    console.log(`   ✓ Created ${departments.length} departments`);
    console.log(`   ✓ Created ${locations.length} locations\n`);

  } catch (error) {
    console.error('❌ Import failed:', error.message);
    process.exit(1);
  }
}

importExcelData();
