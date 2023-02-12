import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unscript/constant/color.dart';
import 'package:unscript/constant/constant.dart';
import 'package:unscript/constant/size.dart';
import 'package:unscript/constant/textstyle.dart';
import 'package:unscript/controller/home/home_controller.dart';
import 'package:unscript/service/base_client.dart';
import 'package:unscript/utils/dialog_helper.dart';
import 'package:http/http.dart' as http;

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  void logout() {
    DialogHelper.showLoader("Logging Out");
    storage.remove("token");
    storage.remove("userId");
    storage.remove("kyc");
    Get.offAllNamed("/login");
  }

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
                  Get.toNamed("/profileInfo");
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
                  Get.toNamed("/waitList");
                },
              ),
              _profileItem(
                "History",
                Icons.history,
                () {
                  Get.toNamed("/transaction");
                },
              ),
              _profileItem(
                "Logout",
                Icons.logout,
                () {
                  logout();
                },
              ),
              _profileItem(
                "Check KYC Status",
                Icons.start,
                () async {
                  DialogHelper.showLoader("Checking KYC Status");
                  String userId = storage.read("userId").toString();
                  String url = "$baseUrl/user/kyc-status/$userId";
                  http.Response response = await BaseClient().getRequest(url);
                  var jsonResponse = json.decode(response.body);
                  if (jsonResponse["kyc_completed"] == 1) {
                    storage.write("kyc", true);
                    Get.back();
                    Get.find<HomeController>().name = jsonResponse["name"];
                    Get.find<HomeController>().isKyc.value = true;
                    DialogHelper.showSnackbar("KYC is Successful.");
                  } else {
                    storage.write("kyc", false);
                    Get.find<HomeController>().name = "";
                    Get.find<HomeController>().isKyc.value = false;
                    Get.back();
                    DialogHelper.showSnackbar("KYC is Pending.");
                  }
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
