import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unscript/constant/color.dart';
import 'package:unscript/constant/size.dart';
import 'package:unscript/constant/textstyle.dart';
import 'package:unscript/controller/portfolio/portfolio_controller.dart';
import 'package:unscript/model/portfolio_model.dart';
import 'package:unscript/presentation/view/dashboard/portfolio/portfolio_card.dart';
import 'package:unscript/presentation/widget/custom_long_button.dart';

class PortfolioScreen extends GetWidget<PortfolioController> {
  const PortfolioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Obx(
        () => (controller.list.isEmpty)
            ? SizedBox(
                height: getHeight(context),
                width: getWidth(context),
                child: const Center(
                  child: Text("Wait..."),
                ),
              )
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    verticalSpacing(vs1),
                    Text(
                      "Portfolio",
                      style: header1,
                    ),
                    verticalSpacing(vs1),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _summaryItem(controller.bonds.value, "Bonds"),
                        _summaryItem(controller.qty.value, "Quanity"),
                        _summaryItem(controller.amt.value, "Total Amount"),
                        // _summaryItem("value", "key"),
                      ],
                    ),
                    verticalSpacing(vs2),
                    Text(
                      "My Assets",
                      style: header1,
                    ),
                    verticalSpacing(vs1),
                    ListView.builder(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return PortfolioCard(
                          portfolio: controller.list[index],
                          ontapFunction: () {
                            openBottomSheet(context, controller.list[index], index);
                          },
                        );
                      },
                      controller: controller.scroll,
                      itemCount: controller.list.length,
                    ),
                  ],
                ),
              ),
      ),
    );
  }

  Widget _summaryItem(String? value, String key) {
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
              value ?? "0",
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

  void openBottomSheet(BuildContext context, BondsDatum portfolio, int idx) {
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
                portfolio.companyName,
                style: header2.copyWith(fontWeight: FontWeight.bold),
              ),
              verticalSpacing(vs2 * 2),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Price : ${portfolio.ltp}",
                    style: header2.copyWith(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Qty : ${portfolio.quantity}",
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
                      controller.cartValue.value =
                          (double.parse(val) * double.parse(portfolio.ltp));
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
                buttonText: "Sell Bond",
                onPressedFunction: () {
                  controller.handleApiCall(idx);
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
}
