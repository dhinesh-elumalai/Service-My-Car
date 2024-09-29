import { Route, RouterProvider, Routes, useNavigate } from "react-router-dom";
import { Breadcrumb, Layout, Menu, theme } from "antd";
import {
  DesktopOutlined,
  FileOutlined,
  CustomerServiceOutlined,
  PieChartOutlined,
  HomeOutlined,
  UserOutlined,
  FileTextOutlined,
  ScheduleOutlined,
  PoweroffOutlined,
} from "@ant-design/icons";
import Home from "./Home";
import Quotes from "./Quotes";
import { render } from "@testing-library/react";
import Appointments from "./Appointments";
import ServiceCenters from "./ServiceCenters";
import ProfilePage from "./Profile";
import { getRole, getUserFullName } from "../utils/token";
import QuotationRequests from "./Requests";
import { useState } from "react";

const { Header, Content, Footer } = Layout;

const items = [
  {
    key: "user",
    icon: <UserOutlined />,
    label: getUserFullName(),
    children: [
      {
        key: "profile",
        label: "Profile",
        icon: <UserOutlined />,
      },
      {
        key: "logout",
        label: "Logout",
        icon: <PoweroffOutlined />,
      },
    ],
  },
  {
    key: "home",
    icon: <HomeOutlined />,
  },
  {
    key: "quotes",
    label: "Quotes",
    icon: <FileTextOutlined />,
  },
  {
    key: "appointments",
    label: "Appointments",
    icon: <ScheduleOutlined />,
  },
  {
    key: "service-centers",
    label: "Service Centers",
    icon: <CustomerServiceOutlined />,
  },
  {
    key: "quotation-Requests",
    label: "Requests",
    icon: <CustomerServiceOutlined />,
  },
];

const customerItems = [
  {
    key: "user",
    icon: <UserOutlined />,
    label: getUserFullName(),
    children: [
      {
        key: "profile",
        label: "Profile",
        icon: <UserOutlined />,
      },
      {
        key: "logout",
        label: "Logout",
        icon: <PoweroffOutlined />,
      },
    ],
  },
  {
    key: "home",
    icon: <HomeOutlined />,
  },
  {
    key: "quotes",
    label: "Quotes",
    icon: <FileTextOutlined />,
  },
  {
    key: "appointments",
    label: "Appointments",
    icon: <ScheduleOutlined />,
  },
  {
    key: "service-centers",
    label: "Service Centers",
    icon: <CustomerServiceOutlined />,
  },
];

const serviceCenterItems = [
  {
    key: "user",
    icon: <UserOutlined />,
    label: getUserFullName(),
    children: [
      {
        key: "profile",
        label: "Profile",
        icon: <UserOutlined />,
      },
      {
        key: "logout",
        label: "Logout",
        icon: <PoweroffOutlined />,
      },
    ],
  },
  {
    key: "home",
    icon: <HomeOutlined />,
  },
  {
    key: "service-centers",
    label: "My Service Centers",
    icon: <CustomerServiceOutlined />,
  },
  {
    key: "quotation-Requests",
    label: "Requests",
    icon: <CustomerServiceOutlined />,
  },
];

const MainPage = () => {
  const navigate = useNavigate();
  const currentRole = useState(getRole());
  const {
    token: { colorBgContainer, borderRadiusLG },
  } = theme.useToken();

  console.log("Current user role in main page ", currentRole)
  const handleNavigation = (event) => {
    navigate("/app/" + event?.key);
  };

  return (
    <Layout>
      <Header
        style={{
          position: "sticky",
          top: 0,
          zIndex: 1,
          width: "100%",
          height: "100%",
          display: "flex",
          alignItems: "center",
        }}
      >
        <div className="demo-logo" />
        <Menu
          theme="dark"
          mode="horizontal"
          defaultSelectedKeys={["1"]}
          items={
            currentRole?.includes("ADMIN")
              ? items
              : currentRole?.includes("CUSTOMER")
              ? customerItems
              : serviceCenterItems
          }
          style={{
            flex: 1,
            minWidth: 0,
          }}
          onClick={handleNavigation}
        />
      </Header>
      <Content
        style={{
          padding: "0 50px",
        }}
      >
        <div
          style={{
            padding: "100px",
            minHeight: 800,
            background: colorBgContainer,
            borderRadius: borderRadiusLG,
          }}
        >
          <Routes>
            <Route path="/home" element={<Home />} />
            <Route path="/profile" element={<ProfilePage />} />
            <Route path="/quotes" element={<Quotes />} />
            <Route path="/quotation-requests" element={<QuotationRequests />} />
            <Route path="/appointments" element={<Appointments />} />
            <Route path="/service-centers" element={<ServiceCenters />} />
          </Routes>
        </div>
      </Content>
      <Footer
        style={{
          textAlign: "center",
        }}
      >
        Service My Car ©{new Date().getFullYear()}
      </Footer>
    </Layout>
  );
};

export default MainPage;
