import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unscript/constant/size.dart';
import 'package:unscript/constant/textstyle.dart';
import 'package:unscript/controller/authenticate/login_controller.dart';
import 'package:unscript/presentation/widget/custom_form_field.dart';
import 'package:unscript/presentation/widget/custom_long_button.dart';
import 'package:unscript/presentation/widget/custom_textfield.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: controller.formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Image(
                image: AssetImage("assets/logo.png"),
                width: 200.0,
                height: 200.0,
              ),
              verticalSpacing(vs1),
              verticalSpacing(vs1 * 2),
              CustomTextField(
                capitalization: false,
                keyboardType: TextInputType.emailAddress,
                textController: controller.emailC,
                hint: "Email Id",
                validateFunction: (value) {
                  if (value == "" ||
                      value == null ||
                      !GetUtils.isEmail(value)) {
                    return "Please Enter a valid Value";
                  }
                  return null;
                },
                onSaveFunction: (value) {
                  if (value != null) {
                    controller.email = value;
                  }
                },
              ),
              verticalSpacing(vs1),
              CustomLongButton(
                buttonText: "Login",
                onPressedFunction: () {
                  controller.handleApiCall();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
