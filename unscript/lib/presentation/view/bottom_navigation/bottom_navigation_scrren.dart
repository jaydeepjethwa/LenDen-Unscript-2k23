import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unscript/constant/color.dart';
import 'package:unscript/constant/size.dart';
import 'package:unscript/controller/bottom_navigation/bottom_navigation_controller.dart';

class BottomNavigationScreen extends GetView<BottomNavigationController> {
  const BottomNavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        title: Row(
          children: [
            const Image(
              image: AssetImage("assets/logo_1.png"),
              width: 40.0,
            ),
            horizontalSpacing(5.0),
            const Image(
              image: AssetImage("assets/name.png"),
              width: 85.0,
            ),
          ],
        ),
        elevation: 0.7,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Icon(
              Icons.notifications_none_rounded,
              size: 28.0,
              color: blue,
            ),
          ),
          GestureDetector(
            onTap: () {
              Get.toNamed("/wallet");
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Icon(
                Icons.account_balance_wallet_rounded,
                size: 28.0,
                color: blue,
              ),
            ),
          ),
        ],
      ),
      body: Obx(
        () => controller.screenList[controller.currentIndex.value],
      ),
      extendBody: true,
      bottomNavigationBar: Obx(
        () => Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(25),
              topLeft: Radius.circular(25),
            ),
            boxShadow: [
              BoxShadow(
                color: blue,
                spreadRadius: 0,
                blurRadius: 1,
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(25),
              topLeft: Radius.circular(25),
            ),
            child: BottomNavigationBar(
              backgroundColor: white,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: blue,
              unselectedItemColor: grey,
              showUnselectedLabels: false,
              showSelectedLabels: false,
              onTap: (value) {
                controller.handleNavigation(value);
              },
              currentIndex: controller.currentIndex.value,
              items: const [
                BottomNavigationBarItem(
                  label: "Home",
                  icon: Icon(
                    Icons.home_outlined,
                    size: 32.0,
                  ),
                ),
                BottomNavigationBarItem(
                  label: "Bond",
                  icon: Icon(
                    Icons.search,
                    size: 32.0,
                  ),
                ),
                BottomNavigationBarItem(
                  label: "Portfolio",
                  icon: Icon(
                    Icons.shopping_bag_rounded,
                    size: 32.0,
                  ),
                ),
                BottomNavigationBarItem(
                  label: "Profile",
                  icon: Icon(
                    Icons.person_outline_outlined,
                    size: 32.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
