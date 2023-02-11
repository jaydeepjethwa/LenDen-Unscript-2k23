import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unscript/constant/color.dart';
import 'package:unscript/constant/constant.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        Future.delayed(
          const Duration(milliseconds: 1000),
          () {
            String? loginStatus = storage.read("token");
            if ((loginStatus == null)) {
              Get.offAllNamed("/login");
            } else {
              Get.offAllNamed("/bottomNavigation");
            }
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(
              image: const AssetImage(
                "assets/logo.png",
              ),
              width: MediaQuery.of(context).size.width / 4,
            ),
            const SizedBox(height: 50.0),
            CircularProgressIndicator(
              color: blue,
            ),
          ],
        ),
      ),
    );
  }
}
