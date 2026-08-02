import { useState, useMemo } from 'react'
import { Key, Search, Plus, Edit2, Trash2 } from 'lucide-react'
import { Modal } from './Modal'

interface LicenseTabProps {
  data: any[]
  allDevices?: any[]
  onSave: (sheetName: string, data: any[]) => void
}

const HEADERS = ['STT', 'DeviceID', 'Owner', 'PhongBan', 'ActiveAccount', 'DomainMail', 'LocalDomain', 'KichHoat']
const DISPLAY_LABELS: Record<string, string> = {
  STT: 'STT', DeviceID: 'Serial Number', Owner: 'Owner', PhongBan: 'Phòng Ban',
  ActiveAccount: 'Active Account', DomainMail: 'Domain Mail', LocalDomain: 'Local Domain', KichHoat: 'Kích hoạt'
}
const FORM_FIELDS = HEADERS.filter(h => h !== 'STT')

function getBadge(val: any) {
  const s = String(val || '').trim().toLowerCase()
  if (!s) return null
  if (s === 'enabled' || s === 'x' || s === 'yes' || s === '1' || s === 'có' || s === 'kích hoạt' || s === 'enable')
    return <span className="badge badge-green">✓ Enabled</span>
  if (s === 'disabled' || s === 'không' || s === 'no' || s === '0' || s === 'disable')
    return <span className="badge badge-red">✗ Disabled</span>
  return <span className="badge badge-gray">{val}</span>
}

