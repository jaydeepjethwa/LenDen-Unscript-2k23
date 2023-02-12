import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unscript/constant/color.dart';
import 'package:unscript/constant/size.dart';
import 'package:unscript/constant/textstyle.dart';
import 'package:unscript/controller/authenticate/kyc_controller.dart';
import 'package:unscript/presentation/widget/custom_form_field.dart';
import 'package:unscript/presentation/widget/custom_image_picker.dart';
import 'package:unscript/presentation/widget/custom_long_button.dart';
import 'package:unscript/presentation/widget/custom_textfield.dart';

class KYCScreen extends GetView<KYCController> {
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
          child: Form(
            key: controller.formKey,
            child: Column(
              children: [
                verticalSpacing(vs2),
                CustomTextField(
                  capitalization: false,
                  textController: controller.nameC,
                  hint: "Name",
                  validateFunction: (value) {
                    if (value == "" || value == null) {
                      return "Name cannot be empty";
                    }
                    return null;
                  },
                  onSaveFunction: (value) {
                    if (value != null) {
                      controller.name = value;
                    }
                  },
                ),
                CustomTextField(
                  capitalization: false,
                  textController: controller.phoneC,
                  keyboardType: TextInputType.phone,
                  hint: "Phone Number",
                  validateFunction: (value) {
                    if (value == "" || value == null) {
                      return "Phone cannot be empty";
                    }
                    return null;
                  },
                  onSaveFunction: (value) {
                    if (value != null) {
                      controller.phone = value;
                    }
                  },
                ),
                const CustomFormField(formFieldTitle: "Photo"),
                CustomImagePicker(
                  note: "Your Selfie",
                  icon: Icons.camera,
                  setImage: (value) {
                    print(value);
                    if (value != null) {
                      controller.profile = value;
                    }
                  },
                ),
                const CustomFormField(formFieldTitle: "Identity Proof"),
                CustomImagePicker(
                  note: "Pan Card / Aadhar Card",
                  icon: Icons.card_membership,
                  setImage: (value) {
                    if (value != null) {
                      controller.pan = value;
                    }
                  },
                ),
                const CustomFormField(formFieldTitle: "Bank Details"),
                CustomImagePicker(
                  note: "Cancel cheque / Passbook",
                  icon: Icons.add_card,
                  setImage: (value) {
                    if (value != null) {
                      controller.bank = value;
                    }
                  },
                ),
                const CustomFormField(formFieldTitle: "Address Proof"),
                CustomImagePicker(
                  note: "Electricity Bill / Passport",
                  icon: Icons.location_on,
                  setImage: (value) {
                    if (value != null) {
                      controller.address = value;
                    }
                  },
                ),
                CustomLongButton(
                  buttonText: "Complete KYC",
                  onPressedFunction: () {
                    controller.handleApiCall();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
