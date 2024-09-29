// File: `src/components/AppointmentModal.js`
import React from "react";
import { Modal, Form, Input, DatePicker } from "antd";
import { getUsername } from "../utils/token";
import { bookService } from "../services/appointment-service";

const AppointmentModal = ({
  visible,
  OnSuccess,
  onCancel,
  OnFailure,
  quote,
}) => {
  const [form] = Form.useForm();

  const onAppointmentCreate = async (values) => {
    try {
      const payload = {
        username: getUsername(),
        serviceCenterUsername: quote?.serviceCenterUsername,
        isConfirmed: false,
        isCompleted: false,
        fromTime : values?.fromTime?.valueOf(),
        toTime : values?.toTime?.valueOf(),
      };
      const response = await bookService(payload);
      if (response?.status === 200) {
        OnSuccess(response?.data?.message);
      } else {
        OnFailure(response?.data?.message);
      }
    } catch (error) {
      OnFailure(error?.message);
    }
  };

  return (
    <Modal
      visible={visible}
      title="Enter Appointment Details"
      okText="Submit"
      cancelText="Cancel"
      onCancel={onCancel}
      onOk={() => {
        form
          .validateFields()
          .then((values) => {
            form.resetFields();
            onAppointmentCreate(values);
          })
          .catch((info) => {
            console.log("Validate Failed:", info);
          });
      }}
    >
      <Form form={form} layout="vertical" name="appointment_form">
        <Form.Item
          name="fromTime"
          label="Start Time"
          rules={[{ required: true, message: "Please enter the start time!" }]}
        >
          <DatePicker showTime />
        </Form.Item>
        <Form.Item
          name="toTime"
          label="End Time"
          rules={[{ required: true, message: "Please enter the end time!" }]}
        >
          <DatePicker showTime />
        </Form.Item>
      </Form>
    </Modal>
  );
};

export default AppointmentModal;
