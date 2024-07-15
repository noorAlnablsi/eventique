

import 'package:eventique/core/resources/color.dart';
import 'package:eventique/core/widget/item_card.dart';
import 'package:eventique/pages/tt.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gap/gap.dart';

class OnePackageDetailsPage extends StatelessWidget {
  const OnePackageDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: white,
      appBar: AppBar(
        backgroundColor: white,
        title: Text("Package Name",
        style: TextStyle(
          color: primary,
          fontSize: 28,
          fontFamily: 'IrishGrover'
        ),),
      
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
         Divider(
            color: Colors.black,
            height: 2.0,
          ),
          Text("Was \$100, now only \$75 with this exclusive package deal !"),
          Gap(30),
MasonryGridView.builder(
        itemCount: 6,
        gridDelegate:  const SliverSimpleGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2), 
      itemBuilder: (context,index)=>Padding(
        padding: const EdgeInsets.all(2.0),
        child: Container(
          //color: const Color.fromARGB(255, 46, 91, 127),
          height: 200,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: ItemCard( firsttext: "Red Roses", secondtext:"Sufian", image: "images/image.png")),
        ),
      )),

          // Expanded(
          //   child: SingleChildScrollView(
          //      scrollDirection: Axis.vertical,
          //     child: Wrap(
          //       spacing: 18, runSpacing: 15,
          //       children: [
          //         ItemCard(height:  280.14, width: 178.08, firsttext: "Red Roses", secondtext:"Sufian", image: "images/image.png"),
          //        ItemCard(height: 240.35, width: 130.82, firsttext: "Royal Hall", secondtext: "Al-Jalaa", image:"images/image1.png"),
          //        ItemCard(height: 255.06, width: 172.17, firsttext: "Dream Cake", secondtext:"Bee", image: "images/image2.png"),
          //        ItemCard(height: 235.35, width: 130.82, firsttext: "Rama Catering", secondtext:"Buffet", image:"images/image3.png"),
          //        ItemCard(height:  280.14, width: 178.08, firsttext: "Red Roses", secondtext:"Sufian", image: "images/image.png"),
          //        ItemCard(height: 240.35, width: 130.82, firsttext: "Royal Hall", secondtext: "Al-Jalaa", image:"images/image1.png"),
          //        ItemCard(height: 250.06, width: 172.17, firsttext: "Dream Cake", secondtext:"Bee", image: "images/image2.png"),
          //        ItemCard(height: 235.35, width: 130.82, firsttext: "Rama Catering", secondtext:"Buffet", image:"images/image3.png"),
          //       ],
          //     )),
          // )
      ],),
    );
  }
}