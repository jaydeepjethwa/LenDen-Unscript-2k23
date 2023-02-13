import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:unscript/constant/constant.dart';
import 'package:unscript/utils/dialog_helper.dart';

class OtpController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController otpC1, otpC2, otpC3, otpC4;
  late String email;

  @override
  void onInit() {
    super.onInit();
    initializeController();
    email = Get.arguments[0]["email"];
    storage.remove("email");
  }

  void initializeController() {
    otpC1 = TextEditingController();
    otpC2 = TextEditingController();
    otpC3 = TextEditingController();
    otpC4 = TextEditingController();
  }

  bool validate() {
    if (otpC1.value.text == "" ||
        otpC1.value.text == "" ||
        otpC1.value.text == "" ||
        otpC1.value.text == "") {
      return false;
    }
    return true;
  }

  void handleVerification() {
    if (validate()) {
      DialogHelper.showLoader("Processing");
      String otp = storage.read("otp");
      String enteredOtp =
          "${otpC1.value.text}${otpC2.value.text}${otpC3.value.text}${otpC4.value.text}";
      if (otp == enteredOtp) {
        storage.remove("otp");
        Get.offAllNamed("/bottomNavigation");
      } else {
        Get.back();
        DialogHelper.showSnackbar("Incorrect OTP");
      }
    } else {
      DialogHelper.showSnackbar("Incomplete OTP");
    }
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
