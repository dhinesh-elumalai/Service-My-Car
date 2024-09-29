import React, { useEffect } from 'react';
import { Button, Checkbox, Form, Input, notification } from "antd";

const Home = (isFromLoginPage) => {
    const [api, contextHolder] = notification.useNotification();

    const openNotificationWithIcon = (title, message, type) => {
      api[type]({
        message: title,
        description: message,
      });
    };

    useEffect(()=>{
        if(isFromLoginPage){
            openNotificationWithIcon("Success", "Logged in succesfully!", "success");
        }
        
    })
    return (
        <>
        {contextHolder}
        <h2>Home Page</h2>
        </>
    );
};

export default Home;