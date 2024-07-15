import 'package:eventique/core/resources/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class CreateANewEvent extends StatelessWidget {
  const CreateANewEvent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body:  Center(
      child: Container(
        width: 320,
        height: 549,
        color: white,
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(width: 222,
            height: 137,
              child: SvgPicture.asset('images/new.svg')),
            Gap(20),
            Text("Create  a new event",
            style: TextStyle(fontSize: 28,fontFamily: 'IrishGrover',
            color: onPrimary,
            ),),
            Gap(10),
            Text("Set up an event and start planning it",
            style: TextStyle(fontSize: 16,color: onPrimary),)
        ],),
      ),
    ),)   
   ;
  }
}