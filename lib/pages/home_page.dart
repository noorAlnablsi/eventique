import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:eventique/core/resources/color.dart';
import 'package:eventique/core/widget/events_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 253, 240),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.menu,
                      color: Color.fromARGB(255, 221, 140, 162),
                    )),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.circle_notifications,
                      color:primary,
                    )),
              ],
            ),

            Gap(18),

            // Card(
            //   elevation: 20,
            //   shape: RoundedRectangleBorder(
            //     borderRadius: BorderRadius.all(Radius.circular(20)),
            //   ),
            //   child: Container(
            //     decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(8),
            //         gradient: LinearGradient(
            //             begin: Alignment.centerLeft,
            //             end: Alignment.centerRight,
            //             stops: [
            //               0,
            //               0.99
            //             ],
            //             colors: [
            //               primary,
            //               Color.fromARGB(255, 255, 224, 248)
            //             ])),
            //     width: 313,
            //     height: 74,
            //     child: TextButton(
            //       onPressed: () {},
            //       child: Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //         children: [
            //           Text(
            //             "Create Your Event",
            //             style: TextStyle(
            //                 color: Color.fromARGB(255, 255, 253, 240)),
            //           ),
            //           IconButton(
            //               onPressed: () {}, icon: Icon(Icons.arrow_forward))
            //         ],
            //       ),
            //     ),
            //   ),
            // ),

Container(
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(20), 
    gradient: LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      stops: [0, 0.99],
      colors: [
        primary,
        Color.fromARGB(255, 255, 224, 248)
      ],
    ),
    boxShadow: [
      BoxShadow(
        color: Colors.blueGrey.withOpacity(0.5), 
        spreadRadius: 5,
        blurRadius: 15,
        offset: Offset(0, 10),// 
      ),
    ],
  ),
  width: 313,
  height: 74,
  child: TextButton(
    onPressed: () {},
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Create Your Event",
          style: TextStyle(
            color: Color.fromARGB(255, 255, 253, 240),fontSize: 20,fontFamily: 'IrishGrover'
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_forward),
        ),
      ],
    ),
  ),
),


            Gap(25),
            Text("Packages",
                style: TextStyle(
                  fontSize: 28,
                  fontFamily: 'IrishGrover',
                  color:primary,
                )),
            Container(
              height: 45,
              width: 295,
              child: Text(
                  "Everything you need in one place at discounted prices.",
                  style: TextStyle( fontFamily: 'IrishGrover',
                  fontSize: 16,color:primary),),
            ),
            // SizedBox(height: 10,),

            
            Container(
              height: 172,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 20,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: (){},
                    child: Container(
                      margin: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("images/Rectangle (3).png"),
                          
                        ),
                      ),child: Center(child: Column(
                        children: [Gap(100),
                          Text("birthday",
                          style: TextStyle(color: onPrimary,fontFamily: 'Kanit',
                         
                          fontSize: 20),),
                        ],
                      )),
                      width: 202,
                      height: 163,
                    ),
                  );
                },
              ),
            ),Gap(20),

            Text(
              "You & Us",
              style: TextStyle(fontSize: 28,color:primary, fontFamily: 'IrishGrover',),
            ),
            Gap(5),
            Text(
              "Your Joy Our Craft !",
              style: TextStyle(fontSize: 18,color:primary, fontFamily: 'IrishGrover',),
            ),
            Gap(20),
            Expanded(child: ListView.builder(itemCount: 18,
              itemBuilder: (context,index){
              return
              InkWell(
                onTap: (){},
                child: Card(
                  
                 child: Container(height: 129,
                 width: 302,
                  decoration: BoxDecoration(image: DecorationImage(image: AssetImage("images/Rectangle.png")),
                  ),child: Row(
                    children: [
                      Container(height: 135,
                      width: 110,
                      color: Color.fromARGB(209, 255, 255, 255),
                      child: Column(mainAxisAlignment: MainAxisAlignment.center,
                        children: [Text("It was ..",
                        style:TextStyle(fontFamily: 'Roboto',fontSize: 16,color: onPrimary) ,),
                      Gap(15),
                      Text("Magical",
                      style: TextStyle(fontFamily: 'KaushanScript',fontSize: 20,color: onPrimary),)],),),
                    ],
                  ),),
                ),
              );
            }))
          ],
        ),
      ),
    );
  }
}
