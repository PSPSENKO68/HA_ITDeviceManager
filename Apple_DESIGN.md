---
version: 1.1.0
name: IT-Asset-Pro-Design-System
description: The official design system for the IT Asset Pro Desktop Application. It uses a "Vanilla CSS - Dark Mode Premium" theme inspired by Apple's minimalist aesthetic. It relies on solid, edge-to-edge structural layouts without decorative shadows, utilizing a strict color palette that gracefully adapts to light and dark modes.

themes:
  light:
    bg-app: "#f5f5f7"
    bg-sidebar: "#f5f5f7"
    bg-main: "transparent"
    bg-card: "#ffffff"
    bg-card-hover: "#fafafc"
    bg-input: "#ffffff"
    bg-input-focus: "#ffffff"
    bg-modal-overlay: "rgba(0, 0, 0, 0.4)"
    bg-table-header: "rgba(255, 255, 255, 0.9)"
    bg-table-row-hover: "#fafafc"
    bg-table-row-alt: "#ffffff"
    
    border-default: "#e0e0e0"
    border-focus: "#0066cc"
    border-subtle: "#f0f0f0"
    
    text-primary: "#1d1d1f"
    text-secondary: "#333333"
    text-muted: "#7a7a7a"
    text-white: "#ffffff"
    text-on-dark: "#ffffff"

    color-primary: "#0066cc"
    color-primary-hover: "#0071e3"
    color-blue: "#0066cc"
    color-blue-hover: "#0071e3"
    color-blue-bg: "rgba(0, 102, 204, 0.1)"

  dark:
    bg-app: "#000000"
    bg-sidebar: "#000000"
    bg-main: "transparent"
    bg-card: "#1c1c1e"
    bg-card-hover: "#2c2c2e"
    bg-input: "#1c1c1e"
    bg-input-focus: "#1c1c1e"
    bg-modal-overlay: "rgba(0, 0, 0, 0.6)"
    bg-table-header: "rgba(28, 28, 30, 0.8)"
    bg-table-row-hover: "#2c2c2e"
    bg-table-row-alt: "#1c1c1e"
    
    border-default: "#38383a"
    border-focus: "#0a84ff"
    border-subtle: "#2c2c2e"
    
    text-primary: "#f5f5f7"
    text-secondary: "#ebebf5"
    text-muted: "rgba(235, 235, 245, 0.6)"
    text-white: "#ffffff"
    text-on-dark: "#ffffff"

    color-primary: "#0a84ff"
    color-primary-hover: "#0071e3"
    color-blue: "#0a84ff"
    color-blue-hover: "#0071e3"
    color-blue-bg: "rgba(10, 132, 255, 0.15)"

semantic-colors:
  green: "#34c759"
  green-bg: "rgba(52, 199, 89, 0.1)"
  red: "#ff3b30"
  red-bg: "rgba(255, 59, 48, 0.1)"
  yellow: "#ff9500"
  yellow-bg: "rgba(255, 149, 0, 0.1)"

typography:
  font-family:
    display: '"SF Pro Display", "Inter", system-ui, -apple-system, sans-serif'
    body: '"SF Pro Text", "Inter", system-ui, -apple-system, sans-serif'
  
  body-base:
    fontSize: "14px"
    lineHeight: "1.47"
    letterSpacing: "-0.224px"
  
  page-title:
    fontFamily: "display"
    fontSize: "24px"
    fontWeight: "600"
    letterSpacing: "-0.374px"
  
  page-subtitle:
    fontSize: "13px"
    color: "text-muted"
    marginTop: "2px"

rounded:
  sm: "5px"
  md: "8px"
  lg: "11px"
  xl: "18px"
  pill: "9999px"

shadows:
  sm: "none"
  md: "none"
  lg: "0 4px 20px rgba(0,0,0,0.08)"
  modal: "0 20px 60px rgba(0,0,0,0.15)"
  note: "No structural shadows in Apple Design! Shadows are reserved exclusively for floating elements like modals."

layout:
  sidebar-width: "240px"
  header-height: "56px"

components:
  sidebar:
    background: "bg-sidebar"
    border-right: "1px solid border-default"
  
  card:
    background: "bg-card"
    border-radius: "rounded-xl"
    border: "1px solid border-default"
    shadow: "none"
  
  button:
    border-radius: "rounded-md"
    padding: "10px 18px"
    font-size: "14px"
    transition: "all 0.2s cubic-bezier(0.25, 1, 0.5, 1)"
  
  search-bar:
    border-radius: "rounded-pill"
    height: "44px"
    padding: "0 16px"
    background: "bg-input"
    border: "1px solid border-default"

  table:
    header-bg: "bg-table-header"
    row-bg: "bg-card"
    row-alt-bg: "bg-table-row-alt"
    row-hover: "bg-table-row-hover"
    cell-padding: "12px 16px"
