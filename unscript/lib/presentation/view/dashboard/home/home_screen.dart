import 'package:flutter/material.dart';
import 'package:unscript/constant/color.dart';
import 'package:unscript/constant/size.dart';
import 'package:unscript/presentation/widget/custom_bond_card.dart';
import 'package:unscript/presentation/widget/custom_kyc_alert.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getHeight(context),
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: ListView(
        children: [
          verticalSpacing(vs1),
          const CustomKYCAlert(),
          verticalSpacing(vs2),
          Text(
            "Featured Bond",
            style: TextStyle(
              color: blue,
              fontWeight: FontWeight.bold,
              fontSize: 22.0,
            ),
          ),
          verticalSpacing(vs1),
          SizedBox(
            width: getWidth(context),
            height: 184,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                CustomBondCard(),
                CustomBondCard(),
              ],
            ),
          ),
          verticalSpacing(vs2),
          Image(
            width: getWidth(context) - 40,
            image: const AssetImage("assets/banner.png"),
          ),
          verticalSpacing(vs2),
          Text(
            "Latest Bond",
            style: TextStyle(
              color: blue,
              fontWeight: FontWeight.bold,
              fontSize: 22.0,
            ),
          ),
          verticalSpacing(vs1),
          SizedBox(
            width: getWidth(context),
            height: 184,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                CustomBondCard(),
                CustomBondCard(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
