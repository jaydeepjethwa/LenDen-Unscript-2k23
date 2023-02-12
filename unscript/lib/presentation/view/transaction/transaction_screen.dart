import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unscript/constant/color.dart';
import 'package:unscript/constant/size.dart';
import 'package:unscript/constant/textstyle.dart';
import 'package:unscript/controller/transaction/transaction_controller.dart';
import 'package:unscript/presentation/view/transaction/transaction_card.dart';

class TransactionScreen extends GetView<TransactionController> {
  const TransactionScreen({super.key});

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
              "History",
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
      body: Obx(
        () => (controller.transactionList.isEmpty)
            ? SizedBox(
                width: getWidth(context),
                height: getHeight(context),
                child: Center(
                  child: Text(
                    "No Transactions !!",
                    style: header1,
                  ),
                ),
              )
            : Padding(
                padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return TransactionCard(
                        transaction: controller.transactionList[index]);
                  },
                  itemCount: controller.transactionList.length,
                  shrinkWrap: true,
                ),
              ),
      ),
    );
  }
}
