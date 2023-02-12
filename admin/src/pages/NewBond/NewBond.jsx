import React from 'react';
import { Link } from 'react-router-dom';

import './NewBond.scss';
import { Sidebar, Navbar } from '../../components';

const NewBond = () => {
  return (
    <div className="newBond">
      <Sidebar />
      <div className="newBondContainer">
        <Navbar />
        <div className="container">
          <p className="title">New Bond</p>
          <div className="row">
            <div className="col">
              <div className="row t1">SYMBOL</div>
              <div className="row"> <input type="text" name="symbol"/></div>
            </div>
            <div className="col">
              <div className="row t1">SERIES</div>
              <div className="row"> <input type="text" name="series" /></div>
            </div>
            <div className="col">
              <div className="row t1">BOND TYPE</div>
              <div className="row"> <input type="text" name="btype" /></div>
            </div>
          </div>

          <div className="row">
            <div className="col">
              <div className="row t1">OPEN</div>
              <div className="row"> <input type="text" name="open" /></div>
            </div>
            <div className="col">
              <div className="row t1">HIGH</div>
              <div className="row"> <input type="text" name="high" /></div>
            </div>
            <div className="col">
              <div className="row t1">LOW</div>
              <div className="row"> <input type="text" name="low" /></div>
            </div>
          </div>

          <div className="row">
            <div className="col">
              <div className="row t1">LTP</div>
              <div className="row"> <input type="text" name="ltp" /></div>
            </div>
            <div className="col">
              <div className="row t1">CLOSES</div>
              <div className="row"> <input type="text" name="closes" /></div>
            </div>
            <div className="col">
              <div className="row t1">%CHNG</div>
              <div className="row"> <input type="text" name="chng" /></div>
            </div>
          </div>

          <div className="row">
            <div className="col">
              <div className="row t1">Quantity</div>
              <div className="row"> <input type="text" name="qty" /></div>

            </div>
            <div className="col">
              <div className="row t1">Value</div>
              <div className="row"> <input type="text" name="value" /></div>
            </div>
            <div className="col">
              <div className="row t1">COUPON RATE</div>
              <div className="row"> <input type="text" name="cpnrate" /></div>
            </div>
          </div>

          <div className="row">
            <div className="col">
              <div className="row t1">CREDIT RATING</div>
              <div className="row"> <input type="text" name="creditrate" /></div>
            </div>
            <div className="col">
              <div className="row t1">RAING AGENCY</div>
              <div className="row"> <input type="text" name="ratingagency" /></div>
            </div>
            <div className="col">
              <div className="row t1">FACE VALUE</div>
              <div className="row"> <input type="text" name="facevalue" /></div>
            </div>
          </div>

          <div className="row">
            <div className="col">
              {/* Calendar */}
              <div className="row t1">MATURITY DATE</div>
              <div className="row mt-4"> <input type="date" name="matdate" /></div>
            </div>
            <div className="col">
              <div className="row t1">BYEILD</div>
              <div className="row"> <input type="text" name="byeild" /></div>
            </div>
            <div className="col">
            <div className="row t1">IS IN</div>
              <div className="row"> <input type="text" name="isin" /></div>
            </div>
          </div>

          <div className="row">
            <div className="col">
              <div className="row t1">COMPANY NAME</div>
              <div className="row"> <input type="text" name="cmpname" /></div>
            </div>
            <div className="col">
              <div className="row t1">RELEASED ON</div>
              <div className="row mt-4"> <input type="date" name="reldate" /></div>
            </div>
            <div className="col subBtn">
              
            <button type="button" class="btn btn-primary">Add New Bond</button>
            <Link to="/bonds"><button type="button" class="btn btn-secondary ms-3">Cancel</button></Link>
            
            </div>
          </div>

        </div>
      </div>
    </div>
  );
};

export default NewBond;
