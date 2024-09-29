// File: src/services/carService.js
import axios from 'axios';
import { getUsername } from '../utils/token';

const API_BASE_URL = 'http://localhost:2021/bookings'; 

const createCar = async (carData) => {
  try {
    // const modifiedPayload = {
    //   ...carData,
    //   username : getUsername()
    // }
    const response = await axios.post(`${API_BASE_URL}/cars`, carData);
    return response;
  } catch (error) {
    console.error('Error creating car:', error);
    throw error;
  }
};

const getCars = async () => {
  try {
    const response = await axios.get(`${API_BASE_URL}/cars`);
    return response.data;
  } catch (error) {
    console.error('Error fetching cars:', error);
    throw error;
  }
};

const getCarById = async (carId) => {
  try {
    const response = await axios.get(`${API_BASE_URL}/cars/${carId}`);
    return response.data;
  } catch (error) {
    console.error(`Error fetching car with ID (${carId}):`, error);
    throw error;
  }
};

const getCarByUsername = async (username) => {
  try {
    const response = await axios.get(`${API_BASE_URL}/cars/users/${username}`);
    return response.data;
  } catch (error) {
    console.error(`Error fetching car for user (${username}):`, error);
    throw error;
  }
};

const deleteCarById = async (carId) => {
  try {
    const response = await axios.delete(`${API_BASE_URL}/cars/${carId}`);
    return response.data;
  } catch (error) {
    console.error(`Error deleting car with ID (${carId}):`, error);
    throw error;
  }
};

export {
  createCar,
  getCars,
  getCarById,
  getCarByUsername,
  deleteCarById,
};