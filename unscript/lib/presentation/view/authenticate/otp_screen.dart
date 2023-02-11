import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:unscript/constant/color.dart';
import 'package:unscript/constant/size.dart';
import 'package:unscript/constant/textstyle.dart';
import 'package:unscript/controller/authenticate/otp_controller.dart';
import 'package:unscript/presentation/widget/custom_long_button.dart';

class OTPScreen extends GetView<OtpController> {
  const OTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            size: 28.0,
            color: blue,
          ),
          onPressed: () => Get.back(),
        ),
        title: Text(
          "OTP",
          style: header2,
        ),
        backgroundColor: white,
        elevation: 0,
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 40.0),
        width: getWidth(context),
        height: getHeight(context),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Verify Email",
              textAlign: TextAlign.start,
              style: header1,
            ),
            verticalSpacing(vs1),
            RichText(
              text:
                  TextSpan(text: "Code sent to ", style: paraStyle, children: [
                TextSpan(
                  text: "abhishek@gmail.com",
                  style: paraStyle.copyWith(color: blue),
                ),
              ]),
            ),
            verticalSpacing(vs2),
            Form(
              key: controller.formKey,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 50,
                    width: 50,
                    child: TextField(
                      controller: controller.otpC1,
                      onChanged: (value) {
                        if (value.length == 1) {
                          FocusScope.of(context).nextFocus();
                        }
                      },
                      style: Theme.of(context).textTheme.headline6,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    width: 50,
                    child: TextField(
                      controller: controller.otpC2,
                      onChanged: (value) {
                        if (value.length == 1) {
                          FocusScope.of(context).nextFocus();
                        }
                      },
                      style: Theme.of(context).textTheme.headline6,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    width: 50,
                    child: TextField(
                      controller: controller.otpC3,
                      onChanged: (value) {
                        if (value.length == 1) {
                          FocusScope.of(context).nextFocus();
                        }
                      },
                      style: Theme.of(context).textTheme.headline6,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    width: 50,
                    child: TextField(
                      controller: controller.otpC4,
                      onChanged: (value) {
                        if (value.length == 1) {
                          FocusScope.of(context).nextFocus();
                        }
                      },
                      style: Theme.of(context).textTheme.headline6,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                    ),
                  ),
                ],
              ),
            ),
            verticalSpacing(vs1),
            RichText(
              text: TextSpan(
                  text: "Didn't recieved code? ",
                  style: paraStyle,
                  children: [
                    TextSpan(
                      text: "Resend Code",
                      style: paraStyle.copyWith(color: blue),
                    ),
                  ]),
            ),
            verticalSpacing(vs2),
            CustomLongButton(
              buttonText: "Verify",
              onPressedFunction: () {
                // Get.offAllNamed("/bottomNavigation");
                controller.handleVerification();
              },
            ),
          ],
        ),
      ),
    );
  }
}
