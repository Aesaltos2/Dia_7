import http from 'node:http'
import { PORT } from './config.js'
import { getUsers, index, getExport, getImport } from './controller.js'

const server = http.createServer(async (req, res) => {
  const { url, method } = req

  if (method === 'GET') {
    switch (url) {
      case '/':
        index(req, res)
        break

      case '/api/usuarios':
        getUsers(req, res)
        break

      case '/api/usuarios/export':
        getExport(req, res)
        break

      case '/api/usuarios/import':
        getImport(req, res)
        break

      default:
        res.end('Ruta no encontrada')
        break
    }
  }

  if (method === 'POST') {
    // Codigo para rutas post
  }
})

server.listen(PORT, () => console.log(`Servidor ejecutandose http://localhost:${PORT}`))
