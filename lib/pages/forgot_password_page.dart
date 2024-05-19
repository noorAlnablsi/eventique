import 'package:eventique/core/resources/color.dart';
import 'package:gap/gap.dart';

import '../core/widget/app_button.dart';
import '../core/widget/app_textfield.dart';
import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFDF0),
      body: Padding(
        padding: const EdgeInsets.all(8.0),//Q
        child: Container(
         
          color: Color.fromARGB(255, 255, 253, 240),
          child: Center(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
         Gap(55),
                Text("ForgotPasswordPage",
                style: TextStyle(fontSize: 34,fontWeight: FontWeight.w500,
                color: onPrimary,
                fontFamily: 'IrishGrover'),),
                Gap(25),
                Container(width: 293,
                height: 45,
                  child: Text("Fill in your email and we’ll send a code to reset your password ",
                  style: TextStyle(fontSize: 16,
                  fontFamily: 'Quattrocento',
                  color: onPrimary,
                  fontWeight: FontWeight.w500),),
                ),
                Gap(80),
                MyTextField(labelText: "Email", myIcon: Icons.email, hintText: "Enter your email"),
                 Gap(200),
                MyButton(text: "Send")
              ],
            ),
          )),
      )
    );
  }
}