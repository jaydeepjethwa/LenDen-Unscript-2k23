import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unscript/constant/color.dart';
import 'package:unscript/constant/size.dart';
import 'package:unscript/constant/textstyle.dart';
import 'package:unscript/controller/authenticate/key_screen_controller.dart';
import 'package:unscript/presentation/widget/custom_form_field.dart';
import 'package:unscript/presentation/widget/custom_image_picker.dart';
import 'package:unscript/presentation/widget/custom_long_button.dart';
import 'package:unscript/presentation/widget/custom_textfield.dart';

class KYCScreen extends GetView<KeyscreenController> {
  const KYCScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        leading: Icon(
          Icons.arrow_back,
          color: blue,
        ),
        title: Row(
          children: [
            const Image(
              image: AssetImage("assets/logo_1.png"),
              width: 40.0,
            ),
            horizontalSpacing(5.0),
            Text(
              "KYC Details",
              style: normalText.copyWith(
                color: blue,
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
          ],
        ),
        elevation: 0.7,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
          child: Column(
            children: [
              verticalSpacing(vs2),
              CustomTextField(
                capitalization: false,
                textController: controller.nameC,
                hint: "Name",
                validateFunction: (value) {},
                onSaveFunction: (value) {},
              ),
              CustomTextField(
                capitalization: false,
                textController: controller.phoneC,
                keyboardType: TextInputType.phone,
                hint: "Phone Number",
                validateFunction: (value) {},
                onSaveFunction: (value) {},
              ),
              const CustomFormField(formFieldTitle: "Photo"),
              const CustomImagePicker(
                note: "Your Selfie",
                icon: Icons.camera,
              ),
              const CustomFormField(formFieldTitle: "Identity Proof"),
              const CustomImagePicker(
                note: "Pan Card / Aadhar Card",
                icon: Icons.card_membership,
              ),
              const CustomFormField(formFieldTitle: "Bank Details"),
              const CustomImagePicker(
                note: "Cancel cheque / Passbook",
                icon: Icons.add_card,
              ),
              const CustomFormField(formFieldTitle: "Address Proof"),
              const CustomImagePicker(
                note: "Electricity Bill / Passport",
                icon: Icons.location_on,
              ),
              CustomLongButton(
                buttonText: "Complete KYC",
                onPressedFunction: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
