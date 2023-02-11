import { useState, useEffect } from 'react';
import { BrowserRouter, Routes, Route } from 'react-router-dom';
import axios from 'axios';
import 'bootstrap/dist/js/bootstrap.bundle.min';
import 'bootstrap/dist/css/bootstrap.min.css';

import {
  Login,
  Home,
  List,
  New,
  Single,
  Banner,
  BannerEdit,
  BannerView,
  NewBanner,
  Settings,
  UserProfile,
} from './pages';
// import { userInputs, productInputs } from './constants';
import { bondsData, ordersData, usersData1 } from './constants';
// import { baseUrl } from './apis/config';
import {
  fetchUsersData,
  fetchUnverifiedUserCountData,
  fetchUsersCountData,
} from './apis/UserDataApis';
import { baseUrl } from './apis/config';

function App() {
  const [usersData, setUsersData] = useState([]);
  const [userCount, setUserCount] = useState();
  const [unverifiedUserCount, setUnverifiedUserCount] = useState();
  // const [bondsData, setBondsData] = useState([]);

  // useEffect(() => {
  //   // Fetch Users data
  //   const getAllVendors = async () => {
  //     const res = await fetch(
  //       'http://localhost:8000/api/vendormanagement/getMainList'
  //     );
  //     const resData = await res.json();
  //     setUsersData(resData);
  //   };

  //   getAllVendors();

  //   // Fetch Bonds Data
  // }, []);

  useEffect(() => {
    // Fetch all Users Data
    const fetchUsers = async () => {
      const data = await fetchUsersData();
      // console.log(data[0].profile_photo)
      setUsersData(data);
      setUserCount(data.length);
    };

    fetchUsers();
  }, [usersData.length]);

  useEffect(() => {
    const fetchUnverifiedUserCount = async () => {
      const data = await fetchUnverifiedUserCountData();
      setUnverifiedUserCount(data);
    };

    fetchUnverifiedUserCount();
  }, [unverifiedUserCount]);

  return (
    <div className="App">
      <BrowserRouter>
        <Routes>
          <Route path="/">
            <Route
              index
              element={
                <Home
                  userCount={userCount}
                  unverifiedUserCount={unverifiedUserCount}
                />
              }
            />
            <Route path="login" element={<Login />} />
          </Route>

          <Route path="users">
            <Route index element={<List data={usersData} />} />
            <Route path="view/:id" element={<UserProfile />} />
            <Route
              path="new"
              element={<New inputs={'userInputs'} title="Add New User" />}
            />
          </Route>

          <Route path="bonds">
            <Route index element={<List data={bondsData} />} />
            <Route path="view/:id" element={<Single />} />
            <Route
              path="new"
              element={<New inputs={'productInputs'} title="Add New Product" />}
            />
          </Route>

          <Route path="orders">
            <Route index element={<List data={ordersData} />} />
            <Route path=":productId" element={<Single />} />
            <Route
              path="new"
              element={<New inputs={'productInputs'} title="Add New Product" />}
            />
          </Route>

          <Route path="banners">
            <Route index element={<Banner />} />
            <Route path="view/:id" element={<BannerView />} />
            <Route path="edit/:id" element={<BannerEdit />} />
            <Route path="new" element={<NewBanner title="Add New Banner" />} />
          </Route>

          <Route path="/settings" element={<Settings />} />
        </Routes>
      </BrowserRouter>
    </div>
  );
}

export default App;
