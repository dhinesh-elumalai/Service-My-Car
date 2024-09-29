import { Route, Routes } from "react-router-dom";
import { Breadcrumb, Layout, Menu, theme } from 'antd';
import {
  DesktopOutlined,
  FileOutlined,
  CustomerServiceOutlined,
  PieChartOutlined,
  HomeOutlined,
  UserOutlined,
  FileTextOutlined,
  ScheduleOutlined,
} from '@ant-design/icons';
import Home from "./Home";


const { Header, Content, Footer } = Layout;

const items = [
    {
        key : "home", 
        label :  "Home",
        icon : <HomeOutlined />
    },
    {
        key : "quotes", 
        label :  "Quotes",
        icon : <FileTextOutlined />
    },
    {
        key : "appointments", 
        label :  "Appointments",
        icon : <ScheduleOutlined />
    },
    {
        key : "service-centers", 
        label :  "Service Centers",
        icon : <CustomerServiceOutlined />
    }
]

const MainPage = () => {
    const {
        token: { colorBgContainer, borderRadiusLG },
      } = theme.useToken();

  return (
    <Layout>
      <Header
        style={{
          position: "sticky",
          top: 0,
          zIndex: 1,
          width: "100%",
          height : "100%",
          display: "flex",
          alignItems: "center",
        }}
      >
        <div className="demo-logo" />
        <Menu
          theme="dark"
          mode="horizontal"
          defaultSelectedKeys={["1"]}
          items={items}
          style={{
            flex: 1,
            minWidth: 0,
          }}
        />
      </Header>
      <Content
        style={{
          padding: "0 48px",
        }}
      >
        
        <div
          style={{
            padding: 24,
            minHeight: 800,
            background: colorBgContainer,
            borderRadius: borderRadiusLG,
          }}
        >
          <div style={{ padding: "20px" , width: "max-width"}}>
            <Routes>
              <Route path="/" element={<Home />} />
            </Routes>
          </div>
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
