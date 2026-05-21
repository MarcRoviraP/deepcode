from flask import Flask, jsonify, request
from flask_cors import CORS
import psycopg2
import psycopg2.extras
import json
import subprocess
import os
from dotenv import load_dotenv

load_dotenv() # Cargar variables desde .env
import tempfile
import shutil
from sentence_transformers import SentenceTransformer

app = Flask(__name__)
CORS(app)


# Inicializar modelo de embeddings (768 dim)
model = SentenceTransformer("all-mpnet-base-v2")

# Configuración de la base de datos desde entorno
DB_CONFIG = {
    "host": os.getenv("DB_HOST", "localhost"),
    "database": os.getenv("DB_NAME", "app_db"),
    "user": os.getenv("DB_USER", "postgresql"),
    "password": os.getenv("DB_PASS", "123456"),
    "port": int(os.getenv("DB_PORT", 5432))
}

# Seguridad
API_KEY = os.getenv("API_KEY", "806bfc1ea9173997e05e9d23263556b3")

def get_db_connection():
    conn = psycopg2.connect(**DB_CONFIG)
    return conn

@app.before_request
def check_api_key():
    if request.path == '/health':
        return
    
    key = request.headers.get('X-API-Key')
    if not key or key != API_KEY:
        return jsonify({"error": "Unauthorized: Invalid or missing API Key"}), 401

def query_db(query, args=(), one=False, commit=False):
    conn = get_db_connection()
    cur = conn.cursor(cursor_factory=psycopg2.extras.RealDictCursor)
    try:
        cur.execute(query, args)
        if commit:
            conn.commit()
            if "RETURNING" in query.upper() or "INSERT" in query.upper() or "UPDATE" in query.upper():
                try:
                    rv = cur.fetchone()
                except:
                    rv = None
            else:
                rv = None
        else:
            rv = cur.fetchall()
    except Exception as e:
        conn.rollback()
        raise e
    finally:
        cur.close()
        conn.close()
    return (rv[0] if rv else None) if one else rv

@app.route('/health', methods=['GET'])
def health_check():
    return jsonify({"status": "ok", "message": "API is running"}), 200

# Helper para generar rutas CRUD completas
def create_endpoints(table_name, post_columns):
    @app.route(f'/{table_name}', methods=['GET'], endpoint=f'get_{table_name}')
    def get_all():
        query = f'SELECT * FROM {table_name}'
        where_clauses = []
        params = []
        
        for key, value in request.args.items():
            if value.startswith('eq.'):
                # Validamos que la columna sea al menos alfanumérica para evitar inyección en el nombre de columna
                if key.replace('_', '').isalnum():
                    where_clauses.append(f"{key} = %s")
                    params.append(value[3:])
        
        if where_clauses:
            query += " WHERE " + " AND ".join(where_clauses)
        
        query += ";"
        data = query_db(query, tuple(params))
        return jsonify(data)

    @app.route(f'/{table_name}', methods=['POST'], endpoint=f'post_{table_name}')
    def create():
        data = request.get_json()
        cols = ", ".join(post_columns)
        placeholders = ", ".join(["%s"] * len(post_columns))
        values = [data.get(col) for col in post_columns]
        
        processed_values = []
        for val in values:
            if isinstance(val, (dict, list)):
                processed_values.append(json.dumps(val))
            else:
                processed_values.append(val)

        query = f'INSERT INTO {table_name} ({cols}) VALUES ({placeholders}) RETURNING id;'
        try:
            result = query_db(query, processed_values, one=True, commit=True)
            return jsonify({"id": result['id'], "message": f"{table_name} creado correctamente"}), 201
        except Exception as e:
            return jsonify({"error": str(e)}), 400

    @app.route(f'/{table_name}/<int:id>', methods=['GET'], endpoint=f'get_one_{table_name}')
    def get_one(id):
        data = query_db(f'SELECT * FROM {table_name} WHERE id = %s;', (id,), one=True)
        if data:
            return jsonify(data)
        return jsonify({"error": f"{table_name[:-1] if table_name.endswith('s') else table_name} no encontrado"}), 404

    @app.route(f'/{table_name}/<int:id>', methods=['PUT'], endpoint=f'put_{table_name}')
    def update(id):
        data = request.get_json()
        update_parts = []
        values = []
        for col in post_columns:
            if col in data:
                update_parts.append(f"{col} = %s")
                val = data.get(col)
                if isinstance(val, (dict, list)):
                    values.append(json.dumps(val))
                else:
                    values.append(val)
        
        if not update_parts:
            return jsonify({"error": "No data provided for update"}), 400
        
        values.append(id)
        query = f'UPDATE {table_name} SET {", ".join(update_parts)} WHERE id = %s;'
        try:
            query_db(query, values, commit=True)
            return jsonify({"message": f"{table_name} actualizado correctamente"}), 200
        except Exception as e:
            return jsonify({"error": str(e)}), 400

    @app.route(f'/{table_name}/<int:id>', methods=['DELETE'], endpoint=f'delete_{table_name}')
    def delete(id):
        query = f'DELETE FROM {table_name} WHERE id = %s;'
        try:
            query_db(query, (id,), commit=True)
            return jsonify({"message": f"{table_name} eliminado correctamente"}), 200
        except Exception as e:
            return jsonify({"error": str(e)}), 400

