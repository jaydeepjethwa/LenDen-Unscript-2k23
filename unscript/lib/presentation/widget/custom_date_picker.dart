import 'package:flutter/material.dart';
import 'package:unscript/constant/color.dart';
import 'package:unscript/constant/textstyle.dart';

class CustomDateField extends StatefulWidget {
  final Function(DateTime) setDate;
  const CustomDateField({super.key, required this.setDate});

  @override
  State<CustomDateField> createState() => _CustomDateFieldState();
}

class _CustomDateFieldState extends State<CustomDateField> {
  DateTime date = DateTime.now();

  String? finalDate;

  void _showDatePicker(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: date,
      firstDate: DateTime(1900),
      lastDate: date,
    ).then((value) {
      if (value != null) {
        setState(() {
          finalDate = formatDate(value);
          widget.setDate(value);
        });
      }
    });
  }

  String formatDate(DateTime d) {
    String ans = "";
    (d.day <= 9) ? ans = "${ans}0${d.day}" : ans += d.day.toString();
    ans += "-";
    (d.month <= 9) ? ans = "${ans}0${d.month}" : ans += d.month.toString();
    ans += "-";
    ans += d.year.toString();
    return ans;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _showDatePicker(context);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5.0),
        decoration: BoxDecoration(
          border: Border.all(
            color: grey,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          child: Row(
            children: [
              Text(
                finalDate == null ? formatDate(date) : finalDate!,
                style: normalText,
              ),
              const SizedBox(width: 5.0),
              Icon(
                Icons.calendar_month_outlined,
                color: blue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
