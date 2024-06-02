// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class MyRichText extends StatelessWidget {
  const MyRichText({
    Key? key,
   
    required this.firsttext,
    required this.secondtext,
    required this.firtColor,
    required this.secondColor,
  }) : super(key: key);
final String firsttext;
final String secondtext;
final Color firtColor;
final Color secondColor;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
       Gap(70),
        Row(
                         children: [
                           Text(firsttext,
                           style: TextStyle(color: firtColor
                           ,fontFamily: 'Quattrocento',fontSize: 16,
                           fontWeight: FontWeight.w400),
                           ),
                           Text(secondtext,
                           style: TextStyle(fontWeight: FontWeight.w900,
                            color: secondColor,fontFamily: 'Quattrocento',fontSize: 16),)
                         ],
                       ),
      ],
    );
  }
}
