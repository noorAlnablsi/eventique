import 'package:eventique/core/resources/color.dart';
import 'package:eventique/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
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
      backgroundColor:white,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 426,
            height: 328,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage("images/Group 5.png")),
              color: white,
            ),
            child: Center(
              child: Text(
                "EvenTique",
                style: TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'IrishGrover',
                  foreground: Paint()
                    ..shader = LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      stops: [0.0, 0.44, 1.0],
                      colors: [
                        Color(0xFF2A2C57),
                        Color(0xFF570E57),
                        Color(0xFFE791A5),
                      ],
                    ).createShader(Rect.fromLTRB(250, 69, 55, 70)),
                ),
              ),
            ),
          ),
        SvgPicture.asset("images/Group (1).svg")
        ],
      )),
    );
  }
}
