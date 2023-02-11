import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class KeyscreenController extends GetxController {
  late TextEditingController nameC, phoneC;
  String name = "", phone = "";

  @override
  void onInit() {
    super.onInit();
    initializeController();
  }

  void initializeController() {
    nameC = TextEditingController();
    phoneC = TextEditingController();
  }

  void disposeController() {
    nameC.dispose();
    phoneC.dispose();
  }

  @override
  void onClose() {
    super.onClose();
    disposeController();
  }
}
