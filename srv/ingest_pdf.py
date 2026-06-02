import fitz
import psycopg2
import json
import os
import re
from sentence_transformers import SentenceTransformer

PDF_DIR = os.path.join(os.path.dirname(os.path.abspath(__file__)), "rag-data", "pdf")

DB_CONFIG = {
    "dbname": "app_db",
    "user": "postgresql",
    "password": "123456",
    "host": "localhost",
    "port": 5432
}

# Inicializar modelo globalmente
print("Cargando modelo de embeddings...")
model = SentenceTransformer("all-mpnet-base-v2")


def get_or_create_topic(conn, filename):
    # Intentar extraer el nombre del lenguaje o tecnología (primera parte del nombre)
    name_parts = re.split(r'[-_]', filename.lower())
    topic_name = name_parts[0]
    
    # Casos especiales o limpieza
    if topic_name.isdigit(): # Ej: 97-cosas...
        topic_name = "Programación"
    elif topic_name in ["c", "cpp", "csharp"]:
        topic_name = topic_name.replace("cpp", "C++").replace("csharp", "C#").upper()
    else:
        topic_name = topic_name.capitalize()

    cur = conn.cursor()
    cur.execute("SELECT id FROM topics WHERE nombre = %s", (topic_name,))
    result = cur.fetchone()
    
    if result:
        topic_id = result[0]
    else:
        print(f"  > Creando nuevo topic: {topic_name}")
        cur.execute("INSERT INTO topics (nombre, descripcion) VALUES (%s, %s) RETURNING id", 
                    (topic_name, f"Documentación y apuntes sobre {topic_name}"))
        topic_id = cur.fetchone()[0]
        conn.commit()
    
    cur.close()
    return topic_id


def detect_level(filename):
    name = filename.lower()
    if any(word in name for word in ["avanzado", "experto", "inmersion", "deep", "avanzada"]):
        return "Avanzado"
    if any(word in name for word in ["intermedio", "ejercicios", "practica", "algoritmos"]):
        return "Intermedio"
    # Por defecto Principiante
    return "Principiante"


# 1. PDF → texto
def extract_text(path):
    try:
        doc = fitz.open(path)
        return "\n".join(page.get_text() for page in doc).replace("\x00", "")
    except Exception as e:
        print(f"Error extrayendo {path}: {e}")
        return ""


# 2. chunking simple
def chunk_text(text, size=800, overlap=150):
    if not text:
        return []
    words = text.split()
    chunks = []
    i = 0

    while i < len(words):
        chunks.append(" ".join(words[i:i+size]))
        i += size - overlap

    return chunks


# 3. embedding local
def embed(text):
    return model.encode(text).tolist()


# 4. guardar en DB
def save(conn, document_id, topic_id, chunk_index, content, embedding, level):
    cur = conn.cursor()

    cur.execute("""
        INSERT INTO knowledge_chunks
        (document_id, topic_id, source_type, chunk_index, content, embedding, level, metadata)
        VALUES (%s,%s,%s,%s,%s,%s,%s,%s)
    """, (
        document_id,
        topic_id,
        "pdf",
        chunk_index,
        content,
        embedding,
        level,
        json.dumps({})
    ))

    conn.commit()
    cur.close()


# 5. pipeline
def main():
    if not os.path.exists(PDF_DIR):
        print(f"Error: No existe el directorio {PDF_DIR}")
        return

    conn = psycopg2.connect(**DB_CONFIG)
    
    files = [f for f in os.listdir(PDF_DIR) if f.lower().endswith(".pdf")]
    print(f"Encontrados {len(files)} archivos PDF. Iniciando ingesta dinámica...")

    for filename in files:
        path = os.path.join(PDF_DIR, filename)
        
        # Verificar si ya existe el documento
        cur = conn.cursor()
        cur.execute("SELECT id FROM documents WHERE file_path = %s", (path,))
        if cur.fetchone():
            print(f"Saltando {filename} (ya procesado)")
            cur.close()
            continue
        cur.close()

        # Determinar topic y nivel dinámicamente
        topic_id = get_or_create_topic(conn, filename)
        level = detect_level(filename)

        print(f"Procesando: {filename} [Topic: {topic_id}, Nivel: {level}]")
        text = extract_text(path)
        chunks = chunk_text(text)
        
        if not chunks:
            continue

        # Registrar documento
        cur = conn.cursor()
        cur.execute("""
            INSERT INTO documents (topic_id, title, file_path, file_type, level, processed)
            VALUES (%s,%s,%s,%s,%s,%s)
            RETURNING id
        """, (topic_id, filename, path, "pdf", level, True))
        
        document_id = cur.fetchone()[0]
        conn.commit()
        cur.close()

        # Guardar chunks
        for i, chunk in enumerate(chunks):
            vec = embed(chunk)
            save(conn, document_id, topic_id, i, chunk, vec, level)

    conn.close()
    print("\nOK - Ingesta masiva y dinámica completada")


if __name__ == "__main__":
    main()