import 'package:flutter/material.dart';
import 'package:saas_app/constants/colors.dart';
import 'package:saas_app/main_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: kMainColor),
      home: MainPage(),
    );
  }
}
