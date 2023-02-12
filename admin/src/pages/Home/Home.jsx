import React, { useState, useEffect } from 'react';
import axios from 'axios';

import './Home.scss';
import {
  Chart,
  Featured,
  Navbar,
  Sidebar,
  Widget,
  TableList,
} from '../../components';

const Home = ({
  userCount,
  unverifiedUserCount,
  totalEarningsData,
  transactionsCount,
}) => {
  // const [userCount, setUserCount] = useState(0);
  // const [unverifiedUserCount, setUnverifiedUserCount] = useState(0);

  // useEffect(() => {
  //   const fetchUnverifiedUserCountData = async () => {
  //     try {
  //       const res = await axios.get('http://192.168.137.217:8000/user/verified-count');
  //       console.log(res.data);
  //     } catch (err) {
  //       console.error(err);
  //     }
  //   };

  //   const fetchUsersCountData = async () => {
  //     try {
  //       const res = await axios.get('http://192.168.137.217:8000/user/all');
  //       console.log(res.data.length);
  //       setUnverifiedUserCount(prev => res.data.length)
  //     } catch (err) {
  //       console.error(err);
  //     }
  //   };

  //   fetchUnverifiedUserCountData();
  //   fetchUsersCountData()

  //   // console.log(userCount)
  // }, []);

  return (
    <div className="home">
      <Sidebar />
      <div className="homeContainer">
        <Navbar />

        <div className="widgets">
          <Widget type="users" userCount={userCount} />
          <Widget type="kyc" unverifiedUserCount={unverifiedUserCount} />
          <Widget type="earnings" totalEarningsData={totalEarningsData} />
          {/* <Widget type="transactions" transactionsCount={transactionsCount} /> */}
        </div>

        <div className="charts">
          <Featured />
          <Chart title="Area Chart" aspect={2.5 / 1} />
        </div>

        <div className="listContainer">
          <div className="listTitle">Discover Bonds</div>
          {/* <TableList /> */}
          <div className="widgets">
            {/* <Widget type="users" userCount={userCount} />
            <Widget type="kyc" unverifiedUserCount={unverifiedUserCount} />
            <Widget type="earnings" stat={300} />
            <Widget type="balance" stat={500} />
            <Widget type="balance" stat={500} /> */}
          </div>
        </div>
      </div>
    </div>
  );
};

export default Home;
