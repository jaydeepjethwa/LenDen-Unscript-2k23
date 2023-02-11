import React from 'react';
import {
  AccountBalanceWalletOutlined,
  KeyboardArrowUpOutlined,
  MonetizationOnOutlined,
  PersonOutlined,
  ShoppingCartOutlined,
} from '@mui/icons-material';

import './Widget.scss';

const Widget = ({ type }) => {
  let data;

  const amount = 100;
  const diff = 20;

  switch (type) {
    case 'users':
      data = {
        title: 'USERS',
        isMoney: false,
        link: 'See all Users',
        icon: (
          <PersonOutlined
            className="icon"
            style={{ color: 'crimson', backgroundColor: 'rgba(255, 0, 0, 0.2' }}
          />
        ),
      };
      break;
    case 'orders':
      data = {
        title: 'ORDERS',
        isMoney: false,
        link: 'View all Orders',
        icon: (
          <ShoppingCartOutlined
            className="icon"
            style={{
              color: 'goldenrod',
              backgroundColor: 'rgba(218, 165, 32, 0.2',
            }}
          />
        ),
      };
      break;
    case 'earnings':
      data = {
        title: 'EARNINGS',
        isMoney: true,
        link: 'View Net Earnings',
        icon: (
          <MonetizationOnOutlined
            className="icon"
            style={{ color: 'green', backgroundColor: 'rgba(0, 128, 0, 0.2' }}
          />
        ),
      };
      break;
    case 'balance':
      data = {
        title: 'BALANCE',
        isMoney: true,
        link: 'See Details',
        icon: (
          <AccountBalanceWalletOutlined
            className="icon"
            style={{
              color: 'purple',
              backgroundColor: 'rgba(128, 0, 128, 0.2',
            }}
          />
        ),
      };
      break;
    default:
      break;
  }

  return (
    <div className="widget">
      <div className="left">
        <span className="title">{data.title}</span>
        <span className="counter">
          {data.isMoney && <>&#8377;</>} {amount}
        </span>
        <span className="link">{data.link}</span>
      </div>
      <div className="right">
        <div className="percentage positive">
          <KeyboardArrowUpOutlined />
          {diff}%
        </div>
        {data.icon}
      </div>
    </div>
  );
};

export default Widget;
