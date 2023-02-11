import 'package:flutter/material.dart';
import 'package:unscript/constant/color.dart';
import 'package:unscript/constant/size.dart';
import 'package:unscript/constant/textstyle.dart';

class BondPurchaseScreen extends StatelessWidget {
  const BondPurchaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        leading: Icon(
          Icons.arrow_back,
          color: blue,
        ),
        title: Row(
          children: [
            const Image(
              image: AssetImage("assets/logo_1.png"),
              width: 40.0,
            ),
            horizontalSpacing(5.0),
            Text(
              "KYC Details",
              style: normalText.copyWith(
                color: blue,
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
          ],
        ),
        elevation: 0.7,
      ),
      body: SizedBox(
        width: getWidth(context),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpacing(vs2),
              SizedBox(
                width: getWidth(context),
                child: Text(
                  "NHAI",
                  style: header1,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                width: getWidth(context),
                child: Text(
                  "- N6 -",
                  style: paraStyle.copyWith(
                      fontSize: 12.0, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              verticalSpacing(vs2),
              Container(
                color: grey,
                width: getWidth(context),
                height: 1.0,
              ),
              verticalSpacing(20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _bondPurchaseItem("IS IN", "IN906B)&DF8"),
                      _bondPurchaseItem("Maturity Date", "12/10/2023"),
                      _bondPurchaseItem("Bond Type", "Regular"),
                      _bondPurchaseItem("Coupon Interest", "6.75%"),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _bondPurchaseItem("High", "1250"),
                      _bondPurchaseItem("Low", "1240"),
                      _bondPurchaseItem("Last Traded Price", "1240"),
                      _bondPurchaseItem("Value", "2000000"),
                    ],
                  ),
                ],
              ),
              verticalSpacing(vs1),
              _bondPurchaseItem(
                  "Company Name", "National Highway Auhtority Of India"),
              verticalSpacing(vs2),
              Container(
                width: getWidth(context) - 40,
                height: 200,
                decoration: BoxDecoration(
                  border: Border.all(color: blue, width: 2.0),
                  borderRadius: BorderRadius.circular(10.0),
                  color: lightGrey,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "CREDIT RATING",
                      style: header2.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      "AAA",
                      style: TextStyle(
                        fontSize: 50.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    verticalSpacing(vs2),
                    Text(
                      "Rating Agency",
                      style: header2.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      "CRISIL, CARE, BWR",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              verticalSpacing(60.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: Text("Purchase Later", style: buttonStyle,),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text("Purchase Now", style: buttonStyle,),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _bondPurchaseItem(String key, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            key,
            style: paraStyle.copyWith(color: blue, fontWeight: FontWeight.bold),
          ),
          Text(
            value,
            style: header2.copyWith(fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
