import 'dart:convert';

import 'package:get/get.dart';
import 'package:unscript/constant/constant.dart';
import 'package:unscript/model/bond_model.dart';
import 'package:http/http.dart' as http;
import 'package:unscript/service/base_client.dart';
import 'package:unscript/service/error_controller.dart';

class HomeController extends GetxController with ErrorController {
  var latestList = <BondModel>[].obs;
  var featurList = <BondModel>[].obs;
  var name = "";
  var isKyc = false.obs;

  @override
  void onInit() {
    super.onInit();
    getLatestBond();
    getFeatureBond();
    checeekKYCStatus();
  }

  Future checeekKYCStatus() async {
    String userId = storage.read("userId").toString();
    String url = "$baseUrl/user/kyc-status/$userId";
    http.Response response =
        await BaseClient().getRequest(url).catchError(handleError);
    var jsonResponse = json.decode(response.body);
    if (jsonResponse["kyc_completed"] == 1) {
      name = jsonResponse["name"];
      storage.write("kyc", true);
      isKyc.value = true;
    }
  }

  Future getLatestBond() async {
    String url = "$baseUrl/bond/latest";
    http.Response response =
        await BaseClient().getRequest(url).catchError(handleError);
    latestList.value = bondModelFromJson(response.body);
  }

  Future getFeatureBond() async {
    String url = "$baseUrl/bond/featured";
    http.Response response =
        await BaseClient().getRequest(url).catchError(handleError);
    featurList.value = bondModelFromJson(response.body);
  }
}
