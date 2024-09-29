// src/components/Login.js
import React, { useState } from "react";
import axios from "axios";
import {
  Avatar,
  Button,
  Checkbox,
  Form,
  Input,
  notification,
  Space,
  Spin,
} from "antd";
import { useNavigate } from "react-router-dom";
import { login } from "../services/user-service";
import { UserOutlined } from "@ant-design/icons";

const Login = () => {
  const navigate = useNavigate();

  const [api, contextHolder] = notification.useNotification();
  const [isLoading, setIsLoading] = useState(false);

  const openNotificationWithIcon = (title, message, type) => {
    api[type]({
      message: title,
      description: message,
    });
  };

  const handleLogin = async (form) => {
    setIsLoading(true)
    const username = form?.username;
    const password = form?.password;
    try {
      const response = await login({ username: username, password: password });
      if (response?.status === 200) {
        localStorage.setItem("authToken", response?.data?.data?.jwtToken);
        openNotificationWithIcon("Success", response?.data?.message, "success");
        setTimeout(() => {
          navigate("/app/home");
        }, 1000);
      } else {
        openNotificationWithIcon("Failed", response?.data?.message, "error");
      }
    } catch (error) {
      openNotificationWithIcon("Failed", error?.message, "error");
    }
    setIsLoading(false)
  };

  const onFinishFailed = (errorInfo) => {
    openNotificationWithIcon("Failed", "Login Failed!", "error");
  };

  return (
    <>
      {contextHolder}
      <Spin tip="Loading..." spinning={isLoading}>
      <div
        style={{
          display: "flex",
          flexDirection: "column",
          justifyContent: "center",
          alignItems: "center",
          width: "100%",
          height: "100%",
          paddingTop: "3%",
          boxShadow: "0 0 10px rgba(0, 0, 0, 0.1)",
          backgroundColor: " #ffffff",
          borderRadius: "10px",
          maxWidth: "800px",
          marginTop: "10%",
          marginLeft: "30%",
        }}
      >
        <div style={{marginBottom:"30px"}}>
          <Avatar size={64} icon={<UserOutlined />} />
          <span style={{marginLeft:"20px"}}>Login to continue</span>
        </div>
       
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
          <Form.Item>
            <span>
              {" "}
              {"New User? "}
              <a href="/signup">Register here</a>{" "}
            </span>
          </Form.Item>
        </Form>
      </div>
      </Spin>
    </>
  );
};

export default Login;
