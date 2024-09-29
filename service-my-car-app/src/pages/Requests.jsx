import { Button, notification, Space, Tag } from "antd";
import { useEffect, useState } from "react";
import { getQuotationRequests } from "../services/quotation-service";
import CustomTable from "../components/CustomTable";
import { getUsername } from "../utils/token";
import QuotationCreateModal from "../modals/QuotationCreateModal";
import {
  getAllBookingsByServiceCenterId,
  updateBookings,
} from "../services/appointment-service";

const getFullDate = (date) => {
  return new Date(date).toLocaleString();
};

const QuotationRequests = () => {
  const [quotationRequests, setQuotationRequests] = useState([]);
  const [selectedQuote, setSelectedQuote] = useState({});
  const [username, setUsername] = useState(getUsername());
  const [quotationCreateModalVisible, setQuotationCreateModalVisible] =
    useState(false);
  const [appointments, setappointments] = useState([]);

  useEffect(() => {
    fetchQuotationsByUsername(username);
    fetchAppointmentsByServicCenter(username);
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
      const response = await getQuotationRequests();
      setQuotationRequests(response?.data);
      openNotificationWithIcon(
        "Success",
        "Requests Fetched Successfully",
        "success"
      );
    } catch (error) {
      openNotificationWithIcon("Failed", error?.message, "error");
      setQuotationRequests([]);
    }
  };

  const onQuotationCreateSuccess = (message) => {
    openNotificationWithIcon("Success", message, "success");
    setQuotationCreateModalVisible(false);
    window.location.reload();
  };

  const onQuotationCreateFailure = (message) => {
    openNotificationWithIcon("Failed", message, "error");
  };

  const fetchAppointmentsByServicCenter = async (serviceCenterId) => {
    try {
      const response = await getAllBookingsByServiceCenterId(serviceCenterId);
      setappointments(response?.data);
      openNotificationWithIcon(
        "Success",
        "Appointments Fetched Successfully",
        "success"
      );
    } catch (error) {
      openNotificationWithIcon("Failed", error?.message, "error");
      setappointments([]);
    }
  };

  const confirmAppointment = async (appointment) => {
    try {
      const response = await updateBookings(
        appointment?.id,
        true,
        appointment?.isCompleted
      );
      if (response?.status === 200) {
        openNotificationWithIcon("Success", "Appointment Confirmed", "success");
      } else {
        openNotificationWithIcon("Failed", response?.data?.status, "error");
      }
    } catch (error) {
      openNotificationWithIcon("Failed", error?.message, "error");
    }
    window.location.reload();
  };


  const completeAppointment = async (appointment) => {
    try {
      const response = await updateBookings(
        appointment?.id,
        appointment?.isConfirmed,
        true
      );
      if (response?.status === 200) {
        openNotificationWithIcon("Success", "Appointment Confirmed", "success");
      } else {
        openNotificationWithIcon("Failed", response?.data?.status, "error");
      }
    } catch (error) {
      openNotificationWithIcon("Failed", error?.message, "error");
    }
    window.location.reload();
  };
  const columns = [
    {
      title: "ID",
      dataIndex: "id",
      key: "id",
    },
    {
      title: "Issue",
      dataIndex: "issue",
      key: "issue",
    },
    {
      title: "Last Serviced Date",
      dataIndex: "lastServiceDate",
      key: "lastServiceDate",
    },
    {
      title: "City",
      dataIndex: "city",
      key: "serviceCenterId",
    },
    {
      title: "Car Brand",
      dataIndex: "carBrand",
      key: "carBrand",
    },
    {
      title: "Model",
      dataIndex: "carModel",
      key: "carModel",
    },
    {
      title: "Make Year",
      dataIndex: "carYear",
      key: "carYear",
    },
    {
      title: "Requested By",
      dataIndex: "username",
      key: "username",
    },
    {
      title: "Action",
      key: "action",
      render: (text, record) => (
        <Button
          type="primary"
          onClick={() => {
            setSelectedQuote(record);
            setQuotationCreateModalVisible(true);
          }}
        >
          Propose Quotation
        </Button>
      ),
    },
  ];

  const appointmentColumns = [
    {
      title: "ID",
      dataIndex: "id",
      key: "id",
    },
    {
      title: "From",
      dataIndex: "fromTime",
      key: "fromTime",
      render: (date) => getFullDate(date),
    },
    {
      title: "To",
      dataIndex: "toTime",
      key: "toTime",
      render: (date) => getFullDate(date),
    },
    {
      title: "Is Confirmed",
      dataIndex: "confirmed",
      key: "confirmed",
      render: (text) => {
       return <Tag color={text ? "green" : "red"}>
          {text ? "Yes" : "No"}
        </Tag>
      },
    },
    {
      title: "Is Completed",
      dataIndex: "completed",
      key: "completed",
      render: (text) => {
        return <Tag color={text ? "green" : "red"}>
           {text ? "Yes" : "No"}
         </Tag>
       },
    },
    {
      title: "Actions",
      key: "actions",
      render: (text, record) => {
        return (
          <>
            <Button
            key="confirm-button"
              color="default"
              variant="outlined"
              onClick={() => {
                confirmAppointment(record);
              }}
              
            >
              Confirm
            </Button>
            {" "}
            <Button
            key="complete-button"
               color="default"
              variant="outlined"
              onClick={() => {
                completeAppointment(record);
              }}
            >
              Complete
            </Button>
          </>
        );
      },
    },
  ];

  return (
    <>
      {contextHolder}
      <CustomTable
        title="Quotations"
        data={quotationRequests}
        columns={columns}
      />
      <QuotationCreateModal
        visible={quotationCreateModalVisible}
        onSuccess={onQuotationCreateSuccess}
        onFailure={onQuotationCreateFailure}
        quote={selectedQuote}
        onCancel={() => {
          setQuotationCreateModalVisible(false);
        }}
      />
      <CustomTable
        title="Appointment Requests"
        data={appointments}
        columns={appointmentColumns}
      />
    </>
  );
};

export default QuotationRequests;
