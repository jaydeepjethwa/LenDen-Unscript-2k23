import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unscript/constant/color.dart';
import 'package:unscript/constant/size.dart';
import 'package:unscript/constant/textstyle.dart';
import 'package:unscript/controller/wallet/wallet_controller.dart';
import 'package:unscript/presentation/widget/custom_long_button.dart';
import 'package:unscript/presentation/widget/custom_textfield.dart';

class WalletScreen extends GetView<WalletController> {
  const WalletScreen({super.key});

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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpacing(vs2),
            Container(
              width: getWidth(context) - 40.0,
              decoration: BoxDecoration(
                color: lightGrey,
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(color: blue, width: 2.0),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 50.0),
                child: Column(
                  children: [
                    Text(
                      "\u{20B9} 23455678",
                      style: TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    verticalSpacing(vs1),
                    Text(
                      "Current Balance",
                      style: paraStyle.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            verticalSpacing(100.0),
            Text(
              "Add Money to your wallet",
              style: header2,
            ),
            verticalSpacing(vs2),
            Expanded(
              child: CustomTextField(
                capitalization: false,
                textController: controller.moneyC,
                hint: "Add Money",
                validateFunction: (value) {
                  if (value == "" || value != null) {
                    return "Invalid value";
                  }
                  return null;
                },
                onSaveFunction: (value) {
                  controller.money = value!;
                },
                keyboardType: TextInputType.number,
              ),
            ),
            CustomLongButton(
              buttonText: "Deposit Money",
              onPressedFunction: () {},
            ),
            verticalSpacing(vs2),
          ],
        ),
      ),
    );
  }
}
