import 'package:eventique/core/resources/color.dart';
import 'package:gap/gap.dart';

import '../core/widget/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class VerificationPage extends StatelessWidget {
  const VerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromARGB(255, 255, 253, 240),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Gap(100),
            Text("Verification",
            style: TextStyle(
              fontFamily: 'IrishGrover',
              fontSize: 36,
             color: onPrimary,
            ),),
             Gap(15),
             Padding(
        padding: EdgeInsets.all(40.0),
        child: 
            RichText(
  text: TextSpan(
 
    // style: TextStyle(backgroundColor: Colors.amber),
    children:  <TextSpan>[
      TextSpan(text: ' we sent you a verification code to your email ',style: TextStyle(fontFamily: 'Quattrocento',fontWeight: FontWeight.w600,
      color: onPrimary)),
      TextSpan(text: 'taghreedswidah9@gmail.com', style: TextStyle(fontSize: 16,fontWeight: FontWeight.w900,
      color:primary)),
      
    ],
  ),

                   )      )  ,      
           
         Gap(33),
           OtpTextField(
            hasCustomInputDecoration: true,
  numberOfFields: 6,

  
  decoration: InputDecoration(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(12.0)), )
  ),
  // onCodeChanged: (String code) {
  
  // },
  onSubmit: (String verificationCode) {
    
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Verification Code"),
          content: Text('Code entered is $verificationCode'),
        );
      },
    );
  },

),Gap(55),


Center( 
        child: 
            RichText(
  text: TextSpan(
 
    // style: TextStyle(backgroundColor: Colors.amber),
    children:  <TextSpan>[
      TextSpan(text: ' send in  ',style: TextStyle(fontFamily: 'Quattrocento',fontWeight: FontWeight.w400,
      color: onPrimary)),
      TextSpan(text: '60s', style: TextStyle(fontSize: 16,fontWeight: FontWeight.w900,
      color:onPrimary)),
      
    ],
  ),     )      )  ,
  Gap(66),
  MyButton(text: "Verify")
          ],
        ),
      ),
    );
  }
}
