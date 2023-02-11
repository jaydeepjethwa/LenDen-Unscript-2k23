import 'package:get/get.dart';
import 'package:unscript/controller/authenticate/key_screen_controller.dart';
import 'package:unscript/controller/authenticate/login_controller.dart';
import 'package:unscript/controller/authenticate/otp_controller.dart';
import 'package:unscript/controller/bond/bond_controller.dart';
import 'package:unscript/controller/bottom_navigation/bottom_navigation_controller.dart';

class InitializeController {
  static Future<void> init() async {
    Get.lazyPut(() => LoginController(), fenix: true);
    Get.lazyPut(() => OtpController(), fenix: true);
    Get.lazyPut(() => BottomNavigationController(), fenix: true);
    Get.lazyPut(() => BondController(), fenix: true);
    Get.lazyPut(() => KeyscreenController(), fenix: true);
  }
}
