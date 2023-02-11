import React from 'react';

import './NewBond.scss';
import { Sidebar, Navbar } from '../../components';

const NewBond = () => {
  return (
    <div className="newBond">
      <Sidebar />
      <div className="newBondContainer">
        <Navbar />
        New Bond
      </div>
    </div>
  );
};

export default NewBond;
