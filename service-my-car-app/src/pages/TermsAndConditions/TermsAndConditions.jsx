// File: src/components/TermsAndConditions.js
import React from "react";
import "./style.css";
import { Button } from "antd";

const TermsAndConditions = () => {
  return (
    <div className="terms-container">
      <h1>Terms and Conditions</h1>
      <p>
        Welcome to our car service management website. By accessing or using our
        website, you agree to comply with and be bound by the following terms
        and conditions.
      </p>

      <h2>1. General Terms</h2>
      <p>
        These terms and conditions govern your use of our website and services.
        By using our website, you accept these terms in full. If you disagree
        with any part of these terms, you must not use our website.
      </p>

      <h2>2. User Responsibilities</h2>
      <p>As a user of our website, you agree to:</p>
      <ul>
        <li>
          Provide accurate and complete information when creating an account or
          making a service request.
        </li>
        <li>
          Maintain the confidentiality of your account credentials and notify us
          immediately of any unauthorized use.
        </li>
        <li>
          Use our website and services in compliance with all applicable laws
          and regulations.
        </li>
      </ul>

      <h2>3. Service Terms</h2>
      <p>
        Our services are provided on an "as is" and "as available" basis. We
        reserve the right to modify or discontinue our services at any time
        without notice. We are not liable for any damages arising from the use
        or inability to use our services.
      </p>

      <h2>4. Contact Information</h2>
      <p>
        If you have any questions or concerns about these terms and conditions,
        please contact us at:
      </p>
      <div className="contact-info">
        <p>Email: support@carservice.com</p>
        <p>Phone: +1 (800) 123-4567</p>
        <p>Address: 123 Car Service Lane, Auto City, CA 12345</p>
      </div>
      <div className="button-container">
        <Button type="primary"><a href="/signup">{"<<Back To Signup"}</a></Button>
      </div>
    </div>
  );
};

export default TermsAndConditions;
