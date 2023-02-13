import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:unscript/constant/constant.dart';
import 'package:unscript/controller/bond/bond_controller.dart';
import 'package:unscript/model/portfolio_model.dart';
import 'package:http/http.dart' as http;
import 'package:unscript/service/base_client.dart';
import 'package:unscript/service/error_controller.dart';
import 'package:unscript/utils/dialog_helper.dart';

class PortfolioController extends GetxController with ErrorController {
  late PortfolioModel object;
  late ScrollController scroll;
  late TextEditingController qtyC;

  var list = <BondsDatum>[].obs;
  var bonds = "".obs;
  var qty = "".obs;
  var amt = "".obs;
  var cartValue = 0.0.obs;
  var balance = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    qtyC = TextEditingController();
    scroll = ScrollController();
    getAllData();
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

  Future getAllData() async {
    String userId = storage.read("userId").toString();
    String url = "$baseUrl/portfolio/$userId";
    http.Response response =
        await BaseClient().getRequest(url).catchError(handleError);
    object = portfolioModelFromJson(response.body);
    bonds.value = object.stats.noBonds.toString();
    qty.value = object.stats.totalQuantity.toString();
    amt.value = object.stats.totalAmount.toString();
    list.value = object.bondsData;
  }

  Future apiCall(int idx) async {
    String userId = storage.read("userId").toString();
    String url = "$baseUrl/transactions/create";
    dynamic payload = json.encode(
      {
        "bond_id": list[idx].bondId,
        "quantity": qtyC.value.text,
        "transaction_price": list[idx].ltp,
        "user_id": userId,
        "type": "SELL",
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

  void handleApiCall(int idx) async {
    DialogHelper.showLoader("Processing");
    if (qtyC.value.text == "") {
      Get.back();
      DialogHelper.showSnackbar("Enter valid quantity.");
    } else if (double.parse(qtyC.value.text) > list[idx].quantity) {
      Get.back();
      DialogHelper.showSnackbar("You don't have enough quantity.");
    } else {
      await apiCall(idx);
      Get.back();
      Get.back();
      Get.back();
      getAllData();
      Get.put(BondController()).getAllBonds();
    }
  }
}
