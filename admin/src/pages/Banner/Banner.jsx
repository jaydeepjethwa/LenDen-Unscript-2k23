import React, { useState } from 'react';

import './Banner.scss';
import { Sidebar, Navbar } from '../../components';

const Banner = () => {
  return (
    <div className="banner">
      <Sidebar />
      <div className="bannerContainer">
        <Navbar />
        <div className="banner">
          {/* <Databanner /> */}
        </div>
      </div>
    </div>
  );
};

export default Banner;
