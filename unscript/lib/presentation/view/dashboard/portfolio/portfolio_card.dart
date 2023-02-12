import 'package:flutter/material.dart';
import 'package:unscript/constant/color.dart';
import 'package:unscript/constant/constant.dart';
import 'package:unscript/constant/size.dart';
import 'package:unscript/constant/textstyle.dart';
import 'package:unscript/model/portfolio_model.dart';

class PortfolioCard extends StatelessWidget {
  final BondsDatum portfolio;
  final VoidCallback ontapFunction;
  const PortfolioCard({super.key, required this.portfolio, required this.ontapFunction});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getWidth(context) - 40,
      margin: const EdgeInsets.only(bottom: 10.0),
      decoration: BoxDecoration(
        color: lightGrey,
        border: Border.all(color: blue, width: 2.0),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    portfolio.companyName,
                    style: header1,
                  ),
                ),
                ElevatedButton(
                  onPressed: ontapFunction,
                  child: const Text("Sell"),
                ),
                verticalSpacing(5.0),
              ],
            ),
            verticalSpacing(vs1),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _summaryItem(
                    "Date Bought", formatDate(portfolio.transactionTime)),
                _summaryItem("Qty", portfolio.quantity.toString()),
                _summaryItem("Price", portfolio.purchasePrice.toString()),
                _summaryItem("Current Price", portfolio.ltp),
                _summaryItem("Maturity Date", portfolio.maturityDate),
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
