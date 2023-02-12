import React, { useState, useEffect } from 'react';
import axios from 'axios';
import { useLocation } from 'react-router-dom';

import './BondDetails.scss';
import { Navbar, Sidebar } from '../../components';
import { baseUrl } from '../../apis/config';

const BondDetails = () => {
  const [bondDetails, setBondDetails] = useState({});
  const bondId = useLocation().pathname.split('/')[3];

  useEffect(() => {
    const fetchBondDetailsData = async () => {
      try {
        const { data } = await axios.get(`${baseUrl}/bond/${bondId}`);
        // console.log(data);
        setBondDetails(data);
      } catch (err) {
        console.error(err);
      }
    };

    fetchBondDetailsData();
  }, [bondDetails.length]);

  return (
    <div className="bondDetails">
      <Sidebar />
      <div className="bondDetailsContainer">
        <Navbar />
        <div className="title">Bond Details</div>
        <div className="top">
          <div className="left">
            <div className="details">
              <p className="title">
                {bondDetails.Symbol} - {bondDetails.Series}
              </p>
              <p className="bondInfo">
                Company:{' '}
                <span className="bondData"> {bondDetails.companyName}</span>
              </p>
              <p className="bondInfo">
                Maturity Date:{' '}
                <span className="bondData">{bondDetails.maturity_date}</span>
              </p>
              <p className="bondInfo">
                Coupon Rate:{' '}
                <span className="bondData">{bondDetails.CouponRate}</span>
              </p>
              <p className="bondInfo">
                Type: <span className="bondData">{bondDetails.BondType}</span>
              </p>
            </div>
          </div>

          <div className="right">
            <div className="details">
              <p className="bondInfo">
                High: <span className="bondData">{bondDetails.High}</span>
              </p>
              <p className="bondInfo">
                Low: <span className="bondData">{bondDetails.Low}</span>
              </p>
              <p className="bondInfo">
                Open: <span className="bondData">{bondDetails.Open}</span>
              </p>
              <p className="bondInfo">
                Close: <span className="bondData">{bondDetails.Close}</span>
              </p>
              <p className="bondInfo">
                LTP: <span className="bondData">{bondDetails.LTP}</span>
              </p>
              <p className="bondInfo">
                Change:{' '}
                <span className="bondData">
                  {bondDetails.PercentageChange}%
                </span>
              </p>
            </div>
            <div className="details">
              <p className="bondInfo">
                Coupon Rate:{' '}
                <span className="bondData">{bondDetails.CouponRate}</span>
              </p>
              <p className="bondInfo">
                Value: <span className="bondData">{bondDetails.Value}</span>
              </p>
              <p className="bondInfo">
                Yield: <span className="bondData">{bondDetails.bYield}</span>
              </p>
              <p className="bondInfo">
                Face Value:{' '}
                <span className="bondData">{bondDetails.face_value}</span>
              </p>
              <p className="bondInfo">
                ISIN: <span className="bondData">{bondDetails.isin}</span>
              </p>
              <p className="bondInfo">
                Quantity: <span className="bondData">{bondDetails.Qty}</span>
              </p>
            </div>
          </div>
        </div>
        <div className="bottom">
          <div className="bottomCard">
            <div className="title">
              <p>Bond Rating</p>
            </div>
            {/* <div className="title">Bond Rating</div> */}
            {/* <div className="bondRating">AAA+</div> */}
            {bondDetails.credit_rating ? (
              <div className="bondRating">{bondDetails.credit_rating}</div>
            ) : (
              <div className="ratingInfo">Data not available!</div>
            )}
            <div className="ratingInfo">
              These Ratings are provided by {bondDetails.rating_agency} agencies
            </div>
          </div>
        </div>
      </div>
    </div>
  );
};

export default BondDetails;
