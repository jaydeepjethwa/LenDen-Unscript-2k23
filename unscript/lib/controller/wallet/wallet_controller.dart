import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class WalletController extends GetxController {
  late TextEditingController moneyC;
  var money = "";

  @override
  void onInit() {
    super.onInit();
    initializeController();
  }

  void initializeController() {
    moneyC = TextEditingController();
  }

  void disposeController() {
    moneyC.dispose();
  }

  @override
  void onClose() {
    super.onClose();
    disposeController();
  }
}
