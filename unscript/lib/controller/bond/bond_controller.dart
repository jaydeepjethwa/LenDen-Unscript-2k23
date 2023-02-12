import 'package:get/get.dart';
import 'package:unscript/constant/constant.dart';
import 'package:unscript/model/bond_model.dart';
import 'package:unscript/service/base_client.dart';
import 'package:unscript/service/error_controller.dart';
import 'package:http/http.dart' as http;

class BondController extends GetxController with ErrorController {
  var isLoading = true.obs;
  var bondList = <BondModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    getAllBonds();
  }

  Future getAllBonds() async {
    String url = "$baseUrl/bond/all";
    http.Response response =
        await BaseClient().getRequest(url).catchError(handleError);
    bondList.value = bondModelFromJson(response.body);
    isLoading.value = false;
  }
}
