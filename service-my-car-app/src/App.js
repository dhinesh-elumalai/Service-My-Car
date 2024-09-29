// src/App.js
import React from "react";
import { BrowserRouter as Router, Routes, Route } from "react-router-dom";
import Login from "./pages/Login";
import Signup from "./pages/Signup";
import PrivateRoute from "./components/PrivateRoute";
import MainPage from "./pages/MainPage";
import Logout from "./pages/Logout";
import TermsAndConditions from "./pages/TermsAndConditions/TermsAndConditions";

const App = () => {
  return (
    <Router>
      <Routes>
        <Route path="/login" element={<Login />} />
        <Route path="/signup" element={<Signup />} />
        <Route path="/app/logout" element={<Logout />} />
        <Route path="/terms" element={<TermsAndConditions />} />
        <Route
          path="/app/*"
          element={
            <PrivateRoute>
              <MainPage />
            </PrivateRoute>
          }
        />
      </Routes>
    </Router>
  );
};

export default App;
