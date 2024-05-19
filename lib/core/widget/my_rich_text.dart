import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class MyRichText extends StatelessWidget {
  const MyRichText({super.key
  ,required this.firsttext,
  required this.secondtext});
final String firsttext;
final String secondtext;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
       Gap(70),
        Row(
                         children: [
                           Text(firsttext,
                           style: TextStyle(color: Color.fromARGB(254, 42, 44, 87)
                           ,fontFamily: 'Quattrocento',fontSize: 16,
                           fontWeight: FontWeight.w400),
                           ),
                           Text(secondtext,
                           style: TextStyle(fontWeight: FontWeight.w900,
                            color: Color.fromARGB(255, 87, 14, 87),fontFamily: 'Quattrocento',fontSize: 16),)
                         ],
                       ),
      ],
    );
  }
}