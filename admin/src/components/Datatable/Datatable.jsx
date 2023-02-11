import React, { useState, useEffect } from 'react';
import { DataGrid } from '@mui/x-data-grid';
import { Link, useLocation } from 'react-router-dom';

import axios from 'axios';
import Switch from '@mui/material/Switch';
import { alpha, styled } from '@mui/material/styles';
import { red } from '@mui/material/colors';
import { green } from '@mui/material/colors';
import './Datatable.scss';

const initialSort = [
  {
    field: 'verified',
    dir: 'asc',
  },
];

const usersColumns = [
  { field: 'id', headerName: 'ID', width: 70 },
  { field: 'name', headerName: 'User Name', width: 200 },
  { field: 'email', headerName: 'User Email', width: 200 },
  { field: 'phone', headerName: 'User Phone-no', width: 200 },
];

const bondsColumns = [
  { field: 'id', headerName: 'ID', width: 120 },
  { field: 'bond', headerName: 'Bond Name', width: 220 },
  { field: 'issuerName', headerName: 'Issuer Name', width: 250 },
  { field: 'rating', headerName: 'Rating', width: 100 },
  { field: 'minInvest', headerName: 'Min. Investment (Rs.)', width: 150 },
  { field: 'yield', headerName: 'Yield (%)', width: 100 },
  { field: 'tenure', headerName: 'Tenure (months)', width: 150 },
];

const ordersColumns = [
  { field: 'id', headerName: 'ID', width: 120 },
  { field: 'date', headerName: 'Date', width: 100 },
  { field: 'bond', headerName: 'Bond Name', width: 220 },
  { field: 'soldTo', headerName: 'Sold To', width: 200 },
  { field: 'soldBy', headerName: 'Sold By', width: 200 },
  { field: 'amount', headerName: 'Amount (Rs.)', width: 150 },
];

const DataTable = ({ data }) => {
  const currentPath = useLocation().pathname;

  // console.log(currentPath);

  const RedSwitch = styled(Switch)(({ theme }) => ({
    '& .MuiSwitch-switchBase.Mui-checked': {
      color: red[900],
      '&:hover': {
        backgroundColor: alpha(red[900], theme.palette.action.hoverOpacity),
      },
    },
    '& .MuiSwitch-switchBase.Mui-checked + .MuiSwitch-track': {
      backgroundColor: red[900],
    },
  }));
  const GreenSwitch = styled(Switch)(({ theme }) => ({
    '& .MuiSwitch-switchBase.Mui-checked': {
      color: green[600],
      '&:hover': {
        backgroundColor: alpha(green[600], theme.palette.action.hoverOpacity),
      },
    },
    '& .MuiSwitch-switchBase.Mui-checked + .MuiSwitch-track': {
      backgroundColor: green[600],
    },
  }));

  async function handleStatus(id) {
    status(id);
    //window.location.reload()
    getAllVendor();
  }

  const status = async (id) => {
    let del = await axios.post(
      'http://localhost:8000/api/vendormanagement/editStatus',
      { id }
    );
  };
  async function handleVerified(id) {
    verified(id);
    window.location.reload();
  }

  const verified = async (id) => {
    //  alert(id)
    let del = await axios.post(
      'http://localhost:8000/api/vendormanagement/editVerified',
      { id }
    );
  };

  // View
  async function handleView(id) {
    return (
      <div>
        <VendorProfile />
      </div>
    );
  }


  const actionColumn = [
    {
      field: 'action',
      headerName: 'View Details',
      width: 130,
      renderCell: (params) => {
        return (
          <div className="cellAction">
            <Link to="/users/test" style={{ textDecoration: 'none' }}>
              <div className="viewButton">View</div>
            </Link>
          </div>
        );
      },
    },
  ];

  const actionStatus = [
    {
      field: 'status',
      headerName: 'isActive',
      width: 150,
      renderCell: (params) => {
        return (
          <div className="cellAction">
            <RedSwitch
              checked={params.row.isActive == 0 ? true : false}
              onClick={() => handleStatus(params.row.id)}
              inputProps={{ 'aria-label': 'controlled' }}
            />
            <label>{params.row.isActive == 0 ? 'Disable' : 'Enable'}</label>
          </div>
        );
      },
    },
  ];

  const actionVerified = [
    {
      field: 'verified',
      headerName: 'KYC Status',
      width: 200,
      type: 'string',
      renderCell: (params) => {
        return (
          <div className="cellAction">
            <GreenSwitch
              checked={params.row.isVerified == 1 ? true : false}
              onClick={() => handleVerified(params.row.id)}
              inputProps={{ 'aria-label': 'controlled' }}
            />
            <label>
              {params.row.isVerified == 1 ? 'Approved' : 'Not Approved'}
            </label>
          </div>
        );
      },
    },
  ];

  return (
    <div className="datatable">
      <div className="datatableTitle">
        Add New User
        <Link to="/users/new" className="link">
          Add New
        </Link>
      </div>
      {currentPath === '/users' && (
        <DataGrid
          className="datagrid"
          rows={data}
          columns={usersColumns.concat(actionColumn).concat(actionVerified)}
          pageSize={9}
          rowsPerPageOptions={[9]}
          checkboxSelection
        />
      )}

      {currentPath === '/bonds' && (
        <DataGrid
          className="datagrid"
          rows={data}
          columns={bondsColumns.concat(actionColumn)}
          pageSize={9}
          rowsPerPageOptions={[9]}
          checkboxSelection
        />
      )}

      {currentPath === '/orders' && (
        <DataGrid
          className="datagrid"
          rows={data}
          columns={ordersColumns.concat(actionColumn)}
          pageSize={9}
          rowsPerPageOptions={[9]}
          checkboxSelection
        />
      )}
    </div>
  );
};

export default DataTable;
