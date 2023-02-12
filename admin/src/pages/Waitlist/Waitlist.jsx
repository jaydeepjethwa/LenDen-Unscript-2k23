import React, { useState, useEffect } from 'react';
import axios from 'axios';

import './Waitlist.scss';
import { Sidebar, Navbar, TableList } from '../../components';
import { baseUrl } from '../../apis/config';

const Waitlist = () => {
  const [waitlistData, setWaitlistData] = useState([]);

  // useEffect(() => {
  //   const fetchWaitlistData = async => {
  //     try {
  //     const res = await axios.get(`${baseUrl}/`)
  //     console.log(res)

  //     } catch (error) {
  //       console.error(error)
  //     }
  //   }

  //   fetchWaitlistData()
  // }, [])

  return (
    <div className="waitlist">
      <Sidebar />
      <div className="waitlistContainer">
        <Navbar />
        <div className="tableContainer">
          <div className="title">Waitlist</div>
          <TableList />
        </div>
      </div>
    </div>
  );
};

export default Waitlist;
