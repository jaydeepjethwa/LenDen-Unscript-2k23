import React, { useState, useEffect } from 'react';
import axios from 'axios';

import './Settings.scss';
import { Sidebar, Navbar } from '../../components';

const Settings = () => {
  const [fees, setFees] = useState('');
  const [input, setInput] = useState("")

  useEffect(() => {
    getPlatformcommision();
  }, []);

  const getPlatformcommision = async (id) => {
    var result = await fetch(
      'http://localhost:8000/api/platform/getPlatformFees'
    );
    var result = await result.json();

    setFees(result[0].fees);
    // console.log(result[0].name);
  };


  const handleSubmit = async (e) => {
    console.log(input)

    if (input > 0) {
      const {data } = await axios.post('http://localhost:8000/api/platform/updatePlatformFees',
      { id: 1, fees: input })
      // console.log(data)
    } else {
      alert("Value should be greater than or equal to 0 (zero)")
      getPlatformcommision()
    }
  }

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
                value={input}
                onChange={(e) => {
                  setInput(e.target.value);
                }}
                placeholder="Enter new value here..."
              />
            </div>

            <button onClick={handleSubmit}>Update</button>
          </form>
        </div>
      </div>
    </div>
  );
};

export default Settings;
