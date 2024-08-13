//noor
import 'package:eventique/providers/home_provider.dart';
import 'package:provider/provider.dart';

import '/widgets/item_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class MyStaggeredGridView extends StatelessWidget {
  final int packageId;
  const MyStaggeredGridView({super.key, required this.packageId});
  @override
  Widget build(BuildContext context) {
    final packageData =
        Provider.of<HomeProvider>(context).findPackageById(packageId);
    final packageServices = packageData.packageServices;
    return MasonryGridView.count(
      padding: EdgeInsets.all(10.0),
      crossAxisCount: 2,
      mainAxisSpacing: 18.0,
      crossAxisSpacing: 12.0,
      itemCount: packageServices!.length,
      itemBuilder: (context, i) => ItemCard(
        color: Color.fromARGB(255, 212, 211, 212),
        height: 286.14,
        width: 178.08,
        firsttext: packageServices[i].name,
        secondtext: packageServices[i].vendorName,
        image: packageServices[i].imgsUrl[0],
        serviceId: packageServices[i].serviceId,
      ),
      // ItemCard(
      //   color: Color.fromARGB(248, 230, 199, 211),
      //   height: 207.35,
      //   width: 130.82,
      //   firsttext: "Royal Hall",
      //   secondtext: "Al-Jalaa",
      //   image: "images/image1.png",
      // ),
      // ItemCard(
      //   color: Color.fromARGB(255, 204, 176, 223),
      //   height: 233.06,
      //   width: 172.17,
      //   firsttext: "Dream Cake",
      //   secondtext: "Bee",
      //   image: "images/image2.png",
      // ),
      // ItemCard(
      //   color: Color.fromARGB(255, 217, 247, 173),
      //   height: 207.35,
      //   width: 130.82,
      //   firsttext: "Buffet",
      //   secondtext: "Rama Catering",
      //   image: "images/image3.png",
      // ),
      // ItemCard(
      //   color: Color.fromARGB(255, 220, 245, 247),
      //   height: 233.06,
      //   width: 172.17,
      //   firsttext: "Red Roses",
      //   secondtext: "Sufian",
      //   image: "images/image.png",
      // ),
      // ItemCard(
      //   color: Color.fromARGB(255, 244, 219, 208),
      //   height: 207.35,
      //   width: 130.82,
      //   firsttext: "Royal Hall",
      //   secondtext: "Al-Jalaa",
      //   image: "images/image1.png",
      // ),
      // ItemCard(
      //   color: Color.fromARGB(255, 244, 238, 201),
      //   height: 207.35,
      //   width: 130.82,
      //   firsttext: "Dream Cake",
      //   secondtext: "Bee",
      //   image: "images/image2.png",
      // ),
      // ItemCard(
      //   color: Color.fromARGB(255, 252, 215, 236),
      //   height: 207.35,
      //   width: 130.82,
      //   firsttext: "Buffet",
      //   secondtext: "Rama Catering",
      //   image: "images/image3.png",
      // ),
    );
  }
}
