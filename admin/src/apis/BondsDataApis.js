import axios from 'axios';
import { baseUrl } from './config';

export const fetchBondsData = async () => {
  try {
    const { data } = await axios.get(`${baseUrl}/bond/all`);
    // console.log(data)
    // setUsersData(data)
    return data;
  } catch (err) {
    console.error(err);
  }
};
