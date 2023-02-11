import 'package:flutter/material.dart';
import 'package:unscript/constant/size.dart';
import 'package:unscript/constant/textstyle.dart';

class CustomLongButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressedFunction;
  const CustomLongButton(
      {super.key, required this.buttonText, required this.onPressedFunction});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getWidth(context) - 40,
      height: 45.0,
      child: ElevatedButton(
        onPressed: onPressedFunction,
        child: Text(
          buttonText,
          style: buttonStyle,
        ),
      ),
    );
  }
}
