import { useState, useEffect } from 'react'
import { GoogleLogin } from '@react-oauth/google'
import axios from 'axios'
import './App.css'
import AdminPanel from './AdminPanel'

function App() {
  const [user, setUser] = useState(null)
  const [loading, setLoading] = useState(false)
  const [isAdminMode, setIsAdminMode] = useState(window.location.pathname === '/admin')

  useEffect(() => {
    // Check if user is already logged in
    const storedUser = localStorage.getItem('user')
    if (storedUser) {
      setUser(JSON.parse(storedUser))
    }

    // Escuchar eventos de navegación del navegador (atrás/adelante)
    const handlePopState = () => {
      setIsAdminMode(window.location.pathname === '/admin');
    };
    window.addEventListener('popstate', handlePopState);
    return () => window.removeEventListener('popstate', handlePopState);
  }, [])

  const navigateToAdmin = () => {
    window.history.pushState({}, '', '/admin');
    setIsAdminMode(true);
  };

  const navigateToHome = () => {
    window.history.pushState({}, '', '/');
    setIsAdminMode(false);
  };

  const handleLoginSuccess = async (credentialResponse) => {
    setLoading(true)
    try {
      const { credential } = credentialResponse
      const response = await axios.post('/api/auth/google', { credential })
      
      const { token, user: userData } = response.data
      
      // Store JWT and user info
      localStorage.setItem('token', token)
      localStorage.setItem('user', JSON.stringify(userData))
      
      setUser(userData)
    } catch (error) {
      console.error('Login failed:', error)
      alert('Error during login. Please try again.')
    } finally {
      setLoading(false)
    }
  }

  const handleLogout = () => {
    localStorage.removeItem('token')
    localStorage.removeItem('user')
    setUser(null)
  }

  if (isAdminMode) {
    return <AdminPanel onBack={navigateToHome} />;
  }

  return (
    <div className="container">
      <div className="card">
        <h1>DeepTutor</h1>
        <p className="subtitle">Your AI-Powered Learning Assistant</p>

        {!user ? (
          <div className="login-section">
            <p>Sign in to continue</p>
            {loading ? (
              <div className="loader"></div>
            ) : (
              <>
                <GoogleLogin
                  onSuccess={handleLoginSuccess}
                  onError={() => console.log('Login Failed')}
                  useOneTap
                />
                <div className="admin-shortcut">
                  <button onClick={navigateToAdmin} className="admin-link-btn">
                    ⚙️ Panel de Administración
                  </button>
                </div>
              </>
            )}
          </div>
        ) : (
          <div className="profile-section">
            <img src={user.picture} alt={user.name} className="avatar" />
            <h2>Welcome, {user.name}!</h2>
            <p>{user.email}</p>
            <div className="profile-actions">
              <button onClick={navigateToAdmin} className="admin-btn">
                ⚙️ Ir al Panel de Admin
              </button>
              <button onClick={handleLogout} className="logout-btn">
                Sign Out
              </button>
            </div>
          </div>
        )}
      </div>
    </div>
  )
}

export default App
