import 'package:get/get.dart';
import 'package:unscript/constant/constant.dart';
import 'package:http/http.dart' as http;
import 'package:unscript/model/transaction_model.dart';
import 'package:unscript/service/base_client.dart';
import 'package:unscript/service/error_controller.dart';

class TransactionController extends GetxController with ErrorController {
  var transactionList = <TransactionModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    getAllTransactions();
  }

  Future getAllTransactions() async {
    String id = storage.read("userId").toString();
    String url = "$baseUrl/transactions/user/$id";
    http.Response response =
        await BaseClient().getRequest(url).catchError(handleError);
    transactionList.value = transactionModelFromJson(response.body);
  }
}
