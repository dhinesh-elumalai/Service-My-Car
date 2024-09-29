// File: src/services/serviceCenterService.js
import axios from 'axios';

const API_BASE_URL = 'http://localhost:2021/bookings'; // Replace with your actual base URL

const createServiceCenter = async (serviceCenterData) => {
  try {
    const response = await axios.post(`${API_BASE_URL}/service-center`, serviceCenterData);
    return response;
  } catch (error) {
    console.error('Error creating service center:', error);
    throw error;
  }
};

const getServiceCenters = async () => {
  try {
    const response = await axios.get(`${API_BASE_URL}/service-center`);
    return response.data;
  } catch (error) {
    console.error('Error fetching service centers:', error);
    throw error;
  }
};

const getServiceCenterById = async (serviceCenterId) => {
  try {
    const response = await axios.get(`${API_BASE_URL}/service-center/${serviceCenterId}`);
    return response.data;
  } catch (error) {
    console.error(`Error fetching service center with ID (${serviceCenterId}):`, error);
    throw error;
  }
};

const getServiceCentersByCity = async (city) => {
  try {
    const response = await axios.get(`${API_BASE_URL}/service-center/users/${city}`);
    return response.data;
  } catch (error) {
    console.error(`Error fetching service centers for city (${city}):`, error);
    throw error;
  }
};


const getServiceCentersByUsername = async (username) => {
  try {
    const response = await axios.get(`${API_BASE_URL}/service-center/users/${username}`);
    return response.data;
  } catch (error) {
    console.error(`Error fetching service centers for username (${username}):`, error);
    throw error;
  }
};

const deleteServiceCenterById = async (serviceCenterId) => {
  try {
    const response = await axios.delete(`${API_BASE_URL}/service-center/${serviceCenterId}`);
    return response.data;
  } catch (error) {
    console.error(`Error deleting service center with ID (${serviceCenterId}):`, error);
    throw error;
  }
};

export {
  createServiceCenter,
  getServiceCenters,
  getServiceCenterById,
  getServiceCentersByCity,
  deleteServiceCenterById,
  getServiceCentersByUsername
};