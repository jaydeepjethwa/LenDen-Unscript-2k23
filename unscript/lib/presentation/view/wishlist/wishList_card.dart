import 'package:flutter/material.dart';
import 'package:unscript/constant/color.dart';
import 'package:unscript/constant/size.dart';
import 'package:unscript/constant/textstyle.dart';
import 'package:unscript/model/waitlist_model.dart';

class WishListCard extends StatelessWidget {
  final WaitlistModel model;
  const WishListCard({
    super.key, required this.model,
  });

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
              model.companyName,
              style: header2.copyWith(fontWeight: FontWeight.bold),
            ),
            verticalSpacing(vs1),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _summaryItem(
                    "Current Rate", model.ltp.toString()),
                _summaryItem("Price", model.price.toString()),
                _summaryItem("Qty", model.quantity.toString()),
                Text(
                  "\u{20B9} ${model.price * model.quantity}",
                  style: TextStyle(
                    color: red,
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
