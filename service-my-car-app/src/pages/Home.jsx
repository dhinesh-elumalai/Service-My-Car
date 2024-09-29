import React, { useEffect, useState } from "react";
import {
  Button,
  Checkbox,
  Col,
  Form,
  Image,
  Input,
  notification,
  Row,
  Spin,
} from "antd";
import { getUsername } from "../utils/token";
import { notifyBreakDown } from "../services/appointment-service";

const getGoogleMapsLink = (latitude, longitude) => {
  return `https://www.google.com/maps?q=${latitude},${longitude}`;
};

const Home = (isFromLoginPage) => {
  const [api, contextHolder] = notification.useNotification();
  const [username, setUsername] = useState(getUsername());
  const [isLoading, setIsLoading] = useState(false);
  const [location, setLocation] = useState({ latitude: null, longitude: null });

  const openNotificationWithIcon = (title, message, type) => {
    api[type]({
      message: title,
      description: message,
    });
  };

  const getLocation = () => {
    if (navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(
        (position) => {
          setLocation({
            latitude: position.coords.latitude,
            longitude: position.coords.longitude,
          });
        },
        (error) => {
          console.error("Error getting location: ", error);
        }
      );
    } else {
      console.error("Geolocation is not supported by this browser.");
    }
  };

  const onBreakDown = async () => {
    setIsLoading(true)
    getLocation();
    try {
      const payload = {
        username: username,
        latitude: location?.latitude,
        longitude: location?.longitude,
        locationLink: getGoogleMapsLink(
          location?.latitude,
          location?.longitude
        ),
      };
      const response = await notifyBreakDown(payload);
      if (response?.status === 200) {
        openNotificationWithIcon(
          "Success",
          "Alert Notification Sent!!",
          "success"
        );
      } else {
        openNotificationWithIcon("Failure", response?.data?.message, "error");
      }
    } catch (error) {
      openNotificationWithIcon("Failure", error?.message, "error");
    }
    setIsLoading(false)
  };

  return (
    <>
      {contextHolder}
      <Spin tip="Loading..." spinning={isLoading}>
      <Row>
        <Col xs={2} sm={4} md={6} lg={8} xl={8}></Col>
        <Col xs={20} sm={16} md={12} lg={8} xl={10}>
          <div>
            {/* <header>
              <h1>Service Center Application</h1>
            </header> */}
            <main>
              <section>
                <h2>Welcome to Our Car Service Center Application</h2>
                <p>Find the best service centers in your city.</p>
              </section>
            </main>
          </div>
        </Col>
        <Col xs={2} sm={4} md={6} lg={8} xl={10}></Col>
        {/* <img src="https://www.shutterstock.com/shutterstock/photos/1375265228/display_1500/stock-vector-auto-service-and-repair-cars-in-maintenance-workshop-with-mechanics-team-vector-illustration-1375265228.jpg"></img> */}
      </Row>

      <div style={{ margin: "3% 45%" }}>
        <Button color="danger" danger onClick={onBreakDown}>
          {" "}
          BreakDown Alert
        </Button>
        <div style={{ marginTop: "20px" }}>
          {/* <p>Current Location</p> */}
          {location.latitude && location.longitude && (
            <div>
              <p>Latitude: {location.latitude}</p>
              <p>Longitude: {location.longitude}</p>
            </div>
          )}
        </div>
      </div>
      </Spin>
    </>
  );
};

export default Home;
