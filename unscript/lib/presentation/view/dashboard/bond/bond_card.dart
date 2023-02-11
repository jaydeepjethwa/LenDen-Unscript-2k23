import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unscript/constant/color.dart';
import 'package:unscript/constant/size.dart';
import 'package:unscript/constant/textstyle.dart';

class BondCard extends StatelessWidget {
  const BondCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed("bondPurchase");
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: grey, width: 0.5),
            bottom: BorderSide(color: grey, width: 0.5),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding, vertical: 15.0),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    "NHAI",
                    style: header2.copyWith(fontWeight: FontWeight.bold),
                  ),
                  horizontalSpacing(5.0),
                  Container(
                    width: 5.0,
                    height: 5.0,
                    decoration: BoxDecoration(
                      color: black,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  horizontalSpacing(5.0),
                  Text(
                    "N6",
                    style: paraStyle.copyWith(fontSize: 14.0),
                  ),
                ],
              ),
              verticalSpacing(vs1),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _cardItem("MATURITY DATE", "SEP 26, 2023"),
                  _cardItem("COUPON", "6.75%"),
                  _cardItem("%CHNG", "-0.01"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _cardItem(String key, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          key,
          style: normalText.copyWith(fontSize: 12.0),
        ),
        verticalSpacing(5.0),
        Text(
          value,
          style: paraStyle,
        ),
      ],
    );
  }
}
