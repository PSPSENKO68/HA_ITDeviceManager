const { contextBridge, ipcRenderer } = require('electron');

contextBridge.exposeInMainWorld('electronAPI', {
  readDb: () => ipcRenderer.invoke('read-db'),
  writeDb: (data) => ipcRenderer.invoke('write-db', data),
  getConfig: () => ipcRenderer.invoke('get-config'),
  setConfig: (config) => ipcRenderer.invoke('set-config', config),
  selectFile: () => ipcRenderer.invoke('select-file')
});
