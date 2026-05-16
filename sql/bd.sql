-- =========================
-- ðŸ‘¤ USUARIOS
-- =========================
CREATE TABLE usuarios (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100),
    email VARCHAR(150) UNIQUE,
    password_hash VARCHAR(255),
    nivel VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- =========================
-- ðŸ§  TOPICS
-- =========================
CREATE TABLE topics (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100),
    descripcion TEXT,
    parent_id INT,
    FOREIGN KEY (parent_id) REFERENCES topics(id)
);

-- =========================
-- ðŸ“Š PROGRESO USUARIO
-- =========================
CREATE TABLE progreso_usuario (
    id SERIAL PRIMARY KEY,
    usuario_id INT,
    topic_id INT,
    nivel INT,
    score INT,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id),
    FOREIGN KEY (topic_id) REFERENCES topics(id)
);

-- =========================
-- ðŸ§ª EJERCICIOS
-- =========================
CREATE TABLE ejercicios (
    id SERIAL PRIMARY KEY,
    titulo VARCHAR(150),
    descripcion TEXT,
    dificultad INT,
    topic_id INT,
    FOREIGN KEY (topic_id) REFERENCES topics(id)
);

-- =========================
-- ðŸ§ª CASOS DE PRUEBA
-- =========================
CREATE TABLE casos_prueba (
    id SERIAL PRIMARY KEY,
    ejercicio_id INT,
    input TEXT,
    output_esperado TEXT,
    FOREIGN KEY (ejercicio_id) REFERENCES ejercicios(id)
);

-- =========================
-- ðŸ’¬ CONVERSACIONES
-- =========================
CREATE TABLE conversaciones (
    id SERIAL PRIMARY KEY,
    usuario_id INT,
    started_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
);

-- =========================
-- ðŸ’¬ CHAT (MENSAJES)
-- =========================
CREATE TABLE chat (
    id SERIAL PRIMARY KEY,
    usuario_id INT,
    conversacion_id INT,
    mensaje TEXT,
    respuesta TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id),
    FOREIGN KEY (conversacion_id) REFERENCES conversaciones(id)
);

-- =========================
-- âš ï¸ ERRORES DETECTADOS
-- =========================
CREATE TABLE errores_detectados (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100),
    tipo VARCHAR(50),
    descripcion TEXT
);

-- =========================
-- ðŸ“œ REGLAS DE VALIDACIÃ“N
-- =========================
CREATE TABLE reglas_validacion (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100),
    condicion JSON,
    accion JSON,
    activa BOOLEAN DEFAULT TRUE
);

-- =========================
-- ðŸ”— RELACIÃ“N ERROR - REGLA
-- =========================
CREATE TABLE error_regla (
    error_id INT,
    regla_id INT,
    PRIMARY KEY (error_id, regla_id),
    FOREIGN KEY (error_id) REFERENCES errores_detectados(id),
    FOREIGN KEY (regla_id) REFERENCES reglas_validacion(id)
);

-- =========================
-- ðŸ“‰ ERRORES POR USUARIO
-- =========================
CREATE TABLE user_errors (
    id SERIAL PRIMARY KEY,
    usuario_id INT,
    error_id INT,
    contador INT DEFAULT 1,
    last_seen TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id),
    FOREIGN KEY (error_id) REFERENCES errores_detectados(id)
);

-- =========================
-- ðŸ§  BASE DE CONOCIMIENTO
-- =========================
CREATE TABLE base_conocimiento (
    id SERIAL PRIMARY KEY,
    topic_id INT,
    contenido TEXT,
    nivel VARCHAR(50),
    FOREIGN KEY (topic_id) REFERENCES topics(id)
);