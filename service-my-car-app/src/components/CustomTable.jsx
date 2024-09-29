import React from "react";
import { Descriptions, Table } from "antd";

const CustomTable = ({ title, data, columns }) => {
  return (
    <>
      <Descriptions title={title} bordered />
      <Table dataSource={data} columns={columns} />
    </>
  );
};

export default CustomTable;
