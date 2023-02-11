import 'package:flutter/material.dart';
import 'package:unscript/constant/color.dart';
import 'package:unscript/constant/size.dart';
import 'package:unscript/constant/textstyle.dart';

class PortfolioCard extends StatelessWidget {
  const PortfolioCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getWidth(context) - 40,
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
                Text(
                  "Bond name goes HERE",
                  style: header1,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text("Sell"),
                ),
                verticalSpacing(5.0),
              ],
            ),
            verticalSpacing(vs1),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _summaryItem("Date Bought", "14-23-3890"),
                _summaryItem("Qty", "243"),
                _summaryItem("Price", "14345"),
                _summaryItem("Current Price", "1434"),
                _summaryItem("Maturity Date", "14-23-3456"),
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
