import 'package:get_storage/get_storage.dart';

String baseUrl = "http://192.168.2.37:8000";
final GetStorage storage = GetStorage();

  String formatDate(DateTime d) {
    String ans = "";
    (d.day <= 9) ? ans = "${ans}0${d.day}" : ans += d.day.toString();
    ans += "-";
    (d.month <= 9) ? ans = "${ans}0${d.month}" : ans += d.month.toString();
    ans += "-";
    ans += d.year.toString();
    return ans;
  }