import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unscript/controller/bond/bond_controller.dart';
import 'package:unscript/presentation/view/dashboard/bond/bond_screen.dart';
import 'package:unscript/presentation/view/dashboard/home/home_screen.dart';
import 'package:unscript/presentation/view/dashboard/profile/profile_scren.dart';

class BottomNavigationController extends GetxController {
  var currentIndex = 0.obs;

  List<Widget> screenList = [
    const HomeScreen(),
    BondScreen(
      controller: Get.put(BondController()),
    ),
    const ProfileScreen(),
  ];

  void handleNavigation(int index) {
    currentIndex.value = index;
  }
}
