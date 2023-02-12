import React, { useState, useEffect } from 'react';
import axios from 'axios';

import './Settings.scss';
import { Sidebar, Navbar } from '../../components';
import { baseUrl } from '../../apis/config';

const Settings = () => {
  const [fees, setFees] = useState('');
  const [input, setInput] = useState('');

  const [pfInput, setPfInput] = useState(6);
  const [bondId, setBondId] = useState(0);
  const [bondPrice, setBondPrice] = useState(0);

  // useEffect(() => {
  //   getPlatformcommision();
  // }, []);

  // const getPlatformcommision = async (id) => {
  //   var result = await fetch(
  //     'http://localhost:8000/api/platform/getPlatformFees'
  //   );
  //   var result = await result.json();

  //   setFees(result[0].fees);
  //   // console.log(result[0].name);
  // };

  const SubmitBondPriceData = async (e) => {
    e.preventDefault();
    const data = {
      bond_id: parseInt(bondId),
      price: parseFloat(bondPrice),
    };
    console.log(data);
    axios
      .post(`${baseUrl}/bond/update-price`, data)
      .then((resp) => {
        console.log(resp);
        // navigate('/bonds');
      })
      .catch((err) => {
        console.log(err);
      });
  };

  // }

  const handleSubmitFee = (e) => {
    console.log(input);

    setPfInput();
    // if (input > 0) {
    //   const { data } = await axios.post(
    //     'http://localhost:8000/api/platform/updatePlatformFees',
    //     { id: 1, fees: input }
    //   );
    //   // console.log(data)
    // } else {
    //   alert('Value should be greater than or equal to 0 (zero)');
    //   getPlatformcommision();
    // }
  };

  return (
    <div className="settings">
      <Sidebar />
      <div className="settingsContainer">
        <Navbar />

        <div className="settingsCard">
          <div className="settingsTitle">Settings</div>

          <div className="settingsSubtitle">Set Platform Fee (%)</div>
          <form>
            <div className="formInput">
              <label>
                <span>(Current value - {fees}%) </span>
              </label>
              <input
                type="number"
                value={pfInput}
                onChange={(e) => {
                  setInput(e.target.value);
                }}
                placeholder="Enter new value here..."
              />
            </div>

            <button onClick={handleSubmitFee}>Set Fee</button>
          </form>

          <div className="settingsSubtitle mt-5">Change Bond Price</div>
          <form>
            <div className="formInput">
              <label>
                <span></span>
              </label>
              <input
                type="number"
                value={bondId}
                onChange={(e) => {
                  setBondId(e.target.value);
                }}
                placeholder="Enter Bond ID"
              />
              <input
                type="number"
                value={bondPrice}
                onChange={(e) => {
                  setBondPrice(e.target.value);
                }}
                placeholder="Enter New Price"
              />
            </div>

            <button onClick={SubmitBondPriceData}>Set Bond Price</button>
          </form>
        </div>
      </div>
    </div>
  );
};

export default Settings;
