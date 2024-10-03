import { Button, notification } from "antd";
import { useEffect, useState } from "react";
import { getServiceCenters, getServiceCentersByUsername } from "./../services/service-center-service";
import CustomTable from "../components/CustomTable";
import { getRole, getUsername } from "../utils/token";
import ServiceCenterRegisterModal from "../modals/ServiceCenterRegisterModal";

const columns = [
  {
    title: "ID",
    dataIndex: "id",
    key: "id",
  },
  {
    title: "Name",
    dataIndex: "name",
    key: "name",
  },
  {
    title: "Email",
    dataIndex: "email",
    key: "email",
  },
  {
    title: "Mobile",
    dataIndex: "mobile",
    key: "mobile",
  },
  {
    title: "Address",
    dataIndex: "address",
    key: "address",
  },
  {
    title: "City",
    dataIndex: "city",
    key: "city",
    filters: [
      {
        text: 'Chennai',
        value: 'Chennai',
      },
      {
        text: 'Villupuram',
        value: 'Villupuram',
      },
      {
        text: 'Coimbatore',
        value: 'Coimbatore',
      }
    ],
    onFilter: (value, record) => record.city.startsWith(value),
    filterSearch: true,
  },
  {
    title: "Rating",
    dataIndex: "rating",
    key: "rating",
  },
];


const ServiceCenters = () => {
  const [serviceCenters, setServiceCenters] = useState([]);
  const [username, setUsername] = useState(getUsername());
  const [isCustomer, setIsCustomer] = useState(getRole()?.includes("CUSTOMER"));
  const [isAdmin, setIsAdmin] = useState(getRole()?.includes("ADMIN"));

  useEffect(() => {
    if(isCustomer || isAdmin){
      fetchServiceCenters();
    }else{
      fetchServiceCentersByUsername();
    }
    
  }, []);

  const [api, contextHolder] = notification.useNotification();

  const openNotificationWithIcon = (title, message, type) => {
    api[type]({
      message: title,
      description: message,
    });
  };

  const fetchServiceCenters = async () => {
    try {
      const response = await getServiceCenters();
      setServiceCenters(response?.data);
      openNotificationWithIcon(
        "Success",
        "Service Centers Fetched Successfully",
        "success"
      );
    } catch (error) {
      openNotificationWithIcon("Failed", error?.message, "error");
      setServiceCenters([]);
    }
  };


  const fetchServiceCentersByUsername = async () => {
    try {
      const response = await getServiceCentersByUsername(username);
      setServiceCenters(response?.data);
      openNotificationWithIcon(
        "Success",
        "Service Centers Fetched Successfully",
        "success"
      );
    } catch (error) {
      openNotificationWithIcon("Failed", error?.message, "error");
      setServiceCenters([]);
    }
  };

  const [serviceCenterCreateModalVisible, setServiceCenterCreateModalVisible] = useState(false);

  const onCreateCarSuccess = (message) => {
    openNotificationWithIcon(
      "Success",
      "Service Center Registered Successfully",
      "success"
    );
    setServiceCenterCreateModalVisible(false);
  };

  
  const onCreateCarFailure = (message) => {
    openNotificationWithIcon("Failed",message, "error");
    setServiceCenterCreateModalVisible(true);
  };


  return (
    <>
      {contextHolder}
      <CustomTable
        title="Service Centers"
        data={serviceCenters}
        columns={columns}
      />
       <Button
        type="primary"
        onClick={() => {
          setServiceCenterCreateModalVisible(true);
        }}
        hidden={isCustomer}
      >
        Register Service Center
      </Button>
      <ServiceCenterRegisterModal
        visible={serviceCenterCreateModalVisible}
        onSuccess={onCreateCarSuccess}
        onFailure={onCreateCarFailure}
        onCancel={() => {
          setServiceCenterCreateModalVisible(false);
        }}/>
    </>
  );
};

export default ServiceCenters;
