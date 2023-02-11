import React, { useState, useEffect } from 'react';
import { DataGrid } from '@mui/x-data-grid';
import { Link, useLocation, useNavigate } from 'react-router-dom';

import axios from 'axios';
import Switch from '@mui/material/Switch';
import { alpha, styled } from '@mui/material/styles';
import { red } from '@mui/material/colors';
import { green } from '@mui/material/colors';
import './Datatable.scss';
import { baseUrl } from '../../apis/config';

const initialSort = [
  {
    field: 'verified',
    dir: 'asc',
  },
];

const usersColumns = [
  // { field: 'user_id', headerName: 'User ID', width: 70 },
  { field: 'name', headerName: 'User Name', width: 200 },
  { field: 'email', headerName: 'User Email', width: 200 },
  { field: 'contact_no', headerName: 'User Phone No.', width: 200 },
];

const bondsColumns = [
  // { field: 'bond_id', headerName: 'ID', width: 120 },
  { field: 'companyName', headerName: 'Company Name', width: 250 },
  { field: 'Symbol', headerName: 'Symbol', width: 100 },
  { field: 'Series', headerName: 'Series', width: 100 },
  { field: 'BondType', headerName: 'Bond Type', width: 130 },
  { field: 'credit_rating', headerName: 'Rating', width: 100 },
  { field: 'PercentageChange', headerName: '%age Change', width: 120 },
  { field: 'Qty', headerName: 'Quantity', width: 80 },
  { field: 'CouponRate', headerName: 'Coupon Rate (%)', width: 150 },
  // { field: 'released_on', headerName: 'Released On', width: 130 },
  // { field: 'maturity_date', headerName: 'Maturity Date', width: 130 },
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
  const navigate = useNavigate();
  // const [isFeatured, setIsFeatured] = useState(0)

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

  const handleKycStatus = async (userId) => {
    try {
      const { data } = await axios.post(
        `http://192.168.137.147:8000/user/approve-kyc/${userId}`
      );
      console.log(data);
      window.location.reload();
      // console.log(userId)
    } catch (err) {
      console.error(err);
    }
  };

  // Toggle isFeatured Status
  const handleIsFeaturedBonds = async (bondId, isFeatured) => {
    try {
      if (isFeatured === 1) {
        const { data } = await axios.post(`${baseUrl}/bond/featured-status/`, {
          bond_id: bondId,
          status: 0,
        });
        window.location.reload();
      } else if (isFeatured === 0) {
        const { data } = await axios.post(`${baseUrl}/bond/featured-status/`, {
          bond_id: bondId,
          status: 1,
        });
        window.location.reload();
      }
    } catch (err) {
      console.error(err);
    }
  };

  const actionColumn = [
    {
      field: 'action',
      headerName: 'View Details',
      width: 130,
      renderCell: (params) => {
        return (
          <div className="cellAction">
            {currentPath === '/users' && (
              <Link
                to={`/users/view/${params.row.user_id}`}
                style={{ textDecoration: 'none' }}
              >
                <div className="viewButton">View</div>
              </Link>
            )}

            {currentPath === '/bonds' && (
              <Link
                to={`/bonds/view/${params.row.id}`}
                style={{ textDecoration: 'none' }}
              >
                <div className="viewButton">View</div>
              </Link>
            )}
          </div>
        );
      },
    },
  ];

  // const actionStatus = [
  //   {
  //     field: 'status',
  //     headerName: 'isActive',
  //     width: 150,
  //     renderCell: (params) => {
  //       return (
  //         <div className="cellAction">
  //           <RedSwitch
  //             checked={params.row.isActive == 0 ? true : false}
  //             onClick={() => handleStatus(params.row.id)}
  //             inputProps={{ 'aria-label': 'controlled' }}
  //           />
  //           <label>{params.row.isActive == 0 ? 'Disable' : 'Enable'}</label>
  //         </div>
  //       );
  //     },
  //   },
  // ];

  const actionKyc = [
    {
      field: 'kyc_completed',
      headerName: 'KYC Status',
      width: 200,
      type: 'string',
      renderCell: (params) => {
        return (
          <div className="cellAction">
            <GreenSwitch
              checked={params.row.kyc_completed === 1 ? true : false}
              onClick={() => handleKycStatus(params.row.user_id)}
              inputProps={{ 'aria-label': 'controlled' }}
            />
            <label>
              {params.row.kyc_completed === 1 ? 'Completed' : 'Not Completed'}
            </label>
          </div>
        );
      },
    },
  ];

  const actionfeaturedBonds = [
    {
      field: 'is_featured',
      headerName: 'Is Featured',
      width: 200,
      type: 'string',
      renderCell: (params) => {
        return (
          <div className="cellAction">
            <GreenSwitch
              checked={params.row.is_featured === 1 ? true : false}
              onClick={() =>
                handleIsFeaturedBonds(
                  params.row.bond_id,
                  params.row.is_featured
                )
              }
              inputProps={{ 'aria-label': 'controlled' }}
            />
            <label>{params.row.is_featured === 1 ? 'Yes' : 'No'}</label>
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
      {currentPath === '/users' && data && (
        <DataGrid
          className="datagrid"
          getRowId={(row) => row.user_id}
          rows={data}
          columns={usersColumns.concat(actionKyc).concat(actionColumn)}
          pageSize={9}
          rowsPerPageOptions={[9]}
          checkboxSelection
        />
      )}

      {currentPath === '/bonds' && data && (
        <DataGrid
          className="datagrid"
          getRowId={(row) => row.bond_id}
          rows={data}
          columns={bondsColumns
            .concat(actionfeaturedBonds)
            .concat(actionColumn)}
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
