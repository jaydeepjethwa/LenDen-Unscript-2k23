export const fetchUsersData = async () => {
      try {
        const {data} = await axios.get(`${baseUrl}/user/all`);
        // console.log(data)
        setUsersData(data)
      } catch (err) {
        console.error(err);
      }
    };