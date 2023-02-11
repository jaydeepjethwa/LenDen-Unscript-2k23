import React from 'react';

import './List.scss';
import { Sidebar, Navbar, Datatable } from '../../components';

const List = ({data}) => {
  // console.log(data)
  return (
    <div className="list">
      <Sidebar />
      <div className="listContainer">
        <Navbar />
        <Datatable data={data} />
      </div>
    </div>
  );
};

export default List;
