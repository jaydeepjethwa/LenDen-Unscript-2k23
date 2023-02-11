import 'package:flutter/material.dart';
import 'package:unscript/constant/textstyle.dart';
import 'package:unscript/model/checkbox_model.dart';

class CustommCheckbox extends StatelessWidget {
  final CheckboxModel item;
  // final int index;
  final Function(bool?) setValue;
  const CustommCheckbox(
      {super.key, required this.item, required this.setValue});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Checkbox(
          value: item.value,
          onChanged: (value) {
            if (value != null) {
              setValue(value);
            }
          },
        ),
        Text(
          item.title,
          style: paraStyle,
        ),
      ],
    );
  }
}
