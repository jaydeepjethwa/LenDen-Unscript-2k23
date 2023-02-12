import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:unscript/constant/constant.dart';
import 'package:unscript/controller/bond/bond_controller.dart';
import 'package:unscript/model/bond_model.dart';
import 'package:unscript/service/base_client.dart';
import 'package:unscript/service/error_controller.dart';
import 'package:http/http.dart' as http;
import 'package:unscript/utils/dialog_helper.dart';

class BondPurchaseController extends GetxController with ErrorController {
  BondModel bond = Get.arguments[0]["bond"];
  late TextEditingController qtyC;
  late TextEditingController qtyWB, priceWB;

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
    qtyWB = TextEditingController();
    priceWB = TextEditingController();
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
      Get.back();
      Get.back();
      Get.put(BondController()).getAllBonds();
    }
  }

  void autoAPICall() async {
    DialogHelper.showLoader("Processing");
    int userId = storage.read("userId");
    String url = "$baseUrl/waitlist/join";
    dynamic payload = json.encode(
      {
        "bond_id": bond.bondId,
        "quantity": qtyWB.value.text,
        "price": priceWB.value.text,
        "user_id": userId,
      },
    );
    dynamic header = {
      "Content-type": "application/json",
    };
    http.Response response = await BaseClient()
        .postRequest(url, payload, header)
        .catchError(handleError);
    Get.back();
    Get.back();
    DialogHelper.showSnackbar("Succesfully added to wishlist");
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
