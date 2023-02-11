import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:unscript/constant/constant.dart';
import 'package:http/http.dart' as http;
import 'package:unscript/utils/dialog_helper.dart';

class KYCController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController nameC, phoneC;
  String name = "", phone = "";
  String profile = "", pan = "", address = "", bank = "";

  @override
  void onInit() {
    super.onInit();
    initializeController();
  }

  void initializeController() {
    nameC = TextEditingController();
    phoneC = TextEditingController();
  }

  Future<bool> apiCall() async {
    print(profile);
    String url = "$baseUrl/user/complete-kyc";
    String token = storage.read("token");
    int user_id = storage.read("userId");
    var request = http.MultipartRequest(
      'POST',
      Uri.parse(url),
    );
    request.headers.addAll(
      {"Authorization": "Bearer $token"},
    );
    request.files.add(
      await http.MultipartFile.fromPath("profile_photo", profile),
    );
    request.files.add(
      await http.MultipartFile.fromPath("pan_card", pan),
    );
    request.files.add(
      await http.MultipartFile.fromPath("bank_detail", bank),
    );
    request.files.add(
      await http.MultipartFile.fromPath("address_proof", address),
    );
    request.fields["user_id"] = user_id.toString();
    request.fields["name"] = name;
    request.fields["contact_no"] = phone;

    var streamResult = await request.send();
    var response = await http.Response.fromStream(streamResult);
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  void handleApiCall() async {
    if (formKey.currentState!.validate()) {
      DialogHelper.showLoader("Processing");
      formKey.currentState!.save();
      bool response = await apiCall();
      if (response) {
        Get.back();
        DialogHelper.showSnackbar("KYC Updated Successfully");
        Get.back();
      } else {
        print("Error");
        Get.back();
        DialogHelper.showSnackbar("Sorry, Please Enter valid Credentials.");
      }
    }
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
