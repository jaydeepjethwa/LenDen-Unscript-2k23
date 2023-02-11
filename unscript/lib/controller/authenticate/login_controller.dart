import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:unscript/constant/constant.dart';
import 'package:unscript/service/base_client.dart';
import 'package:unscript/utils/dialog_helper.dart';

class LoginController extends GetxController {
  late TextEditingController emailC;
  String email = "";

  @override
  void onInit() {
    super.onInit();
    initializeController();
  }

  void initializeController() {
    emailC = TextEditingController();
  }

  Future<bool> apiCall() async {
    String url = "$baseUrl/auth/login";
    dynamic payload = {
      "email": email,
    };
    var response = await BaseClient().postRequestWithoutHeader(url, payload);
    if (response != null) {
      storage.write("userId", response["user_id"]);
      storage.write("kyc", response["kyc_completed"]);
      storage.write("token", response["access_token"]);
      storage.write("otp", response["otp"]);
      return true;
    }
    return false;
  }

  void handleApiCall() async {
    DialogHelper.showLoader("Processing");
    bool response = await apiCall();
  }

  void disposeController() {
    emailC.dispose();
  }

  @override
  void onClose() {
    super.onClose();
    disposeController();
  }
}
