import { jwtDecode } from "jwt-decode";

const decodeToken = (token) => {
  try {
    return jwtDecode(token);
  } catch (error) {
    return null;
  }
};

export const getUsername = () => {
  try {
    const authToken = localStorage.getItem("authToken");
    const decodedToken = jwtDecode(authToken);
    return decodedToken?.sub;
  } catch (error) {
    return null;
  }
};

export const getUserFullName = () => {
  try {
    const authToken = localStorage.getItem("authToken");
    const decodedToken = jwtDecode(authToken);
    return decodedToken?.firstName + " " + decodedToken?.lastName;
  } catch (error) {
    return null;
  }
};

export const getRole = () => {
  try {
    const authToken = localStorage.getItem("authToken");
    const decodedToken = jwtDecode(authToken);    
    return decodedToken?.role;
  } catch (error) {
    return null;
  }
};

export default decodeToken;
