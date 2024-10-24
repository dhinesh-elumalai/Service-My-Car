import React, { useState } from "react";

import {
  AutoComplete,
  Avatar,
  Button,
  Cascader,
  Checkbox,
  Col,
  Form,
  Input,
  InputNumber,
  notification,
  Row,
  Select,
} from "antd";
import { registerUser } from "../services/user-service";
import { useNavigate } from "react-router-dom";
import { UserOutlined } from "@ant-design/icons";

const { Option } = Select;

const residences = [
  {
    value: "Chennai",
    label: "Chennai",
  },
  {
    value: "Villupuram",
    label: "Villupuram",
  },
  {
    value: "Coimbatore",
    label: "Coimbatore",
  },
];


const userTypes = [
  {
    value: "CUSTOMER",
    label: "Car Owner",
  },
  {
    value: "SELLER",
    label: "Service Center",
  }
];

const formItemLayout = {
  labelCol: {
    xs: {
      span: 24,
    },
    sm: {
      span: 12,
    },
  },
  wrapperCol: {
    xs: {
      span: 24,
    },
    sm: {
      span: 16,
    },
  },
};
const tailFormItemLayout = {
  wrapperCol: {
    xs: {
      span: 24,
      offset: 0,
    },
    sm: {
      span: 16,
      offset: 8,
    },
  },
};

const Signup = () => {
  const [form] = Form.useForm();
  const [api, contextHolder] = notification.useNotification();
  const navigate = useNavigate();

  const openNotificationWithIcon = (title, message, type) => {
    api[type]({
      message: title,
      description: message,
    });
  };

  const onFinish = async (values) => {
    console.log("Received values of form: ", values);
    console.log("form inputs are ", form);
    try {
      const response = await registerUser(values);
      if (response?.status === 201) {
        openNotificationWithIcon(
          "Success",
          "Registered Successfully!!",
          "success"
        );
        setTimeout(() => {
          navigate("/login");
        }, 2000);
      }
    } catch (error) {
      openNotificationWithIcon("Failed", error?.message, "error");
    }
  };

  const prefixSelector = (
    <Form.Item name="prefix" noStyle>
      <Select
        style={{
          width: 70,
        }}
      >
        <Option value="91">+91</Option>
      </Select>
    </Form.Item>
  );

  return (
    <>
      {contextHolder}

      <div
        style={{
          display: "flex",
          flexDirection: "column",
          justifyContent: "center",
          alignItems: "center",
          width: "100%",
          height: "100%",
          marginTop: "100px",
          paddingTop: "3%",
          boxShadow: "0 0 10px rgba(0, 0, 0, 0.1)",
          backgroundColor: " #ffffff",
          borderRadius: "10px",
          maxWidth: "800px",
          margin: "auto",
        }}
        className="sign-container"
      >
        <div style={{ marginBottom: "30px" }}>
          <Avatar size={64} icon={<UserOutlined />} />
          <span style={{ marginLeft: "20px" }}>Register</span>
        </div>
        <Form
          {...formItemLayout}
          form={form}
          name="register"
          onFinish={onFinish}
          initialValues={{
            residence: ["Chennai", "Villupuram", "Coimbatore"],
            prefix: "91",
          }}
          style={{
            maxWidth: 600,
          }}
          scrollToFirstError
        >
          <Form.Item
            name="firstName"
            label="First Name"
            tooltip="What do you want others to call you?"
            rules={[
              {
                required: true,
                message: "Please input your first name!",
                whitespace: true,
              },
            ]}
          >
            <Input />
          </Form.Item>

          <Form.Item
            name="lastName"
            label="Last Name"
            tooltip="Your Last Name?"
            rules={[
              {
                required: true,
                message: "Please input your last name!",
                whitespace: true,
              },
            ]}
          >
            <Input />
          </Form.Item>
          <Form.Item
            name="address"
            label="Residential City"
            rules={[
              {
                required: true,
                message: "Please select your residence city",
              },
            ]}
          >
            <Select options={residences} />
          </Form.Item>

          <Form.Item
            name="adhaarNumber"
            label="Adhaar Number"
            rules={[
              {
                required: true,
                message: "Please input your adhaar number!",
              },
            ]}
            hasFeedback
          >
            <Input.Password />
          </Form.Item>

          <Form.Item
            name="phone"
            label="Phone Number"
            rules={[
              {
                required: true,
                message: "Please input your phone number!",
              },
            ]}
          >
            <Input
              addonBefore={prefixSelector}
              style={{
                width: "100%",
              }}
            />
          </Form.Item>

          <Form.Item
            name="email"
            label="E-mail"
            rules={[
              {
                type: "email",
                message: "The input is not valid E-mail!",
              },
              {
                required: true,
                message: "Please input your E-mail!",
              },
            ]}
          >
            <Input />
          </Form.Item>

          <Form.Item
            name="password"
            label="Password"
            rules={[
              {
                required: true,
                message: "Please input your password!",
              },
            ]}
            hasFeedback
          >
            <Input.Password />
          </Form.Item>

          <Form.Item
            name="confirm"
            label="Confirm Password"
            dependencies={["password"]}
            hasFeedback
            rules={[
              {
                required: true,
                message: "Please confirm your password!",
              },
              ({ getFieldValue }) => ({
                validator(_, value) {
                  if (!value || getFieldValue("password") === value) {
                    return Promise.resolve();
                  }
                  return Promise.reject(
                    new Error("The new password that you entered do not match!")
                  );
                },
              }),
            ]}
          >
            <Input.Password />
          </Form.Item>

          <Form.Item
            name="userType"
            label="User Type"
            rules={[
              {
                required: true,
                message: "Please select your user city",
              },
            ]}
          >
            <Select options={userTypes} />
          </Form.Item>

          <Form.Item
            name="agreement"
            valuePropName="checked"
            rules={[
              {
                validator: (_, value) =>
                  value
                    ? Promise.resolve()
                    : Promise.reject(
                        new Error("Please read and accept terms and conditions")
                      ),
              },
            ]}
            {...tailFormItemLayout}
          >
            <Checkbox>
              I have read the <a href="/terms">agreement</a>
            </Checkbox>
          </Form.Item>
          <Form.Item {...tailFormItemLayout}>
            <Button type="primary" htmlType="submit">
              Register
            </Button>
          </Form.Item>
          <Form.Item>
            <span>
              {" "}
              {"Existing User? "}
              <a href="/login">Login here</a>{" "}
            </span>
          </Form.Item>
        </Form>
      </div>
    </>
  );
};
export default Signup;
