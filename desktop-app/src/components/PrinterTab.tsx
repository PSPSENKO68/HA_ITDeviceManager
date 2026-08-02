import { useState, useMemo } from 'react'
import { Printer as PrinterIcon, Search, Plus, Edit2, Trash2 } from 'lucide-react'
import { Modal } from './Modal'

interface PrinterTabProps {
  data: any[]
  onSave: (sheetName: string, data: any[]) => void
}

const HEADERS = ['STT', 'PhanLoai', 'TenMay', 'IP Address', 'PhongBan', 'TinhTrang']
const DISPLAY_LABELS: Record<string, string> = {
  STT: 'STT', PhanLoai: 'Phân Loại', TenMay: 'Tên Máy',
  'IP Address': 'Địa chỉ IP', PhongBan: 'Phòng Ban', TinhTrang: 'Tình Trạng'
}
const FORM_FIELDS = HEADERS.filter(h => h !== 'STT')

function getStatusBadge(val: any) {
  const s = String(val || '').trim().toLowerCase()
  if (!s) return null
  if (s === 'in use' || s.includes('tốt') || s.includes('hoạt động') || s.includes('sử dụng'))
    return <span className="badge badge-green">In Use</span>
  if (s === 'not found' || s.includes('hỏng') || s.includes('lỗi'))
    return <span className="badge badge-red">Not Found</span>
  return <span className="badge badge-gray">{val}</span>
}

export function PrinterTab({ data, onSave }: PrinterTabProps) {
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
    onSave('Printer', updated)
    setShowAdd(false)
    setNewRow({})
  }

  const handleEdit = () => {
    if (editIdx < 0 || !editRow) return
    const updated = [...data]
    updated[editIdx] = { ...editRow }
    onSave('Printer', updated)
    setEditRow(null)
    setEditIdx(-1)
  }

  const handleDelete = () => {
    if (selected.size === 0) return
    if (!confirm(`Bạn có chắc muốn xóa ${selected.size} máy in?`)) return
    const indices = Array.from(selected)
    const updated = data.filter((_, i) => !indices.includes(i))
    updated.forEach((r, i) => r.STT = i + 1)
    onSave('Printer', updated)
    setSelected(new Set())
  }

  const uniqueDepts = useMemo(() => Array.from(new Set(data.map(r => r.PhongBan).filter(Boolean))), [data])

  const renderFormField = (field: string, value: any, onChange: (val: string) => void) => {
    if (field === 'PhongBan') {
      return (
        <select className="form-select" value={value || ''} onChange={e => onChange(e.target.value)}>
          <option value="">-- Chọn phòng ban --</option>
          {uniqueDepts.map(d => <option key={d as string} value={d as string}>{d as string}</option>)}
        </select>
      )
    }
    if (field === 'TinhTrang') {
      return (
        <select className="form-select" value={value || ''} onChange={e => onChange(e.target.value)}>
          <option value="">-- Chọn tình trạng --</option>
          <option value="In Use">In Use</option>
          <option value="Not Found">Not Found</option>
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
          <h1 className="page-title"><PrinterIcon size={20} /> Máy In & Photocopy</h1>
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
                  <div className="empty-state-icon">🖨️</div>
                  <h3 style={{ marginBottom: 4, color: 'var(--text-primary)' }}>Không có dữ liệu máy in</h3>
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
                        {h === 'TinhTrang' ? (getStatusBadge(row[h]) || row[h]) : (row[h] ?? '')}
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
      <Modal title="Thêm máy in mới" icon={<Plus size={16} />} isOpen={showAdd} onClose={() => setShowAdd(false)}
        footer={<><button className="btn btn-secondary" onClick={() => setShowAdd(false)}>Hủy</button><button className="btn btn-primary" onClick={handleAdd}>Lưu</button></>}>
        <div className="form-grid">
          {FORM_FIELDS.map(f => (
            <div className="form-group" key={f}>
              <label className="form-label">{DISPLAY_LABELS[f] || f}</label>
              {renderFormField(f, newRow[f], (val) => setNewRow({ ...newRow, [f]: val }))}
            </div>
          ))}
        </div>
      </Modal>

      {/* Edit */}
      <Modal title="Sửa máy in" icon={<Edit2 size={16} />} isOpen={editRow !== null} onClose={() => setEditRow(null)}
        footer={<><button className="btn btn-secondary" onClick={() => setEditRow(null)}>Hủy</button><button className="btn btn-primary" onClick={handleEdit}>Lưu</button></>}>
        {editRow && (
          <div className="form-grid">
            {FORM_FIELDS.map(f => (
              <div className="form-group" key={f}>
                <label className="form-label">{DISPLAY_LABELS[f] || f}</label>
                {renderFormField(f, editRow[f], (val) => setEditRow({ ...editRow, [f]: val }))}
              </div>
            ))}
          </div>
        )}
      </Modal>
    </div>
  )
}