export function LicenseTab({ data, allDevices = [], onSave }: LicenseTabProps) {
  const [search, setSearch] = useState('')
  const [filters, setFilters] = useState<Record<string, string>>({})
  const [selected, setSelected] = useState<Set<number>>(new Set())
  const [editRow, setEditRow] = useState<any | null>(null)
  const [editIdx, setEditIdx] = useState(-1)
  const [showAdd, setShowAdd] = useState(false)
  const [newRow, setNewRow] = useState<any>({})

  const filtered = useMemo(() => {
    let result = data
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
  }, [data, search, filters])

  const toggleSelect = (i: number) => {
    const next = new Set(selected)
    next.has(i) ? next.delete(i) : next.add(i)
    setSelected(next)
  }

  const toggleSelectAll = () => {
    selected.size === filtered.length ? setSelected(new Set()) : setSelected(new Set(filtered.map((_, i) => data.indexOf(filtered[i]))))
  }

  const handleAdd = () => {
    const row: any = {}
    HEADERS.forEach(h => row[h] = newRow[h] || '')
    row.STT = data.length + 1
    const updated = [...data, row]
    updated.forEach((r, i) => r.STT = i + 1)
    onSave('License', updated)
    setShowAdd(false)
    setNewRow({})
  }

  const handleEdit = () => {
    if (editIdx < 0 || !editRow) return
    const updated = [...data]
    updated[editIdx] = { ...editRow }
    onSave('License', updated)
    setEditRow(null)
    setEditIdx(-1)
  }

  const handleDelete = () => {
    if (selected.size === 0) return
    if (!confirm(`Bạn có chắc muốn xóa ${selected.size} license?`)) return
    const indices = Array.from(selected)
    const updated = data.filter((_, i) => !indices.includes(i))
    updated.forEach((r, i) => r.STT = i + 1)
    onSave('License', updated)
    setSelected(new Set())
  }

  const uniqueDepts = useMemo(() => {
    const list = (allDevices.length > 0 ? allDevices : data).map(r => r.PhongBan).filter(Boolean)
    return Array.from(new Set(list))
  }, [data, allDevices])
  const uniqueOwners = useMemo(() => {
    const list = (allDevices.length > 0 ? allDevices : data).map(r => r.Owner).filter(Boolean)
    return Array.from(new Set(list))
  }, [data, allDevices])
  const uniqueSerials = useMemo(() => {
    const list = allDevices.map(r => r.SerialNumber).filter(Boolean)
    return Array.from(new Set(list))
  }, [allDevices])
  const uniqueAccounts = useMemo(() => Array.from(new Set(data.map(r => r.ActiveAccount).filter(Boolean))), [data])

  const accountStats = useMemo(() => {
    const stats: Record<string, number> = {}
    data.forEach(r => {
      const acc = String(r.ActiveAccount || '').trim()
      if (acc && acc.toLowerCase() !== 'n/a' && acc.toLowerCase() !== 'none') {
        stats[acc] = (stats[acc] || 0) + 1
      }
    })
    return Object.entries(stats).sort((a, b) => b[1] - a[1])
  }, [data])

  const renderFormField = (field: string, value: any, onChange: (val: string) => void, _rowData: any, setRowData: any) => {
    if (field === 'DeviceID') {
      return (
        <input 
          className="form-input" 
          type="text"
          list="license-serial-list"
          placeholder="Nhập hoặc chọn Serial Number..." 
          value={value || ''} 
          onChange={e => {
            const v = e.target.value
            onChange(v)
            if (v && allDevices.length > 0) {
              const matchedDevice = allDevices.find(d => String(d.SerialNumber).toLowerCase() === v.toLowerCase())
              if (matchedDevice) {
                setRowData((prev: any) => ({
                  ...prev,
                  DeviceID: matchedDevice.SerialNumber,
                  Owner: matchedDevice.Owner || prev.Owner,
                  PhongBan: matchedDevice.PhongBan || prev.PhongBan
                }))
              }
            }
          }} 
        />
      )
    }
    if (field === 'Owner') {
      return (
        <input 
          className="form-input" 
          type="text"
          list="license-owner-list"
          placeholder="Nhập hoặc chọn Owner..." 
          value={value || ''} 
          onChange={e => onChange(e.target.value)} 
        />
      )
    }
    if (field === 'PhongBan') {
      return (
        <input 
          className="form-input" 
          type="text"
          list="license-dept-list"
          placeholder="Nhập hoặc chọn Phòng Ban..." 
          value={value || ''} 
          onChange={e => onChange(e.target.value)} 
        />
      )
    }
    if (field === 'KichHoat') {
      return (
        <input 
          className="form-input" 
          type="text"
          list="license-kichhoat-list"
          placeholder="Nhập trạng thái kích hoạt..." 
          value={value || ''} 
          onChange={e => onChange(e.target.value)} 
        />
      )
    }
    if (field === 'ActiveAccount') {
      const hasPreset = uniqueAccounts.includes(value)
      return (
        <div style={{ display: 'flex', flexDirection: 'column', gap: 6 }}>
          <select 
            className="form-select" 
            value={hasPreset ? value : (value ? '__OTHER__' : '')} 
            onChange={e => {
              if (e.target.value === '__OTHER__') {
                // Keep value if already non-preset, or clear
                if (hasPreset) onChange('')
              } else {
                onChange(e.target.value)
              }
            }}
          >
            <option value="">-- Chọn tài khoản (Helpdesk / Active Account) --</option>
            {uniqueAccounts.map(acc => (
              <option key={acc as string} value={acc as string}>{acc as string}</option>
            ))}
            <option value="__OTHER__">✏️ Nhập tài khoản khác (Tùy chỉnh)...</option>
          </select>
          {(!hasPreset && value !== undefined) && (
            <input 
              className="form-input" 
              placeholder="Nhập tên tài khoản..." 
              value={value || ''} 
              onChange={e => onChange(e.target.value)} 
            />
          )}
        </div>
      )
    }
    return (
      <input className="form-input" value={value || ''} onChange={e => onChange(e.target.value)} />
    )
  }

  return (
    <div>
      <datalist id="license-serial-list">
        {uniqueSerials.map(s => <option key={s as string} value={s as string} />)}
      </datalist>
      <datalist id="license-owner-list">
        {uniqueOwners.map(o => <option key={o as string} value={o as string} />)}
      </datalist>
      <datalist id="license-dept-list">
        {uniqueDepts.map(d => <option key={d as string} value={d as string} />)}
      </datalist>
      <datalist id="license-kichhoat-list">
        <option value="Enabled" />
        <option value="Disabled" />
      </datalist>

      <div className="page-header">
        <div>
          <h1 className="page-title"><Key size={20} /> License</h1>
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

      <div className="license-dashboard" style={{ marginBottom: 16, padding: '16px 20px', background: 'transparent' }}>
        <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', marginBottom: 12 }}>
          <h3 style={{ fontSize: 13, fontWeight: 700, textTransform: 'uppercase', color: 'var(--text-primary)', margin: 0, letterSpacing: '0.5px' }}>
            Tỉ lệ sử dụng License (Tối đa 10 máy/tài khoản)
          </h3>
          <span className="badge badge-gray">{accountStats.length} tài khoản</span>
        </div>
        <div style={{ 
          display: 'grid', 
          gridTemplateColumns: 'repeat(auto-fill, minmax(360px, 1fr))', 
          gap: '12px 24px', 
          maxHeight: 200, 
          overflowY: 'auto',
          paddingRight: 6
        }}>
          {accountStats.map(([acc, count]) => {
            const isOver = count > 10;
            const percent = Math.min((count / 10) * 100, 100);
            
            const bgColor = 'var(--bg-card)';
            const textColor = 'var(--text-primary)';
            const borderColor = isOver ? 'var(--color-red)' : 'var(--border-default)';
            const barBgColor = 'rgba(0,0,0,0.05)';
            const barFillColor = isOver ? 'var(--color-red)' : 'var(--color-primary)';
            
            return (
              <div key={acc} style={{ background: bgColor, padding: '16px 20px', borderRadius: 'var(--radius-xl)', border: `1px solid ${borderColor}`, boxShadow: 'none' }}>
                <div style={{ display: 'flex', justifyContent: 'space-between', marginBottom: 10 }}>
                  <strong style={{ fontSize: 16, fontWeight: 600, color: textColor, whiteSpace: 'nowrap', overflow: 'hidden', textOverflow: 'ellipsis', maxWidth: '70%', letterSpacing: '-0.3px' }} title={acc}>
                    {acc}
                  </strong>
                  <span style={{ fontSize: 14, fontWeight: '600', color: isOver ? 'var(--color-red)' : 'var(--text-muted)' }}>
                    {isOver ? `Vượt: ${count}/10` : `${count}/10 (${Math.round(percent)}%)`}
                  </span>
                </div>
                <div style={{ height: 6, background: barBgColor, borderRadius: 3, overflow: 'hidden' }}>
                  <div style={{ 
                    height: '100%', 
                    width: `${percent}%`, 
                    background: barFillColor,
                    transition: 'width 0.3s ease',
                    borderRadius: 3
                  }} />
                </div>
              </div>
            )
          })}
        </div>
      </div>

      {selected.size > 0 && (
        <div className="selected-bar">
          <span>Đã chọn <strong>{selected.size}</strong></span>
          <button className="btn btn-danger btn-sm" onClick={handleDelete}><Trash2 size={13} /> Xóa</button>
        </div>
      )}

      <div className="table-wrapper">
        <table className="data-table">
          <thead>
            <tr>
              <th style={{ width: 36 }} rowSpan={2} className="col-sticky col-checkbox">
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
                  <div className="empty-state-icon">🔑</div>
                  <h3 style={{ marginBottom: 4, color: 'var(--text-primary)' }}>Không có dữ liệu license</h3>
                  <p className="text-muted">Thử thay đổi từ khóa tìm kiếm hoặc bỏ bộ lọc.</p>
                </td>
              </tr>
            ) : (
              filtered.map((row, i) => {
                const realIdx = data.indexOf(row)
                return (
                  <tr key={i}>
                    <td className="col-sticky col-checkbox"><input type="checkbox" className="row-checkbox" checked={selected.has(realIdx)} onChange={() => toggleSelect(realIdx)} /></td>
                    <td className="col-sticky" style={{ left: 44, background: 'var(--bg-card)' }}>
                      <button className="btn btn-ghost btn-icon" title="Sửa"
                        onClick={() => { setEditRow({ ...row }); setEditIdx(realIdx); }}>
                        <Edit2 size={14} />
                      </button>
                    </td>
                    {HEADERS.map(h => (
                      <td key={h} style={h === 'STT' ? { textAlign: 'center', width: 45 } : undefined}>
                        {h === 'KichHoat' ? (getBadge(row[h]) || row[h]) : (row[h] ?? '')}
                      </td>
                    ))}
                  </tr>
                )
              })
            )}
          </tbody>
        </table>
      </div>

      {/* Add */}
      <Modal title="Thêm license mới" icon={<Plus size={16} />} isOpen={showAdd} onClose={() => setShowAdd(false)}
        footer={<><button className="btn btn-secondary" onClick={() => setShowAdd(false)}>Hủy</button><button className="btn btn-primary" onClick={handleAdd}>Lưu</button></>}>
        <div className="form-grid">
          {FORM_FIELDS.map(f => (
            <div className="form-group" key={f}>
              <label className="form-label">{DISPLAY_LABELS[f] || f}</label>
              {renderFormField(f, newRow[f], (val) => setNewRow({ ...newRow, [f]: val }), newRow, setNewRow)}
            </div>
          ))}
        </div>
      </Modal>

      {/* Edit */}
      <Modal title="Sửa license" icon={<Edit2 size={16} />} isOpen={editRow !== null} onClose={() => setEditRow(null)}
        footer={<><button className="btn btn-secondary" onClick={() => setEditRow(null)}>Hủy</button><button className="btn btn-primary" onClick={handleEdit}>Lưu</button></>}>
        {editRow && (
          <div className="form-grid">
            {FORM_FIELDS.map(f => (
              <div className="form-group" key={f}>
                <label className="form-label">{DISPLAY_LABELS[f] || f}</label>
                {renderFormField(f, editRow[f], (val) => setEditRow({ ...editRow, [f]: val }), editRow, setEditRow)}
              </div>
            ))}
          </div>
        )}
      </Modal>
    </div>
  )
}
