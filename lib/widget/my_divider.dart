import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class MyDivider extends StatelessWidget {
  const MyDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return   Column(
      children: [
        Row(//cleancode??
          children: [
        Expanded(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 13),
            height: 1,
            color: Color.fromARGB(255, 42, 44, 87),
          ),
        ),
        Text("or",
        style: TextStyle(color: Color.fromARGB(255, 42, 44, 87),
        fontFamily: 'Quattrocento',
        fontSize: 16),),
        Expanded(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 13),
            height: 1,
            color: Color.fromARGB(255, 42, 44, 87),
          ),
        ),
          ],
        ),
        Gap(10),
                 Row
                 (mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  
                  FloatingActionButton(backgroundColor: Colors.white, shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10),
    side: BorderSide(color: Color.fromARGB(255, 42, 44, 87), ),),
                    
                    onPressed: (){},child: SvgPicture.asset("images/google-icon logo.svg"),
                  ),SizedBox(width: 20,),
                      FloatingActionButton(backgroundColor: Colors.white, shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10),
    side: BorderSide(color: Color.fromARGB(255, 42, 44, 87), ),),
                    
                    onPressed: (){},child: SvgPicture.asset("images/Facebook logo.svg"),
                  )
                 ],)
      ],

    );
  }
}