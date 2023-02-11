import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unscript/constant/color.dart';
import 'package:unscript/constant/size.dart';
import 'package:unscript/constant/textstyle.dart';
import 'package:unscript/presentation/widget/custom_long_button.dart';

class CustomKYCAlert extends StatelessWidget {
  const CustomKYCAlert({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: lightRed,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Icon(
                  Icons.dangerous,
                  size: 32.0,
                  color: red,
                ),
                Text(
                  "Complete KYC to start Investment",
                  style: paraStyle.copyWith(color: red),
                ),
              ],
            ),
            ElevatedButton(
              child: const Text("Complete KYC"),
              onPressed: () {
                Get.toNamed("/kyc");
              },
            ),
          ],
        ),
      ),
    );
  }
}
