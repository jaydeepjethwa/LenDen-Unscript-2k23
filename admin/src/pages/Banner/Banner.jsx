import React, { useState } from 'react';


import './Banner.scss';
import { Sidebar, Navbar, Databanner } from '../../components';
import 'react-dropzone-uploader/dist/styles.css'

const Banner = () => {
  return (
    <div className="banner">
      <Sidebar />
      <div className="bannerContainer">
        <Navbar />
        <div className="banner">
          <Databanner />
        </div>
      </div>
    </div>
  );
};

export default Banner;
