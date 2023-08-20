import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primarySwatch: Colors.deepOrange,
  fontFamily: 'Open Sans',
  colorScheme: ColorScheme.light(
    background: Colors.grey[100]!,
    primary: Colors.white,
    secondary: Colors.grey[200]!,
    tertiary: Colors.deepOrange,
  )
);