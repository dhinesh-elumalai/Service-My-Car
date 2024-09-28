// src/components/Login.js
import React, { useState } from "react";
import axios from "axios";
import { Button, Checkbox, Form, Input, notification } from "antd";
import { useNavigate } from "react-router-dom";

const Login = () => {
  // const [username, setUsername] = useState("");
  // const [password, setPassword] = useState("");
  const navigate = useNavigate();

  const [api, contextHolder] = notification.useNotification();

  const openNotificationWithIcon = (title, message, type) => {
    api[type]({
      message: title,
      description: message,
    });
  };

  const handleLogin = async (form) => {
    const username = form?.username;
    const password = form?.password;
    try {
      const response = await axios.post(
        "http://localhost:2022/users/users/login",
        { username: username, password: password }
      );
      localStorage.setItem("authToken", response.data.token);
      alert("Login successful!");
      navigate("/");
      openNotificationWithIcon("Success", response?.data?.message, "success");
    } catch (error) {
      openNotificationWithIcon("Failed", error?.message, "error");
    }
  };

  const onFinishFailed = (errorInfo) => {
    openNotificationWithIcon("Failed", "Login Failed!", "error");
  };

  return (
    <>
      {contextHolder}
      <div style={{
        display: "flex",
        flexDirection: "column",
        justifyContent: "center",
        alignItems: "center",
        width: "100%",
        height: "100%",
        paddingTop : "200px"
      }}>
      <Form
        name="basic"
        labelCol={{
          span: 8,
        }}
        wrapperCol={{
          span: 16,
        }}
        style={{
          maxWidth: 600,
        }}
        initialValues={{
          remember: true,
        }}
        onFinish={handleLogin}
        onFinishFailed={onFinishFailed}
        autoComplete="off"
      >
        <Form.Item
          label="Username"
          name="username"
          rules={[
            {
              required: true,
              message: "Please input your username!",
            },
          ]}
        >
          <Input />
        </Form.Item>

        <Form.Item
          label="Password"
          name="password"
          rules={[
            {
              required: true,
              message: "Please input your password!",
            },
          ]}
        >
          <Input.Password />
        </Form.Item>

        <Form.Item
          wrapperCol={{
            offset: 8,
            span: 16,
          }}
        >
          <Button type="primary" htmlType="submit">
            Submit
          </Button>
        </Form.Item>
      </Form>
      </div>
    </>
  );
};

export default Login;
