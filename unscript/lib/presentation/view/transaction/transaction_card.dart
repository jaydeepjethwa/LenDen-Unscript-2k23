import 'package:flutter/material.dart';
import 'package:unscript/constant/color.dart';
import 'package:unscript/constant/constant.dart';
import 'package:unscript/constant/size.dart';
import 'package:unscript/constant/textstyle.dart';
import 'package:unscript/model/transaction_model.dart';

class TransactionCard extends StatelessWidget {
  final TransactionModel transaction;
  const TransactionCard({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.0),
      decoration: BoxDecoration(
        color: lightGrey,
        border: Border.all(color: blue, width: 1.0),
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              transaction.companyName,
              style: header2.copyWith(fontWeight: FontWeight.bold),
            ),
            verticalSpacing(vs1),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _summaryItem("Date Bought", formatDate(transaction.transactionTime)),
                _summaryItem("Price", transaction.transactionPrice.toString()),
                _summaryItem("Qty", transaction.quantity.toString()),
                Text(
                  "\u{20B9} ${transaction.transactionPrice * transaction.quantity}",
                  style: TextStyle(
                    color: transaction.type.name == "BUY" ?  red : Colors.green,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _summaryItem(String value, String key) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          value,
          style: paraStyle.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 12.0,
            color: blue,
          ),
        ),
        Text(
          key,
          style: paraStyle.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 12.0,
          ),
        ),
      ],
    );
  }
}
