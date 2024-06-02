import 'package:eventique/pages/navigation_bar_page.dart';
import 'package:eventique/pages/one_package_details.dart';
import 'package:eventique/pages/vendors_page.dart';

import 'pages/forgot_password_page.dart';
import 'pages/home_page.dart';
import 'pages/login_page.dart';
import 'pages/new_password%20_page.dart';
import 'pages/signup_page%20.dart';
import 'pages/splash_screen.dart';
import 'pages/splash_page.dart';
import 'pages/verification_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, home: OnePackageDetails());
  }
}
