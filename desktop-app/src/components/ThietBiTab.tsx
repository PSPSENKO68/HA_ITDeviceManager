import { useState, useMemo } from 'react'
import { Monitor, Search, Plus, Edit2, Trash2, ArrowRightLeft, Wrench, Archive, Eye, History } from 'lucide-react'
import { Modal } from './Modal'

interface ThietBiTabProps {
  data: any[]
  lichSu: any[]
  activeSubTab?: 'all' | 'pc' | 'network'
  onSave: (updates: Record<string, any[]>) => void
}

const HEADERS = [
  'STT', 'PhongBan', 'Owner', 'PhanLoai', 'Model', 'SerialNumber', 'OS', 'CPU', 'RAM',
  'HardDisk', 'Ransomeware Protection', 'Outlook Storage', 'Thoi gian dau tu', 'HSD ban dau',
  'Thoi gian bao tri', 'HSD gia han', 'Nien han ban dau', 'Nien han gia han',
  'Phan hoi thuc te cua nguoi dung', 'Danh gia khi bao tri', 'Khuyen nghi IT',
  'Chi phi du kien', 'Hien trang', 'Cap nhat may', 'KichHoat'
]

const DISPLAY_LABELS: Record<string, string> = {
  STT: 'STT', PhongBan: 'Phòng Ban', Owner: 'Owner', PhanLoai: 'Phân Loại',
  Model: 'Model', SerialNumber: 'Serial Number', OS: 'OS', CPU: 'CPU', RAM: 'RAM',
  HardDisk: 'Hard Disk', 'Ransomeware Protection': 'Ransomware', 'Outlook Storage': 'Outlook',
  'Thoi gian dau tu': 'TG đầu tư', 'HSD ban dau': 'HSD ban đầu',
  'Thoi gian bao tri': 'TG bảo trì', 'HSD gia han': 'HSD gia hạn',
  'Nien han ban dau': 'Niên hạn BĐ', 'Nien han gia han': 'Niên hạn GH',
  'Phan hoi thuc te cua nguoi dung': 'Phản hồi NSD', 'Danh gia khi bao tri': 'Đánh giá BT',
  'Khuyen nghi IT': 'Khuyến nghị IT', 'Chi phi du kien': 'Chi phí DK',
  'Hien trang': 'Hiện trạng', 'Cap nhat may': 'Cập nhật máy', KichHoat: 'Kích hoạt'
}

const FORM_FIELDS = HEADERS.filter(h => h !== 'STT')

const now = () => new Date().toLocaleString('vi-VN')

function getBadge(val: any) {
  const s = String(val || '').trim().toLowerCase()
  if (!s) return null
  if (s === 'enabled' || s === 'x' || s === 'yes' || s === '1' || s === 'true' || s === 'có' || s === 'kích hoạt' || s === 'enable')
    return <span className="badge badge-green">✓ Enabled</span>
  if (s === 'disabled' || s === 'không' || s === 'no' || s === '0' || s === 'false' || s === 'disable')
    return <span className="badge badge-red">✗ Disabled</span>
  return <span className="badge badge-gray">{val}</span>
}

function getStatusBadge(val: any) {
  const s = String(val || '').trim().toLowerCase()
  if (!s) return null
  if (s === 'enabled') return <span className="badge badge-green">Enabled</span>
  if (s === 'disabled') return <span className="badge badge-red">Disabled</span>
  if (s.includes('sửa chữa') || s.includes('hỏng') || s.includes('lỗi'))
    return <span className="badge badge-red">{val}</span>
  if (s.includes('lưu kho') || s.includes('kho'))
    return <span className="badge badge-purple">{val}</span>
  if (s.includes('chờ') || s.includes('bảo trì'))
    return <span className="badge badge-yellow">{val}</span>
  return <span className="badge badge-green">{val}</span>
}

