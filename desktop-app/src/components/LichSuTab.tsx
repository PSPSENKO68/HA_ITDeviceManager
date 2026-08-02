import { useState, useMemo } from 'react'
import { History, Search, Trash2 } from 'lucide-react'

interface LichSuTabProps {
  data: any[]
  onSave: (updates: Record<string, any[]>) => void
}

const HEADERS = ['STT', 'Ngay', 'LoaiHanhDong', 'ThietBi_STT', 'ThietBi_Model', 'ThietBi_Serial',
  'ChiTiet', 'PhongBan_Cu', 'PhongBan_Moi', 'Owner_Cu', 'Owner_Moi', 'ChiPhi', 'NguoiThucHien']

const DISPLAY_LABELS: Record<string, string> = {
  STT: 'STT', Ngay: 'Ngày', LoaiHanhDong: 'Loại hành động',
  ThietBi_STT: 'TB STT', ThietBi_Model: 'Model', ThietBi_Serial: 'Serial',
  ChiTiet: 'Chi tiết', PhongBan_Cu: 'PB cũ', PhongBan_Moi: 'PB mới',
  Owner_Cu: 'Owner cũ', Owner_Moi: 'Owner mới', ChiPhi: 'Chi phí',
  NguoiThucHien: 'Người thực hiện'
}

function getActionBadge(val: any) {
  const s = String(val || '').trim().toLowerCase()
  if (s.includes('bàn giao')) return <span className="badge badge-blue">📦 {val}</span>
  if (s.includes('sửa chữa')) return <span className="badge badge-yellow">🔧 {val}</span>
  if (s.includes('lưu kho')) return <span className="badge badge-purple">📦 {val}</span>
  return <span className="badge badge-gray">{val}</span>
}

export function LichSuTab({ data, onSave }: LichSuTabProps) {
  const [search, setSearch] = useState('')
  const [filterAction, setFilterAction] = useState('')

  const filtered = useMemo(() => {
    let result = data
    if (filterAction) {
      result = result.filter(r => String(r.LoaiHanhDong || '').toLowerCase().includes(filterAction.toLowerCase()))
    }
    if (search.trim()) {
      const q = search.toLowerCase()
      result = result.filter(row =>
        Object.values(row).some(v => String(v || '').toLowerCase().includes(q))
      )
    }
    return result
  }, [data, search, filterAction])

  const handleClear = () => {
    if (!confirm('Bạn có chắc muốn xóa toàn bộ lịch sử? Hành động này không thể hoàn tác!')) return
    onSave({ LichSu: [] })
  }

  // Count by type
  const countBanGiao = data.filter(r => String(r.LoaiHanhDong || '').includes('Bàn giao')).length
  const countSuaChua = data.filter(r => String(r.LoaiHanhDong || '').includes('Sửa chữa')).length
  const countLuuKho = data.filter(r => String(r.LoaiHanhDong || '').includes('Lưu kho')).length

  // Total repair cost
  const totalCost = data
    .filter(r => r.ChiPhi)
    .reduce((sum, r) => sum + (parseFloat(String(r.ChiPhi).replace(/[^0-9.]/g, '')) || 0), 0)

  return (
    <div>
      <div className="page-header">
        <div>
          <h1 className="page-title"><History size={20} /> Lịch sử hoạt động</h1>
          <div className="stats-bar" style={{ marginTop: 4 }}>
            <span>Tổng: <strong>{data.length}</strong></span>
            <span>📦 Bàn giao: <strong className="text-blue">{countBanGiao}</strong></span>
            <span>🔧 Sửa chữa: <strong style={{ color: 'var(--color-yellow)' }}>{countSuaChua}</strong></span>
            <span>📦 Lưu kho: <strong style={{ color: 'var(--color-purple)' }}>{countLuuKho}</strong></span>
            {totalCost > 0 && <span>💰 Tổng chi phí: <strong className="text-red">{totalCost.toLocaleString('vi-VN')} VNĐ</strong></span>}
          </div>
        </div>
        <div className="header-actions">
          <div className="search-bar">
            <Search size={14} />
            <input placeholder="Tìm kiếm lịch sử..." value={search} onChange={e => setSearch(e.target.value)} />
          </div>
          <button className={`btn btn-sm ${filterAction === '' ? 'btn-primary' : 'btn-secondary'}`} onClick={() => setFilterAction('')}>Tất cả</button>
          <button className={`btn btn-sm ${filterAction === 'Bàn giao' ? 'btn-primary' : 'btn-secondary'}`} onClick={() => setFilterAction('Bàn giao')}>📦 Bàn giao</button>
          <button className={`btn btn-sm ${filterAction === 'Sửa chữa' ? 'btn-primary' : 'btn-secondary'}`} onClick={() => setFilterAction('Sửa chữa')}>🔧 Sửa chữa</button>
          <button className={`btn btn-sm ${filterAction === 'Lưu kho' ? 'btn-primary' : 'btn-secondary'}`} onClick={() => setFilterAction('Lưu kho')}>📦 Lưu kho</button>
          <button className="btn btn-danger btn-sm" onClick={handleClear} disabled={data.length === 0}>
            <Trash2 size={13} /> Xóa lịch sử
          </button>
        </div>
      </div>

      {filtered.length === 0 ? (
        <div className="empty-state">
          <div className="empty-state-icon">📋</div>
          <h3 style={{ marginBottom: 4 }}>Chưa có lịch sử</h3>
          <p className="text-muted">Khi bạn bàn giao, sửa chữa hoặc lưu kho thiết bị, lịch sử sẽ được ghi lại ở đây.</p>
        </div>
      ) : (
        <div className="table-wrapper">
          <table className="data-table">
            <thead>
              <tr>
                {HEADERS.map(h => <th key={h}>{DISPLAY_LABELS[h] || h}</th>)}
              </tr>
            </thead>
            <tbody>
              {[...filtered].reverse().map((row, i) => (
                <tr key={i}>
                  {HEADERS.map(h => (
                    <td key={h}>
                      {h === 'LoaiHanhDong' ? getActionBadge(row[h]) : (row[h] ?? '')}
                    </td>
                  ))}
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      )}
    </div>
  )
}
