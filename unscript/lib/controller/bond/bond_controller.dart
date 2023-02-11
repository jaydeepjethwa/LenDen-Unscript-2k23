import 'package:get/get.dart';
import 'package:unscript/service/base_client.dart';
import 'package:unscript/service/error_controller.dart';

class BondController extends GetxController with ErrorController{
  @override
  void onInit() {
    super.onInit();
    getAllBonds();
  }

  Future getAllBonds() async {
    String url =
        "https://www.nseindia.com/api/liveBonds-traded-on-cm?type=bonds";
    var response = await BaseClient().getRequest(url).catchError(handleError);
    print(response);
  }
}
