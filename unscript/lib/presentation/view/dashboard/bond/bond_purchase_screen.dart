import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unscript/constant/color.dart';
import 'package:unscript/constant/size.dart';
import 'package:unscript/constant/textstyle.dart';
import 'package:unscript/controller/bond/bond_purchase_controller.dart';
import 'package:unscript/presentation/widget/custom_long_button.dart';
import 'package:unscript/presentation/widget/custom_textfield.dart';

class BondPurchaseScreen extends GetView<BondPurchaseController> {
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
              "Trade",
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
      body: SingleChildScrollView(
        child: SizedBox(
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
                    controller.bond.symbol,
                    style: header1,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  width: getWidth(context),
                  child: Text(
                    "- ${controller.bond.series} -",
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
                        _bondPurchaseItem("IS IN", controller.bond.isin),
                        _bondPurchaseItem(
                            "Maturity Date", controller.bond.maturityDate),
                        _bondPurchaseItem(
                            "Bond Type", controller.bond.bondType),
                        _bondPurchaseItem("Coupon Interest",
                            controller.bond.couponRate.toString()),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _bondPurchaseItem("High", controller.bond.high),
                        _bondPurchaseItem("Low", controller.bond.low),
                        _bondPurchaseItem(
                            "Last Traded Price", controller.bond.ltp),
                        _bondPurchaseItem(
                            "Value", controller.bond.value.toString()),
                      ],
                    ),
                  ],
                ),
                verticalSpacing(vs1),
                _bondPurchaseItem("Company Name", controller.bond.companyName),
                _bondPurchaseItem("Qty", controller.bond.qty.toString()),
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
                      Text(
                        controller.bond.creditRating,
                        style: const TextStyle(
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
                      Text(
                        controller.bond.ratingAgency,
                        style: const TextStyle(
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
                      onPressed: () {
                        buyLaterBottomSheet(context);
                      },
                      child: Text(
                        "Purchase Later",
                        style: buttonStyle,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        openBottomSheet(context);
                      },
                      child: Text(
                        "Purchase Now",
                        style: buttonStyle,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void openBottomSheet(BuildContext context) {
    Get.bottomSheet(
      SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Text(
                controller.bond.companyName,
                style: header2.copyWith(fontWeight: FontWeight.bold),
              ),
              verticalSpacing(vs2 * 2),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Price : ${controller.bond.ltp}",
                    style: header2.copyWith(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Available Qty : ${controller.bond.qty}",
                    style: header2.copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              verticalSpacing(vs2),
              Container(
                margin: const EdgeInsets.only(bottom: 10.0),
                width: getWidth(context) - horizontalPadding,
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: controller.qtyC,
                  decoration: InputDecoration(
                    hintText: "Qty",
                    hintStyle: hintText,
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 5.0),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: blue,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  onChanged: ((val) {
                    if (val != "") {
                      controller.cartValue.value = (double.parse(val) *
                          double.parse(controller.bond.ltp));
                    } else {
                      controller.cartValue.value = 0.0;
                    }
                  }),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Obx(
                    () => Text(
                      "Total Value : ${controller.cartValue.value.toString()}",
                      style: paraStyle,
                    ),
                  ),
                  Obx(
                    () => Text(
                      "Balance : ${controller.balance.value}",
                      style: paraStyle.copyWith(
                          color: Colors.green, fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
              verticalSpacing(vs2),
              CustomLongButton(
                buttonText: "Buy Bond",
                onPressedFunction: () {
                  controller.handleApiCall();
                },
              ),
              verticalSpacing(vs2)
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
      elevation: 0,
    );
  }

  void buyLaterBottomSheet(BuildContext context) {
    Get.bottomSheet(
      SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Text(
                controller.bond.companyName,
                style: header2.copyWith(fontWeight: FontWeight.bold),
              ),
              verticalSpacing(vs2 * 2),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Price : ${controller.bond.ltp}",
                    style: header2.copyWith(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Available Qty : ${controller.bond.qty}",
                    style: header2.copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              verticalSpacing(vs2),
              Container(
                margin: const EdgeInsets.only(bottom: 10.0),
                width: getWidth(context) - horizontalPadding,
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: controller.qtyWB,
                  decoration: InputDecoration(
                    hintText: "Qty",
                    hintStyle: hintText,
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 5.0),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: blue,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 10.0),
                width: getWidth(context) - horizontalPadding,
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: controller.priceWB,
                  decoration: InputDecoration(
                    hintText: "Price",
                    hintStyle: hintText,
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 5.0),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: blue,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Obx(
                    () => Text(
                      "Balance : ${controller.balance.value}",
                      style: paraStyle.copyWith(
                          color: Colors.green, fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
              verticalSpacing(vs2),
              CustomLongButton(
                buttonText: "Auto Buy",
                onPressedFunction: () {
                  controller.autoAPICall();
                },
              ),
              verticalSpacing(vs2)
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
      elevation: 0,
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
