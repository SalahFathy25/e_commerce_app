import 'package:flutter/material.dart';

class CustomTextButtonTheme {
  CustomTextButtonTheme._();

  static final lightTextButtonTheme = TextButtonThemeData(
    style: TextButton.styleFrom(foregroundColor: Colors.black),
  );

  static final darkTextButtonTheme = TextButtonThemeData(
    style: TextButton.styleFrom(foregroundColor: Colors.white),
  );
}
