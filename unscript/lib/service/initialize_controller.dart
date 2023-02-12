import 'package:get/get.dart';
import 'package:unscript/controller/authenticate/kyc_controller.dart';
import 'package:unscript/controller/authenticate/login_controller.dart';
import 'package:unscript/controller/authenticate/otp_controller.dart';
import 'package:unscript/controller/bond/bond_controller.dart';
import 'package:unscript/controller/bond/bond_purchase_controller.dart';
import 'package:unscript/controller/bottom_navigation/bottom_navigation_controller.dart';
import 'package:unscript/controller/home/home_controller.dart';
import 'package:unscript/controller/portfolio/portfolio_controller.dart';
import 'package:unscript/controller/transaction/transaction_controller.dart';
import 'package:unscript/controller/waitlist/waitlist_controller.dart';
import 'package:unscript/controller/wallet/wallet_controller.dart';

class InitializeController {
  static Future<void> init() async {
    Get.lazyPut(() => LoginController(), fenix: true);
    Get.lazyPut(() => OtpController(), fenix: true);
    Get.lazyPut(() => BottomNavigationController(), fenix: true);
    Get.lazyPut(() => HomeController(), fenix: true);
    Get.lazyPut(() => BondController(), fenix: true);
    Get.lazyPut(() => KYCController(), fenix: true);
    Get.lazyPut(() => BondPurchaseController(), fenix: true);
    Get.lazyPut(() => WalletController(), fenix: true);
    Get.lazyPut(() => TransactionController(), fenix: true);
    Get.lazyPut(() => PortfolioController(), fenix: true);
    Get.lazyPut(() => WaitlistController(), fenix: true);
  }
}
