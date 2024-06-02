import 'package:eventique/core/resources/color.dart';
import 'package:gap/gap.dart';

import '../core/widget/app_button.dart';
import '../core/widget/app_textfield.dart';
import 'package:flutter/material.dart';

class  NewPasswordPage extends StatelessWidget {
  const NewPasswordPage ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Color.fromARGB(255, 255, 253, 240),
      body: Container(
         
          color: Color.fromARGB(255, 255, 253, 240),
          child: Center(
            child: Column(
              children: [
                Gap(60),
                Text("Create New password",
                style: TextStyle(
                  fontSize: 30,
                  fontFamily: 'IrishGrover',
                  fontWeight: FontWeight.w500,
                  color: onPrimary
                ),),
                Gap(35),
                Text("Please enter your new password",
                style: TextStyle(
                  color: onPrimary,
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Quattrocento'
                ),),
              Gap(70),
                MyTextField(labelText: "New password", myIcon: Icons.lock_open, hintText:"EnterNew password"),
               Gap(35),
                MyTextField(
                              labelText: "Confirm password",
                              myIcon: Icons.lock_open,
                              hintText: "Enter your password"),
                              Gap(100),
                              MyButton(text: "Next")
                          
              ],

            ),
            ),
            ),
    );
  }
}