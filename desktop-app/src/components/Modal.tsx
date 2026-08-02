import { X } from 'lucide-react'
import type { ReactNode } from 'react'

interface ModalProps {
  title: string
  icon?: ReactNode
  isOpen: boolean
  onClose: () => void
  children: ReactNode
  footer?: ReactNode
  wide?: boolean
  width?: string
}

export function Modal({ title, icon, isOpen, onClose, children, footer, wide, width }: ModalProps) {
  if (!isOpen) return null

  return (
    <div className="modal-overlay" onClick={onClose}>
      <div className={`modal-box ${wide ? 'modal-wide' : ''}`} style={width ? { maxWidth: width, width: '100%' } : undefined} onClick={e => e.stopPropagation()}>
        <div className="modal-header">
          <div className="modal-title">
            {icon}
            {title}
          </div>
          <button className="modal-close" onClick={onClose}><X size={18} /></button>
        </div>
        <div className="modal-body">
          {children}
        </div>
        {footer && (
          <div className="modal-footer">
            {footer}
          </div>
        )}
      </div>
    </div>
  )
}
