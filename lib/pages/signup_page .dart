import 'package:eventique/core/resources/color.dart';
import 'package:eventique/core/widget/row_login_register.dart';
import 'package:gap/gap.dart';

import '../core/widget/app_button.dart';
import '../core/widget/app_textfield.dart';
import '../core/widget/my_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Column(
            children: [
              SvgPicture.asset('images/Group 3.svg'),
              Container(
                color: Colors.white,
              )
            ],
          ),
          Positioned(
            left: 20,
            top: 120,
            child: Column(
              children: [
                Card(
                  elevation: 20,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      // border: Border.all(
                      //   width: 1,
                      //   color: const Color.fromARGB(234, 158, 158, 158),
                      // ),
                      color: Colors.white,
                    ),
                    width: 320,
                    height: 618,
                    child: Center(
                      child: Column(
                        children: [
                          Gap(12),
                          Text(
                            "SignUp",
                            style: TextStyle(
                              fontFamily: 'IrishGrover',
                              fontSize: 36,
                              color: onPrimary,
                            ),
                          ),
                          Gap(26),
                          MyTextField(
                              labelText: "Username",
                              myIcon: Icons.person,
                              hintText: "Enter your name"),
                          Gap(15),
                          MyTextField(
                              labelText: "Email",
                              myIcon: Icons.email,
                              hintText: "Enter your email"),
                          // SizedBox(
                          //   height: 15,
                          // ),
                          Gap(15),
                          MyTextField(
                            labelText: "password",
                            myIcon: Icons.lock_open,
                            hintText: "Enter your password",
                            obscureText: true,
                            traillingIcon: Icon(Icons.visibility_off),
                          ),
                          Gap(15),
                          MyTextField(
                              labelText: "Confirm password",
                              myIcon: Icons.lock_open,
                              hintText: "Enter your password"),
                        Gap(28),
                          InkWell(
                              onTap: () {}, child: MyButton(text: "SignUp")),
                         Gap(18),
                          MyDivider(),
                        ],
                      ),
                    ),
                  ),
                ),
                SignIn(
                    text: "Already have an account?", textButton: " Login now")
              ],
            ),
          ),
        ],
      ),
    );
  }
}
