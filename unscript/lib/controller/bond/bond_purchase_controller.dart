import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:unscript/constant/constant.dart';
import 'package:unscript/model/bond_model.dart';
import 'package:unscript/service/base_client.dart';
import 'package:unscript/service/error_controller.dart';
import 'package:http/http.dart' as http;
import 'package:unscript/utils/dialog_helper.dart';

class BondPurchaseController extends GetxController with ErrorController {
  BondModel bond = Get.arguments[0]["bond"];
  late TextEditingController qtyC;

  var cartValue = 0.0.obs;
  var balance = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    initializeController();
    getBalance();
  }

  Future getBalance() async {
    String id = storage.read("userId").toString();
    String url = "$baseUrl/user/wallet-balance/$id";
    http.Response response =
        await BaseClient().getRequest(url).catchError(handleError);
    var jsonResponse = json.decode(response.body);
    balance.value = jsonResponse["balance"];
  }

  void initializeController() {
    qtyC = TextEditingController();
  }

  Future apiCall() async {
    String userId = storage.read("userId").toString();
    String url = "$baseUrl/transactions/create";
    dynamic payload = json.encode(
      {
        "bond_id": bond.bondId,
        "quantity": qtyC.value.text,
        "transaction_price": bond.ltp,
        "user_id": userId,
        "type": "BUY",
      },
    );
    dynamic header = {
      "Content-type": "application/json",
    };
    http.Response response = await BaseClient()
        .postRequest(url, payload, header)
        .catchError(handleError);
    print(response.body);
  }

  void handleApiCall() async {
    DialogHelper.showLoader("Processing");
    if (qtyC.value.text == "") {
      Get.back();
      DialogHelper.showSnackbar("Enter valid quantity.");
    } else if (bond.qty == 0) {
      Get.back();
      DialogHelper.showSnackbar("You cannot buy it right now.");
    } else if (cartValue.value > balance.value) {
      Get.back();
      DialogHelper.showSnackbar("You don't have enough balance.");
    } else {
      await apiCall();
      Get.back();
    }
  }

  void disposeController() {
    qtyC.dispose();
  }

  @override
  void onClose() {
    super.onClose();
    disposeController();
  }
}
