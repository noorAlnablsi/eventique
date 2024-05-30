import 'package:eventique/pages/navigation_bar_page.dart';
import 'package:eventique/pages/vendors_screen.dart';
import 'package:eventique/providers/reviews.dart';
import 'package:eventique/providers/services_in_shoppinglist.dart';
import 'package:eventique/providers/services_list.dart';
import 'package:provider/provider.dart';

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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => AllServices(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Reviews(),
        ),
         ChangeNotifierProvider(
          create: (ctx) => ShoppingListsServices(),
        ),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false, home: NavigationBarPage(),
           theme: ThemeData(
            primaryColor: Color(0xff662465),
            scaffoldBackgroundColor: const Color(0xFFFFFDF0),
            appBarTheme: const AppBarTheme(
              color: Color(0xFFFFFDF0),
            ),
            textTheme: const TextTheme(
              bodyLarge: TextStyle(
                  fontSize: 22.0,
                  fontFamily: 'Bahnschrift',
                  color: Color(0xff662465)),
              bodyMedium: TextStyle(
                  fontSize: 14.0,
                  fontFamily: 'Bahnschrift',
                  fontWeight: FontWeight.bold,
                  color: Color(0xff662465)),
              bodySmall: TextStyle(
                  fontSize: 14.0,
                  fontFamily: 'Bahnschrift',
                  color: Color(0xff662465)),
            ),
          ),),
    );
  }
}
