// File: src/components/ProfilePage.js
import React, { useEffect, useState } from "react";
import { Button, Descriptions, notification, Row, Table } from "antd";
import { fetchUserByUsername } from "../services/user-service";
import { getCarByUsername } from "../services/car-service";
import { getUsername } from "../utils/token";
import CarDetailsModal from "../modals/CarDetailModal";
import { render } from "@testing-library/react";

const columns = [
  {
    title: "Field",
    dataIndex: "field",
    key: "field",
  },
  {
    title: "Value",
    dataIndex: "value",
    key: "value",
  },
];

const carColumns = [
  {
    title: "ID",
    dataIndex: "id",
    key: "id",
  },
  {
    title: "Brand ",
    dataIndex: "brand",
    key: "brand",
  },
  {
    title: "Manufacturing Year",
    dataIndex: "year",
    key: "year",
  },
  {
    title: "Fuel Type",
    dataIndex: "fuelType",
    key: "fuelType",
  },
  {
    title: "Vehicle Number",
    dataIndex: "vehicleNumber",
    key: "vehicleNumber",
  },
  {
    title: "Engine Number",
    dataIndex: "engineNumber",
    key: "engineNumber",
  },
  // {
  //   title: "Actions",
  //   dataIndex: "actions",
  //   key: "actions",
  //   render: () => {
  //     return (
  //       <Button type="primary" danger>
  //         {"Remove"}
  //       </Button>
  //     );
  //   },
  // },
];

const ProfilePage = () => {
  const [user, setUserData] = useState({});
  const [car, setCar] = useState([{}]);
  const [api, contextHolder] = notification.useNotification();
  const [carCreateModalVisible, setCarCreateModalVisible] = useState(false);

  const openNotificationWithIcon = (title, message, type) => {
    api[type]({
      message: title,
      description: message,
    });
  };

  useEffect(() => {
    fetchUserData(getUsername());
    fetchCarByUsername(getUsername());
  }, []);

  const fetchUserData = async (username) => {
    try {
      const response = await fetchUserByUsername(username);
      if (response?.status === 200) {
        setUserData(response?.data?.data);
        openNotificationWithIcon(
          "Success",
          "User Data fetched Successfully",
          "success"
        );
      } else {
        openNotificationWithIcon("Failed", response?.data?.message, "error");
      }
    } catch (error) {
      openNotificationWithIcon("Failed", error?.message, "error");
      setUserData({});
    }
  };

  const fetchCarByUsername = async (username) => {
    try {
      const response = await getCarByUsername(username);
      setCar([response?.data]);
      openNotificationWithIcon(
        "Success",
        "Car Data fetched Successfully",
        "success"
      );
    } catch (error) {
      openNotificationWithIcon("Failed", error?.message, "error");
      setUserData({});
    }
  };

  const data = [
    { key: "userId", field: "User ID", value: user.userId },
    { key: "name", field: "Name", value: user.name },
    { key: "email", field: "Email", value: user.email },
    { key: "role", field: "Role", value: user.role },
    { key: "phone", field: "Phone", value: user.phone },
    { key: "address", field: "Address", value: user.address },
    { key: "adhaarNumber", field: "Adhaar Number", value: user.adhaarNumber },
  ];

  const onCarCreateSuccess = ({message}) => {
    console.log("Received values from form: ", message);
    openNotificationWithIcon(
      "Success",
      message,
      "success"
    );
    setCarCreateModalVisible(false);
  };


  const onCarCreateFailure = (message) => {
    openNotificationWithIcon(
      "Failed",
      message,
      "error"
    );
  };

  return (
    <>
      {contextHolder}
      <Descriptions title={"Profile Details"} bordered />
      <div style={{ margin: "auto", alignItems: "center", paddingLeft: "33%" }}>
        <Table columns={columns} dataSource={data} pagination={false} />
      </div>
      <Descriptions title={"Car Details"} bordered />
      <Row>
        <Button
          type="primary"
          onClick={() => {
            setCarCreateModalVisible(true);
          }}
        >
          {"Add Car +"}
        </Button>
      </Row>
      <Table columns={carColumns} dataSource={car} pagination={false} />

      <CarDetailsModal
        visible={carCreateModalVisible}
        onSuccess={onCarCreateSuccess}
        onFailure={onCarCreateFailure}
        onCancel={() => {
          setCarCreateModalVisible(false);
        }}
      />
    </>
  );
};

export default ProfilePage;
