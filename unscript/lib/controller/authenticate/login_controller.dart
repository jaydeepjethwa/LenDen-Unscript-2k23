import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:unscript/constant/constant.dart';
import 'package:unscript/service/base_client.dart';
import 'package:unscript/service/error_controller.dart';
import 'package:unscript/utils/dialog_helper.dart';

class LoginController extends GetxController with ErrorController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
    dynamic header = {
      "Content-type": "application/json",
    };
    dynamic payload = json.encode(
      {
        "email": email,
      },
    );
    var response = await BaseClient()
        .postRequest(url, payload, header)
        .catchError(handleError);
    if (response != null) {
      var jsonResponse = json.decode(response.body);
      storage.write("userId", jsonResponse["user_id"]);
      storage.write("token", jsonResponse["access_token"]);
      storage.write("otp", jsonResponse["otp"]);
      return true;
    }
    return false;
  }

  void handleApiCall() async {
    if (formKey.currentState!.validate()) {
      DialogHelper.showLoader("Processing");
      formKey.currentState!.save();
      bool response = await apiCall();
      if (response) {
        Get.toNamed(
          "/otp",
          arguments: [
            {"email": email},
          ],
        );
      } else {
        Get.back();
      }
    }
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
