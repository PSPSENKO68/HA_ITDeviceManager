import { useState, useMemo } from 'react'
import { AppWindow, Search, Plus, Edit2, Trash2, CheckCircle2, Package, ShieldCheck, HelpCircle, Eye } from 'lucide-react'
import { Modal } from './Modal'

interface ApplicationTabProps {
  data: any[]
  allDevices?: any[]
  onSave: (sheetName: string, data: any[]) => void
}

const HEADERS = ['STT', 'Owner', 'PhongBan', 'May', 'UngDung', 'LyDo', 'LoaiPhanMem', 'TrangThai', 'NgayCaiDat', 'GhiChu']
const USER_HEADERS = ['STT', 'Owner', 'PhongBan', 'May', 'SoLuongUngDung']

const DEFAULT_APPS = [
  'Office365 (Word, Excel, PowerPoint)',
  'OneDrive',
  'Outlook',
  'SS4U',
  'Google Chrome',
  'Unikey',
  'FoxitReader / PDFXChange',
  'WinRAR',
  'Ultraviewer'
]

const EXTERNAL_APPS = [
  'Zoom Workplace',
  'NetExtender',
  'PowerApp',
  'PowerBI',
  'Zalo',
  'WK (Weekend)',
  'ESign',
  'Invoice Viewer',
  'VNToolExcel'
]

const COMBINED_APPS = [...DEFAULT_APPS, ...EXTERNAL_APPS]

const DISPLAY_LABELS: Record<string, string> = {
  STT: 'STT',
  Owner: 'Owner (Người dùng)',
  PhongBan: 'Phòng Ban',
  May: 'Tên Máy',
  UngDung: 'Ứng Dụng',
  LyDo: 'Lý Do Cài Đặt',
  LoaiPhanMem: 'Loại Phần Mềm',
  TrangThai: 'Trạng Thái',
  NgayCaiDat: 'Ngày Cài Đặt',
  GhiChu: 'Ghi Chú',
  SoLuongUngDung: 'Số lượng Ứng dụng'
}

const FORM_FIELDS = HEADERS.filter(h => h !== 'STT')

function getCategoryBadge(val: any) {
  const s = String(val || '').trim().toLowerCase()
  if (!s) return null
  if (s.includes('bản quyền') || s.includes('license') || s.includes('paid'))
    return <span className="badge badge-purple">Bản quyền</span>
  if (s.includes('miễn phí') || s.includes('free') || s.includes('freeware'))
    return <span className="badge badge-blue">Miễn phí</span>
  if (s.includes('nội bộ') || s.includes('internal'))
    return <span className="badge badge-cyan">Nội bộ</span>
  return <span className="badge badge-gray">{val}</span>
}

function getStatusBadge(val: any) {
  const s = String(val || '').trim().toLowerCase()
  if (!s) return null
  if (s.includes('sử dụng') || s.includes('active') || s.includes('đang dùng'))
    return <span className="badge badge-green">Đang sử dụng</span>
  if (s.includes('gỡ') || s.includes('uninstall') || s.includes('đã xóa'))
    return <span className="badge badge-red">Đã gỡ bỏ</span>
  if (s.includes('kiểm tra') || s.includes('chờ') || s.includes('pending'))
    return <span className="badge badge-yellow">Cần kiểm tra</span>
  return <span className="badge badge-gray">{val}</span>
}

