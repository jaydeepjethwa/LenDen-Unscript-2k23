import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unscript/constant/color.dart';
import 'package:unscript/constant/size.dart';
import 'package:unscript/controller/home/home_controller.dart';
import 'package:unscript/presentation/widget/custom_bond_card.dart';
import 'package:unscript/presentation/widget/custom_hi_card.dart';
import 'package:unscript/presentation/widget/custom_kyc_alert.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getHeight(context),
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: ListView(
        children: [
          verticalSpacing(vs1),
          Obx(
            () => controller.isKyc.value
                ? CustomhiCard(name: controller.name)
                : const CustomKYCAlert(),
          ),
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
          Obx(
            () => SizedBox(
              width: getWidth(context),
              height: 184,
              child: ListView.builder(
                itemCount: controller.featurList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: ((context, index) {
                  return CustomBondCard(
                    bond: controller.featurList[index],
                  );
                }),
              ),
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
          Obx(
            () => SizedBox(
              width: getWidth(context),
              height: 184,
              child: ListView.builder(
                itemCount: controller.latestList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: ((context, index) {
                  return CustomBondCard(
                    bond: controller.latestList[index],
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
