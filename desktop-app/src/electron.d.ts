export interface ElectronAPI {
  readDb: () => Promise<any>
  writeDb: (data: any) => Promise<any>
  getConfig: () => Promise<any>
  setConfig: (config: any) => Promise<any>
  selectFile: () => Promise<string | null>
}

declare global {
  interface Window {
    electronAPI: ElectronAPI
  }
}
