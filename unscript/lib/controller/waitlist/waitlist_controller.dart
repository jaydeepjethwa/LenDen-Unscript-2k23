import 'package:get/get.dart';
import 'package:unscript/constant/constant.dart';
import 'package:unscript/model/waitlist_model.dart';
import 'package:unscript/service/base_client.dart';
import 'package:http/http.dart' as http;
import 'package:unscript/service/error_controller.dart';

class WaitlistController extends GetxController with ErrorController {
  var list = <WaitlistModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    getAllWaitlist();
  }

  Future getAllWaitlist() async {
    String id = storage.read("userId").toString();
    String url = "$baseUrl/waitlist/$id";
    http.Response response =
        await BaseClient().getRequest(url).catchError(handleError);
    print(response.body);
    list.value = waitlistModelFromJson(response.body);
  }
}
