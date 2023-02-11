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
import { baseUrl } from '../../apis/config';
import {
  fetchUnverifiedUserCountData,
  fetchUsersCountData,
} from '../../apis/UserDataApis';

const Widget = ({ type, userCount, unverifiedUserCount }) => {
  let data;

  const amount = 100;
  const diff = 20;

  // const [userCount, setUserCount] = useState();
  // const [unverifiedUserCount, setUnverifiedUserCount] = useState();

  switch (type) {
    case 'users':
      data = {
        title: 'TOTAL USERS',
        isMoney: false,
        link: 'See all Users',
        linkTo: '/users',
        stat: userCount,
        icon: (
          <PersonOutlined
            className="widgetIcon"
            style={{ color: 'green', backgroundColor: 'rgba(0, 128, 0, 0.2' }}
          />
        ),
      };
      break;
    case 'kyc':
      data = {
        title: 'KYC PENDING',
        isMoney: false,
        link: 'See all Users',
        linkTo: '/users',
        stat: unverifiedUserCount,
        icon: (
          <PersonOutlined
            className="widgetIcon"
            style={{ color: 'crimson', backgroundColor: 'rgba(255, 0, 0, 0.2' }}
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
            className="widgetIcon"
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
            className="widgetIcon"
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

  // useEffect(() => {
  //   const fetchUsersCountData = async () => {
  //     try {
  //       const { data } = await axios.get(`${baseUrl}/user/all`);
  //       // console.log(data.length);
  //       // setUserCount(data.length);
  //       return data.length;
  //     } catch (err) {
  //       console.error(err);
  //     }
  //   };

  //   fetchUsersCountData();

  //   // console.log(userCount)
  // }, [userCount]);

  // useEffect(() => {
  //   const fetchUnverifiedUserCount = async () => {
  //     const data = await fetchUnverifiedUserCountData();
  //     // setUnverifiedUserCount(data);
  //   };

  //   fetchUnverifiedUserCount();
  // }, [unverifiedUserCount]);

  return (
    <div className="widget">
      <div className="left">
        <span className="title">{data.title}</span>
        {data.stat ? (
          <span className="counter">
            {data.isMoney && <>&#8377;</>} {data.stat}
          </span>
        ) : (
          <p>loading...</p>
        )}
        <Link
          to={data.linkTo}
          style={{ textDecoration: 'none', color: 'inherit' }}
        >
          <span className="link">{data.link}</span>
        </Link>
      </div>
      <div className="right">
        {/* <div className="percentage positive">
          <KeyboardArrowUpOutlined />
          {diff}%
        </div> */}
        {data.icon}
      </div>
    </div>
  );
};

export default Widget;
