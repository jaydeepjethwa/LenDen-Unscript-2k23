import 'package:flutter/material.dart';
import 'package:unscript/constant/color.dart';

ThemeData theme = ThemeData(
  colorScheme: ThemeData().colorScheme.copyWith(
        primary: blue,
        secondary: black,
      ),
  inputDecorationTheme: InputDecorationTheme(
    border: const OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(10.0),
      ),
    ),
    contentPadding: const EdgeInsets.symmetric(
      vertical: 5.0,
      horizontal: 10.0,
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(
        color: grey,
        width: 2.0,
      ),
    ),
  ),
);