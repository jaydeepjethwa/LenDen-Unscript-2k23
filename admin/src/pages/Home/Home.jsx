import React from 'react';

import './Home.scss';
import { Chart, Featured, Navbar, Sidebar, Widget, TableList } from '../../components';

const Home = () => {
  return (
    <div className="home">
      <Sidebar />
      <div className="homeContainer">
        <Navbar />

        <div className="widgets">
          <Widget type="users" />
          <Widget type="orders" />
          <Widget type="earnings" />
          <Widget type="balance" />
        </div>

        <div className="charts">
          <Featured />
          <Chart title="Area Chart" aspect={2.5 / 1} />
        </div>

        <div className="listContainer">
          <div className="listTitle">Latest Transactions</div>
          <TableList />
        </div>
      </div>
    </div>
  );
};

export default Home;
