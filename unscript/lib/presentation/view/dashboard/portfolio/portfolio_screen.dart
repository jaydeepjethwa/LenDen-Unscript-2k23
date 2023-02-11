import 'package:flutter/material.dart';
import 'package:unscript/constant/color.dart';
import 'package:unscript/constant/size.dart';
import 'package:unscript/constant/textstyle.dart';
import 'package:unscript/presentation/view/dashboard/portfolio/portfolio_card.dart';

class PortfolioScreen extends StatelessWidget {
  const PortfolioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpacing(vs1),
            Text("Portfolio", style: header1,),
            verticalSpacing(vs1),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _summaryItem("1245", "Bonds"),
                  _summaryItem("3456", "Quanity"),
                  _summaryItem("234567", "Total Amount"),
                  // _summaryItem("value", "key"),
                ],
              ),
            ),
            verticalSpacing(vs2),
            Text("My Assets", style: header1,),
            verticalSpacing(vs1),
            PortfolioCard(),
          ],
        ),
      ),
    );
  }

  Widget _summaryItem(String value, String key) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: blue, width: 2.0),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          children: [
            Text(
              value,
              style: header2.copyWith(fontWeight: FontWeight.bold, color: blue),
            ),
            Text(
              key,
              style: paraStyle.copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
