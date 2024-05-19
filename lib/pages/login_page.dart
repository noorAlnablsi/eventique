import 'package:eventique/core/resources/color.dart';
import 'package:eventique/core/widget/row_login_register.dart';
import 'package:eventique/core/widget/text_Style.dart';
import 'package:gap/gap.dart';
import '../core/widget/app_button.dart';
import '../core/widget/app_textfield.dart';
import '../core/widget/my_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Column(
            children: [
              SvgPicture.asset('images/Group 3.svg'),
            ],
          ),
          Positioned(
            left: 20,
            top: 150,
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
                    height: 496,
                    child: Center(
                      child: Column(
                        children: [
                          Gap(12),
                          Text(
                            "Login",
                            // style: TextStyle(
                            //   fontFamily: 'IrishGrover',
                            //   fontSize: 36,
                            //   color: onPrimary,
                            // ),
                            style: StylesManager.whiteRegular20,
                          ),
                          Gap(30),
                          MyTextField(
                              labelText: "Email",
                              myIcon: Icons.email,
                              hintText: "Enter your email"),
                          Gap(25),
                          MyTextField(
                            labelText: "password",
                            myIcon: Icons.lock_open,
                            hintText: "Enter your password",
                            obscureText: true,
                            traillingIcon: Icon(Icons.visibility_off),
                          ),
                         Gap(10),
                          TextButton(
                              onPressed: () {},
                              child: Text(
                                "Forget password?",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 122, 122, 144),
                                    fontFamily: 'AlegreyaSC',
                                    fontSize: 18),
                              )),
                          Gap(18),
                          MyButton(text: "Login"),
                         Gap(20),
                          MyDivider(),
                        ],
                      ),
                    ),
                  ),
                ),
                SignIn(
                    text: " Don’t have an account?",
                    textButton: " Register now")
              ],
            ),
          ),
        ],
      ),
    );
  }
}
