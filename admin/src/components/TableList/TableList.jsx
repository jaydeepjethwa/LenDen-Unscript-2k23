import React from 'react';
import {
  Table,
  TableBody,
  TableCell,
  TableContainer,
  TableHead,
  TableRow,
  Paper,
} from '@mui/material';

import './TableList.scss';
import { transactions } from '../../constants';

const TableList = () => {
  return (
    <TableContainer component={Paper} className="table">
      <Table sx={{ minWidth: 650 }} aria-label="simple table">
        <TableHead>
          <TableRow>
            <TableCell className="tableCell">Transaction ID</TableCell>
            <TableCell className="tableCell">Bond Id</TableCell>
            <TableCell className="tableCell">Transaction Time</TableCell>
            <TableCell className="tableCell">Quantity</TableCell>
            <TableCell className="tableCell">
              Transaction Price (&#8377;)
            </TableCell>
            <TableCell className="tableCell">Transaction Type</TableCell>
          </TableRow>
        </TableHead>
        <TableBody>
          {transactions.map((transaction) => (
            <TableRow key={transaction.id}>
              <TableCell className="tableCell">
                {transaction.transaction_id}
              </TableCell>
              <TableCell className="tableCell">
                <div className="cellWrapper">
                  {/* <img src={transaction.img} alt="" className="image" /> */}
                  {transaction.bond_id}
                </div>
              </TableCell>
              <TableCell className="tableCell">
                {transaction.transaction_time}
              </TableCell>
              <TableCell className="tableCell">
                {transaction.quantity}
              </TableCell>
              <TableCell className="tableCell">
                {transaction.transaction_price}
              </TableCell>
              {/* <TableCell className="tableCell">{transaction.method}</TableCell> */}
              <TableCell className="tableCell">
                <span className={`status ${transaction.type}`}>
                  {transaction.type}
                </span>
              </TableCell>
            </TableRow>
          ))}
        </TableBody>
      </Table>
    </TableContainer>
  );
};

export default TableList;
