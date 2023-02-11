import 'package:flutter/material.dart';
import 'package:unscript/constant/color.dart';
import 'package:unscript/constant/textstyle.dart';

class CustomDropdown extends StatefulWidget {
  final Function(String) setValue;
  final List<String> itemList;
  const CustomDropdown({
    super.key,
    required this.setValue,
    required this.itemList,
  });

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  late String dropdownvalue;

  @override
  void initState() {
    super.initState();
    dropdownvalue = widget.itemList[0];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5.0),
      // width: (getWidth(context) - 60) / 2,
      decoration: BoxDecoration(
        border: Border.all(
          color: grey,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: DropdownButton(
          value: dropdownvalue,
          underline: Container(),
          icon: const Icon(Icons.keyboard_arrow_down),
          items: widget.itemList.map((String items) {
            return DropdownMenuItem(
              value: items,
              child: Text(
                items,
                style: (dropdownvalue == widget.itemList[0])
                    ? hintText
                    : normalText,
              ),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              dropdownvalue = newValue!;
              widget.setValue(newValue);
            });
          },
        ),
      ),
    );
  }
}
