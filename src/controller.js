import path from 'node:path'
import fs from 'node:fs/promises'
import { pool } from './db.js'

export const index = async (req, res) => {
  const ruta = path.resolve('./public/index.html')
  const contenido = await fs.readFile(ruta, 'utf-8')
  res.writeHead(200, { 'Content-Type': 'text/html' })
  res.end(contenido)
}

export const getUsers = async (req, res) => {
  const resultado = await pool.query('SELECT * FROM usuarios')
  const magazines = resultado[0]
  const stringData = JSON.stringify(magazines)

  res.writeHead(200, { 'Content-Type': 'application/json' })
  res.end(stringData)
}

export const getExport = async (req, res) => {
  try {
    const resultado = await pool.query('SELECT * FROM usuarios')
    const datas = resultado[0]

    const cabecera = Object.keys(datas[0]).join(',')
    // Obtener Cabeceras separado por comas
    //   await fs.writeFile('usuarios.csv', cabecera)

    const filas = datas.reduce((acc, datos) => {
      const string = `\n${datos.id},${datos.nombres},${datos.apellidos},${datos.direccion},${datos.correo_electronico},${datos.dni},${datos.edad},${datos.fecha_creacion},${datos.telefono}`
      console.log(datos)
      return acc + string
    }, '')

    const contenido = cabecera + filas

    await fs.writeFile('usuarios.csv', contenido)

    res.writeHead(200, { 'Content-Type': 'application/json' })
    res.end(JSON.stringify({ message: 'Datos de usuarios exportados al archivo usuarios.csv' }))
  } catch (error) {
    console.log(error)
    res.writeHead(500, { 'Content-Type': 'application/json' })
    res.end(JSON.stringify({ message: 'Error interno del servidor' }))
  }
}

export const getImport = async (req, res) => {
  try {
    const contenido = await fs.readFile('usuarios.csv', 'utf-8')

    const filas = contenido.split('\n')
    filas.shift()
    for (const fila of filas) {
      const valores = fila.split(',')
      const id = valores[0] // Ajustado el índice para el ID
      const nombres = valores[1]
      const apellidos = valores[2]
      const direccion = valores[3]
      const correo = valores[4]
      const dni = valores[5]
      const edad = valores[6]
      const fecha = valores[7]
      const telefono = valores[8]

      try {
        await pool.execute('INSERT INTO usuarios(id, nombres, apellidos, direccion, correo_electronico, dni, edad, fecha_creacion, telefono) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)', [id, nombres, apellidos, direccion, correo, dni, edad, fecha, telefono])
        console.log('Se insertó el usuario:', nombres)
      } catch (error) {
        if (error.errno === 1062) {
          console.log('No se insertó el usuario', nombres, 'porque ya existe en la Base de datos ')
          continue
        }
        console.error('Error al insertar el usuario:', error)
        // Continúa con la importación en caso de error
      }
    }
    res.writeHead(200, { 'Content-type': 'application/json' })
    res.end(JSON.stringify({ message: 'Datos importados' }))
  } catch (error) {
    if (error.code === 'ENOENT') {
      console.error('El archivo no existe')
      // Maneja el caso de que el archivo no exista
    } else {
      console.error('Error interno:', error)
      // Maneja otros errores internos
    }
    res.writeHead(500, { 'Content-Type': 'application/json' })
    res.end(JSON.stringify({ message: 'Error en la importación' }))
  }
}
