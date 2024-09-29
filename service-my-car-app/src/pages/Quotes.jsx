import { Button, notification } from "antd";
import { useEffect, useState } from "react";
import { getQuotationsByUsername } from "./../services/quotation-service";
import CustomTable from "../components/CustomTable";
import { getUsername } from "../utils/token";
import QuotationRequestModal from "../modals/QuotationRequestModal";
import AppointmentModal from "../modals/AppointmentCreateModal";
import { render } from "@testing-library/react";


const Quotes = () => {
  const [quotes, setQuotes] = useState([]);
  const [selectedQuote, setSelectedQuote] = useState({});
  const [username, setUsername] = useState(getUsername());
  const [appointmentCreateModalVisible, setAppointmentCreateModalVisible] = useState(false);
  const [quotationRequestModalVisible, setQuotationRequestModalVisibility] = useState(false);


  useEffect(() => {
    fetchQuotationsByUsername(username)
  }, []);

  const [api, contextHolder] = notification.useNotification();

  const openNotificationWithIcon = (title, message, type) => {
    api[type]({
      message: title,
      description: message,
    });
  };

  const fetchQuotationsByUsername = async (username) => {
    try {
      const response = await getQuotationsByUsername(username);
      setQuotes(response?.data);
      openNotificationWithIcon(
        "Success",
        "Quotes Fetched Successfully",
        "success"
      );
    } catch (error) {
      openNotificationWithIcon("Failed", error?.message, "error");
      setQuotes([])
    }
  };

  const onQuotationRequestSuccess = (message) => {
    openNotificationWithIcon("Success", message, "success");
    setQuotationRequestModalVisibility(false);
  };

  const onQuotationRequestFailure = (message) => {
    openNotificationWithIcon("Failed", message, "error");
  };

  const onAppointmentCreateSuccess = (message) => {
    openNotificationWithIcon("Success", message, "success");
    setAppointmentCreateModalVisible(false);
  };

  const onAppointmentCreateFailure = (message) => {
    openNotificationWithIcon("Failed", message, "error");
  };

  const columns = [
    {
      title: "ID",
      dataIndex: "id",
      key: "id",
    },
    {
      title: "Description",
      dataIndex: "description",
      key: "description",
    },
    {
      title: "Car Model",
      dataIndex: "carModel",
      key: "carModel",
    },
    {
      title: "Service Center ID",
      dataIndex: "serviceCenterId",
      key: "serviceCenterId",
    },
    {
      title: "Total Price",
      dataIndex: "totalPrice",
      key: "totalPrice",
    },
    {
      title: 'Action',
      key: 'action',
      render: (text, record) => (
        <Button
          type="primary"
          onClick={() => {
            setSelectedQuote(record);
            setAppointmentCreateModalVisible(true);
          }}
        >
          Book Appointment
        </Button>
      ),
    },
  ];

  return (
    <>
      {contextHolder}
      <CustomTable title ="Quotations" data={quotes} columns={columns} />
      <QuotationRequestModal
        visible={quotationRequestModalVisible}
        OnSuccess={onQuotationRequestSuccess}
        onFailure={onQuotationRequestFailure}
        onCancel={() => {
          setQuotationRequestModalVisibility(false);
        }}
      />
      <Button
        type="primary"
        onClick={() => {
          setQuotationRequestModalVisibility(true);
        }}
      >
        Request Quotation
      </Button>

      <AppointmentModal
        visible={appointmentCreateModalVisible}
        OnSuccess={onAppointmentCreateSuccess}
        OnFailure={onAppointmentCreateFailure}
        quote={selectedQuote}
        onCancel={() => {
          setAppointmentCreateModalVisible(false);
        }}
      />
    </>
  );
};

export default Quotes;