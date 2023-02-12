import React from 'react';
import {
  DashboardOutlined,
  PersonOutlineOutlined,
  FeedOutlined,
  HourglassTopOutlined,
  ViewCarouselOutlined,
  SettingsOutlined,
  LogoutOutlined,
  NoteAddOutlined,
} from '@mui/icons-material';
import { Link } from 'react-router-dom';

import './Sidebar.scss';
const Sidebar = () => {
  return (
    <div className="sidebarComp">
      <div className="topComp">
        <Link to="/" style={{ textDecoration: 'none' }}>
          <span className="logoComp">Admin Dashboard</span>
        </Link>
      </div>
      {/* <hr /> */}
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

          <Link to="/waitlist" style={{ textDecoration: 'none' }}>
            <li>
              <HourglassTopOutlined className="icon" />
              <span>Waitlist</span>
            </li>
          </Link>

          <p className="title">USEFUL</p>
          {/* <Link to="/banners" style={{ textDecoration: 'none' }}>
            <li>
              <ViewCarouselOutlined className="icon" />
              <span>W</span>
            </li>
          </Link> */}

          <Link to="/bonds/new" style={{ textDecoration: 'none' }}>
            <li>
              <NoteAddOutlined className="icon" />
              <span>Create Bonds</span>
            </li>
          </Link>

          <Link to="/settings" style={{ textDecoration: 'none' }}>
            <li>
              <SettingsOutlined className="icon" />
              <span>Settings</span>
            </li>
          </Link>

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
