import axios from "axios";

const baseUrl = "http://localhost:2022/users";

export const login = async (payload) => {
  try {
    const response = axios.post( baseUrl + "/users/login", payload);
    return response;
  } catch (error) {
    throw error;
  }
};

export const registerUser = async (payload) => {
    try {
      const updatedPayload = {
        ...payload,
        createdBy : "UI"
      }
      const response = axios.post( baseUrl + "/users/signup", updatedPayload);
      return response;
    } catch (error) {
      throw error;
    }
  };


export const fetchUserByUsername = async (username) => {
  try {
    const response = axios.get( baseUrl + "/users/username/" + username);
    return response;
  } catch (error) {
    throw error;
  }
};