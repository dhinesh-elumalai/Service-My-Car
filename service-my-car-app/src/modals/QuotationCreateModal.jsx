import React from 'react';
import { Modal, Form, Input, InputNumber } from 'antd';
import { getUsername } from '../utils/token';
import { submitQuotation } from '../services/quotation-service';

const QuotationCreateModal = ({ visible, onSuccess, onCancel , onFailure, quote}) => {
  const [form] = Form.useForm();

  const onQuotationCreate = async (values)=>{
    try{
        const payload = {
            username : quote?.username,
            carModel : quote?.carModel,
            serviceCenterUsername : getUsername(),
            totalPrice : values?.totalPrice + " Rs",
            description : values?.description
        };
        const response = await submitQuotation(payload);
        if (response?.status === 200) {
            onSuccess(response?.data?.message);
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
      title="Enter Quotation Details"
      okText="Submit"
      cancelText="Cancel"
      onCancel={onCancel}
      onOk={() => {
        form
          .validateFields()
          .then((values) => {
            form.resetFields();
            onQuotationCreate(values);
          })
          .catch((info) => {
            console.log('Validate Failed:', info);
          });
      }}
    >
      <Form
        form={form}
        layout="vertical"
        name="quotation_form"
      >
        
        <Form.Item
          name="totalPrice"
          label="Total Price"
          rules={[{ required: true, message: 'Please enter the total price!' }]}
        >
          <InputNumber style={{ width: '100%' }} />
        </Form.Item>
        <Form.Item
          name="description"
          label="Description"
          rules={[{ required: true, message: 'Please enter the description!' }]}
        >
          <Input.TextArea />
        </Form.Item>
      </Form>
    </Modal>
  );
};

export default QuotationCreateModal;