# Definición de tablas y sus columnas editables
tables_config = [
    ("usuarios", ["nombre", "email", "password_hash", "nivel","picture","google_id"]),
    ("topics", ["nombre", "descripcion", "parent_id"]),
    ("progreso_usuario", ["usuario_id", "topic_id", "nivel", "score"]),
    ("ejercicios", ["titulo", "descripcion", "dificultad", "topic_id","entrada","salida","requisitos","ejemplos","casos_prueba"]),
    ("casos_prueba", ["ejercicio_id", "input", "output_esperado"]),
    ("conversaciones", ["usuario_id","nombre"]),
    ("chat", ["usuario_id", "conversacion_id", "mensaje", "respuesta"]),
    ("errores_detectados", ["nombre", "tipo", "descripcion"]),
    ("reglas_validacion", ["nombre", "condicion", "accion", "activa"]),
    ("user_errors", ["usuario_id", "error_id", "contador"]),
    ("base_conocimiento", ["topic_id", "contenido", "nivel"]),
    ("documents", ["topic_id", "title", "file_path", "file_type", "level", "processed", "metadata"]),
    ("user_ejer", ["user_id", "ejer_id", "envio", "envio_send_time", "estado"]),
    ("knowledge_chunks", ["document_id", "topic_id", "source_type", "chunk_index", "content", "embedding", "level", "metadata"])
]

for table, post_cols in tables_config:
    create_endpoints(table, post_cols)

# Endpoint para obtener el conteo de ejercicios por usuario
@app.route('/user_ejer/stats', methods=['GET'])
def get_user_ejer_stats():
    user_id = request.args.get('user_id')
    if user_id and user_id.startswith('eq.'):
        user_id = user_id[3:]

    # Solo contamos ejercicios con estado 2 (Completado)
    query = "SELECT user_id, COUNT(DISTINCT ejer_id) as cantidad_ejercicios FROM user_ejer WHERE estado = 2"
    params = []
    
    if user_id:
        query += " AND user_id = %s"
        params.append(user_id)
        
    query += " GROUP BY user_id ORDER BY user_id ASC;"
    
    try:
        data = query_db(query, tuple(params))
        return jsonify(data), 200
    except Exception as e:
        return jsonify({"error": str(e)}), 500

# Endpoint para obtener el conteo de ejercicios por topic
@app.route('/ejercicios/stats', methods=['GET'])
def get_ejercicios_stats():
    topic_id = request.args.get('topic_id')
    if topic_id and topic_id.startswith('eq.'):
        topic_id = topic_id[3:]

    query = "SELECT topic_id, COUNT(*) as cantidad_ejercicios FROM ejercicios"
    params = []
    
    if topic_id:
        query += " WHERE topic_id = %s"
        params.append(topic_id)
        
    query += " GROUP BY topic_id ORDER BY topic_id ASC;"
    
    try:
        data = query_db(query, tuple(params))
        return jsonify(data), 200
    except Exception as e:
        return jsonify({"error": str(e)}), 500

