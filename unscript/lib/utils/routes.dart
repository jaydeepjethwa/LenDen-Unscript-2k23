import 'package:get/get.dart';
import 'package:unscript/presentation/view/authenticate/kyc_screen.dart';
import 'package:unscript/presentation/view/authenticate/login_screen.dart';
import 'package:unscript/presentation/view/authenticate/otp_screen.dart';
import 'package:unscript/presentation/view/bottom_navigation/bottom_navigation_scrren.dart';
import 'package:unscript/presentation/view/dashboard/bond/bond_purchase_screen.dart';
import 'package:unscript/presentation/view/dashboard/profile/profile_info_screen.dart';
import 'package:unscript/presentation/view/splash/splash_screen.dart';
import 'package:unscript/presentation/view/transaction/transaction_screen.dart';
import 'package:unscript/presentation/view/wallet/wallet_screen.dart';

List<GetPage> routesList = [
  GetPage(
    name: "/login",
    page: () => const LoginScreen(),
    transitionDuration: const Duration(milliseconds: 500),
    transition: Transition.rightToLeftWithFade,
  ),
  GetPage(
    name: "/otp",
    page: () => const OTPScreen(),
    transitionDuration: const Duration(milliseconds: 500),
    transition: Transition.rightToLeftWithFade,
  ),
  GetPage(
    name: "/bottomNavigation",
    page: () => const BottomNavigationScreen(),
    transitionDuration: const Duration(milliseconds: 500),
    transition: Transition.rightToLeftWithFade,
  ),
  GetPage(
    name: "/kyc",
    page: () => const KYCScreen(),
    transitionDuration: const Duration(milliseconds: 500),
    transition: Transition.rightToLeftWithFade,
  ),
  GetPage(
    name: "/bondPurchase",
    page: () => const BondPurchaseScreen(),
    transitionDuration: const Duration(milliseconds: 500),
    transition: Transition.rightToLeftWithFade,
  ),
  GetPage(
    name: "/splash",
    page: () => const SplashScreen(),
    transitionDuration: const Duration(milliseconds: 500),
    transition: Transition.rightToLeftWithFade,
  ),
  GetPage(
    name: "/wallet",
    page: () => const WalletScreen(),
    transitionDuration: const Duration(milliseconds: 500),
    transition: Transition.rightToLeftWithFade,
  ),
    GetPage(
    name: "/transaction",
    page: () => const TransactionScreen(),
    transitionDuration: const Duration(milliseconds: 500),
    transition: Transition.rightToLeftWithFade,
  ),
      GetPage(
    name: "/profileInfo",
    page: () => const ProfileInfoScreen(),
    transitionDuration: const Duration(milliseconds: 500),
    transition: Transition.rightToLeftWithFade,
  ),
];
