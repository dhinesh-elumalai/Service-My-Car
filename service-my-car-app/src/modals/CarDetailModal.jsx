// File: src/components/CarDetailsModal.js
import React from 'react';
import { Modal, Form, Input, Button, Select } from 'antd';
import { Option } from 'antd/es/mentions';
import { createCar } from '../services/car-service';
import { getUsername } from '../utils/token';

const CarDetailsModal = ({ visible, onSuccess, onCancel , onFailure}) => {
  const [form] = Form.useForm();


  const createCarData = async (values)=>{
    try{
       const payload = {
        ...values,
        username : getUsername()
       }
        const response = await createCar(payload);
        if(response?.status === 200){
            onSuccess(response?.data?.message)
        }else{
            onFailure(response?.data?.message)
        }
    }catch(error){
        onFailure(error?.message)
    }
  }

  return (
    <Modal
      visible={visible}
      title="Enter Car Details"
      okText="Submit"
      cancelText="Cancel"
      onCancel={onCancel}
      onOk={() => {
        form
          .validateFields()
          .then((values) => {
            form.resetFields();
            createCarData(values);
          })
          .catch((info) => {
            console.log('Validate Failed:', info);
          });
      }}
    >
      <Form
        form={form}
        layout="vertical"
        name="car_details_form"
      >
        <Form.Item
          name="model"
          label="Model"
          rules={[{ required: true, message: 'Please input the car model!' }]}
        >
          <Input />
        </Form.Item>
        <Form.Item
          name="brand"
          label="Brand"
          rules={[{ required: true, message: 'Please input the car brand!' }]}
        >
          <Input />
        </Form.Item>
        <Form.Item
          name="year"
          label="Manufacturing Year"
          rules={[{ required: true, message: 'Please input the manufacturing year!' }]}
        >
          <Input />
        </Form.Item>
        <Form.Item
          name="fuelType"
          label="Fuel Type"
          rules={[{ required: true, message: 'Please input the fuel type!' }]}
        >
          <Select >
            <Option value="Petrol">{"Petrol"}</Option>
            <Option value="Diesel">{"Diesel"}</Option>
          </Select>
        </Form.Item>
      </Form>
    </Modal>
  );
};

export default CarDetailsModal;