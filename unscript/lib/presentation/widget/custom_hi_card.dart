import 'package:flutter/material.dart';
import 'package:unscript/constant/color.dart';
import 'package:unscript/constant/size.dart';
import 'package:unscript/constant/textstyle.dart';

class CustomhiCard extends StatelessWidget {
  final String name;
  const CustomhiCard({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            const Text(
              "👋",
              style: TextStyle(
                fontSize: 32.0,
              ),
            ),
            horizontalSpacing(10.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome Back $name, ",
                    style: header2.copyWith(
                        fontWeight: FontWeight.bold, color: blue),
                  ),
                  Text(
                    "Start Trading !!",
                    style: header2.copyWith(
                        fontWeight: FontWeight.bold, color: blue),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
