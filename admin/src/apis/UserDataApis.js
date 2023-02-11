import axios from 'axios';
import { baseUrl } from './config';

export const fetchUsersData = async () => {
  try {
    const { data } = await axios.get(`${baseUrl}/user/all`);
    // console.log(data)
    // setUsersData(data)
    return data;
  } catch (err) {
    console.error(err);
  }
};

export const fetchUnverifiedUserCountData = async () => {
  try {
    const { data } = await axios.get(`${baseUrl}/user/unverified-count`);
    // console.log(res.data);
    // setUnverifiedUserCount((prev) => res.data);
    return data;
  } catch (err) {
    console.error(err);
  }
};

export const fetchUsersCountData = async () => {
  try {
    const { data } = await axios.get(`${baseUrl}/user/all`);
    console.log(data.length);
    // setUserCount((prev) => res.data.length);
    return data.length;
  } catch (err) {
    console.error(err);
  }
};

export const fetchSingleUserData = async (userId) => {
  try {
    const { data } = await axios.get(`${baseUrl}/user/${userId}`);
    // console.log(data)
    return data;
  } catch (err) {
    console.error(err);
  }
};
