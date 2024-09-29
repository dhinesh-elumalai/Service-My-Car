// File: src/services/quotationService.js
import axios from 'axios';
import { getUsername } from '../utils/token';

const API_BASE_URL = 'http://localhost:2021/bookings'; // Replace with your actual base URL

const requestQuotations = async (quotationRequest) => {
  try {
    const updatedPayload = {
      ...quotationRequest,
      username : getUsername()
    }
    const response = await axios.post(`${API_BASE_URL}/quotations/request`, updatedPayload);
    return response;
  } catch (error) {
    console.error('Error requesting quotations:', error);
    throw error;
  }
};

const getAllQuotations = async () => {
  try {
    const response = await axios.get(`${API_BASE_URL}/quotations`);
    return response.data;
  } catch (error) {
    console.error('Error fetching all quotations:', error);
    throw error;
  }
};

const submitQuotation = async (quotation) => {
  try {
    const response = await axios.post(`${API_BASE_URL}/quotations`, quotation);
    return response;
  } catch (error) {
    console.error('Error submitting quotation:', error);
    throw error;
  }
};

const getQuotationById = async (id) => {
  try {
    const response = await axios.get(`${API_BASE_URL}/quotations/${id}`);
    return response.data;
  } catch (error) {
    console.error(`Error fetching quotation by ID (${id}):`, error);
    throw error;
  }
};

const getQuotationsByUsername = async (username) => {
  try {
    const response = await axios.get(`${API_BASE_URL}/users/quotations/${username}`);
    return response?.data;
  } catch (error) {
    console.error(`Error fetching quotations by username (${username}):`, error);
    throw error;
  }
};


const getQuotationRequests = async () => {
  try {
    const response = await axios.get(`${API_BASE_URL}/quotation-requests`);
    return response?.data;
  } catch (error) {
    console.error(`Error fetching quotation requests`, error);
    throw error;
  }
};

const deleteQuotationById = async (id) => {
  try {
    const response = await axios.delete(`${API_BASE_URL}/quotations/${id}`);
    return response.data;
  } catch (error) {
    console.error(`Error deleting quotation by ID (${id}):`, error);
    throw error;
  }
};

export {
  requestQuotations,
  getAllQuotations,
  submitQuotation,
  getQuotationById,
  getQuotationsByUsername,
  deleteQuotationById,
  getQuotationRequests,
};