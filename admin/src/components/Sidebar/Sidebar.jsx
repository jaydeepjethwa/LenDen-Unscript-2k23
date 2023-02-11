import React from 'react';
import {
  DashboardOutlined,
  PersonOutlineOutlined,
  FeedOutlined,
  CreditCardOutlined,
  ViewCarouselOutlined,
  SettingsOutlined,
  LogoutOutlined,
} from '@mui/icons-material';
import { Link } from 'react-router-dom';

import './Sidebar.scss';

const Sidebar = () => {
  return (
    <div className="sidebar">
      <div className="top">
        <Link to="/" style={{ textDecoration: 'none' }}>
          <span className="logo">My Dashboard</span>
        </Link>
      </div>
      <hr />
      <div className="center">
        <ul>
          <p className="title">MAIN</p>
          <Link to="/" style={{ textDecoration: 'none' }}>
            <li>
              <DashboardOutlined className="icon" />
              <span>Dashboard</span>
            </li>
          </Link>

          <p className="title">LISTS</p>
          <Link to="/users" style={{ textDecoration: 'none' }}>
            <li>
              <PersonOutlineOutlined className="icon" />
              <span>Users</span>
            </li>
          </Link>

          <Link to="/bonds" style={{ textDecoration: 'none' }}>
            <li>
              <FeedOutlined className="icon" />
              <span>Bonds</span>
            </li>
          </Link>

          <Link to="/orders" style={{ textDecoration: 'none' }}>
            <li>
              <CreditCardOutlined className="icon" />
              <span>Orders</span>
            </li>
          </Link>

          <p className="title">USEFUL</p>
          <Link to="/banners" style={{ textDecoration: 'none' }}>
            <li>
              <ViewCarouselOutlined className="icon" />
              <span>Banners</span>
            </li>
          </Link>

          <li>
            <SettingsOutlined className="icon" />
            <span>Settings</span>
          </li>

          <p className="title">ADMIN</p>
          {/* <li>
            <AccountCircleOutlined className="icon" />
            <span>Profile</span>
          </li> */}
          <li>
            <LogoutOutlined className="icon" />
            <span>Logout</span>
          </li>

          {/* <p className="title">THEME</p>
          <div className="bottom">
            <div className="colorOption"></div>
            <div className="colorOption"></div>
          </div> */}
        </ul>
      </div>
    </div>
  );
};

export default Sidebar;
