import { useState } from 'react'
import { Monitor, Printer, Key, Database, RefreshCw, History, Settings, AppWindow, ChevronRight, ChevronDown } from 'lucide-react'

interface SidebarProps {
  activeTab: string
  onTabChange: (tab: string) => void
  onRefresh: () => void
  onSettings: () => void
}

export function Sidebar({ activeTab, onTabChange, onRefresh, onSettings }: SidebarProps) {
  const [isThietBiOpen, setIsThietBiOpen] = useState(activeTab.startsWith('ThietBi'))

  const handleThietBiClick = () => {
    if (!isThietBiOpen) {
      setIsThietBiOpen(true)
      onTabChange('ThietBi_All')
    } else {
      setIsThietBiOpen(false)
    }
  }

  return (
    <aside className="sidebar">
      <div className="sidebar-header">
        <div className="logo-icon"><Database size={18} /></div>
        <span className="logo-text">IT Asset Pro</span>
      </div>

      <nav className="sidebar-nav">
        <span className="nav-group-title">Quản lý tài sản</span>
        
        <div className="nav-item-tree">
          <button 
            className={`nav-item ${activeTab === 'ThietBi_All' ? 'active' : ''}`} 
            onClick={handleThietBiClick}
            style={{ display: 'flex', justifyContent: 'space-between', width: '100%', alignItems: 'center' }}
          >
            <div style={{ display: 'flex', alignItems: 'center', gap: 8 }}>
              <Monitor size={17} /> <span>Thiết bị CNTT</span>
            </div>
            {isThietBiOpen ? <ChevronDown size={14} /> : <ChevronRight size={14} />}
          </button>
          
          {isThietBiOpen && (
            <div className="tree-children" style={{ paddingLeft: 24, marginTop: 4, display: 'flex', flexDirection: 'column', gap: 2 }}>
              <button 
                className={`nav-item ${activeTab === 'ThietBi_PC' ? 'active' : ''}`} 
                onClick={() => onTabChange('ThietBi_PC')}
                style={{ padding: '6px 12px', fontSize: 13, height: 'auto', minHeight: 32 }}
              >
                <span>Laptop / Desktop</span>
              </button>
              <button 
                className={`nav-item ${activeTab === 'ThietBi_Network' ? 'active' : ''}`} 
                onClick={() => onTabChange('ThietBi_Network')}
                style={{ padding: '6px 12px', fontSize: 13, height: 'auto', minHeight: 32 }}
              >
                <span>Các thiết bị mạng</span>
              </button>
            </div>
          )}
        </div>
        <button className={`nav-item ${activeTab === 'Printer' ? 'active' : ''}`} onClick={() => onTabChange('Printer')}>
          <Printer size={17} /> <span>Máy In & Photocopy</span>
        </button>
        <button className={`nav-item ${activeTab === 'License' ? 'active' : ''}`} onClick={() => onTabChange('License')}>
          <Key size={17} /> <span>License</span>
        </button>
        <button className={`nav-item ${activeTab === 'Application' ? 'active' : ''}`} onClick={() => onTabChange('Application')}>
          <AppWindow size={17} /> <span>Ứng dụng</span>
        </button>

        <span className="nav-group-title" style={{ marginTop: 16 }}>Theo dõi</span>
        <button className={`nav-item ${activeTab === 'LichSu' ? 'active' : ''}`} onClick={() => onTabChange('LichSu')}>
          <History size={17} /> <span>Lịch sử hoạt động</span>
        </button>
      </nav>

      <div className="sidebar-footer" style={{ display: 'flex', flexDirection: 'column', gap: '8px' }}>
        <button className="btn btn-secondary" style={{ width: '100%' }} onClick={onRefresh}>
          <RefreshCw size={14} /> Refresh DB
        </button>
        <button className="btn btn-secondary" style={{ width: '100%' }} onClick={onSettings}>
          <Settings size={14} /> Cài đặt DB
        </button>
      </div>
    </aside>
  )
}