# Endpoint para obtener el número de ejercicios por tópico que tenga ejercicios
@app.route('/topics/stats', methods=['GET'])
def get_topics_stats():
    query = """
        SELECT COUNT(t.*) as num_ejercicios, t.id
        FROM topics t
        RIGHT JOIN ejercicios e on t.id = e.topic_id
        GROUP BY t.id
    """
    try:
        data = query_db(query)
        return jsonify(data), 200
    except Exception as e:
        return jsonify({"error": str(e)}), 500

# Caso especial para tabla intermedia (error_regla)
@app.route('/error_regla', methods=['GET'])
def get_error_regla():
    return jsonify(query_db('SELECT * FROM error_regla;'))

@app.route('/error_regla', methods=['POST'])
def post_error_regla():
    data = request.get_json()
    try:
        query_db('INSERT INTO error_regla (error_id, regla_id) VALUES (%s, %s);', 
                 (data.get('error_id'), data.get('regla_id')), commit=True)
        return jsonify({"message": "Relación creada"}), 201
    except Exception as e:
        return jsonify({"error": str(e)}), 400

@app.route('/error_regla', methods=['DELETE'])
def delete_error_regla():
    error_id = request.args.get('error_id')
    regla_id = request.args.get('regla_id')
    try:
        query_db('DELETE FROM error_regla WHERE error_id = %s AND regla_id = %s;', 
                 (error_id, regla_id), commit=True)
        return jsonify({"message": "Relación eliminada"}), 200
    except Exception as e:
        return jsonify({"error": str(e)}), 400

