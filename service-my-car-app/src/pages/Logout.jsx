import { useEffect } from "react";
import { useNavigate } from "react-router-dom";

const Logout = () => {
  const navigate = useNavigate();
  useEffect(() => {
    localStorage.removeItem("authToken");
    navigate("/login");
  });

  return <></>;
};

export default Logout;
