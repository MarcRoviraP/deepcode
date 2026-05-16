from flask import Flask, request, send_file, jsonify, after_this_request
from flask_cors import CORS
from dotenv import load_dotenv

load_dotenv()

import subprocess
import uuid
import os

BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

app = Flask(__name__)
CORS(app)


MODEL_PATH = os.getenv("PIPER_MODEL", os.path.join(BASE_DIR, "models/es_ES-davefx-medium.onnx"))
PIPER_PATH = os.getenv("PIPER_EXE", os.path.join(BASE_DIR, "piper"))


@app.route("/tts", methods=["POST"])
def tts():
    data = request.get_json()
    if not data or "text" not in data:
        return jsonify({"error": "Falta text"}), 400

    text = data["text"]
    filename = f"/tmp/{uuid.uuid4()}.wav"

    try:
        result = subprocess.run(
            [
                PIPER_PATH,
                "--model", MODEL_PATH,
                "--output_file", filename
            ],
            input=text.encode("utf-8"),
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            timeout=300
        )

        if result.returncode != 0:
            return jsonify({
                "error": "Piper fallo",
                "details": result.stderr.decode()
            }), 500

        @after_this_request
        def remove_file(response):
            try:
                if os.path.exists(filename):
                    os.remove(filename)
            except Exception:
                pass
            return response

        return send_file(filename, mimetype="audio/wav")

    except subprocess.TimeoutExpired:
        if os.path.exists(filename):
            os.remove(filename)
        return jsonify({"error": "Timeout en Piper"}), 500


@app.route("/health", methods=["GET"])
def health():
    return jsonify({"status": "ok"})


if __name__ == "__main__":
    port = int(os.getenv("TTS_PORT", 5000))
    app.run(host="0.0.0.0", port=port)