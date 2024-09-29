// File: src/services/bookingService.js
import axios from 'axios';

const API_BASE_URL = 'http://localhost:2021/bookings'; // Replace with your actual base URL

const bookService = async (appointment) => {
  try {
    const response = await axios.post(`${API_BASE_URL}/appointments`, appointment);
    return response;
  } catch (error) {
    console.error('Error booking service:', error);
    throw error;
  }
};

const getAllBookings = async () => {
  try {
    const response = await axios.get(`${API_BASE_URL}/appointments`);
    return response.data;
  } catch (error) {
    console.error('Error fetching all bookings:', error);
    throw error;
  }
};

const getAllBookingsByUsername = async (username) => {
  try {
    const response = await axios.get(`${API_BASE_URL}/users/appointments/${username}`);
    return response.data;
  } catch (error) {
    console.error('Error fetching all bookings:', error);
    throw error;
  }
};


const getAllBookingsByServiceCenterId = async (serviceCenterId) => {
  try {
    const response = await axios.get(`${API_BASE_URL}/service-center/appointments/${serviceCenterId}`);
    return response.data;
  } catch (error) {
    console.error('Error fetching all bookings:', error);
    throw error;
  }
};

const updateBookings = async (appointmentId, isConfirmed, isCompleted) => {
  try {
    const response = await axios.put(`${API_BASE_URL}/appointments/${appointmentId}`, null, {
      params: { isConfirmed, isCompleted }
    });
    return response;
  } catch (error) {
    console.error(`Error updating booking with ID (${appointmentId}):`, error);
    throw error;
  }
};

const cancelBooking = async (appointmentId) => {
  try {
    const response = await axios.delete(`${API_BASE_URL}/appointments/${appointmentId}`);
    return response.data;
  } catch (error) {
    console.error(`Error canceling booking with ID (${appointmentId}):`, error);
    throw error;
  }
};

const notifyBreakDown = async (breakDownData) => {
  try {
    const response = await axios.post(`${API_BASE_URL}/breakdown-notification`, breakDownData);
    return response;
  } catch (error) {
    console.error('Error notifying breakdown:', error);
    throw error;
  }
};

export {
  bookService,
  getAllBookings,
  updateBookings,
  cancelBooking,
  notifyBreakDown,
  getAllBookingsByUsername,
  getAllBookingsByServiceCenterId
};