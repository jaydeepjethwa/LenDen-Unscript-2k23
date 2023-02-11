import React, { useState, useEffect } from 'react';
import { Box } from '@mui/material';
import { DataGrid } from '@mui/x-data-grid';
import axios from 'axios';
import { Link, useNavigate } from 'react-router-dom';

import './Databanner.scss';
import { BannerEdit } from '../../../pages';

const Databanner = () => {
  const [Banner, setBanner] = useState([]);

  const navigate = useNavigate()

  const userColumns = [
    { field: 'id', headerName: 'ID', width: 70 },
    { field: 'name', headerName: 'Name', width: 200 },
    { field: 'description', headerName: 'Category', width: 200 },
  ];

  useEffect(() => {
    getAllBanner();
  }, []);

  const getAllBanner = async () => {
    var result = await fetch("http://localhost:8000/api/banner/getAllBanner");
    var temp = await result.json();
    // console.log(result);
    setBanner(temp);
  };

  async function handleDelete(id) {
    if (window.confirm('Want to delete?')) {
      setBanner(Banner.filter((item) => item.id !== id));

      let del = await axios.post(
        'http://localhost:8000/api/banner/deleteBannerById',
        { id }
      );

      del = await del.json();
      console.log(del);
      getAllBanner();
    }
  }

  async function handleView(id) {
    // return (
    //   <div>
    //     <BannerView />
    //   </div>
    // );
    navigate(`/banners/view/${id}`)
  
  }

  async function handleEdit(id) {
    // return (
    //   <div>
    //     <BannerEdit />
    //   </div>
    // );

    navigate(`/banners/edit/${id}`)
  }

  const actionColumn = [
    {
      field: 'action',
      headerName: 'Action',
      width: 200,
      renderCell: (params) => {
        return (
          <div className="cellAction">
            {/* <Link
              to={'/banner/view/' + params.row.id}
              style={{ textDecoration: 'none' }}
            > */}
              <div
                className="viewButton"
                onClick={() => navigate(`/banners/view/${params.row.id}`)}
              >
                View
              </div>
            {/* </Link> */}

            {/* <Link
              to={'/banner/edit/' + params.row.id}
              style={{ textDecoration: 'none' }}
            > */}
              <div
                className="editButton"
                onClick={() => navigate(`/banners/edit/${params.row.id}`)}
              >
                Edit
              </div>
            {/* </Link> */}

            <div
              className="deleteButton"
              onClick={() => handleDelete(params.row.id)}
            >
              Delete
            </div>
          </div>
        );
      },
    },
  ];
  return (
    <div className="databanner">
      <div className="databannerTitle">
        <h1>
          <strong>Banners</strong>
        </h1>
        <Link to="/banners/new" className="link">
          Add New
        </Link>
      </div>
      <Box sx={{ height: 800, width: '100%' }}>
        <DataGrid
          className="datagrid"
          rows={Banner}
          columns={userColumns.concat(actionColumn)}
          pageSize={13}
          rowsPerPageOptions={[13]}
          editRowsModel
          //checkboxSelection
        />
      </Box>
    </div>
  );
};

export default Databanner;
