import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primarySwatch: Colors.deepOrange,
  fontFamily: 'Open Sans',
  colorScheme: ColorScheme.dark(
    background: Colors.black87,
    primary: Colors.grey[900]!,
    secondary: Colors.grey[800]!,
    tertiary: Colors.deepOrange,
  )
);