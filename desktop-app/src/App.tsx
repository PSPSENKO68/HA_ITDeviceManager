import { useState, useEffect, useCallback } from 'react'
import { Moon, Sun } from 'lucide-react'
import { Sidebar } from './components/Sidebar'
import { ThietBiTab } from './components/ThietBiTab'
import { PrinterTab } from './components/PrinterTab'
import { LicenseTab } from './components/LicenseTab'
import { LichSuTab } from './components/LichSuTab'
import { ApplicationTab } from './components/ApplicationTab'
import { Modal } from './components/Modal'
import { Database, FolderOpen } from 'lucide-react'
import './index.css'

interface DbData {
  ThietBi: any[]
  Printer: any[]
  License: any[]
  LichSu: any[]
  Application: any[]
}

export default function App() {
  const [activeTab, setActiveTab] = useState('ThietBi_All')
  const [dbData, setDbData] = useState<DbData>({ ThietBi: [], Printer: [], License: [], LichSu: [], Application: [] })
  const [loading, setLoading] = useState(true)
  const [toast, setToast] = useState<{ type: 'success' | 'error'; text: string } | null>(null)
  
  const [showSettings, setShowSettings] = useState(false)
  const [customDbPath, setCustomDbPath] = useState('')
  const [dbPathInput, setDbPathInput] = useState('')
  const [isDark, setIsDark] = useState(() => {
    return document.documentElement.getAttribute('data-theme') === 'dark'
  })

  const toggleTheme = () => {
    setIsDark(prev => {
      const next = !prev
      document.documentElement.setAttribute('data-theme', next ? 'dark' : 'light')
      return next
    })
  }

  const showToast = (type: 'success' | 'error', text: string) => {
    setToast({ type, text })
    setTimeout(() => setToast(null), 3000)
  }

  const loadData = useCallback(async () => {
    setLoading(true)
    try {
      if (window.electronAPI) {
        const config = await window.electronAPI.getConfig()
        if (config.customDbPath) {
          setCustomDbPath(config.customDbPath)
          setDbPathInput(config.customDbPath)
        }
        
        const res = await window.electronAPI.readDb()
        if (res.error) throw new Error(res.error)
        setDbData({
          ThietBi: res.data.ThietBi || [],
          Printer: res.data.Printer || [],
          License: res.data.License || [],
          LichSu: res.data.LichSu || [],
          Application: res.data.Application || []
        })
      } else {
        // Browser fallback with real data API
        const response = await fetch('/api/read-db')
        const res = await response.json()
        if (res.error) throw new Error(res.error)
        setDbData({
          ThietBi: res.data.ThietBi || [],
          Printer: res.data.Printer || [],
          License: res.data.License || [],
          LichSu: res.data.LichSu || [],
          Application: res.data.Application || []
        })
      }
    } catch (err: any) {
      showToast('error', 'Lỗi đọc database: ' + err.message)
    } finally {
      setLoading(false)
    }
  }, [])

  useEffect(() => { loadData() }, [loadData])

  // Unified save: updates is a partial Record of sheet name -> data
  const handleSave = async (updates: Record<string, any[]>) => {
    const merged = { ...dbData, ...updates } as DbData
    setDbData(merged)

    if (window.electronAPI) {
      const res = await window.electronAPI.writeDb(merged)
      if (res.error) {
        showToast('error', 'Lỗi ghi Excel: ' + res.error)
      } else {
        showToast('success', 'Đã lưu thành công vào database.xlsx!')
      }
    } else {
      // Browser fallback save
      try {
        const response = await fetch('/api/write-db', {
          method: 'POST',
          headers: { 'Content-Type': 'application/json' },
          body: JSON.stringify(merged)
        })
        const res = await response.json()
        if (res.error) throw new Error(res.error)
        showToast('success', 'Đã lưu thành công vào database.xlsx qua API!')
      } catch (err: any) {
        showToast('error', 'Lỗi ghi qua API: ' + err.message)
      }
    }
  }

  // Compat wrapper for Printer/License tabs (single sheet save)
  const handleSingleSave = (sheetName: string, sheetData: any[]) => {
    handleSave({ [sheetName]: sheetData })
  }

  const tabLabels: Record<string, string> = {
    ThietBi_All: 'Thiết bị CNTT (Tất cả)',
    ThietBi_PC: 'Laptop / Desktop',
    ThietBi_Network: 'Các thiết bị mạng',
    Printer: 'Máy In & Photocopy',
    License: 'License',
    Application: 'Quản lý Ứng dụng',
    LichSu: 'Lịch sử hoạt động'
  }

  return (
    <div className="layout">
      <Sidebar activeTab={activeTab} onTabChange={setActiveTab} onRefresh={loadData} onSettings={() => setShowSettings(true)} />

      <main className="main-content">
        <header className="top-header">
          <div className="breadcrumb">
            <span className="text-muted">Database / </span>
            <span className="text-primary font-bold">{tabLabels[activeTab] || activeTab}</span>
          </div>
          <div style={{ display: 'flex', alignItems: 'center', gap: 16 }}>
            <span className="text-muted" style={{ fontSize: 12 }} title={customDbPath || 'Mặc định'}>
              {window.electronAPI ? '🟢 Kết nối Excel' : '🟠 Preview Mode'} → {customDbPath ? 'Shared Disk' : 'Local'}
            </span>
            <button className="btn btn-secondary btn-icon" onClick={toggleTheme} title="Chuyển chế độ Sáng/Tối" style={{ borderRadius: '9999px', padding: '6px' }}>
              {isDark ? <Sun size={16} /> : <Moon size={16} />}
            </button>
          </div>
        </header>

        <div className="page-body">
          {loading ? (
            <div className="empty-state">
              <div className="empty-state-icon">⌛</div>
              <h3>Đang đọc file Excel...</h3>
            </div>
          ) : (
            <>
              {activeTab.startsWith('ThietBi') && (
                <ThietBiTab 
                  data={dbData.ThietBi} 
                  lichSu={dbData.LichSu} 
                  onSave={handleSave} 
                  activeSubTab={activeTab === 'ThietBi_PC' ? 'pc' : activeTab === 'ThietBi_Network' ? 'network' : 'all'}
                />
              )}
              {activeTab === 'Printer' && <PrinterTab data={dbData.Printer} onSave={handleSingleSave} />}
              {activeTab === 'License' && <LicenseTab data={dbData.License} allDevices={dbData.ThietBi} onSave={handleSingleSave} />}
              {activeTab === 'Application' && <ApplicationTab data={dbData.Application} allDevices={dbData.ThietBi} onSave={handleSingleSave} />}
              {activeTab === 'LichSu' && <LichSuTab data={dbData.LichSu} onSave={handleSave} />}
            </>
          )}
        </div>
      </main>

      <Modal title="Cài đặt Cơ sở dữ liệu" icon={<Database size={16} />} isOpen={showSettings} onClose={() => setShowSettings(false)}
        footer={
          <>
            <button className="btn btn-secondary" onClick={() => setShowSettings(false)}>Hủy</button>
            <button className="btn btn-primary" onClick={async () => {
              if (window.electronAPI) {
                await window.electronAPI.setConfig({ customDbPath: dbPathInput })
                setCustomDbPath(dbPathInput)
                setShowSettings(false)
                loadData()
                showToast('success', 'Đã lưu cấu hình và tải lại dữ liệu')
              }
            }}>Lưu cấu hình</button>
          </>
        }>
        <div className="form-group">
          <label className="form-label">Đường dẫn file Excel (Shared Disk)</label>
          <div style={{ display: 'flex', gap: 8 }}>
            <input 
              type="text" 
              className="form-input" 
              value={dbPathInput}
              onChange={e => setDbPathInput(e.target.value)}
              placeholder="VD: Z:\IT_Department\database.xlsx"
            />
            {window.electronAPI && (
              <button className="btn btn-secondary btn-icon" onClick={async () => {
                const path = await window.electronAPI.selectFile()
                if (path) setDbPathInput(path)
              }}>
                <FolderOpen size={16} />
              </button>
            )}
          </div>
          <p className="text-muted" style={{ fontSize: 12, marginTop: 8 }}>
            Nếu để trống, hệ thống sẽ sử dụng file database mặc định tại máy cục bộ (Local).
            Vui lòng chọn file .xlsx trên ổ đĩa mạng chung để mọi người cùng sử dụng.
          </p>
        </div>
      </Modal>

      {toast && (
        <div className={`toast ${toast.type === 'success' ? 'toast-success' : 'toast-error'}`}>
          {toast.type === 'success' ? '✅' : '❌'} {toast.text}
        </div>
      )}
    </div>
  )
}
