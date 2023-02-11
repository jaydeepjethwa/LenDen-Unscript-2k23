import React, {useState, useEffect} from 'react';
import { useLocation  } from 'react-router-dom';
// import {base64decoder } from 'base64image'

import './UserProfile.scss';
import { Sidebar, Navbar, Chart, TableList, VendorDetails } from '../../components';
import { usersData1 } from '../../constants';
import { fetchSingleUserData } from '../../apis/UserDataApis';

const UserProfile = () => {
  const userProfileData = usersData1[0];
  // console.log(usersData1[0]);
  const [userData, setUserData] = useState({})
  let [imgSrc,setImgSrc] = useState('')

  const userId = useLocation().pathname.split("/")[3]

  useEffect(() => {
    const fetchSingleUser = async () => {
      const data = await fetchSingleUserData(userId)
      setUserData(data)
    } 
    fetchSingleUser()
  }, [])
  

  // Convert base64 to img
  // const convertImg = () => {
  //   var imageData = new Buffer('/9j/4AAQSkZJRgABAQAAAQABAAD...', 'base64');

  //   base64decoder(imageData, options, function (err, saved) {
  //     if (err) { console.log(err); }  
  //     console.log(saved);    
  //   });  
  // }

  return (
    <div className="single">
      <Sidebar />
      <div className="singleContainer">
        <Navbar />
        <div className="top">
          <div className="left">
            {/* <div className="editButton">Edit</div> */}
            <h1 className="title">Information</h1>
            <div className="item">
            {/* data:image/jpeg;base64,${userData.profile_photo} */}
              {/* <img
                src={`data:image/jpeg;base64,${userData.profile_photo}`}
                alt="user profile img"
                className="itemImg"
              /> */}
              <img
                src={`data:image/png;base64,${userData.profile_photo}`}
                alt="user profile img"
                className="itemImg"
              />
              <div className="details">
                <h1 className="itemTitle">{userData.name}</h1>
                <div className="detailItem">
                  <span className="itemKey">Email:</span>
                  <span className="itemValue">{userData.email}</span>
                </div>
                <div className="detailItem">
                  <span className="itemKey">Phone:</span>
                  <span className="itemValue">{userData.contact_no}</span>
                </div>
                <div className="detailItem">
                  <span className="itemKey">Wallet: </span>
                  <span className="itemValue">
                   &#8377; {userData.wallet}
                  </span>
                </div>
                <div className="detailItem">
                  <span className="itemKey">KYC Status: </span>
                  <span className="itemValue">{userData.kyc_completed === 1 ? "Completed" : "Not Completed"}</span>
                </div>
              </div>
            </div>
          </div>

          <div className="right">
          <VendorDetails aspect={3/1}/>
          </div>
        </div>
        <div className="bottom">
          <h1 className="title">Last Transactions</h1>
          <TableList />
        </div>
      </div>
    </div>
  );
};

export default UserProfile;
