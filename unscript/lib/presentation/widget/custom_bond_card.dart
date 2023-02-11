import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unscript/constant/color.dart';
import 'package:unscript/constant/size.dart';
import 'package:unscript/constant/textstyle.dart';

class CustomBondCard extends StatelessWidget {
  const CustomBondCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed("/bondPurchase");
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: blue, width: 0.5),
          borderRadius: BorderRadius.circular(15.0),
          color: lightGrey,
        ),
        margin: const EdgeInsets.only(right: 20.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Income NBFC Bond",
                style: header2.copyWith(
                    fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              verticalSpacing(vs1),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _bondCardItem(
                    "Bond Type",
                    "Regular",
                  ),
                  horizontalSpacing(hs1 * 3),
                  _bondCardItem("Qty", "1200"),
                ],
              ),
              verticalSpacing(8.0),
              Row(
                children: [
                  _bondCardItem(
                    "High",
                    "1238",
                  ),
                  horizontalSpacing(hs1 * 6.6),
                  _bondCardItem("Low", "1238"),
                ],
              ),
              verticalSpacing(8.0),
              _bondCardItem(
                "Maturity Date",
                "SEP 12, 2023",
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _bondCardItem(String key, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          key,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          value,
        ),
      ],
    );
  }
}
