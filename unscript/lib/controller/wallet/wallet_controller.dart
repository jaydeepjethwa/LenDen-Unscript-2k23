import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:unscript/constant/constant.dart';
import 'package:unscript/service/base_client.dart';
import 'package:unscript/service/error_controller.dart';
import 'package:unscript/utils/dialog_helper.dart';

class WalletController extends GetxController with ErrorController {
  late TextEditingController moneyC;
  var money = "";
  var balance = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    initializeController();
    getBalance();
  }

  void initializeController() {
    moneyC = TextEditingController();
  }

  void disposeController() {
    moneyC.dispose();
  }

  Future getBalance() async {
    String id = storage.read("userId").toString();
    String url = "$baseUrl/user/wallet-balance/$id";
    http.Response response =
        await BaseClient().getRequest(url).catchError(handleError);
    var jsonResponse = json.decode(response.body);
    balance.value = jsonResponse["balance"];
  }

  Future apiCall() async {
    String id = storage.read("userId").toString();
    String url = "$baseUrl/user/deposit-money";
    dynamic payload = json.encode(
      {
        "user_id": id,
        "amount": moneyC.value.text,
      },
    );
    dynamic header = {
      "Content-type": "application/json",
    };
    var response = await BaseClient()
        .postRequest(url, payload, header)
        .catchError(handleError);
    if (response != null) {
      var jsonResponse = json.decode(response.body);
      return true;
    }
    return false;
  }

  void handleApiCall() async {
    if (moneyC.value.text != "") {
      DialogHelper.showLoader("Adding Money, do not press back.");
      bool response = await apiCall();
      if (response) {
        await getBalance();
        Get.back();
      } else {
        Get.back();
        DialogHelper.showSnackbar("Could not add money.");
      }
    }else{
      DialogHelper.showSnackbar("Check the amount entered.");
    }
  }

  @override
  void onClose() {
    super.onClose();
    disposeController();
  }
}
