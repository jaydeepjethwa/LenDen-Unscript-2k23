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
            <TableCell className="tableCell">Tracking ID</TableCell>
            <TableCell className="tableCell">Product</TableCell>
            <TableCell className="tableCell">Customer</TableCell>
            <TableCell className="tableCell">Date</TableCell>
            <TableCell className="tableCell">Amount</TableCell>
            <TableCell className="tableCell">Payment Method</TableCell>
            <TableCell className="tableCell">Status</TableCell>
          </TableRow>
        </TableHead>
        <TableBody>
          {transactions.map((transaction) => (
            <TableRow key={transaction.id}>
              <TableCell className="tableCell">{transaction.id}</TableCell>
              <TableCell className="tableCell">
                <div className="cellWrapper">
                  <img src={transaction.img} alt="" className="image" />
                  {transaction.product}
                </div>
              </TableCell>
              <TableCell className="tableCell">{transaction.customer}</TableCell>
              <TableCell className="tableCell">{transaction.date}</TableCell>
              <TableCell className="tableCell">{transaction.amount}</TableCell>
              <TableCell className="tableCell">{transaction.method}</TableCell>
              <TableCell className="tableCell">
                <span className={`status ${transaction.status}`}>{transaction.status}</span>
              </TableCell>
            </TableRow>
          ))}
        </TableBody>
      </Table>
    </TableContainer>
  );
};

export default TableList;