export function ThietBiTab({ data, lichSu, activeSubTab = 'all', onSave }: ThietBiTabProps) {
  const [search, setSearch] = useState('')
  const [filters, setFilters] = useState<Record<string, string>>({})
  const [selected, setSelected] = useState<Set<number>>(new Set())
  const [editRow, setEditRow] = useState<any | null>(null)
  const [editIdx, setEditIdx] = useState(-1)
  const [showAdd, setShowAdd] = useState(false)
  const [newRow, setNewRow] = useState<any>({})
  
  // History View
  const [viewHistoryRow, setViewHistoryRow] = useState<any | null>(null)

  // Handover
  const [showHandover, setShowHandover] = useState(false)
  const [handoverData, setHandoverData] = useState({ PhongBan: '', Owner: '', GhiChu: '' })
  
  // Repair
  const [showRepair, setShowRepair] = useState(false)
  const [repairIdx, setRepairIdx] = useState(-1)
  const [repairNote, setRepairNote] = useState('')
  const [repairCost, setRepairCost] = useState('')
  
  // Lưu kho
  const [showLuuKho, setShowLuuKho] = useState(false)
  const [luuKhoNote, setLuuKhoNote] = useState('')

  const filtered = useMemo(() => {
    let result = data

    if (activeSubTab !== 'all') {
      const pcKeywords = ['laptop', 'desktop', 'pc', 'macbook', 'mac', 'workstation', 'computer', 'notebook', 'nuc']
      const networkKeywords = ['server', 'router', 'wifi', 'switch', 'camera', 'controller', 'firewall', 'hub', 'nas', 'ups', 'access point', 'tổng đài', 'ip phone', 'gateway']
      
      result = result.filter(row => {
        const phanLoai = String(row.PhanLoai || '').toLowerCase()
        if (activeSubTab === 'pc') {
          return pcKeywords.some(kw => phanLoai.includes(kw))
        } else if (activeSubTab === 'network') {
          return networkKeywords.some(kw => phanLoai.includes(kw))
        }
        return true
      })
    }

    if (search.trim()) {
      const q = search.toLowerCase()
      result = result.filter(row =>
        Object.values(row).some(v => String(v || '').toLowerCase().includes(q))
      )
    }
    Object.keys(filters).forEach(k => {
      const fv = filters[k].toLowerCase()
      if (fv) {
        result = result.filter(row => String(row[k] || '').toLowerCase().includes(fv))
      }
    })
    return result
  }, [data, search, filters, activeSubTab])

  const toggleSelect = (i: number) => {
    const next = new Set(selected)
    next.has(i) ? next.delete(i) : next.add(i)
    setSelected(next)
  }

  const toggleSelectAll = () => {
    if (selected.size === filtered.length) setSelected(new Set())
    else setSelected(new Set(filtered.map((_, i) => data.indexOf(filtered[i]))))
  }

  const addHistory = (entries: any[]) => {
    const updated = [...lichSu]
    entries.forEach(entry => {
      updated.push({ STT: updated.length + 1, Ngay: now(), ...entry })
    })
    return updated
  }

  const handleAdd = () => {
    const row: any = {}
    HEADERS.forEach(h => row[h] = newRow[h] || '')
    row.STT = data.length + 1
    const updatedData = [...data, row]
    updatedData.forEach((r, i) => r.STT = i + 1)
    onSave({ ThietBi: updatedData })
    setShowAdd(false)
    setNewRow({})
  }

  const handleEdit = () => {
    if (editIdx < 0 || !editRow) return
    const updatedData = [...data]
    updatedData[editIdx] = { ...editRow }
    onSave({ ThietBi: updatedData })
    setEditRow(null)
    setEditIdx(-1)
  }

  const handleDelete = () => {
    if (selected.size === 0) return
    if (!confirm(`Bạn có chắc muốn xóa ${selected.size} thiết bị?`)) return
    const indices = Array.from(selected)
    const updatedData = data.filter((_, i) => !indices.includes(i))
    updatedData.forEach((r, i) => r.STT = i + 1)
    onSave({ ThietBi: updatedData })
    setSelected(new Set())
  }

  const handleHandover = () => {
    if (selected.size === 0) return
    const updatedData = [...data]
    const historyEntries: any[] = []
    selected.forEach(i => {
      const row = updatedData[i]
      historyEntries.push({
        LoaiHanhDong: 'Bàn giao',
        ThietBi_STT: row.STT,
        ThietBi_Model: row.Model || '',
        ThietBi_Serial: row.SerialNumber || '',
        ChiTiet: handoverData.GhiChu || `Bàn giao sang ${handoverData.PhongBan}/${handoverData.Owner}`,
        PhongBan_Cu: row.PhongBan || '',
        PhongBan_Moi: handoverData.PhongBan || '',
        Owner_Cu: row.Owner || '',
        Owner_Moi: handoverData.Owner || '',
        ChiPhi: '',
        NguoiThucHien: ''
      })
      if (handoverData.PhongBan) row.PhongBan = handoverData.PhongBan
      if (handoverData.Owner) row.Owner = handoverData.Owner
      if (row['Hien trang'] === 'Lưu kho') row['Hien trang'] = 'Enabled'
    })
    const updatedHistory = addHistory(historyEntries)
    onSave({ ThietBi: updatedData, LichSu: updatedHistory })
    setShowHandover(false)
    setHandoverData({ PhongBan: '', Owner: '', GhiChu: '' })
    setSelected(new Set())
  }

  const handleRepair = () => {
    if (repairIdx < 0) return
    const updatedData = [...data]
    const row = updatedData[repairIdx]
    const historyEntries = [{
      LoaiHanhDong: 'Sửa chữa',
      ThietBi_STT: row.STT,
      ThietBi_Model: row.Model || '',
      ThietBi_Serial: row.SerialNumber || '',
      ChiTiet: repairNote || 'Ghi nhận sửa chữa',
      PhongBan_Cu: row.PhongBan || '',
      PhongBan_Moi: row.PhongBan || '',
      Owner_Cu: row.Owner || '',
      Owner_Moi: row.Owner || '',
      ChiPhi: repairCost || '',
      NguoiThucHien: ''
    }]
    row['Hien trang'] = 'Sửa chữa'
    row['Thoi gian bao tri'] = new Date().toLocaleDateString('vi-VN')
    row['Danh gia khi bao tri'] = repairNote
    row['Chi phi du kien'] = repairCost
    const updatedHistory = addHistory(historyEntries)
    onSave({ ThietBi: updatedData, LichSu: updatedHistory })
    setShowRepair(false)
    setRepairIdx(-1)
    setRepairNote('')
    setRepairCost('')
  }

  const handleLuuKho = () => {
    if (selected.size === 0) return
    const updatedData = [...data]
    const historyEntries: any[] = []
    selected.forEach(i => {
      const row = updatedData[i]
      historyEntries.push({
        LoaiHanhDong: 'Lưu kho',
        ThietBi_STT: row.STT,
        ThietBi_Model: row.Model || '',
        ThietBi_Serial: row.SerialNumber || '',
        ChiTiet: luuKhoNote || 'Chuyển sang lưu kho',
        PhongBan_Cu: row.PhongBan || '',
        PhongBan_Moi: 'Kho',
        Owner_Cu: row.Owner || '',
        Owner_Moi: '',
        ChiPhi: '',
        NguoiThucHien: ''
      })
      row['Hien trang'] = 'Lưu kho'
    })
    const updatedHistory = addHistory(historyEntries)
    onSave({ ThietBi: updatedData, LichSu: updatedHistory })
    setShowLuuKho(false)
    setLuuKhoNote('')
    setSelected(new Set())
  }

  const uniqueDepts = useMemo(() => Array.from(new Set(data.map(r => r.PhongBan).filter(Boolean))), [data])
  const uniquePhanLoai = useMemo(() => Array.from(new Set(data.map(r => r.PhanLoai).filter(Boolean))), [data])
  const uniqueOwners = useMemo(() => Array.from(new Set(data.map(r => r.Owner).filter(Boolean))), [data])

  const handleRowChange = (row: any, setRow: any, field: string, val: string) => {
    const next = { ...row, [field]: val }
    if (field === 'Thoi gian dau tu' || field === 'HSD ban dau') {
      const d1 = next['Thoi gian dau tu']
      const d2 = next['HSD ban dau']
      if (d1 && d2) {
        const p1 = d1.split('/')
        const p2 = d2.split('/')
        if (p1.length === 3 && p2.length === 3) {
          const date1 = new Date(`${p1[2]}-${p1[1]}-${p1[0]}`)
          const date2 = new Date(`${p2[2]}-${p2[1]}-${p2[0]}`)
          let years = date2.getFullYear() - date1.getFullYear()
          if (date2.getMonth() < date1.getMonth() || (date2.getMonth() === date1.getMonth() && date2.getDate() < date1.getDate())) {
            years--
          }
          next['Nien han ban dau'] = years < 3 ? 'Đã hết hạn' : 'Còn hạn'
        }
      }
    }
    setRow(next)
  }

  const renderFormField = (field: string, value: any, onChange: (val: string) => void) => {
    if (field === 'KichHoat') {
      return (
        <select className="form-select" value={value || ''} onChange={e => onChange(e.target.value)}>
          <option value="">-- Chọn --</option>
          <option value="Enabled">Enabled</option>
          <option value="Disabled">Disabled</option>
        </select>
      )
    }
    if (field === 'Hien trang') {
      return (
        <select className="form-select" value={value || ''} onChange={e => onChange(e.target.value)}>
          <option value="">-- Chọn --</option>
          <option value="Enabled">Enabled</option>
          <option value="Disabled">Disabled</option>
          <option value="Lưu kho">Lưu kho</option>
          <option value="Sửa chữa">Sửa chữa</option>
        </select>
      )
    }
    if (field === 'Nien han gia han') {
      return (
        <select className="form-select" value={value || ''} onChange={e => onChange(e.target.value)}>
          <option value="">-- Chọn --</option>
          <option value="Đã được gia hạn">Đã được gia hạn</option>
          <option value="Chưa được gia hạn">Chưa được gia hạn</option>
        </select>
      )
    }
    if (field === 'PhongBan') {
      return (
        <select className="form-select" value={value || ''} onChange={e => onChange(e.target.value)}>
          <option value="">-- Chọn phòng ban --</option>
          {uniqueDepts.map(d => <option key={d as string} value={d as string}>{d as string}</option>)}
        </select>
      )
    }
    if (field === 'PhanLoai') {
      return (
        <select className="form-select" value={value || ''} onChange={e => onChange(e.target.value)}>
          <option value="">-- Chọn loại --</option>
          {uniquePhanLoai.map(d => <option key={d as string} value={d as string}>{d as string}</option>)}
        </select>
      )
    }
    return (
      <input className="form-input" value={value || ''} onChange={e => onChange(e.target.value)} />
    )
  }

  return (
    <div>
      <div className="page-header">
        <div>
          <h1 className="page-title"><Monitor size={20} /> Thiết bị CNTT</h1>
          <div className="stats-bar" style={{ marginTop: 4 }}>
            <span>Tổng: <strong>{data.length}</strong></span>
            <span>Hiển thị: <strong>{filtered.length}</strong></span>
          </div>
        </div>
        <div className="header-actions">
          <div className="search-bar">
            <Search size={14} />
            <input placeholder="Tìm kiếm chung..." value={search} onChange={e => setSearch(e.target.value)} />
          </div>
          <button className="btn btn-primary btn-sm" onClick={() => setShowAdd(true)}>
            <Plus size={14} /> Thêm mới
          </button>
        </div>
      </div>

      {selected.size > 0 && (
        <div className="selected-bar">
          <span>Đã chọn <strong>{selected.size}</strong> thiết bị</span>
          <button className="btn btn-primary btn-sm" onClick={() => setShowHandover(true)}>
            <ArrowRightLeft size={13} /> Bàn giao
          </button>
          <button className="btn btn-warning btn-sm" onClick={() => setShowLuuKho(true)}>
            <Archive size={13} /> Lưu kho
          </button>
          <button className="btn btn-danger btn-sm" onClick={handleDelete}>
            <Trash2 size={13} /> Xóa
          </button>
        </div>
      )}

      <div className="table-wrapper">
        <table className="data-table">
          <thead>
            <tr>
              <th className="col-sticky col-checkbox" rowSpan={2}>
                <input type="checkbox" className="row-checkbox"
                  checked={selected.size === filtered.length && filtered.length > 0}
                  onChange={toggleSelectAll} />
              </th>
              <th className="col-sticky col-actions" rowSpan={2} style={{ left: 44 }}>Thao tác</th>
              {HEADERS.map(h => (
                <th key={h} style={h === 'STT' ? { width: 45, minWidth: 45, maxWidth: 55, textAlign: 'center' } : undefined}>
                  {DISPLAY_LABELS[h] || h}
                </th>
              ))}
            </tr>
            <tr className="filter-row">
              {HEADERS.map(h => (
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
            {filtered.length === 0 ? (
              <tr>
                <td colSpan={HEADERS.length + 2} style={{ textAlign: 'center', padding: '60px 20px' }}>
                  <div className="empty-state-icon">📭</div>
                  <h3 style={{ marginBottom: 4, color: 'var(--text-primary)' }}>Không có dữ liệu</h3>
                  <p className="text-muted">Thử thay đổi từ khóa tìm kiếm hoặc bỏ bộ lọc.</p>
                </td>
              </tr>
            ) : (
              filtered.map((row, i) => {
                const realIdx = data.indexOf(row)
                return (
                  <tr key={i}>
                    <td className="col-sticky col-checkbox">
                      <input type="checkbox" className="row-checkbox" checked={selected.has(realIdx)} onChange={() => toggleSelect(realIdx)} />
                    </td>
                    <td className="col-sticky" style={{ left: 44, background: 'var(--bg-card)' }}>
                      <div className="action-cell">
                        <button className="btn btn-ghost btn-icon" title="Xem lịch sử"
                          onClick={() => setViewHistoryRow(row)}>
                          <Eye size={14} />
                        </button>
                        <button className="btn btn-ghost btn-icon" title="Sửa"
                          onClick={() => { setEditRow({ ...row }); setEditIdx(realIdx); }}>
                          <Edit2 size={14} />
                        </button>
                        <button className="btn btn-ghost btn-icon" title="Sửa chữa"
                          onClick={() => { setRepairIdx(realIdx); setShowRepair(true); }}>
                          <Wrench size={14} />
                        </button>
                      </div>
                    </td>
                    {HEADERS.map(h => (
                      <td key={h} style={h === 'STT' ? { textAlign: 'center', width: 45 } : undefined}>
                        {h === 'KichHoat' ? (getBadge(row[h]) || row[h])
                         : h === 'Hien trang' ? (getStatusBadge(row[h]) || row[h])
                         : (row[h] ?? '')}
                      </td>
                    ))}
                  </tr>
                )
              })
            )}
          </tbody>
        </table>
      </div>

      {/* Modals... */}
      <Modal title="Thêm thiết bị mới" icon={<Plus size={16} />} isOpen={showAdd} onClose={() => setShowAdd(false)} wide
        footer={<><button className="btn btn-secondary" onClick={() => setShowAdd(false)}>Hủy</button><button className="btn btn-primary" onClick={handleAdd}>Lưu</button></>}>
        <div className="form-grid">
          {FORM_FIELDS.map(f => (
            <div className="form-group" key={f}>
              <label className="form-label">{DISPLAY_LABELS[f] || f}</label>
              {renderFormField(f, newRow[f], (val) => handleRowChange(newRow, setNewRow, f, val))}
            </div>
          ))}
        </div>
      </Modal>

      <Modal title="Sửa thông tin thiết bị" icon={<Edit2 size={16} />} isOpen={editRow !== null} onClose={() => setEditRow(null)} wide
        footer={<><button className="btn btn-secondary" onClick={() => setEditRow(null)}>Hủy</button><button className="btn btn-primary" onClick={handleEdit}>Lưu thay đổi</button></>}>
        {editRow && (
          <div className="form-grid">
            {FORM_FIELDS.map(f => (
              <div className="form-group" key={f}>
                <label className="form-label">{DISPLAY_LABELS[f] || f}</label>
                {renderFormField(f, editRow[f], (val) => handleRowChange(editRow, setEditRow, f, val))}
              </div>
            ))}
          </div>
        )}
      </Modal>

      <Modal title="Bàn giao thiết bị" icon={<ArrowRightLeft size={16} />} isOpen={showHandover} onClose={() => setShowHandover(false)}
        footer={<><button className="btn btn-secondary" onClick={() => setShowHandover(false)}>Hủy</button><button className="btn btn-primary" onClick={handleHandover}>Xác nhận bàn giao</button></>}>
        <p className="text-secondary" style={{ marginBottom: 16, fontSize: 13 }}>
          Bàn giao <strong className="text-primary">{selected.size}</strong> thiết bị sang Phòng Ban / Owner mới. Lịch sử sẽ được ghi lại tự động.
        </p>
        <div className="form-grid">
          <div className="form-group">
            <label className="form-label">Phòng Ban mới</label>
            <select className="form-select" value={handoverData.PhongBan} onChange={e => setHandoverData({ ...handoverData, PhongBan: e.target.value })}>
              <option value="">-- Chọn phòng ban --</option>
              {uniqueDepts.map(d => <option key={d as string} value={d as string}>{d as string}</option>)}
            </select>
          </div>
          <div className="form-group">
            <label className="form-label">Owner mới</label>
            <input 
              className="form-input" 
              list="owner-list"
              placeholder="Chọn hoặc nhập tên người nhận mới" 
              value={handoverData.Owner} 
              onChange={e => setHandoverData({ ...handoverData, Owner: e.target.value })} 
            />
            <datalist id="owner-list">
              {uniqueOwners.map(o => <option key={o as string} value={o as string} />)}
            </datalist>
          </div>
          <div className="form-group full-width">
            <label className="form-label">Ghi chú</label>
            <textarea className="form-input" rows={2} placeholder="Lý do bàn giao..." value={handoverData.GhiChu} onChange={e => setHandoverData({ ...handoverData, GhiChu: e.target.value })} />
          </div>
        </div>
      </Modal>

      <Modal title="Ghi nhận sửa chữa" icon={<Wrench size={16} />} isOpen={showRepair} onClose={() => { setShowRepair(false); setRepairIdx(-1); }}
        footer={<><button className="btn btn-secondary" onClick={() => setShowRepair(false)}>Hủy</button><button className="btn btn-warning" onClick={handleRepair}>Xác nhận sửa chữa</button></>}>
        <p className="text-secondary" style={{ marginBottom: 16, fontSize: 13 }}>
          Cập nhật trạng thái thành <strong style={{ color: 'var(--color-red)' }}>"Sửa chữa"</strong>. Lịch sử sẽ được ghi lại tự động.
        </p>
        <div className="form-grid">
          <div className="form-group full-width">
            <label className="form-label">Ghi chú bảo trì / Đánh giá</label>
            <textarea className="form-input" rows={3} placeholder="Mô tả tình trạng sửa chữa..." value={repairNote} onChange={e => setRepairNote(e.target.value)} />
          </div>
          <div className="form-group">
            <label className="form-label">Chi phí sửa chữa (VNĐ)</label>
            <input className="form-input" type="text" placeholder="VD: 500,000" value={repairCost} onChange={e => setRepairCost(e.target.value)} />
          </div>
        </div>
      </Modal>

      <Modal title="Chuyển lưu kho" icon={<Archive size={16} />} isOpen={showLuuKho} onClose={() => setShowLuuKho(false)}
        footer={<><button className="btn btn-secondary" onClick={() => setShowLuuKho(false)}>Hủy</button><button className="btn btn-warning" onClick={handleLuuKho}>Xác nhận lưu kho</button></>}>
        <p className="text-secondary" style={{ marginBottom: 16, fontSize: 13 }}>
          Chuyển <strong className="text-primary">{selected.size}</strong> thiết bị sang trạng thái <strong style={{ color: 'var(--color-purple)' }}>"Lưu kho"</strong>. Lịch sử sẽ được ghi lại.
        </p>
        <div className="form-group">
          <label className="form-label">Ghi chú</label>
          <textarea className="form-input" rows={2} placeholder="Lý do lưu kho..." value={luuKhoNote} onChange={e => setLuuKhoNote(e.target.value)} />
        </div>
      </Modal>

      <Modal title={`Lịch sử thiết bị: ${viewHistoryRow?.Model}`} icon={<History size={16} />} isOpen={viewHistoryRow !== null} onClose={() => setViewHistoryRow(null)} wide>
        {(() => {
          if (!viewHistoryRow) return null
          const history = lichSu.filter(h => h.ThietBi_STT === viewHistoryRow.STT)
          if (history.length === 0) {
            return (
              <div className="empty-state" style={{ padding: '40px 20px' }}>
                <div className="empty-state-icon">📝</div>
                <h3 style={{ marginBottom: 4, color: 'var(--text-primary)' }}>Chưa có lịch sử</h3>
                <p className="text-muted">Thiết bị này chưa có hoạt động sửa chữa hay bàn giao nào.</p>
              </div>
            )
          }
          return (
            <div className="table-wrapper" style={{ maxHeight: 400 }}>
              <table className="data-table">
                <thead>
                  <tr>
                    <th>Ngày</th>
                    <th>Loại Hành Động</th>
                    <th>Từ</th>
                    <th>Đến</th>
                    <th>Chi tiết / Đánh giá</th>
                    <th>Chi phí</th>
                  </tr>
                </thead>
                <tbody>
                  {history.map((h, i) => (
                    <tr key={i}>
                      <td>{h.Ngay}</td>
                      <td>
                        {h.LoaiHanhDong === 'Bàn giao' ? <span className="badge badge-blue">Bàn giao</span> :
                         h.LoaiHanhDong === 'Sửa chữa' ? <span className="badge badge-red">Sửa chữa</span> :
                         h.LoaiHanhDong === 'Lưu kho' ? <span className="badge badge-purple">Lưu kho</span> :
                         <span className="badge badge-gray">{h.LoaiHanhDong}</span>}
                      </td>
                      <td>
                        {h.PhongBan_Cu || h.Owner_Cu ? `${h.PhongBan_Cu}${h.Owner_Cu ? ` / ${h.Owner_Cu}` : ''}` : '-'}
                      </td>
                      <td>
                        {h.PhongBan_Moi || h.Owner_Moi ? `${h.PhongBan_Moi}${h.Owner_Moi ? ` / ${h.Owner_Moi}` : ''}` : '-'}
                      </td>
                      <td style={{ whiteSpace: 'normal', minWidth: 200 }}>{h.ChiTiet}</td>
                      <td className={h.ChiPhi ? 'text-red' : ''}>{h.ChiPhi ? `-${Number(h.ChiPhi).toLocaleString('vi-VN')}đ` : '-'}</td>
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>
          )
        })()}
      </Modal>
    </div>
  )
}
