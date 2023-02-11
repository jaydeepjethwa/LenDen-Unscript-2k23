import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unscript/constant/color.dart';
import 'package:unscript/constant/size.dart';
import 'package:unscript/constant/textstyle.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
          child: Column(
            children: [
              verticalSpacing(vs2),
              const Image(
                image: AssetImage("assets/logo.png"),
                width: 150.0,
              ),
              verticalSpacing(vs2),
              _profileItem(
                "Profile",
                Icons.person,
                () {
                  Get.toNamed("/kyc");
                },
              ),
              _profileItem(
                "KYC",
                Icons.check_circle,
                () {
                  Get.toNamed("/kyc");
                },
              ),
              _profileItem(
                "Wishlist",
                Icons.bookmark,
                () {
                  Get.toNamed("/kyc");
                },
              ),
              _profileItem(
                "Histroy",
                Icons.history,
                () {
                  Get.toNamed("/kyc");
                },
              ),
              _profileItem(
                "Logout",
                Icons.logout,
                () {
                  Get.toNamed("/kyc");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _profileItem(String itemName, IconData icon, VoidCallback handletap) {
    return GestureDetector(
      onTap: handletap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: blue, width: 2.0),
          borderRadius: BorderRadius.circular(15.0),
        ),
        margin: const EdgeInsets.only(bottom: 10.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 32.0,
              ),
              horizontalSpacing(5.0),
              Expanded(
                child: Text(
                  itemName,
                  style: paraStyle.copyWith(fontWeight: FontWeight.w600),
                ),
              ),
              const Icon(
                Icons.arrow_forward,
              )
            ],
          ),
        ),
      ),
    );
  }
}
