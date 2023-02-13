import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unscript/constant/color.dart';
import 'package:unscript/constant/size.dart';
import 'package:unscript/constant/textstyle.dart';
import 'package:unscript/model/bond_model.dart';

class CustomBondCard extends StatelessWidget {
  final BondModel bond;
  const CustomBondCard({super.key, required this.bond});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(
          "/bondPurchase",
          arguments: [
            {
              "bond": bond,
            },
          ],
        );
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
                bond.symbol,
                style: header2.copyWith(
                    fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              verticalSpacing(vs1),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _bondCardItem(
                    "Bond Type",
                    bond.bondType,
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
                    bond.high,
                  ),
                  horizontalSpacing(hs1 * 6.6),
                  _bondCardItem(
                    "Low",
                    bond.low,
                  ),
                ],
              ),
              verticalSpacing(8.0),
              _bondCardItem(
                "Maturity Date",
                bond.maturityDate,
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
