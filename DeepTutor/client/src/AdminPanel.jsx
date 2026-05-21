import React, { useState, useEffect } from 'react';
import axios from 'axios';
import './AdminPanel.css';

// Valores por defecto inteligentes
const getDefaultApiUrl = () => {
  const hostname = window.location.hostname || 'localhost';
  return `${window.location.protocol}//${hostname}:5001`;
};

const DEFAULT_API_KEY = '806bfc1ea9173997e05e9d23263556b3';

export default function AdminPanel({ onBack }) {
  // Configuración de API
  const [apiUrl, setApiUrl] = useState(() => localStorage.getItem('admin_api_url') || getDefaultApiUrl());
  const [apiKey, setApiKey] = useState(() => localStorage.getItem('admin_api_key') || DEFAULT_API_KEY);
  const [showConfig, setShowConfig] = useState(false);
  const [apiStatus, setApiStatus] = useState('unknown'); // 'unknown' | 'ok' | 'error'

  // Datos
  const [exercises, setExercises] = useState([]);
  const [topics, setTopics] = useState([]);
  const [loading, setLoading] = useState(false);
  const [notification, setNotification] = useState(null); // { type: 'success'|'error'|'info', message: '' }

  // Filtros y Búsqueda
  const [searchQuery, setSearchQuery] = useState('');
  const [filterTopic, setFilterTopic] = useState('');
  const [filterDifficulty, setFilterDifficulty] = useState('');

  // Formulario de Ejercicio
  const [selectedId, setSelectedId] = useState(null); // null para nuevo ejercicio
  const [titulo, setTitulo] = useState('');
  const [descripcion, setDescripcion] = useState('');
  const [dificultad, setDificultad] = useState('Principiante');
  const [topicId, setTopicId] = useState('');
  const [entrada, setEntrada] = useState('');
  const [salida, setSalida] = useState('');
  const [requisitos, setRequisitos] = useState('');
  
  // Listas dinámicas para Ejemplos y Casos de Prueba
  const [examples, setExamples] = useState([{ Entrada: '', Salida: '' }]);
  const [testCases, setTestCases] = useState([{ Entrada: '', Salida: '' }]);

  // Formulario de Nuevo Tópico
  const [showTopicModal, setShowTopicModal] = useState(false);
  const [newTopicNombre, setNewTopicNombre] = useState('');
  const [newTopicDescripcion, setNewTopicDescripcion] = useState('');
  const [newTopicParentId, setNewTopicParentId] = useState('');

  // Guardar configuración en localStorage
  useEffect(() => {
    localStorage.setItem('admin_api_url', apiUrl);
    localStorage.setItem('admin_api_key', apiKey);
  }, [apiUrl, apiKey]);

  // Toast auto-hide
  useEffect(() => {
    if (notification) {
      const timer = setTimeout(() => setNotification(null), 5000);
      return () => clearTimeout(timer);
    }
  }, [notification]);

  // Verificar conexión a la API al inicio
  useEffect(() => {
    checkApiConnection();
  }, [apiUrl, apiKey]);

  const showToast = (type, message) => {
    setNotification({ type, message });
  };

  const getHeaders = () => ({
    'Content-Type': 'application/json',
    'X-API-Key': apiKey
  });

  const checkApiConnection = async () => {
    try {
      setApiStatus('unknown');
      const res = await axios.get(`${apiUrl}/health`);
      if (res.data && res.data.status === 'ok') {
        setApiStatus('ok');
        fetchInitialData();
      } else {
        setApiStatus('error');
      }
    } catch (err) {
      setApiStatus('error');
      console.error('Error connecting to Flask API:', err);
    }
  };

  const fetchInitialData = async () => {
    setLoading(true);
    try {
      const [exRes, topRes] = await Promise.all([
        axios.get(`${apiUrl}/ejercicios`, { headers: getHeaders() }),
        axios.get(`${apiUrl}/topics`, { headers: getHeaders() })
      ]);
      setExercises(exRes.data || []);
      setTopics(topRes.data || []);
    } catch (err) {
      showToast('error', 'Error al cargar los datos desde la API: ' + (err.response?.data?.error || err.message));
    } finally {
      setLoading(false);
    }
  };

  // Manejar Ejemplos
  const handleExampleChange = (index, field, value) => {
    const updated = [...examples];
    updated[index][field] = value;
    setExamples(updated);
  };

  const addExample = () => {
    setExamples([...examples, { Entrada: '', Salida: '' }]);
  };

  const removeExample = (index) => {
    if (examples.length === 1) {
      setExamples([{ Entrada: '', Salida: '' }]);
    } else {
      setExamples(examples.filter((_, i) => i !== index));
    }
  };

  // Manejar Casos de Prueba
  const handleTestCaseChange = (index, field, value) => {
    const updated = [...testCases];
    updated[index][field] = value;
    setTestCases(updated);
  };

  const addTestCase = () => {
    setTestCases([...testCases, { Entrada: '', Salida: '' }]);
  };

  const removeTestCase = (index) => {
    if (testCases.length === 1) {
      setTestCases([{ Entrada: '', Salida: '' }]);
    } else {
      setTestCases(testCases.filter((_, i) => i !== index));
    }
  };

  const copyExamplesToTestCases = () => {
    // Copia profunda
    const copied = examples.map(ex => ({ ...ex }));
    setTestCases(copied);
    showToast('info', 'Ejemplos copiados a Casos de Prueba.');
  };

  // Crear Tópico
  const handleCreateTopic = async (e) => {
    e.preventDefault();
    if (!newTopicNombre.trim()) {
      showToast('error', 'El nombre del tópico es obligatorio.');
      return;
    }

    try {
      const payload = {
        nombre: newTopicNombre.trim(),
        descripcion: newTopicDescripcion.trim() || null,
        parent_id: newTopicParentId ? parseInt(newTopicParentId, 10) : null
      };

      const res = await axios.post(`${apiUrl}/topics`, payload, { headers: getHeaders() });
      showToast('success', `Tópico "${newTopicNombre}" creado correctamente.`);
      
      // Actualizar lista de tópicos
      const topRes = await axios.get(`${apiUrl}/topics`, { headers: getHeaders() });
      setTopics(topRes.data || []);
      
      // Pre-seleccionar el recién creado
      if (res.data && res.data.id) {
        setTopicId(res.data.id.toString());
      }

      // Cerrar modal y limpiar
      setShowTopicModal(false);
      setNewTopicNombre('');
      setNewTopicDescripcion('');
      setNewTopicParentId('');
    } catch (err) {
      showToast('error', 'Error al crear tópico: ' + (err.response?.data?.error || err.message));
    }
  };

  // Enviar formulario (Crear / Actualizar Ejercicio)
  const handleSubmitExercise = async (e) => {
    e.preventDefault();

    if (!titulo.trim()) return showToast('error', 'El título es obligatorio.');
    if (!descripcion.trim()) return showToast('error', 'La descripción es obligatoria.');
    if (!topicId) return showToast('error', 'Debes seleccionar un tópico.');

    // Validar ejemplos y casos de prueba
    const filteredExamples = examples.filter(ex => ex.Entrada.trim() !== '' || ex.Salida.trim() !== '');
    const filteredTestCases = testCases.filter(tc => tc.Entrada.trim() !== '' || tc.Salida.trim() !== '');

    if (filteredExamples.length === 0) {
      return showToast('error', 'Debes añadir al menos un ejemplo visible para el alumno.');
    }
    if (filteredTestCases.length === 0) {
      return showToast('error', 'Debes añadir al menos un caso de prueba para la evaluación.');
    }

    const payload = {
      titulo: titulo.trim(),
      descripcion: descripcion.trim(),
      dificultad: dificultad,
      topic_id: parseInt(topicId, 10),
      entrada: entrada.trim(),
      salida: salida.trim(),
      requisitos: requisitos.trim() || null,
      ejemplos: filteredExamples,
      casos_prueba: filteredTestCases
    };

    setLoading(true);
    try {
      if (selectedId) {
        // Actualizar existente
        await axios.put(`${apiUrl}/ejercicios/${selectedId}`, payload, { headers: getHeaders() });
        showToast('success', 'Ejercicio actualizado correctamente.');
      } else {
        // Crear nuevo
        await axios.post(`${apiUrl}/ejercicios`, payload, { headers: getHeaders() });
        showToast('success', 'Ejercicio creado correctamente en la base de datos.');
      }
      
      resetForm();
      fetchInitialData();
    } catch (err) {
      showToast('error', 'Error al guardar ejercicio: ' + (err.response?.data?.error || err.message));
    } finally {
      setLoading(false);
    }
  };

  // Cargar ejercicio para edición
  const handleEditExercise = (ex) => {
    setSelectedId(ex.id);
    setTitulo(ex.titulo || '');
    setDescripcion(ex.descripcion || '');
    setDificultad(ex.dificultad || 'Principiante');
    setTopicId(ex.topic_id ? ex.topic_id.toString() : '');
    setEntrada(ex.entrada || '');
    setSalida(ex.salida || '');
    setRequisitos(ex.requisitos || '');
    
    // Parsear ejemplos
    try {
      const parsedExamples = typeof ex.ejemplos === 'string' ? JSON.parse(ex.ejemplos) : ex.ejemplos;
      setExamples(parsedExamples && parsedExamples.length ? parsedExamples : [{ Entrada: '', Salida: '' }]);
    } catch (e) {
      setExamples([{ Entrada: '', Salida: '' }]);
    }

    // Parsear casos_prueba
    try {
      const parsedTestCases = typeof ex.casos_prueba === 'string' ? JSON.parse(ex.casos_prueba) : ex.casos_prueba;
      setTestCases(parsedTestCases && parsedTestCases.length ? parsedTestCases : [{ Entrada: '', Salida: '' }]);
    } catch (e) {
      setTestCases([{ Entrada: '', Salida: '' }]);
    }

    window.scrollTo({ top: 0, behavior: 'smooth' });
    showToast('info', `Cargado: "${ex.titulo}" para editar.`);
  };

  // Duplicar ejercicio
  const handleDuplicateExercise = (ex) => {
    setSelectedId(null); // Quitar ID para crear como nuevo
    setTitulo(`${ex.titulo} (Copia)`);
    setDescripcion(ex.descripcion || '');
    setDificultad(ex.dificultad || 'Principiante');
    setTopicId(ex.topic_id ? ex.topic_id.toString() : '');
    setEntrada(ex.entrada || '');
    setSalida(ex.salida || '');
    setRequisitos(ex.requisitos || '');

    try {
      const parsedExamples = typeof ex.ejemplos === 'string' ? JSON.parse(ex.ejemplos) : ex.ejemplos;
      setExamples(parsedExamples && parsedExamples.length ? parsedExamples : [{ Entrada: '', Salida: '' }]);
    } catch (e) {
      setExamples([{ Entrada: '', Salida: '' }]);
    }

    try {
      const parsedTestCases = typeof ex.casos_prueba === 'string' ? JSON.parse(ex.casos_prueba) : ex.casos_prueba;
      setTestCases(parsedTestCases && parsedTestCases.length ? parsedTestCases : [{ Entrada: '', Salida: '' }]);
    } catch (e) {
      setTestCases([{ Entrada: '', Salida: '' }]);
    }

    window.scrollTo({ top: 0, behavior: 'smooth' });
    showToast('info', `Duplicando: "${ex.titulo}". Se creará una copia al guardar.`);
  };

  // Eliminar ejercicio
  const handleDeleteExercise = async (id, title) => {
    if (!window.confirm(`¿Estás seguro de que deseas eliminar el ejercicio "${title}"?`)) {
      return;
    }

    setLoading(true);
    try {
      await axios.delete(`${apiUrl}/ejercicios/${id}`, { headers: getHeaders() });
      showToast('success', `Ejercicio "${title}" eliminado.`);
      if (selectedId === id) resetForm();
      fetchInitialData();
    } catch (err) {
      showToast('error', 'Error al eliminar: ' + (err.response?.data?.error || err.message));
    } finally {
      setLoading(false);
    }
  };

  const resetForm = () => {
    setSelectedId(null);
    setTitulo('');
    setDescripcion('');
    setDificultad('Principiante');
    setTopicId('');
    setEntrada('');
    setSalida('');
    setRequisitos('');
    setExamples([{ Entrada: '', Salida: '' }]);
    setTestCases([{ Entrada: '', Salida: '' }]);
  };

  // Filtrado de ejercicios para la tabla
  const filteredExercises = exercises.filter(ex => {
    const matchesSearch = 
      (ex.titulo || '').toLowerCase().includes(searchQuery.toLowerCase()) ||
      (ex.descripcion || '').toLowerCase().includes(searchQuery.toLowerCase());
    
    const matchesTopic = filterTopic === '' || ex.topic_id?.toString() === filterTopic;
    const matchesDiff = filterDifficulty === '' || ex.dificultad === filterDifficulty;

    return matchesSearch && matchesTopic && matchesDiff;
  });

  const getTopicName = (id) => {
    const t = topics.find(topic => topic.id === id);
    return t ? t.nombre : `ID: ${id}`;
  };

  return (
    <div className="admin-wrapper">
      {/* Toast Notification */}
      {notification && (
        <div className={`toast toast-${notification.type}`}>
          <div className="toast-content">
            <span className="toast-icon">
              {notification.type === 'success' && '✅'}
              {notification.type === 'error' && '❌'}
              {notification.type === 'info' && '💡'}
            </span>
            <span className="toast-msg">{notification.message}</span>
          </div>
          <button className="toast-close" onClick={() => setNotification(null)}>×</button>
        </div>
      )}

      {/* Cabecera */}
      <header className="admin-header">
        <div className="header-left">
          <button onClick={onBack} className="btn-back">
            ← Volver
          </button>
          <div className="title-group">
            <h1>Panel de Administración</h1>
            <p className="subtitle-admin">Creador de Ejercicios y Tópicos</p>
          </div>
        </div>

        <div className="header-right">
          <div className={`status-badge status-${apiStatus}`}>
            <span className="status-dot"></span>
            API: {apiStatus === 'ok' ? 'Conectada' : apiStatus === 'error' ? 'Error de Conexión' : 'Verificando...'}
          </div>
          <button onClick={() => setShowConfig(!showConfig)} className="btn-config-toggle">
            ⚙️ Conexión
          </button>
        </div>
      </header>

      {/* Configuración de API */}
      {showConfig && (
        <div className="config-banner card-admin">
          <h3>Configuración de la API local de Flask</h3>
          <div className="config-grid">
            <div className="input-group">
              <label>URL base de la API</label>
              <input 
                type="text" 
                value={apiUrl} 
                onChange={(e) => setApiUrl(e.target.value)} 
                placeholder="http://localhost:5001" 
              />
            </div>
            <div className="input-group">
              <label>Clave de la API (X-API-Key)</label>
              <input 
                type="password" 
                value={apiKey} 
                onChange={(e) => setApiKey(e.target.value)} 
                placeholder="Introduce la clave API" 
              />
            </div>
          </div>
          <div className="config-buttons">
            <button onClick={checkApiConnection} className="btn-save">
              Probar y Guardar Conexión
            </button>
            <button onClick={() => setShowConfig(false)} className="btn-text">
              Cerrar
            </button>
          </div>
        </div>
      )}

      <main className="admin-grid">
        {/* Columna Izquierda: Formulario */}
        <section className="admin-col form-col">
          <div className="card-admin">
            <div className="form-header">
              <h2>{selectedId ? '✏️ Editar Ejercicio' : '✨ Crear Ejercicio'}</h2>
              {selectedId && (
                <button type="button" onClick={resetForm} className="btn-badge-clear">
                  Cancelar Edición ×
                </button>
              )}
            </div>

            <form onSubmit={handleSubmitExercise} className="exercise-form">
              <div className="input-group">
                <label>Título del Ejercicio</label>
                <input 
                  type="text" 
                  value={titulo} 
                  onChange={(e) => setTitulo(e.target.value)} 
                  placeholder="Ej: Suma de dos números"
                  required
                />
              </div>

              <div className="form-row-2">
                <div className="input-group">
                  <label>Dificultad</label>
                  <select value={dificultad} onChange={(e) => setDificultad(e.target.value)}>
                    <option value="Principiante">Principiante</option>
                    <option value="Intermedio">Intermedio</option>
                    <option value="Avanzado">Avanzado</option>
                  </select>
                </div>

                <div className="input-group">
                  <label>
                    Tópico 
                    <button 
                      type="button" 
                      onClick={() => setShowTopicModal(true)} 
                      className="btn-link-action"
                    >
                      + Crear Nuevo
                    </button>
                  </label>
                  <select 
                    value={topicId} 
                    onChange={(e) => setTopicId(e.target.value)}
                    required
                  >
                    <option value="">Selecciona un tópico...</option>
                    {topics.map(t => (
                      <option key={t.id} value={t.id}>{t.nombre}</option>
                    ))}
                  </select>
                </div>
              </div>

              <div className="input-group">
                <label>Descripción / Enunciado</label>
                <textarea 
                  value={descripcion} 
                  onChange={(e) => setDescripcion(e.target.value)} 
                  placeholder="Escribe el enunciado detallado del ejercicio..."
                  rows="4"
                  required
                ></textarea>
              </div>

              <div className="form-row-3">
                <div className="input-group">
                  <label>Formato de Entrada</label>
                  <textarea 
                    value={entrada} 
                    onChange={(e) => setEntrada(e.target.value)} 
                    placeholder="Ej: Un entero N en la primera línea..."
                    rows="2"
                  ></textarea>
                </div>

                <div className="input-group">
                  <label>Formato de Salida</label>
                  <textarea 
                    value={salida} 
                    onChange={(e) => setSalida(e.target.value)} 
                    placeholder="Ej: El valor de la suma..."
                    rows="2"
                  ></textarea>
                </div>

                <div className="input-group">
                  <label>Requisitos / Restricciones</label>
                  <textarea 
                    value={requisitos} 
                    onChange={(e) => setRequisitos(e.target.value)} 
                    placeholder="Ej: Tiempo límite: 1.0s&#10;Límite memoria: 64MB"
                    rows="2"
                  ></textarea>
                </div>
              </div>

              {/* Sección Ejemplos */}
              <div className="section-builder">
                <div className="builder-header">
                  <h3>Ejemplos para el Alumno</h3>
                  <button type="button" onClick={addExample} className="btn-add-item">
                    + Añadir Ejemplo
                  </button>
                </div>
                <p className="builder-description">Estos ejemplos se muestran directamente en el enunciado para que el estudiante comprenda el ejercicio.</p>
                
                <div className="builder-list">
                  {examples.map((ex, index) => (
                    <div key={index} className="builder-row">
                      <div className="row-num">{index + 1}</div>
                      <div className="textarea-wrapper">
                        <textarea
                          value={ex.Entrada}
                          onChange={(e) => handleExampleChange(index, 'Entrada', e.target.value)}
                          placeholder="Entrada del ejemplo"
                          rows="2"
                        />
                      </div>
                      <div className="textarea-wrapper">
                        <textarea
                          value={ex.Salida}
                          onChange={(e) => handleExampleChange(index, 'Salida', e.target.value)}
                          placeholder="Salida esperada"
                          rows="2"
                        />
                      </div>
                      <button 
                        type="button" 
                        onClick={() => removeExample(index)} 
                        className="btn-remove-item"
                        title="Eliminar este ejemplo"
                      >
                        ×
                      </button>
                    </div>
                  ))}
                </div>
              </div>

              {/* Sección Casos de Prueba */}
              <div className="section-builder">
                <div className="builder-header">
                  <h3>Casos de Prueba (Evaluador)</h3>
                  <div className="builder-actions">
                    <button type="button" onClick={copyExamplesToTestCases} className="btn-secondary-action">
                      📋 Copiar desde Ejemplos
                    </button>
                    <button type="button" onClick={addTestCase} className="btn-add-item">
                      + Añadir Caso
                    </button>
                  </div>
                </div>
                <p className="builder-description">Entradas y salidas exactas que el validador utilizará de forma oculta para juzgar el código enviado.</p>
                
                <div className="builder-list">
                  {testCases.map((tc, index) => (
                    <div key={index} className="builder-row">
                      <div className="row-num">{index + 1}</div>
                      <div className="textarea-wrapper">
                        <textarea
                          value={tc.Entrada}
                          onChange={(e) => handleTestCaseChange(index, 'Entrada', e.target.value)}
                          placeholder="Entrada de prueba"
                          rows="2"
                        />
                      </div>
                      <div className="textarea-wrapper">
                        <textarea
                          value={tc.Salida}
                          onChange={(e) => handleTestCaseChange(index, 'Salida', e.target.value)}
                          placeholder="Salida esperada"
                          rows="2"
                        />
                      </div>
                      <button 
                        type="button" 
                        onClick={() => removeTestCase(index)} 
                        className="btn-remove-item"
                        title="Eliminar este caso"
                      >
                        ×
                      </button>
                    </div>
                  ))}
                </div>
              </div>

              <div className="form-submit-row">
                <button type="submit" disabled={loading} className="btn-submit">
                  {loading ? 'Procesando...' : selectedId ? '💾 Guardar Cambios' : '🚀 Crear Ejercicio'}
                </button>
                {selectedId && (
                  <button type="button" onClick={resetForm} className="btn-cancel">
                    Cancelar
                  </button>
                )}
              </div>
            </form>
          </div>
        </section>

        {/* Columna Derecha: Listado y Filtros */}
        <section className="admin-col list-col">
          <div className="card-admin">
            <h2>📚 Ejercicios en Base de Datos</h2>
            
            {/* Buscador y Filtros */}
            <div className="filters-container">
              <div className="search-box">
                <span className="search-icon">🔍</span>
                <input 
                  type="text" 
                  value={searchQuery}
                  onChange={(e) => setSearchQuery(e.target.value)}
                  placeholder="Buscar ejercicio por título o enunciado..." 
                />
              </div>

              <div className="filters-row">
                <div className="filter-item">
                  <select value={filterTopic} onChange={(e) => setFilterTopic(e.target.value)}>
                    <option value="">Todos los Tópicos</option>
                    {topics.map(t => (
                      <option key={t.id} value={t.id}>{t.nombre}</option>
                    ))}
                  </select>
                </div>

                <div className="filter-item">
                  <select value={filterDifficulty} onChange={(e) => setFilterDifficulty(e.target.value)}>
                    <option value="">Todas las Dificultades</option>
                    <option value="Principiante">Principiante</option>
                    <option value="Intermedio">Intermedio</option>
                    <option value="Avanzado">Avanzado</option>
                  </select>
                </div>
              </div>
            </div>

            {/* Listado */}
            <div className="exercises-list-wrapper">
              {loading && exercises.length === 0 ? (
                <div className="list-loader-container">
                  <div className="loader"></div>
                  <p>Cargando catálogo de ejercicios...</p>
                </div>
              ) : filteredExercises.length === 0 ? (
                <div className="no-results">
                  <p>No se encontraron ejercicios en la base de datos con los criterios seleccionados.</p>
                </div>
              ) : (
                <div className="exercises-table-container">
                  <table className="exercises-table">
                    <thead>
                      <tr>
                        <th>ID</th>
                        <th>Título</th>
                        <th>Tópico</th>
                        <th>Dificultad</th>
                        <th>Casos</th>
                        <th className="actions-header">Acciones</th>
                      </tr>
                    </thead>
                    <tbody>
                      {filteredExercises.map(ex => {
                        let numCases = 0;
                        try {
                          const parsed = typeof ex.casos_prueba === 'string' ? JSON.parse(ex.casos_prueba) : ex.casos_prueba;
                          numCases = parsed ? parsed.length : 0;
                        } catch (e) {}

                        return (
                          <tr key={ex.id} className={selectedId === ex.id ? 'row-editing' : ''}>
                            <td className="col-id">{ex.id}</td>
                            <td className="col-title">
                              <strong>{ex.titulo}</strong>
                              <p className="desc-truncated">{ex.descripcion ? ex.descripcion.substring(0, 70) + '...' : ''}</p>
                            </td>
                            <td>
                              <span className="badge-topic">{getTopicName(ex.topic_id)}</span>
                            </td>
                            <td>
                              <span className={`badge-diff diff-${(ex.dificultad || 'principiante').toLowerCase()}`}>
                                {ex.dificultad}
                              </span>
                            </td>
                            <td className="col-cases">{numCases}</td>
                            <td className="col-actions">
                              <button 
                                onClick={() => handleEditExercise(ex)} 
                                className="btn-action-edit"
                                title="Editar ejercicio"
                              >
                                ✏️
                              </button>
                              <button 
                                onClick={() => handleDuplicateExercise(ex)} 
                                className="btn-action-duplicate"
                                title="Duplicar como nuevo"
                              >
                                📋
                              </button>
                              <button 
                                onClick={() => handleDeleteExercise(ex.id, ex.titulo)} 
                                className="btn-action-delete"
                                title="Eliminar ejercicio"
                              >
                                🗑️
                              </button>
                            </td>
                          </tr>
                        );
                      })}
                    </tbody>
                  </table>
                </div>
              )}
            </div>
            
            <div className="list-footer-stats">
              Mostrando {filteredExercises.length} de {exercises.length} ejercicios
            </div>
          </div>
        </section>
      </main>

      {/* Modal para Crear Tópico */}
      {showTopicModal && (
        <div className="modal-overlay">
          <div className="modal-content card-admin">
            <div className="modal-header">
              <h2>🗂️ Crear Nuevo Tópico</h2>
              <button onClick={() => setShowTopicModal(false)} className="btn-modal-close">×</button>
            </div>

            <form onSubmit={handleCreateTopic}>
              <div className="input-group">
                <label>Nombre del Tópico</label>
                <input 
                  type="text" 
                  value={newTopicNombre} 
                  onChange={(e) => setNewTopicNombre(e.target.value)} 
                  placeholder="Ej: Control de Flujo, Algoritmos..."
                  required
                />
              </div>

              <div className="input-group">
                <label>Descripción</label>
                <textarea 
                  value={newTopicDescripcion} 
                  onChange={(e) => setNewTopicDescripcion(e.target.value)} 
                  placeholder="Describe de qué trata este tópico..."
                  rows="3"
                ></textarea>
              </div>

              <div className="input-group">
                <label>Tópico Padre (Subcategoría)</label>
                <select 
                  value={newTopicParentId} 
                  onChange={(e) => setNewTopicParentId(e.target.value)}
                >
                  <option value="">Ninguno (Categoría raíz)</option>
                  {topics.filter(t => !t.parent_id).map(t => (
                    <option key={t.id} value={t.id}>{t.nombre}</option>
                  ))}
                </select>
              </div>

              <div className="modal-actions">
                <button type="submit" className="btn-save">Crear Tópico</button>
                <button type="button" onClick={() => setShowTopicModal(false)} className="btn-cancel">
                  Cancelar
                </button>
              </div>
            </form>
          </div>
        </div>
      )}
    </div>
  );
}
