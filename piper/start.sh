#!/bin/bash

# Configuración
PORT=5000
VENV_PATH="./.venv"
LOG_FILE="server.log"

echo "Reiniciando API de Piper TTS en modo producción..."

# 1. Matar procesos existentes en el puerto
PID=$(lsof -t -i:$PORT)
if [ -z "$PID" ]; then
    echo "No hay procesos corriendo en el puerto $PORT."
else
    echo "Matando proceso anterior (PID: $PID)..."
    kill -9 $PID
fi

# 2. Iniciar con Gunicorn
echo "Iniciando Gunicorn en puerto $PORT..."
nohup $VENV_PATH/bin/gunicorn \
    --bind 0.0.0.0:$PORT \
    --timeout 600 \
    --workers 1 \
    --chdir src \
    app:app > $LOG_FILE 2>&1 &

echo "Servidor iniciado correctamente."
echo "Puedes ver los logs con: tail -f $LOG_FILE"
