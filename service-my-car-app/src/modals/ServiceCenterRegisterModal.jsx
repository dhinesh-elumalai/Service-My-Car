// File: `src/components/ServiceCenterModal.js`
import React from 'react';
import { Modal, Form, Input, InputNumber, Button, Select } from 'antd';
import { Option } from 'antd/es/mentions'; 
import {createServiceCenter} from './../services/service-center-service'

const ServiceCenterRegisterModal = ({ visible, onSuccess, onCancel, onFailure }) => {
  const [form] = Form.useForm();


  const onSubmit =async  (values) =>{
    try{
        const payload = {
            ...values,
            rating : 4.7,
            latitude : 80.87,
            longitude : 90.76,
        }
        const response = await createServiceCenter(payload);
        if (response?.status === 200) {
          OnSuccess(response?.data?.message);
        } else {
          onFailure(response?.data?.message);
        }
    } catch(error){
        onFailure(error?.message)
    }
  }

  return (
    <Modal
      visible={visible}
      title="Register Service Center"
      okText="Submit"
      cancelText="Cancel"
      onCancel={onCancel}
      onOk={() => {
        form
          .validateFields()
          .then((values) => {
            form.resetFields();
            onSubmit(values);
          })
          .catch((info) => {
            console.log('Validate Failed:', info);
          });
      }}
    >
      <Form
        form={form}
        layout="vertical"
        name="service_center_form"
      >
        <Form.Item
          name="name"
          label="Name"
          rules={[{ required: true, message: 'Please enter the service center name!' }]}
        >
          <Input />
        </Form.Item>
        <Form.Item
          name="email"
          label="Email"
          rules={[{ required: true, message: 'Please enter the email!' }]}
        >
          <Input />
        </Form.Item>
        <Form.Item
          name="mobile"
          label="Mobile"
          rules={[{ required: true, message: 'Please enter the mobile number!' }]}
        >
          <Input />
        </Form.Item>
        <Form.Item
          name="address"
          label="Address"
          rules={[{ required: true, message: 'Please enter the address!' }]}
        >
          <Input />
        </Form.Item>
        <Form.Item
          name="city"
          label="City"
          rules={[{ required: true, message: "Please enter the city!" }]}
        >
          <Select >
            <Option value="Villupuram">{"Villupuram"}</Option>
            <Option value="Chennai">{"Chennai"}</Option>
            <Option value="Coimbatore">{"Coimbatore"}</Option>
          </Select>
        </Form.Item>
        {/* <Form.Item
          name="latitude"
          label="Latitude"
          rules={[{ required: true, message: 'Please enter the latitude!' }]}
        >
          <InputNumber style={{ width: '100%' }} />
        </Form.Item>
        <Form.Item
          name="longitude"
          label="Longitude"
          rules={[{ required: true, message: 'Please enter the longitude!' }]}
        >
          <InputNumber style={{ width: '100%' }} />
        </Form.Item> */}
        {/* <Form.Item
          name="rating"
          label="Rating"
          rules={[{ required: true, message: 'Please enter the rating!' }]}
        >
          <InputNumber min={0} max={5} step={0.1} style={{ width: '100%' }} />
        </Form.Item> */}
      </Form>
    </Modal>
  );
};

export default ServiceCenterRegisterModal;