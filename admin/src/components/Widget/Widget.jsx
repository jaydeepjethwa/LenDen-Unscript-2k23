import React, { useState, useEffect } from 'react';
import {
  AccountBalanceWalletOutlined,
  KeyboardArrowUpOutlined,
  MonetizationOnOutlined,
  PersonOutlined,
  ShoppingCartOutlined,
} from '@mui/icons-material';
import { Link } from 'react-router-dom';
import axios from 'axios';

import './Widget.scss';

const Widget = ({ type }) => {
  let data;

  const amount = 100;
  const diff = 20;

  const [userCount, setUserCount] = useState(0);
  const [unverifiedUserCount, setUnverifiedUserCount] = useState(0);

  switch (type) {
    case 'users':
      data = {
        title: 'USERS',
        isMoney: false,
        link: 'See all Users',
        linkTo: '/users',
        stat: userCount,
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
        title: 'KYC PENDING',
        isMoney: false,
        link: 'See all Users',
        linkTo: '/users',
        stat: unverifiedUserCount,
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
        count: 0,
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
        count: 0,
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

  useEffect(() => {
    const fetchUnverifiedUserCountData = async () => {
      try {
        const res = await axios.get(
          'http://192.168.137.217:8000/user/unverified-count'
        );
        // console.log(res.data);
        setUnverifiedUserCount((prev) => res.data);
      } catch (err) {
        console.error(err);
      }
    };

    const fetchUsersCountData = async () => {
      try {
        const res = await axios.get('http://192.168.137.217:8000/user/all');
        // console.log(res.data.length);
        setUserCount((prev) => res.data.length);
      } catch (err) {
        console.error(err);
      }
    };

    fetchUnverifiedUserCountData();
    fetchUsersCountData();

    // console.log(userCount)
  }, []);

  return (
    <div className="widget">
      <div className="left">
        <span className="title">{data.title}</span>
        <span className="counter">
          {data.isMoney && <>&#8377;</>} {data.stat}
        </span>
        <Link to={data.linkTo} style={{textDecoration: "none", color: "inherit"}}>
          <span className="link">{data.link}</span>
        </Link>
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
