import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:unscript/constant/color.dart';
import 'package:unscript/constant/textstyle.dart';
import 'package:unscript/utils/dialog_helper.dart';

class CustomImagePicker extends StatefulWidget {
  final String note;
  final IconData icon;
  const CustomImagePicker({super.key, required this.note, required this.icon});

  @override
  State<CustomImagePicker> createState() => _CustomImagePickerState();
}

class _CustomImagePickerState extends State<CustomImagePicker> {
  String? imagePath;

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image == null) return;
      setState(() => imagePath = image.path);
    } on PlatformException catch (_) {
      DialogHelper.showErrorDialog("LENDEN", "Some error occured.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: grey, width: 1.0),
          borderRadius: BorderRadius.circular(20.0)),
      margin: const EdgeInsets.only(bottom: 15.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Row(
          children: [
            SizedBox(
              width: 100.0,
              height: 100.0,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Icon(
                  widget.icon,
                  size: 50.0,
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      pickImage();
                    },
                    child: Text(
                      "Take Picture",
                      style: buttonStyle.copyWith(fontSize: 14.0),
                    ),
                  ),
                  Text(
                    widget.note,
                    style: normalText.copyWith(fontSize: 14.0),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 100.0,
              height: 100.0,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: imagePath == null
                    ? Container()
                    : Image(
                        image: FileImage(
                          File(imagePath!),
                        ),
                        fit: BoxFit.fill,
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
