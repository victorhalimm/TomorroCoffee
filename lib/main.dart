import 'package:flutter/material.dart';
import 'package:flutter_qualif_vc/pages/login_page.dart';
import 'package:flutter_qualif_vc/pages/main_page.dart';
import 'package:flutter_qualif_vc/themes/dark_theme.dart';
import 'package:flutter_qualif_vc/themes/light_theme.dart';

final themeNotifier = ValueNotifier<ThemeData>(darkTheme); 

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeData>(
      valueListenable: themeNotifier,
      builder: (context, theme, _) {
        return MaterialApp(
          title: "MyApp",
          theme: theme,
          darkTheme: darkTheme,
          home: const LoginPage(),
        );
      },
    );
  }
}
