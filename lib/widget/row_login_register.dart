// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SignIn extends StatelessWidget {
  SignIn({
    Key? key,
    required this.text,
    required this.textButton,
  }) : super(key: key);
final String text;
final String textButton;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         Gap(70),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(text,
             style: TextStyle(color: Color.fromARGB(254, 42, 44, 87)
                           ,fontFamily: 'Quattrocento',fontSize: 16,
                           fontWeight: FontWeight.w400),),
            TextButton(onPressed: (){}, child: Text(textButton,
             style: TextStyle(fontWeight: FontWeight.w900,
                            color: Color.fromARGB(255, 87, 14, 87),fontFamily: 'Quattrocento',fontSize: 16),))
        
          ],
        ),
      ],
    );
  }
}
