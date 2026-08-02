import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'
import path from 'path'
import fs from 'fs'
import bodyParser from 'body-parser'
import * as xlsx from 'xlsx'

function excelApiPlugin() {
  return {
    name: 'excel-api-plugin',
    configureServer(server: any) {
      server.middlewares.use(bodyParser.json({ limit: '50mb' }))
      
      server.middlewares.use('/api/read-db', (_req: any, res: any) => {
        try {
          const dbPath = path.resolve(__dirname, '../data/database.xlsx')
          if (!fs.existsSync(dbPath)) return res.end(JSON.stringify({ error: 'Database not found' }))
          const wb = xlsx.default.readFile(dbPath)
          const result: any = {}
          wb.SheetNames.forEach((sheetName: string) => {
            const sheet = wb.Sheets[sheetName]
            result[sheetName] = xlsx.default.utils.sheet_to_json(sheet, { defval: '', raw: false, dateNF: 'dd/mm/yyyy' })
          })
          res.setHeader('Content-Type', 'application/json')
          res.end(JSON.stringify({ data: result }))
        } catch(e: any) {
          res.end(JSON.stringify({ error: e.message }))
        }
      })

      server.middlewares.use('/api/write-db', (req: any, res: any) => {
        try {
          const dbPath = path.resolve(__dirname, '../data/database.xlsx')
          const data = req.body
          const newWb = xlsx.default.utils.book_new()
          Object.keys(data).forEach(sheetName => {
            const ws = xlsx.default.utils.json_to_sheet(data[sheetName])
            xlsx.default.utils.book_append_sheet(newWb, ws, sheetName)
          })
          xlsx.default.writeFile(newWb, dbPath)
          res.setHeader('Content-Type', 'application/json')
          res.end(JSON.stringify({ success: true }))
        } catch(e: any) {
          res.end(JSON.stringify({ error: e.message }))
        }
      })
    }
  }
}

// https://vite.dev/config/
export default defineConfig({
  plugins: [react(), excelApiPlugin()],
  base: './', // important for electron
  resolve: {
    alias: {
      '@': path.resolve(__dirname, './src'),
    }
  }
})
