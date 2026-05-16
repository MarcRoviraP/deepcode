# DeepTutor Server Replication Guide

Este repositorio contiene todo lo necesario para replicar el servidor de DeepTutor.

## Requisitos Previos
- PostgreSQL con extensión `pgvector`
- Python 3.10+
- Node.js & npm
- Piper (TTS)

## 1. Configuración de la Base de Datos
1. Crea una base de datos llamada `app_db`.
2. Importa el esquema:
   ```bash
   psql -d app_db -f sql/schema.sql
   ```

## 2. Configuración del Backend (Python)
1. Crea un entorno virtual:
   ```bash
   python3 -m venv venv
   source venv/bin/activate
   ```
2. Instala las dependencias:
   ```bash
   pip install -r requirements.txt
   ```
3. Configura el archivo `.env`:
   ```bash
   cp .env.example .env
   # Edita .env con tus credenciales
   ```
4. Ejecuta la API:
   ```bash
   python app.py
   ```

## 3. Configuración del Frontend (Node.js)
1. Entra al directorio del frontend:
   ```bash
   cd DeepTutor/deep-tutor-web
   ```
2. Instala dependencias:
   ```bash
   npm install
   ```
3. Inicia el servidor de desarrollo:
   ```bash
   npm run dev
   ```

## 4. Texto a Voz (Piper)
El servidor utiliza Piper para TTS. 
1. Descarga el binario de Piper para tu arquitectura.
2. Colócalo en una carpeta llamada `piper/` en la raíz.
3. Asegúrate de descargar los modelos `.onnx` y `.json` en `piper/models`.

## 5. Ingesta de Documentos (RAG)
Para alimentar el sistema de conocimiento:
1. Coloca tus archivos PDF en `srv/rag-data/pdf/`.
2. Ejecuta el script de ingesta:
   ```bash
   python srv/ingest_pdf.py
   ```

## Seguridad
- La API utiliza una `X-API-Key` definida en el `.env`.
- La ejecución de código usa `sudo -u sandbox_user`. Asegúrate de crear este usuario en el sistema host para mayor seguridad o ajusta `app.py`.
