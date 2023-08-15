import 'package:flutter/material.dart';
import 'package:flutter_qualif_vc/pages/home_page.dart';
import 'package:flutter_qualif_vc/pages/login_page.dart';
import 'package:flutter_qualif_vc/pages/main_page.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "MyApp",
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        fontFamily: 'Open Sans',
      ),
      home: MainPage(username: "Coki"),
    );
  }
}