const { app, BrowserWindow, ipcMain, dialog } = require('electron');
const path = require('path');
const fs = require('fs');
const xlsx = require('xlsx');

const isDev = !app.isPackaged;

let mainWindow;

function createWindow() {
  mainWindow = new BrowserWindow({
    width: 1280,
    height: 800,
    webPreferences: {
      preload: path.join(__dirname, 'preload.cjs'),
      contextIsolation: true,
      nodeIntegration: false
    }
  });

  if (isDev) {
    mainWindow.loadURL('http://localhost:5173');
    mainWindow.webContents.openDevTools();
  } else {
    mainWindow.loadFile(path.join(__dirname, '../dist/index.html'));
  }
}

app.whenReady().then(() => {
  createWindow();

  app.on('activate', () => {
    if (BrowserWindow.getAllWindows().length === 0) {
      createWindow();
    }
  });
});

app.on('window-all-closed', () => {
  if (process.platform !== 'darwin') {
    app.quit();
  }
});

// Config Logic
const getConfigPath = () => path.join(app.getPath('userData'), 'config.json');

const getConfig = () => {
  try {
    const configPath = getConfigPath();
    if (fs.existsSync(configPath)) {
      return JSON.parse(fs.readFileSync(configPath, 'utf8'));
    }
  } catch (e) {
    console.error('Failed to read config', e);
  }
  return {};
};

const saveConfig = (newConfig) => {
  try {
    const config = { ...getConfig(), ...newConfig };
    fs.writeFileSync(getConfigPath(), JSON.stringify(config, null, 2));
    return true;
  } catch (e) {
    console.error('Failed to save config', e);
    return false;
  }
};

// Database Logic (Excel)
const getDbPath = () => {
  const config = getConfig();
  if (config.customDbPath && fs.existsSync(config.customDbPath)) {
    return config.customDbPath;
  }
  if (isDev) {
    return path.join(__dirname, '../../data/database.xlsx');
  } else {
    return path.join(app.getPath('userData'), 'database.xlsx');
  }
}

// Copy default DB if not exists in production
const initDb = () => {
  if (!isDev) {
    const dbPath = path.join(app.getPath('userData'), 'database.xlsx');
    if (!fs.existsSync(dbPath)) {
      // In production, we assume a default database.xlsx is bundled inside resources/data
      const defaultDb = path.join(process.resourcesPath, 'data/database.xlsx');
      if (fs.existsSync(defaultDb)) {
        fs.copyFileSync(defaultDb, dbPath);
      }
    }
  }
}
initDb();

// IPC Handlers
ipcMain.handle('read-db', async () => {
  try {
    const dbPath = getDbPath();
    if (!fs.existsSync(dbPath)) return { error: 'Database not found' };
    
    const wb = xlsx.readFile(dbPath, { cellDates: true });
    const result = {};
    wb.SheetNames.forEach(sheetName => {
      const sheet = wb.Sheets[sheetName];
      result[sheetName] = xlsx.utils.sheet_to_json(sheet, { defval: '', raw: false, dateNF: 'yyyy-mm-dd' });
    });
    return { data: result };
  } catch (err) {
    return { error: err.message };
  }
});

ipcMain.handle('get-config', () => {
  return getConfig();
});

ipcMain.handle('set-config', (event, newConfig) => {
  return saveConfig(newConfig);
});

ipcMain.handle('select-file', async () => {
  const result = await dialog.showOpenDialog(mainWindow, {
    properties: ['openFile'],
    filters: [{ name: 'Excel Files', extensions: ['xlsx', 'xls'] }]
  });
  if (!result.canceled && result.filePaths.length > 0) {
    return result.filePaths[0];
  }
  return null;
});

ipcMain.handle('write-db', async (event, data) => {
  try {
    const dbPath = getDbPath();
    const newWb = xlsx.utils.book_new();
    
    Object.keys(data).forEach(sheetName => {
      const ws = xlsx.utils.json_to_sheet(data[sheetName]);
      xlsx.utils.book_append_sheet(newWb, ws, sheetName);
    });

    xlsx.writeFile(newWb, dbPath);
    return { success: true };
  } catch (err) {
    return { error: err.message };
  }
});
