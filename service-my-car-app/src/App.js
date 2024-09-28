import React, { useState, useEffect } from 'react';
import { BrowserRouter as Router, Route, Routes, Navigate } from 'react-router-dom';
import Signup from './pages/Signup';
import Login from './pages/Login';
import Dashboard from './components/Dashboard';
import { decodeToken } from './utils/token';

const App = () => {
  const [token, setToken] = useState(localStorage.getItem('token'));
  const [user, setUser] = useState(null);

  useEffect(() => {
    if (token) {
      const decodedUser = decodeToken(token);
      setUser(decodedUser);
      localStorage.setItem('token', token);
    } else {
      setUser(null);
      localStorage.removeItem('token');
    }
  }, [token]);

  return (
    <>
    <Router>
      <Routes>
        <Route path="/signup" element={<Signup/>} />
        <Route path="/login" element={<Login setToken={setToken} />}/>
        <Route path="/dashboard" element={user ? <Dashboard user={user} /> : <Navigate to="/login" />}>
        </Route>
        <Navigate from="/" to="/login" />
      </Routes>
    </Router>
    </>
  );
};

export default App;