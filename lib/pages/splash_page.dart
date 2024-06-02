import 'package:flutter_svg/flutter_svg.dart';

import 'login_page.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
    void initState() {
    
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return const LoginPage();
          },
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
         image: DecorationImage(image: AssetImage("images/Component 07.png")),
      
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0, 0.32, 0.57, 0.96],
            colors: [
              Color(0xFF2A2C57),
              Color(0xFF441B57),
              Color(0xFF570E57),
              Color(0xFFB1C5D5)
            ],
          ),
        ),
        child: Center(child: SvgPicture.asset("images/logo.svg")),
      ),
    );
  }
}