export function ApplicationTab({ data, allDevices = [], onSave }: ApplicationTabProps) {
  const [search, setSearch] = useState('')
  const [filters, setFilters] = useState<Record<string, string>>({})
  
  // State for user view modal
  const [viewingUser, setViewingUser] = useState<string | null>(null)
  
  // State for add/edit modal (can be used both outside and inside user modal)
  const [editRow, setEditRow] = useState<any | null>(null)
  const [editOrigIdx, setEditOrigIdx] = useState(-1)
  const [showAdd, setShowAdd] = useState(false)
  const [addDefaults, setAddDefaults] = useState(false)

  const getTodayDateStr = () => new Date().toISOString().split('T')[0]

  const [newRow, setNewRow] = useState<any>({
    Owner: '',
    PhongBan: '',
    May: '',
    UngDung: '',
    LyDo: '',
    LoaiPhanMem: 'Miễn phí',
    TrangThai: 'Đang sử dụng',
    NgayCaiDat: getTodayDateStr(),
    GhiChu: ''
  })

  // Summary statistics
  const summary = useMemo(() => {
    let total = data.length
    let licensed = 0
    let freeware = 0
    let active = 0

    data.forEach(item => {
      const cat = String(item.LoaiPhanMem || '').toLowerCase()
      const st = String(item.TrangThai || '').toLowerCase()

      if (cat.includes('bản quyền') || cat.includes('license')) licensed++
      if (cat.includes('miễn phí') || cat.includes('free')) freeware++
      if (st.includes('sử dụng') || st.includes('active') || st.includes('đang dùng')) active++
    })

    return { total, licensed, freeware, active }
  }, [data])

  // Group by Owner for the main table
  const groupedUsers = useMemo(() => {
    const map = new Map<string, { Owner: string, PhongBan: string, May: string, apps: any[], origIndices: number[] }>()
    data.forEach((row, idx) => {
      const owner = (row.Owner || 'Không xác định').trim()
      if (!map.has(owner)) {
        map.set(owner, {
          Owner: row.Owner || 'Không xác định',
          PhongBan: row.PhongBan || '',
          May: row.May || '',
          apps: [],
          origIndices: []
        })
      }
      const userGroup = map.get(owner)!
      userGroup.apps.push(row)
      userGroup.origIndices.push(idx)
      // Update PhongBan and May if they are empty
      if (!userGroup.PhongBan && row.PhongBan) userGroup.PhongBan = row.PhongBan
      if (!userGroup.May && row.May) userGroup.May = row.May
    })
    return Array.from(map.values())
  }, [data])

  const filteredUsers = useMemo(() => {
    let result = groupedUsers
    if (search.trim()) {
      const q = search.toLowerCase()
      result = result.filter(user =>
        user.Owner.toLowerCase().includes(q) ||
        user.PhongBan.toLowerCase().includes(q) ||
        user.May.toLowerCase().includes(q) ||
        user.apps.some(app => 
          Object.values(app).some(v => String(v || '').toLowerCase().includes(q))
        )
      )
    }
    Object.keys(filters).forEach(k => {
      const fv = filters[k].toLowerCase()
      if (fv) {
        if (k === 'SoLuongUngDung') {
          result = result.filter(user => String(user.apps.length).includes(fv))
        } else {
          result = result.filter(user => String((user as any)[k] || '').toLowerCase().includes(fv))
        }
      }
    })
    return result
  }, [groupedUsers, search, filters])

  const uniqueOwners = useMemo(() => {
    const list = (allDevices.length > 0 ? allDevices : data).map(r => r.Owner).filter(Boolean)
    return Array.from(new Set(list))
  }, [data, allDevices])
  
  const uniqueDepts = useMemo(() => {
    const list = (allDevices.length > 0 ? allDevices : data).map(r => r.PhongBan).filter(Boolean)
    return Array.from(new Set(list))
  }, [data, allDevices])
  
  const uniqueMachines = useMemo(() => {
    const list = (allDevices.length > 0 ? allDevices : data).map(r => r.Model || r.May).filter(Boolean)
    return Array.from(new Set(list))
  }, [data, allDevices])

  const viewingUserObj = useMemo(() => {
    if (!viewingUser) return null;
    return groupedUsers.find(u => u.Owner === viewingUser) || null;
  }, [viewingUser, groupedUsers])

  const handleAdd = () => {
    let updated = [...data]
    
    if (addDefaults) {
      DEFAULT_APPS.forEach(appName => {
        updated.push({
          ...newRow,
          UngDung: appName,
          LoaiPhanMem: 'Mặc định',
          LyDo: 'Cài đặt mặc định theo tiêu chuẩn'
        })
      })
      if (newRow.UngDung && newRow.UngDung.trim() !== '') {
        updated.push({ ...newRow })
      }
    } else {
      updated.push({ ...newRow })
    }

    onSave('Application', updated)
    setShowAdd(false)
    setAddDefaults(false)
    // reset row
    setNewRow({
      Owner: viewingUser || '',
      PhongBan: viewingUserObj?.PhongBan || '',
      May: viewingUserObj?.May || '',
      UngDung: '',
      LyDo: '',
      LoaiPhanMem: 'Miễn phí',
      TrangThai: 'Đang sử dụng',
      NgayCaiDat: getTodayDateStr(),
      GhiChu: ''
    })
  }

  const handleUpdate = () => {
    if (editOrigIdx < 0) return
    const updated = [...data]
    updated[editOrigIdx] = { ...editRow }
    onSave('Application', updated)
    setEditRow(null)
    setEditOrigIdx(-1)
  }

  const handleDeleteSingle = (origIdx: number) => {
    if (!window.confirm('Bạn có chắc muốn xóa ứng dụng này?')) return
    const updated = data.filter((_, i) => i !== origIdx)
    onSave('Application', updated)
  }

  const handleDeleteUserApps = (owner: string) => {
    if (!window.confirm(`Bạn có chắc muốn xóa TẤT CẢ ứng dụng của user ${owner}?`)) return
    const updated = data.filter(row => (row.Owner || 'Không xác định').trim() !== owner)
    onSave('Application', updated)
    if (viewingUser === owner) {
      setViewingUser(null)
    }
  }

  const openAddModal = (ownerInfo?: any) => {
    if (ownerInfo) {
      setNewRow((prev: any) => ({
        ...prev,
        Owner: ownerInfo.Owner !== 'Không xác định' ? ownerInfo.Owner : '',
        PhongBan: ownerInfo.PhongBan || '',
        May: ownerInfo.May || ''
      }))
    } else {
      setNewRow((prev: any) => ({
        ...prev,
        Owner: '',
        PhongBan: '',
        May: ''
      }))
    }
    setShowAdd(true)
  }

  return (
    <div className="tab-container">
      {/* Datalists for autocomplete */}
      <datalist id="owner-list">
        {uniqueOwners.map(d => <option key={d as string} value={d as string} />)}
      </datalist>
      <datalist id="dept-list">
        {uniqueDepts.map(d => <option key={d as string} value={d as string} />)}
      </datalist>
      <datalist id="machine-list">
        {uniqueMachines.map(d => <option key={d as string} value={d as string} />)}
      </datalist>
      <datalist id="app-list">
        {COMBINED_APPS.map(app => <option key={app} value={app} />)}
      </datalist>

      {/* Summary Cards */}
      <div className="license-cards-section" style={{ marginBottom: 20 }}>
        <div style={{
          display: 'grid',
          gridTemplateColumns: 'repeat(auto-fill, minmax(220px, 1fr))',
          gap: '12px 16px'
        }}>
          <div className="license-card" style={{ background: 'var(--bg-card)', padding: '16px 20px', borderRadius: 'var(--radius-xl)', border: '1px solid var(--border-default)' }}>
            <div className="license-card-header" style={{ display: 'flex', alignItems: 'center', gap: 12 }}>
              <div className="license-icon" style={{ display: 'flex', alignItems: 'center', justifyContent: 'center', width: 36, height: 36, borderRadius: 8, background: 'var(--color-blue-bg)', color: 'var(--color-blue)' }}>
                <Package size={18} />
              </div>
              <div className="license-name" style={{ fontWeight: 600, color: 'var(--text-secondary)' }}>Tổng Ứng Dụng</div>
            </div>
            <div className="license-count" style={{ marginTop: 12 }}>
              <span className="count-current" style={{ fontSize: 24, fontWeight: 700, color: 'var(--text-primary)' }}>{summary.total}</span>
              <span className="count-total" style={{ fontSize: 12, color: 'var(--text-muted)' }}> bản ghi</span>
            </div>
          </div>

          <div className="license-card" style={{ background: 'var(--bg-card)', padding: '16px 20px', borderRadius: 'var(--radius-xl)', border: '1px solid var(--border-default)' }}>
            <div className="license-card-header" style={{ display: 'flex', alignItems: 'center', gap: 12 }}>
              <div className="license-icon" style={{ display: 'flex', alignItems: 'center', justifyContent: 'center', width: 36, height: 36, borderRadius: 8, background: 'rgba(175, 82, 222, 0.12)', color: 'var(--color-purple)' }}>
                <ShieldCheck size={18} />
              </div>
              <div className="license-name" style={{ fontWeight: 600, color: 'var(--text-secondary)' }}>Bản Quyền</div>
            </div>
            <div className="license-count" style={{ marginTop: 12 }}>
              <span className="count-current" style={{ fontSize: 24, fontWeight: 700, color: 'var(--color-purple)' }}>{summary.licensed}</span>
              <span className="count-total" style={{ fontSize: 12, color: 'var(--text-muted)' }}> phần mềm</span>
            </div>
          </div>

          <div className="license-card" style={{ background: 'var(--bg-card)', padding: '16px 20px', borderRadius: 'var(--radius-xl)', border: '1px solid var(--border-default)' }}>
            <div className="license-card-header" style={{ display: 'flex', alignItems: 'center', gap: 12 }}>
              <div className="license-icon" style={{ display: 'flex', alignItems: 'center', justifyContent: 'center', width: 36, height: 36, borderRadius: 8, background: 'var(--color-blue-bg)', color: 'var(--color-cyan)' }}>
                <HelpCircle size={18} />
              </div>
              <div className="license-name" style={{ fontWeight: 600, color: 'var(--text-secondary)' }}>Miễn Phí / Khác</div>
            </div>
            <div className="license-count" style={{ marginTop: 12 }}>
              <span className="count-current" style={{ fontSize: 24, fontWeight: 700, color: 'var(--color-cyan)' }}>{summary.freeware}</span>
              <span className="count-total" style={{ fontSize: 12, color: 'var(--text-muted)' }}> phần mềm</span>
            </div>
          </div>

          <div className="license-card" style={{ background: 'var(--bg-card)', padding: '16px 20px', borderRadius: 'var(--radius-xl)', border: '1px solid var(--border-default)' }}>
            <div className="license-card-header" style={{ display: 'flex', alignItems: 'center', gap: 12 }}>
              <div className="license-icon" style={{ display: 'flex', alignItems: 'center', justifyContent: 'center', width: 36, height: 36, borderRadius: 8, background: 'var(--color-green-bg)', color: 'var(--color-green)' }}>
                <CheckCircle2 size={18} />
              </div>
              <div className="license-name" style={{ fontWeight: 600, color: 'var(--text-secondary)' }}>Đang Sử Dụng</div>
            </div>
            <div className="license-count" style={{ marginTop: 12 }}>
              <span className="count-current" style={{ fontSize: 24, fontWeight: 700, color: 'var(--color-green)' }}>{summary.active}</span>
              <span className="count-total" style={{ fontSize: 12, color: 'var(--text-muted)' }}> ứng dụng</span>
            </div>
          </div>
        </div>
      </div>

      {/* Toolbar */}
      <div className="toolbar" style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', marginBottom: 16 }}>
        <div className="search-box">
          <Search className="search-icon" size={16} />
          <input
            type="text"
            className="form-input"
            placeholder="Tìm kiếm user, tên máy, ứng dụng..."
            value={search}
            onChange={e => setSearch(e.target.value)}
          />
        </div>
        <div className="toolbar-actions">
          <button className="btn btn-primary" onClick={() => openAddModal()}>
            <Plus size={16} /> Thêm Ứng Dụng Mới
          </button>
        </div>
      </div>

      {/* Users Data Table */}
      <div className="table-wrapper">
        <table className="data-table">
          <thead>
            <tr>
              <th className="col-actions" rowSpan={2} style={{ width: 80, textAlign: 'center' }}>Thao tác</th>
              {USER_HEADERS.map(h => (
                <th key={h} style={h === 'STT' ? { width: 45, minWidth: 45, maxWidth: 55, textAlign: 'center' } : undefined}>
                  {DISPLAY_LABELS[h] || h}
                </th>
              ))}
            </tr>
            <tr className="filter-row">
              {USER_HEADERS.map(h => (
                <th key={h + '-filter'} style={{ padding: '4px 8px', ...(h === 'STT' ? { width: 45, minWidth: 45, maxWidth: 55 } : {}) }}>
                  <input
                    type="text"
                    className="form-input"
                    style={{ padding: '4px 4px', fontSize: 11, height: 24, textAlign: h === 'STT' ? 'center' : 'left' }}
                    placeholder={h === 'STT' ? '#' : 'Lọc...'}
                    value={filters[h] || ''}
                    onChange={e => setFilters({ ...filters, [h]: e.target.value })}
                  />
                </th>
              ))}
            </tr>
          </thead>
          <tbody>
            {filteredUsers.length === 0 ? (
              <tr>
                <td colSpan={USER_HEADERS.length + 1} style={{ textAlign: 'center', padding: '60px 20px' }}>
                  <div className="empty-state-icon">👥</div>
                  <h3 style={{ marginBottom: 4, color: 'var(--text-primary)' }}>Không có dữ liệu người dùng</h3>
                  <p className="text-muted">Thử thay đổi từ khóa tìm kiếm hoặc bấm "Thêm Ứng Dụng Mới".</p>
                </td>
              </tr>
            ) : (
              filteredUsers.map((user, idx) => (
                <tr key={user.Owner}>
                  <td className="col-actions" style={{ textAlign: 'center' }}>
                    <div className="action-buttons" style={{ justifyContent: 'center' }}>
                      <button
                        className="btn btn-ghost btn-icon text-primary"
                        title="Xem chi tiết ứng dụng"
                        onClick={() => setViewingUser(user.Owner)}
                      >
                        <Eye size={16} />
                      </button>
                      <button
                        className="btn btn-ghost btn-icon text-muted hover-danger"
                        title="Xóa tất cả ứng dụng của user này"
                        onClick={() => handleDeleteUserApps(user.Owner)}
                      >
                        <Trash2 size={14} />
                      </button>
                    </div>
                  </td>
                  <td style={{ textAlign: 'center', fontWeight: 600, color: 'var(--text-muted)' }}>{idx + 1}</td>
                  <td><div style={{ fontWeight: 600 }}>{user.Owner}</div></td>
                  <td>{user.PhongBan}</td>
                  <td>{user.May}</td>
                  <td>
                    <span className="badge badge-purple" style={{ padding: '4px 10px', fontSize: 12 }}>
                      {user.apps.length} ứng dụng
                    </span>
                  </td>
                </tr>
              ))
            )}
          </tbody>
        </table>
      </div>

      {/* User Details Modal (List of Apps) */}
      <Modal
        title={`Chi Tiết Ứng Dụng - ${viewingUser || ''}`}
        icon={<AppWindow size={16} />}
        isOpen={!!viewingUser}
        onClose={() => setViewingUser(null)}
        width="1100px"
        footer={
          <>
            <button className="btn btn-secondary" onClick={() => setViewingUser(null)}>Đóng</button>
          </>
        }
      >
        {viewingUserObj && (
          <div className="user-apps-container">
            <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', marginBottom: 16 }}>
              <div>
                <h3 style={{ margin: 0, color: 'var(--text-primary)', fontSize: 16 }}>
                  Danh sách ứng dụng ({viewingUserObj.apps.length})
                </h3>
                <p style={{ margin: '4px 0 0', color: 'var(--text-muted)', fontSize: 13 }}>
                  Máy: {viewingUserObj.May} | Phòng: {viewingUserObj.PhongBan}
                </p>
              </div>
              <button className="btn btn-primary btn-sm" onClick={() => openAddModal(viewingUserObj)}>
                <Plus size={14} /> Thêm Ứng Dụng
              </button>
            </div>
            
            <div className="table-wrapper" style={{ maxHeight: '50vh', overflowY: 'auto' }}>
              <table className="data-table">
                <thead style={{ position: 'sticky', top: 0, zIndex: 1 }}>
                  <tr>
                    <th style={{ width: 45, textAlign: 'center' }}>STT</th>
                    <th style={{ width: 70, textAlign: 'center' }}>Thao tác</th>
                    <th>Ứng Dụng</th>
                    <th>Lý Do</th>
                    <th>Loại PM</th>
                    <th>Trạng Thái</th>
                    <th>Ngày Cài Đặt</th>
                    <th>Ghi Chú</th>
                  </tr>
                </thead>
                <tbody>
                  {viewingUserObj.apps.map((app, localIdx) => {
                    const origIdx = viewingUserObj.origIndices[localIdx]
                    return (
                      <tr key={origIdx}>
                        <td style={{ textAlign: 'center' }}>{localIdx + 1}</td>
                        <td style={{ textAlign: 'center' }}>
                          <div className="action-buttons" style={{ justifyContent: 'center' }}>
                            <button className="btn btn-ghost btn-icon text-muted" onClick={() => { setEditRow({ ...app }); setEditOrigIdx(origIdx); }}>
                              <Edit2 size={13} />
                            </button>
                            <button className="btn btn-ghost btn-icon text-muted hover-danger" onClick={() => handleDeleteSingle(origIdx)}>
                              <Trash2 size={13} />
                            </button>
                          </div>
                        </td>
                        <td style={{ fontWeight: 500 }}>{app.UngDung}</td>
                        <td>{app.LyDo}</td>
                        <td>{getCategoryBadge(app.LoaiPhanMem)}</td>
                        <td>{getStatusBadge(app.TrangThai)}</td>
                        <td>{app.NgayCaiDat}</td>
                        <td>{app.GhiChu}</td>
                      </tr>
                    )
                  })}
                  {viewingUserObj.apps.length === 0 && (
                    <tr>
                      <td colSpan={8} style={{ textAlign: 'center', padding: '30px' }}>
                        User này hiện chưa có ứng dụng nào.
                      </td>
                    </tr>
                  )}
                </tbody>
              </table>
            </div>
          </div>
        )}
      </Modal>

      {/* Add Modal */}
      <Modal
        title="Thêm Ứng Dụng Mới"
        icon={<AppWindow size={16} />}
        isOpen={showAdd}
        onClose={() => setShowAdd(false)}
        footer={
          <>
            <button className="btn btn-secondary" onClick={() => setShowAdd(false)}>Hủy</button>
            <button className="btn btn-primary" onClick={handleAdd}>Lưu Thêm Mới</button>
          </>
        }
      >
        <div style={{ marginBottom: 16, padding: '8px 12px', background: 'var(--bg-secondary)', borderRadius: 8, display: 'flex', alignItems: 'center', gap: 8 }}>
          <input 
            type="checkbox" 
            id="chkDefaults" 
            checked={addDefaults} 
            onChange={e => setAddDefaults(e.target.checked)} 
            style={{ width: 16, height: 16, cursor: 'pointer' }}
          />
          <label htmlFor="chkDefaults" style={{ cursor: 'pointer', fontSize: 13, fontWeight: 500, color: 'var(--text-primary)' }}>
            Tự động tạo danh sách Ứng dụng mặc định (Office, Chrome, Unikey, v.v...)
          </label>
        </div>
        <div className="form-grid">
          {FORM_FIELDS.map(field => (
            <div key={field} className="form-group" style={field === 'LyDo' || field === 'GhiChu' ? { gridColumn: 'span 2' } : {}}>
              <label className="form-label">{DISPLAY_LABELS[field] || field}</label>
              {field === 'LoaiPhanMem' ? (
                <select
                  className="form-input"
                  value={newRow[field] || 'Miễn phí'}
                  onChange={e => setNewRow({ ...newRow, [field]: e.target.value })}
                >
                  <option value="Bản quyền">Bản quyền</option>
                  <option value="Miễn phí">Miễn phí</option>
                  <option value="Nội bộ">Nội bộ</option>
                  <option value="Khác">Khác</option>
                </select>
              ) : field === 'TrangThai' ? (
                <select
                  className="form-input"
                  value={newRow[field] || 'Đang sử dụng'}
                  onChange={e => setNewRow({ ...newRow, [field]: e.target.value })}
                >
                  <option value="Đang sử dụng">Đang sử dụng</option>
                  <option value="Đã gỡ bỏ">Đã gỡ bỏ</option>
                  <option value="Cần kiểm tra">Cần kiểm tra</option>
                </select>
              ) : field === 'NgayCaiDat' ? (
                <input
                  type="date"
                  className="form-input"
                  value={newRow[field] || getTodayDateStr()}
                  onChange={e => setNewRow({ ...newRow, [field]: e.target.value })}
                />
              ) : field === 'Owner' || field === 'PhongBan' || field === 'May' ? (
                <input
                  type="text"
                  list={field === 'Owner' ? 'owner-list' : field === 'PhongBan' ? 'dept-list' : 'machine-list'}
                  className="form-input"
                  placeholder={`Nhập hoặc chọn ${DISPLAY_LABELS[field] || field}...`}
                  value={newRow[field] || ''}
                  onChange={e => setNewRow({ ...newRow, [field]: e.target.value })}
                />
              ) : field === 'UngDung' ? (
                <input
                  type="text"
                  list="app-list"
                  className="form-input"
                  placeholder={`Nhập hoặc chọn ${DISPLAY_LABELS[field]}...`}
                  value={newRow[field] || ''}
                  onChange={e => setNewRow({ ...newRow, [field]: e.target.value })}
                />
              ) : (
                <input
                  type="text"
                  className="form-input"
                  placeholder={`Nhập ${DISPLAY_LABELS[field] || field}...`}
                  value={newRow[field] || ''}
                  onChange={e => setNewRow({ ...newRow, [field]: e.target.value })}
                />
              )}
            </div>
          ))}
        </div>
      </Modal>

      {/* Edit Modal */}
      <Modal
        title="Chỉnh Sửa Ứng Dụng"
        icon={<Edit2 size={16} />}
        isOpen={!!editRow}
        onClose={() => setEditRow(null)}
        footer={
          <>
            <button className="btn btn-secondary" onClick={() => setEditRow(null)}>Hủy</button>
            <button className="btn btn-primary" onClick={handleUpdate}>Lưu Thay Đổi</button>
          </>
        }
      >
        {editRow && (
          <div className="form-grid">
            {FORM_FIELDS.map(field => (
              <div key={field} className="form-group" style={field === 'LyDo' || field === 'GhiChu' ? { gridColumn: 'span 2' } : {}}>
                <label className="form-label">{DISPLAY_LABELS[field] || field}</label>
                {field === 'LoaiPhanMem' ? (
                  <select
                    className="form-input"
                    value={editRow[field] || 'Miễn phí'}
                    onChange={e => setEditRow({ ...editRow, [field]: e.target.value })}
                  >
                    <option value="Bản quyền">Bản quyền</option>
                    <option value="Miễn phí">Miễn phí</option>
                    <option value="Nội bộ">Nội bộ</option>
                    <option value="Khác">Khác</option>
                  </select>
                ) : field === 'TrangThai' ? (
                  <select
                    className="form-input"
                    value={editRow[field] || 'Đang sử dụng'}
                    onChange={e => setEditRow({ ...editRow, [field]: e.target.value })}
                  >
                    <option value="Đang sử dụng">Đang sử dụng</option>
                    <option value="Đã gỡ bỏ">Đã gỡ bỏ</option>
                    <option value="Cần kiểm tra">Cần kiểm tra</option>
                  </select>
                ) : field === 'NgayCaiDat' ? (
                  <input
                    type="date"
                    className="form-input"
                    value={editRow[field] || getTodayDateStr()}
                    onChange={e => setEditRow({ ...editRow, [field]: e.target.value })}
                  />
                ) : field === 'Owner' || field === 'PhongBan' || field === 'May' ? (
                  <input
                    type="text"
                    list={field === 'Owner' ? 'owner-list' : field === 'PhongBan' ? 'dept-list' : 'machine-list'}
                    className="form-input"
                    placeholder={`Nhập hoặc chọn ${DISPLAY_LABELS[field] || field}...`}
                    value={editRow[field] || ''}
                    onChange={e => setEditRow({ ...editRow, [field]: e.target.value })}
                  />
                ) : field === 'UngDung' ? (
                  <input
                    type="text"
                    list="app-list"
                    className="form-input"
                    placeholder={`Nhập hoặc chọn ${DISPLAY_LABELS[field]}...`}
                    value={editRow[field] || ''}
                    onChange={e => setEditRow({ ...editRow, [field]: e.target.value })}
                  />
                ) : (
                  <input
                    type="text"
                    className="form-input"
                    placeholder={`Nhập ${DISPLAY_LABELS[field] || field}...`}
                    value={editRow[field] || ''}
                    onChange={e => setEditRow({ ...editRow, [field]: e.target.value })}
                  />
                )}
              </div>
            ))}
          </div>
        )}
      </Modal>

      {/* Datalist for suggestions */}
      <datalist id="app-list">
        {DEFAULT_APPS.map(app => <option key={app} value={app}>Mặc định</option>)}
        {EXTERNAL_APPS.map(app => <option key={app} value={app}>External</option>)}
      </datalist>
    </div>
  )
}