# Endpoint de ejecución de código
@app.route('/execute', methods=['POST'])
def execute_code():
    if 'file' not in request.files:
        return jsonify({"error": "No se recibió ningún archivo"}), 400
    
    file = request.files['file']
    if file.filename == '':
        return jsonify({"error": "Archivo sin nombre"}), 400

    filename = file.filename
    ext = os.path.splitext(filename)[1].lower()
    
    supported_extensions = ['.py', '.lua', '.java']
    if ext not in supported_extensions:
        return jsonify({"error": f"Extensión no soportada: {ext}. Solo {', '.join(supported_extensions)}"}), 400

    # Crear un directorio temporal para la ejecución
    with tempfile.TemporaryDirectory(dir='/tmp') as tmp_dir:
        # Dar permisos de lectura y ejecución al directorio para el usuario sandbox
        os.chmod(tmp_dir, 0o755)
        
        file_path = os.path.join(tmp_dir, filename)
        file.save(file_path)
        # Dar permisos al archivo para que el sandbox pueda leerlo/ejecutarlo
        os.chmod(file_path, 0o755)
        
        try:
            if ext == '.py':
                python_bin = shutil.which('python3') or '/usr/bin/python3'
                cmd = [python_bin, file_path]
            elif ext == '.lua':
                lua_bin = shutil.which('lua5.4') or shutil.which('lua5.3') or shutil.which('lua') or '/usr/bin/lua'
                cmd = [lua_bin, file_path]
            elif ext == '.java':
                # Java requiere compilación. 
                # 1. Detectar si hay una clase pública para renombrar el archivo (exigencia de Java)
                with open(file_path, 'r') as f:
                    content = f.read()
                import re
                match = re.search(r'public\s+class\s+(\w+)', content)
                if match:
                    class_name = match.group(1)
                    new_file_path = os.path.join(tmp_dir, f"{class_name}.java")
                    os.rename(file_path, new_file_path)
                    file_path = new_file_path
                else:
                    class_name = os.path.splitext(filename)[0]

                # 2. Compilar
                javac_bin = shutil.which('javac') or '/usr/bin/javac'
                compile_res = subprocess.run([javac_bin, file_path], capture_output=True, text=True, timeout=15)
                if compile_res.returncode != 0:
                    return jsonify({
                        "status": "compilation_error",
                        "stdout": compile_res.stdout,
                        "stderr": compile_res.stderr
                    }), 400
                
                # Asegurar que los archivos .class generados sean accesibles
                for f_name in os.listdir(tmp_dir):
                    if f_name.endswith('.class'):
                        os.chmod(os.path.join(tmp_dir, f_name), 0o755)

                # 3. Si no existe el .class con el nombre esperado (porque no era public pero se llamaba distinto)
                # buscamos qué .class se generó.
                if not os.path.exists(os.path.join(tmp_dir, f"{class_name}.class")):
                    class_files = [f_file for f_file in os.listdir(tmp_dir) if f_file.endswith('.class')]
                    if class_files:
                        # Priorizamos el que tenga nombre parecido o simplemente el primero
                        class_name = class_files[0].replace('.class', '')

                java_bin = shutil.which('java') or '/usr/bin/java'
                cmd = [java_bin, '-cp', tmp_dir, class_name]
            
            # Obtener datos de entrada
            # Si el usuario envía -F "input=['a','b']", intentamos parsearlo como lista
            raw_input = request.form.get('input', '')
            input_data = ""
            
            if raw_input:
                if raw_input.startswith('[') and raw_input.endswith(']'):
                    try:
                        import ast
                        parsed_list = ast.literal_eval(raw_input)
                        if isinstance(parsed_list, list):
                            input_data = "\n".join(map(str, parsed_list)) + "\n"
                        else:
                            input_data = raw_input + "\n"
                    except:
                        input_data = raw_input + "\n"
                else:
                    input_data = raw_input + "\n"
            
            # También soportar múltiples campos -F "input=a" -F "input=b" por si acaso
            input_list = request.form.getlist('input')
            if len(input_list) > 1:
                input_data = "\n".join(input_list) + "\n"
            
            # Sanitizar el input eliminando los retornos de carro (\r)
            if input_data:
                input_data = input_data.replace('\r', '')
            
            # Ejecutar con un timeout de seguridad y en un SANDBOX
            # Usamos sudo -u sandbox_user para aislar la ejecución
            sandbox_cmd = ['sudo', '-n', '-u', 'sandbox_user'] + cmd
            result = subprocess.run(sandbox_cmd, input=input_data, capture_output=True, text=True, timeout=10)
            
            return jsonify({
                "status": "success" if result.returncode == 0 else "error",
                "stdout": result.stdout,
                "stderr": result.stderr,
                "exit_code": result.returncode,
                "sandboxed": True
            })
            
        except subprocess.TimeoutExpired:
            return jsonify({"error": "Tiempo de ejecución excedido (Timeout)"}), 408
        except Exception as e:
            return jsonify({"error": str(e)}), 500

@app.route('/ask', methods=['POST'])
def ask_knowledge():
    data = request.get_json()
    question = data.get('question')
    limit = data.get('limit', 5)
    
    if not question:
        return jsonify({"error": "Falta el campo 'question'"}), 400
        
    try:
        # 1. Convertir pregunta -> embedding
        # Usamos torch.no_grad() para ahorrar memoria en inferencia
        import torch
        with torch.no_grad():
            q_embedding = model.encode(question).tolist()
        
        # 2. Consultar PostgreSQL usando el operador <=> (distancia del coseno)
        # Retornamos el contenido y metadata útil
        query_sql = """
            SELECT content, topic_id, level,
                   (1 - (embedding <=> %s::vector)) as similarity
            FROM knowledge_chunks
            ORDER BY embedding <=> %s::vector
            LIMIT %s;
        """
        results = query_db(query_sql, (q_embedding, q_embedding, limit))
        
        return jsonify({
            "question": question,
            "results": results
        })
        
    except Exception as e:
        return jsonify({"error": str(e)}), 500

if __name__ == '__main__':
    port = int(os.getenv("FLASK_PORT", 5001))
    app.run(host='0.0.0.0', port=port, debug=True)
