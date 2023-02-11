import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:unscript/constant/color.dart';
import 'package:unscript/constant/size.dart';
import 'package:unscript/constant/textstyle.dart';

class CustomTextField extends StatelessWidget {
  final bool capitalization;
  final TextInputType? keyboardType;
  final TextEditingController textController;
  final int maxCharacters;
  final bool obscureText;
  final int minLines;
  final int maxLines;
  final String hint;
  final String? Function(String?) validateFunction;
  final Function(String?) onSaveFunction;

  const CustomTextField({
    super.key,
    required this.capitalization,
    this.keyboardType,
    required this.textController,
    this.maxCharacters = -1,
    this.obscureText = false,
    this.minLines = 1,
    this.maxLines = 1,
    required this.hint,
    required this.validateFunction,
    required this.onSaveFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10.0),
      width: getWidth(context) - horizontalPadding,
      child: TextFormField(
        textCapitalization: capitalization
            ? TextCapitalization.characters
            : TextCapitalization.none,
        keyboardType: keyboardType,
        controller: textController,
        inputFormatters: [
          LengthLimitingTextInputFormatter(maxCharacters),
        ],
        obscureText: obscureText,
        minLines: minLines,
        maxLines: maxLines,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: hintText,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: blue,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        validator: validateFunction,
        onSaved: onSaveFunction,
      ),
    );
  }
}
