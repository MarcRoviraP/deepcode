# API de Texto a Voz (Piper TTS)

Esta es una API sencilla construida con Flask que utiliza [Piper](https://github.com/rhasspy/piper) para convertir texto en audio (WAV).

## Catálogo de Voces Disponibles

Se han instalado varios modelos de alta calidad en la carpeta `models/`. Puedes intercambiarlos editando la variable `MODEL_PATH` en `src/app.py`.

| Nombre | Calidad | Género | Región | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| **Davefx** | Medium | Masc. | España | **Excelente entrenamiento**, voz muy natural. |
| **Cortana** | **High** | Fem. | México | Voz premium, muy clara y profesional. |
| **Laura** | **High** | Fem. | México | Voz premium, tono de asistente moderno. |
| **Daniela** | **High** | Fem. | Argentina | Alta fidelidad con acento argentino. |
| **Sharvard** | Medium | Mixto | España | Multi-voz (Speaker 0: Masc, Speaker 1: Fem). |
| **Carlfm** | X-Low | Masc. | España | Muy rápida, pero de menor calidad. |

## Requisitos e Instalación

1. **Entorno virtual:**
   ```bash
   python3 -m venv .venv
   source .venv/bin/activate
   pip install flask flask-cors gunicorn dotenv
   ```

2. **Binarios:** El ejecutable `piper` y las librerías `.so` deben estar en la raíz del proyecto.

## Endpoints

### 1. Generar Audio (TTS)
- **URL:** `/tts`
- **Método:** `POST`
- **JSON:** `{"text": "Tu mensaje aquí"}`
- **Respuesta:** Audio `wav`.

### 2. Estado de Salud
- **URL:** `/health`
- **Método:** `GET`

---

## Gestión del Servidor

### Script de Control (`start.sh`)
Se ha creado un script para facilitar el reinicio en modo producción:
```bash
./start.sh
```
Este script mata procesos anteriores en el puerto 5000 e inicia `gunicorn` con un timeout de 10 minutos (necesario para textos largos).

### Servicio del Sistema (`systemd`)
Para que la API arranque automáticamente con el sistema operativo:

*   **Archivo de servicio:** `/etc/systemd/system/piper-tts.service`
*   **Comandos de gestión:**
    ```bash
    sudo systemctl status piper-tts   # Ver estado
    sudo systemctl restart piper-tts  # Reiniciar
    sudo systemctl stop piper-tts     # Detener
    journalctl -u piper-tts -f        # Ver logs en tiempo real
    ```

## Solución de problemas

1. **Timeout**: Los textos muy largos pueden tardar varios minutos en procesarse. El sistema está configurado para esperar hasta 10 minutos.
2. **CORS**: Habilitado para permitir peticiones desde cualquier origen web.
3. **Logs**: Revisa `server.log` o `journalctl` para depurar errores internos.
