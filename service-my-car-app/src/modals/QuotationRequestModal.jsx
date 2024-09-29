import React from "react";
import { Modal, Form, Input, DatePicker, Select } from "antd";
import { requestQuotations } from "../services/quotation-service";
import { Option } from "antd/es/mentions";

const QuotationRequestModal = ({ visible, OnSuccess, onCancel, onFailure }) => {
  const [form] = Form.useForm();

  const onQuotationRequest = async (values) => {
    try {
      const response = await requestQuotations(values);
      if (response?.status === 200) {
        OnSuccess(response?.data?.message);
      } else {
        onFailure(response?.data?.message);
      }
    } catch (error) {
      onFailure(error?.message);
    }
  };

  return (
    <Modal
      visible={visible}
      title="Enter Quotation Request Details"
      okText="Submit"
      cancelText="Cancel"
      onCancel={onCancel}
      onOk={() => {
        form
          .validateFields()
          .then((values) => {
            form.resetFields();
            onQuotationRequest(values);
          })
          .catch((info) => {
            console.log("Validate Failed:", info);
          });
      }}
    >
      <Form form={form} layout="vertical" name="quotation_request_form">
        <Form.Item
          name="issue"
          label="Issue"
          rules={[{ required: true, message: "Please enter the issue!" }]}
        >
          <Input />
        </Form.Item>
        <Form.Item
          name="lastServiceDate"
          label="Last Service Date"
          rules={[
            { required: true, message: "Please input the last service date!" },
          ]}
        >
          <DatePicker />
        </Form.Item>
        <Form.Item
          name="city"
          label="City"
          rules={[{ required: true, message: "Please input the city!" }]}
        >
          <Select >
            <Option value="Villupuram">{"Villupuram"}</Option>
            <Option value="Chennai">{"Chennai"}</Option>
            <Option value="Coimbatore">{"Coimbatore"}</Option>
          </Select>
        </Form.Item>
      </Form>
    </Modal>
  );
};

export default QuotationRequestModal;
