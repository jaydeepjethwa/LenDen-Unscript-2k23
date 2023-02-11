import 'package:flutter/material.dart';
import 'package:unscript/constant/color.dart';
import 'package:unscript/constant/size.dart';
import 'package:unscript/constant/textstyle.dart';

class CustomRadiobutton extends StatelessWidget {
  final String value;
  final String groupValue;
  final Function(String?) onCallback;
  const CustomRadiobutton(
      {super.key,
      required this.value,
      required this.groupValue,
      required this.onCallback});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: (getWidth(context) - 40) / 3,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Radio(
            value: value,
            groupValue: groupValue,
            onChanged: onCallback,
            activeColor: blue,
          ),
          Expanded(
            child: Text(
              value,
              style: paraStyle.copyWith(fontSize: 14.0),
            ),
          ),
        ],
      ),
    );
  }
}
