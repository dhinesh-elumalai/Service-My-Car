import { Button, notification, Tag } from "antd";
import { useEffect, useState } from "react";
import { getAllBookingsByUsername } from "./../services/appointment-service";
import CustomTable from "../components/CustomTable";
import { render } from "@testing-library/react";
import { getUsername } from "../utils/token";
import AppointmentModal from "../modals/AppointmentCreateModal";

export const getFullDate = (date) => {
  return new Date(date).toLocaleString();
};

const columns = [
  {
    title: "ID",
    dataIndex: "id",
    key: "id",
  },
  {
    title: "Service Center ID",
    dataIndex: "serviceCenterUsername",
    key: "serviceCenterUsername",
  },
  {
    title: "From",
    dataIndex: "fromTime",
    key: "fromTime",
    render: ((date) => getFullDate(date)) 
  },
  {
    title: "To",
    dataIndex: "toTime",
    key: "toTime",
    render: ((date) => getFullDate(date)) 
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
];

const Appointments = () => {
  const [appointments, setappointments] = useState([]);
  const [username, setUsername] = useState(getUsername());

  useEffect(() => {
    fetchAppointmentsByUsername(username);
  }, [username]);

  const [api, contextHolder] = notification.useNotification();

  const openNotificationWithIcon = (title, message, type) => {
    api[type]({
      message: title,
      description: message,
    });
  };


  const fetchAppointmentsByUsername = async (username) => {
    try {
      const response = await getAllBookingsByUsername(username);
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


  return (
    <>
      {contextHolder}
      <CustomTable
        title="Appointment Schedules"
        data={appointments}
        columns={columns}
      />
    </>
  );
};

export default Appointments;
