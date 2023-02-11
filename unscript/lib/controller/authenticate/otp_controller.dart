import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class OtpController extends GetxController {
  late TextEditingController otpC1, otpC2, otpC3, otpC4;

  @override
  void onInit() {
    super.onInit();
    initializeController();
  }

  void initializeController() {
    otpC1 = TextEditingController();
    otpC2 = TextEditingController();
    otpC3 = TextEditingController();
    otpC4 = TextEditingController();
  }

  void disposeController() {
    otpC1.dispose();
    otpC2.dispose();
    otpC3.dispose();
    otpC4.dispose();
  }

  @override
  void onClose() {
    super.onClose();
    disposeController();
  }
}
