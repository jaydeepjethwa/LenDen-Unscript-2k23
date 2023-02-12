import React, { useState } from 'react';
import { Link, useNavigate } from 'react-router-dom';
import axios from 'axios';

import './NewBond.scss';
import { Sidebar, Navbar } from '../../components';
import { baseUrl } from '../../apis/config';

const NewBond = () => {
  const navigate = useNavigate();

  const [symbol, setSymbol] = useState('');
  const [series, setSeries] = useState('');
  const [bondType, setBondType] = useState('');
  const [open, setOpen] = useState('');
  const [high, setHigh] = useState('');
  const [low, setLow] = useState('');
  const [ltp, setLtp] = useState('');
  const [close, setClose] = useState('');
  const [percentChng, setPercentChng] = useState('');
  const [qty, setQty] = useState('');
  const [bValue, setBValue] = useState('');
  const [couponRate, setCouponRate] = useState('');
  const [creditRating, setCreditRating] = useState('');
  const [ratingAgency, setRatingAgency] = useState('');
  const [faceValue, setFaceValue] = useState('');
  const [maturityDate, setMaturityDate] = useState('');
  const [bYield, setBYield] = useState('');
  const [isin, setIsin] = useState('');
  const [company, setCompany] = useState('');

  const handleSubmit = async (e) => {
    e.preventDefault();
    const data = {
      Symbol: symbol,
      Series: series,
      BondType: bondType,
      Open: open,
      High: high,
      Low: low,
      LTP: ltp,
      Close: close,
      PercentageChange: parseFloat(percentChng),
      Qty: parseInt(qty),
      Value: parseFloat(bValue),
      CouponRate: parseFloat(couponRate),
      credit_rating: creditRating,
      rating_agency: ratingAgency,
      face_value: parseFloat(faceValue),
      maturity_date: maturityDate,
      bYield: bYield,
      isin: isin,
      companyName: company,
    };
    // console.log(dispatch);
    // try {
    //   const res = await axios.post(`${baseUrl}/bond/add-bond`, {
    //     bond,
    //   });
    //   console.log(res);
    // } catch (err) {
    //   console.error(err);
    // }

    axios
      .post(`${baseUrl}/bond/add-bond`, data)
      .then((resp) => {
        console.log(resp);
        navigate('/bonds');
      })
      .catch((err) => {
        console.log(err);
      });
  };

  // /bond/add-bond
  return (
    <div className="newBond">
      <Sidebar />
      <div className="newBondContainer">
        <Navbar />
        <div className="container">
          <p className="title">Add Bond</p>
          <div className="row">
            <div className="col">
              <div className="row t1">SYMBOL</div>
              <div className="row">
                {' '}
                <input
                  type="text"
                  value={symbol}
                  onChange={(e) => setSymbol(e.target.value)}
                  name="symbol"
                />
              </div>
            </div>
            <div className="col">
              <div className="row t1">SERIES</div>
              <div className="row">
                {' '}
                <input
                  type="text"
                  value={series}
                  onChange={(e) => setSeries(e.target.value)}
                  name="series"
                />
              </div>
            </div>
            <div className="col">
              <div className="row t1">BOND TYPE</div>
              <div className="row">
                {' '}
                <input
                  type="text"
                  value={bondType}
                  onChange={(e) => setBondType(e.target.value)}
                  name="btype"
                />
              </div>
            </div>
          </div>

          <div className="row">
            <div className="col">
              <div className="row t1">OPEN</div>
              <div className="row">
                {' '}
                <input
                  type="text"
                  value={open}
                  onChange={(e) => setOpen(e.target.value)}
                  name="open"
                />
              </div>
            </div>
            <div className="col">
              <div className="row t1">HIGH</div>
              <div className="row">
                {' '}
                <input
                  type="text"
                  value={high}
                  onChange={(e) => setHigh(e.target.value)}
                  name="high"
                />
              </div>
            </div>
            <div className="col">
              <div className="row t1">LOW</div>
              <div className="row">
                {' '}
                <input
                  type="text"
                  value={low}
                  onChange={(e) => setLow(e.target.value)}
                  name="low"
                />
              </div>
            </div>
          </div>

          <div className="row">
            <div className="col">
              <div className="row t1">LTP</div>
              <div className="row">
                {' '}
                <input
                  type="text"
                  value={ltp}
                  onChange={(e) => setLtp(e.target.value)}
                  name="ltp"
                />
              </div>
            </div>
            <div className="col">
              <div className="row t1">CLOSES</div>
              <div className="row">
                {' '}
                <input
                  type="text"
                  value={close}
                  onChange={(e) => setClose(e.target.value)}
                  name="closes"
                />
              </div>
            </div>
            <div className="col">
              <div className="row t1">%CHNG</div>
              <div className="row">
                {' '}
                <input
                  type="text"
                  value={percentChng}
                  onChange={(e) => setPercentChng(e.target.value)}
                  name="chng"
                />
              </div>
            </div>
          </div>

          <div className="row">
            <div className="col">
              <div className="row t1">Quantity</div>
              <div className="row">
                {' '}
                <input
                  type="text"
                  value={qty}
                  onChange={(e) => setQty(e.target.value)}
                  name="qty"
                />
              </div>
            </div>
            <div className="col">
              <div className="row t1">Value</div>
              <div className="row">
                {' '}
                <input
                  type="text"
                  value={bValue}
                  onChange={(e) => setBValue(e.target.value)}
                  name="value"
                />
              </div>
            </div>
            <div className="col">
              <div className="row t1">COUPON RATE</div>
              <div className="row">
                {' '}
                <input
                  type="text"
                  value={couponRate}
                  onChange={(e) => setCouponRate(e.target.value)}
                  name="cpnrate"
                />
              </div>
            </div>
          </div>

          <div className="row">
            <div className="col">
              <div className="row t1">CREDIT RATING</div>
              <div className="row">
                {' '}
                <input
                  type="text"
                  value={creditRating}
                  onChange={(e) => setCreditRating(e.target.value)}
                  name="creditrate"
                />
              </div>
            </div>
            <div className="col">
              <div className="row t1">RATING AGENCY</div>
              <div className="row">
                {' '}
                <input
                  type="text"
                  value={ratingAgency}
                  onChange={(e) => setRatingAgency(e.target.value)}
                  name="ratingagency"
                />
              </div>
            </div>
            <div className="col">
              <div className="row t1">FACE VALUE</div>
              <div className="row">
                {' '}
                <input
                  type="text"
                  value={faceValue}
                  onChange={(e) => setFaceValue(e.target.value)}
                  name="facevalue"
                />
              </div>
            </div>
          </div>

          <div className="row">
            <div className="col">
              {/* Calendar */}
              <div className="row t1">MATURITY DATE</div>
              <div className="row mt-4">
                {' '}
                <input
                  type="date"
                  value={maturityDate}
                  onChange={(e) => setMaturityDate(e.target.value)}
                  name="matdate"
                />
              </div>
            </div>
            <div className="col">
              <div className="row t1">YEILD</div>
              <div className="row">
                {' '}
                <input
                  type="text"
                  value={bYield}
                  onChange={(e) => setBYield(e.target.value)}
                  name="byeild"
                />
              </div>
            </div>
            <div className="col">
              <div className="row t1">IS IN</div>
              <div className="row">
                {' '}
                <input
                  type="text"
                  value={isin}
                  onChange={(e) => setIsin(e.target.value)}
                  name="isin"
                />
              </div>
            </div>
          </div>

          <div className="row">
            <div className="col">
              <div className="row t1">COMPANY NAME</div>
              <div className="row">
                {' '}
                <input
                  type="text"
                  value={company}
                  onChange={(e) => setCompany(e.target.value)}
                  name="cmpname"
                />
              </div>
            </div>
            <div className="col">
              {/* <div className="row t1">RELEASED ON</div>
              <div className="row mt-4">
                {' '}
                <input type="date" name="reldate" />
              </div> */}
            </div>
            <div className="col subBtn">
              <button
                type="button"
                onClick={handleSubmit}
                className="btn btn-primary"
              >
                Add New Bond
              </button>
              <Link to="/bonds">
                <button type="button" className="btn btn-secondary ms-3">
                  Cancel
                </button>
              </Link>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
};

export default NewBond;
